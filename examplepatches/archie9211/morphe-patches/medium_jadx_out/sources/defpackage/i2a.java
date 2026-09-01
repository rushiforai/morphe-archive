package defpackage;

import android.content.Context;
import android.content.Intent;
import android.os.PowerManager;
import androidx.work.impl.WorkDatabase;
import androidx.work.impl.WorkerStoppedException;
import androidx.work.impl.foreground.SystemForegroundService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i2a {
    public static final String l = d87.k("Processor");
    public final Context b;
    public final r32 c;
    public final q7f d;
    public final WorkDatabase e;
    public final HashMap g = new HashMap();
    public final HashMap f = new HashMap();
    public final HashSet i = new HashSet();
    public final ArrayList j = new ArrayList();
    public PowerManager.WakeLock a = null;
    public final Object k = new Object();
    public final HashMap h = new HashMap();

    public i2a(Context context, r32 r32Var, q7f q7fVar, WorkDatabase workDatabase) {
        this.b = context;
        this.c = r32Var;
        this.d = q7fVar;
        this.e = workDatabase;
    }

    public static boolean e(String str, u8f u8fVar, int i) {
        String str2 = l;
        if (u8fVar == null) {
            d87.h().d(str2, "WorkerWrapper could not be found for " + str);
            return false;
        }
        u8fVar.m.k(new WorkerStoppedException(i));
        d87.h().d(str2, "WorkerWrapper interrupted for " + str);
        return true;
    }

    public final void a(t44 t44Var) {
        synchronized (this.k) {
            this.j.add(t44Var);
        }
    }

    public final u8f b(String str) {
        u8f u8fVar = (u8f) this.f.remove(str);
        boolean z = u8fVar != null;
        if (!z) {
            u8fVar = (u8f) this.g.remove(str);
        }
        this.h.remove(str);
        if (z) {
            synchronized (this.k) {
                try {
                    if (this.f.isEmpty()) {
                        Context context = this.b;
                        String str2 = o6d.j;
                        Intent intent = new Intent(context, (Class<?>) SystemForegroundService.class);
                        intent.setAction("ACTION_STOP_FOREGROUND");
                        try {
                            this.b.startService(intent);
                        } catch (Throwable th) {
                            d87.h().g(l, "Unable to stop foreground service", th);
                        }
                        PowerManager.WakeLock wakeLock = this.a;
                        if (wakeLock != null) {
                            wakeLock.release();
                            this.a = null;
                        }
                    }
                } finally {
                }
            }
        }
        return u8fVar;
    }

    public final c8f c(String str) {
        synchronized (this.k) {
            try {
                u8f u8fVarD = d(str);
                if (u8fVarD == null) {
                    return null;
                }
                return u8fVarD.a;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final u8f d(String str) {
        u8f u8fVar = (u8f) this.f.get(str);
        return u8fVar == null ? (u8f) this.g.get(str) : u8fVar;
    }

    public final boolean f(String str) {
        boolean z;
        synchronized (this.k) {
            z = d(str) != null;
        }
        return z;
    }

    public final void g(t44 t44Var) {
        synchronized (this.k) {
            this.j.remove(t44Var);
        }
    }

    public final void h(h7f h7fVar) {
        this.d.d.execute(new fi2(this, 20, h7fVar));
    }

    public final boolean i(unc uncVar, int i) {
        String str = uncVar.a.a;
        synchronized (this.k) {
            try {
                if (this.f.get(str) == null) {
                    Set set = (Set) this.h.get(str);
                    if (set != null && set.contains(uncVar)) {
                        return e(str, b(str), i);
                    }
                    return false;
                }
                d87.h().d(l, "Ignored stopWork. WorkerWrapper " + str + " is in foreground");
                return false;
            } finally {
            }
        }
    }
}
