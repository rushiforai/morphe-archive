package dev.jason.gboardpatches.extension.clipboard;

import android.database.Cursor;

import java.util.List;

final class GboardClipboardRetentionFeature {
    private final GboardClipboardRuntimeSupport support;

    GboardClipboardRetentionFeature(GboardClipboardRuntimeSupport support) {
        this.support = support;
    }

    long effectiveVisibleCutoff(long now, long ttlMs, long lastVisibleTimestamp) {
        long fallbackBase = ttlMs < 0L
                ? 0L
                : now - GboardClipboardRuntimeSupport.STOCK_CLIPBOARD_TTL_MS;
        return support.runSafely("compute clipboard retention cutoff", () -> {
            long baseCutoff = ttlMs < 0L ? 0L : now - ttlMs;
            return Long.valueOf(Math.max(baseCutoff, lastVisibleTimestamp));
        }, Long.valueOf(Math.max(fallbackBase, lastVisibleTimestamp))).longValue();
    }

    long remainingMs(long clipTimestamp, long ttlMs) {
        return support.runSafely("compute clipboard remaining time", () -> {
            if (ttlMs < 0L) {
                return Long.valueOf(Long.MAX_VALUE);
            }
            return Long.valueOf((clipTimestamp + ttlMs) - System.currentTimeMillis());
        }, Long.valueOf(Long.MAX_VALUE)).longValue();
    }

    void collectExpiredUnpinnedIds(
            GboardClipboardRuntimeSupport.ReflectionHandles handles,
            Object dataHandler,
            Cursor cursor,
            long overrideCutoff,
            long primaryTimestamp,
            List<Long> out) {
        support.runSafely("collect expired clipboard ids", () -> {
            collectExpiredUnpinnedIdsUnsafe(handles, dataHandler, cursor, overrideCutoff,
                    primaryTimestamp, out);
        });
    }

    private void collectExpiredUnpinnedIdsUnsafe(
            GboardClipboardRuntimeSupport.ReflectionHandles handles,
            Object dataHandler,
            Cursor cursor,
            long overrideCutoff,
            long primaryTimestamp,
            List<Long> out) throws Throwable {
        if (cursor == null || cursor.isClosed() || cursor.getCount() == 0) {
            return;
        }
        int idColumn = cursor.getColumnIndexOrThrow("_id");
        int timestampColumn = cursor.getColumnIndexOrThrow("timestamp");
        cursor.moveToFirst();
        while (!cursor.isAfterLast()) {
            long timestamp = cursor.getLong(timestampColumn);
            if (timestamp < overrideCutoff && timestamp != primaryTimestamp) {
                out.add(Long.valueOf(cursor.getLong(idColumn)));
                handles.dataHandlerCleanupCursorMethod.invoke(dataHandler, cursor);
            }
            cursor.moveToNext();
        }
    }
}
