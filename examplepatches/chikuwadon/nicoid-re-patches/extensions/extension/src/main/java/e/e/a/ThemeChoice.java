package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.view.View;

/** Explicit light/dark selection while retaining the existing Material You path. */
public final class ThemeChoice {
    private static final String KEY = "app_theme";
    private static final String[] VALUES = {"light", "dark", "material"};
    private static final String[] LABELS = {"ライトモード", "ダークモード", "Material You"};
    private static final java.util.WeakHashMap<Activity, String> APPLIED = new java.util.WeakHashMap<>();
    private static boolean watching;
    private static SharedPreferences prefs(Context c) { return PreferenceManager.getDefaultSharedPreferences(c); }
    private static String mode(Context c) {
        SharedPreferences p = prefs(c);
        return ThemeRules.mode(p.getString(KEY, null), p.getBoolean("material_you_mode", false));
    }
    private static boolean systemNight(Context c) {
        return (c.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }
    public static boolean isNight(Context c) { return ThemeRules.night(mode(c), systemNight(c)); }
    public static void apply(Activity a) {
        String selected = mode(a);
        SharedPreferences p = prefs(a);
        boolean material = "material".equals(selected);
        if (!p.contains(KEY) || p.getBoolean("material_you_mode", false) != material)
            p.edit().putString(KEY, selected).putBoolean("material_you_mode", material).commit();
        String style = ThemeRules.style(selected, systemNight(a), android.os.Build.VERSION.SDK_INT);
        int id = a.getResources().getIdentifier(style, "style", a.getPackageName());
        if (id != 0) a.setTheme(id);
        APPLIED.put(a, stamp(a));
        if (!watching) {
            watching = true;
            a.getApplication().registerActivityLifecycleCallbacks(new android.app.Application.ActivityLifecycleCallbacks() {
                public void onActivityCreated(Activity activity, android.os.Bundle state) { }
                public void onActivityStarted(Activity activity) { }
                public void onActivityResumed(Activity activity) {
                    String old = APPLIED.get(activity), current = stamp(activity);
                    if (old != null && !old.equals(current) && !activity.isFinishing()) {
                        APPLIED.put(activity, current);
                        activity.getWindow().getDecorView().post(activity::recreate);
                    }
                }
                public void onActivityPaused(Activity activity) { }
                public void onActivityStopped(Activity activity) { }
                public void onActivitySaveInstanceState(Activity activity, android.os.Bundle state) { }
                public void onActivityDestroyed(Activity activity) { APPLIED.remove(activity); }
            });
        }
    }
    private static String stamp(Context c) { return mode(c) + ":" + isNight(c); }
    public static void settings(PreferenceActivity a) {
        Preference old = a.findPreference("material_you_mode");
        if (old == null) return;
        PreferenceGroup parent = parent(a.getPreferenceScreen(), old);
        if (parent == null) return;
        Preference choice = new Preference(a);
        choice.setKey(KEY); choice.setOrder(old.getOrder());
        choice.setTitle(UiStrings.translate("テーマ"));
        int current = index(mode(a));
        choice.setSummary(UiStrings.translate(LABELS[current]));
        choice.setOnPreferenceClickListener(row -> {
            String[] labels = new String[LABELS.length];
            for (int i = 0; i < labels.length; i++) labels[i] = UiStrings.translate(LABELS[i]);
            AlertDialog dialog = new AlertDialog.Builder(PlaybackSession.dialogContext(a))
                .setTitle(UiStrings.translate("テーマ"))
                .setSingleChoiceItems(labels, index(mode(a)), (d, which) -> {
                    String selected = VALUES[which];
                    prefs(a).edit().putString(KEY, selected).putBoolean("material_you_mode", "material".equals(selected)).commit();
                    d.dismiss(); a.recreate();
                }).setNegativeButton(UiStrings.translate("キャンセル"), null).create();
            PlaybackSession.showDialog(dialog);
            return true;
        });
        parent.removePreference(old); parent.addPreference(choice);
    }
    private static int index(String value) {
        for (int i = 0; i < VALUES.length; i++) if (VALUES[i].equals(value)) return i;
        return 0;
    }
    private static PreferenceGroup parent(PreferenceGroup group, Preference target) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference p = group.getPreference(i);
            if (p == target) return group;
            if (p instanceof PreferenceGroup) {
                PreferenceGroup found = parent((PreferenceGroup)p, target);
                if (found != null) return found;
            }
        }
        return null;
    }
    private static int color(Context c, int attr, int fallback) {
        android.util.TypedValue v = new android.util.TypedValue();
        if (!c.getTheme().resolveAttribute(attr, v, true)) return fallback;
        return v.resourceId == 0 ? v.data : c.getResources().getColor(v.resourceId);
    }
    public static int textColor(View v) { return color(v.getContext(), android.R.attr.textColorPrimary, isNight(v.getContext()) ? 0xffeeeeee : 0xff202124); }
    public static void background(View v) { v.setBackgroundColor(color(v.getContext(), android.R.attr.colorBackground, isNight(v.getContext()) ? 0xff191b20 : 0xffffffff)); }
    public static void button(android.widget.Button b) {
        Context c = b.getContext(); boolean dark = isNight(c);
        int surfaceAttr = c.getResources().getIdentifier("nicoidSurface", "attr", c.getPackageName());
        int surface = color(c, surfaceAttr, dark ? 0xff303238 : 0xffe7e7e7);
        int ink = textColor(b);
        if ("material".equals(mode(c)) && android.os.Build.VERSION.SDK_INT >= 31) {
            int id = c.getResources().getIdentifier(dark ? "system_accent1_700" : "system_accent1_100", "color", "android");
            if (id != 0) surface = c.getResources().getColor(id);
            id = c.getResources().getIdentifier(dark ? "system_neutral1_50" : "system_neutral1_900", "color", "android");
            if (id != 0) ink = c.getResources().getColor(id);
        }
        b.setBackgroundTintList(android.content.res.ColorStateList.valueOf(surface)); b.setTextColor(ink);
    }
}
