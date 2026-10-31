package com.novalauncher.novalytics.stats.internal;

import aa.m0;
import android.content.Context;
import androidx.room.j;
import d7.a;
import d7.b;
import d7.d;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import p7.q;
import qp.i;

/* loaded from: classes.dex */
public final class DailyMetricsDatabase_Impl extends DailyMetricsDatabase {

    /* renamed from: e, reason: collision with root package name */
    public volatile i f42240e;

    @Override // androidx.room.o
    public final void clearAllTables() {
        super.assertNotMainThread();
        a writableDatabase = super.getOpenHelper().getWritableDatabase();
        try {
            super.beginTransaction();
            writableDatabase.execSQL("DELETE FROM `DailyStats`");
            super.setTransactionSuccessful();
        } finally {
            super.endTransaction();
            writableDatabase.query("PRAGMA wal_checkpoint(FULL)").close();
            if (!writableDatabase.inTransaction()) {
                writableDatabase.execSQL("VACUUM");
            }
        }
    }

    @Override // androidx.room.o
    public final j createInvalidationTracker() {
        return new j(this, new HashMap(0), new HashMap(0), "DailyStats");
    }

    @Override // androidx.room.o
    public final d createOpenHelper(androidx.room.d dVar) {
        m0 m0Var = new m0(dVar, new q(this), "625a3f8ed50b6f009cdd2a1f25c13191", "504b12d1037907f259f0768592ee2abe");
        Context context = dVar.f15204a;
        Intrinsics.g(context, "context");
        return dVar.f15206c.e(new b(context, dVar.f15205b, m0Var, false, false));
    }

    @Override // com.novalauncher.novalytics.stats.internal.DailyMetricsDatabase
    public final i d() {
        i iVar;
        if (this.f42240e != null) {
            return this.f42240e;
        }
        synchronized (this) {
            try {
                if (this.f42240e == null) {
                    this.f42240e = new i(this);
                }
                iVar = this.f42240e;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return iVar;
    }

    @Override // androidx.room.o
    public final List getAutoMigrations(Map map) {
        return Arrays.asList(new y6.a[0]);
    }

    @Override // androidx.room.o
    public final Set getRequiredAutoMigrationSpecs() {
        return new HashSet();
    }

    @Override // androidx.room.o
    public final Map getRequiredTypeConverters() {
        HashMap map = new HashMap();
        map.put(i.class, Collections.EMPTY_LIST);
        return map;
    }
}
