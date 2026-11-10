package app.morphe.extension.syncforreddit.api;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Says so when the app has no client id, which is the one thing it cannot run without.
 *
 * <p>A copy can now be built without one, so a copy can now be installed without one, and what
 * that looks like from the inside is every sign-in failing with nothing to say why. This is
 * asked on the way in instead: on the very first run as part of the setup, before there is any
 * question of signing in, and as a plain notice afterwards with the way to the row that holds
 * it.
 *
 * <p>Where the build was given a client id none of this appears at all.
 *
 * @noinspection unused
 */
public final class ClientPrompt {
    /** Where getting one is written down. */
    private static final String HOW_TO =
            "https://github.com/RashKash103/sync-up#-getting-started";

    /** Sync's settings, and the screen of them these rows are on. */
    private static final String SETTINGS =
            "com.laurencedawson.reddit_sync.ui.activities.PreferencesActivity";
    private static final int THE_OTHER_SCREEN = 2;

    /** How far the typing field is held off the edges of the dialog, in dp. */
    private static final int AN_EDGE = 20;

    /** Asked once a run: it is the same answer every time, and twice over is nagging. */
    private static volatile boolean asked;

    private ClientPrompt() {}

    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /**
     * On the app's first run, where Sync walks through its own setup. Asked here so that it is
     * answered before anything tries to sign in.
     */
    public static void onboarding(Activity activity) {
        show(activity, true);
    }

    /** On any other run. */
    public static void atStart(Activity activity) {
        show(activity, false);
    }

    private static void show(Activity activity, boolean settingUp) {
        try {
            if (!isPatchIncluded() || asked || activity == null) {
                return;
            }
            if (ClientSettings.hasClientId()) {
                // Built with one, or given one since: nothing to say.
                return;
            }

            // On the next turn of the main loop rather than now: this is called from inside
            // the activity's own onCreate, where there is nothing yet for a dialog to sit on.
            // Reaching for the window here instead would settle its features too early and
            // take down any activity that asks for one of its own afterwards.
            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    // Sync opens through an activity that routes on and finishes, and a
                    // dialog belongs to a window that is still there. Whichever activity is
                    // the one left standing is the one that asks, so this is marked only once
                    // there is something to ask on.
                    if (activity.isFinishing() || activity.isDestroyed() || asked) {
                        return;
                    }
                    asked = true;
                    if (settingUp) {
                        askForIt(activity);
                    } else {
                        sayItIsMissing(activity);
                    }
                } catch (Exception ex) {
                    Logger.printInfo(() -> "client: could not say the id is missing: " + ex);
                }
            });
        } catch (Exception ex) {
            Logger.printInfo(() -> "client: could not look at whether an id is set: " + ex);
        }
    }

    /** The first run: the id is asked for outright, since nothing works without it. */
    private static void askForIt(Activity activity) {
        final EditText typing = new EditText(activity);
        typing.setHint("Your OAuth client ID");
        typing.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        typing.setSingleLine(true);

        AlertDialog prompt = new AlertDialog.Builder(activity)
                .setTitle("One thing first")
                .setMessage("Sync needs an OAuth client ID to sign in to Reddit.\n\nPaste "
                        + "one below, or add it later under Settings > Everything else > "
                        + "Sync Up client.")
                .setView(around(activity, typing))
                .setPositiveButton("Save", (dialog, which) ->
                        ClientSettings.set(ClientSettings.CLIENT_ID, typing.getText().toString()))
                .setNeutralButton("How to get one", (dialog, which) -> openTheInstructions(activity))
                .setNegativeButton("Later", null)
                .setCancelable(false)
                .create();

        withTheKeyboardUp(prompt, typing);
        prompt.show();
    }

    /** Any later run: what is wrong, and the way to the row that fixes it. */
    private static void sayItIsMissing(Activity activity) {
        new AlertDialog.Builder(activity)
                .setTitle("No OAuth client ID")
                .setMessage("Sync needs an OAuth client ID to sign in to Reddit.\n\nYou can "
                        + "add one under Settings > Everything else > Sync Up client.")
                .setPositiveButton("Set it now", (dialog, which) -> openTheRow(activity))
                .setNeutralButton("How to get one", (dialog, which) -> openTheInstructions(activity))
                .setNegativeButton("Later", null)
                .show();
    }

    /** Opens Sync's own settings at the screen holding the row, with the row picked out. */
    private static void openTheRow(Activity activity) {
        try {
            Intent intent = new Intent(activity, Class.forName(SETTINGS));
            intent.putExtra("mode", THE_OTHER_SCREEN);
            intent.putExtra("highlight", ClientSettings.CLIENT_ID);
            activity.startActivity(intent);
        } catch (Throwable ex) {
            Logger.printInfo(() -> "client: could not open the settings: " + ex);
            // The address its own settings answer to, where naming the screen did not work.
            open(activity, "sync-settings://" + THE_OTHER_SCREEN + "-" + ClientSettings.CLIENT_ID);
        }
    }

    private static void openTheInstructions(Activity activity) {
        open(activity, HOW_TO);
    }

    private static void open(Activity activity, String address) {
        try {
            activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(address)));
        } catch (Exception ex) {
            Logger.printInfo(() -> "client: could not open " + address + ": " + ex);
            Utils.showToastShort("Could not open " + address);
        }
    }

    private static FrameLayout around(Context context, EditText typing) {
        FrameLayout holding = new FrameLayout(context);
        int edge = Math.round(AN_EDGE * context.getResources().getDisplayMetrics().density);
        holding.setPadding(edge, edge / 2, edge, 0);
        holding.addView(typing);
        return holding;
    }

    /** Opens the keyboard with the dialog, rather than waiting for the field to be tapped. */
    private static void withTheKeyboardUp(AlertDialog prompt, EditText typing) {
        try {
            if (prompt.getWindow() != null) {
                prompt.getWindow().setSoftInputMode(
                        WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
            }
            typing.requestFocus();
            prompt.setOnShowListener(shown -> {
                InputMethodManager keyboard = (InputMethodManager)
                        typing.getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
                if (keyboard != null) {
                    typing.post(() ->
                            keyboard.showSoftInput(typing, InputMethodManager.SHOW_IMPLICIT));
                }
            });
        } catch (Exception ex) {
            Logger.printInfo(() -> "client: could not open the keyboard with the dialog: " + ex);
        }
    }
}
