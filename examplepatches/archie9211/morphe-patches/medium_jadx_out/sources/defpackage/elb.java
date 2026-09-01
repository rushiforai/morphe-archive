package defpackage;

import android.os.Looper;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class elb {
    public k92 a;
    public ib2 b;
    public Executor c;
    public s10 d;
    public w73 e;
    public v76 f;
    public boolean h;
    public final s26 g = new s26(new xib(0, this, elb.class, "onClosed", "onClosed()V", 0, 1));
    public final ThreadLocal i = new ThreadLocal();
    public final LinkedHashMap j = new LinkedHashMap();
    public boolean k = true;

    public final void a() {
        if (this.h) {
            return;
        }
        if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
            ygf.f("Cannot access database on the main thread since it may potentially lock the UI for a long period of time.");
        }
    }

    public final void b() {
        a();
        a();
        z25 z25VarZ = g().Z();
        if (!z25VarZ.k0()) {
            lk7.E(new u76(f(), null, 2));
        }
        if (z25VarZ.a.isWriteAheadLoggingEnabled()) {
            z25VarZ.m();
        } else {
            z25VarZ.f();
        }
    }

    public List c(LinkedHashMap linkedHashMap) {
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(ei7.P(linkedHashMap.size()));
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            linkedHashMap2.put(vx0.T((wg6) entry.getKey()), entry.getValue());
        }
        return ey3.a;
    }

    public abstract v76 d();

    public vw3 e() {
        throw new ei8(0);
    }

    public final v76 f() {
        v76 v76Var = this.f;
        if (v76Var != null) {
            return v76Var;
        }
        g76.g0("internalTracker");
        throw null;
    }

    public final v2d g() {
        w73 w73Var = this.e;
        if (w73Var == null) {
            g76.g0("connectionManager");
            throw null;
        }
        v2d v2dVar = (v2d) w73Var.h;
        if (v2dVar != null) {
            return v2dVar;
        }
        ygf.f("Cannot return a SupportSQLiteOpenHelper since no SupportSQLiteOpenHelper.Factory was configured with Room.");
        return null;
    }

    public final ib2 h() {
        k92 k92Var = this.a;
        if (k92Var != null) {
            return k92Var.a;
        }
        g76.g0("coroutineScope");
        throw null;
    }

    public Set i() {
        return bu1.q1(new ArrayList(cu1.k0(ny3.a, 10)));
    }

    public LinkedHashMap j() {
        int iP = ei7.P(cu1.k0(ny3.a, 10));
        if (iP < 16) {
            iP = 16;
        }
        return new LinkedHashMap(iP);
    }

    public final boolean k() {
        w73 w73Var = this.e;
        if (w73Var != null) {
            return ((v2d) w73Var.h) != null;
        }
        g76.g0("connectionManager");
        throw null;
    }

    public final boolean l() {
        return o() && g().Z().k0();
    }

    public final void m() {
        g().Z().B();
        if (l()) {
            return;
        }
        v76 v76VarF = f();
        v76VarF.b.e(v76VarF.e, v76VarF.f);
    }

    public final void n(anb anbVar) {
        anbVar.getClass();
        v76 v76VarF = f();
        mtd mtdVar = v76VarF.b;
        mtdVar.getClass();
        gnb gnbVarB0 = anbVar.B0("PRAGMA query_only");
        try {
            gnbVarB0.w0();
            boolean zP = gnbVarB0.P();
            xz5.F(gnbVarB0, null);
            if (!zP) {
                qk7.q(anbVar, "PRAGMA temp_store = MEMORY");
                qk7.q(anbVar, "PRAGMA recursive_triggers = 1");
                qk7.q(anbVar, "DROP TABLE IF EXISTS room_table_modification_log");
                if (mtdVar.a) {
                    qk7.q(anbVar, "CREATE TEMP TABLE IF NOT EXISTS room_table_modification_log (table_id INTEGER PRIMARY KEY, invalidated INTEGER NOT NULL DEFAULT 0)");
                } else {
                    qk7.q(anbVar, tuc.L("CREATE TEMP TABLE IF NOT EXISTS room_table_modification_log (table_id INTEGER PRIMARY KEY, invalidated INTEGER NOT NULL DEFAULT 0)", "TEMP", ""));
                }
                hn8 hn8Var = (hn8) mtdVar.h;
                ReentrantLock reentrantLock = hn8Var.a;
                reentrantLock.lock();
                try {
                    hn8Var.d = true;
                } finally {
                    reentrantLock.unlock();
                }
            }
            synchronized (v76VarF.h) {
            }
        } finally {
        }
    }

    public final boolean o() {
        w73 w73Var = this.e;
        if (w73Var == null) {
            g76.g0("connectionManager");
            throw null;
        }
        z25 z25Var = (z25) w73Var.i;
        if (z25Var != null) {
            return z25Var.isOpen();
        }
        return false;
    }

    public final Object p(m45 m45Var) {
        if (!k()) {
            return n01.c0(this, false, true, new r00(7, m45Var));
        }
        b();
        try {
            Object objInvoke = m45Var.invoke();
            q();
            return objInvoke;
        } finally {
            m();
        }
    }

    public final void q() {
        g().Z().L();
    }

    public final Object r(boolean z, b55 b55Var, p92 p92Var) {
        w73 w73Var = this.e;
        if (w73Var != null) {
            return ((b42) w73Var.g).G(z, b55Var, p92Var);
        }
        g76.g0("connectionManager");
        throw null;
    }
}
