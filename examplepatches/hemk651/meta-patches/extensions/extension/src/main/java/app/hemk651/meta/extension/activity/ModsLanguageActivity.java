/*
 * Meta Patches — language activity.
 *
 * Forked from InstaFL activity/ifl_a_language.java
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * rebranded to Meta Patches. English is bundled; further translations can be
 * added by the patch bundle without changing the extension.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.meta.extension.activity;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.widget.LinearLayout;

import java.util.Locale;

import app.hemk651.meta.extension.ModsUi;

/**
 * Menu language selection. Stores the selected locale in the menu
 * preferences and recreates the menu activities.
 */
public class ModsLanguageActivity extends Activity {

    private static final String PREFS = "mods_prefs";
    private static final String PREF_LANGUAGE = "mods_language";

    /** Locales the menu can be shown in. "System" follows the device. */
    private static final String[] LANGUAGE_CODES = {
            "system", "en", "de", "es", "fr", "hi", "id", "it", "nl", "pl",
            "pt", "ru", "th", "tr"
    };

    private ModsUi ui;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ui = new ModsUi(this);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(ui.background());

        root.addView(ui.pageTitle("Language"));

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int side = ui.dp(16);
        content.setPadding(side, 0, side, side);

        String selected = getSelectedLanguage(this);

        for (String code : LANGUAGE_CODES) {
            String title = "system".equals(code) ? "System default" : displayLanguage(code);
            String subtitle = "system".equals(code)
                    ? "Follow the device language" : code;
            boolean isSelected = code.equals(selected);
            content.addView(ui.tile(
                    isSelected ? "●" : "○",
                    title,
                    subtitle,
                    null,
                    v -> {
                        selectLanguage(code);
                        recreate();
                    }));
        }

        root.addView(ui.pageContent(content));
        ModsUi.applySystemBarInsets(root);
        setContentView(root);
    }

    private String displayLanguage(String code) {
        Locale locale = new Locale(code);
        return locale.getDisplayLanguage(locale);
    }

    /** Currently selected language code, "system" by default. */
    public static String getSelectedLanguage(Context ctx) {
        SharedPreferences prefs = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        return prefs.getString(PREF_LANGUAGE, "system");
    }

    /** Persists the language selection. */
    public static void selectLanguage(Context ctx, String code) {
        SharedPreferences prefs = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        prefs.edit().putString(PREF_LANGUAGE, code).apply();
    }

    private void selectLanguage(String code) {
        selectLanguage(this, code);
    }
}
