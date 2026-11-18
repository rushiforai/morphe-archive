/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Looper;

import java.io.File;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.Setting;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Duress passcode (#79): a second passcode, typed where Telegram asks for its own, logs out or
 * deletes the accounts on the phone, every one or only the open one as {@link #ACTIONS} picks, and
 * clears what HushTelegram kept.
 *
 * <p>The patch wraps Telegram's {@code SharedConfig.checkPasscode}: {@link #enter} gets what was
 * typed before Telegram looks at it, and {@link #afterCheck} gets Telegram's answer before each
 * return. Telegram's yes always stands, so its real passcode wins even when it's the same as the
 * duress one. Only a salted PBKDF2-HMAC-SHA256 hash of the duress code is kept, in a file of its
 * own that no settings file or report reads.
 *
 * <p>The log-out is Telegram's own, the one its Log out row runs, the account in use last, and the
 * lock screen opens. Telegram clears its own passcode when its last account logs out, which this
 * leaves as it is, so the app looks the way any logged-out Telegram does. Telegram's answer to a
 * log-out saves a log-in for the next sign-in on this phone; those are cleared now, again whenever
 * an answer lands later in this process, and once more at the next start.
 *
 * <p>A deletion can't be taken back, so the code looks wrong the first time and only arms it; the
 * next time deletes, through {@link DeleteAccount}, and still looks wrong. Telegram's real
 * passcode disarms it. An account Telegram doesn't delete on the spot (one with a cloud password
 * waits a week) or that gets no answer is logged out instead, and with no account left Telegram
 * starts over on its sign-in screen.
 */
public final class DuressWipe {
    private DuressWipe() {}

    /** The duress code's hash, its salt and rounds, and the next-start flag. Never in a settings file. */
    static final String PREFS = "hushtelegram_duress";
    static final String SALT = "salt";
    static final String HASH = "hash";
    static final String ROUNDS = "rounds";
    /** Set by a wipe and cleared by the next start, which clears Telegram's saved log-ins once more. */
    static final String TOKENS_PENDING = "tokens_pending";
    /** Set when the code was typed once and deletes; the next time deletes. Telegram's passcode clears it. */
    static final String ARMED = "armed";

    /** What the code does, saved in {@link Settings#DURESS_ACTION}. The first is the default. */
    public static final String LOG_OUT_ALL = "";
    public static final String LOG_OUT_OPEN = "log_out_open";
    public static final String DELETE_ALL = "delete_all";
    public static final String DELETE_OPEN = "delete_open";
    public static final List<String> ACTIONS =
            Collections.unmodifiableList(Arrays.asList(LOG_OUT_ALL, LOG_OUT_OPEN, DELETE_ALL, DELETE_OPEN));

    /** How long a deletion waits for Telegram's answers before it logs out what's left. */
    static final long DELETE_WAIT_MS = 15_000;
    /** How long the start-over after a deletion waits, so the log-outs it sent can leave first. */
    static final long RESTART_DELAY_MS = 2_000;

    /** Telegram's saved log-ins: the ones its log-out answers bring, and the ones a sign-in keeps. */
    static final String TOKENS = "saved_tokens";
    static final String LOGIN_TOKENS = "saved_tokens_login";

    /** PBKDF2 rounds for a new hash. Saved with it, so a later change can still check an older one. */
    static final int NEW_ROUNDS = 20_000;
    private static final int SALT_BYTES = 16;
    private static final int HASH_BITS = 256;

    /** The length of every PIN Telegram's lock screen takes. */
    public static final int PIN_LENGTH = 4;

    /** Telegram's folders: images, audio, video, documents and cache. */
    private static final int FIRST_FOLDER = 0;
    private static final int LAST_FOLDER = 4;

    /** The folder a message's Forward as copy works in, in either cache. */
    private static final String FORWARD_COPIES = "hushtelegram_forward_copy";
    /** Tracked people's records, in no-backup storage. */
    private static final String TRACKED_PEOPLE = "hushtelegram_special_contacts";

    /** What this needs from Telegram. A test answers it itself. */
    interface Telegram {
        /** The account slots signed in now. */
        List<Integer> signedIn();

        /** The account the app is showing, or -1. */
        int selected();

        /** Telegram's own log-out of [account], the server's included. */
        void logOut(int account) throws Exception;

        /** One of Telegram's folders by its number, or null. */
        File directory(int type);

        /** Sends Telegram's deletion of [account]: null once it's sent, else why it wasn't. */
        String delete(int account, DeleteAccount.Answer answer);

        /** Starts Telegram over, on the screen it opens with. */
        void restart();
    }

    static Telegram telegram = new Reflected();

    /** Where files are deleted, off the main thread. Tests swap in a direct one. */
    static Executor work = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "HushTelegram DuressWipe");
        thread.setDaemon(true);
        return thread;
    });

    /** What was typed into the check running on this thread, from [enter] to [afterCheck]. */
    private static final ThreadLocal<String> TYPED = new ThreadLocal<>();
    /** Set while this checks a new duress code against Telegram's passcode, so that check wipes nothing. */
    private static final ThreadLocal<Boolean> CHOOSING = new ThreadLocal<>();

    /** Clears every saved log-in Telegram writes for the rest of this process once a wipe has run. */
    private static final SharedPreferences.OnSharedPreferenceChangeListener TOKEN_WATCH = (prefs, key) -> {
        try {
            if (!prefs.getAll().isEmpty()) prefs.edit().clear().apply();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "duress saved log-ins", failure);
        }
    };
    /** The files [TOKEN_WATCH] watches. SharedPreferences holds a listener weakly, so this holds them. */
    private static final List<SharedPreferences> WATCHED = new ArrayList<>();

    /** The deletion under way, or null. Main thread only. */
    private static Deletion deletion;

    // ---- The hook ------------------------------------------------------------------------------

    /** Injected at the start of SharedConfig.checkPasscode, with what was typed. */
    public static void enter(String typed) {
        TYPED.set(typed);
    }

    /**
     * Injected before each return of SharedConfig.checkPasscode, with Telegram's answer as an int
     * (non-zero is yes), so the register Telegram returns passes whatever the verifier typed it as.
     *
     * @return Telegram's answer, or true when the duress code logged out what it logs out
     */
    public static boolean afterCheck(int telegramAnswer) {
        boolean telegramSaid = telegramAnswer != 0;
        String typed = TYPED.get();
        TYPED.remove();
        if (typed == null || typed.isEmpty() || Boolean.TRUE.equals(CHOOSING.get())) return telegramSaid;
        try {
            if (telegramSaid) {
                // Telegram's own passcode calls off a deletion the duress code armed.
                if (Utils.settingsReady()) disarm();
                return true;
            }
            if (!Utils.settingsReady() || !Settings.DURESS_WIPE.get()) return false;
            HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
            if (!matches(typed)) return false;
            String action = action();
            if (Looper.myLooper() != Looper.getMainLooper()) {
                Utils.runOnMainThread(() -> step("duress passcode", () -> used(action)));
                return !deletes(action);
            }
            return used(action);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "duress passcode", failure);
            return telegramSaid;
        }
    }

    /** The saved choice of what the code does, the default for anything else. */
    public static String action() {
        String saved = Settings.DURESS_ACTION.get();
        return ACTIONS.contains(saved) ? saved : LOG_OUT_ALL;
    }

    /** Whether [action] deletes accounts rather than logging them out. */
    public static boolean deletes(String action) {
        return DELETE_ALL.equals(action) || DELETE_OPEN.equals(action);
    }

    private static boolean openOnly(String action) {
        return LOG_OUT_OPEN.equals(action) || DELETE_OPEN.equals(action);
    }

    /**
     * The duress code was typed with the switch on. Main thread.
     *
     * @return what the lock screen hears: yes once the log-out ran, no while a deletion arms or runs
     */
    static boolean used(String action) {
        if (!deletes(action)) return wipe(openOnly(action));
        // A deletion is under way: the code keeps looking wrong and starts nothing more.
        if (deletion != null) return false;
        SharedPreferences prefs = Utils.getContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (!prefs.getBoolean(ARMED, false)) {
            if (!prefs.edit().putBoolean(ARMED, true).commit()) throw new IllegalStateException("Couldn't arm the deletion");
            HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "duress deletion armed");
            return false;
        }
        disarm();
        delete(openOnly(action));
        return false;
    }

    private static void disarm() {
        SharedPreferences prefs = Utils.getContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (prefs.contains(ARMED)) prefs.edit().remove(ARMED).commit();
    }

    /** Whether the code was typed once and the next time deletes. */
    static boolean armed() {
        return Utils.getContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE).getBoolean(ARMED, false);
    }

    // ---- The wipe ------------------------------------------------------------------------------

    /**
     * Logs out every account, or only the open one, and clears what was kept. Main thread.
     *
     * @return whether each of those accounts logged out; the lock stays shut when one didn't
     */
    static boolean wipe(boolean openOnly) {
        Context context = Utils.getContext();
        HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "duress passcode used");
        List<Integer> accounts = accounts(openOnly);
        if (accounts == null) return false;
        prepare(context, accounts, openOnly);
        boolean allOut = logOut(accounts);
        clean(context, openOnly, null);
        return allOut;
    }

    /** Deletes every account, or only the open one, then logs out whatever wasn't deleted. Main thread. */
    private static void delete(boolean openOnly) {
        Context context = Utils.getContext();
        HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "duress deletion sent");
        List<Integer> accounts = accounts(openOnly);
        if (accounts == null) return;
        prepare(context, accounts, openOnly);
        Deletion run = new Deletion(context, accounts, openOnly);
        deletion = run;
        for (int account : accounts) run.send(account);
        Utils.runOnMainThreadDelayed(run::finish, DELETE_WAIT_MS);
        run.finishIfAnswered();
    }

    /** One deletion: each account's request and Telegram's answers, then the log-out of what's left. */
    private static final class Deletion {
        private final Context context;
        private final List<Integer> accounts;
        private final boolean openOnly;
        private final Set<Integer> waiting = new LinkedHashSet<>();
        private boolean finished;

        Deletion(Context context, List<Integer> accounts, boolean openOnly) {
            this.context = context;
            this.accounts = accounts;
            this.openOnly = openOnly;
        }

        void send(int account) {
            waiting.add(account);
            String refused;
            try {
                refused = telegram.delete(account, new DeleteAccount.Answer() {
                    @Override public void done(String said) { answered(account); }
                    @Override public void refused(String refusal) { answered(account); }
                });
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "duress deletion", failure);
                refused = "threw";
            }
            // Not sent: it's logged out with the rest at the end.
            if (refused != null) waiting.remove(account);
        }

        /** DeleteAccount signs out a deleted account right after its answer, so this looks a turn later. */
        private void answered(int account) {
            Utils.runOnMainThread(() -> {
                waiting.remove(account);
                finishIfAnswered();
            });
        }

        void finishIfAnswered() {
            if (waiting.isEmpty()) finish();
        }

        /** Logs out what's still signed in, an account with a cloud password included, and clears the rest. */
        void finish() {
            if (finished) return;
            finished = true;
            List<Integer> left = new ArrayList<>();
            try {
                List<Integer> signedIn = telegram.signedIn();
                for (int account : accounts) if (signedIn.contains(account)) left.add(account);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "duress log-out", failure);
                left.addAll(accounts);
            }
            logOut(left);
            boolean noneLeft;
            try {
                noneLeft = telegram.signedIn().isEmpty();
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "duress log-out", failure);
                noneLeft = false;
            }
            if (!noneLeft) {
                deletion = null;
                clean(context, openOnly, null);
                return;
            }
            // Telegram cleared its passcode with its last account, but the lock screen it's showing
            // stays up until Telegram starts again. The code stays inert until then.
            clean(context, openOnly, () -> Utils.runOnMainThreadDelayed(
                    () -> step("duress start over", telegram::restart), RESTART_DELAY_MS));
        }
    }

    /** The accounts the code acts on, the one in use last so Telegram ends on its log-in screen; null when Telegram can't say. */
    private static List<Integer> accounts(boolean openOnly) {
        try {
            List<Integer> accounts = new ArrayList<>(telegram.signedIn());
            int selected = telegram.selected();
            if (openOnly) {
                List<Integer> open = new ArrayList<>();
                if (accounts.contains(selected)) open.add(selected);
                return open;
            }
            if (accounts.remove(Integer.valueOf(selected))) accounts.add(selected);
            return accounts;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "duress log-out", failure);
            return null;
        }
    }

    /** Before a log-out or deletion: Telegram's saved log-ins are watched, and the accounts are ordinary again. */
    private static void prepare(Context context, List<Integer> accounts, boolean openOnly) {
        step("duress saved log-ins", () -> {
            context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().putBoolean(TOKENS_PENDING, true).commit();
            watchTokens(context);
        });
        // A powered-off or receive-only account would refuse its own log-out or deletion.
        step("duress account lists", () -> {
            if (!openOnly) AccountGuard.releaseAll();
            else for (int account : accounts) AccountGuard.release(account);
        });
    }

    private static boolean logOut(List<Integer> accounts) {
        boolean allOut = true;
        for (int account : accounts) {
            try {
                telegram.logOut(account);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "duress log-out", failure);
                allOut = false;
            }
        }
        return allOut;
    }

    /** After: the saved log-ins, what was kept and Telegram's media go. [then] runs once the files are gone. */
    private static void clean(Context context, boolean openOnly, Runnable then) {
        step("duress saved log-ins", () -> clearTokens(context));
        forgetKept(context, openOnly);
        work.execute(() -> {
            deleteFiles(context);
            if (then != null) then.run();
        });
    }

    private static void watchTokens(Context context) {
        synchronized (WATCHED) {
            if (!WATCHED.isEmpty()) return;
            for (String name : new String[]{TOKENS, LOGIN_TOKENS}) {
                SharedPreferences prefs = context.getSharedPreferences(name, Context.MODE_PRIVATE);
                prefs.registerOnSharedPreferenceChangeListener(TOKEN_WATCH);
                WATCHED.add(prefs);
            }
        }
    }

    private static void clearTokens(Context context) {
        for (String name : new String[]{TOKENS, LOGIN_TOKENS}) {
            context.getSharedPreferences(name, Context.MODE_PRIVATE).edit().clear().commit();
        }
    }

    /**
     * Injected at Telegram's start: after a wipe, a log-out answer that landed once the last
     * process had ended left a saved log-in, which goes now. Only the start after a wipe.
     */
    public static void onTelegramStart(Context context) {
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            if (!prefs.getBoolean(TOKENS_PENDING, false)) return;
            clearTokens(context);
            prefs.edit().remove(TOKENS_PENDING).commit();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "duress saved log-ins", failure);
        }
    }

    /**
     * What HushTelegram kept about the accounts and their chats. The switches, the look, the
     * connection settings and the translation service stay, and so does the duress passcode. With
     * only the open account gone, the lists that hide or arrange the other accounts' chats stay too,
     * since clearing them would show what those accounts keep hidden; what holds messages still goes.
     */
    private static void forgetKept(Context context, boolean openOnly) {
        step("duress kept messages", () -> {
            clearPrefs(context, KeepDeleted.PREFS);
            KeepDeleted.forgetAll();
        });
        step("duress edit history", KeepEdits::clear);
        step("duress bookmarks", Settings.BOOKMARKS::resetToDefault);
        step("duress download receipts", () -> {
            clearPrefs(context, SaveDownloads.RECEIPTS);
            SaveDownloads.forgetFound();
        });
        step("duress translations", OutsideTranslate::forgetAll);
        step("duress tracked people", () -> {
            synchronized (SpecialContacts.class) {
                SpecialContacts.store = null;
            }
        });
        if (openOnly) return;
        step("duress hidden lists", () -> {
            clearPrefs(context, HiddenChats.PREFS);
            clearPrefs(context, HiddenMessages.PREFS);
            HiddenMessages.forget();
            clearPrefs(context, HiddenAccounts.PREFS);
        });
        step("duress chat lists", () -> {
            clearPrefs(context, GhostChats.PREFS);
            GhostChats.forget();
            clearPrefs(context, RecordChats.PREFS);
            RecordChats.forget();
        });
        // Each of these is kept per account by its user id, so it shows which accounts used this phone.
        step("duress account picks", () -> {
            for (String name : new String[]{SongDates.PREFS, LocalEmojiStatus.PREFS, LaunchFolder.PREFS,
                    AllChatsPlace.PREFS, AdminFolder.PREFS, ChatTypeFolders.PREFS}) {
                clearPrefs(context, name);
            }
        });
        step("duress saved lists", () -> {
            for (Setting<?> list : new Setting<?>[]{Settings.KEPT_REMOVED_CHATS,
                    Settings.LOCAL_PINNED_CHATS, Settings.AUTO_FORWARDING_RULES}) {
                list.resetToDefault();
            }
        });
    }

    private static void clearPrefs(Context context, String name) {
        if (!context.getSharedPreferences(name, Context.MODE_PRIVATE).edit().clear().commit()) {
            throw new IllegalStateException("Couldn't clear " + name);
        }
    }

    /**
     * Telegram's downloaded and cached media, view-once and timed media it kept included, the
     * recordings Record calls saved, and HushTelegram's own working folders. Never a file in a
     * public folder such as Downloads or Pictures, which the person saved there themselves.
     */
    private static void deleteFiles(Context context) {
        step("duress files", () -> {
            List<File> roots = new ArrayList<>();
            Set<File> seen = new LinkedHashSet<>();
            for (int type = FIRST_FOLDER; type <= LAST_FOLDER; type++) {
                File root = telegram.directory(type);
                if (root != null && seen.add(root)) roots.add(root);
            }
            List<File> publicStorage = CacheClear.folders.publicStorage();
            for (File root : roots) deleteInside(root, root, roots, publicStorage);
        });
        step("duress call recordings", () -> {
            CallRecordings.clean(context, Long.MAX_VALUE);
            deleteTree(new File(context.getCacheDir(), CallRecordings.SCRATCH));
        });
        step("duress forward copies", () -> {
            deleteTree(new File(context.getCacheDir(), FORWARD_COPIES));
            File external = context.getExternalCacheDir();
            if (external != null) deleteTree(new File(external, FORWARD_COPIES));
        });
        step("duress tracked people", () -> deleteTree(new File(context.getNoBackupFilesDir(), TRACKED_PEOPLE)));
    }

    /** Deletes what's inside [folder] that [CacheClear#allowed] lets go, leaving [root] itself. */
    private static void deleteInside(File folder, File root, List<File> roots, List<File> publicStorage) {
        File[] children = folder.listFiles();
        if (children == null) return;
        for (File child : children) {
            if (Files.isSymbolicLink(child.toPath())) {
                if (CacheClear.allowed(child, roots, publicStorage)) child.delete();
                continue;
            }
            if (child.isDirectory()) {
                deleteInside(child, root, roots, publicStorage);
                if (CacheClear.allowed(child, roots, publicStorage)) child.delete();
            } else if (CacheClear.allowed(child, roots, publicStorage)) {
                child.delete();
            }
        }
    }

    /** Deletes a folder of HushTelegram's own and what's in it, without following a link out of it. */
    private static void deleteTree(File file) {
        if (!Files.isSymbolicLink(file.toPath())) {
            File[] children = file.listFiles();
            if (children != null) for (File child : children) deleteTree(child);
        }
        file.delete();
    }

    /** Runs one part of the wipe, so a part that fails is noted and the rest still runs. */
    private static void step(String name, Runnable part) {
        try {
            part.run();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, name, failure);
        }
    }

    // ---- Choosing the code ---------------------------------------------------------------------

    /** Whether a duress code is saved. */
    public static boolean isSet() {
        try {
            SharedPreferences prefs = Utils.getContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            return !prefs.getString(HASH, "").isEmpty() && !prefs.getString(SALT, "").isEmpty();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "duress passcode", failure);
            return false;
        }
    }

    /**
     * Why [code] can't be the duress code, or null when it can. A PIN is 4 digits, the only length
     * Telegram's lock screen takes, and Telegram's own passcode is refused. Telegram is asked
     * through its checkPasscode, which doesn't count toward the wrong tries HushTelegram's own
     * prompt limits.
     */
    public static String refusal(String code) {
        if (code == null || code.isEmpty()) return L10n.t("Type a duress passcode.");
        if (AppPasscode.isPin() && !(code.length() == PIN_LENGTH && digits(code))) {
            return L10n.t("Use 4 digits, the same length as your Telegram passcode.");
        }
        CHOOSING.set(Boolean.TRUE);
        try {
            if (AppPasscode.telegram.passcodeMatches(code)) return L10n.t("That's your Telegram passcode. Pick a different one.");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "duress passcode", failure);
            return L10n.t("Couldn't complete that action. Try again.");
        } finally {
            CHOOSING.remove();
        }
        return null;
    }

    /** Saves a new salt and the hash of [code] in its place, never the code. */
    public static boolean save(String code) {
        try {
            byte[] salt = new byte[SALT_BYTES];
            new SecureRandom().nextBytes(salt);
            String hash = hex(hash(code, salt, NEW_ROUNDS));
            return Utils.getContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                    .putString(SALT, hex(salt)).putString(HASH, hash).putInt(ROUNDS, NEW_ROUNDS).commit();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "duress passcode", failure);
            return false;
        }
    }

    /** Whether [typed] is the saved duress code. Throws when the saved hash can't be read. */
    static boolean matches(String typed) throws Exception {
        if (typed == null || typed.isEmpty()) return false;
        SharedPreferences prefs = Utils.getContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        String saved = prefs.getString(HASH, "");
        String salt = prefs.getString(SALT, "");
        if (saved.isEmpty() || salt.isEmpty()) return false;
        int rounds = prefs.getInt(ROUNDS, NEW_ROUNDS);
        byte[] expected = unhex(saved);
        return MessageDigest.isEqual(hash(typed, unhex(salt), rounds), expected);
    }

    private static byte[] hash(String code, byte[] salt, int rounds) throws Exception {
        PBEKeySpec spec = new PBEKeySpec(code.toCharArray(), salt, rounds, HASH_BITS);
        try {
            return SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256").generateSecret(spec).getEncoded();
        } finally {
            spec.clearPassword();
        }
    }

    private static boolean digits(String code) {
        for (int i = 0; i < code.length(); i++) if (code.charAt(i) < '0' || code.charAt(i) > '9') return false;
        return true;
    }

    private static String hex(byte[] bytes) {
        StringBuilder out = new StringBuilder(bytes.length * 2);
        for (byte b : bytes) {
            out.append(Character.forDigit((b >> 4) & 0xf, 16)).append(Character.forDigit(b & 0xf, 16));
        }
        return out.toString();
    }

    private static byte[] unhex(String text) {
        if (text.length() % 2 != 0) throw new IllegalArgumentException("Not a hex string");
        byte[] out = new byte[text.length() / 2];
        for (int i = 0; i < out.length; i++) {
            int high = Character.digit(text.charAt(2 * i), 16);
            int low = Character.digit(text.charAt(2 * i + 1), 16);
            if (high < 0 || low < 0) throw new IllegalArgumentException("Not a hex string");
            out[i] = (byte) ((high << 4) | low);
        }
        return out;
    }

    /** Stops watching Telegram's saved log-ins and forgets the check in progress, as a new process would. */
    static void forgetForTests() {
        synchronized (WATCHED) {
            for (SharedPreferences prefs : WATCHED) prefs.unregisterOnSharedPreferenceChangeListener(TOKEN_WATCH);
            WATCHED.clear();
        }
        TYPED.remove();
        CHOOSING.remove();
        deletion = null;
    }

    /** Telegram's side, by reflection through the names the patch gives this build. */
    private static final class Reflected implements Telegram {
        @Override public List<Integer> signedIn() {
            List<Integer> slots = new ArrayList<>();
            for (Accounts.Entry entry : Accounts.signedIn()) slots.add(entry.index);
            return slots;
        }

        @Override public int selected() {
            return Accounts.selected();
        }

        @Override public void logOut(int account) throws Exception {
            Class<?> controller = Class.forName("org.telegram.messenger.MessagesController");
            Object instance = HostNames.method(controller, "getInstance", int.class).invoke(null, account);
            HostNames.method(controller, "performLogout", int.class).invoke(instance, 1);
        }

        @Override public File directory(int type) {
            try {
                Object folder = HostNames.method(Class.forName("org.telegram.messenger.FileLoader"), "getDirectory", int.class)
                        .invoke(null, type);
                return folder instanceof File ? (File) folder : null;
            } catch (ReflectiveOperationException | RuntimeException failure) {
                HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "duress folders", failure);
                return null;
            }
        }

        @Override public String delete(int account, DeleteAccount.Answer answer) {
            return DeleteAccount.send(account, answer);
        }

        @Override public void restart() {
            Utils.restartApp(Utils.getContext());
        }
    }
}
