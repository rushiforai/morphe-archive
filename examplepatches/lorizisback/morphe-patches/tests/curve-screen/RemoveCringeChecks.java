package app.local.curve.screen.test;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.LocaleList;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.lang.reflect.Method;
import java.util.Locale;
import org.json.JSONObject;
import java.nio.charset.StandardCharsets;

/** Executes the optional copy paths using real APK resources and native view inflation. */
final class RemoveCringeChecks {
    static void run(Activity activity, Class<?> settings, SharedPreferences preferences) throws Exception {
        Class<?> helper = activity.getClassLoader().loadClass("app.local.extension.curve.RemoveCringe");
        Method getString = helper.getMethod("getString", Resources.class, int.class);
        Method getText = helper.getMethod("getText", Resources.class, int.class);
        Method setText = helper.getMethod("setText", TextView.class, int.class);
        JSONObject catalog;
        try (java.io.InputStream input = activity.getAssets().open("morphe_remove_cringe.json")) {
            java.io.ByteArrayOutputStream output = new java.io.ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            for (int n; (n = input.read(buffer)) != -1;) output.write(buffer, 0, n);
            catalog = new JSONObject(new String(output.toByteArray(), StandardCharsets.UTF_8));
        }
        String[] locales = {"en-GB", "de-DE", "es-ES", "fr-FR", "it-IT", "lt-LT", "nb-NO"};
        for (String tag : locales) {
            Configuration config = new Configuration(activity.getResources().getConfiguration());
            Locale locale = Locale.forLanguageTag(tag);
            config.setLocales(new LocaleList(locale));
            Context context = activity.createConfigurationContext(config);
            Resources resources = context.getResources();
            JSONObject replacements = catalog.getJSONObject("strings").getJSONObject(locale.getLanguage());
            for (boolean enabled : new boolean[]{true, false, true}) {
                require(preferences.edit().putBoolean("remove_cringe", enabled).commit(), "Could not set Cringe fixture");
                settings.getMethod("initialize", Context.class).invoke(null, context);
                java.util.Iterator<String> names = replacements.keys();
                while (names.hasNext()) {
                    String name = names.next();
                    if (name.startsWith("morphe_")) continue;
                    int id = resources.getIdentifier(name, "string", activity.getPackageName());
                    require(id != 0, "Missing resource " + name);
                    String expected = enabled ? replacements.getString(name) : resources.getString(id);
                    require(expected.equals(getString.invoke(null, resources, id)), "Wrong string " + tag + " " + name);
                    require(expected.contentEquals((CharSequence) getText.invoke(null, resources, id)), "Wrong text " + name);
                }
                for (String name : new String[]{"go_back_in_time", "magic_link_expired_advisory", "fronted_main_title", "flex_home_title"}) {
                    int id = resources.getIdentifier(name, "string", activity.getPackageName());
                    require(resources.getString(id).equals(getString.invoke(null, resources, id)), "Protected term changed " + name);
                }
                int backup = resources.getIdentifier("backup_card_title", "string", activity.getPackageName());
                TextView label = new TextView(context);
                setText.invoke(null, label, backup);
                require(label.getText().toString().equals(getString.invoke(null, resources, backup)), "TextView resource path failed");
                require("Merchant called Killer FX".equals(helper.getMethod("title", String.class)
                    .invoke(null, "Merchant called Killer FX")), "Unrelated title changed");
                String title = (String) helper.getMethod("title", String.class).invoke(null, "Killer FX");
                require(title.equals(enabled ? replacements.getString("killer_fx_title") : "Killer FX"), "Server title toggle failed");
                String backupTitle = (String) helper.getMethod("title", String.class).invoke(null, "Anti-Emb");
                require(backupTitle.equals(enabled ? replacements.getString("backup_card_title") : "Anti-Emb"),
                    "Abbreviated backup title toggle failed " + tag);
            }
        }
        settings.getMethod("initialize", Context.class).invoke(null, activity.getApplicationContext());
        // This actual Curve layout reads titles from TypedArray, not through our test helper.
        int layout = activity.getResources().getIdentifier("fragment_smart_rules_list", "layout", activity.getPackageName());
        for (boolean enabled : new boolean[]{true, false}) {
            require(preferences.edit().putBoolean("remove_cringe", enabled).commit(), "Could not set layout fixture");
            settings.getMethod("initialize", Context.class).invoke(null, activity.getApplicationContext());
            View view = activity.getLayoutInflater().inflate(layout, null, false);
            int titleId = activity.getResources().getIdentifier("smart_rules_list_title", "string", activity.getPackageName());
            String expected = (String) getString.invoke(null, activity.getResources(), titleId);
            require(containsText(view, expected), "Native XML title did not follow toggle");
            Object toolbar = activity.getClassLoader().loadClass("com.curve.design.toolbar.CrvToolbar")
                .getConstructor(Context.class).newInstance(activity);
            int menuId = activity.getResources().getIdentifier("bottom_navigation_menu_with_launchpad", "menu", activity.getPackageName());
            toolbar.getClass().getMethod("inflateMenu", int.class).invoke(toolbar, menuId);
            android.view.Menu menu = (android.view.Menu) toolbar.getClass().getMethod("getMenu").invoke(toolbar);
            int itemId = activity.getResources().getIdentifier("tab_launchpad", "id", activity.getPackageName());
            int stringId = activity.getResources().getIdentifier("tab_launchpad", "string", activity.getPackageName());
            require(menu.findItem(itemId).getTitle().toString().equals(getString.invoke(null, activity.getResources(), stringId)),
                "Native navigation menu title did not follow toggle");
        }
        System.out.println("PASS Remove Cringe: seven locales, all curated resources, protected names, native XML, TextView, server titles and on/off/on");
    }
    private static boolean containsText(View view, String expected) {
        if (view instanceof TextView && expected.contentEquals(((TextView) view).getText())) return true;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) if (containsText(group.getChildAt(i), expected)) return true;
        }
        return false;
    }
    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
