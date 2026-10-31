package p6;

import android.os.Bundle;

/* loaded from: classes2.dex */
public abstract class x0 {

    /* renamed from: b, reason: collision with root package name */
    public static final r0 f82286b;

    /* renamed from: c, reason: collision with root package name */
    public static final q0 f82287c;

    /* renamed from: d, reason: collision with root package name */
    public static final r0 f82288d;

    /* renamed from: e, reason: collision with root package name */
    public static final q0 f82289e;

    /* renamed from: f, reason: collision with root package name */
    public static final r0 f82290f;

    /* renamed from: g, reason: collision with root package name */
    public static final q0 f82291g;

    /* renamed from: h, reason: collision with root package name */
    public static final r0 f82292h;

    /* renamed from: i, reason: collision with root package name */
    public static final q0 f82293i;

    /* renamed from: j, reason: collision with root package name */
    public static final r0 f82294j;

    /* renamed from: k, reason: collision with root package name */
    public static final q0 f82295k;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f82296a;

    static {
        int i5 = 2;
        boolean z11 = false;
        f82286b = new r0(z11, i5);
        boolean z12 = true;
        f82287c = new q0(z12, i5);
        int i11 = 3;
        f82288d = new r0(z11, i11);
        f82289e = new q0(z12, i11);
        int i12 = 1;
        f82290f = new r0(z11, i12);
        f82291g = new q0(z12, i12);
        int i13 = 0;
        f82292h = new r0(z11, i13);
        f82293i = new q0(z12, i13);
        int i14 = 4;
        f82294j = new r0(z12, i14);
        f82295k = new q0(z12, i14);
    }

    public x0(boolean z11) {
        this.f82296a = z11;
    }

    public abstract Object a(String str, Bundle bundle);

    public abstract String b();

    public Object c(Object obj, String str) {
        return d(str);
    }

    public abstract Object d(String str);

    public abstract void e(Bundle bundle, String str, Object obj);

    public final String toString() {
        return b();
    }
}
