package x3;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: b, reason: collision with root package name */
    public static final float f95008b;

    /* renamed from: c, reason: collision with root package name */
    public static final float f95009c;

    /* renamed from: d, reason: collision with root package name */
    public static final float f95010d;

    /* renamed from: a, reason: collision with root package name */
    public final float f95011a;

    static {
        a(0.0f);
        a(0.5f);
        f95008b = 0.5f;
        a(-1.0f);
        f95009c = -1.0f;
        a(1.0f);
        f95010d = 1.0f;
    }

    public static void a(float f11) {
        if ((0.0f > f11 || f11 > 1.0f) && f11 != -1.0f) {
            s3.a.c("topRatio should be in [0..1] range or -1");
        }
    }

    public static String b(float f11) {
        if (f11 == 0.0f) {
            return "LineHeightStyle.Alignment.Top";
        }
        if (f11 == f95008b) {
            return "LineHeightStyle.Alignment.Center";
        }
        if (f11 == f95009c) {
            return "LineHeightStyle.Alignment.Proportional";
        }
        if (f11 == f95010d) {
            return "LineHeightStyle.Alignment.Bottom";
        }
        return "LineHeightStyle.Alignment(topPercentage = " + f11 + ')';
    }

    public final boolean equals(Object obj) {
        if (obj instanceof f) {
            return Float.compare(this.f95011a, ((f) obj).f95011a) == 0;
        }
        return false;
    }

    public final int hashCode() {
        return Float.hashCode(this.f95011a);
    }

    public final String toString() {
        return b(this.f95011a);
    }
}
