package semicoloncolonel.mobilestream.extension.checkout51;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * Checkout 51: lists the gas offers over the map.
 *
 * Google Maps draws nothing in a patched Checkout 51, because the app's Maps
 * key accepts only Checkout 51's own signature. {@link OsmMapView} draws an
 * OpenStreetMap map in its place, above a list of the offers. The offers
 * still arrive: the
 * gas map fragment's markers observer (GupMapFragment.onViewCreated$lambda$2)
 * receives them as a Resource of (GupOffer, marker) pairs. {@link #onMarkers}
 * runs first in that observer and draws one row per offer inside the MapView,
 * so the app's own controls and its bottom details bar stay on top. Tapping a
 * row sets the view model's selected offer, the same as tapping a pin.
 *
 * Everything is read with reflection from Checkout 51's unobfuscated model
 * classes, and nothing leaves the device. Any failure leaves the screen as it
 * was.
 */
@SuppressWarnings("unused")
public final class GasOfferList {
    private static final String TAG = "MSP-C51-GAS";
    private static final String LIST_TAG = "msp-gas-offer-list";
    private static final int GREEN = 0xFF14866D;

    private GasOfferList() {
    }

    /** Called with the fragment and the markers Resource. Never throws. */
    public static void onMarkers(Object fragment, Object resource) {
        try {
            if (resource == null || !"SUCCESS".equals(String.valueOf(call(resource, "getStatus")))) {
                return;
            }
            Object data = call(resource, "getData");
            List<Object> offers = new ArrayList<>();
            if (data instanceof List) {
                for (Object pair : (List<?>) data) {
                    Object offer = offerIn(pair);
                    if (offer != null) {
                        offers.add(offer);
                    }
                }
            }
            View root = (View) call(fragment, "getView");
            if (root == null) {
                return;
            }
            int mapId = root.getResources().getIdentifier("map_holder", "id", root.getContext().getPackageName());
            View map = mapId == 0 ? null : root.findViewById(mapId);
            if (!(map instanceof FrameLayout)) {
                Log.w(TAG, "no map view to draw the list in");
                return;
            }
            show((FrameLayout) map, fragment, offers);
        } catch (Throwable t) {
            Log.w(TAG, "could not list gas offers: " + t);
        }
    }

    private static void show(FrameLayout map, Object fragment, List<Object> offers) {
        Context context = map.getContext();
        View old = map.findViewWithTag(LIST_TAG);
        if (old != null) {
            map.removeView(old);
        }

        Collections.sort(offers, (a, b) -> Double.compare(distance(a), distance(b)));

        LinearLayout panel = new LinearLayout(context);
        panel.setTag(LIST_TAG);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setBackgroundColor(Color.WHITE);
        panel.setClickable(true);

        // The OpenStreetMap view on top, with a pin per offer showing its
        // cash back in cents. Tapping a pin selects the offer, as in the app.
        OsmMapView osm = new OsmMapView(context);
        List<OsmMapView.Pin> pins = new ArrayList<>();
        for (Object offer : offers) {
            Object site = call(offer, "getSiteLocation");
            Object lat = site == null ? null : call(site, "getLatitude");
            Object lon = site == null ? null : call(site, "getLongitude");
            if (lat instanceof Double && lon instanceof Double) {
                int cents = regularCashBackCents(offer);
                pins.add(new OsmMapView.Pin((Double) lat, (Double) lon, cents > 0 ? cents + "¢" : null, offer));
            }
        }
        osm.setPins(pins);
        osm.setOnPinClick(tag -> select(fragment, tag));
        panel.addView(osm, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        ScrollView scroll = new ScrollView(context);
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(context, 16);
        // Room at the bottom for the details bar, which opens over the list.
        column.setPadding(0, dp(context, 12), 0, dp(context, 160));
        scroll.addView(column);
        panel.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        TextView heading = text(context, offers.isEmpty()
                ? "No gas offers in this area."
                : offers.size() + " gas offers nearby", 18, true, Color.BLACK);
        heading.setPadding(pad, 0, pad, dp(context, 8));
        column.addView(heading);

        for (Object offer : offers) {
            column.addView(row(context, fragment, offer, pad, osm));
        }

        map.addView(panel, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        map.post(panel::bringToFront);
        Log.i(TAG, "listed " + offers.size() + " gas offers");
    }

    private static View row(Context context, Object fragment, Object offer, int pad, OsmMapView osm) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(pad, dp(context, 12), pad, dp(context, 12));
        TypedValue ripple = new TypedValue();
        if (context.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true)) {
            row.setBackgroundResource(ripple.resourceId);
        }

        String name = string(call(offer, "getText"));
        if (name == null || name.isEmpty()) {
            name = string(call(offer, "getName"));
        }
        row.addView(text(context, name == null ? "Gas station" : name, 16, true, Color.BLACK));

        Object site = call(offer, "getSiteLocation");
        String address = site == null ? null : string(call(site, "getAddress1"));
        String locality = site == null ? null : string(call(site, "getLocality"));
        StringBuilder where = new StringBuilder();
        if (address != null) where.append(address);
        if (locality != null) where.append(where.length() > 0 ? ", " : "").append(locality);
        if (where.length() > 0) {
            row.addView(text(context, where.toString(), 14, false, 0xFF555555));
        }

        StringBuilder deal = new StringBuilder();
        double price = regularPrice(offer);
        if (price > 0) {
            deal.append(String.format(Locale.US, "$%.2f/gal", price));
        }
        int cents = regularCashBackCents(offer);
        if (cents > 0) {
            deal.append(deal.length() > 0 ? "  ·  " : "").append(cents).append("¢/gal cash back");
        }
        if (deal.length() > 0) {
            row.addView(text(context, deal.toString(), 14, true, GREEN));
        }

        row.setOnClickListener(v -> {
            osm.setSelected(offer);
            select(fragment, offer);
        });
        return row;
    }

    /**
     * The same as tapping the offer's pin: the offer goes into the view
     * model's selectedOffer, which opens the details bar and which the
     * Details screen reads.
     */
    private static void select(Object fragment, Object offer) {
        try {
            Field field = fragment.getClass().getDeclaredField("viewModel");
            field.setAccessible(true);
            Object selected = call(field.get(fragment), "getSelectedOffer");
            selected.getClass().getMethod("setValue", Object.class).invoke(selected, offer);
        } catch (Throwable t) {
            Log.w(TAG, "could not select offer: " + t);
        }
    }

    // ── Details screen ─────────────────────────────────────────────────────

    /**
     * Called at the start of GupDetailsFragment.onViewCreated. The Details
     * screen's Google map is blank for the same reason, so an OpenStreetMap
     * view with the station takes its place, with a Directions button that
     * opens the station in the maps app you choose.
     */
    public static void onDetailsView(Object fragment, View root) {
        try {
            int mapId = root.getResources().getIdentifier("mapView", "id", root.getContext().getPackageName());
            View map = mapId == 0 ? null : root.findViewById(mapId);
            if (!(map instanceof FrameLayout)) {
                Log.w(TAG, "no details map to cover (id " + mapId + ", view " + map + ")");
                return;
            }
            Context context = map.getContext();
            FrameLayout cover = new FrameLayout(context);
            cover.setClickable(true);
            // The station on an OpenStreetMap view. Its location is bound a
            // moment after the screen is created, so it is read once it is set.
            OsmMapView osm = new OsmMapView(context);
            cover.addView(osm, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            showStation(fragment, osm, 0);
            TextView button = text(context, "Directions", 14, true, Color.WHITE);
            button.setGravity(Gravity.CENTER);
            android.graphics.drawable.GradientDrawable pill = new android.graphics.drawable.GradientDrawable();
            pill.setColor(GREEN);
            pill.setCornerRadius(dp(context, 20));
            button.setBackground(pill);
            button.setElevation(dp(context, 2));
            button.setPadding(dp(context, 18), dp(context, 8), dp(context, 18), dp(context, 8));
            button.setOnClickListener(v -> openDirections(fragment, context));
            FrameLayout.LayoutParams buttonParams = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.END);
            buttonParams.setMargins(0, dp(context, 12), dp(context, 12), 0);
            cover.addView(button, buttonParams);
            FrameLayout frame = (FrameLayout) map;
            frame.addView(cover, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            // The Maps SDK clears the MapView and adds its own views
            // afterwards; keep the cover in it and in front.
            frame.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() {
                @Override
                public void onChildViewAdded(View parent, View child) {
                    if (child != cover) {
                        frame.post(cover::bringToFront);
                    }
                }

                @Override
                public void onChildViewRemoved(View parent, View child) {
                    // MapView.onCreate clears its children; put the cover back.
                    if (child == cover) {
                        frame.post(() -> {
                            if (cover.getParent() == null) {
                                frame.addView(cover, new FrameLayout.LayoutParams(
                                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
                            }
                        });
                    }
                }
            });
            frame.post(cover::bringToFront);
        } catch (Throwable t) {
            Log.w(TAG, "could not cover the details map: " + t);
        }
    }

    private static void showStation(Object fragment, OsmMapView osm, int attempt) {
        try {
            Field field = fragment.getClass().getDeclaredField("savedLocation");
            field.setAccessible(true);
            Object site = field.get(fragment);
            Object lat = call(site, "getLatitude");
            Object lon = call(site, "getLongitude");
            if (lat instanceof Double && lon instanceof Double) {
                List<OsmMapView.Pin> pins = new ArrayList<>();
                pins.add(new OsmMapView.Pin((Double) lat, (Double) lon, null, site));
                osm.setPins(pins);
                return;
            }
        } catch (Throwable t) {
            Log.w(TAG, "could not read the station location: " + t);
            return;
        }
        if (attempt < 20) {
            osm.postDelayed(() -> showStation(fragment, osm, attempt + 1), 250);
        }
    }

    private static void openDirections(Object fragment, Context context) {
        try {
            Field field = fragment.getClass().getDeclaredField("savedLocation");
            field.setAccessible(true);
            Object site = field.get(fragment);
            Object lat = call(site, "getLatitude");
            Object lng = call(site, "getLongitude");
            if (!(lat instanceof Double) || !(lng instanceof Double)) {
                return;
            }
            String place = String.format(Locale.US, "%f,%f", (Double) lat, (Double) lng);
            // The full address, as the Details screen shows it: "500 El Camino
            // Real, San Carlos, CA 94070". Maps apps search it; the
            // coordinates are the fallback when there is no address.
            String address = fullAddress(site);
            String query = address == null ? place : android.net.Uri.encode(address);
            android.content.Intent intent = new android.content.Intent(android.content.Intent.ACTION_VIEW,
                    android.net.Uri.parse("geo:" + place + "?q=" + query));
            Log.i(TAG, "directions: " + intent.getData());
            intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(android.content.Intent.createChooser(intent, "Directions"));
        } catch (Throwable t) {
            Log.w(TAG, "could not open directions: " + t);
        }
    }

    private static String fullAddress(Object site) {
        String street = string(call(site, "getAddress1"));
        if (street == null) {
            return null;
        }
        StringBuilder out = new StringBuilder(street);
        String city = string(call(site, "getLocality"));
        if (city != null) out.append(", ").append(city);
        String region = string(call(site, "getRegion"));
        String postCode = string(call(site, "getPostCode"));
        if (region != null || postCode != null) {
            out.append(", ");
            if (region != null) out.append(region);
            if (postCode != null) out.append(region != null ? " " : "").append(postCode);
        }
        return out.toString();
    }

    // ── Model reading ──────────────────────────────────────────────────────

    /** The GupOffer in a (GupOffer, marker) pair, whatever the pair's field names. */
    private static Object offerIn(Object pair) {
        if (pair == null) {
            return null;
        }
        for (Field field : pair.getClass().getDeclaredFields()) {
            try {
                field.setAccessible(true);
                Object value = field.get(pair);
                if (value != null && value.getClass().getName().endsWith(".GupOffer")) {
                    return value;
                }
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static double distance(Object offer) {
        Object value = call(offer, "getDistance");
        return value instanceof Double ? (Double) value : Double.MAX_VALUE;
    }

    private static double regularPrice(Object offer) {
        Object state = call(offer, "getOfferState");
        Object gasPrice = state == null ? null : call(state, "getGasPrice");
        Object prices = gasPrice == null ? null : call(gasPrice, "getPrice");
        Object regular = prices == null ? null : call(prices, "getREGULAR");
        Object amount = regular == null ? null : call(regular, "getAmount");
        return amount instanceof Double ? (Double) amount : -1;
    }

    private static int regularCashBackCents(Object offer) {
        Object discounts = call(offer, "getDiscounts");
        if (!(discounts instanceof List)) {
            return 0;
        }
        for (Object discount : (List<?>) discounts) {
            if (!"REGULAR".equalsIgnoreCase(string(call(discount, "getGasType")))) {
                continue;
            }
            Object perGallon = call(discount, "getDiscountPerGallon");
            Object amount = perGallon == null ? null : call(perGallon, "getAmount");
            if (amount instanceof Double) {
                return (int) Math.round((Double) amount * 100);
            }
        }
        return 0;
    }

    // ── Helpers ────────────────────────────────────────────────────────────

    private static Object call(Object target, String name) {
        if (target == null) {
            return null;
        }
        try {
            Method method = target.getClass().getMethod(name);
            return method.invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }

    private static String string(Object value) {
        if (value == null) {
            return null;
        }
        String s = value.toString().trim();
        return s.isEmpty() ? null : s;
    }

    private static TextView text(Context context, String value, int sp, boolean bold, int color) {
        TextView view = new TextView(context);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        view.setGravity(Gravity.START);
        if (bold) {
            view.setTypeface(Typeface.DEFAULT_BOLD);
        }
        return view;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
