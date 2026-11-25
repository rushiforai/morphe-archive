/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Environment;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.Setting;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

/**
 * Duress passcode (#79): a second passcode that, typed where Telegram asks for its own, logs out or
 * deletes every account on the phone, or only the open one, and clears what HushTelegram kept. A
 * deletion looks wrong the first time and deletes the second. Telegram's real passcode always
 * wins, a wrong code does nothing, and the switch, Pause and any failure leave Telegram's answer.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class DuressWipeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String REAL = "1234";
    private static final String DURESS = "5555";

    /** Telegram's checkPasscode as the patch leaves it: Telegram's own answer, then the hook's. */
    private static final class HookedTelegram implements AppPasscode.Telegram {
        String passcode;
        int asked;

        HookedTelegram(String passcode) {
            this.passcode = passcode;
        }

        @Override public boolean passcodeSet() { return passcode != null; }
        @Override public boolean passcodePin() { return passcode != null && passcode.chars().allMatch(Character::isDigit); }
        @Override public boolean passcodeMatches(String typed) {
            asked++;
            DuressWipe.enter(typed);
            return DuressWipe.afterCheck(typed.equals(passcode) ? 1 : 0);
        }
    }

    /** The accounts, their log-out and deletion, Telegram's folders and its start-over. */
    private static final class FakeTelegram implements DuressWipe.Telegram {
        final List<Integer> signedIn = new ArrayList<>();
        final List<Integer> loggedOut = new ArrayList<>();
        final Map<Integer, File> folders = new HashMap<>();
        /** The deletions sent, by account, each with the answer Telegram would give it. */
        final Map<Integer, DeleteAccount.Answer> deletions = new HashMap<>();
        int selected;
        int refuses = -1;
        int unsent = -1;
        int restarts;

        @Override public List<Integer> signedIn() { return new ArrayList<>(signedIn); }
        @Override public int selected() { return selected; }
        @Override public void logOut(int account) {
            if (account == refuses) throw new IllegalStateException("Telegram wouldn't log out " + account);
            loggedOut.add(account);
            signedIn.remove(Integer.valueOf(account));
        }
        @Override public File directory(int type) { return folders.get(type); }
        @Override public String delete(int account, DeleteAccount.Answer answer) {
            if (account == unsent) return "Telegram didn't delete the account.";
            deletions.put(account, answer);
            return null;
        }
        @Override public void restart() { restarts++; }

        /** Telegram deleted [account]: DeleteAccount tells the answer, then signs it out. */
        void deleted(int account) {
            deletions.get(account).done("Account deleted.");
            signedIn.remove(Integer.valueOf(account));
        }
    }

    /** Every file of HushTelegram's own that the wipe clears, by name. */
    private static final String[] KEPT = {"hushtelegram_kept_deleted", "hushtelegram_edit_history",
            "hushtelegram_hidden_chats", "hushtelegram_hidden_messages", "hushtelegram_hidden_accounts",
            "hushtelegram_ghost_exceptions", "hushtelegram_record_chats", "hushtelegram_saved_downloads",
            "hushtelegram_song_dates", "hushtelegram_local_emoji_status", "hushtelegram_launch_folders",
            "hushtelegram_all_chats_place", "hushtelegram_admin_folder", "hushtelegram_chat_type_folders",
            "hushtelegram_kept_favorites"};

    /** The settings keys the removed Pin chats on this phone kept its chats and their order under. */
    private static final String[] OLD_PIN_KEYS = {"hushtelegram_local_pinned_chats", "hushtelegram_local_pins_order"};

    private final HookedTelegram hooked = new HookedTelegram(REAL);
    private final FakeTelegram telegram = new FakeTelegram();
    private Context context;

    @Before public void setUp() throws IOException {
        context = Utils.getContext();
        AppPasscodeForTests.use(REAL);
        AppPasscode.telegram = hooked;
        DuressWipe.telegram = telegram;
        DuressWipe.work = Runnable::run;
        telegram.signedIn.addAll(Arrays.asList(0, 2));
        telegram.selected = 0;
        Settings.DURESS_WIPE.save(true);
        assertNull(DuressWipe.refusal(DURESS));
        assertTrue(DuressWipe.save(DURESS));
        HookStatus.clear();
    }

    @After public void restore() {
        DuressWipe.forgetForTests();
        AppPasscodeForTests.restore();
        Settings.DURESS_WIPE.resetToDefault();
        Settings.DURESS_ACTION.resetToDefault();
        Settings.GHOST_MODE.resetToDefault();
        Settings.BOOKMARKS.resetToDefault();
        Settings.KEPT_REMOVED_CHATS.resetToDefault();
        for (String key : OLD_PIN_KEYS) prefs(Setting.PREFERENCES_NAME).edit().remove(key).commit();
        Settings.LOCAL_NAME_LIST.resetToDefault();
        Settings.AUTO_FORWARDING_RULES.resetToDefault();
        Settings.RECEIVE_ONLY_ACCOUNTS.resetToDefault();
        Settings.POWERED_OFF_ACCOUNTS.resetToDefault();
        PauseForTests.resume();
        GhostChats.forget();
        OutsideTranslate.resetForTests();
        HookStatus.clear();
    }

    @Test public void onlyASaltedHashOfTheCodeIsKept() throws Exception {
        SharedPreferences saved = context.getSharedPreferences(DuressWipe.PREFS, Context.MODE_PRIVATE);
        Map<String, ?> all = saved.getAll();
        for (Object value : all.values()) assertFalse("the code itself is never saved", String.valueOf(value).contains(DURESS));
        String salt = saved.getString(DuressWipe.SALT, "");
        String hash = saved.getString(DuressWipe.HASH, "");
        int rounds = saved.getInt(DuressWipe.ROUNDS, 0);
        assertEquals("a 16 byte salt", 32, salt.length());
        assertTrue(rounds > 0);

        // The same PBKDF2 with HMAC-SHA256 any other implementation gives for that salt.
        byte[] expected = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256")
                .generateSecret(new PBEKeySpec(DURESS.toCharArray(), hex(salt), rounds, 256)).getEncoded();
        assertEquals(hexOf(expected), hash);
        assertTrue(DuressWipe.isSet());
        assertTrue(DuressWipe.matches(DURESS));
        assertFalse(DuressWipe.matches("5556"));
        assertFalse(DuressWipe.matches(""));

        // Saving it again draws a new salt, so the same code never gives the same hash twice.
        assertTrue(DuressWipe.save(DURESS));
        assertNotEquals(salt, saved.getString(DuressWipe.SALT, ""));
        assertNotEquals(hash, saved.getString(DuressWipe.HASH, ""));
        assertTrue(DuressWipe.matches(DURESS));
    }

    @Test public void telegramsOwnPasscodeIsRefusedWithoutUsingUpItsTries() {
        assertNotNull(DuressWipe.refusal(REAL));
        assertNotNull("a PIN passcode means 4 digits, the only length the lock screen takes", DuressWipe.refusal("12345"));
        assertNotNull(DuressWipe.refusal("12a4"));
        assertNotNull(DuressWipe.refusal(""));
        for (int i = 0; i < AppPasscode.MISSES + 1; i++) assertNull(DuressWipe.refusal("9999"));
        assertEquals("Telegram's wrong-try wait isn't touched", 0, AppPasscode.waitMillis());

        // Choosing the same duress code again is checked through checkPasscode too, and wipes nothing.
        assertNull(DuressWipe.refusal(DURESS));
        assertTrue(telegram.loggedOut.isEmpty());

        // A text passcode takes any code but the real one.
        hooked.passcode = "hunter";
        assertNull(DuressWipe.refusal("abc"));
        assertNotNull(DuressWipe.refusal("hunter"));
    }

    @Test public void aWrongCodeWipesNothing() throws IOException {
        fill();
        assertFalse(hooked.passcodeMatches("0000"));
        assertTrue(telegram.loggedOut.isEmpty());
        assertEquals("kept", prefs("hushtelegram_hidden_chats").getString("kept", ""));
        assertEquals("token", prefs(DuressWipe.TOKENS).getString("log_out_token_0", ""));
    }

    @Test public void telegramsRealPasscodeWinsEvenWhenItIsTheDuressCode() throws IOException {
        fill();
        assertTrue(hooked.passcodeMatches(REAL));
        // Telegram's passcode changed to the duress code after it was chosen.
        hooked.passcode = DURESS;
        assertTrue(hooked.passcodeMatches(DURESS));
        assertTrue(telegram.loggedOut.isEmpty());
        assertEquals("kept", prefs("hushtelegram_hidden_chats").getString("kept", ""));
    }

    @Test public void withTheSwitchOffOrPausedTheDuressCodeIsJustWrong() throws IOException {
        fill();
        Settings.DURESS_WIPE.save(false);
        assertFalse(hooked.passcodeMatches(DURESS));
        Settings.DURESS_WIPE.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(hooked.passcodeMatches(DURESS));
        PauseForTests.resume();
        assertTrue(telegram.loggedOut.isEmpty());
        assertEquals("kept", prefs("hushtelegram_hidden_chats").getString("kept", ""));
    }

    @Test public void theDuressCodeLogsOutEveryAccountAndClearsWhatWasKept() throws Exception {
        fill();
        telegram.selected = 0;
        Settings.GHOST_MODE.save(true);
        File photo = file(telegram.folders.get(0), "Telegram Images/photo.jpg");
        File cached = file(telegram.folders.get(4), "-123_456.jpg");
        File saved = file(telegram.folders.get(1), "song.mp3");
        File tracked = file(context.getNoBackupFilesDir(), "hushtelegram_special_contacts/0/77.json");
        File copy = file(context.getCacheDir(), "hushtelegram_forward_copy/1/clip.mp4");
        File scratch = file(context.getCacheDir(), CallRecordings.SCRATCH + "/call.pcm");

        assertTrue("the lock screen opens", hooked.passcodeMatches(DURESS));

        assertEquals("the account in use goes last, so Telegram lands on its log-in screen",
                Arrays.asList(2, 0), telegram.loggedOut);
        assertTrue(prefs(DuressWipe.TOKENS).getAll().isEmpty());
        assertTrue(prefs(DuressWipe.LOGIN_TOKENS).getAll().isEmpty());
        for (String name : KEPT) assertTrue(name + " is cleared", prefs(name).getAll().isEmpty());
        assertEquals("", Settings.BOOKMARKS.savedValue());
        assertEquals("", Settings.KEPT_REMOVED_CHATS.savedValue());
        for (String key : OLD_PIN_KEYS) assertFalse(key + " is cleared", prefs(Setting.PREFERENCES_NAME).contains(key));
        assertEquals("", Settings.LOCAL_NAME_LIST.savedValue());
        assertEquals("", Settings.AUTO_FORWARDING_RULES.savedValue());
        assertEquals("", Settings.RECEIVE_ONLY_ACCOUNTS.savedValue());
        assertEquals("", Settings.POWERED_OFF_ACCOUNTS.savedValue());
        assertTrue(GhostChats.chats().isEmpty());
        assertFalse(photo.exists());
        assertFalse(cached.exists());
        assertTrue("Telegram's folders themselves stay", telegram.folders.get(0).isDirectory());
        assertTrue("a public folder is never touched", saved.exists());
        assertFalse(tracked.exists());
        assertFalse(copy.exists());
        assertFalse(scratch.exists());

        // The switches, the translation service and the duress passcode itself stay.
        assertTrue(Settings.GHOST_MODE.get());
        assertTrue(Settings.DURESS_WIPE.get());
        assertTrue(DuressWipe.matches(DURESS));
        assertEquals("https://example.com", prefs("hushtelegram_outside_translate").getString("ai_address", ""));
        assertFalse("the chats picked for translation go", prefs("hushtelegram_outside_translate").contains("owner_chats"));

        // Telegram's answer to a log-out brings a new saved log-in, which goes too.
        prefs(DuressWipe.TOKENS).edit().putInt("count", 1).putString("log_out_token_0", "late").apply();
        ShadowLooper.idleMainLooper();
        assertTrue(prefs(DuressWipe.TOKENS).getAll().isEmpty());
    }

    @Test public void aSavedLogInLeftByALateAnswerGoesAtTheNextStart() {
        assertTrue(hooked.passcodeMatches(DURESS));
        // A new process: the answer landed after the last one ended.
        DuressWipe.forgetForTests();
        prefs(DuressWipe.TOKENS).edit().putInt("count", 1).putString("log_out_token_0", "late").commit();
        DuressWipe.onTelegramStart(context);
        assertTrue(prefs(DuressWipe.TOKENS).getAll().isEmpty());

        // Only once: an ordinary start after that leaves Telegram's saved log-ins alone.
        prefs(DuressWipe.TOKENS).edit().putInt("count", 1).putString("log_out_token_0", "later").commit();
        DuressWipe.onTelegramStart(context);
        assertEquals("later", prefs(DuressWipe.TOKENS).getString("log_out_token_0", ""));
    }

    @Test public void aFailureLeavesTelegramsAnswer() throws IOException {
        fill();
        // An account Telegram wouldn't log out keeps the lock shut, and the other accounts still go.
        telegram.refuses = 2;
        assertFalse(hooked.passcodeMatches(DURESS));
        assertEquals(Collections.singletonList(0), telegram.loggedOut);
        assertTrue(String.join("\n", HookStatus.report()).contains("duress"));

        // A saved hash that can't be read is a wrong code, never a wipe.
        HookStatus.clear();
        telegram.refuses = -1;
        telegram.loggedOut.clear();
        prefs(DuressWipe.PREFS).edit().putString(DuressWipe.SALT, "not hex").commit();
        assertFalse(hooked.passcodeMatches(DURESS));
        assertTrue(telegram.loggedOut.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains("duress"));
        // And Telegram's yes stays a yes whatever happens.
        assertTrue(hooked.passcodeMatches(REAL));
    }

    @Test public void aDeletionLooksWrongTheFirstTimeAndDeletesTheSecond() throws Exception {
        fill();
        Settings.DURESS_ACTION.save(DuressWipe.DELETE_ALL);
        File photo = file(telegram.folders.get(0), "Telegram Images/photo.jpg");

        assertFalse("the first time looks like a wrong passcode", hooked.passcodeMatches(DURESS));
        assertTrue(DuressWipe.armed());
        assertTrue(telegram.deletions.isEmpty());
        assertTrue(telegram.loggedOut.isEmpty());
        assertEquals("kept", prefs("hushtelegram_hidden_chats").getString("kept", ""));
        assertTrue(photo.exists());

        assertFalse("the second time still looks wrong", hooked.passcodeMatches(DURESS));
        assertFalse(DuressWipe.armed());
        assertEquals(new HashSet<>(Arrays.asList(0, 2)), telegram.deletions.keySet());
        assertEquals("a powered-off or receive-only account is ordinary again first", "", Settings.POWERED_OFF_ACCOUNTS.savedValue());
        assertEquals("", Settings.RECEIVE_ONLY_ACCOUNTS.savedValue());
        // Typed again while Telegram answers, it starts nothing more and arms nothing.
        assertFalse(hooked.passcodeMatches(DURESS));
        assertFalse(DuressWipe.armed());
        assertEquals(2, telegram.deletions.size());

        // Account 2 goes on the spot. Account 0 has a cloud password, so Telegram waits a week and it's logged out now.
        telegram.deleted(2);
        telegram.deletions.get(0).done("Telegram deletes the account in 7 days.");
        ShadowLooper.idleMainLooper();
        assertEquals(Collections.singletonList(0), telegram.loggedOut);
        assertTrue(telegram.signedIn.isEmpty());
        for (String name : KEPT) assertTrue(name + " is cleared", prefs(name).getAll().isEmpty());
        assertTrue(prefs(DuressWipe.TOKENS).getAll().isEmpty());
        assertEquals("", Settings.BOOKMARKS.savedValue());
        assertFalse(photo.exists());
        assertEquals("Telegram starts over once the log-outs have had time to leave", 0, telegram.restarts);
        ShadowLooper.idleMainLooper(DuressWipe.RESTART_DELAY_MS, TimeUnit.MILLISECONDS);
        assertEquals(1, telegram.restarts);

        // The time limit passing later changes nothing, and the switch and the code stay.
        ShadowLooper.idleMainLooper(DuressWipe.DELETE_WAIT_MS, TimeUnit.MILLISECONDS);
        assertEquals(Collections.singletonList(0), telegram.loggedOut);
        assertEquals(1, telegram.restarts);
        assertTrue(Settings.DURESS_WIPE.get());
        assertTrue(DuressWipe.matches(DURESS));
    }

    @Test public void telegramsPasscodeCallsOffAnArmedDeletion() {
        Settings.DURESS_ACTION.save(DuressWipe.DELETE_ALL);
        assertFalse(hooked.passcodeMatches(DURESS));
        assertTrue(DuressWipe.armed());
        assertTrue(hooked.passcodeMatches(REAL));
        assertFalse(DuressWipe.armed());
        assertFalse("armed again, not deleted", hooked.passcodeMatches(DURESS));
        assertTrue(telegram.deletions.isEmpty());

        // The arm outlives the process, so Telegram starting again between the two doesn't call it off.
        DuressWipe.forgetForTests();
        assertFalse(hooked.passcodeMatches(DURESS));
        assertEquals(2, telegram.deletions.size());
    }

    @Test public void anAccountNotDeletedInTimeIsLoggedOutInstead() {
        Settings.DURESS_ACTION.save(DuressWipe.DELETE_ALL);
        telegram.unsent = 2;
        assertFalse(hooked.passcodeMatches(DURESS));
        assertFalse(hooked.passcodeMatches(DURESS));
        assertEquals(Collections.singleton(0), telegram.deletions.keySet());
        ShadowLooper.idleMainLooper();
        assertTrue("it waits for Telegram's answer", telegram.loggedOut.isEmpty());

        ShadowLooper.idleMainLooper(DuressWipe.DELETE_WAIT_MS, TimeUnit.MILLISECONDS);
        assertEquals(Arrays.asList(2, 0), telegram.loggedOut);
        // An answer after that changes nothing.
        telegram.deletions.get(0).refused("Wait 30 seconds, then try again.");
        ShadowLooper.idleMainLooper(DuressWipe.RESTART_DELAY_MS, TimeUnit.MILLISECONDS);
        assertEquals(Arrays.asList(2, 0), telegram.loggedOut);
        assertEquals(1, telegram.restarts);
    }

    @Test public void theOpenAccountOnlyLeavesTheOthersAndWhatHidesTheirChats() throws IOException {
        fill();
        telegram.selected = 2;
        Settings.DURESS_ACTION.save(DuressWipe.LOG_OUT_OPEN);
        assertTrue("the lock screen opens on the account left", hooked.passcodeMatches(DURESS));
        assertEquals(Collections.singletonList(2), telegram.loggedOut);
        assertEquals(Collections.singletonList(0), telegram.signedIn);

        // What holds messages goes.
        for (String name : new String[]{"hushtelegram_kept_deleted", "hushtelegram_edit_history", "hushtelegram_saved_downloads"}) {
            assertTrue(name + " is cleared", prefs(name).getAll().isEmpty());
        }
        assertEquals("", Settings.BOOKMARKS.savedValue());
        assertFalse(prefs("hushtelegram_outside_translate").contains("owner_chats"));
        // The lists that hide or arrange the other account's chats stay, and it stays receive-only.
        for (String name : new String[]{"hushtelegram_hidden_chats", "hushtelegram_hidden_messages", "hushtelegram_hidden_accounts",
                "hushtelegram_ghost_exceptions", "hushtelegram_record_chats", "hushtelegram_launch_folders"}) {
            assertEquals(name + " stays", "kept", prefs(name).getString("kept", ""));
        }
        assertEquals(Collections.singleton(42L), GhostChats.chats());
        for (String key : OLD_PIN_KEYS) assertEquals(key + " stays", "42", prefs(Setting.PREFERENCES_NAME).getString(key, ""));
        assertEquals("42\tAnn", Settings.LOCAL_NAME_LIST.savedValue());
        assertEquals("1 2 3", Settings.AUTO_FORWARDING_RULES.savedValue());
        assertEquals("0", Settings.RECEIVE_ONLY_ACCOUNTS.savedValue());
        assertEquals("the open account was powered off and isn't now", "", Settings.POWERED_OFF_ACCOUNTS.savedValue());

        // Deleting only the open one, with another account left, doesn't start Telegram over.
        telegram.signedIn.addAll(Arrays.asList(1, 2));
        telegram.selected = 1;
        Settings.DURESS_ACTION.save(DuressWipe.DELETE_OPEN);
        assertFalse(hooked.passcodeMatches(DURESS));
        assertFalse(hooked.passcodeMatches(DURESS));
        assertEquals(Collections.singleton(1), telegram.deletions.keySet());
        telegram.deleted(1);
        ShadowLooper.idleMainLooper(DuressWipe.DELETE_WAIT_MS, TimeUnit.MILLISECONDS);
        assertEquals(Arrays.asList(0, 2), telegram.signedIn);
        assertEquals(Collections.singletonList(2), telegram.loggedOut);
        assertEquals(0, telegram.restarts);
        // The deletion is over, so the code arms again for the account now open.
        assertFalse(hooked.passcodeMatches(DURESS));
        assertTrue(DuressWipe.armed());
    }

    /** Something in every store the wipe clears, and in the ones it keeps. */
    private void fill() throws IOException {
        for (String name : KEPT) prefs(name).edit().putString("kept", "kept").commit();
        prefs(DuressWipe.TOKENS).edit().putInt("count", 1).putString("log_out_token_0", "token").commit();
        prefs(DuressWipe.LOGIN_TOKENS).edit().putString("login_token_0", "token").commit();
        prefs("hushtelegram_ghost_exceptions").edit().putStringSet("chats", Collections.singleton("42")).commit();
        GhostChats.forget();
        assertEquals(Collections.singleton(42L), GhostChats.chats());
        prefs("hushtelegram_outside_translate").edit().putString("ai_address", "https://example.com")
                .putStringSet("owner_chats", Collections.singleton("7:42")).commit();
        Settings.BOOKMARKS.save("1:2:3");
        Settings.KEPT_REMOVED_CHATS.save("42");
        // Pin chats on this phone is gone, but a phone that used it still holds its two lists.
        for (String key : OLD_PIN_KEYS) prefs(Setting.PREFERENCES_NAME).edit().putString(key, "42").commit();
        Settings.LOCAL_NAME_LIST.save("42\tAnn");
        Settings.AUTO_FORWARDING_RULES.save("1 2 3");
        Settings.RECEIVE_ONLY_ACCOUNTS.save("0");
        Settings.POWERED_OFF_ACCOUNTS.save("2");
        File root = new File(context.getFilesDir(), "Telegram");
        telegram.folders.put(0, folder(new File(root, "Telegram Images")));
        telegram.folders.put(4, folder(new File(context.getCacheDir(), "telegram-cache")));
        telegram.folders.put(1, folder(new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC), "Telegram")));
    }

    private SharedPreferences prefs(String name) {
        return context.getSharedPreferences(name, Context.MODE_PRIVATE);
    }

    private static File folder(File dir) {
        assertTrue(dir.isDirectory() || dir.mkdirs());
        return dir;
    }

    private static File file(File root, String path) throws IOException {
        File file = new File(root, path);
        folder(file.getParentFile());
        try (FileOutputStream out = new FileOutputStream(file)) {
            out.write(1);
        }
        return file;
    }

    private static byte[] hex(String text) {
        byte[] out = new byte[text.length() / 2];
        for (int i = 0; i < out.length; i++) out[i] = (byte) Integer.parseInt(text.substring(2 * i, 2 * i + 2), 16);
        return out;
    }

    private static String hexOf(byte[] bytes) {
        StringBuilder out = new StringBuilder();
        for (byte b : bytes) out.append(String.format("%02x", b));
        return out.toString();
    }
}
