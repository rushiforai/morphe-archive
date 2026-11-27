package dev.jason.gboardpatches.extension.clipboard.search;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.function.Function;
import java.util.regex.Pattern;

/**
 * Clipboard search state and matching. The query lives in memory only and is dropped when the
 * clipboard closes for any reason other than the trip through the query field.
 */
public final class GboardClipboardSearch {
    private static final Pattern MARKS = Pattern.compile("\\p{M}+");

    private static volatile String query;
    /** Set while the add-entry keyboard is being used to type a query. */
    private static volatile boolean pending;
    /** Set between submitting a query and the clipboard reopening with it. */
    private static volatile boolean returning;

    private GboardClipboardSearch() { }

    public static String query() { return query; }

    public static boolean active() { return query != null; }

    public static boolean pending() { return pending; }

    public static void begin() {
        pending = true;
        returning = false;
    }

    /** Takes the typed text as the query; returns false when no search was started. */
    public static boolean submit(CharSequence text) {
        if (!pending) return false;
        pending = false;
        String cleaned = text == null ? "" : text.toString().trim();
        query = cleaned.isEmpty() ? null : cleaned;
        returning = true;
        return true;
    }

    public static void clear() {
        query = null;
        pending = false;
        returning = false;
    }

    /**
     * Runs before the clipboard opens or closes, ahead of its loader. A query survives only the
     * hop to the query field and back; any other open or close drops it.
     */
    public static void beforeOpenOrClose() {
        if (!pending && !returning) query = null;
    }

    /** The clipboard is visible again, so a search left without Done is abandoned. */
    public static void afterOpen() {
        pending = false;
        returning = false;
    }

    /** Folds case, accents and đ, so "tieng viet" finds "Tiếng Việt". */
    static String fold(String value) {
        String lower = value.toLowerCase(Locale.ROOT).replace('đ', 'd');
        return MARKS.matcher(Normalizer.normalize(lower, Normalizer.Form.NFD)).replaceAll("");
    }

    /**
     * Keeps section headers (identity-matched) and the items whose text matches. Items without
     * text, such as images, never match a query.
     */
    public static <T> List<T> filter(List<T> items, String needle, List<T> headers,
            Function<T, String> text) {
        if (needle == null) return items;
        String folded = fold(needle);
        List<T> result = new ArrayList<>(items.size());
        for (T item : items) {
            if (containsIdentity(headers, item)) {
                result.add(item);
                continue;
            }
            String value = text.apply(item);
            if (value != null && fold(value).contains(folded)) result.add(item);
        }
        return result;
    }

    private static <T> boolean containsIdentity(List<T> list, T item) {
        for (T value : list) {
            if (value == item) return true;
        }
        return false;
    }
}
