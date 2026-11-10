package app.morphe.extension.syncforreddit.ui.lock;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.inputmethod.EditorInfo;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.biometric.BiometricPrompt;
import androidx.fragment.app.FragmentActivity;
import androidx.preference.Preference;

import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.security.MessageDigest;
import java.security.SecureRandom;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * A PIN asked for before an account is opened, beside or instead of the fingerprint Sync asks
 * for.
 *
 * <p>Sync locks an account with a fingerprint and nothing else, which is of no use where someone
 * else's finger opens the same phone. This asks for a PIN at the two places Sync asks for a
 * fingerprint: choosing an account, and acting on one.
 *
 * <p>It is another thing to pass rather than a replacement, so the two settings together say
 * what is asked for: neither set asks nothing, as before; only Sync's asks for a fingerprint, as
 * before; only a PIN asks for the PIN; both ask for the fingerprint and then the PIN.
 *
 * <p>A PIN is kept as a hash with a salt beside it rather than as itself. Four digits do not
 * survive someone determined who already has the file, but they should not be sitting there in
 * the open either, and this costs nothing.
 *
 * @noinspection unused
 */
public final class AccountPin {
    /** The hash of the PIN for an account, where one is set. */
    public static final String PIN = "sync_up_pin";

    /** What the hash was salted with. */
    private static final String SALT = "sync_up_pin_salt";

    /** Whether the PIN is asked for when the app is opened, as well as when accounts change. */
    public static final String AT_START = "sync_up_pin_start";

    /**
     * Written when the PIN has just been given to change accounts, and read once by the lock on
     * the way in.
     *
     * <p>Changing account builds the screen again — sometimes the whole process again — so the
     * lock on the way in runs a moment after the one that was just answered, and asks for the
     * same PIN a second time. A note left behind survives both, and is thrown away as it is
     * read so that it can only ever excuse the one prompt.
     */
    private static final String JUST_PROVED = "sync_up_just_proved";
    private static final String JUST_PROVED_AT = "sync_up_just_proved_at";

    /** How long such a note is worth anything, in case nothing ever reads it. */
    private static final long WHILE_IT_LASTS = 60_000L;

    /** What Sync calls its own two locks. */
    private static final String ACCOUNT_LOCK = "biometric";
    private static final String LOGIN_LOCK = "biometric_start";

    /** What is asked for where both this and Sync's own fingerprint lock are set. */
    public static final String MODE = "sync_up_lock_mode";

    /** The mode in which either one of the two opens the account, rather than both. */
    private static final String EITHER = "either";

    /** The name this gives when it asks Sync for an account's settings. */
    private static final String ASKING = "SyncUp";

    /**
     * The file a PIN is kept in, which is ours and not one Sync writes to.
     *
     * <p>Sync's Backup walks its own settings and writes them into a file people copy between
     * devices and hand to whoever is helping them. A PIN of four digits beside the salt it was
     * hashed with is worked out from such a file in no time, so it is kept where a backup
     * cannot reach it. A lock that travels in a plain text file is not a lock.
     */
    private static final String STORE = "sync_up_locks";

    /** The fewest digits a PIN may be. */
    private static final int FEWEST = 4;

    /** How far the typing field is held off the edges of the dialog, in dp. */
    private static final int AN_EDGE = 20;

    /** How large the lock over a covered app is drawn, and how wide its field is, in dp. */
    private static final int A_GLYPH = 48;
    private static final int A_FIELD = 220;

    /** How large what the cover is asking is written, in sp. */
    private static final int SAYING = 20;

    /** What the two ways off the cover are called, since they are made rather than inflated. */
    private static final int THE_FINGER = 0x7E000001;
    private static final int THE_WAY_OUT = 0x7E000002;

    /** How large the digits are typed, in sp. */
    private static final int DIGITS = 22;

    /** How far apart they sit, as a share of their own size. */
    private static final float APART = 0.3f;

    /** How far the screen behind the prompt is blurred, in dp. */
    private static final int A_BLUR = 48;

    /** How far it is darkened where the blur is doing most of the work, and where there is none. */
    private static final float DIM_BESIDE_BLUR = 0.3f;
    private static final float DIM_ALONE = 0.6f;

    /** The lock drawn beside the prompt, which is one of the app's own. */
    private static final String A_LOCK = "outline_lock_24";

    /**
     * Which account is being unlocked, as the call that starts the unlocking last said.
     *
     * <p>Sync reads its own fingerprint setting a few instructions after handing over what to
     * do next, in the same method and on the same thread, and by then the register that held
     * the account name has been reused for something else. So the name is kept here between
     * those two moments rather than read twice.
     */
    @Nullable
    private static volatile String unlocking;

    /** The row that follows Sync's own switches, held weakly since nothing takes it back. */
    @Nullable
    private static WeakReference<Preference> theModeRow;

    /**
     * Whether the lock on the way in has already been answered while this run of the app has
     * been going.
     *
     * <p>The screen being built again does not mean the app has been opened again: a foldable
     * being opened can do it, and so can anything else that rebuilds the activity. Asking a
     * second time for what was just given reads as the lock being broken.
     */
    private static volatile boolean wayInAnswered;

    /** What follows them, kept once rather than once per visit to the screen. */
    @Nullable
    private static SharedPreferences.OnSharedPreferenceChangeListener watchingSyncsLocks;

    private AccountPin() {}

    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /** @return Sync's own settings for an account, which is where the two switches are kept. */
    @Nullable
    private static SharedPreferences syncs(Context context, @Nullable String account) {
        try {
            return context == null ? null : t7.z.h(context, named(account), ASKING);
        } catch (Throwable ex) {
            Logger.printInfo(() -> "pin: could not reach Sync's settings: " + ex);
            return null;
        }
    }

    /** @return Whether either lock on its own opens the account, rather than both being asked. */
    private static boolean eitherWillDo(Context context, @Nullable String account) {
        SharedPreferences store = syncs(context, account);
        return store != null && EITHER.equals(store.getString(MODE, "both"));
    }

    /** @return Our own file, which Sync neither reads nor backs up. */
    @Nullable
    private static SharedPreferences of(Context context, @Nullable String account) {
        try {
            if (context == null) {
                return null;
            }
            SharedPreferences store = context.getSharedPreferences(STORE, Context.MODE_PRIVATE);
            carryOver(context, store, named(account));
            return store;
        } catch (Throwable ex) {
            Logger.printInfo(() -> "pin: could not reach where a PIN is kept: " + ex);
            return null;
        }
    }

    /**
     * @return Which account is being asked about, which is the one in use unless named.
     *
     * <p>Lowercased, because Sync hands the name over in whichever case it feels like: the
     * picker passes the name as it is written on the screen, `ASlyLawnTurtle`, while the
     * account in use comes back as `aslylawnturtle`, which is also what it names the account's
     * own settings file. Keeping a PIN under one of those and asking for it under the other is
     * a lock that quietly never asks.
     */
    private static String named(@Nullable String account) {
        String name = account;
        if (name == null || name.isEmpty()) {
            try {
                name = t7.z.a();
            } catch (Throwable ex) {
                return "";
            }
        }
        return name == null ? "" : name.toLowerCase(Locale.ROOT);
    }

    /**
     * What a PIN is kept under, since one file now holds every account's. A Reddit name is
     * letters, digits, dashes and underscores, so a slash between the two cannot be mistaken
     * for part of either.
     */
    private static String under(@Nullable String account, String what) {
        return named(account) + "/" + what;
    }

    /**
     * Moves a PIN an older build of ours wrote into Sync's own settings over to our file, and
     * takes it out of Sync's, so that it stops being something a backup carries. A backup made
     * before this still restores, and is moved across the same way the next time it is read.
     */
    private static void carryOver(Context context, SharedPreferences store, String account) {
        try {
            if (account.isEmpty()) {
                return;
            }
            SharedPreferences syncs = t7.z.h(context, account, ASKING);
            if (syncs == null || !syncs.contains(PIN)) {
                return;
            }

            String held = syncs.getString(PIN, null);
            String salt = syncs.getString(SALT, "");
            if (held != null && !held.isEmpty()
                    && store.getString(account + "/" + PIN, null) == null) {
                store.edit()
                        .putString(account + "/" + PIN, held)
                        .putString(account + "/" + SALT, salt)
                        .apply();
            }
            syncs.edit().remove(PIN).remove(SALT).apply();
            Logger.printInfo(() -> "pin: moved the PIN out of Sync's own settings");
        } catch (Throwable ex) {
            Logger.printInfo(() -> "pin: could not move what an older build kept: " + ex);
        }
    }

    /** @return Whether a PIN has been set for this account. */
    public static boolean isSet(Context context, @Nullable String account) {
        SharedPreferences store = of(context, account);
        String held = store == null ? null : store.getString(under(account, PIN), null);
        return held != null && !held.isEmpty();
    }

    /**
     * What to run in place of what Sync was going to run, so that the PIN is asked for first.
     *
     * <p>Answering with what was handed over, where no PIN is set, is what leaves an account
     * without one behaving exactly as it did.
     */
    public static Runnable guard(Context context, @Nullable String account, Runnable then) {
        // Remembered whether or not there is a PIN, so that what is read a moment later is
        // answered about this account rather than about whichever one was asked about last.
        unlocking = account;

        if (then == null || !isPatchIncluded() || !isSet(context, account)) {
            return then;
        }
        return () -> ask(context, account, () -> {
            justProved(context, account);
            then.run();
        });
    }

    /** Leaves the note that says the PIN was given a moment ago, to change to this account. */
    private static void justProved(Context context, @Nullable String account) {
        try {
            SharedPreferences store = of(context, account);
            if (store != null) {
                store.edit()
                        .putString(JUST_PROVED, named(account))
                        .putLong(JUST_PROVED_AT, System.currentTimeMillis())
                        .apply();
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "pin: could not note that the PIN was just given: " + ex);
        }
    }

    /**
     * @return Whether the PIN was given a moment ago to reach this account, in which case the
     *         lock on the way in has already been answered. Throws the note away either way.
     */
    private static boolean alreadyProved(Context context, @Nullable String account) {
        try {
            SharedPreferences store = of(context, account);
            if (store == null || !store.contains(JUST_PROVED)) {
                return false;
            }

            String who = store.getString(JUST_PROVED, null);
            long when = store.getLong(JUST_PROVED_AT, 0L);
            store.edit().remove(JUST_PROVED).remove(JUST_PROVED_AT).apply();

            return named(account).equals(who)
                    && System.currentTimeMillis() - when < WHILE_IT_LASTS;
        } catch (Exception ex) {
            Logger.printInfo(() -> "pin: could not read whether the PIN was just given: " + ex);
            return false;
        }
    }

    /**
     * Whether Sync should go on and ask for a fingerprint.
     *
     * <p>Put in front of Sync's own reading of the setting. The answer is Sync's own except
     * where one lock or the other is enough: there the fingerprint is ours to offer, beside the
     * PIN and in the same breath, so Sync's prompt stands down and the choice is made in one
     * place instead of two prompts arriving one after the other.
     */
    public static boolean fingerprintWanted(SharedPreferences store, String key, boolean byDefault) {
        boolean asSyncHasIt = store != null && store.getBoolean(key, byDefault);
        try {
            if (!isPatchIncluded() || !asSyncHasIt) {
                return asSyncHasIt;
            }
            Context context = Utils.getContext();
            if (!isSet(context, unlocking) || !eitherWillDo(context, unlocking)) {
                return asSyncHasIt;
            }

            // Only where something of ours actually takes its place. The lock on the way in is
            // ours only when the PIN is asked for there too; standing Sync's down otherwise
            // would take the lock off the app and put nothing back.
            if (LOGIN_LOCK.equals(key) && !asksAtStart(context, unlocking)) {
                return asSyncHasIt;
            }
            return false;
        } catch (Exception ex) {
            Logger.printInfo(() -> "pin: could not tell whether to leave the fingerprint: " + ex);
        }
        return asSyncHasIt;
    }

    /**
     * Asked before the app opens, where the PIN is wanted then as well as when accounts change.
     *
     * <p>Nothing is handed over here to wrap: the app decides for itself what to ask for and
     * then carries on inside itself. So the decision is handed back to it once the PIN is
     * right, by calling the same method again with the PIN marked as given, and the rest of
     * what it does runs exactly as it would have.
     *
     * @return Whether this has taken the question over, in which case the app stops here.
     */
    /** Asks for the PIN, and runs what was waiting only once it is right. */
    private static void ask(Context context, @Nullable String account, Runnable then) {
        try {
            final EditText typing = digits(context, "PIN");

            AlertDialog.Builder asking = new AlertDialog.Builder(context)
                    .setTitle("Enter PIN")
                    .setView(around(context, typing))
                    .setNegativeButton("Cancel", null);

            Drawable lock = glyph(context, A_LOCK);
            if (lock != null) {
                asking.setIcon(lock);
            }

            // Where one lock or the other is enough, Sync's own prompt has stood down and the
            // fingerprint is offered from here instead, so that both ways in are on the one
            // screen rather than arriving one after the other.
            if (eitherWillDo(context, account) && fingerprintIsOn(context, account)) {
                asking.setNeutralButton("Use fingerprint", null);
            }

            final AlertDialog prompt = asking.create();

            // Opens as the last digit is typed, the way a device does, rather than waiting for
            // a button to be found. How long the PIN is was never kept, so every length it
            // could be is tried.
            typing.addTextChangedListener(new TextWatcher() {
                @Override
                public void beforeTextChanged(CharSequence text, int from, int was, int will) {}

                @Override
                public void onTextChanged(CharSequence text, int from, int before, int count) {}

                @Override
                public void afterTextChanged(Editable typed) {
                    if (typed.length() >= FEWEST
                            && matches(context, account, typed.toString())) {
                        prompt.dismiss();
                        then.run();
                    }
                }
            });

            // And says so where the keypad is told the PIN is finished and it is wrong, rather
            // than leaving someone typing at a prompt that never answers.
            typing.setOnEditorActionListener((field, action, key) -> {
                if (!matches(context, account, typing.getText().toString())) {
                    Utils.showToastShort("Wrong PIN");
                    typing.setText("");
                }
                return true;
            });

            likeAnUnlockScreen(prompt, typing);
            prompt.show();

            // Wired after showing, so that a finger that is not recognised leaves the prompt
            // where it is rather than closing it, which is what a button does on its own.
            Button fingerprint = prompt.getButton(AlertDialog.BUTTON_NEUTRAL);
            if (fingerprint != null) {
                fingerprint.setOnClickListener(tapped ->
                        askForAFinger(context, () -> {
                            prompt.dismiss();
                            then.run();
                        }));
            }
        } catch (Exception ex) {
            // A lock that cannot be drawn must not become a door that cannot be opened.
            Logger.printInfo(() -> "pin: could not ask for the PIN: " + ex);
            then.run();
        }
    }

    /** @return Whether the PIN is asked for when the app is opened, not only when switching. */
    public static boolean asksAtStart(Context context, @Nullable String account) {
        SharedPreferences store = syncs(context, account);
        return store != null && store.getBoolean(AT_START, false);
    }

    /**
     * Covers the app with the PIN once it has opened.
     *
     * <p>Put over a screen the app has already built, rather than in front of the building of
     * it. Stopping the app first is how Sync's own login lock works and it cannot be copied:
     * an activity stopped before it sets a content view has no window of its own, so a prompt
     * of ours becomes the only window the app has, and when that goes — a tap beside it, or a
     * foldable merely being opened — the app has no window at all and stops answering touches
     * until it is force stopped. Sync gets away with it because a fingerprint prompt is the
     * system's window and goes on taking input.
     *
     * <p>So the cover goes on top instead: opaque and full screen, so nothing shows through,
     * and over an app that is whole underneath it. The cost is that failing to draw it leaves
     * the app open rather than shut, which is the right way round for something that can
     * otherwise brick it.
     */
    public static void atAppOpen(Activity activity) {
        try {
            if (!isPatchIncluded() || activity == null) {
                return;
            }
            unlocking = null;
            if (!isSet(activity, null) || !asksAtStart(activity, null)) {
                return;
            }
            if (wayInAnswered) {
                // Answered already this run; the screen has merely been built again.
                return;
            }
            if (alreadyProved(activity, null)) {
                // Changing account has just asked for this very PIN and been answered.
                wayInAnswered = true;
                return;
            }

            // Once the activity has finished building, which is what gives it its own window.
            new Handler(Looper.getMainLooper()).post(() -> {
                if (activity.isFinishing() || activity.isDestroyed()) {
                    return;
                }
                cover(activity);
            });
        } catch (Exception ex) {
            // A lock that cannot be drawn must not become an app that will not open.
            Logger.printInfo(() -> "pin: could not cover the app with the PIN: " + ex);
        }
    }

    /** The cover itself: everything behind it is hidden until the PIN is right. */
    private static void cover(Activity activity) {
        try {
            final EditText typing = digits(activity, "PIN");
            boolean offerAFinger = eitherWillDo(activity, null) && fingerprintIsOn(activity, null);

            final Dialog lock = new Dialog(activity);
            lock.requestWindowFeature(Window.FEATURE_NO_TITLE);
            lock.setCancelable(false);
            lock.setContentView(behind(activity, typing, offerAFinger));

            Window window = lock.getWindow();
            if (window != null) {
                window.setBackgroundDrawable(new ColorDrawable(behindIsHidden(activity)));
                window.setLayout(WindowManager.LayoutParams.MATCH_PARENT,
                        WindowManager.LayoutParams.MATCH_PARENT);
                window.setSoftInputMode(
                        WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
            }

            typing.addTextChangedListener(new TextWatcher() {
                @Override
                public void beforeTextChanged(CharSequence text, int from, int was, int will) {}

                @Override
                public void onTextChanged(CharSequence text, int from, int before, int count) {}

                @Override
                public void afterTextChanged(Editable typed) {
                    if (typed.length() >= FEWEST && matches(activity, null, typed.toString())) {
                        wayInAnswered = true;
                        lock.dismiss();
                    }
                }
            });

            typing.setOnEditorActionListener((field, action, key) -> {
                if (!matches(activity, null, typing.getText().toString())) {
                    Utils.showToastShort("Wrong PIN");
                    typing.setText("");
                }
                return true;
            });

            lock.findViewById(THE_FINGER).setOnClickListener(tapped ->
                    askForAFinger(activity, () -> {
                        wayInAnswered = true;
                        lock.dismiss();
                    }));
            lock.findViewById(THE_WAY_OUT).setOnClickListener(tapped -> {
                lock.dismiss();
                activity.finish();
            });

            typing.requestFocus();
            lock.show();
        } catch (Throwable ex) {
            Logger.printInfo(() -> "pin: could not draw the cover: " + ex);
        }
    }

    /** @return The colour the app's own screens are drawn on, so that nothing shows through. */
    private static int behindIsHidden(Context context) {
        try {
            TypedValue found = new TypedValue();
            if (context.getTheme().resolveAttribute(android.R.attr.colorBackground, found, true)) {
                if (found.resourceId != 0) {
                    return context.getResources().getColor(found.resourceId, context.getTheme());
                }
                return found.data;
            }
        } catch (Throwable ignored) {
            // Falls through to something that is at least opaque.
        }
        return Color.BLACK;
    }

    /** What the cover holds: a lock, what it is asking, somewhere to type, and the ways out. */
    private static View behind(Context context, EditText typing, boolean offerAFinger) {
        int edge = Math.round(AN_EDGE * density(context));

        LinearLayout holding = new LinearLayout(context);
        holding.setOrientation(LinearLayout.VERTICAL);
        holding.setGravity(Gravity.CENTER);
        holding.setPadding(edge * 2, edge, edge * 2, edge);

        Drawable lock = glyph(context, A_LOCK);
        if (lock != null) {
            ImageView drawn = new ImageView(context);
            drawn.setImageDrawable(lock);
            int size = Math.round(A_GLYPH * density(context));
            holding.addView(drawn, new LinearLayout.LayoutParams(size, size));
        }

        TextView saying = new TextView(context);
        saying.setText("Enter PIN");
        saying.setTextColor(words(context));
        saying.setTextSize(SAYING);
        saying.setGravity(Gravity.CENTER);
        saying.setPadding(0, edge, 0, edge / 2);
        holding.addView(saying);

        holding.addView(typing, new LinearLayout.LayoutParams(
                Math.round(A_FIELD * density(context)),
                LinearLayout.LayoutParams.WRAP_CONTENT));

        Button finger = new Button(context);
        finger.setId(THE_FINGER);
        finger.setText("Use fingerprint");
        finger.setVisibility(offerAFinger ? View.VISIBLE : View.GONE);
        holding.addView(finger);

        Button out = new Button(context);
        out.setId(THE_WAY_OUT);
        out.setText("Close Sync");
        holding.addView(out);

        // Lying on its side with the keyboard up there is not room for all of it at once, and
        // the way out is the part that would be pushed off.
        ScrollView within = new ScrollView(context);
        within.addView(holding, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));
        within.setFillViewport(true);
        return within;
    }

    /** @return Whether Sync's own fingerprint lock is on for this account. */
    private static boolean fingerprintIsOn(Context context, @Nullable String account) {
        SharedPreferences store = syncs(context, account);
        if (store == null) {
            return false;
        }
        return store.getBoolean(ACCOUNT_LOCK, false) || store.getBoolean(LOGIN_LOCK, false);
    }

    /**
     * Puts Sync's own fingerprint prompt up, which is ours to put up where Sync's reading of
     * the setting has been answered no on its behalf.
     */
    private static void askForAFinger(Context context, Runnable then) {
        try {
            if (!(context instanceof FragmentActivity)) {
                Utils.showToastShort("No fingerprint here");
                return;
            }

            BiometricPrompt prompt = new BiometricPrompt(
                    (FragmentActivity) context,
                    runnable -> new Handler(Looper.getMainLooper()).post(runnable),
                    new BiometricPrompt.b() {
                        @Override
                        public void c(BiometricPrompt.c result) {
                            then.run();
                        }
                    });

            prompt.s(new BiometricPrompt.e.a()
                    .d("Biometric account lock")
                    .c(true)
                    .b(false)
                    .a());
        } catch (Throwable ex) {
            Logger.printInfo(() -> "pin: could not ask for a fingerprint: " + ex);
            Utils.showToastShort("Could not ask for a fingerprint");
        }
    }

    private static boolean matches(Context context, @Nullable String account, String typed) {
        try {
            SharedPreferences store = of(context, account);
            if (store == null) {
                return true;
            }
            String held = store.getString(under(account, PIN), null);
            String salt = store.getString(under(account, SALT), "");
            return held != null && held.equals(hash(typed, salt));
        } catch (Exception ex) {
            Logger.printInfo(() -> "pin: could not check the PIN: " + ex);
            return false;
        }
    }

    /**
     * Wires the row on Sync's Security screen. Its screens are its own fragments, so this is
     * done as a screen finishes loading its rows; a screen without this row is left alone.
     */
    public static void settle(pa.d screen) {
        if (screen == null || !isPatchIncluded()) {
            return;
        }
        try {
            Preference row = screen.y(PIN);
            if (row == null) {
                return;
            }
            say(row);
            row.A0(tapped -> {
                choose(tapped.k(), () -> {
                    say(tapped);
                    settleTheRest(screen, tapped.k());
                });
                return true;
            });
            settleTheRest(screen, row.k());
        } catch (Exception ex) {
            Logger.printInfo(() -> "pin: could not wire the row: " + ex);
        }
    }

    /**
     * Turns the two rows that only mean something beside a PIN on and off with it. Sync colours
     * every row's words as it draws them whatever state the row is in, so one that is off is
     * faded by what draws the screen rather than by being told to be.
     */
    private static void settleTheRest(pa.d screen, Context context) {
        try {
            Preference mode = screen.y(MODE);
            if (mode == null) {
                return;
            }

            Preference atStart = screen.y(AT_START);
            if (atStart != null) {
                atStart.q0(isSet(context, null));
            }

            theModeRow = new WeakReference<>(mode);
            saySoOnTheModeRow(context, mode);
            watchSyncsOwnLocks(context);
        } catch (Exception ex) {
            Logger.printInfo(() -> "pin: could not settle the rows beside the PIN: " + ex);
        }
    }

    /** The row means something only where there are two locks for it to choose between. */
    private static void saySoOnTheModeRow(Context context, Preference mode) {
        mode.q0(isSet(context, null) && fingerprintIsOn(context, null));
    }

    /**
     * Follows Sync's own two switches while the screen is open, so that turning one on stops
     * the row beside them being faded there and then.
     *
     * <p>Watched through the settings file rather than by listening to the rows themselves:
     * those are Sync's, and a listener of ours put on one would displace whatever Sync has on
     * it. Nothing here is unregistered, so the row is held weakly and one listener is kept for
     * the life of the process rather than one per visit to the screen.
     */
    private static void watchSyncsOwnLocks(Context context) {
        SharedPreferences store = syncs(context, null);
        if (store == null) {
            return;
        }

        if (watchingSyncsLocks == null) {
            watchingSyncsLocks = (changed, key) -> {
                if (!ACCOUNT_LOCK.equals(key) && !LOGIN_LOCK.equals(key)) {
                    return;
                }
                Preference mode = theModeRow == null ? null : theModeRow.get();
                if (mode == null) {
                    return;
                }
                // Drawn on the thread that draws, whichever one the change came back on.
                new Handler(Looper.getMainLooper())
                        .post(() -> saySoOnTheModeRow(mode.k(), mode));
            };
        }

        store.unregisterOnSharedPreferenceChangeListener(watchingSyncsLocks);
        store.registerOnSharedPreferenceChangeListener(watchingSyncsLocks);
    }

    private static void say(Preference row) {
        boolean already = isSet(row.k(), null);
        row.D0(already
                ? "Set. Asked for when this account is opened"
                : "Not set. Asked for when this account is opened, beside any fingerprint");
    }

    /** Sets, changes or clears the PIN of the account whose settings are being looked at. */
    public static void choose(Context context, Runnable afterwards) {
        try {
            boolean already = isSet(context, null);
            final EditText typing = digits(context, already ? "New PIN" : "PIN");

            AlertDialog.Builder asking = new AlertDialog.Builder(context)
                    .setTitle(already ? "Change PIN" : "Set PIN")
                    .setView(around(context, typing))
                    .setPositiveButton("Save", (dialog, which) -> {
                        String typed = typing.getText().toString().trim();
                        if (typed.length() < FEWEST) {
                            Utils.showToastShort("A PIN is at least " + FEWEST + " digits");
                            return;
                        }
                        keep(context, typed);
                        afterwards.run();
                    })
                    .setNegativeButton("Cancel", null);

            Drawable lock = glyph(context, A_LOCK);
            if (lock != null) {
                asking.setIcon(lock);
            }

            if (already) {
                asking.setNeutralButton("Remove", (dialog, which) -> {
                    clear(context);
                    afterwards.run();
                });
            }

            AlertDialog prompt = asking.create();
            likeAnUnlockScreen(prompt, typing);
            prompt.show();
        } catch (Exception ex) {
            Logger.printInfo(() -> "pin: could not offer to set a PIN: " + ex);
        }
    }

    /**
     * Dresses a prompt the way the device's own unlock screen is dressed: the keypad already up
     * rather than waiting for the field to be tapped, and the screen behind it blurred where the
     * device will do that and darkened where it will not.
     */
    private static void likeAnUnlockScreen(AlertDialog prompt, EditText typing) {
        Context context = typing.getContext();
        Window window = prompt.getWindow();
        if (window == null) {
            return;
        }

        // Both are needed: the one covers the prompt appearing, the other covers the field
        // being the thing the keypad is for.
        window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
        typing.requestFocus();
        prompt.setOnShowListener(shown -> {
            InputMethodManager keypad = (InputMethodManager)
                    context.getSystemService(Context.INPUT_METHOD_SERVICE);
            if (keypad != null) {
                // Asked for again once there is a window to ask from, since a prompt that
                // arrives with the screen is sometimes shown before anything can be focused.
                typing.post(() -> keypad.showSoftInput(typing, InputMethodManager.SHOW_IMPLICIT));
            }
        });

        WindowManager.LayoutParams held = window.getAttributes();

        boolean blurring = false;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            try {
                WindowManager manager =
                        (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
                // The device may have it turned off, for battery or for want of a GPU that
                // will do it, and then the flag draws nothing at all.
                blurring = manager != null && manager.isCrossWindowBlurEnabled();
                if (blurring) {
                    window.addFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
                    held.setBlurBehindRadius(Math.round(A_BLUR * density(context)));
                }
            } catch (Throwable ex) {
                Logger.printInfo(() -> "pin: could not blur behind the prompt: " + ex);
                blurring = false;
            }
        }

        // Darkened as well, less so where the blur is doing most of the work. Where the device
        // will not blur this is the whole of it, which is what Sync's own dialogs look like.
        window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        held.dimAmount = blurring ? DIM_BESIDE_BLUR : DIM_ALONE;
        window.setAttributes(held);
    }

    private static void keep(Context context, String pin) {
        try {
            SharedPreferences store = of(context, null);
            if (store == null) {
                return;
            }
            byte[] grain = new byte[16];
            new SecureRandom().nextBytes(grain);
            String salt = toHex(grain);
            store.edit()
                    .putString(under(null, SALT), salt)
                    .putString(under(null, PIN), hash(pin, salt))
                    .apply();
            Utils.showToastShort("PIN set");
        } catch (Exception ex) {
            Logger.printInfo(() -> "pin: could not keep the PIN: " + ex);
        }
    }

    private static void clear(Context context) {
        try {
            SharedPreferences store = of(context, null);
            if (store != null) {
                store.edit().remove(under(null, PIN)).remove(under(null, SALT)).apply();
                Utils.showToastShort("PIN removed");
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "pin: could not remove the PIN: " + ex);
        }
    }

    private static String hash(String pin, String salt) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        return toHex(digest.digest((salt + pin).getBytes(StandardCharsets.UTF_8)));
    }

    private static String toHex(byte[] bytes) {
        StringBuilder written = new StringBuilder(bytes.length * 2);
        for (byte each : bytes) {
            written.append(Character.forDigit((each >> 4) & 0xF, 16));
            written.append(Character.forDigit(each & 0xF, 16));
        }
        return written.toString();
    }

    private static EditText digits(Context context, String hint) {
        EditText typing = new EditText(context);
        typing.setHint(hint);
        typing.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_VARIATION_PASSWORD);
        typing.setSingleLine(true);
        // Centred and spaced out, so that what is typed reads as a PIN rather than as a word.
        typing.setGravity(Gravity.CENTER_HORIZONTAL);
        typing.setTextSize(DIGITS);
        typing.setLetterSpacing(APART);
        // Lying on its side, the keyboard otherwise takes the whole screen for a field of its
        // own and what is being asked goes with it.
        typing.setImeOptions(EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        return typing;
    }

    private static FrameLayout around(Context context, EditText typing) {
        FrameLayout holding = new FrameLayout(context);
        int edge = Math.round(AN_EDGE * density(context));
        holding.setPadding(edge, edge / 2, edge, 0);
        holding.addView(typing);
        return holding;
    }

    /** @return One of the app's own drawables, coloured as the words around it are. */
    @Nullable
    private static Drawable glyph(Context context, String named) {
        try {
            int found = context.getResources()
                    .getIdentifier(named, "drawable", context.getPackageName());
            if (found == 0) {
                return null;
            }
            Drawable drawn = context.getResources().getDrawable(found, context.getTheme());
            if (drawn == null) {
                return null;
            }
            drawn = drawn.mutate();
            drawn.setTint(words(context));
            return drawn;
        } catch (Throwable ex) {
            Logger.printInfo(() -> "pin: no lock to draw beside the prompt: " + ex);
            return null;
        }
    }

    /** @return What colour the screen's own words are, whichever theme is on. */
    private static int words(Context context) {
        try {
            TypedValue found = new TypedValue();
            if (!context.getTheme()
                    .resolveAttribute(android.R.attr.textColorPrimary, found, true)) {
                return Color.GRAY;
            }
            if (found.resourceId != 0) {
                return context.getResources()
                        .getColorStateList(found.resourceId, context.getTheme())
                        .getDefaultColor();
            }
            return found.data;
        } catch (Throwable ex) {
            return Color.GRAY;
        }
    }

    private static float density(Context context) {
        return context.getResources().getDisplayMetrics().density;
    }
}
