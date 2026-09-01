package defpackage;

import android.util.Log;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g7c {
    public final o1c a;
    public final e1c b;
    public final d1c c;
    public final bmd d;
    public final tt2 e;
    public final v1a f;
    public final ib2 g;
    public t0c h;
    public boolean i;
    public boolean j;
    public String k;

    public g7c(o1c o1cVar, e1c e1cVar, d1c d1cVar, bmd bmdVar, tt2 tt2Var, v1a v1aVar, ib2 ib2Var) {
        o1cVar.getClass();
        e1cVar.getClass();
        d1cVar.getClass();
        bmdVar.getClass();
        tt2Var.getClass();
        v1aVar.getClass();
        ib2Var.getClass();
        this.a = o1cVar;
        this.b = e1cVar;
        this.c = d1cVar;
        this.d = bmdVar;
        this.e = tt2Var;
        this.f = v1aVar;
        this.g = ib2Var;
        this.k = "";
        vx0.c0(o7f.c(ib2Var), null, null, new b7c(this, null, 0), 3);
    }

    public final void a() {
        this.i = false;
        if (this.h == null) {
            Log.d("FirebaseSessions", "App backgrounded, but local SessionData not initialized");
            return;
        }
        Log.d("FirebaseSessions", "App backgrounded on " + this.f.a());
        vx0.c0(o7f.c(this.g), null, null, new b7c(this, null, 1), 3);
    }

    public final void b() {
        this.i = true;
        t0c t0cVar = this.h;
        if (t0cVar == null) {
            this.j = true;
            Log.d("FirebaseSessions", "App foregrounded, but local SessionData not initialized");
            return;
        }
        n92 n92Var = null;
        if (t0cVar == null) {
            g76.g0("localSessionData");
            throw null;
        }
        Log.d("FirebaseSessions", "App foregrounded on " + this.f.a());
        if (d(t0cVar) || c(t0cVar)) {
            vx0.c0(o7f.c(this.g), null, null, new eub(this, t0cVar, n92Var, 8), 3);
        }
    }

    public final boolean c(t0c t0cVar) {
        Map map = t0cVar.c;
        boolean z = true;
        v1a v1aVar = this.f;
        if (map == null) {
            Log.d("FirebaseSessions", "No process data for " + v1aVar.a());
            return true;
        }
        v1aVar.getClass();
        t1a t1aVar = (t1a) map.get(v1aVar.a());
        if (t1aVar != null && t1aVar.a == v1aVar.c && g76.L(t1aVar.b, (String) v1aVar.d.getValue())) {
            z = false;
        }
        if (z) {
            Log.d("FirebaseSessions", "Process " + v1aVar.a() + " is stale");
        }
        return z;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x003a  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x004f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean d(defpackage.t0c r11) {
        /*
            r10 = this;
            zld r0 = r11.b
            y0c r11 = r11.a
            java.lang.String r1 = "Session "
            java.lang.String r2 = "FirebaseSessions"
            r3 = 0
            if (r0 == 0) goto L77
            bmd r4 = r10.d
            r4.getClass()
            zld r4 = defpackage.bmd.a()
            int r5 = defpackage.in3.d
            long r4 = r4.a
            long r6 = r0.a
            long r4 = r4 - r6
            mn3 r0 = defpackage.mn3.MILLISECONDS
            long r4 = defpackage.hlg.U(r4, r0)
            o1c r10 = r10.a
            g2c r0 = r10.a
            in3 r0 = r0.c()
            r6 = 0
            if (r0 == 0) goto L3a
            long r8 = r0.a
            int r0 = (r8 > r6 ? 1 : (r8 == r6 ? 0 : -1))
            if (r0 <= 0) goto L3a
            boolean r0 = defpackage.in3.g(r8)
            if (r0 != 0) goto L3a
            goto L57
        L3a:
            g2c r10 = r10.b
            in3 r10 = r10.c()
            if (r10 == 0) goto L4f
            long r8 = r10.a
            int r10 = (r8 > r6 ? 1 : (r8 == r6 ? 0 : -1))
            if (r10 <= 0) goto L4f
            boolean r10 = defpackage.in3.g(r8)
            if (r10 != 0) goto L4f
            goto L57
        L4f:
            r10 = 30
            mn3 r0 = defpackage.mn3.MINUTES
            long r8 = defpackage.hlg.T(r10, r0)
        L57:
            int r10 = defpackage.in3.c(r4, r8)
            if (r10 <= 0) goto L5e
            r3 = 1
        L5e:
            if (r3 == 0) goto L76
            java.lang.StringBuilder r10 = new java.lang.StringBuilder
            r10.<init>(r1)
            java.lang.String r11 = r11.a
            r10.append(r11)
            java.lang.String r11 = " is expired"
            r10.append(r11)
            java.lang.String r10 = r10.toString()
            android.util.Log.d(r2, r10)
        L76:
            return r3
        L77:
            java.lang.StringBuilder r10 = new java.lang.StringBuilder
            r10.<init>(r1)
            java.lang.String r11 = r11.a
            r10.append(r11)
            java.lang.String r11 = " has not backgrounded yet"
            r10.append(r11)
            java.lang.String r10 = r10.toString()
            android.util.Log.d(r2, r10)
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g7c.d(t0c):boolean");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(java.lang.String r6, defpackage.c7c r7, defpackage.n92 r8) {
        /*
            Method dump skipped, instruction units count: 249
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g7c.e(java.lang.String, c7c, n92):java.lang.Object");
    }
}
