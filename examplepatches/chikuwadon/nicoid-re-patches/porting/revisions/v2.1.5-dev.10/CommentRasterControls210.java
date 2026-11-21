package e.e.a;

import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import java.util.Locale;

/** Dev-only A/B switch and dynamic FPS value prefix, without rewriting the summary. */
public final class CommentRasterControls210 {
    private static final String KEY = "nicoid_comment_raster_ab";
    private CommentRasterControls210() {}

    public static void install(PreferenceActivity activity) {
        Preference found = activity.findPreference("comment_fps");
        if (!(found instanceof ListPreference)) return;
        ListPreference fps = (ListPreference) found;
        CharSequence existing = fps.getSummary();
        if (existing != null) {
            String lang = activity.getResources().getConfiguration()
                    .getLocales().get(0).getLanguage();
            // ListPreference resolves %s to the current entry after every selection.
            // Everything after the separator is exactly the old description.
            fps.setSummary("%s" + ("en".equals(lang) ? ": " : "：") + existing);
        }
        if (activity.findPreference(KEY) != null) return;
        PreferenceGroup owner = parent(activity.getPreferenceScreen(), fps);
        if (owner == null) return;
        CheckBoxPreference toggle = new CheckBoxPreference(activity);
        toggle.setKey(KEY);
        toggle.setDefaultValue(Boolean.FALSE);
        toggle.setPersistent(true);
        toggle.setTitle(local(activity, "描画キャッシュ（検証用）",
                "Comment bitmap cache (test only)", "留言繪製快取（測試用）"));
        toggle.setSummary(local(activity,
                "OFF：従来の文字描画／ON：Bitmapキャッシュ。性能比較にのみ使用します",
                "OFF: direct text / ON: bitmap cache. Development comparison only.",
                "OFF：直接繪字／ON：點陣圖快取。僅供效能比較"));
        owner.addPreference(toggle);
    }

    private static String local(PreferenceActivity a, String ja, String en, String zh) {
        Locale locale = a.getResources().getConfiguration().getLocales().get(0);
        String lang = locale.getLanguage();
        return "ja".equals(lang) ? ja : "zh".equals(lang) ? zh : en;
    }

    private static PreferenceGroup parent(PreferenceGroup group, Preference target) {
        if (group == null) return null;
        for (int n = 0; n < group.getPreferenceCount(); n++) {
            Preference p = group.getPreference(n);
            if (p == target) return group;
            if (p instanceof PreferenceGroup) {
                PreferenceGroup parent = parent((PreferenceGroup) p, target);
                if (parent != null) return parent;
            }
        }
        return null;
    }
}
