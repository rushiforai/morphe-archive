package androidx.work.impl;

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
import x7.c;
import x7.e;
import x7.f;
import x7.h;
import x7.k;
import x7.l;
import x7.n;
import x7.s;
import x7.u;

/* loaded from: classes.dex */
public final class WorkDatabase_Impl extends WorkDatabase {

    /* renamed from: e, reason: collision with root package name */
    public volatile s f15329e;

    /* renamed from: f, reason: collision with root package name */
    public volatile c f15330f;

    /* renamed from: g, reason: collision with root package name */
    public volatile u f15331g;

    /* renamed from: h, reason: collision with root package name */
    public volatile h f15332h;

    /* renamed from: i, reason: collision with root package name */
    public volatile l f15333i;

    /* renamed from: j, reason: collision with root package name */
    public volatile n f15334j;

    /* renamed from: k, reason: collision with root package name */
    public volatile e f15335k;

    @Override // androidx.room.o
    public final void clearAllTables() {
        super.assertNotMainThread();
        a writableDatabase = super.getOpenHelper().getWritableDatabase();
        try {
            super.beginTransaction();
            writableDatabase.execSQL("PRAGMA defer_foreign_keys = TRUE");
            writableDatabase.execSQL("DELETE FROM `Dependency`");
            writableDatabase.execSQL("DELETE FROM `WorkSpec`");
            writableDatabase.execSQL("DELETE FROM `WorkTag`");
            writableDatabase.execSQL("DELETE FROM `SystemIdInfo`");
            writableDatabase.execSQL("DELETE FROM `WorkName`");
            writableDatabase.execSQL("DELETE FROM `WorkProgress`");
            writableDatabase.execSQL("DELETE FROM `Preference`");
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
        return new j(this, new HashMap(0), new HashMap(0), "Dependency", "WorkSpec", "WorkTag", "SystemIdInfo", "WorkName", "WorkProgress", "Preference");
    }

    @Override // androidx.room.o
    public final d createOpenHelper(androidx.room.d dVar) {
        m0 m0Var = new m0(dVar, new q(this), "7d73d21f1bd82c9e5268b6dcf9fde2cb", "3071c8717539de5d5353f4c8cd59a032");
        Context context = dVar.f15204a;
        Intrinsics.g(context, "context");
        return dVar.f15206c.e(new b(context, dVar.f15205b, m0Var, false, false));
    }

    @Override // androidx.work.impl.WorkDatabase
    public final c d() {
        c cVar;
        if (this.f15330f != null) {
            return this.f15330f;
        }
        synchronized (this) {
            try {
                if (this.f15330f == null) {
                    c cVar2 = new c();
                    cVar2.f95126a = this;
                    cVar2.f95127b = new x7.b(this, 0);
                    this.f15330f = cVar2;
                }
                cVar = this.f15330f;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return cVar;
    }

    @Override // androidx.work.impl.WorkDatabase
    public final e e() {
        e eVar;
        if (this.f15335k != null) {
            return this.f15335k;
        }
        synchronized (this) {
            try {
                if (this.f15335k == null) {
                    e eVar2 = new e();
                    eVar2.f95130a = this;
                    eVar2.f95131b = new x7.b(this);
                    this.f15335k = eVar2;
                }
                eVar = this.f15335k;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return eVar;
    }

    @Override // androidx.work.impl.WorkDatabase
    public final h f() {
        h hVar;
        if (this.f15332h != null) {
            return this.f15332h;
        }
        synchronized (this) {
            try {
                if (this.f15332h == null) {
                    this.f15332h = new h(this);
                }
                hVar = this.f15332h;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return hVar;
    }

    @Override // androidx.work.impl.WorkDatabase
    public final l g() {
        l lVar;
        if (this.f15333i != null) {
            return this.f15333i;
        }
        synchronized (this) {
            try {
                if (this.f15333i == null) {
                    l lVar2 = new l();
                    lVar2.f95145a = this;
                    lVar2.f95146b = new k(this);
                    this.f15333i = lVar2;
                }
                lVar = this.f15333i;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return lVar;
    }

    @Override // androidx.room.o
    public final List getAutoMigrations(Map map) {
        return Arrays.asList(new p7.d(13, 14, 9), new p7.d(), new p7.e(1), new p7.e(2), new p7.e(3), new p7.e(4));
    }

    @Override // androidx.room.o
    public final Set getRequiredAutoMigrationSpecs() {
        return new HashSet();
    }

    @Override // androidx.room.o
    public final Map getRequiredTypeConverters() {
        HashMap map = new HashMap();
        List list = Collections.EMPTY_LIST;
        map.put(s.class, list);
        map.put(c.class, list);
        map.put(u.class, list);
        map.put(h.class, list);
        map.put(l.class, list);
        map.put(n.class, list);
        map.put(e.class, list);
        map.put(f.class, list);
        return map;
    }

    @Override // androidx.work.impl.WorkDatabase
    public final n h() {
        n nVar;
        if (this.f15334j != null) {
            return this.f15334j;
        }
        synchronized (this) {
            try {
                if (this.f15334j == null) {
                    n nVar2 = new n();
                    nVar2.f95149a = this;
                    nVar2.f95150b = new x7.b(this, 3);
                    nVar2.f95151c = new qp.h(this, 4);
                    nVar2.f95152d = new qp.h(this, 5);
                    this.f15334j = nVar2;
                }
                nVar = this.f15334j;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return nVar;
    }

    @Override // androidx.work.impl.WorkDatabase
    public final s i() {
        s sVar;
        if (this.f15329e != null) {
            return this.f15329e;
        }
        synchronized (this) {
            try {
                if (this.f15329e == null) {
                    this.f15329e = new s(this);
                }
                sVar = this.f15329e;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return sVar;
    }

    @Override // androidx.work.impl.WorkDatabase
    public final u j() {
        u uVar;
        if (this.f15331g != null) {
            return this.f15331g;
        }
        synchronized (this) {
            try {
                if (this.f15331g == null) {
                    u uVar2 = new u();
                    uVar2.f95208a = this;
                    uVar2.f95209b = new x7.b(this, 5);
                    uVar2.f95210c = new qp.h(this, 17);
                    this.f15331g = uVar2;
                }
                uVar = this.f15331g;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return uVar;
    }
}
