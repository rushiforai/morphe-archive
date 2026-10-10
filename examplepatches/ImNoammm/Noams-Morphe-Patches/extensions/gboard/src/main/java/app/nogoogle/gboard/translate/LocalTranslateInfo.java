package app.nogoogle.gboard.translate;

import java.io.File;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/** Human-readable summary of installed translation models for the mod menu. */
public final class LocalTranslateInfo {
    private LocalTranslateInfo() {
    }

    public static String summary() {
        StringBuilder out = new StringBuilder();
        File llm = LlmTranslator.model();
        if (llm == null) {
            out.append("Hy-MT: not installed (models/llm/*.gguf).");
        } else {
            out.append("Hy-MT: ").append(llm.getName()).append(" (").append(llm.length() >> 20)
                    .append(" MB) · any pair among ").append(LlmTranslator.languages().size())
                    .append(" languages");
        }
        Map<String, Set<String>> pairs = LocalTranslate.pairs(LocalTranslate.installed());
        Set<String> langs = new TreeSet<>();
        int models = 0;
        for (Map.Entry<String, Set<String>> e : pairs.entrySet()) {
            langs.add(e.getKey());
            langs.addAll(e.getValue());
            models += e.getValue().size();
        }
        out.append("\nFirefox: ");
        if (models == 0) return out.append("no models (models/translate/).").toString();
        langs.remove("en");
        return out.append(models).append(" models · English + ").append(langs.size())
                .append(" languages (any pair through English)\n").append(String.join(", ", langs))
                .toString();
    }
}
