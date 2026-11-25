package dev.jason.gboardpatches.extension.clipboard;

import java.util.List;

final class GboardClipboardOrderIndexFeature {
    private final GboardClipboardRuntimeSupport support;

    GboardClipboardOrderIndexFeature(GboardClipboardRuntimeSupport support) {
        this.support = support;
    }

    int computeClipOrder(GboardClipboardRuntimeSupport.ReflectionHandles handles, List<Object> items,
            Object clip, String orderIndexMode) {
        return support.runSafely("compute clipboard order index", () -> {
            if (items == null || clip == null) {
                return Integer.valueOf(-1);
            }
            boolean oldestFirst =
                    GboardClipboardSettings.CLIPBOARD_ORDER_INDEX_MODE_OLDEST_FIRST.equals(
                            orderIndexMode);
            int visibleClipCount = 0;
            int clipVisibleIndex = -1;
            for (Object candidate : items) {
                if (candidate == null || candidate == handles.recentHeader
                        || candidate == handles.pinnedHeader
                        || candidate == handles.specialHeader) {
                    continue;
                }
                if (candidate == clip) {
                    clipVisibleIndex = visibleClipCount;
                }
                visibleClipCount++;
            }
            if (clipVisibleIndex < 0) {
                return Integer.valueOf(-1);
            }
            int order = oldestFirst
                    ? visibleClipCount - clipVisibleIndex
                    : clipVisibleIndex + 1;
            return Integer.valueOf(order);
        }, Integer.valueOf(-1)).intValue();
    }

    String formatToken(int clipOrder) {
        return support.runSafely("format clipboard order index token", () -> {
            return clipOrder > 0 ? Integer.toString(clipOrder) : null;
        }, null);
    }

    boolean isToken(String token) {
        return token != null && token.matches("\\d+");
    }
}
