package app.jofslash.extension.booking;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.provider.Settings;
import android.text.TextUtils;
import android.widget.Toast;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * The "Price watch" tab: the Watch this price / Stop watching box for the stay the page shows,
 * for a watched stay a chart of the prices the daily check found, and every watched stay.
 *
 * <p>The chart only has the prices the watch itself collected (and the price it started from),
 * for the watch's dates, adults, rooms and currency; the prices seen while browsing aren't in it.
 */
final class WatchTab {
    private final Activity activity;
    private final Panel panel;
    private final Panel.Colors colors;
    private final HotelInfo hotel;
    private final Stay stay;

    private LinearLayout watchBox;
    private LinearLayout content;
    /** Every price saved for this stay, oldest first (any source). */
    private List<PriceDb.Row> all;
    private List<PriceDb.Watch> watches;

    WatchTab(Activity activity, Panel panel, Panel.Colors colors, HotelInfo hotel, Stay stay) {
        this.activity = activity;
        this.panel = panel;
        this.colors = colors;
        this.hotel = hotel;
        this.stay = stay;
    }

    View view() {
        ScrollView scroll = new ScrollView(activity);
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding(panel.dp(16), panel.dp(12), panel.dp(16), panel.dp(24));
        scroll.addView(list);

        watchBox = new LinearLayout(activity);
        watchBox.setOrientation(LinearLayout.VERTICAL);
        list.addView(watchBox);
        // Back from Android's notification prompt or settings: show whether they're on now.
        watchBox.getViewTreeObserver().addOnWindowFocusChangeListener(focused -> {
            if (focused && watches != null) renderWatch();
        });

        content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        list.addView(content);

        final int hotelId = hotel.id;
        PriceRecorder.load(activity, db -> new Object[]{stay == null ? null : db.forStay(hotelId, stay), db.watches()},
                result -> {
                    all = result == null ? new ArrayList<>() : cast(result[0]);
                    watches = result == null || result[1] == null ? new ArrayList<>() : castWatches(result[1]);
                    render();
                });
        return scroll;
    }

    @SuppressWarnings("unchecked")
    private static List<PriceDb.Watch> castWatches(Object o) {
        return (List<PriceDb.Watch>) o;
    }

    @SuppressWarnings("unchecked")
    private static List<PriceDb.Row> cast(Object o) {
        return o == null ? new ArrayList<>() : (List<PriceDb.Row>) o;
    }

    private void render() {
        content.removeAllViews();
        if (watches == null) return;
        renderWatch();
        PriceDb.Watch watch = thisWatch();
        if (watch != null) watchChart(watch);
        watchList();
    }

    // ---------------------------------------------------------------------------------------
    // Price watch

    private PriceDb.Watch thisWatch() {
        if (stay == null || watches == null) return null;
        for (PriceDb.Watch w : watches) {
            if (w.hotelId == hotel.id && w.stay.sameAs(stay)) return w;
        }
        return null;
    }

    /**
     * The hotel with the price to start the watch from: the page's price, or else the newest
     * price saved for this stay (a page opened from a link can come without one).
     */
    private HotelInfo watchable() {
        if (hotel.hasPrice()) return hotel;
        if (stay == null || all == null) return null;
        for (int i = all.size() - 1; i >= 0; i--) {
            PriceDb.Row r = all.get(i);
            if (r.checkIn.equals(stay.checkIn) && r.checkOut.equals(stay.checkOut) && r.adults == stay.adults
                    && r.rooms == stay.rooms) {
                return HotelInfo.ofPrice(hotel.id, hotel.name != null ? hotel.name : r.name, r.price, Double.NaN,
                        r.currency);
            }
        }
        return null;
    }

    /** The card with the "Watch this price" button, at the top of the tab. */
    private void renderWatch() {
        watchBox.removeAllViews();
        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        card.addView(panel.text(Strings.WATCH_HEADER, 16, colors.text, true));
        final PriceDb.Watch watch = thisWatch();
        if (stay == null || (watch == null && watchable() == null)) {
            card.addView(panel.spaced(panel.text(stay == null ? Strings.WATCH_NO_DATES : Strings.WATCH_NEEDS_PRICE, 14,
                    colors.secondaryText, false), 6));
            watchBox.addView(panel.card(card));
            return;
        }
        if (watch == null) {
            card.addView(panel.spaced(panel.text(Strings.WATCH_EXPLAIN, 14, colors.secondaryText, false), 6));
            card.addView(panel.spaced(panel.button(Strings.WATCH_START, v -> startWatching()), 12));
        } else {
            String state = watch.lastCheck == 0 ? Strings.WATCH_FIRST
                    : String.format(Strings.WATCH_LAST, when(watch.lastCheck), status(watch));
            card.addView(panel.spaced(panel.text(state, 14, colors.text, false), 6));
            if (!PriceWatch.notificationsAllowed(activity)) {
                card.addView(panel.spaced(panel.text(Strings.WATCH_NOTIFICATIONS_OFF, 14, colors.bad, false), 8));
                card.addView(panel.link(Strings.WATCH_NOTIFICATION_SETTINGS, v -> openNotificationSettings()));
            }
            TextView stop = panel.text(Strings.WATCH_STOP, 15, colors.accent, true);
            stop.setGravity(Gravity.CENTER);
            stop.setPadding(panel.dp(16), panel.dp(12), panel.dp(16), panel.dp(12));
            GradientDrawable bg = new GradientDrawable();
            bg.setCornerRadius(panel.dp(8));
            bg.setStroke(Math.max(1, panel.dp(1)), colors.accent);
            stop.setBackground(bg);
            stop.setOnClickListener(v -> stopWatching(watch.hotelId, watch.stay));
            card.addView(panel.spaced(stop, 12));
        }
        watchBox.addView(panel.card(card));
    }

    private void startWatching() {
        final Context context = activity.getApplicationContext();
        final HotelInfo h = watchable();
        final Stay s = stay;
        if (h == null) return;
        // The page's own price starts the chart; one taken from the saved prices is older.
        final boolean pagePrice = h == hotel;
        PriceRecorder.load(activity, db -> new Object[]{PriceWatch.watch(context, h, s, pagePrice), db.watches(),
                db.forStay(h.id, s)}, result -> {
            if (result == null) return;
            if ((Integer) result[0] == PriceWatch.WATCH_FULL) {
                Toast.makeText(activity, String.format(Locale.getDefault(), Strings.WATCH_FULL, PriceWatch.MAX_WATCHES),
                        Toast.LENGTH_LONG).show();
            }
            watches = castWatches(result[1]);
            all = cast(result[2]);
            render();
            askForNotifications();
        });
    }

    private void stopWatching(final int hotelId, final Stay s) {
        final Context context = activity.getApplicationContext();
        PriceRecorder.load(activity, db -> {
            PriceWatch.unwatch(context, hotelId, s);
            return db.watches();
        }, result -> {
            if (result == null) return;
            watches = result;
            render();
        });
    }

    /** Android 13 and later: the app asks for the notification permission itself; ask again if needed. */
    private void askForNotifications() {
        if (Build.VERSION.SDK_INT >= 33 && activity.checkSelfPermission(
                android.Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED) {
            activity.requestPermissions(new String[]{android.Manifest.permission.POST_NOTIFICATIONS}, 0x4A0F);
        }
    }

    private void openNotificationSettings() {
        try {
            Intent intent = new Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS)
                    .putExtra(Settings.EXTRA_APP_PACKAGE, activity.getPackageName());
            activity.startActivity(intent);
        } catch (RuntimeException e) {
            Toast.makeText(activity, Strings.NO_BROWSER, Toast.LENGTH_SHORT).show();
        }
    }

    /** Every watched stay, at the bottom of the tab. */
    private void watchList() {
        if (watches == null || watches.isEmpty()) return;
        content.addView(panel.spaced(panel.text(String.format(Locale.getDefault(), Strings.WATCH_LIST_HEADER,
                watches.size(), PriceWatch.MAX_WATCHES), 16, colors.text, true), 28));
        content.addView(panel.spaced(panel.text(Strings.WATCH_LIST_EXPLAIN, 13, colors.secondaryText, false), 4));
        for (final PriceDb.Watch w : watches) {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            LinearLayout texts = new LinearLayout(activity);
            texts.setOrientation(LinearLayout.VERTICAL);
            TextView name = panel.text(w.name != null ? w.name : Strings.WATCH_UNNAMED, 14, colors.text, true);
            name.setSingleLine(true);
            name.setEllipsize(TextUtils.TruncateAt.END);
            texts.addView(name);
            texts.addView(panel.text(Panel.stayText(w.stay), 13, colors.secondaryText, false));
            texts.addView(panel.text(w.lastCheck == 0 ? Strings.WATCH_STATUS_NEW
                    : when(w.lastCheck) + ": " + status(w), 13, colors.secondaryText, false));
            row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            texts.setOnClickListener(v -> {
                try {
                    activity.startActivity(PriceWatch.propertyPageIntent(activity, w.hotelId, w.stay));
                } catch (RuntimeException e) {
                    Toast.makeText(activity, Strings.NO_BROWSER, Toast.LENGTH_SHORT).show();
                }
            });
            TextView remove = panel.text("\u2715", 18, colors.secondaryText, false);
            remove.setGravity(Gravity.CENTER);
            remove.setContentDescription(Strings.WATCH_STOP);
            remove.setOnClickListener(v -> stopWatching(w.hotelId, w.stay));
            row.addView(remove, new LinearLayout.LayoutParams(panel.dp(48), panel.dp(48)));
            content.addView(panel.spaced(panel.card(row), 8));
        }
    }

    private static String status(PriceDb.Watch w) {
        if (PriceWatch.STATUS_OK.equals(w.status) && !Double.isNaN(w.lastPrice)) {
            return Panel.money(w.lastPrice, w.currency);
        }
        if (PriceWatch.STATUS_SOLD_OUT.equals(w.status)) return Strings.WATCH_STATUS_SOLD_OUT;
        if (PriceWatch.STATUS_NO_PRICE.equals(w.status)) return Strings.WATCH_STATUS_NO_PRICE;
        if (PriceWatch.STATUS_ERROR.equals(w.status)) return Strings.WATCH_STATUS_ERROR;
        return Strings.WATCH_STATUS_NEW;
    }

    /** Day and time, "22 Nov 14:05". */
    private static String when(long time) {
        return Panel.day(time) + " " + java.text.DateFormat.getTimeInstance(java.text.DateFormat.SHORT)
                .format(new java.util.Date(time));
    }

    // ---------------------------------------------------------------------------------------
    // The watched stay's chart

    private void watchChart(PriceDb.Watch watch) {
        content.addView(panel.spaced(panel.text(Strings.WATCH_CHART_HEADER, 16, colors.text, true), 20));
        String currency = watch.currency;
        List<PriceDb.Row> rows = new ArrayList<>();
        for (PriceDb.Row r : all) {
            if (PriceDb.SOURCE_WATCH.equals(r.source) && currency.equals(r.currency)) rows.add(r);
        }
        if (rows.isEmpty()) {
            content.addView(panel.spaced(panel.text(Strings.WATCH_CHART_EMPTY, 14, colors.secondaryText, false), 8));
            return;
        }
        PriceDb.Row min = rows.get(0), max = rows.get(0), last = rows.get(rows.size() - 1);
        for (PriceDb.Row r : rows) {
            if (r.price < min.price) min = r;
            if (r.price > max.price) max = r;
        }
        boolean pageSame = hotel.hasPrice() && currency.equals(hotel.currency);
        double now = pageSame ? hotel.price : last.price;

        PriceChartView chart = new PriceChartView(activity, colors);
        chart.setData(rows, pageSame ? hotel.strike : Double.NaN, currency);
        content.addView(panel.spaced(chart, 12));

        LinearLayout stats = new LinearLayout(activity);
        stats.setOrientation(LinearLayout.HORIZONTAL);
        stats.addView(stat(Strings.WATCH_NOW, Panel.money(now, currency), null), weight());
        stats.addView(stat(Strings.WATCH_LOWEST, Panel.money(min.price, currency), Panel.day(min.time)), weight());
        stats.addView(stat(Strings.WATCH_HIGHEST, Panel.money(max.price, currency), Panel.day(max.time)), weight());
        content.addView(panel.spaced(stats, 8));

        String checks = rows.size() == 1 ? String.format(Strings.WATCH_CHECKS_ONE, Panel.day(rows.get(0).time))
                : String.format(Locale.getDefault(), Strings.WATCH_CHECKS, rows.size(), Panel.day(rows.get(0).time));
        content.addView(panel.spaced(panel.text(checks, 13, colors.secondaryText, false), 6));
    }

    private View stat(String label, String value, String sub) {
        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.addView(panel.text(label, 12, colors.secondaryText, false));
        box.addView(panel.text(value, 16, colors.text, true));
        if (sub != null) box.addView(panel.text(sub, 12, colors.secondaryText, false));
        return box;
    }

    private static LinearLayout.LayoutParams weight() {
        return new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
    }
}
