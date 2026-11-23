package app.jofslash.extension.booking;

import android.content.Context;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Used by the Show full price up front patch. Booking.com prices come with three amounts: the
 * gross price it shows, the charges it leaves out of that price ("excluded", such as a city tax or
 * a cleaning fee paid at the property) and the two together ("all inclusive"). Where the excluded
 * part is known and more than zero, the app shows the gross price and a "+ € 12 taxes and charges"
 * line under it. The patch shows the all-inclusive price instead, and says what it includes.
 *
 * <p>Search results are a server-driven page. Each result card has an "abu.search.OpenPropertyPage"
 * action (what a tap on the card does) whose property carries the price breakdown:
 * <pre>
 *   priceBreakdown: { grossPrice: { value, amount, amountRounded, currency }, excludedPrice: {...},
 *     allInclusivePrice: {...}, strikethroughPrice: {...}, grossPricePerNight: {...},
 *     averagePricePerNight: {...}, chargesInfo: "+ € 12 taxes and charges",
 *     hasIncalculableCharges: false, taxExceptions: [...] }
 * </pre>
 * The card's labels show grossPrice.amountRounded and chargesInfo as text. {@link #rewriteCards}
 * finds each card (the largest part of the page with just one such action), and in its labels and
 * screen reader text puts the all-inclusive amounts in place of the gross ones and replaces the
 * chargesInfo line. A crossed-out price and a per-night price get the excluded charges added too,
 * so the discount Booking shows stays the same.
 *
 * <p>Map cards, the property page and the room list are the app's own views: they get their price
 * from a PriceData object, which {@link #priceData} changes the same way after it is made.
 *
 * <p>Debugging: {@code adb shell setprop log.tag.JoFSlashDump VERBOSE} (then restart the app) saves
 * every search results page that has prices to
 * /sdcard/Android/data/com.booking/files/saba-dumps/ and logs each card's price breakdown under the
 * tag JoFSlash.
 */
@SuppressWarnings("unused")
public final class UpfrontPrice {
    private static final String TAG = "JoFSlash";
    private static final String DUMP_TAG = "JoFSlashDump";
    private static final String OPEN_PROPERTY_PAGE = "abu.search.OpenPropertyPage";
    private static final String LABEL = "bui.Label";
    private static final String COMPOSED_LABEL = "bui.ComposedLabel";
    /** Below this the excluded charges count as none. */
    private static final double CENT = 0.005;
    private static final int MAX_DUMPS = 20;

    private UpfrontPrice() {
    }

    // Search results (server-driven page).

    /** True when the page may have prices this patch changes. */
    static boolean mayApply(String json) {
        return json.contains("excludedPrice") || (debug() && json.contains(OPEN_PROPERTY_PAGE));
    }

    /**
     * Changes the cards of a server-driven page. Returns how many cards changed. For each card
     * changed, [shown] gets the card's price breakdown -> the total it shows now and its text, so
     * the Show price per night patch divides the price the card shows.
     */
    static int rewriteCards(Object root, Map<JSONObject, Object[]> shown) throws Exception {
        boolean debug = debug();
        if (debug) dump(root);
        IdentityHashMap<Object, JSONObject> cardBreakdown = new IdentityHashMap<>();
        Map<Integer, JSONObject> all = scan(root, cardBreakdown);
        if (all.isEmpty()) return 0;
        return rewrite(root, cardBreakdown, shown, debug);
    }

    /**
     * Finds the OpenPropertyPage actions under [node], by property id. Every part of the page
     * with exactly one of them is put in [single] with its price breakdown.
     */
    private static Map<Integer, JSONObject> scan(Object node, IdentityHashMap<Object, JSONObject> single) {
        Map<Integer, JSONObject> found = new LinkedHashMap<>();
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            if (OPEN_PROPERTY_PAGE.equals(object.optString("type"))) {
                JSONObject props = object.optJSONObject("props");
                JSONObject property = (props != null ? props : object).optJSONObject("property");
                JSONObject breakdown = property != null ? property.optJSONObject("priceBreakdown") : null;
                if (breakdown != null) found.put(property.optInt("id", -1), breakdown);
            }
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                Object child = object.opt(keys.next());
                if (child instanceof JSONObject || child instanceof JSONArray) found.putAll(scan(child, single));
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) {
                Object child = array.opt(i);
                if (child instanceof JSONObject || child instanceof JSONArray) found.putAll(scan(child, single));
            }
        }
        if (found.size() == 1) single.put(node, found.values().iterator().next());
        return found;
    }

    private static int rewrite(Object node, IdentityHashMap<Object, JSONObject> cardBreakdown,
            Map<JSONObject, Object[]> shown, boolean debug) throws Exception {
        JSONObject breakdown = cardBreakdown.get(node);
        if (breakdown != null) return rewriteCard(node, breakdown, shown, debug) ? 1 : 0;
        int changed = 0;
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) changed += rewrite(object.opt(keys.next()), cardBreakdown, shown, debug);
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) changed += rewrite(array.opt(i), cardBreakdown, shown, debug);
        }
        return changed;
    }

    /** One amount of a price breakdown. */
    private static final class Amount {
        final double value;
        final String currency;
        /** As the server formats it: "€ 60", "1.234 €"; may be null. */
        final String rounded;
        final String exact;

        Amount(JSONObject price) {
            value = price.optDouble("value", Double.NaN);
            currency = price.optString("currency", "");
            rounded = nonEmpty(price.optString("amountRounded", null));
            exact = nonEmpty(price.optString("amount", null));
        }

        static Amount of(JSONObject breakdown, String key) {
            JSONObject price = breakdown.optJSONObject(key);
            if (price == null) return null;
            Amount amount = new Amount(price);
            return Double.isNaN(amount.value) ? null : amount;
        }
    }

    private static boolean rewriteCard(Object card, JSONObject breakdown, Map<JSONObject, Object[]> shown,
            boolean debug) throws Exception {
        Amount gross = Amount.of(breakdown, "grossPrice");
        Amount excluded = Amount.of(breakdown, "excludedPrice");
        Amount inclusive = Amount.of(breakdown, "allInclusivePrice");
        String chargesInfo = nonEmpty(breakdown.optString("chargesInfo", null));
        boolean incalculable = breakdown.optBoolean("hasIncalculableCharges", false);
        JSONArray exceptions = breakdown.optJSONArray("taxExceptions");
        boolean more = incalculable || (exceptions != null && exceptions.length() > 0);
        if (debug) {
            Log.d(TAG, "Price card: gross=" + describe(gross) + " excluded=" + describe(excluded)
                    + " allInclusive=" + describe(inclusive) + " chargesInfo=" + chargesInfo
                    + " incalculable=" + incalculable + " taxExceptions=" + (exceptions != null ? exceptions : "[]"));
        }
        if (gross == null || gross.rounded == null || excluded == null || !(excluded.value > CENT)) return false;
        if (!excluded.currency.isEmpty() && !gross.currency.isEmpty() && !excluded.currency.equals(gross.currency)) {
            return false;
        }

        double total = gross.value + excluded.value;
        String grouping = groupingOf(gross.rounded, inclusive != null ? inclusive.rounded : null);
        String totalText = inclusive != null && inclusive.rounded != null && Math.abs(inclusive.value - total) < 0.5
                ? inclusive.rounded : formatLike(gross.rounded, total, grouping);

        // Text Booking shows -> what to show instead.
        Map<String, String> replace = new LinkedHashMap<>();
        replace.put(gross.rounded, totalText);
        if (gross.exact != null) replace.put(gross.exact, formatLike(gross.exact, total, grouping));
        // The screen reader text says "Original price 79 EUR. Current price 59 EUR.", rounded.
        if (!gross.currency.isEmpty()) {
            replace.put(plain(Math.rint(gross.value)) + " " + gross.currency, plain(Math.rint(total)) + " " + gross.currency);
        }
        Amount strike = Amount.of(breakdown, "strikethroughPrice");
        if (strike != null && strike.rounded != null && strike.value > gross.value) {
            double strikeTotal = strike.value + excluded.value;
            replace.put(strike.rounded, formatLike(strike.rounded, strikeTotal, grouping));
            if (!gross.currency.isEmpty()) {
                replace.put(plain(Math.rint(strike.value)) + " " + gross.currency, plain(Math.rint(strikeTotal)) + " " + gross.currency);
            }
        }
        double ratio = gross.value > CENT ? total / gross.value : 1;
        for (String key : new String[]{"grossPricePerNight", "averagePricePerNight"}) {
            Amount night = Amount.of(breakdown, key);
            if (night != null && night.rounded != null && !replace.containsKey(night.rounded)) {
                replace.put(night.rounded, formatLike(night.rounded, night.value * ratio, grouping));
            }
        }
        for (Iterator<Map.Entry<String, String>> it = replace.entrySet().iterator(); it.hasNext(); ) {
            Map.Entry<String, String> entry = it.next();
            if (entry.getValue() == null || entry.getKey().equals(entry.getValue())) it.remove();
        }

        String excludedText = excluded.rounded != null ? excluded.rounded : formatLike(gross.rounded, excluded.value, grouping);
        String included = String.format(more ? Strings.UPFRONT_INCLUDED_MORE : Strings.UPFRONT_INCLUDED, excludedText);

        // Only when the card shows the gross price: otherwise it isn't the card the breakdown
        // describes, or Booking changed how it is drawn.
        List<String[]> texts = new ArrayList<>();
        collectTexts(card, texts);
        boolean showsPrice = false;
        for (String[] text : texts) {
            if (!text[0].equals("a11y") && containsAmount(text[1], gross.rounded)) showsPrice = true;
        }
        if (!showsPrice) {
            if (debug) Log.d(TAG, "Price card: no label shows " + gross.rounded + ", left as it is");
            return false;
        }

        changeTexts(card, replace, chargesInfo, included);
        if (shown != null) shown.put(breakdown, new Object[]{total, totalText});
        if (debug) Log.d(TAG, "Price card: " + gross.rounded + " -> " + totalText + ", " + chargesInfo + " -> " + included);
        return true;
    }

    /** The visible texts (["text", ...]) and screen reader texts (["a11y", ...]) of a card. */
    static void collectTexts(Object node, List<String[]> out) {
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            String type = object.optString("type");
            if (OPEN_PROPERTY_PAGE.equals(type)) return;
            JSONObject props = object.optJSONObject("props");
            if (props != null && LABEL.equals(type) && props.opt("text") instanceof String) {
                out.add(new String[]{"text", props.optString("text")});
            }
            if (props != null && COMPOSED_LABEL.equals(type) && props.optJSONArray("text") != null) {
                JSONArray spans = props.optJSONArray("text");
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < spans.length(); i++) {
                    JSONObject span = spans.optJSONObject(i);
                    if (span != null) sb.append(span.optString("text"));
                }
                out.add(new String[]{"text", sb.toString()});
            }
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                Object child = object.opt(key);
                if (child instanceof String && isA11yKey(key)) out.add(new String[]{"a11y", (String) child});
                else collectTexts(child, out);
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) collectTexts(array.opt(i), out);
        }
    }

    static boolean isA11yKey(String key) {
        return key.startsWith("accessibility") || key.equals("contentDescription");
    }

    /** Puts the new amounts into the texts of the card, but not into its price data. */
    private static void changeTexts(Object node, Map<String, String> replace, String chargesInfo, String included)
            throws Exception {
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            if (OPEN_PROPERTY_PAGE.equals(object.optString("type"))) return;
            Iterator<String> keys = object.keys();
            List<String> names = new ArrayList<>();
            while (keys.hasNext()) names.add(keys.next());
            for (String key : names) {
                Object child = object.opt(key);
                if (child instanceof String && (key.equals("text") || isA11yKey(key))) {
                    String text = (String) child;
                    String changed = text;
                    if (chargesInfo != null && changed.contains(chargesInfo)) changed = changed.replace(chargesInfo, included);
                    changed = replaceAmounts(changed, replace);
                    if (!changed.equals(text)) object.put(key, changed);
                } else {
                    changeTexts(child, replace, chargesInfo, included);
                }
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) changeTexts(array.opt(i), replace, chargesInfo, included);
        }
    }

    // Amounts in text.

    /** Whether [text] has [amount] as a whole amount ("€ 60" is not in "€ 600"). */
    static boolean containsAmount(String text, String amount) {
        int from = 0;
        while (true) {
            int at = text.indexOf(amount, from);
            if (at < 0) return false;
            if (isWhole(text, at, at + amount.length())) return true;
            from = at + 1;
        }
    }

    /**
     * Replaces every whole amount of [replace]'s keys in one pass, longest first, so a new amount
     * that equals another old one ("€ 60" -> "€ 70" while "€ 70" -> "€ 80") isn't replaced twice.
     */
    static String replaceAmounts(String text, Map<String, String> replace) {
        if (replace.isEmpty()) return text;
        String[] keys = replace.keySet().toArray(new String[0]);
        Arrays.sort(keys, (a, b) -> b.length() - a.length());
        StringBuilder sb = new StringBuilder();
        int i = 0;
        outer:
        while (i < text.length()) {
            for (String key : keys) {
                if (text.startsWith(key, i) && isWhole(text, i, i + key.length())) {
                    sb.append(replace.get(key));
                    i += key.length();
                    continue outer;
                }
            }
            sb.append(text.charAt(i));
            i++;
        }
        return sb.toString();
    }

    /** The amount at [start, end) isn't part of a longer number. */
    private static boolean isWhole(String text, int start, int end) {
        if (start > 0) {
            char before = text.charAt(start - 1);
            if (Character.isDigit(before)) return false;
            if ((before == '.' || before == ',') && start > 1 && Character.isDigit(text.charAt(start - 2))
                    && Character.isDigit(text.charAt(start))) return false;
        }
        if (end < text.length()) {
            char after = text.charAt(end);
            if (Character.isDigit(after) && Character.isDigit(text.charAt(end - 1))) return false;
            if ((after == '.' || after == ',') && end + 1 < text.length() && Character.isDigit(text.charAt(end + 1))
                    && Character.isDigit(text.charAt(end - 1))) return false;
        }
        return true;
    }

    /** "60" for 60.0, "60.40" for 60.4. */
    static String plain(double value) {
        if (Math.abs(value - Math.rint(value)) < CENT) return String.valueOf((long) Math.rint(value));
        return String.format(Locale.ROOT, "%.2f", value);
    }

    /** The grouping separator of the first of [templates] that has one ("1,234" -> ","), or null. */
    static String groupingOf(String... templates) {
        for (String template : templates) {
            if (template == null) continue;
            NumberShape shape = NumberShape.of(template);
            if (shape != null && shape.grouping != null) return shape.grouping;
        }
        return null;
    }

    /** How a number is written in a formatted amount. */
    private static final class NumberShape {
        String prefix, suffix, grouping, decimal;
        int decimals;

        static NumberShape of(String template) {
            int first = -1, last = -1;
            for (int i = 0; i < template.length(); i++) {
                if (Character.isDigit(template.charAt(i))) {
                    if (first < 0) first = i;
                    last = i;
                }
            }
            if (first < 0) return null;
            NumberShape shape = new NumberShape();
            shape.prefix = template.substring(0, first);
            shape.suffix = template.substring(last + 1);
            String number = template.substring(first, last + 1);
            int separator = -1;
            for (int i = number.length() - 1; i >= 0; i--) {
                if (!Character.isDigit(number.charAt(i))) {
                    separator = i;
                    break;
                }
            }
            if (separator < 0) return shape;
            int after = number.length() - separator - 1;
            if (after == 1 || after == 2) {
                shape.decimal = String.valueOf(number.charAt(separator));
                shape.decimals = after;
                for (int i = 0; i < separator; i++) {
                    if (!Character.isDigit(number.charAt(i))) {
                        shape.grouping = String.valueOf(number.charAt(i));
                        break;
                    }
                }
            } else {
                shape.grouping = String.valueOf(number.charAt(separator));
            }
            return shape;
        }
    }

    /** [value] written like [template]: "€ 60" and 72.4 give "€ 72". Null when [template] has no number. */
    static String formatLike(String template, double value, String groupingHint) {
        NumberShape shape = NumberShape.of(template);
        if (shape == null || Double.isNaN(value)) return null;
        String grouping = shape.grouping != null ? shape.grouping : groupingHint;
        if (grouping != null && grouping.equals(shape.decimal)) grouping = null;
        long whole;
        String fraction = "";
        if (shape.decimals > 0) {
            String fixed = String.format(Locale.ROOT, "%." + shape.decimals + "f", value);
            int dot = fixed.indexOf('.');
            whole = Long.parseLong(fixed.substring(0, dot));
            fraction = shape.decimal + fixed.substring(dot + 1);
        } else {
            whole = Math.round(value);
        }
        String digits = String.valueOf(Math.abs(whole));
        StringBuilder grouped = new StringBuilder();
        for (int i = 0; i < digits.length(); i++) {
            if (grouping != null && i > 0 && (digits.length() - i) % 3 == 0) grouped.append(grouping);
            grouped.append(digits.charAt(i));
        }
        return shape.prefix + (whole < 0 ? "-" : "") + grouped + fraction + shape.suffix;
    }

    private static String describe(Amount amount) {
        if (amount == null) return "none";
        return amount.value + " " + amount.currency + " (" + amount.rounded + ")";
    }

    private static String nonEmpty(String s) {
        return s == null || s.trim().isEmpty() ? null : s;
    }

    // Debug dumps.

    private static Boolean debug;
    private static int dumps;

    private static boolean debug() {
        if (debug == null) {
            try {
                debug = Log.isLoggable(DUMP_TAG, Log.VERBOSE);
            } catch (Throwable t) {
                debug = false;
            }
        }
        return debug;
    }

    /** Saves the page to the app's external files, where adb can read it. */
    private static void dump(Object root) {
        if (dumps >= MAX_DUMPS) return;
        try {
            Context context = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (context == null) return;
            File dir = new File(context.getExternalFilesDir(null), "saba-dumps");
            if (!dir.isDirectory() && !dir.mkdirs()) return;
            File file = new File(dir, "page-" + System.currentTimeMillis() + "-" + (dumps++) + ".json");
            String text = root instanceof JSONObject ? ((JSONObject) root).toString(1) : ((JSONArray) root).toString(1);
            try (FileOutputStream out = new FileOutputStream(file)) {
                out.write(text.getBytes(StandardCharsets.UTF_8));
            }
            Log.d(TAG, "Saved a server-driven page to " + file);
        } catch (Throwable t) {
            Log.w(TAG, "Couldn't save a server-driven page", t);
        }
    }

    // The app's own price views.

    private static Constructor<?> basicPrice;
    private static Constructor<?> bMoney;

    /**
     * The prices this class put into each PriceData: main, crossed-out, per night. The app can
     * set a price again after making the PriceData (the room list does), and it turns the same
     * PriceData into views more than once, so a price is only changed when it isn't one of these.
     */
    private static final Map<Object, Object[]> CHANGED = new java.util.WeakHashMap<>();

    /**
     * Called by PriceDataToPropsConverter.createProsFromPriceData, which turns a PriceData
     * (com.booking.price.data.PriceData) into the price views of map cards, the property page,
     * rooms and wishlists. When the price leaves out charges that are known, they are added to
     * the main, crossed-out and per-night prices, and the "+ € 12 taxes and charges" line says
     * they are included.
     */
    public static synchronized void priceData(Object priceData) {
        if (priceData == null) return;
        try {
            Object details = HotelInfo.field(priceData, "hotelPriceDetails");
            if (details == null) return;
            double excluded = number(HotelInfo.call(details, "getTotalExcludedCharges"));
            if (debug()) Log.d(TAG, "PriceData: excluded=" + excluded + " gross=" + HotelInfo.call(details, "getPriceWithoutExcludedCharges") + " main=" + HotelInfo.call(HotelInfo.field(priceData, "mainPrice"), "toAmount"));
            if (!(excluded > CENT)) return;
            String currency = HotelInfo.str(HotelInfo.call(details, "getCurrencyCode"));
            Object main = HotelInfo.field(priceData, "mainPrice");
            if (main == null) return;
            String mainCurrency = HotelInfo.str(HotelInfo.call(main, "getCurrencyCode"));
            if (mainCurrency == null || (currency != null && !currency.isEmpty() && !currency.equals(mainCurrency))) return;
            if (!find()) return;

            Object[] changed = CHANGED.get(priceData);
            if (changed == null) {
                changed = new Object[3];
                CHANGED.put(priceData, changed);
            }
            double gross = number(HotelInfo.call(details, "getPriceWithoutExcludedCharges"));
            if (main != changed[0]) {
                double amount = number(HotelInfo.call(main, "toAmount"));
                if (Double.isNaN(amount)) return;
                changed[0] = basicPrice.newInstance(amount + excluded, mainCurrency);
                set(priceData, "mainPrice", changed[0]);
            }
            Object strike = HotelInfo.field(priceData, "strikeThroughPrice");
            if (strike != null && strike != changed[1]
                    && mainCurrency.equals(HotelInfo.str(HotelInfo.call(strike, "getCurrencyCode")))) {
                double amount = number(HotelInfo.call(strike, "toAmount"));
                if (!Double.isNaN(amount)) {
                    changed[1] = basicPrice.newInstance(amount + excluded, mainCurrency);
                    set(priceData, "strikeThroughPrice", changed[1]);
                }
            }
            Object night = HotelInfo.field(priceData, "averagePricePerNight");
            if (night != null && night != changed[2] && gross > CENT
                    && mainCurrency.equals(HotelInfo.str(HotelInfo.call(night, "getCurrencyCode")))) {
                double amount = number(HotelInfo.call(night, "getAmount"));
                if (!Double.isNaN(amount)) {
                    changed[2] = bMoney.newInstance(amount * (gross + excluded) / gross, mainCurrency);
                    set(priceData, "averagePricePerNight", changed[2]);
                }
            }

            Object excludedPrice = basicPrice.newInstance(excluded, mainCurrency);
            String excludedText = HotelInfo.str(HotelInfo.call(excludedPrice, "getFormattedPriceRounded"));
            Object more = HotelInfo.call(details, "hasIncalculableOrTaxException");
            String text = String.format(Boolean.TRUE.equals(more) ? Strings.UPFRONT_INCLUDED_MORE : Strings.UPFRONT_INCLUDED,
                    excludedText);
            if (!text.equals(HotelInfo.call(details, "getMessageForTaxesAndCharges"))) {
                details.getClass().getMethod("setMessageForTaxesAndCharges", String.class).invoke(details, text);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Couldn't add the excluded charges to a price", t);
        }
    }

    /**
     * Called first by PropertyMarkerPriceProvider.getPrice, the price on a map marker. Returns
     * the price with the excluded charges, or null to let the app show its own.
     */
    public static CharSequence markerPrice(Object provider) {
        try {
            Object marker = HotelInfo.field(provider, "propertyMarker");
            Object breakdown = HotelInfo.field(HotelInfo.field(marker, "priceInfo"), "compositePriceBreakdown");
            if (breakdown == null) return null;
            Object gross = HotelInfo.field(breakdown, "grossAmount");
            Object excluded = HotelInfo.field(breakdown, "excludedAmount");
            if (gross == null) return null;
            double grossValue = number(HotelInfo.field(gross, "amountUnformatted"));
            double excludedValue = excluded != null ? number(HotelInfo.field(excluded, "amountUnformatted")) : Double.NaN;
            String currency = HotelInfo.str(HotelInfo.field(gross, "currency"));
            if (!(excludedValue > CENT) || Double.isNaN(grossValue) || currency == null) return null;
            if (!currency.equals(HotelInfo.str(HotelInfo.field(excluded, "currency")))) return null;
            // Per-night prices on markers are an experiment; leave those to the app.
            Object configs = HotelInfo.field(breakdown, "displayConfigs");
            if (configs instanceof Map && Boolean.TRUE.equals(((Map<?, ?>) configs).get("use_nightly_prices"))
                    && Boolean.TRUE.equals(((Map<?, ?>) configs).get("use_nightly_as_dominant"))) return null;
            Class<?> simplePrice = Class.forName("com.booking.price.SimplePrice");
            Object price = simplePrice.getMethod("create", String.class, double.class)
                    .invoke(null, currency, grossValue + excludedValue);
            price = simplePrice.getMethod("convertToUserCurrency").invoke(price);
            Class<?> options = Class.forName("com.booking.price.FormattingOptions");
            Object roundedOptions = options.getField("rounded").get(null);
            return (CharSequence) simplePrice.getMethod("format", options).invoke(price, roundedOptions);
        } catch (Throwable t) {
            Log.w(TAG, "Couldn't add the excluded charges to a map marker", t);
            return null;
        }
    }

    private static synchronized boolean find() {
        if (basicPrice != null) return true;
        try {
            basicPrice = Class.forName("com.booking.common.data.price.BasicPrice").getConstructor(double.class, String.class);
            bMoney = Class.forName("com.booking.common.data.price.BMoney").getConstructor(double.class, String.class);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "Couldn't find the app's price classes", t);
            return false;
        }
    }

    private static double number(Object value) {
        return value instanceof Number ? ((Number) value).doubleValue() : Double.NaN;
    }

    private static void set(Object target, String name, Object value) throws Exception {
        Field f = target.getClass().getDeclaredField(name);
        f.setAccessible(true);
        f.set(target, value);
    }
}
