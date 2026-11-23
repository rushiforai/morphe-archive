package app.jofslash.extension.booking;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Used by the Show price per night patch. A search result card shows the price of the whole stay
 * ("Price for 3 nights, 2 adults", "€ 135"). For a stay of 2 or more nights the patch adds a small
 * line under that price with the price per night ("€ 45 per night"): the total the card shows
 * divided by the nights, written the way the card writes the total.
 *
 * <p>Each card has an "abu.search.OpenPropertyPage" action whose property carries the stay's dates
 * (checkinDate, checkoutDate: "2026-11-28") and the price breakdown (see {@link UpfrontPrice}). The
 * total is the breakdown's grossPrice, or the all-inclusive total when Show full price up front put
 * that in the card. The new line goes into the card's column, right after the item that shows the
 * total, and the card's screen reader text gets "45 EUR per night." after the price.
 */
final class PricePerNight {
    private static final String TAG = "JoFSlash";
    private static final String OPEN_PROPERTY_PAGE = "abu.search.OpenPropertyPage";
    private static final String COLUMN = "core.layout.Column";
    private static final String LABEL = "bui.Label";
    private static final String LABEL_FONT = "small_1";
    private static final String LABEL_COLOR = "foreground_alt";

    private PricePerNight() {
    }

    /** True when the page may have cards this patch changes. */
    static boolean mayApply(String json) {
        return json.contains(OPEN_PROPERTY_PAGE) && json.contains("checkoutDate");
    }

    /**
     * Adds the per-night line to the cards of a server-driven page. [shown] has the totals Show
     * full price up front put in the cards (breakdown -> {total, text}); may be empty. Returns how
     * many cards changed.
     */
    static int addToCards(Object root, Map<JSONObject, Object[]> shown) throws Exception {
        IdentityHashMap<Object, JSONObject> cardProperty = new IdentityHashMap<>();
        if (scan(root, cardProperty).isEmpty()) return 0;
        return add(root, cardProperty, shown);
    }

    /**
     * Finds the OpenPropertyPage properties under [node]. Every part of the page with exactly one
     * of them (the card, and the parts inside it) is put in [single] with that property.
     */
    private static List<JSONObject> scan(Object node, IdentityHashMap<Object, JSONObject> single) {
        List<JSONObject> found = new ArrayList<>();
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            if (OPEN_PROPERTY_PAGE.equals(object.optString("type"))) {
                JSONObject props = object.optJSONObject("props");
                JSONObject property = (props != null ? props : object).optJSONObject("property");
                if (property != null && !containsSame(found, property)) found.add(property);
            }
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                Object child = object.opt(keys.next());
                if (child instanceof JSONObject || child instanceof JSONArray) addAll(found, scan(child, single));
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) {
                Object child = array.opt(i);
                if (child instanceof JSONObject || child instanceof JSONArray) addAll(found, scan(child, single));
            }
        }
        if (found.size() == 1) single.put(node, found.get(0));
        return found;
    }

    /** A card can have the same property twice (two tap actions): those count as one. */
    private static boolean containsSame(List<JSONObject> list, JSONObject property) {
        int id = property.optInt("id", -1);
        for (JSONObject other : list) {
            if (other == property || (id != -1 && other.optInt("id", -2) == id)) return true;
        }
        return false;
    }

    private static void addAll(List<JSONObject> into, List<JSONObject> from) {
        for (JSONObject property : from) {
            if (!containsSame(into, property)) into.add(property);
        }
    }

    private static int add(Object node, IdentityHashMap<Object, JSONObject> cardProperty,
            Map<JSONObject, Object[]> shown) throws Exception {
        JSONObject property = cardProperty.get(node);
        if (property != null) return addToCard(node, property, shown) ? 1 : 0;
        int changed = 0;
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) changed += add(object.opt(keys.next()), cardProperty, shown);
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) changed += add(array.opt(i), cardProperty, shown);
        }
        return changed;
    }

    /** Nights between "2026-11-28" and "2026-12-01", or 0 when the dates can't be read. */
    static long nights(String checkin, String checkout) {
        try {
            if (checkin == null || checkout == null) return 0;
            return java.time.temporal.ChronoUnit.DAYS.between(
                    java.time.LocalDate.parse(checkin.trim()), java.time.LocalDate.parse(checkout.trim()));
        } catch (Throwable t) {
            return 0;
        }
    }

    private static boolean addToCard(Object card, JSONObject property, Map<JSONObject, Object[]> shown)
            throws Exception {
        long nights = nights(property.optString("checkinDate", null), property.optString("checkoutDate", null));
        if (nights < 2 || nights > 365) return false;
        JSONObject breakdown = property.optJSONObject("priceBreakdown");
        if (breakdown == null) return false;
        JSONObject grossPrice = breakdown.optJSONObject("grossPrice");
        if (grossPrice == null) return false;
        String currency = grossPrice.optString("currency", "");

        // The total the card shows, and how the card writes it.
        double total;
        String totalText;
        Object[] upfront = shown != null ? shown.get(breakdown) : null;
        if (upfront != null && upfront[0] instanceof Double && upfront[1] instanceof String) {
            total = (Double) upfront[0];
            totalText = (String) upfront[1];
        } else {
            total = grossPrice.optDouble("value", Double.NaN);
            totalText = grossPrice.optString("amountRounded", "");
        }
        if (Double.isNaN(total) || !(total > 0) || totalText.trim().isEmpty()) return false;

        List<String[]> texts = new ArrayList<>();
        UpfrontPrice.collectTexts(card, texts);
        boolean showsTotal = false;
        for (String[] text : texts) {
            if (text[0].equals("a11y")) continue;
            if (UpfrontPrice.containsAmount(text[1], totalText)) showsTotal = true;
        }
        if (!showsTotal) return false;
        // The card already shows a price per night (Booking tests that): leave it.
        for (String key : new String[]{"grossPricePerNight", "averagePricePerNight"}) {
            JSONObject night = breakdown.optJSONObject(key);
            String nightText = night != null ? night.optString("amountRounded", "") : "";
            if (nightText.trim().isEmpty() || nightText.equals(totalText)) continue;
            for (String[] text : texts) {
                if (!text[0].equals("a11y") && UpfrontPrice.containsAmount(text[1], nightText)) return false;
            }
        }

        double perNight = total / nights;
        String grouping = UpfrontPrice.groupingOf(totalText, grossPrice.optString("amountRounded", null));
        String perNightText = UpfrontPrice.formatLike(totalText, perNight, grouping);
        if (perNightText == null) return false;
        String line = String.format(Strings.PER_NIGHT, perNightText);
        for (String[] text : texts) {
            if (text[1].equals(line)) return false;
        }

        if (!insertAfterPrice(card, totalText, line)) return false;
        if (!currency.isEmpty()) {
            String a11yTotal = UpfrontPrice.plain(Math.rint(total)) + " " + currency;
            String a11yLine = String.format(Strings.PER_NIGHT, UpfrontPrice.plain(Math.rint(perNight)) + " " + currency) + ".";
            addToA11y(card, a11yTotal, a11yLine);
        }
        Log.d(TAG, "Per night: " + totalText + " / " + nights + " = " + perNightText);
        return true;
    }

    /**
     * Puts the line into the innermost column that has an item showing [totalText], right after
     * that item. Returns false when there is no such column.
     */
    private static boolean insertAfterPrice(Object node, String totalText, String line) throws Exception {
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            String type = object.optString("type");
            if (OPEN_PROPERTY_PAGE.equals(type)) return false;
            JSONObject props = object.optJSONObject("props");
            JSONArray items = props != null ? props.optJSONArray("items") : null;
            if (items != null && type.startsWith("core.layout.")) {
                for (int i = 0; i < items.length(); i++) {
                    Object item = items.opt(i);
                    if (!showsAmount(item, totalText)) continue;
                    if (insertAfterPrice(item, totalText, line)) return true;
                    if (!COLUMN.equals(type)) return false;
                    insert(items, i + 1, label(line, alignmentOf(item)));
                    return true;
                }
                return false;
            }
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                Object child = object.opt(keys.next());
                if (child instanceof JSONObject || child instanceof JSONArray) {
                    if (showsAmount(child, totalText) && insertAfterPrice(child, totalText, line)) return true;
                }
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) {
                Object child = array.opt(i);
                if (showsAmount(child, totalText) && insertAfterPrice(child, totalText, line)) return true;
            }
        }
        return false;
    }

    private static boolean showsAmount(Object node, String amount) {
        List<String[]> texts = new ArrayList<>();
        UpfrontPrice.collectTexts(node, texts);
        for (String[] text : texts) {
            if (!text[0].equals("a11y") && UpfrontPrice.containsAmount(text[1], amount)) return true;
        }
        return false;
    }

    /** The "alignment" of the first label in [node] ("trailing" for the card's price), or null. */
    private static String alignmentOf(Object node) {
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            JSONObject props = object.optJSONObject("props");
            String type = object.optString("type");
            if (props != null && (LABEL.equals(type) || "bui.ComposedLabel".equals(type))) {
                String alignment = props.optString("alignment", "");
                if (!alignment.isEmpty()) return alignment;
            }
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                String found = alignmentOf(object.opt(keys.next()));
                if (found != null) return found;
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) {
                String found = alignmentOf(array.opt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static JSONObject label(String text, String alignment) throws Exception {
        JSONObject props = new JSONObject().put("font", LABEL_FONT).put("color", LABEL_COLOR).put("text", text);
        if (alignment != null) props.put("alignment", alignment);
        return new JSONObject().put("type", LABEL).put("props", props);
    }

    /** org.json can't insert, so the items after [index] are moved up by one. */
    private static void insert(JSONArray items, int index, Object value) throws Exception {
        for (int i = items.length(); i > index; i--) items.put(i, items.get(i - 1));
        items.put(index, value);
    }

    /**
     * Adds [a11yLine] to the card's screen reader texts that say the total ("... Current price 135
     * EUR."): after the sentence with the total, or at the end.
     */
    private static void addToA11y(Object node, String a11yTotal, String a11yLine) throws Exception {
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            if (OPEN_PROPERTY_PAGE.equals(object.optString("type"))) return;
            List<String> names = new ArrayList<>();
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) names.add(keys.next());
            for (String key : names) {
                Object child = object.opt(key);
                if (child instanceof String && UpfrontPrice.isA11yKey(key)) {
                    String text = (String) child;
                    if (text.contains(a11yLine) || !UpfrontPrice.containsAmount(text, a11yTotal)) continue;
                    int at = text.indexOf(a11yTotal);
                    int end = text.indexOf('.', at + a11yTotal.length());
                    // "Current price 135 EUR.." ends with two dots: keep them together.
                    while (end >= 0 && end + 1 < text.length() && text.charAt(end + 1) == '.') end++;
                    String changed = end < 0 ? text + "\n" + a11yLine
                            : text.substring(0, end + 1) + "\n" + a11yLine + text.substring(end + 1);
                    object.put(key, changed);
                } else {
                    addToA11y(child, a11yTotal, a11yLine);
                }
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) addToA11y(array.opt(i), a11yTotal, a11yLine);
        }
    }
}
