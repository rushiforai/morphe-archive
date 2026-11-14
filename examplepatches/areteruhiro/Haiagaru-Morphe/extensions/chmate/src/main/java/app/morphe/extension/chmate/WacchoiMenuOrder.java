package app.morphe.extension.chmate;

import java.util.List;
import java.util.Locale;
import java.util.function.Function;

/** Stable ordering only: retain original action objects and unknown options. */
public final class WacchoiMenuOrder {
    private WacchoiMenuOrder() { }

    public static int rank(String label) {
        String text = label == null ? "" : label.replace(" ", "").toLowerCase(Locale.ROOT);
        if (text.contains("コピー") || text.startsWith("copy")) return 2;
        if (text.contains("下4桁") || text.contains("下４桁")) return text.contains("検索") ? 4 : 1;
        if (text.contains("ngname") && (text.contains("追加") || text.contains("add"))) return 0;
        if (text.contains("取得済") || text.contains("savedthread")) return 3;
        if (text.equals("ﾜｯﾁｮｲで検索") || (text.contains("必死チェッカー") && text.contains("ﾜｯﾁｮｲ"))) return 4;
        return 5;
    }

    public static <T> void reorder(List<T> items, Function<T, String> title) {
        items.sort((a, b) -> Integer.compare(rank(title.apply(a)), rank(title.apply(b))));
    }
}
