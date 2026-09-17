package app.template.extension.settings;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.style.ClickableSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.LeadingMarginSpan;
import android.text.style.StyleSpan;
import android.view.View;

/**
 * One-time "what's new" dialog, shown once after each patch. Injected into
 * {@code MainActivity.onResume} (not {@code onCreate}) so it fires after the splash / login flow,
 * and it is only marked seen once the user actually dismisses it.
 *
 * <p>Per release: rewrite {@link #BODY} to cover only that release's user-facing changes, then
 * bump {@link #BUILD}. {@link #FOOTER} (how to open the Mods screen) and the "Full changes" link
 * are permanent — do not fold release notes into them.
 */
public final class ModWelcome {

    private ModWelcome() {}

    /** Bump every time {@link #BODY} changes so returning users see it once more. */
    private static final int BUILD = 6;
    private static final String KEY = "welcome_build";

    private static final String TITLE = "What's new";

    private static final String RELEASES_URL =
            "https://github.com/mvaishak/letterboxd-morphe-patches/releases";

    // THIS RELEASE ONLY. Short bullets, section name on its own line with bullets under it, blank
    // line between sections. Group aggressively — aim for six bullets or fewer. Skip internal
    // churn (refactors, anything added then reverted in the same batch). The full feature list
    // lives in the Mods screen and the README, not here.
    private static final String BODY =
            "Bottom navigation\n"
          + "•  Choose which tabs the bar shows, up to five\n"
          + "•  New Watchlist tab — its own filters and sort, back goes to Films\n"
          + "•  Set which tab the app opens on at launch\n\n"
          + "Home tabs\n"
          + "•  Show, hide or reorder Films / Reviews / Lists / Journal\n"
          + "•  Home opens on whichever tab you put first\n\n"
          + "Film pages\n"
          + "•  Runtime can read 1h 47m instead of 107 mins\n\n"
          + "New patch: Hide ads\n"
          + "•  Stops the banner ads on free accounts from loading\n\n"
          + "Backup\n"
          + "•  Export and import your mod config as a file, to share or restore";

    /** Permanent closer — every release. New-to-this-version users still need this. */
    private static final String FOOTER =
            "Open the Mods screen by long-pressing the Letterboxd app icon, or the settings "
          + "gear on your profile tab.";

    private static volatile boolean shown = false;
    private static volatile boolean scheduled = false;

    /** Injected at the top of {@code MainActivity.onResume} (fires repeatedly — guarded). */
    public static void maybeShow(final Activity activity) {
        try {
            if (shown || scheduled || activity == null) return;
            Prefs.load(activity);
            if (String.valueOf(BUILD).equals(Prefs.getString(KEY, ""))) {
                shown = true;
                return;
            }

            scheduled = true;
            activity.getWindow().getDecorView().postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        if (shown) return;
                        if (activity.isFinishing() || activity.isDestroyed()) {
                            scheduled = false; // a later onResume (real MainActivity) retries
                            return;
                        }
                        shown = true;
                        ModDialog.show(activity, TITLE, format(activity), "Got it", null, null, null,
                                new Runnable() {
                                    @Override public void run() {
                                        Prefs.putString(KEY, String.valueOf(BUILD));
                                    }
                                });
                    } catch (Throwable t) {
                        scheduled = false;
                    }
                }
            }, 2200L);
        } catch (Throwable ignored) {
        }
    }

    /**
     * Builds the styled dialog text: a line that has bullets under it becomes a bold white
     * heading; bullet lines get a hanging indent so wrapped text lines up under the first word.
     * Then the permanent {@link #FOOTER} and a tappable "Full changes on GitHub" link.
     */
    private static CharSequence format(Context ctx) {
        try {
            float d = ctx.getResources().getDisplayMetrics().density;
            int hang = Math.round(16 * d);

            String[] lines = (BODY + "\n\n" + FOOTER).split("\n", -1);
            SpannableStringBuilder sb = new SpannableStringBuilder();
            for (int i = 0; i < lines.length; i++) {
                String line = lines[i];
                int start = sb.length();
                sb.append(line);
                if (i < lines.length - 1) sb.append('\n');
                int end = start + line.length();
                if (line.startsWith("•")) {
                    sb.setSpan(new LeadingMarginSpan.Standard(0, hang), start, end,
                            Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                } else if (!line.isEmpty() && i + 1 < lines.length && lines[i + 1].startsWith("•")) {
                    sb.setSpan(new StyleSpan(Typeface.BOLD), start, end, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                    sb.setSpan(new ForegroundColorSpan(0xFFFFFFFF), start, end, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                }
            }

            sb.append("\n\n");
            int linkStart = sb.length();
            sb.append("Full changes on GitHub");
            sb.setSpan(new ClickableSpan() {
                @Override public void onClick(View widget) {
                    try {
                        widget.getContext().startActivity(
                                new Intent(Intent.ACTION_VIEW, Uri.parse(RELEASES_URL))
                                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                    } catch (Throwable ignored) {
                    }
                }
            }, linkStart, sb.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
            return sb;
        } catch (Throwable t) {
            return BODY + "\n\n" + FOOTER;
        }
    }
}
