package app.morphe.extension.syncforreddit.translate;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.InputType;
import android.widget.EditText;
import android.widget.FrameLayout;

import androidx.preference.Preference;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;

/**
 * The translation settings, as a screen of Sync's own settings.
 *
 * <p>Every screen Sync has is a fragment of this shape: it says which screen of preferences to
 * load and lets the app do the rest, which is what keeps it looking like the others. Sync finds
 * the fragment for a screen by an id, in a list of its own that nothing outside it can be
 * reached from, so the patch adds this one to that list.
 *
 * @noinspection unused
 */
public class TranslationScreen extends pa.d {
    /** How tall a field for more than one line starts out. */
    private static final int MANY_LINES = 3;

    /** How far a typed field is held off the edges of its dialog, before the screen's density. */
    private static final int AN_EDGE = 20;

    /**
     * What the row on the front page of the settings points at. It matches the integer the patch
     * adds to the app's resources, and has to be a number no screen of Sync's own uses.
     */
    public static final int ID = 8100;

    /** The rows that belong to one service, which are of no use while another is chosen. */
    private static final String[] DEEPL_ROWS = {
            TranslationSettings.DEEPL_KEY,
            TranslationSettings.DEEPL_USAGE,
            TranslationSettings.DEEPL_CONTEXT,
            TranslationSettings.DEEPL_INSTRUCTIONS_ON,
            TranslationSettings.DEEPL_INSTRUCTIONS,
    };

    private static final String[] GOOGLE_ROWS = {TranslationSettings.GOOGLE_KEY};

    /** Kept so that choosing a service can show its rows without leaving the screen. */
    private SharedPreferences.OnSharedPreferenceChangeListener watching;

    @Override
    public void C3(Bundle state, String rootKey) {
        t3(ResourceUtils.getIdentifier(ResourceType.XML, "cat_translation"));
        super.C3(state, rootKey);

        showWhatIsInUse();
        watchForAChangeOfService();
        askWhatIsLeft();
        showWhatIsKept();
        letThemTypeThings();
    }

    /**
     * A service's settings stay where they are whichever service is chosen, so that what the
     * others offer can still be seen, but only the one in use can be set: the rest are faded.
     */
    private void showWhatIsInUse() {
        try {
            String service = TranslationSettings.service(Utils.getContext());
            enable(DEEPL_ROWS, TranslationSettings.DEEPL.equals(service));
            enable(GOOGLE_ROWS, TranslationSettings.GOOGLE.equals(service));
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not settle which translation rows apply: " + ex);
        }
    }

    private void enable(String[] keys, boolean enabled) {
        for (String key : keys) {
            Preference row = y(key);
            if (row != null) {
                row.q0(enabled);
            }
        }
    }

    /**
     * Says how much room the kept translations take, and throws them away when asked. Old ones
     * are tidied away first, so what is shown is what is actually still being kept.
     */
    private void showWhatIsKept() {
        try {
            Context context = Utils.getContext();
            Preference row = y(TranslationSettings.CACHE_CLEAR);
            if (row == null) {
                return;
            }
            TranslationCache.tidy(context);
            row.D0(TranslationCache.size(context));
            row.A0(tapped -> {
                TranslationCache.clear(context);
                tapped.D0(TranslationCache.size(context));
                return true;
            });
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not show what translations are kept: " + ex);
        }
    }

    /**
     * Asks DeepL what is left of the key's allowance as the screen opens, so that it is simply
     * there to be read rather than something to go and check.
     */
    private void askWhatIsLeft() {
        try {
            Preference row = y(TranslationSettings.DEEPL_USAGE);
            if (!(row instanceof UsagePreference)) {
                return;
            }
            UsagePreference usage = (UsagePreference) row;

            // What was heard last time, until this time's answer arrives.
            String before = DeepLUsage.lastSaid();
            usage.D0(before == null ? "Checking\u2026" : before);

            DeepLUsage.ask(
                    TranslationSettings.text(Utils.getContext(), TranslationSettings.DEEPL_KEY, ""),
                    (described, used, allowed) -> {
                        usage.D0(described);
                        UsagePreference.say(usage, used, allowed);
                    });
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not ask what allowance is left: " + ex);
        }
    }

    /**
     * Choosing a service shows its rows there and then, rather than the next time the screen is
     * opened. Watched through the settings themselves, which says when any of them is written.
     */
    /**
     * A key and what a service is told are typed rather than chosen, and Sync's own screens have
     * no row for typing into. So the row asks for it: tapped, it opens the same kind of dialog
     * the app uses elsewhere, and says whether something is set rather than showing it.
     */
    private void letThemTypeThings() {
        typedInto(TranslationSettings.DEEPL_KEY, "DeepL API key", false);
        typedInto(TranslationSettings.GOOGLE_KEY, "Google Cloud API key", false);
        typedInto(TranslationSettings.DEEPL_INSTRUCTIONS, "Custom instructions", true);
    }

    /**
     * @param overLines Whether what is typed runs to more than one line, as instructions do:
     *                  one to a line, since that is how the service is given them.
     */
    private void typedInto(String key, String title, boolean overLines) {
        try {
            Preference row = y(key);
            if (row == null) {
                return;
            }

            sayWhetherItIsSet(row, key, overLines);
            row.A0(tapped -> {
                ask(tapped, key, title, overLines);
                return true;
            });
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not make " + key + " something to type into: " + ex);
        }
    }

    private void ask(Preference row, String key, String title, boolean overLines) {
        Context context = row.k();
        EditText typing = new EditText(context);
        typing.setText(TranslationSettings.text(context, key, ""));
        typing.setSelection(typing.getText().length());
        typing.setHint(overLines ? "One instruction to a line" : "Paste the key");

        if (overLines) {
            typing.setInputType(InputType.TYPE_CLASS_TEXT
                    | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
            typing.setMinLines(MANY_LINES);
        } else {
            typing.setInputType(InputType.TYPE_CLASS_TEXT
                    | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
            typing.setSingleLine(true);
        }

        // Held off the edges of the dialog, which a bare field is not.
        FrameLayout around = new FrameLayout(context);
        int edge = Math.round(AN_EDGE * context.getResources().getDisplayMetrics().density);
        around.setPadding(edge, edge / 2, edge, 0);
        around.addView(typing);

        new AlertDialog.Builder(context)
                .setTitle(title)
                .setView(around)
                .setPositiveButton("Save", (dialog, which) -> {
                    TranslationSettings.store(context).edit()
                            .putString(key, typing.getText().toString().trim())
                            .apply();
                    sayWhetherItIsSet(row, key, overLines);
                    if (TranslationSettings.DEEPL_KEY.equals(key)) {
                        // A new key has an allowance of its own to report.
                        askWhatIsLeft();
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    /** Says whether there is something there, never what it is: a key is not for showing. */
    private void sayWhetherItIsSet(Preference row, String key, boolean overLines) {
        String held = TranslationSettings.text(Utils.getContext(), key, "").trim();
        if (held.isEmpty()) {
            row.D0("Not set");
            return;
        }
        if (!overLines) {
            row.D0("Set");
            return;
        }

        int lines = 0;
        for (String line : held.split("\n")) {
            if (!line.trim().isEmpty()) {
                lines++;
            }
        }
        row.D0(lines == 1 ? "1 instruction" : lines + " instructions");
    }

    private void watchForAChangeOfService() {
        try {
            Context context = Utils.getContext();
            SharedPreferences settings = TranslationSettings.store(context);
            if (settings == null) {
                return;
            }
            if (watching != null) {
                settings.unregisterOnSharedPreferenceChangeListener(watching);
            }
            watching = (changed, key) -> {
                if (TranslationSettings.SERVICE.equals(key)) {
                    showWhatIsInUse();
                }
            };
            settings.registerOnSharedPreferenceChangeListener(watching);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not follow the choice of service: " + ex);
        }
    }

    /**
     * Called where Sync looks up the fragment for a screen.
     *
     * @return This screen where the id is ours, and null for every other, which leaves Sync to
     *         look the id up as it always did.
     */
    /**
     * The name at the top of the screen, looked up the same way and from the same list, which
     * throws for an id it does not know just as the lookup for the fragment does.
     *
     * @return The name where the id is ours, and null for every other.
     */
    public static String titleFor(int id) {
        return id == ID ? "Translation" : null;
    }

    public static pa.d screenFor(int id) {
        try {
            if (id != ID) {
                return null;
            }
            TranslationScreen screen = new TranslationScreen();
            // Given the same argument Sync gives its own, which is what a search term is passed in.
            screen.a3(new Bundle());
            return screen;
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not open the translation settings: " + ex);
            return null;
        }
    }
}
