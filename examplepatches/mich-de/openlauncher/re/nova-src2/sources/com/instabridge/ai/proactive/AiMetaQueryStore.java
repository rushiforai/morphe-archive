package com.instabridge.ai.proactive;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import aq.e0;
import aq.f;
import aq.h0;
import aq.m0;
import aq.r;
import bq.e;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u0000 !2\u00020\u0001:\u0001!B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u001b\u0010\n\u001a\u00020\t2\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\u0004\b\n\u0010\u000bJ\u0013\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\u0004\b\f\u0010\rJ\r\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u000f\u0010\u0010J\r\u0010\u0012\u001a\u00020\u0011¢\u0006\u0004\b\u0012\u0010\u0013R\u0014\u0010\u0015\u001a\u00020\u00148\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010\u0016R\u001c\u0010\u0019\u001a\n \u0018*\u0004\u0018\u00010\u00170\u00178\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0019\u0010\u001aR\u001c\u0010\u001c\u001a\n \u0018*\u0004\u0018\u00010\u001b0\u001b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001c\u0010\u001dRP\u0010\u001f\u001a>\u0012\u0018\u0012\u0016\u0012\u0004\u0012\u00020\u0007 \u0018*\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u00060\u0006 \u0018*\u001e\u0012\u0018\u0012\u0016\u0012\u0004\u0012\u00020\u0007 \u0018*\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u00060\u0006\u0018\u00010\u001e0\u001e8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001f\u0010 ¨\u0006\""}, d2 = {"Lcom/instabridge/ai/proactive/AiMetaQueryStore;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/proactive/AiMetaQueryLead;", "leads", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, ActionCategory.SAVE, "(Ljava/util/List;)V", "getLeads", "()Ljava/util/List;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "lastFetchTime", "()J", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "clear", "()I", "Lcom/instabridge/ai/proactive/AiDatabase;", "db", "Lcom/instabridge/ai/proactive/AiDatabase;", "Laq/h0;", "kotlin.jvm.PlatformType", "moshi", "Laq/h0;", "Ljava/lang/reflect/ParameterizedType;", "listType", "Ljava/lang/reflect/ParameterizedType;", "Laq/r;", "listAdapter", "Laq/r;", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class AiMetaQueryStore {

    @NotNull
    private static final String TAG = "AiMetaQueryStore";

    @NotNull
    private final AiDatabase db;
    private final r listAdapter;
    private final ParameterizedType listType;
    private final h0 moshi;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0006"}, d2 = {"Lcom/instabridge/ai/proactive/AiMetaQueryStore$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "TAG", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    public AiMetaQueryStore(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.db = new AiDatabase(context);
        e0 e0Var = new e0(0);
        e0Var.d(new f(6));
        h0 h0Var = new h0(e0Var);
        this.moshi = h0Var;
        bq.c cVarF = m0.f(List.class, AiMetaQueryLead.class);
        this.listType = cVarF;
        this.listAdapter = h0Var.b(cVarF, e.f18422a, null);
    }

    public final int clear() {
        return this.db.getWritableDatabase().delete(AiDatabase.TABLE_META_LEADS, null, null);
    }

    @NotNull
    public final List<AiMetaQueryLead> getLeads() {
        Object objA;
        Cursor cursorQuery = this.db.getReadableDatabase().query(AiDatabase.TABLE_META_LEADS, new String[]{"json"}, null, null, null, null, "fetched_at DESC", "1");
        try {
            if (!cursorQuery.moveToFirst()) {
                EmptyList emptyList = EmptyList.f71733a;
                cursorQuery.close();
                return emptyList;
            }
            try {
                int i5 = Result.f71687b;
                objA = (List) this.listAdapter.b(cursorQuery.getString(0));
                if (objA == null) {
                    objA = EmptyList.f71733a;
                }
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            if (Result.a(objA) != null) {
                objA = EmptyList.f71733a;
            }
            List<AiMetaQueryLead> list = (List) objA;
            cursorQuery.close();
            return list;
        } finally {
        }
    }

    public final long lastFetchTime() {
        Cursor cursorRawQuery = this.db.getReadableDatabase().rawQuery("SELECT MAX(fetched_at) FROM meta_query_leads", null);
        try {
            long j11 = cursorRawQuery.moveToFirst() ? cursorRawQuery.getLong(0) : 0L;
            CloseableKt.a(cursorRawQuery, null);
            return j11;
        } finally {
        }
    }

    public final void save(@NotNull List<AiMetaQueryLead> leads) {
        Intrinsics.g(leads, "leads");
        long jCurrentTimeMillis = System.currentTimeMillis();
        this.db.getWritableDatabase().delete(AiDatabase.TABLE_META_LEADS, null, null);
        ContentValues contentValues = new ContentValues();
        contentValues.put("fetched_at", Long.valueOf(jCurrentTimeMillis));
        contentValues.put("json", this.listAdapter.d(leads));
        this.db.getWritableDatabase().insertWithOnConflict(AiDatabase.TABLE_META_LEADS, null, contentValues, 5);
        leads.size();
    }
}
