package y7;

import androidx.work.impl.WorkDatabase;
import androidx.work.impl.WorkDatabase_Impl;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedList;
import kl.q0;
import o7.y;
import p7.x;

/* loaded from: classes2.dex */
public abstract class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final q0 f96741a = new q0(6);

    public static void a(String str, p7.s sVar) throws IOException {
        x xVarB;
        WorkDatabase workDatabase = sVar.f82374c;
        x7.s sVarI = workDatabase.i();
        x7.c cVarD = workDatabase.d();
        LinkedList linkedList = new LinkedList();
        linkedList.add(str);
        while (!linkedList.isEmpty()) {
            String str2 = (String) linkedList.remove();
            int i5 = sVarI.i(str2);
            if (i5 != 3 && i5 != 4) {
                WorkDatabase_Impl workDatabase_Impl = sVarI.f95193a;
                workDatabase_Impl.assertNotSuspendingTransaction();
                qp.h hVar = sVarI.f95198f;
                d7.g gVarAcquire = hVar.acquire();
                if (str2 == null) {
                    gVarAcquire.bindNull(1);
                } else {
                    gVarAcquire.bindString(1, str2);
                }
                workDatabase_Impl.beginTransaction();
                try {
                    gVarAcquire.executeUpdateDelete();
                    workDatabase_Impl.setTransactionSuccessful();
                } finally {
                    workDatabase_Impl.endTransaction();
                    hVar.release(gVarAcquire);
                }
            }
            linkedList.addAll(cVarD.i(str2));
        }
        p7.h hVar2 = sVar.f82377f;
        synchronized (hVar2.f82346k) {
            o7.r.c().getClass();
            hVar2.f82344i.add(str);
            xVarB = hVar2.b(str);
        }
        p7.h.d(xVarB, 1);
        Iterator it = sVar.f82376e.iterator();
        while (it.hasNext()) {
            ((p7.j) it.next()).b(str);
        }
    }

    public static c b(String str, p7.s sVar, boolean z11) {
        return new c(str, sVar, z11);
    }

    public static b c(String str, p7.s sVar) {
        return new b(sVar, str, 1);
    }

    public final q0 d() {
        return this.f96741a;
    }

    public abstract void e();

    @Override // java.lang.Runnable
    public final void run() {
        q0 q0Var = this.f96741a;
        try {
            e();
            q0Var.g(y.f79684ep);
        } catch (Throwable th2) {
            q0Var.g(new o7.v(th2));
        }
    }
}
