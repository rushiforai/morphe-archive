package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ycb {
    public kbb a;
    public c8a b;
    public String d;
    public ji5 e;
    public xjc h;
    public adb i;
    public adb j;
    public adb k;
    public long l;
    public long m;
    public zf3 n;
    public int c = -1;
    public fdb g = fdb.b;
    public erd o = erd.i0;
    public ru f = new ru(3);

    public static void b(String str, adb adbVar) {
        if (adbVar != null) {
            if (adbVar.i != null) {
                ywb.g(str.concat(".networkResponse != null"));
            } else if (adbVar.j != null) {
                ywb.g(str.concat(".cacheResponse != null"));
            } else {
                if (adbVar.k == null) {
                    return;
                }
                ywb.g(str.concat(".priorResponse != null"));
            }
        }
    }

    public final adb a() {
        int i = this.c;
        if (i < 0) {
            lg8.s(this.c, "code < 0: ");
            return null;
        }
        kbb kbbVar = this.a;
        if (kbbVar == null) {
            ygf.f("request == null");
            return null;
        }
        c8a c8aVar = this.b;
        if (c8aVar == null) {
            ygf.f("protocol == null");
            return null;
        }
        String str = this.d;
        if (str == null) {
            ygf.f("message == null");
            return null;
        }
        ji5 ji5Var = this.e;
        ru ruVar = this.f;
        ruVar.getClass();
        return new adb(kbbVar, c8aVar, str, i, ji5Var, iq7.C(ruVar), this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o);
    }
}
