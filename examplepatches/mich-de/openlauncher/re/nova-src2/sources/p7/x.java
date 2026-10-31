package p7;

import android.content.Context;
import android.database.Cursor;
import androidx.work.WorkerParameters;
import androidx.work.impl.WorkDatabase;
import androidx.work.impl.WorkDatabase_Impl;
import androidx.work.impl.background.systemalarm.RescheduleReceiver;
import cl.u0;
import com.google.android.gms.internal.consent_sdk.n7;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import kotlin.jvm.internal.Intrinsics;
import o7.h0;

/* loaded from: classes.dex */
public final class x implements Runnable {

    /* renamed from: s, reason: collision with root package name */
    public static final String f82393s = o7.r.e("WorkerWrapper");

    /* renamed from: a, reason: collision with root package name */
    public final Context f82394a;

    /* renamed from: b, reason: collision with root package name */
    public final String f82395b;

    /* renamed from: c, reason: collision with root package name */
    public final x7.u f82396c;

    /* renamed from: d, reason: collision with root package name */
    public final x7.q f82397d;

    /* renamed from: e, reason: collision with root package name */
    public o7.q f82398e;

    /* renamed from: f, reason: collision with root package name */
    public final a8.c f82399f;

    /* renamed from: h, reason: collision with root package name */
    public final o7.c f82401h;

    /* renamed from: i, reason: collision with root package name */
    public final br.a f82402i;

    /* renamed from: j, reason: collision with root package name */
    public final h f82403j;

    /* renamed from: k, reason: collision with root package name */
    public final WorkDatabase f82404k;

    /* renamed from: l, reason: collision with root package name */
    public final x7.s f82405l;

    /* renamed from: m, reason: collision with root package name */
    public final x7.c f82406m;
    public final ArrayList n;
    public String o;

    /* renamed from: g, reason: collision with root package name */
    public o7.p f82400g = new o7.m();

    /* renamed from: p, reason: collision with root package name */
    public final z7.j f82407p = new z7.j();

    /* renamed from: q, reason: collision with root package name */
    public final z7.j f82408q = new z7.j();

    /* renamed from: r, reason: collision with root package name */
    public volatile int f82409r = -256;

    public x(n7 n7Var) {
        this.f82394a = (Context) n7Var.f32164a;
        this.f82399f = (a8.c) n7Var.f32166c;
        this.f82403j = (h) n7Var.f32165b;
        x7.q qVar = (x7.q) n7Var.f32169f;
        this.f82397d = qVar;
        this.f82395b = qVar.f95171a;
        this.f82396c = (x7.u) n7Var.f32171h;
        this.f82398e = null;
        o7.c cVar = (o7.c) n7Var.f32167d;
        this.f82401h = cVar;
        this.f82402i = cVar.f79624c;
        WorkDatabase workDatabase = (WorkDatabase) n7Var.f32168e;
        this.f82404k = workDatabase;
        this.f82405l = workDatabase.i();
        this.f82406m = workDatabase.d();
        this.n = (ArrayList) n7Var.f32170g;
    }

    public final void a(o7.p pVar) {
        boolean z11 = pVar instanceof o7.o;
        x7.q qVar = this.f82397d;
        String str = f82393s;
        if (!z11) {
            if (pVar instanceof o7.n) {
                o7.r.c().d(str, "Worker result RETRY for " + this.o);
                c();
                return;
            }
            o7.r.c().d(str, "Worker result FAILURE for " + this.o);
            if (qVar.d()) {
                d();
                return;
            } else {
                g();
                return;
            }
        }
        o7.r.c().d(str, "Worker result SUCCESS for " + this.o);
        if (qVar.d()) {
            d();
            return;
        }
        x7.c cVar = this.f82406m;
        String str2 = this.f82395b;
        x7.s sVar = this.f82405l;
        WorkDatabase workDatabase = this.f82404k;
        workDatabase.beginTransaction();
        try {
            sVar.r(3, str2);
            sVar.q(str2, ((o7.o) this.f82400g).f79678a);
            this.f82402i.getClass();
            long jR = br.a.r();
            Iterator it = cVar.i(str2).iterator();
            while (it.hasNext()) {
                String str3 = (String) it.next();
                if (sVar.i(str3) == 5) {
                    WorkDatabase_Impl workDatabase_Impl = (WorkDatabase_Impl) cVar.f95126a;
                    androidx.room.t tVarC = androidx.room.t.c(1, "SELECT COUNT(*)=0 FROM dependency WHERE work_spec_id=? AND prerequisite_id IN (SELECT id FROM workspec WHERE state!=2)");
                    if (str3 == null) {
                        tVarC.bindNull(1);
                    } else {
                        tVarC.bindString(1, str3);
                    }
                    workDatabase_Impl.assertNotSuspendingTransaction();
                    Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
                    try {
                        if (cursorL.moveToFirst() && cursorL.getInt(0) != 0) {
                            o7.r.c().d(str, "Setting status to enqueued for " + str3);
                            sVar.r(1, str3);
                            sVar.p(jR, str3);
                        }
                    } finally {
                        cursorL.close();
                        tVarC.d();
                    }
                }
            }
            workDatabase.setTransactionSuccessful();
            workDatabase.endTransaction();
            e(false);
        } catch (Throwable th2) {
            workDatabase.endTransaction();
            e(false);
            throw th2;
        }
    }

    public final void b() {
        if (h()) {
            return;
        }
        this.f82404k.beginTransaction();
        try {
            int i5 = this.f82405l.i(this.f82395b);
            this.f82404k.h().g(this.f82395b);
            if (i5 == 0) {
                e(false);
            } else if (i5 == 2) {
                a(this.f82400g);
            } else if (!fq.c.a(i5)) {
                this.f82409r = -512;
                c();
            }
            this.f82404k.setTransactionSuccessful();
            this.f82404k.endTransaction();
        } catch (Throwable th2) {
            this.f82404k.endTransaction();
            throw th2;
        }
    }

    public final void c() {
        String str = this.f82395b;
        x7.s sVar = this.f82405l;
        WorkDatabase workDatabase = this.f82404k;
        workDatabase.beginTransaction();
        try {
            sVar.r(1, str);
            this.f82402i.getClass();
            sVar.p(br.a.r(), str);
            sVar.o(this.f82397d.f95190v, str);
            sVar.n(-1L, str);
            workDatabase.setTransactionSuccessful();
        } finally {
            workDatabase.endTransaction();
            e(true);
        }
    }

    public final void d() {
        String str = this.f82395b;
        x7.s sVar = this.f82405l;
        WorkDatabase workDatabase = this.f82404k;
        workDatabase.beginTransaction();
        try {
            this.f82402i.getClass();
            sVar.p(br.a.r(), str);
            WorkDatabase_Impl workDatabase_Impl = sVar.f95193a;
            sVar.r(1, str);
            workDatabase_Impl.assertNotSuspendingTransaction();
            qp.h hVar = sVar.f95203k;
            d7.g gVarAcquire = hVar.acquire();
            if (str == null) {
                gVarAcquire.bindNull(1);
            } else {
                gVarAcquire.bindString(1, str);
            }
            workDatabase_Impl.beginTransaction();
            try {
                gVarAcquire.executeUpdateDelete();
                workDatabase_Impl.setTransactionSuccessful();
                workDatabase_Impl.endTransaction();
                hVar.release(gVarAcquire);
                sVar.o(this.f82397d.f95190v, str);
                workDatabase_Impl.assertNotSuspendingTransaction();
                qp.h hVar2 = sVar.f95199g;
                d7.g gVarAcquire2 = hVar2.acquire();
                if (str == null) {
                    gVarAcquire2.bindNull(1);
                } else {
                    gVarAcquire2.bindString(1, str);
                }
                workDatabase_Impl.beginTransaction();
                try {
                    gVarAcquire2.executeUpdateDelete();
                    workDatabase_Impl.setTransactionSuccessful();
                    workDatabase_Impl.endTransaction();
                    hVar2.release(gVarAcquire2);
                    sVar.n(-1L, str);
                    workDatabase.setTransactionSuccessful();
                } catch (Throwable th2) {
                    workDatabase_Impl.endTransaction();
                    hVar2.release(gVarAcquire2);
                    throw th2;
                }
            } catch (Throwable th3) {
                workDatabase_Impl.endTransaction();
                hVar.release(gVarAcquire);
                throw th3;
            }
        } finally {
            workDatabase.endTransaction();
            e(false);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x002f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void e(boolean z11) {
        boolean z12;
        this.f82404k.beginTransaction();
        try {
            x7.s sVarI = this.f82404k.i();
            sVarI.getClass();
            androidx.room.t tVarC = androidx.room.t.c(0, "SELECT COUNT(*) > 0 FROM workspec WHERE state NOT IN (2, 3, 5) LIMIT 1");
            WorkDatabase_Impl workDatabase_Impl = sVarI.f95193a;
            workDatabase_Impl.assertNotSuspendingTransaction();
            Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
            try {
                if (cursorL.moveToFirst()) {
                    z12 = cursorL.getInt(0) != 0;
                }
                if (!z12) {
                    y7.l.a(this.f82394a, RescheduleReceiver.class, false);
                }
                if (z11) {
                    this.f82405l.r(1, this.f82395b);
                    this.f82405l.s(this.f82409r, this.f82395b);
                    this.f82405l.n(-1L, this.f82395b);
                }
                this.f82404k.setTransactionSuccessful();
                this.f82404k.endTransaction();
                this.f82407p.j(Boolean.valueOf(z11));
            } finally {
                cursorL.close();
                tVarC.d();
            }
        } catch (Throwable th2) {
            this.f82404k.endTransaction();
            throw th2;
        }
    }

    public final void f() {
        if (this.f82405l.i(this.f82395b) == 2) {
            o7.r.c().getClass();
            e(true);
        } else {
            o7.r.c().getClass();
            e(false);
        }
    }

    public final void g() {
        String str = this.f82395b;
        WorkDatabase workDatabase = this.f82404k;
        workDatabase.beginTransaction();
        try {
            LinkedList linkedList = new LinkedList();
            linkedList.add(str);
            while (true) {
                boolean zIsEmpty = linkedList.isEmpty();
                x7.s sVar = this.f82405l;
                if (zIsEmpty) {
                    o7.g gVar = ((o7.m) this.f82400g).f79677a;
                    sVar.o(this.f82397d.f95190v, str);
                    sVar.q(str, gVar);
                    workDatabase.setTransactionSuccessful();
                    return;
                }
                String str2 = (String) linkedList.remove();
                if (sVar.i(str2) != 6) {
                    sVar.r(4, str2);
                }
                linkedList.addAll(this.f82406m.i(str2));
            }
        } finally {
            workDatabase.endTransaction();
            e(false);
        }
    }

    public final boolean h() {
        if (this.f82409r == -256) {
            return false;
        }
        o7.r.c().getClass();
        if (this.f82405l.i(this.f82395b) == 0) {
            e(false);
            return true;
        }
        e(!fq.c.a(r0));
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x007e A[Catch: all -> 0x006a, TryCatch #2 {all -> 0x006a, blocks: (B:14:0x004f, B:17:0x0059, B:22:0x006d, B:24:0x0073, B:35:0x00a0, B:30:0x007e, B:32:0x008f), top: B:106:0x004f }] */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() throws IllegalAccessException, InstantiationException, IOException, IllegalArgumentException, InvocationTargetException {
        o7.g gVarA;
        boolean z11;
        boolean z12;
        StringBuilder sb2 = new StringBuilder("Work [ id=");
        String str = this.f82395b;
        sb2.append(str);
        sb2.append(", tags={ ");
        ArrayList arrayList = this.n;
        Iterator it = arrayList.iterator();
        boolean z13 = true;
        while (it.hasNext()) {
            String str2 = (String) it.next();
            if (z13) {
                z13 = false;
            } else {
                sb2.append(", ");
            }
            sb2.append(str2);
        }
        sb2.append(" } ]");
        this.o = sb2.toString();
        x7.q qVar = this.f82397d;
        if (h()) {
            return;
        }
        WorkDatabase workDatabase = this.f82404k;
        workDatabase.beginTransaction();
        try {
            int i5 = qVar.f95172b;
            int i11 = qVar.f95181k;
            String className = qVar.f95174d;
            String str3 = qVar.f95173c;
            if (i5 != 1) {
                f();
                workDatabase.setTransactionSuccessful();
                o7.r.c().getClass();
                return;
            }
            if (qVar.d()) {
                this.f82402i.getClass();
                if (br.a.r() < qVar.a()) {
                    o7.r.c().getClass();
                    e(true);
                    workDatabase.setTransactionSuccessful();
                    return;
                }
            } else {
                if (qVar.f95172b == 1 && i11 > 0) {
                }
            }
            workDatabase.setTransactionSuccessful();
            workDatabase.endTransaction();
            boolean zD = qVar.d();
            x7.s sVar = this.f82405l;
            String str4 = f82393s;
            o7.c cVar = this.f82401h;
            if (zD) {
                gVarA = qVar.f95175e;
            } else {
                o7.s sVar2 = cVar.f79626e;
                sVar2.getClass();
                Intrinsics.g(className, "className");
                sVar2.R0(className);
                o7.j jVarA = o7.k.a(className);
                if (jVarA == null) {
                    o7.r.c().a(str4, "Could not create Input Merger ".concat(className));
                    g();
                    return;
                }
                ArrayList arrayList2 = new ArrayList();
                arrayList2.add(qVar.f95175e);
                WorkDatabase_Impl workDatabase_Impl = sVar.f95193a;
                androidx.room.t tVarC = androidx.room.t.c(1, "SELECT output FROM workspec WHERE id IN\n             (SELECT prerequisite_id FROM dependency WHERE work_spec_id=?)");
                if (str == null) {
                    tVarC.bindNull(1);
                } else {
                    tVarC.bindString(1, str);
                }
                workDatabase_Impl.assertNotSuspendingTransaction();
                Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
                try {
                    ArrayList arrayList3 = new ArrayList(cursorL.getCount());
                    while (cursorL.moveToNext()) {
                        arrayList3.add(o7.g.a(cursorL.isNull(0) ? null : cursorL.getBlob(0)));
                    }
                    cursorL.close();
                    tVarC.d();
                    arrayList2.addAll(arrayList3);
                    gVarA = jVarA.a(arrayList2);
                } catch (Throwable th2) {
                    cursorL.close();
                    tVarC.d();
                    throw th2;
                }
            }
            UUID uuidFromString = UUID.fromString(str);
            ExecutorService executorService = cVar.f79622a;
            h0 h0Var = cVar.f79625d;
            a8.c cVar2 = this.f82399f;
            y7.t tVar = new y7.t(workDatabase, cVar2);
            y7.s sVar3 = new y7.s(workDatabase, this.f82403j, cVar2);
            WorkerParameters workerParameters = new WorkerParameters();
            workerParameters.f15319a = uuidFromString;
            workerParameters.f15320b = gVarA;
            workerParameters.f15321c = new HashSet(arrayList);
            workerParameters.f15322d = this.f82396c;
            workerParameters.f15323e = i11;
            workerParameters.f15324f = executorService;
            workerParameters.f15325g = cVar2;
            workerParameters.f15326h = h0Var;
            workerParameters.f15327i = tVar;
            workerParameters.f15328j = sVar3;
            if (this.f82398e == null) {
                this.f82398e = h0Var.a(this.f82394a, str3, workerParameters);
            }
            o7.q qVar2 = this.f82398e;
            if (qVar2 == null) {
                o7.r.c().a(str4, "Could not create Worker " + str3);
                g();
                return;
            }
            if (qVar2.isUsed()) {
                o7.r.c().a(str4, "Received an already-used Worker " + str3 + "; Worker Factory should return new instances");
                g();
                return;
            }
            this.f82398e.setUsed();
            workDatabase.beginTransaction();
            try {
                if (sVar.i(str) == 1) {
                    sVar.r(2, str);
                    WorkDatabase_Impl workDatabase_Impl2 = sVar.f95193a;
                    workDatabase_Impl2.assertNotSuspendingTransaction();
                    qp.h hVar = sVar.f95202j;
                    d7.g gVarAcquire = hVar.acquire();
                    if (str == null) {
                        z12 = true;
                        gVarAcquire.bindNull(1);
                    } else {
                        z12 = true;
                        gVarAcquire.bindString(1, str);
                    }
                    workDatabase_Impl2.beginTransaction();
                    try {
                        gVarAcquire.executeUpdateDelete();
                        workDatabase_Impl2.setTransactionSuccessful();
                        workDatabase_Impl2.endTransaction();
                        hVar.release(gVarAcquire);
                        sVar.s(-256, str);
                        z11 = z12;
                    } catch (Throwable th3) {
                        workDatabase_Impl2.endTransaction();
                        hVar.release(gVarAcquire);
                        throw th3;
                    }
                } else {
                    z11 = false;
                }
                workDatabase.setTransactionSuccessful();
                if (!z11) {
                    f();
                    return;
                }
                if (h()) {
                    return;
                }
                y7.r rVar = new y7.r(this.f82394a, this.f82397d, this.f82398e, sVar3, this.f82399f);
                cVar2.f461d.execute(rVar);
                z7.j jVar = rVar.f96764a;
                b80.a aVar = new b80.a(16, this, jVar);
                fi.s sVar4 = new fi.s(1);
                z7.j jVar2 = this.f82408q;
                jVar2.b(aVar, sVar4);
                boolean z14 = false;
                jVar.b(new u0(this, jVar, z14, 7), cVar2.f461d);
                jVar2.b(new u0(this, this.o, z14, 8), cVar2.f458a);
            } catch (Throwable th4) {
                throw th4;
            }
        } finally {
            workDatabase.endTransaction();
        }
    }
}
