package dev.jason.gboardpatches.extension.clipboard;

import android.content.Context;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

final class GboardClipboardLoaderHookAdapter {
    private final GboardClipboardRuntimeSupport support;
    private final GboardClipboardRetentionFeature retentionFeature;
    private final GboardClipboardMaxCountFeature maxCountFeature;

    GboardClipboardLoaderHookAdapter(GboardClipboardRuntimeSupport support,
            GboardClipboardRetentionFeature retentionFeature,
            GboardClipboardMaxCountFeature maxCountFeature) {
        this.support = support;
        this.retentionFeature = retentionFeature;
        this.maxCountFeature = maxCountFeature;
    }

    Object maybeBuildLoaderResult(Object receiver) {
        return support.runSafely("build custom clipboard loader result", () -> {
            if (receiver == null) {
                return null;
            }
            support.registerContextFromReceiver(receiver);
            if (!support.isClipboardEnabled()) {
                return null;
            }
            return buildCustomLoaderResult(receiver);
        }, null);
    }

    GboardClipboardRuntimeSupport.LoaderAssembly buildAssemblyForContext(
            GboardClipboardRuntimeSupport.ReflectionHandles handles, Context context)
            throws Throwable {
        if (handles == null || context == null) {
            return null;
        }

        long now = System.currentTimeMillis();
        GboardClipboardRuntimeSupport.RuntimeSettings settings = support.runtimeSettings();
        long lastVisibleTimestamp = support.readLastVisibleTimestamp(handles, context);
        long overrideEffectiveCutoff = retentionFeature.effectiveVisibleCutoff(
                now, settings.clipboardTtlMs, lastVisibleTimestamp);
        List<Object> overrideQueryResult = queryClips(handles, context, overrideEffectiveCutoff);
        GboardClipboardRuntimeSupport.ClipSections overrideSections =
                splitClipSections(handles, overrideQueryResult);
        return assembleVisibleSections(handles, context, overrideSections, settings);
    }

    private ArrayList<Object> buildCustomLoaderResult(Object receiver) throws Throwable {
        GboardClipboardRuntimeSupport.ReflectionHandles handles =
                support.reflectionHandles(receiver.getClass().getClassLoader());
        Context context = support.loaderContext(handles, receiver);
        if (context == null) {
            return null;
        }

        long now = System.currentTimeMillis();
        GboardClipboardRuntimeSupport.RuntimeSettings settings = support.runtimeSettings();
        long stockBaseCutoff = now - GboardClipboardRuntimeSupport.STOCK_CLIPBOARD_TTL_MS;
        long lastVisibleTimestamp = support.readLastVisibleTimestamp(handles, context);
        long stockEffectiveCutoff = Math.max(stockBaseCutoff, lastVisibleTimestamp);
        List<Object> stockQueryResult = queryClips(handles, context, stockEffectiveCutoff);
        GboardClipboardRuntimeSupport.ClipSections stockSections =
                splitClipSections(handles, stockQueryResult);
        long overrideEffectiveCutoff = retentionFeature.effectiveVisibleCutoff(
                now, settings.clipboardTtlMs, lastVisibleTimestamp);
        List<Object> overrideQueryResult = queryClips(handles, context, overrideEffectiveCutoff);
        GboardClipboardRuntimeSupport.ClipSections overrideSections =
                splitClipSections(handles, overrideQueryResult);
        GboardClipboardRuntimeSupport.LoaderAssembly assembly = assembleVisibleSections(
                handles,
                context,
                overrideSections,
                settings);

        int stockPinnedVisibleLimit = maxCountFeature.computePinnedVisibleLimit(
                stockSections.pinned.size(),
                !stockSections.recent.isEmpty(),
                GboardClipboardRuntimeSupport.STOCK_CLIPBOARD_MAX_COUNT);
        int stockVisibleRecentLimit = maxCountFeature.computeVisibleRecentLimit(
                stockSections.recent.size(),
                stockPinnedVisibleLimit,
                GboardClipboardRuntimeSupport.STOCK_CLIPBOARD_MAX_COUNT);
        int stockRecentGroups = distinctTimestampCount(handles, stockSections.recent);

        int invocation = support.loaderInvocationCount.incrementAndGet();
        support.logInfo(GboardClipboardRuntimeSupport.LOG_PREFIX + " loader#"
                + invocation
                + " stockTtlMs=" + GboardClipboardRuntimeSupport.STOCK_CLIPBOARD_TTL_MS
                + ", stockCutoff=" + stockEffectiveCutoff
                + ", stockLastVisibleTimestamp=" + lastVisibleTimestamp
                + ", stockQueryResultCount=" + stockQueryResult.size()
                + ", stockRecentCount=" + stockSections.recent.size()
                + ", stockPinnedCount=" + stockSections.pinned.size()
                + ", stockSpecialCount=" + stockSections.special.size()
                + ", stockVisibleMax=" + GboardClipboardRuntimeSupport.STOCK_CLIPBOARD_MAX_COUNT
                + ", stockRecentGroupLimit=" + GboardClipboardRuntimeSupport.STOCK_CLIPBOARD_GROUP_LIMIT
                + ", stockVisibleRecentLimit=" + stockVisibleRecentLimit
                + ", stockVisiblePinnedLimit=" + stockPinnedVisibleLimit
                + ", stockDistinctRecentGroups=" + stockRecentGroups
                + ", overrideTtlMs=" + settings.clipboardTtlMs
                + ", overrideCutoff=" + overrideEffectiveCutoff
                + ", overrideVisibleMax=" + settings.clipboardMaxCount
                + ", overrideGroupLimit=" + settings.clipboardGroupLimit
                + ", overrideRecentCount=" + assembly.visibleRecentCount
                + ", overridePinnedCount=" + assembly.visiblePinnedCount
                + ", overrideSpecialCount=" + assembly.visibleSpecialCount
                + ", primaryInserted=" + assembly.primaryInserted);
        support.logInfo(GboardClipboardRuntimeSupport.LOG_PREFIX + " loader#"
                + invocation
                + " stockRecentSample=" + describeClips(handles, stockSections.recent, 3)
                + ", stockPinnedSample=" + describeClips(handles, stockSections.pinned, 3)
                + ", overrideRecentSample=" + describeClips(handles, assembly.visibleRecent, 3));
        return new ArrayList<Object>(assembly.result);
    }

    private GboardClipboardRuntimeSupport.LoaderAssembly assembleVisibleSections(
            GboardClipboardRuntimeSupport.ReflectionHandles handles,
            Context context,
            GboardClipboardRuntimeSupport.ClipSections sections,
            GboardClipboardRuntimeSupport.RuntimeSettings settings) throws Throwable {
        int pinnedVisibleLimit = maxCountFeature.computePinnedVisibleLimit(
                sections.pinned.size(),
                !sections.recent.isEmpty(),
                settings.clipboardMaxCount);
        int visibleRecentLimit = maxCountFeature.computeVisibleRecentLimit(
                sections.recent.size(),
                pinnedVisibleLimit,
                settings.clipboardMaxCount);
        List<Object> visibleRecent = new ArrayList<Object>(
                Math.min(sections.recent.size(), visibleRecentLimit + 1));
        for (int i = 0; i < sections.recent.size() && visibleRecent.size() < visibleRecentLimit; i++) {
            visibleRecent.add(sections.recent.get(i));
        }
        if (!visibleRecent.isEmpty()) {
            support.writeLastVisibleTimestamp(handles, context,
                    support.clipTimestamp(handles, visibleRecent.get(visibleRecent.size() - 1)));
        }

        boolean primaryInserted = false;
        long primaryTimestamp = support.readPrimaryTimestamp(handles, context);
        if (primaryTimestamp > 0L && !containsTimestamp(handles, visibleRecent, primaryTimestamp)) {
            List<Object> primaryMatches = queryByTimestamp(handles, context, primaryTimestamp);
            if (!primaryMatches.isEmpty()) {
                visibleRecent.add(primaryMatches.get(0));
                primaryInserted = true;
            }
        }

        ArrayList<Object> result = new ArrayList<Object>(
                3 + visibleRecent.size() + pinnedVisibleLimit + sections.special.size());
        result.add(handles.recentHeader);
        result.addAll(visibleRecent);
        result.add(handles.pinnedHeader);
        for (int i = 0; i < sections.pinned.size() && i < pinnedVisibleLimit; i++) {
            result.add(sections.pinned.get(i));
        }
        result.add(handles.specialHeader);
        result.addAll(sections.special);
        return new GboardClipboardRuntimeSupport.LoaderAssembly(
                result,
                visibleRecent,
                Math.min(sections.pinned.size(), pinnedVisibleLimit),
                sections.special.size(),
                primaryInserted);
    }

    private List<Object> queryClips(GboardClipboardRuntimeSupport.ReflectionHandles handles,
            Context context, long cutoff) throws Throwable {
        String[] selectionArgs = new String[] { Long.toString(cutoff) };
        List<Object> result = (List<Object>) handles.queryClipsMethod.invoke(
                null,
                context,
                GboardClipboardRuntimeSupport.STOCK_SELECTION_RECENT_PINNED_SPECIAL,
                selectionArgs,
                GboardClipboardRuntimeSupport.SORT_TIMESTAMP_DESC);
        return result == null ? new ArrayList<Object>() : new ArrayList<Object>(result);
    }

    private List<Object> queryByTimestamp(GboardClipboardRuntimeSupport.ReflectionHandles handles,
            Context context, long timestamp) throws Throwable {
        List<Object> result = (List<Object>) handles.queryClipsMethod.invoke(
                null,
                context,
                GboardClipboardRuntimeSupport.SELECTION_TIMESTAMP_EQUALS,
                new String[] { Long.toString(timestamp) },
                null);
        return result == null ? new ArrayList<Object>() : new ArrayList<Object>(result);
    }

    private GboardClipboardRuntimeSupport.ClipSections splitClipSections(
            GboardClipboardRuntimeSupport.ReflectionHandles handles, List<Object> clips)
            throws Throwable {
        List<Object> recent = new ArrayList<Object>();
        List<Object> pinned = new ArrayList<Object>();
        List<Object> special = new ArrayList<Object>();
        for (Object clip : clips) {
            if (clip == null || clip == handles.recentHeader || clip == handles.pinnedHeader
                    || clip == handles.specialHeader) {
                continue;
            }
            if (support.isPinned(handles, clip)) {
                pinned.add(clip);
            } else if (support.isSpecial(handles, clip)) {
                special.add(clip);
            } else {
                recent.add(clip);
            }
        }
        return new GboardClipboardRuntimeSupport.ClipSections(recent, pinned, special);
    }

    private int distinctTimestampCount(GboardClipboardRuntimeSupport.ReflectionHandles handles,
            List<Object> clips) throws Throwable {
        Set<Long> values = new HashSet<Long>();
        for (Object clip : clips) {
            values.add(Long.valueOf(support.clipTimestamp(handles, clip)));
        }
        return values.size();
    }

    private boolean containsTimestamp(GboardClipboardRuntimeSupport.ReflectionHandles handles,
            List<Object> clips, long timestamp) throws Throwable {
        for (Object clip : clips) {
            if (support.clipTimestamp(handles, clip) == timestamp) {
                return true;
            }
        }
        return false;
    }

    private String describeClips(GboardClipboardRuntimeSupport.ReflectionHandles handles,
            List<Object> clips, int limit) throws Throwable {
        if (clips.isEmpty()) {
            return "[]";
        }
        List<String> rows = new ArrayList<String>();
        for (int i = 0; i < clips.size() && i < limit; i++) {
            Object clip = clips.get(i);
            rows.add("{id=" + support.clipId(handles, clip)
                    + ", ts=" + support.clipTimestamp(handles, clip)
                    + ", pinned=" + support.isPinned(handles, clip)
                    + ", itemType=" + support.clipItemType(handles, clip)
                    + "}");
        }
        return rows.toString();
    }
}
