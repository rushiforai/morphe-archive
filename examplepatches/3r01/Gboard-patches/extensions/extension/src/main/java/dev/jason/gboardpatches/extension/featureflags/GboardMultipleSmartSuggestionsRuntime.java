package dev.jason.gboardpatches.extension.featureflags;

import java.util.Iterator;
import java.util.Map;

/** Runtime policy for Gboard's proactive suggestion category map. */
public final class GboardMultipleSmartSuggestionsRuntime {
    private GboardMultipleSmartSuggestionsRuntime() {}

    public static void removeUndoCategory(Object candidate) {
        if (!(candidate instanceof Map)) {
            return;
        }
        Iterator<?> iterator = ((Map<?, ?>) candidate).keySet().iterator();
        while (iterator.hasNext()) {
            Object category = iterator.next();
            if (category instanceof Enum && "UNDO".equals(((Enum<?>) category).name())) {
                iterator.remove();
            }
        }
    }
}
