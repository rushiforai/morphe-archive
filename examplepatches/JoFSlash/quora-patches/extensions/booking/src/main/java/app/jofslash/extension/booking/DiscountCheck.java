package app.jofslash.extension.booking;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Used by the Check crossed-out prices patch. When the property page's price shows a crossed-out
 * "original" price, a line under the price says how it compares with the prices saved on this
 * phone for the same stay ({@link StrikeCheck}).
 *
 * <p>The price is a ComposeView in the page's "pricing region", a vertical LinearLayout of the
 * app's older View-based components. The line is a plain TextView added to that LinearLayout
 * right after the price, so the price's Compose content isn't touched.
 */
@SuppressWarnings("unused")
public final class DiscountCheck {
    private DiscountCheck() {
    }

    private static final String LINE_TAG = "jofslash_strike_check";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** Whether the price drawn last shows a crossed-out price. */
    private static volatile boolean strikeShown;

    /** The PriceData the property page's price view got last. */
    private static volatile Object priceData;

    /** Called from ReactorPriceView$ShowPriceData's constructor. */
    public static void onPriceData(Object data) {
        priceData = data;
    }

    /** The badges of the price the property page shows now, or null. */
    static Object shownBadges() {
        return HotelInfo.field(priceData, "listOfBadges");
    }

    /**
     * Called right after the property page draws its price with
     * PriceViewHPComposeView(modifier, props, onClick, onReward, onDetails, composer).
     */
    public static void priceView(Object modifier, Object props, Object onClick, Object onReward,
                                 Object onDetails, Object composer) {
        try {
            Object details = HotelInfo.field(props, "priceDetails");
            strikeShown = HotelInfo.field(details, "strikethroughPrice") != null;
            final View host = ComposeViews.localView(composer);
            if (host != null) MAIN.post(() -> attach(host));
        } catch (Throwable t) {
            Log.w(HotelInfo.TAG, "priceView", t);
        }
    }

    private static void attach(View host) {
        try {
            Activity activity = ComposeViews.activity(host.getContext());
            if (activity == null || activity.isFinishing()) return;
            // Up from the Compose host to the pricing region's vertical LinearLayout.
            View child = host;
            ViewParent parent = host.getParent();
            for (int i = 0; i < 4 && parent instanceof ViewGroup; i++) {
                if (parent instanceof LinearLayout && ((LinearLayout) parent).getOrientation() == LinearLayout.VERTICAL) {
                    break;
                }
                child = (View) parent;
                parent = parent.getParent();
            }
            if (!(parent instanceof LinearLayout)) {
                Log.w(HotelInfo.TAG, "The price isn't in a LinearLayout: " + parent);
                return;
            }
            LinearLayout region = (LinearLayout) parent;
            TextView line = region.findViewWithTag(LINE_TAG);
            if (line == null) {
                line = new TextView(activity);
                line.setTag(LINE_TAG);
                line.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                float density = activity.getResources().getDisplayMetrics().density;
                int h = Math.round(16 * density);
                line.setPadding(h, Math.round(2 * density), h, Math.round(8 * density));
                line.setVisibility(View.GONE);
                region.addView(line, region.indexOfChild(child) + 1, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            }
            refresh(activity, line);
        } catch (Throwable t) {
            Log.w(HotelInfo.TAG, "Couldn't add the crossed-out price line", t);
        }
    }

    private static void refresh(Activity activity, final TextView line) {
        PropertyPageButton.Current c = PropertyPageButton.current(activity);
        final HotelInfo hotel = c.hotel;
        final Stay stay = c.stay;
        if (!strikeShown || hotel == null || stay == null || Double.isNaN(hotel.strike) || !hotel.hasPrice()) {
            KEYS.remove(line);
            line.setVisibility(View.GONE);
            return;
        }
        // The badges of the price shown ("Genius discount", "Mobile-only price") come with the
        // room's price, which the hotel object may not have.
        hotel.memberDiscount = HotelInfo.memberDiscount(shownBadges(),
                hotel.memberDiscount);
        final String key = hotel.id + "|" + stay + "|" + hotel.price + "|" + hotel.strike + "|" + hotel.currency + "|" + hotel.memberDiscount;
        if (key.equals(KEYS.get(line))) return;
        KEYS.put(line, key);
        final int hotelId = hotel.id;
        PriceRecorder.load(activity, db -> db.forStay(hotelId, stay), (List<PriceDb.Row> rows) -> {
            if (!key.equals(KEYS.get(line))) return; // Changed meanwhile.
            StrikeCheck.Verdict verdict = StrikeCheck.check(hotel, stay, rows, System.currentTimeMillis());
            if (verdict == null) {
                line.setVisibility(View.GONE);
                return;
            }
            Panel.Colors colors = Panel.Colors.of(activity);
            line.setText(verdict.text);
            line.setContentDescription(verdict.text);
            line.setTextColor(StrikeCheck.color(colors, verdict.tone));
            line.setVisibility(View.VISIBLE);
        });
    }

    /** The check each line shows now, so the same check isn't read again. */
    private static final Map<TextView, String> KEYS = new WeakHashMap<>();
}
