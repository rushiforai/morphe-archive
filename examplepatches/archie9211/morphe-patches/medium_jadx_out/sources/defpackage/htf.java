package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class htf {
    public static final boolean b = avf.d;
    public ujf a;

    public static int o(int i, hsf hsfVar) {
        int iV = v(i << 3);
        int iE = hsfVar.e();
        return wgd.z(iE, iE, iV);
    }

    public static int t(long j) {
        return (640 - (Long.numberOfLeadingZeros(j) * 9)) >>> 6;
    }

    public static int u(int i) {
        return v(i << 3);
    }

    public static int v(int i) {
        return (352 - (Integer.numberOfLeadingZeros(i) * 9)) >>> 6;
    }

    public abstract int a();

    public abstract void b(byte b2);

    public abstract void c(int i);

    public abstract void d(int i, int i2);

    public abstract void e(int i, long j);

    public abstract void f(int i, String str);

    public abstract void g(int i, hsf hsfVar);

    public abstract void h(int i, boolean z);

    public abstract void i(long j);

    public abstract void j(byte[] bArr, int i, int i2);

    public abstract void k(int i);

    public abstract void l(int i, int i2);

    public abstract void m(int i, long j);

    public abstract void n(long j);

    public final void p() {
        if (a() > 0) {
            ygf.f("Did not write as much data as expected.");
        } else {
            if (a() >= 0) {
                return;
            }
            ygf.f("Wrote more data than expected.");
        }
    }

    public abstract void q(int i);

    public abstract void r(int i, int i2);

    public abstract void s(int i, int i2);
}
