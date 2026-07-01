package dev.jason.gboardpatches.extension.clipboard;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

final class GboardClipboardPruneHookAdapter {
    private final GboardClipboardRuntimeSupport support;
    private final GboardClipboardRetentionFeature retentionFeature;
    private final GboardClipboardMaxCountFeature maxCountFeature;

    GboardClipboardPruneHookAdapter(GboardClipboardRuntimeSupport support,
            GboardClipboardRetentionFeature retentionFeature,
            GboardClipboardMaxCountFeature maxCountFeature) {
        this.support = support;
        this.retentionFeature = retentionFeature;
        this.maxCountFeature = maxCountFeature;
    }

    boolean handleCustomPrune(Object receiver) {
        return support.runSafely("run custom clipboard prune", () -> {
            if (receiver == null) {
                return Boolean.FALSE;
            }
            support.registerContextFromReceiver(receiver);
            if (!support.isClipboardEnabled()) {
                return Boolean.FALSE;
            }
            runCustomPrune(receiver);
            return Boolean.TRUE;
        }, Boolean.FALSE).booleanValue();
    }

    private void runCustomPrune(Object receiver) throws Throwable {
        GboardClipboardRuntimeSupport.ReflectionHandles handles =
                support.reflectionHandles(receiver.getClass().getClassLoader());
        Object dataHandler = handles.pruneCallableOwnerField.get(receiver);
        Context context = support.pruneContext(handles, receiver);
        if (context == null || dataHandler == null) {
            throw new IllegalStateException("Clipboard prune context is unavailable");
        }
        if (handles.dataHandlerDisabledField.getBoolean(dataHandler)) {
            return;
        }

        GboardClipboardRuntimeSupport.RuntimeSettings settings = support.runtimeSettings();
        Uri clipboardUri = support.createClipboardUri(handles, context);
        if (clipboardUri == null) {
            return;
        }

        int currentTotalCount = support.queryCursorCount(context, clipboardUri, null, null);
        int pinnedCount = support.queryItemTypeCount(handles, dataHandler, clipboardUri, 1);
        int unpinnedCount = support.queryItemTypeCount(handles, dataHandler, clipboardUri, 0);
        int specialCount = Math.max(0, currentTotalCount - pinnedCount - unpinnedCount);
        long primaryTimestamp = support.readPrimaryTimestamp(handles, context);
        long stockCutoff = System.currentTimeMillis()
                - GboardClipboardRuntimeSupport.STOCK_CLIPBOARD_TTL_MS;
        long overrideCutoff = settings.clipboardTtlMs < 0L
                ? -1L
                : System.currentTimeMillis() - settings.clipboardTtlMs;

        List<Long> expiredIds = new ArrayList<Long>();
        List<Long> overflowIds = new ArrayList<Long>();
        String unpinnedPreview = describeCursorRows(
                support.queryCursor(context, clipboardUri,
                        GboardClipboardRuntimeSupport.CURSOR_COUNT_PROJECTION,
                        "item_type = ?",
                        new String[] { "0" },
                        GboardClipboardRuntimeSupport.SORT_TIMESTAMP_DESC),
                3);

        Cursor unpinnedCursor = null;
        Cursor remainingUnpinnedCursor = null;
        try {
            unpinnedCursor = support.queryItemTypeCursor(handles, dataHandler, clipboardUri, 0);
            if (settings.clipboardTtlMs >= 0L) {
                retentionFeature.collectExpiredUnpinnedIds(handles, dataHandler, unpinnedCursor,
                        overrideCutoff, primaryTimestamp, expiredIds);
            }
            if (!expiredIds.isEmpty()) {
                deleteClipIds(handles, context, expiredIds);
            }
        } finally {
            support.closeQuietly(unpinnedCursor);
        }

        try {
            remainingUnpinnedCursor = support.queryItemTypeCursor(handles, dataHandler,
                    clipboardUri, 0);
            int allowedUnpinnedRetainCount = maxCountFeature.computeRetainedUnpinnedCount(
                    settings.clipboardMaxCount,
                    pinnedCount,
                    support.safeCursorCount(remainingUnpinnedCursor));
            collectOverflowUnpinnedIds(handles, dataHandler, remainingUnpinnedCursor,
                    allowedUnpinnedRetainCount, primaryTimestamp, overflowIds);
            if (!overflowIds.isEmpty()) {
                deleteClipIds(handles, context, overflowIds);
            }
        } finally {
            support.closeQuietly(remainingUnpinnedCursor);
        }

        int totalCountAfter = support.queryCursorCount(context, clipboardUri, null, null);
        int unpinnedCountAfter = support.queryItemTypeCount(handles, dataHandler, clipboardUri, 0);
        Object countField = handles.dataHandlerCountField.get(dataHandler);
        if (countField instanceof AtomicInteger) {
            ((AtomicInteger) countField).set(totalCountAfter);
        }

        int invocation = support.pruneInvocationCount.incrementAndGet();
        support.logInfo(GboardClipboardRuntimeSupport.LOG_PREFIX + " prune#"
                + invocation
                + " stockTrigger=" + GboardClipboardRuntimeSupport.STOCK_CLIPBOARD_PRUNE_TRIGGER
                + ", stockRetainMax=" + GboardClipboardRuntimeSupport.STOCK_CLIPBOARD_MAX_COUNT
                + ", stockTtlMs=" + GboardClipboardRuntimeSupport.STOCK_CLIPBOARD_TTL_MS
                + ", stockCutoff=" + stockCutoff
                + ", overrideTtlMs=" + settings.clipboardTtlMs
                + ", overrideCutoff=" + overrideCutoff
                + ", overrideRetainMax=" + settings.clipboardMaxCount
                + ", dbTotalBefore=" + currentTotalCount
                + ", dbPinnedBefore=" + pinnedCount
                + ", dbUnpinnedBefore=" + unpinnedCount
                + ", dbSpecialBefore=" + specialCount
                + ", primaryTimestamp=" + primaryTimestamp
                + ", expiredCandidateCount=" + expiredIds.size()
                + ", overflowCandidateCount=" + overflowIds.size()
                + ", dbTotalAfter=" + totalCountAfter
                + ", dbUnpinnedAfter=" + unpinnedCountAfter);
        support.logInfo(GboardClipboardRuntimeSupport.LOG_PREFIX + " prune#"
                + invocation
                + " unpinnedBeforeSample=" + unpinnedPreview
                + ", expiredIds=" + describeIds(expiredIds, 5)
                + ", overflowIds=" + describeIds(overflowIds, 5));
    }

    private void collectOverflowUnpinnedIds(
            GboardClipboardRuntimeSupport.ReflectionHandles handles,
            Object dataHandler,
            Cursor cursor,
            int retainCount,
            long primaryTimestamp,
            List<Long> out) throws Throwable {
        if (cursor == null || cursor.isClosed() || cursor.getCount() == 0) {
            return;
        }
        int idColumn = cursor.getColumnIndexOrThrow("_id");
        int timestampColumn = cursor.getColumnIndexOrThrow("timestamp");
        cursor.moveToFirst();
        int kept = 0;
        while (!cursor.isAfterLast()) {
            long timestamp = cursor.getLong(timestampColumn);
            if (kept < retainCount || timestamp == primaryTimestamp) {
                kept++;
            } else {
                out.add(Long.valueOf(cursor.getLong(idColumn)));
                handles.dataHandlerCleanupCursorMethod.invoke(dataHandler, cursor);
            }
            cursor.moveToNext();
        }
    }

    private void deleteClipIds(GboardClipboardRuntimeSupport.ReflectionHandles handles,
            Context context, List<Long> ids) throws Throwable {
        if (ids.isEmpty()) {
            return;
        }
        handles.deleteClipsMethod.invoke(null, context, ids);
    }

    private String describeCursorRows(Cursor cursor, int limit) {
        if (cursor == null) {
            return "[]";
        }
        try {
            if (cursor.isClosed() || cursor.getCount() == 0) {
                return "[]";
            }
            int idColumn = cursor.getColumnIndexOrThrow("_id");
            int timestampColumn = cursor.getColumnIndexOrThrow("timestamp");
            int itemTypeColumn = cursor.getColumnIndexOrThrow("item_type");
            List<String> rows = new ArrayList<String>();
            cursor.moveToFirst();
            while (!cursor.isAfterLast() && rows.size() < limit) {
                rows.add("{id=" + cursor.getLong(idColumn)
                        + ", ts=" + cursor.getLong(timestampColumn)
                        + ", itemType=" + cursor.getInt(itemTypeColumn)
                        + "}");
                cursor.moveToNext();
            }
            return rows.toString();
        } catch (Throwable throwable) {
            return "[<error:" + throwable.getClass().getSimpleName() + ">]";
        } finally {
            support.closeQuietly(cursor);
        }
    }

    private String describeIds(List<Long> ids, int limit) {
        if (ids.isEmpty()) {
            return "[]";
        }
        List<Long> sample = ids.size() > limit ? ids.subList(0, limit) : ids;
        return sample.toString();
    }
}
