package app.morphe.extension.chmate;

import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;

/** Literal, case-sensitive IDs; no regex or partial matching. */
final class RedIdExclusions {
    static Set<String> parse(String source) {
        if (source == null || source.isEmpty()) return Collections.emptySet();
        if (source.length() > 65536) throw new IllegalArgumentException("除外リストが長すぎます");
        Set<String> result = new LinkedHashSet<>();
        for (String line : source.split("\\r?\\n")) {
            String id = line.trim();
            if (id.startsWith("ID:")) id = id.substring(3).trim();
            if (id.isEmpty()) continue;
            if (id.length() > 128 || id.matches("[?？!！*＊\\-]+")
                    || id.codePoints().anyMatch(c -> Character.isWhitespace(c) || Character.isISOControl(c)))
                throw new IllegalArgumentException("IDを1行に1件、空白を含めず入力してください");
            result.add(id);
            if (result.size() > 500) throw new IllegalArgumentException("除外IDは500件までです");
        }
        return Collections.unmodifiableSet(result);
    }
    private RedIdExclusions() { }
}
