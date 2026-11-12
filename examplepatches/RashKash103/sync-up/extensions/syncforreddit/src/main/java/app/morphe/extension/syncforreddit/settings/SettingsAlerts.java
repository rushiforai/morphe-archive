package app.morphe.extension.syncforreddit.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.preference.Preference;
import androidx.preference.h;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.syncforreddit.redirects.RedirectAlerts;

/**
 * What is wrong, said at the top of the settings.
 *
 * <p>A patch can leave the app in a state nothing on the screen explains. The one this was
 * written for is a client certificate: it is deliberately kept out of Sync's Backup, so a copy
 * restored onto another device comes back with the instance list, the switches and no
 * certificate — and the only sign of it is that something quietly stopped working. An alert
 * says so where it will be seen without going looking, and tapping it opens the very thing that
 * fixes it.
 *
 * <p><b>Shared, not part of any one patch.</b> The rows and this code are put in by a patch of
 * its own that has no name, so it is not offered as a patch to choose; whatever needs alerts
 * depends on it and it is applied once however many of them do. Adding a source of alerts is a
 * line in {@link #whatIsWrong}: each one answers for itself whether its patch is even in this
 * copy, so a build without it simply has nothing to say.
 *
 * @noinspection unused
 */
public final class SettingsAlerts {
    /** The category the rows sit in, written into the front screen by the patch. */
    private static final String CATEGORY = "sync_up_alerts";

    /** Every row of ours is named with this in front, which is how one is recognised. */
    static final String ROW = "sync_up_alert_";

    /**
     * How many rows there are to say it with. The last one says how many more there are where
     * there are more than this, which is better than silently dropping them.
     */
    private static final int ROWS = 4;

    /** The row that opens what has been put away. Only there while something has been. */
    private static final String PUT_AWAY_ROW = "sync_up_alerts_dismissed_row";

    /** Named once, so a row can be given an icon that is actually in this copy. */
    private static final String[] ICONS = {
            "outline_report_24", "outline_report_24", "outline_info_24",
    };

    /** What goes in the row's widget frame: the sign that it can be tapped, and the way out. */
    private static final String CHEVRON = "sync_up_alert_go";

    private static final String DISMISS = "sync_up_alert_dismiss";

    private SettingsAlerts() {}

    /** @return Whether the patch was applied at all. Overridden by the patch. */
    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /**
     * @return Whether the icons named above are really in this copy's resources. Overridden by
     *         the patch, which checks each of them while it runs.
     *
     * <p>Most of the drawables the app names are not there any more — the shrinker left the
     * name and the id and replaced the drawing with a stub whose element names a class that was
     * shrunk away too, so giving a row one takes the whole screen down the moment it is drawn.
     * That is not a thing to find out on a device, and an icon is only a decoration, so where
     * either of them is a stub the rows go without.
     */
    public static boolean iconsAreThere() {
        // Overridden by patch.
        return false;
    }

    /**
     * Called as every settings screen finishes loading its rows. Only the one holding these
     * rows is the front page; every other screen is left exactly as it was.
     */
    public static void settle(pa.d screen) {
        if (screen == null || !isPatchIncluded()) {
            return;
        }
        try {
            Preference category = screen.y(CATEGORY);
            if (category == null) {
                // Some other screen of the settings. Nothing here belongs to it.
                return;
            }
            draw(screen, category);
        } catch (Exception ex) {
            Logger.printInfo(() -> "alerts: could not be put on the screen: " + ex);
        }
    }

    /** Fills the rows, and takes the whole section away where there is nothing to say. */
    private static void draw(pa.d screen, Preference category) {
        List<SettingsAlert> saying = whatIsWrong();
        Collections.sort(saying, new Comparator<SettingsAlert>() {
            @Override
            public int compare(SettingsAlert one, SettingsAlert other) {
                return one.level.ordinal() - other.level.ordinal();
            }
        });

        int putAway = AlertDismissals.listed().size();
        category.H0(!saying.isEmpty() || putAway > 0);

        for (int at = 0; at < ROWS; at++) {
            Preference row = screen.y(ROW + at);
            if (row == null) {
                continue;
            }
            if (at >= saying.size()) {
                row.H0(false);
                continue;
            }
            if (at == ROWS - 1 && saying.size() > ROWS) {
                // More than there is room for. Say how many rather than losing them.
                int more = saying.size() - ROWS + 1;
                show(row, null, SettingsAlert.Level.INFO,
                        more + " more things need attention",
                        "Open the screens below to see them.", null, screen, category);
                continue;
            }
            SettingsAlert alert = saying.get(at);
            show(row, alert.id, alert.level, alert.title, alert.summary, alert.whatToDo,
                    screen, category);
        }

        theOnesPutAway(screen, category, putAway);
    }

    /** The row that opens what has been dismissed, so that it can be brought back. */
    private static void theOnesPutAway(pa.d screen, Preference category, int putAway) {
        Preference row = screen.y(PUT_AWAY_ROW);
        if (row == null) {
            return;
        }
        row.H0(putAway > 0);
        if (putAway == 0) {
            return;
        }
        row.G0("Dismissed alerts");
        row.D0(putAway == 1 ? "One is put away. Tap to bring it back."
                : putAway + " are put away. Tap to bring them back.");
        row.C0(true);
        row.A0(tapped -> {
            whatWasPutAway(tapped.k(), () -> draw(screen, category));
            return true;
        });
    }

    private static void show(Preference row, @Nullable String id, SettingsAlert.Level level,
                             String title, String summary, @Nullable SettingsAlert.Tap whatToDo,
                             pa.d screen, Preference category) {
        row.H0(true);
        row.G0(title);
        row.D0(summary);
        icon(row, level);
        // Read back when the row draws, which is where the widget frame can be reached.
        marked(row, id, whatToDo != null, () -> draw(screen, category));

        if (whatToDo == null) {
            row.A0(null);
            row.C0(false);
            return;
        }
        row.C0(true);
        row.A0(tapped -> {
            // Drawn again once whatever it opened has changed something, so an alert that has
            // been dealt with goes away without the screen being left and come back to.
            whatToDo.act(tapped.k(), () -> draw(screen, category));
            return true;
        });
    }

    // region What each row carries in its widget frame.

    /**
     * What a row needs when it is next drawn, left on the row itself.
     *
     * <p>The chevron and the cross live in a layout the patch gives the row, and that layout is
     * only reachable while the row is being bound to a view — which happens later, and happens
     * again every time the row scrolls back into sight. So what is to be done with them is left
     * here and read in {@link #drawRow}.
     */
    private static final java.util.Map<Preference, Object[]> waiting =
            java.util.Collections.synchronizedMap(new java.util.WeakHashMap<Preference, Object[]>());

    private static void marked(Preference row, @Nullable String id, boolean canBeTapped,
                               Runnable afterwards) {
        waiting.put(row, new Object[]{id, canBeTapped, afterwards});
    }

    /**
     * Called as a row of the settings draws itself, for every row there is.
     *
     * <p>Anything that is not one of ours is left alone at the first line. For one of ours,
     * this is the only moment the views in the widget frame exist to be given anything to do.
     */
    public static void drawRow(Preference row, h holder) {
        try {
            if (!isPatchIncluded() || row == null || holder == null) {
                return;
            }
            String key = row.r();
            if (key == null || !key.startsWith(ROW)) {
                return;
            }
            Object[] what = waiting.get(row);
            View chevron = holder.itemView.findViewById(
                    ResourceUtils.getIdentifier(ResourceType.ID, CHEVRON));
            View cross = holder.itemView.findViewById(
                    ResourceUtils.getIdentifier(ResourceType.ID, DISMISS));
            if (chevron == null || cross == null) {
                return;
            }

            String id = what == null ? null : (String) what[0];
            boolean canBeTapped = what != null && Boolean.TRUE.equals(what[1]);
            Runnable afterwards = what == null ? null : (Runnable) what[2];

            chevron.setVisibility(canBeTapped ? View.VISIBLE : View.GONE);
            cross.setVisibility(id == null ? View.GONE : View.VISIBLE);

            // Tinted with the colour the row's own title is given, since Sync sets that
            // itself from the theme and these two must not be the one thing on the row that
            // disappears in the dark. Posted rather than done here: this runs before the row
            // draws itself, which is where that colour is set, because that is the only point
            // in the method where the holder is still the holder.
            holder.itemView.post(() -> tint(holder, chevron, cross));

            if (id != null) {
                cross.setOnClickListener(tapped ->
                        askAboutPuttingAway(tapped.getContext(), id, String.valueOf(row.E()),
                                afterwards));
            }
        } catch (Exception ex) {
            // A decoration on a settings row must never take the screen down.
            Logger.printDebug(() -> "alerts: could not dress a row: " + ex);
        }
    }

    private static void tint(h holder, View chevron, View cross) {
        try {
            View titled = holder.itemView.findViewById(android.R.id.title);
            if (!(titled instanceof TextView)) {
                return;
            }
            ColorStateList colour =
                    ColorStateList.valueOf(((TextView) titled).getCurrentTextColor());
            if (chevron instanceof ImageView) {
                ((ImageView) chevron).setImageTintList(colour);
            }
            if (cross instanceof ImageView) {
                ((ImageView) cross).setImageTintList(colour);
            }
        } catch (Exception ex) {
            Logger.printDebug(() -> "alerts: could not colour a row's marks: " + ex);
        }
    }

    // endregion

    // region Putting one away, and getting it back.

    private static void askAboutPuttingAway(Context context, String id, String title,
                                            @Nullable Runnable afterwards) {
        new AlertDialog.Builder(context)
                .setTitle("Dismiss this alert?")
                .setMessage("Just once brings it back the next time Sync starts. Always keeps "
                        + "it away until you bring it back from Dismissed alerts.")
                .setPositiveButton("Always", (dialog, which) -> {
                    AlertDismissals.always(id, title);
                    if (afterwards != null) {
                        afterwards.run();
                    }
                })
                .setNeutralButton("Just once", (dialog, which) -> {
                    AlertDismissals.justOnce(id);
                    if (afterwards != null) {
                        afterwards.run();
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static void whatWasPutAway(Context context, Runnable afterwards) {
        List<String[]> listed = AlertDismissals.listed();
        if (listed.isEmpty()) {
            return;
        }
        String[] titles = new String[listed.size()];
        for (int at = 0; at < listed.size(); at++) {
            titles[at] = listed.get(at)[1];
        }

        new AlertDialog.Builder(context)
                .setTitle("Dismissed alerts")
                .setItems(titles, (dialog, which) -> {
                    AlertDismissals.bringBack(listed.get(which)[0]);
                    if (afterwards != null) {
                        afterwards.run();
                    }
                })
                .setNegativeButton("Close", null)
                .setNeutralButton("Bring back all", (dialog, which) -> {
                    for (String[] each : listed) {
                        AlertDismissals.bringBack(each[0]);
                    }
                    if (afterwards != null) {
                        afterwards.run();
                    }
                })
                .show();
    }

    // endregion

    private static void icon(Preference row, SettingsAlert.Level level) {
        if (!iconsAreThere()) {
            return;
        }
        try {
            int icon = ResourceUtils.getIdentifier(
                    ResourceType.DRAWABLE, ICONS[level.ordinal()]);
            if (icon != 0) {
                row.s0(icon);
            }
        } catch (Exception ex) {
            // An icon is a decoration; the words are what matters.
            Logger.printDebug(() -> "alerts: no icon for " + level + ": " + ex);
        }
    }

    /**
     * Everything worth saying, from whatever has something to say, less whatever has been put
     * away.
     *
     * <p>Each source answers for itself whether its patch is in this copy at all, so this list
     * is the whole of what adding one costs.
     */
    private static List<SettingsAlert> whatIsWrong() {
        List<SettingsAlert> saying = new ArrayList<>();
        add(saying, RedirectAlerts.whatIsWrong());

        List<SettingsAlert> shown = new ArrayList<>();
        for (SettingsAlert alert : saying) {
            if (!AlertDismissals.isDismissed(alert.id)) {
                shown.add(alert);
            }
        }
        return shown;
    }

    private static void add(List<SettingsAlert> saying, List<SettingsAlert> from) {
        try {
            if (from != null) {
                saying.addAll(from);
            }
        } catch (Exception ex) {
            // One source failing must not take the rest of the alerts down with it.
            Logger.printInfo(() -> "alerts: a source could not be asked: " + ex);
        }
    }
}
