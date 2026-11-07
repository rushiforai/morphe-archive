package app.morphe.extension.boost;

/** Device-only regression probe; excluded from published bundles. */
public final class LinkProbe extends android.app.Activity {
    private static int color(android.text.Spanned text) {
        android.text.TextPaint paint = new android.text.TextPaint();
        text.getSpans(0, text.length(), android.text.style.URLSpan.class)[0].updateDrawState(paint);
        return paint.getColor();
    }
    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
    @Override public void onCreate(android.os.Bundle state) {
        super.onCreate(state);
        try {
            android.content.SharedPreferences preferences = android.preference.PreferenceManager.getDefaultSharedPreferences(this);
            if (getIntent().getBooleanExtra("peek", false)) {
                android.util.Log.i("CatppuccinLinkProbe", "STATE native=" + BoostTheme.mode()
                    + " theme=" + preferences.getString("pref_theme", "unset")
                    + " night=" + preferences.getString("pref_theme_night", "unset")
                    + " mode=" + preferences.getInt("pref_theme_mode", -1)
                    + " dynamic=" + preferences.getBoolean("pref_dynamic_colors", false));
                finish(); return;
            }
            int selected = getIntent().getIntExtra("theme", 18);
            preferences.edit().putString("pref_theme", String.valueOf(selected))
                .putString("pref_theme_night", String.valueOf(selected)).putInt("pref_theme_mode", 0)
                .putBoolean("pref_dynamic_colors", true).commit();
            BoostTheme.selectTheme(this, selected);
            check(!preferences.getBoolean("pref_dynamic_colors", true), "Catppuccin selection must disable dynamic colors");
            check(BoostTheme.mode() == selected, "Probe must run with the requested theme enabled");
            android.widget.TextView view = new android.widget.TextView(this);
            String url = "https://example.invalid/catppuccin-probe/" + System.nanoTime();
            android.text.Spanned source = android.text.Html.fromHtml("<a href='" + url + "'>Link</a>");
            android.text.Spanned styled = (android.text.Spanned) BoostTheme.links(view, source);
            check(color(styled) == BoostTheme.link(0), "Unvisited link must be blue");
            BoostTheme.visitLink(this, url);
            check(color(styled) == BoostTheme.secondary(0), "Visited link must be grey immediately");
            android.text.Spanned rebound = (android.text.Spanned) BoostTheme.links(view, source);
            check(color(rebound) == BoostTheme.secondary(0), "Visited color must survive rebinding");
            android.text.Spanned spoiler = android.text.Html.fromHtml("<a href='spoiler://hidden'>Spoiler</a>");
            android.text.style.URLSpan original = spoiler.getSpans(0, spoiler.length(), android.text.style.URLSpan.class)[0];
            android.text.Spanned unchanged = (android.text.Spanned) BoostTheme.links(view, spoiler);
            check(unchanged.getSpans(0, unchanged.length(), android.text.style.URLSpan.class)[0] == original, "Keep spoiler span");
            String persistent = "https://example.invalid/catppuccin-persistence";
            android.text.Spanned persisted = (android.text.Spanned) BoostTheme.links(view,
                android.text.Html.fromHtml("<a href='" + persistent + "'>Persist</a>"));
            if (getIntent().getBooleanExtra("check-persistence", false))
                check(color(persisted) == BoostTheme.secondary(0), "Visited color must survive process restart");
            BoostTheme.visitLink(this, persistent);
            if (getIntent().getBooleanExtra("headless", false)) finish();
            else { view.setText(styled); setContentView(view); }
            android.util.Log.i("CatppuccinLinkProbe", "PASS blue, grey, rebinding, spoilers, persistence=" + getIntent().getBooleanExtra("check-persistence", false));
        } catch (Throwable failure) {
            android.util.Log.e("CatppuccinLinkProbe", "FAIL", failure);
        }
    }
}
