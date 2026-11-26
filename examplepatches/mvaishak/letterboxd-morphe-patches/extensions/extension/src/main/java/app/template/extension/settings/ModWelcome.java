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
 * <p>Per release: rewrite {@link #BODY} to cover user-facing changes since the stable baseline, then
 * bump {@link #BUILD}. {@link #FOOTER} and its general releases link
 * are permanent — do not fold release notes into them.
 */
public final class ModWelcome {

    private ModWelcome() {}

    /** Bump every time {@link #BODY} changes so returning users see it once more. */
    private static final int BUILD = 17;
    private static final String KEY = "welcome_build";

    private static final String TITLE = "What's new";

    private static final String RELEASES_URL =
            "https://github.com/mvaishak/letterboxd-morphe-patches/releases";

    // Short bullets, section name on its own line, and a blank line between sections.
    private static final String BODY =
            "## Letterboxd Morphe patches v3.1.0\n"
            + "\n"
            + "This release adds streaming offers, film alerts, external ratings, and more artwork options. All patches now support Letterboxd 3.6.9.\n"
            + "\n"
            + "To open Letterboxd Mods, long-press the settings gear on your profile, or long-press the app icon and select Letterboxd Mods.\n"
            + "\n"
            + "### Streaming offers and alerts\n"
            + "\n"
            + "With the Where to Watch patch installed, you can choose streaming services across regions and open available offers directly from a film’s page.\n"
            + "\n"
            + "- Open the streaming service picker in Settings, choose a region, and select your services.\n"
            + "- Open a film’s Where to Watch section to see matching offers.\n"
            + "- Tap an offer to open it.\n"
            + "- Choose Set alert to get notified when the film becomes available on your selected services. Use Remove alert to cancel it.\n"
            + "\n"
            + "### Film release reminders\n"
            + "\n"
            + "The new Film release alerts patch lets you save reminders for upcoming release dates.\n"
            + "\n"
            + "Open a film’s Release alerts option, select the releases you want to follow, and save your choices. Allow notifications when prompted.\n"
            + "\n"
            + "Manage your saved reminders in Mods → Film Pages → Release alerts.\n"
            + "\n"
            + "### External ratings\n"
            + "\n"
            + "Show scores from IMDb, Rotten Tomatoes critics and audiences, Metacritic, TMDB, and Trakt beneath streaming availability.\n"
            + "\n"
            + "Open Mods → Film Pages → External ratings, connect your MDBList API key, select the rating sources you want, and tap Save choices. The setup screen includes a link to MDBList Preferences to get your key.\n"
            + "\n"
            + "### Rotating profile backdrops\n"
            + "\n"
            + "Your profile backdrop can now rotate daily or whenever you open your profile.\n"
            + "\n"
            + "With Custom artwork installed, open Mods → Artwork & appearance → Change backdrop. Choose Rotate images, add at least 2 backdrops, select Daily or On profile open, and tap Save rotation.\n"
            + "\n"
            + "### TMDB title logos\n"
            + "\n"
            + "Display a film’s title artwork on its page when TMDB has a logo available.\n"
            + "\n"
            + "Open Mods → Artwork & appearance, connect TMDB, and enable Use TMDB title logos.\n"
            + "\n"
            + "### Notification history and backups\n"
            + "\n"
            + "Review saved alerts through the new notification bell and tap an entry to reopen its film.\n"
            + "\n"
            + "Mods backups now include streaming selections and alerts. Open Mods → Backup & Reset → Export Mods backup and choose the sections to save. Use Import Mods backup to restore selected sections.\n"
            + "\n"
            + "### Compatibility fix\n"
            + "\n"
            + "Fixed an Appearance resource conflict that prevented patched APKs from building on Letterboxd 3.6.9. Existing supported versions remain available.";

    /** Permanent closer — every release. New-to-this-version users still need this. */
    private static final String FOOTER =
            "View all releases (Stable & Dev):\n" + RELEASES_URL;

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
     * Markdown headings are styled too. Ends with the releases footer and tappable URL.
     */
    private static CharSequence format(Context ctx) {
        try {
            float d = ctx.getResources().getDisplayMetrics().density;
            int hang = Math.round(16 * d);

            String[] lines = BODY.split("\n", -1);
            SpannableStringBuilder sb = new SpannableStringBuilder();
            for (int i = 0; i < lines.length; i++) {
                String line = lines[i];
                boolean heading = line.startsWith("## ");
                if (line.startsWith("### ")) {
                    heading = true;
                    line = line.substring(4);
                } else if (heading) {
                    line = line.substring(3);
                }
                if (line.startsWith("- ")) line = "•  " + line.substring(2);
                int start = sb.length();
                sb.append(line);
                if (i < lines.length - 1) sb.append('\n');
                int end = start + line.length();
                if (line.startsWith("•")) {
                    sb.setSpan(new LeadingMarginSpan.Standard(0, hang), start, end,
                            Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                } else if (heading || (!line.isEmpty() && i + 1 < lines.length && lines[i + 1].startsWith("•"))) {
                    sb.setSpan(new StyleSpan(Typeface.BOLD), start, end, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                    sb.setSpan(new ForegroundColorSpan(0xFFFFFFFF), start, end, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                }
            }

            sb.append("\n\n");
            int footerStart = sb.length();
            sb.append("View all releases (Stable & Dev):");
            sb.setSpan(new StyleSpan(Typeface.BOLD), footerStart, sb.length(),
                    Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
            sb.append('\n');
            int linkStart = sb.length();
            sb.append(RELEASES_URL);
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
