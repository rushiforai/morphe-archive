package defpackage;

import android.content.SharedPreferences;
import android.os.SystemClock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class un6 {
    public final ljc a;

    public un6(ljc ljcVar, wz7 wz7Var) {
        this.a = ljcVar;
    }

    public final long a() {
        vn6 vn6Var;
        ljc ljcVar = this.a;
        ljcVar.a();
        a1a a1aVar = ljcVar.e;
        zm7 zm7Var = (zm7) a1aVar.b;
        long j = ((SharedPreferences) zm7Var.b).getLong("com.lyft.kronos.cached_current_time", 0L);
        long j2 = ((SharedPreferences) zm7Var.b).getLong("com.lyft.kronos.cached_elapsed_time", 0L);
        ijc ijcVar = j2 == 0 ? null : new ijc(j, j2, ((SharedPreferences) zm7Var.b).getLong("com.lyft.kronos.cached_offset", 0L), (wz7) a1aVar.c);
        if (((jjc) ljcVar.a.get()) == jjc.IDLE && ijcVar != null && Math.abs((ijcVar.a - ijcVar.b) - (System.currentTimeMillis() - SystemClock.elapsedRealtime())) >= 1000) {
            a1a a1aVar2 = ljcVar.e;
            synchronized (a1aVar2) {
                ((SharedPreferences) ((zm7) a1aVar2.b).b).edit().clear().apply();
            }
            ijcVar = null;
        }
        if (ijcVar == null) {
            if (SystemClock.elapsedRealtime() - ljcVar.b.get() >= ljcVar.i) {
                ljcVar.b();
            }
            vn6Var = null;
        } else {
            long jElapsedRealtime = SystemClock.elapsedRealtime() - ijcVar.b;
            if (jElapsedRealtime >= ljcVar.j && SystemClock.elapsedRealtime() - ljcVar.b.get() >= ljcVar.i) {
                ljcVar.b();
            }
            vn6Var = new vn6((SystemClock.elapsedRealtime() - ijcVar.b) + ijcVar.a + ijcVar.c, Long.valueOf(jElapsedRealtime));
        }
        if (vn6Var == null) {
            vn6Var = new vn6(System.currentTimeMillis(), null);
        }
        return vn6Var.a;
    }
}
