package defpackage;

import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wb8 {
    public static final ot0 b = new ot0(2, false);
    public static final ot0 c = new ot0(4, false);
    public static final nt0 d = new nt0(4, true);
    public static final nt0 e = new nt0(5, true);
    public static final ot0 f = new ot0(3, false);
    public static final nt0 g = new nt0(6, true);
    public static final nt0 h = new nt0(7, true);
    public static final ot0 i = new ot0(1, false);
    public static final nt0 j = new nt0(2, true);
    public static final nt0 k = new nt0(3, true);
    public static final ot0 l = new ot0(0, false);
    public static final nt0 m = new nt0(0, true);
    public static final nt0 n = new nt0(1, true);
    public static final ot0 o = new ot0(5, true);
    public static final nt0 p = new nt0(8, true);
    public static final nt0 q = new nt0(9, true);
    public final boolean a;

    public wb8(boolean z) {
        this.a = z;
    }

    public abstract Object a(String str, Bundle bundle);

    public abstract String b();

    public abstract Object c(String str);

    public Object d(String str, Object obj) {
        return c(str);
    }

    public abstract void e(Bundle bundle, String str, Object obj);

    public String f(Object obj) {
        return String.valueOf(obj);
    }

    public final String toString() {
        return b();
    }
}
