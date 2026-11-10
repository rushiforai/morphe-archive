package app.morphe.extension.syncforreddit.api;

import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.InputType;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;

import androidx.preference.Preference;

import app.morphe.extension.shared.Logger;

/**
 * Lets the four things the app identifies itself with be typed into the settings, and names who
 * wrote the patches beside the people Sync credits.
 *
 * <p>Sync's own screens have no row for typing into, so each of these is an ordinary row that
 * opens a dialog when tapped, the same way the translation screen asks for a service key.
 *
 * <p>Sync's settings screens are its own fragments, so unlike the translation screen there is
 * nowhere of ours to run from. This is done as a screen finishes loading its rows, which every
 * screen passes through; a screen without these rows is left alone.
 *
 * @noinspection unused
 */
public final class ClientRows {
    /** How far the typing field is held off the edges of the dialog, in dp. */
    private static final int AN_EDGE = 20;

    /** Who wrote the patches, and where they live. */
    private static final String AUTHOR = "https://github.com/RashKash103";
    private static final String REPOSITORY = "https://github.com/RashKash103/sync-up";

    private ClientRows() {}

    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    public static void settle(pa.d screen) {
        if (screen == null || !isPatchIncluded()) {
            return;
        }
        try {
            if (screen.y(ClientSettings.CLIENT_ID) == null) {
                // Some other screen of the settings; nothing here belongs to it.
                return;
            }

            // The two ids say only whether they are set, since what they are is of no use at a
            // glance and they are the one part of this worth not putting on the screen.
            typedInto(screen, ClientSettings.CLIENT_ID, "OAuth client ID",
                    "Sync signs in to Reddit with this.", true);
            typedInto(screen, ClientSettings.IMGUR_CLIENT_ID, "Imgur client ID",
                    "Used when you upload a picture to Imgur.", true);
            typedInto(screen, ClientSettings.REDIRECT_URI, "Redirect URI",
                    "Where Reddit sends you back to after signing in.", false);
            typedInto(screen, ClientSettings.USER_AGENT, "User agent",
                    "How Sync introduces itself to Reddit.", false);

            opens(screen, "sync_up_credit", AUTHOR);
            opens(screen, "sync_up_repository", REPOSITORY);
        } catch (Exception ex) {
            Logger.printInfo(() -> "client: could not make the rows something to type into: " + ex);
        }
    }

    /** Makes a row open an address when it is tapped. */
    private static void opens(pa.d screen, String key, String address) {
        try {
            Preference row = screen.y(key);
            if (row == null) {
                return;
            }
            row.A0(tapped -> {
                try {
                    Intent going = new Intent(Intent.ACTION_VIEW, Uri.parse(address));
                    going.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    tapped.k().startActivity(going);
                } catch (Exception ex) {
                    Logger.printInfo(() -> "client: could not open " + address + ": " + ex);
                }
                return true;
            });
        } catch (Exception ex) {
            Logger.printInfo(() -> "client: could not wire " + key + ": " + ex);
        }
    }

    /**
     * @param hide Whether the row says only that something is set rather than what it is.
     */
    private static void typedInto(pa.d screen, String key, String title, String describing,
                                  boolean hide) {
        try {
            Preference row = screen.y(key);
            if (row == null) {
                return;
            }

            say(row, key, describing, hide);
            row.A0(tapped -> {
                ask(tapped, key, title, describing, hide);
                return true;
            });
        } catch (Exception ex) {
            Logger.printInfo(() -> "client: could not make " + key + " typeable: " + ex);
        }
    }

    /**
     * What the row reads under its name. One left at what it came with is called the default
     * rather than called unset: it is working, and a row reading "not set" beside a signed-in
     * account would read as a fault.
     */
    private static void say(Preference row, String key, String describing, boolean hide) {
        String set = ClientSettings.text(key, "");
        if (set.isEmpty()) {
            row.D0("Not set. " + describing);
            return;
        }

        boolean isDefault = ClientSettings.isDefault(key);
        if (hide) {
            row.D0((isDefault ? "Using the default. " : "Set. ") + describing);
        } else {
            row.D0(isDefault ? set + " (default)" : set);
        }
    }

    private static void ask(Preference row, String key, String title, String describing,
                            boolean hide) {
        Context context = row.k();
        final EditText typing = new EditText(context);
        typing.setText(ClientSettings.text(key, ""));
        typing.setSelection(typing.getText().length());
        typing.setHint(describing);
        typing.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        typing.setSingleLine(true);

        // Held off the edges of the dialog, which a bare field is not.
        FrameLayout around = new FrameLayout(context);
        int edge = Math.round(AN_EDGE * context.getResources().getDisplayMetrics().density);
        around.setPadding(edge, edge / 2, edge, 0);
        around.addView(typing);

        AlertDialog.Builder asking = new AlertDialog.Builder(context)
                .setTitle(title)
                .setView(around)
                .setPositiveButton("Save", (dialog, which) -> {
                    ClientSettings.set(key, typing.getText().toString());
                    say(row, key, describing, hide);
                })
                .setNegativeButton("Cancel", null);

        // Only where there is something to go back to that is not already what is in use: a
        // row sitting at what the build gave has nothing to put back.
        if (!ClientSettings.isDefault(key)) {
            String back = ClientSettings.hasDefault(key) ? "Default" : "Clear";
            asking.setNeutralButton(back, (dialog, which) -> {
                ClientSettings.reset(key);
                say(row, key, describing, hide);
            });
        }

        AlertDialog prompt = asking.create();
        withTheKeyboardUp(prompt, typing);
        prompt.show();
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
