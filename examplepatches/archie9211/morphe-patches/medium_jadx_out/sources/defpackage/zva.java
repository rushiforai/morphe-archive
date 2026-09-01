package defpackage;

import com.apollographql.apollo.exception.ApolloNetworkException;
import com.apollographql.apollo.exception.ApolloWebSocketClosedException;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import java.net.ProtocolException;
import java.util.ArrayDeque;
import java.util.List;
import java.util.Random;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zva {
    public static final List x = d46.Q(c8a.HTTP_1_1);
    public final lig a;
    public final Random b;
    public final long c;
    public o1f d;
    public final long e;
    public final long f;
    public final String g;
    public cva h;
    public hg3 i;
    public u1f j;
    public v1f k;
    public final bgd l;
    public String m;
    public m50 n;
    public final ArrayDeque o;
    public final ArrayDeque p;
    public long q;
    public boolean r;
    public int s;
    public String t;
    public boolean u;
    public int v;
    public boolean w;

    public zva(cgd cgdVar, kbb kbbVar, lig ligVar, Random random, long j, long j2, long j3) {
        cgdVar.getClass();
        this.a = ligVar;
        this.b = random;
        this.c = j;
        this.d = null;
        this.e = j2;
        this.f = j3;
        this.l = cgdVar.d();
        this.o = new ArrayDeque();
        this.p = new ArrayDeque();
        this.s = -1;
        String str = kbbVar.b;
        if (!"GET".equals(str)) {
            ywb.g(ka1.r("Request must be GET: ", str));
            throw null;
        }
        h21 h21Var = h21.d;
        byte[] bArr = new byte[16];
        random.nextBytes(bArr);
        this.g = dq1.D(bArr).a();
    }

    public static void c(zva zvaVar, Exception exc, int i) {
        v1f v1fVar;
        boolean z = (i & 4) == 0;
        zvaVar.getClass();
        rya ryaVar = new rya();
        synchronized (zvaVar) {
            try {
                if (zvaVar.u) {
                    return;
                }
                zvaVar.u = true;
                m50 m50Var = zvaVar.n;
                v1f v1fVar2 = zvaVar.k;
                ryaVar.a = v1fVar2;
                zvaVar.k = null;
                if (!z && v1fVar2 != null) {
                    bgd.c(zvaVar.l, zvaVar.m + " writer close", 0L, new yj8(27, ryaVar), 2);
                }
                zvaVar.l.g();
                try {
                    lig ligVar = zvaVar.a;
                    ((vx1) ligVar.b).V(c1e.a);
                    ((uz0) ligVar.c).f(new ApolloNetworkException("Web socket communication error", exc), false);
                    if (m50Var != null) {
                        m50Var.cancel();
                    }
                    if (!z || (v1fVar = (v1f) ryaVar.a) == null) {
                        return;
                    }
                    egf.b(v1fVar);
                } finally {
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void b(int i, String str) {
        String str2;
        long j = this.f;
        synchronized (this) {
            h21 h21VarO = null;
            try {
                if (i < 1000 || i >= 5000) {
                    str2 = "Code must be in range [1000,5000): " + i;
                } else if ((1004 > i || i >= 1007) && (1015 > i || i >= 3000)) {
                    str2 = null;
                } else {
                    str2 = "Code " + i + " is reserved and may not be used.";
                }
                if (str2 != null) {
                    throw new IllegalArgumentException(str2.toString());
                }
                if (str != null) {
                    h21 h21Var = h21.d;
                    h21VarO = dq1.o(str);
                    if (h21VarO.a.length > 123) {
                        throw new IllegalArgumentException("reason.size() > 123: ".concat(str).toString());
                    }
                }
                if (!this.u && !this.r) {
                    this.r = true;
                    this.p.add(new xva(i, j, h21VarO));
                    h();
                }
            } finally {
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0053  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void d() {
        /*
            r10 = this;
            monitor-enter(r10)
            java.lang.String r0 = r10.t     // Catch: java.lang.Throwable -> L3d
            u1f r1 = r10.j     // Catch: java.lang.Throwable -> L3d
            r2 = 0
            r10.j = r2     // Catch: java.lang.Throwable -> L3d
            boolean r3 = r10.r     // Catch: java.lang.Throwable -> L3d
            if (r3 == 0) goto L44
            java.util.ArrayDeque r3 = r10.p     // Catch: java.lang.Throwable -> L3d
            boolean r3 = r3.isEmpty()     // Catch: java.lang.Throwable -> L3d
            if (r3 == 0) goto L44
            v1f r3 = r10.k     // Catch: java.lang.Throwable -> L3d
            if (r3 == 0) goto L3f
            r10.k = r2     // Catch: java.lang.Throwable -> L3d
            bgd r4 = r10.l     // Catch: java.lang.Throwable -> L3d
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L3d
            r5.<init>()     // Catch: java.lang.Throwable -> L3d
            java.lang.String r6 = r10.m     // Catch: java.lang.Throwable -> L3d
            r5.append(r6)     // Catch: java.lang.Throwable -> L3d
            java.lang.String r6 = " writer close"
            r5.append(r6)     // Catch: java.lang.Throwable -> L3d
            java.lang.String r5 = r5.toString()     // Catch: java.lang.Throwable -> L3d
            yj8 r8 = new yj8     // Catch: java.lang.Throwable -> L3d
            r6 = 26
            r8.<init>(r6, r3)     // Catch: java.lang.Throwable -> L3d
            r9 = 2
            r6 = 0
            defpackage.bgd.c(r4, r5, r6, r8, r9)     // Catch: java.lang.Throwable -> L3d
            goto L3f
        L3d:
            r0 = move-exception
            goto L69
        L3f:
            bgd r3 = r10.l     // Catch: java.lang.Throwable -> L3d
            r3.g()     // Catch: java.lang.Throwable -> L3d
        L44:
            boolean r3 = r10.u     // Catch: java.lang.Throwable -> L3d
            if (r3 != 0) goto L53
            v1f r3 = r10.k     // Catch: java.lang.Throwable -> L3d
            if (r3 != 0) goto L53
            int r3 = r10.s     // Catch: java.lang.Throwable -> L3d
            r4 = -1
            if (r3 == r4) goto L53
            r3 = 1
            goto L54
        L53:
            r3 = 0
        L54:
            monitor-exit(r10)
            if (r3 == 0) goto L63
            lig r10 = r10.a
            r0.getClass()
            java.lang.Object r10 = r10.c
            uz0 r10 = (defpackage.uz0) r10
            r10.c(r2)
        L63:
            if (r1 == 0) goto L68
            defpackage.egf.b(r1)
        L68:
            return
        L69:
            monitor-exit(r10)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zva.d():void");
    }

    public final void f(int i, String str) {
        if (i == -1) {
            ay0.e("Failed requirement.");
            return;
        }
        synchronized (this) {
            if (this.s != -1) {
                throw new IllegalStateException("already closed");
            }
            this.s = i;
            this.t = str;
        }
        lig ligVar = this.a;
        ((vx1) ligVar.b).V(c1e.a);
        ((uz0) ligVar.c).f(new ApolloWebSocketClosedException("WebSocket Closed code='" + i + "' reason='" + str + '\'', null), false);
    }

    public final synchronized void g(h21 h21Var) {
        try {
            h21Var.getClass();
            if (!this.u && (!this.r || !this.p.isEmpty())) {
                this.o.add(h21Var);
                h();
            }
        } finally {
        }
    }

    public final void h() {
        TimeZone timeZone = ggf.a;
        hg3 hg3Var = this.i;
        if (hg3Var != null) {
            this.l.d(hg3Var, 0L);
        }
    }

    public final synchronized boolean i(int i, h21 h21Var) {
        if (!this.u && !this.r) {
            if (this.q + ((long) h21Var.e()) > 16777216) {
                b(PhotoshopDirectory.TAG_MAC_PRINT_INFO, null);
                return false;
            }
            this.q += (long) h21Var.e();
            this.p.add(new yva(i, h21Var));
            h();
            return true;
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0077 A[Catch: all -> 0x0083, TRY_ENTER, TryCatch #0 {all -> 0x0083, blocks: (B:33:0x0077, B:36:0x0086, B:38:0x008a, B:39:0x009a, B:41:0x00a9, B:44:0x00ad, B:45:0x00ae, B:46:0x00af, B:48:0x00b3, B:62:0x00db, B:66:0x0101, B:68:0x010b, B:69:0x010e, B:72:0x0119, B:74:0x011d, B:79:0x0130, B:80:0x0132, B:81:0x0133, B:82:0x013c, B:64:0x00f1, B:83:0x013d, B:84:0x0142, B:40:0x009b, B:71:0x0116), top: B:90:0x0075, inners: #2, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0086 A[Catch: all -> 0x0083, TryCatch #0 {all -> 0x0083, blocks: (B:33:0x0077, B:36:0x0086, B:38:0x008a, B:39:0x009a, B:41:0x00a9, B:44:0x00ad, B:45:0x00ae, B:46:0x00af, B:48:0x00b3, B:62:0x00db, B:66:0x0101, B:68:0x010b, B:69:0x010e, B:72:0x0119, B:74:0x011d, B:79:0x0130, B:80:0x0132, B:81:0x0133, B:82:0x013c, B:64:0x00f1, B:83:0x013d, B:84:0x0142, B:40:0x009b, B:71:0x0116), top: B:90:0x0075, inners: #2, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:76:0x012b A[DONT_GENERATE] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean j() {
        /*
            Method dump skipped, instruction units count: 331
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zva.j():boolean");
    }

    public final xjc a(adb adbVar) {
        yi5 yi5Var = adbVar.f;
        int i = adbVar.d;
        if (i != 101) {
            StringBuilder sb = new StringBuilder("Expected HTTP 101 response but was '");
            sb.append(i);
            sb.append(' ');
            throw new ProtocolException(ev6.z(sb, adbVar.c, '\''));
        }
        String strD = yi5Var.d("Connection");
        if (strD == null) {
            strD = null;
        }
        if (!"Upgrade".equalsIgnoreCase(strD)) {
            throw new ProtocolException(wgd.t('\'', "Expected 'Connection' header value 'Upgrade' but was '", strD));
        }
        String strD2 = yi5Var.d("Upgrade");
        if (strD2 == null) {
            strD2 = null;
        }
        if (!"websocket".equalsIgnoreCase(strD2)) {
            throw new ProtocolException(wgd.t('\'', "Expected 'Upgrade' header value 'websocket' but was '", strD2));
        }
        String strD3 = yi5Var.d("Sec-WebSocket-Accept");
        if (strD3 == null) {
            strD3 = null;
        }
        h21 h21Var = h21.d;
        String strA = dq1.o(this.g + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11").d("SHA-1").a();
        if (g76.L(strA, strD3)) {
            xjc xjcVar = adbVar.h;
            if (xjcVar != null) {
                return xjcVar;
            }
            lg8.k(kSWQKWZ.YgIAkhPWHVTR);
            return null;
        }
        throw new ProtocolException("Expected 'Sec-WebSocket-Accept' header value '" + strA + "' but was '" + strD3 + '\'');
    }

    public final void e(String str, m50 m50Var) {
        String str2 = fiHTiFJ.exTlCyjW;
        o1f o1fVar = this.d;
        o1fVar.getClass();
        synchronized (this) {
            try {
                this.m = str;
                this.n = m50Var;
                this.k = new v1f((xua) m50Var.d, this.b, o1fVar.a, o1fVar.c, this.e);
                this.i = new hg3(this);
                long j = this.c;
                if (j != 0) {
                    long nanos = TimeUnit.MILLISECONDS.toNanos(j);
                    this.l.d(new agd(str.concat(str2), new xs(1, nanos, this)), nanos);
                }
                if (!this.p.isEmpty()) {
                    h();
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        this.j = new u1f((yua) m50Var.c, this, o1fVar.a, o1fVar.e);
    }
}
