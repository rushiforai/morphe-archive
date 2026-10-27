package app.morphe.extension.chmate;

import java.util.ArrayList;
import java.util.List;

/** HTTP/1.1 workaround for routes that silently discard reusable connections. */
final class UpdateConnectionHeaders {
    static final String KEY = "fresh191UpdateConnection";
    static String[] apply(String[] pairs) {
        if (pairs == null || pairs.length % 2 != 0) return pairs;
        List<String> changed = new ArrayList<>(pairs.length + 2);
        for (int i = 0; i < pairs.length; i += 2) {
            if ("Connection".equalsIgnoreCase(pairs[i])) continue;
            changed.add(pairs[i]); changed.add(pairs[i + 1]);
        }
        changed.add("Connection"); changed.add("close");
        return changed.toArray(new String[0]);
    }
    private UpdateConnectionHeaders() { }
}
