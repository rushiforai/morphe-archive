package e.e.a;

import android.preference.ListPreference;

/** Prefix the existing description with the selected entry. */
public final class CommentFpsSummary211 {
    private CommentFpsSummary211() {}

    public static void set(ListPreference fps, CharSequence description) {
        if (description == null) {
            fps.setSummary(null);
            return;
        }
        String lang = fps.getContext().getResources().getConfiguration()
                .getLocales().get(0).getLanguage();
        String separator = "ja".equals(lang) || "zh".equals(lang) ? "：" : ": ";
        fps.setSummary("%s" + separator + description.toString().replace("%", "%%"));
    }
}
