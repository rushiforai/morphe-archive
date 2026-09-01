package defpackage;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.TimeUnit;
import okhttp3.internal.http2.ConnectionShutdownException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rs5 implements b44 {
    public static final List g = ggf.k(new String[]{"connection", "host", "keep-alive", "proxy-connection", "te", "transfer-encoding", "encoding", "upgrade", ":method", ":path", ":scheme", ":authority"});
    public static final List h = ggf.k(new String[]{CspinKvYN.IwCZsXvgWFfnDym, "host", "keep-alive", "proxy-connection", "te", "transfer-encoding", "encoding", "upgrade"});
    public final dva a;
    public final nva b;
    public final qs5 c;
    public volatile xs5 d;
    public final c8a e;
    public volatile boolean f;

    public rs5(up8 up8Var, dva dvaVar, nva nvaVar, qs5 qs5Var) {
        up8Var.getClass();
        qs5Var.getClass();
        this.a = dvaVar;
        this.b = nvaVar;
        this.c = qs5Var;
        List list = up8Var.s;
        c8a c8aVar = c8a.H2_PRIOR_KNOWLEDGE;
        this.e = list.contains(c8aVar) ? c8aVar : c8a.HTTP_2;
    }

    @Override // defpackage.b44
    public final ikc a(adb adbVar) {
        xs5 xs5Var = this.d;
        xs5Var.getClass();
        return xs5Var.h;
    }

    @Override // defpackage.b44
    public final void b(kbb kbbVar) throws IOException {
        int i;
        xs5 xs5Var;
        boolean z;
        kbbVar.getClass();
        if (this.d != null) {
            return;
        }
        boolean z2 = kbbVar.d != null;
        yi5 yi5Var = kbbVar.c;
        ArrayList arrayList = new ArrayList(yi5Var.size() + 4);
        arrayList.add(new vi5(kbbVar.b, vi5.f));
        h21 h21Var = vi5.g;
        qt5 qt5Var = kbbVar.a;
        qt5Var.getClass();
        String strB = qt5Var.b();
        String strD = qt5Var.d();
        if (strD != null) {
            strB = ev6.r('?', strB, strD);
        }
        arrayList.add(new vi5(strB, h21Var));
        String strD2 = yi5Var.d("Host");
        if (strD2 != null) {
            arrayList.add(new vi5(strD2, vi5.i));
        }
        arrayList.add(new vi5(qt5Var.a, vi5.h));
        int size = yi5Var.size();
        for (int i2 = 0; i2 < size; i2++) {
            String strD3 = iq7.D(yi5Var, i2);
            Locale locale = Locale.US;
            locale.getClass();
            String lowerCase = strD3.toLowerCase(locale);
            lowerCase.getClass();
            if (!g.contains(lowerCase) || (lowerCase.equals("te") && iq7.F(yi5Var, i2).equals("trailers"))) {
                arrayList.add(new vi5(lowerCase, iq7.F(yi5Var, i2)));
            }
        }
        qs5 qs5Var = this.c;
        qs5Var.getClass();
        boolean z3 = !z2;
        synchronized (qs5Var.w) {
            synchronized (qs5Var) {
                try {
                    if (qs5Var.e > 1073741823) {
                        qs5Var.D(b14.REFUSED_STREAM);
                    }
                    if (qs5Var.f) {
                        throw new ConnectionShutdownException();
                    }
                    i = qs5Var.e;
                    qs5Var.e = i + 2;
                    xs5Var = new xs5(i, qs5Var, z3, false, null);
                    z = !z2 || qs5Var.t >= qs5Var.u || xs5Var.d >= xs5Var.e;
                    if (xs5Var.i()) {
                        qs5Var.b.put(Integer.valueOf(i), xs5Var);
                    }
                } catch (Throwable th) {
                    throw th;
                }
            }
            qs5Var.w.D(z3, i, arrayList);
        }
        if (z) {
            qs5Var.w.flush();
        }
        this.d = xs5Var;
        boolean z4 = this.f;
        xs5 xs5Var2 = this.d;
        if (z4) {
            xs5Var2.getClass();
            xs5Var2.f(b14.CANCEL);
            ik4.g("Canceled");
            return;
        }
        xs5Var2.getClass();
        ws5 ws5Var = xs5Var2.j;
        long j = this.b.g;
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        ws5Var.g(j, timeUnit);
        xs5 xs5Var3 = this.d;
        xs5Var3.getClass();
        xs5Var3.k.g(this.b.h, timeUnit);
    }

    @Override // defpackage.b44
    public final void c() {
        xs5 xs5Var = this.d;
        xs5Var.getClass();
        xs5Var.i.close();
    }

    @Override // defpackage.b44
    public final void cancel() {
        this.f = true;
        xs5 xs5Var = this.d;
        if (xs5Var != null) {
            xs5Var.f(b14.CANCEL);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0019  */
    @Override // defpackage.b44
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean d() {
        /*
            r4 = this;
            xs5 r4 = r4.d
            r0 = 0
            if (r4 == 0) goto L20
            monitor-enter(r4)
            vs5 r1 = r4.h     // Catch: java.lang.Throwable -> L17
            boolean r2 = r1.b     // Catch: java.lang.Throwable -> L17
            r3 = 1
            if (r2 == 0) goto L19
            kz0 r1 = r1.d     // Catch: java.lang.Throwable -> L17
            boolean r1 = r1.H()     // Catch: java.lang.Throwable -> L17
            if (r1 == 0) goto L19
            r1 = r3
            goto L1a
        L17:
            r0 = move-exception
            goto L1e
        L19:
            r1 = r0
        L1a:
            monitor-exit(r4)
            if (r1 != r3) goto L20
            return r3
        L1e:
            monitor-exit(r4)
            throw r0
        L20:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rs5.d():boolean");
    }

    @Override // defpackage.b44
    public final long e(adb adbVar) {
        if (bt5.a(adbVar)) {
            return ggf.e(adbVar);
        }
        return 0L;
    }

    @Override // defpackage.b44
    public final bfc f(kbb kbbVar, long j) {
        kbbVar.getClass();
        xs5 xs5Var = this.d;
        xs5Var.getClass();
        return xs5Var.i;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x002d  */
    @Override // defpackage.b44
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.ycb g(boolean r11) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 263
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rs5.g(boolean):ycb");
    }

    @Override // defpackage.b44
    public final void h() {
        this.c.flush();
    }

    @Override // defpackage.b44
    public final xjc i() {
        xs5 xs5Var = this.d;
        xs5Var.getClass();
        return xs5Var;
    }

    @Override // defpackage.b44
    public final a44 j() {
        return this.a;
    }
}
