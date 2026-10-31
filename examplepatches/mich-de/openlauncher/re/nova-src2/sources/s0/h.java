package s0;

/* loaded from: classes.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final g f86511a = a(50);

    public static final g a(int i5) {
        f fVar = new f(i5);
        return new g(fVar, fVar, fVar, fVar);
    }

    public static final g b(int i5, int i11, int i12, int i13) {
        return new g(new f(i5), new f(i11), new f(i12), new f(i13));
    }

    public static final g c(float f11) {
        e eVar = new e(f11);
        return new g(eVar, eVar, eVar, eVar);
    }

    public static final g d(float f11, float f12, float f13, float f14) {
        return new g(new e(f11), new e(f12), new e(f13), new e(f14));
    }

    public static g e(float f11, float f12, float f13, float f14, int i5) {
        if ((i5 & 1) != 0) {
            f11 = 0;
        }
        if ((i5 & 2) != 0) {
            f12 = 0;
        }
        if ((i5 & 4) != 0) {
            f13 = 0;
        }
        if ((i5 & 8) != 0) {
            f14 = 0;
        }
        return d(f11, f12, f13, f14);
    }
}
