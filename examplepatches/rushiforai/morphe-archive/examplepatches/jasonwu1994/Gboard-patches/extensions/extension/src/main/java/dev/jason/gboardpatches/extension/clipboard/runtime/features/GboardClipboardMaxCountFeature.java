package dev.jason.gboardpatches.extension.clipboard;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

final class GboardClipboardMaxCountFeature {
    private final GboardClipboardRuntimeSupport support;

    GboardClipboardMaxCountFeature(GboardClipboardRuntimeSupport support) {
        this.support = support;
    }

    int computePinnedVisibleLimit(int pinnedCount, boolean hasRecent, int visibleMaxCount) {
        return support.runSafely("compute clipboard pinned visible limit", () -> {
            if (visibleMaxCount < 0) {
                return Integer.valueOf(pinnedCount);
            }
            if (pinnedCount >= visibleMaxCount) {
                return Integer.valueOf(Math.max(0, visibleMaxCount - (hasRecent ? 1 : 0)));
            }
            return Integer.valueOf(pinnedCount);
        }, Integer.valueOf(Math.max(0, pinnedCount))).intValue();
    }

    int computeVisibleRecentLimit(int recentCount, int pinnedVisibleLimit, int visibleMaxCount) {
        return support.runSafely("compute clipboard recent visible limit", () -> {
            if (visibleMaxCount < 0) {
                return Integer.valueOf(recentCount);
            }
            return Integer.valueOf(
                    Math.min(recentCount, Math.max(0, visibleMaxCount - pinnedVisibleLimit)));
        }, Integer.valueOf(Math.max(0, recentCount))).intValue();
    }

    int computeRetainedUnpinnedCount(int configuredMaxCount, int pinnedCount, int unpinnedCount) {
        return support.runSafely("compute retained clipboard unpinned count", () -> {
            if (configuredMaxCount < 0) {
                return Integer.valueOf(unpinnedCount);
            }
            if (pinnedCount >= configuredMaxCount) {
                return Integer.valueOf(unpinnedCount > 0 ? 1 : 0);
            }
            return Integer.valueOf(Math.max(0, configuredMaxCount - pinnedCount));
        }, Integer.valueOf(Math.max(0, unpinnedCount))).intValue();
    }

    int computeAdapterRecentLimit(
            GboardClipboardRuntimeSupport.ReflectionHandles handles,
            List<Object> items,
            int recentCount,
            int maxRecentCount,
            int maxGroupCount) {
        return support.runSafely("compute clipboard adapter recent limit", () -> {
            return Integer.valueOf(computeAdapterRecentLimitUnsafe(handles, items, recentCount,
                    maxRecentCount, maxGroupCount));
        }, Integer.valueOf(Math.max(0, recentCount))).intValue();
    }

    private int computeAdapterRecentLimitUnsafe(
            GboardClipboardRuntimeSupport.ReflectionHandles handles,
            List<Object> items,
            int recentCount,
            int maxRecentCount,
            int maxGroupCount) throws Throwable {
        if (maxRecentCount < 0) {
            if (maxGroupCount == Integer.MAX_VALUE) {
                return recentCount;
            }
            maxRecentCount = recentCount;
        }
        if (recentCount <= maxRecentCount) {
            Set<Long> groups = new HashSet<Long>();
            for (int i = 1; i <= recentCount && i < items.size(); i++) {
                Object clip = items.get(i);
                groups.add(Long.valueOf(support.clipTimestamp(handles, clip)));
                if (groups.size() > maxGroupCount) {
                    return i - 1;
                }
            }
            return recentCount;
        }

        int allowedCount = maxRecentCount;
        Set<Long> groups = new HashSet<Long>();
        for (int i = 1; i < items.size() && i <= recentCount && allowedCount > 0; i++) {
            Object clip = items.get(i);
            groups.add(Long.valueOf(support.clipTimestamp(handles, clip)));
            if (groups.size() > maxGroupCount) {
                return i - 1;
            }
            allowedCount = i;
        }
        return Math.min(maxRecentCount, allowedCount);
    }
}
