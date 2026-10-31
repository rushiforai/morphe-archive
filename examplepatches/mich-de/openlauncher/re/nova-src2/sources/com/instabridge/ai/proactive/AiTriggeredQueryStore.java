package com.instabridge.ai.proactive;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import aq.e0;
import aq.f;
import aq.h0;
import aq.r;
import bq.e;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import r70.l;

@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u0000 \u001f2\u00020\u0001:\u0001\u001fB\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\n\u001a\u00020\tH\u0002¢\u0006\u0004\b\n\u0010\u000bJ\u0015\u0010\u000e\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u0013\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\f0\u0010¢\u0006\u0004\b\u0011\u0010\u0012J\r\u0010\u0013\u001a\u00020\t¢\u0006\u0004\b\u0013\u0010\u000bJ\r\u0010\u0014\u001a\u00020\u0006¢\u0006\u0004\b\u0014\u0010\bR\u0014\u0010\u0016\u001a\u00020\u00158\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0016\u0010\u0017R\u001c\u0010\u001a\u001a\n \u0019*\u0004\u0018\u00010\u00180\u00188\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001a\u0010\u001bR8\u0010\u001d\u001a&\u0012\f\u0012\n \u0019*\u0004\u0018\u00010\f0\f \u0019*\u0012\u0012\f\u0012\n \u0019*\u0004\u0018\u00010\f0\f\u0018\u00010\u001c0\u001c8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001d\u0010\u001e¨\u0006 "}, d2 = {"Lcom/instabridge/ai/proactive/AiTriggeredQueryStore;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "countAll", "()I", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "evictOldestExpiring", "()V", "Lcom/instabridge/ai/proactive/AiTriggeredQuery;", "query", "add", "(Lcom/instabridge/ai/proactive/AiTriggeredQuery;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getActive", "()Ljava/util/List;", "pruneExpired", "clear", "Lcom/instabridge/ai/proactive/AiDatabase;", "db", "Lcom/instabridge/ai/proactive/AiDatabase;", "Laq/h0;", "kotlin.jvm.PlatformType", "moshi", "Laq/h0;", "Laq/r;", "adapter", "Laq/r;", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class AiTriggeredQueryStore {
    private static final int MAX_QUERIES = 10;

    @NotNull
    private static final String TAG = "AiTriggeredQueryStore";
    private final r adapter;

    @NotNull
    private final AiDatabase db;
    private final h0 moshi;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082T¢\u0006\u0002\n\u0000¨\u0006\b"}, d2 = {"Lcom/instabridge/ai/proactive/AiTriggeredQueryStore$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "TAG", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "MAX_QUERIES", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    public AiTriggeredQueryStore(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.db = new AiDatabase(context);
        e0 e0Var = new e0(0);
        e0Var.d(new f(6));
        h0 h0Var = new h0(e0Var);
        this.moshi = h0Var;
        this.adapter = h0Var.b(AiTriggeredQuery.class, e.f18422a, null);
    }

    private final int countAll() {
        Cursor cursorRawQuery = this.db.getReadableDatabase().rawQuery("SELECT COUNT(*) FROM triggered_queries", null);
        try {
            int i5 = cursorRawQuery.moveToFirst() ? cursorRawQuery.getInt(0) : 0;
            CloseableKt.a(cursorRawQuery, null);
            return i5;
        } finally {
        }
    }

    private final void evictOldestExpiring() throws SQLException {
        this.db.getWritableDatabase().execSQL("DELETE FROM triggered_queries\nWHERE id = (\n    SELECT id FROM triggered_queries\n    ORDER BY expires_at ASC LIMIT 1\n)");
    }

    public final void add(@NotNull AiTriggeredQuery query) {
        Intrinsics.g(query, "query");
        pruneExpired();
        if (countAll() >= 10) {
            evictOldestExpiring();
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("id", UUID.randomUUID().toString());
        contentValues.put("json", this.adapter.d(query));
        contentValues.put("expires_at", Long.valueOf(query.getExpiresAt()));
        contentValues.put(AiDatabase.COL_TQ_TRIGGER_EVENT, query.getTriggerEvent());
        this.db.getWritableDatabase().insertWithOnConflict(AiDatabase.TABLE_TRIGGERED_QUERIES, null, contentValues, 5);
        l.G1(60, query.getLead());
        long expiresAt = (query.getExpiresAt() - System.currentTimeMillis()) / 1000;
    }

    public final int clear() {
        return this.db.getWritableDatabase().delete(AiDatabase.TABLE_TRIGGERED_QUERIES, null, null);
    }

    @NotNull
    public final List<AiTriggeredQuery> getActive() {
        Object objA;
        long jCurrentTimeMillis = System.currentTimeMillis();
        ArrayList arrayList = new ArrayList();
        Cursor cursorQuery = this.db.getReadableDatabase().query(AiDatabase.TABLE_TRIGGERED_QUERIES, new String[]{"json"}, "expires_at > ?", new String[]{String.valueOf(jCurrentTimeMillis)}, null, null, "expires_at ASC");
        while (cursorQuery.moveToNext()) {
            try {
                try {
                    int i5 = Result.f71687b;
                    objA = (AiTriggeredQuery) this.adapter.b(cursorQuery.getString(0));
                } catch (Throwable th2) {
                    int i11 = Result.f71687b;
                    objA = ResultKt.a(th2);
                }
                if (objA instanceof Result.Failure) {
                    objA = null;
                }
                AiTriggeredQuery aiTriggeredQuery = (AiTriggeredQuery) objA;
                if (aiTriggeredQuery != null) {
                    arrayList.add(aiTriggeredQuery);
                }
            } finally {
            }
        }
        Unit unit = Unit.f71706a;
        cursorQuery.close();
        return arrayList;
    }

    public final void pruneExpired() {
        this.db.getWritableDatabase().delete(AiDatabase.TABLE_TRIGGERED_QUERIES, "expires_at <= ?", new String[]{String.valueOf(System.currentTimeMillis())});
    }
}
