package com.instabridge.ai.proactive;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0005\b\u0001\u0018\u0000 \u00152\u00020\u0001:\u0001\u0015B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000e\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u000e\u0010\f\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u0006\u0010\r\u001a\u00020\u000eJ\u0006\u0010\u000f\u001a\u00020\u000eJ\u0006\u0010\u0010\u001a\u00020\u0011J\u0006\u0010\u0012\u001a\u00020\tJ\b\u0010\u0013\u001a\u00020\tH\u0002J\b\u0010\u0014\u001a\u00020\tH\u0002R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0016"}, d2 = {"Lcom/instabridge/ai/proactive/AiEngagementTracker;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "<init>", "(Landroid/content/Context;)V", "db", "Lcom/instabridge/ai/proactive/AiDatabase;", "recordImpression", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "surface", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "recordTap", "impressionCount", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "tapCount", "rollingCtr", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "clear", "ensureRow", "maybeResetWindow", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class AiEngagementTracker {
    private static final int ROW_ID = 1;
    private static final long WINDOW_MS = 1209600000;

    @NotNull
    private final AiDatabase db;
    public static final int $stable = 8;

    public AiEngagementTracker(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.db = new AiDatabase(context);
    }

    private final void ensureRow() {
        SQLiteDatabase writableDatabase = this.db.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put("id", (Integer) 1);
        contentValues.put(AiDatabase.COL_IMPRESSIONS, (Integer) 0);
        contentValues.put(AiDatabase.COL_TAPS, (Integer) 0);
        contentValues.put(AiDatabase.COL_WINDOW_START, Long.valueOf(System.currentTimeMillis()));
        Unit unit = Unit.f71706a;
        writableDatabase.insertWithOnConflict(AiDatabase.TABLE_ENGAGEMENT, null, contentValues, 4);
    }

    private final void maybeResetWindow() {
        Cursor cursorQuery = this.db.getReadableDatabase().query(AiDatabase.TABLE_ENGAGEMENT, new String[]{AiDatabase.COL_WINDOW_START}, "id = 1", null, null, null, null);
        try {
            long j11 = cursorQuery.moveToFirst() ? cursorQuery.getLong(0) : 0L;
            CloseableKt.a(cursorQuery, null);
            if (System.currentTimeMillis() - j11 > WINDOW_MS) {
                SQLiteDatabase writableDatabase = this.db.getWritableDatabase();
                ContentValues contentValues = new ContentValues();
                contentValues.put(AiDatabase.COL_IMPRESSIONS, (Integer) 0);
                contentValues.put(AiDatabase.COL_TAPS, (Integer) 0);
                contentValues.put(AiDatabase.COL_WINDOW_START, Long.valueOf(System.currentTimeMillis()));
                Unit unit = Unit.f71706a;
                writableDatabase.update(AiDatabase.TABLE_ENGAGEMENT, contentValues, "id = 1", null);
            }
        } catch (Throwable th2) {
            try {
                throw th2;
            } catch (Throwable th3) {
                CloseableKt.a(cursorQuery, th2);
                throw th3;
            }
        }
    }

    public final void clear() {
        this.db.getWritableDatabase().delete(AiDatabase.TABLE_ENGAGEMENT, null, null);
    }

    public final int impressionCount() {
        Cursor cursorQuery = this.db.getReadableDatabase().query(AiDatabase.TABLE_ENGAGEMENT, new String[]{AiDatabase.COL_IMPRESSIONS}, "id = 1", null, null, null, null);
        try {
            int i5 = cursorQuery.moveToFirst() ? cursorQuery.getInt(0) : 0;
            CloseableKt.a(cursorQuery, null);
            return i5;
        } finally {
        }
    }

    public final void recordImpression(@NotNull String surface) {
        Intrinsics.g(surface, "surface");
        ensureRow();
        maybeResetWindow();
        this.db.getWritableDatabase().execSQL("UPDATE engagement SET impressions = impressions + 1 WHERE id = 1");
    }

    public final void recordTap(@NotNull String surface) {
        Intrinsics.g(surface, "surface");
        ensureRow();
        maybeResetWindow();
        this.db.getWritableDatabase().execSQL("UPDATE engagement SET taps = taps + 1 WHERE id = 1");
    }

    public final float rollingCtr() {
        int iImpressionCount = impressionCount();
        if (iImpressionCount == 0) {
            return 0.0f;
        }
        float fTapCount = tapCount() / iImpressionCount;
        if (fTapCount > 1.5f) {
            return 1.5f;
        }
        return fTapCount;
    }

    public final int tapCount() {
        Cursor cursorQuery = this.db.getReadableDatabase().query(AiDatabase.TABLE_ENGAGEMENT, new String[]{AiDatabase.COL_TAPS}, "id = 1", null, null, null, null);
        try {
            int i5 = cursorQuery.moveToFirst() ? cursorQuery.getInt(0) : 0;
            CloseableKt.a(cursorQuery, null);
            return i5;
        } finally {
        }
    }
}
