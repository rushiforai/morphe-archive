package cj;

import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final LinearInterpolator f19951a = new LinearInterpolator();

    /* renamed from: b, reason: collision with root package name */
    public static final f6.a f19952b = new f6.a(1);

    /* renamed from: c, reason: collision with root package name */
    public static final f6.a f19953c = new f6.a(0);

    /* renamed from: d, reason: collision with root package name */
    public static final f6.a f19954d = new f6.a(f6.a.f54335e);

    /* renamed from: e, reason: collision with root package name */
    public static final DecelerateInterpolator f19955e = new DecelerateInterpolator();

    public static float a(float f11, float f12, float f13) {
        return a2.c.a(f12, f11, f13, f11);
    }

    public static float b(float f11, float f12, float f13, float f14, float f15) {
        return f15 <= f13 ? f11 : f15 >= f14 ? f12 : a(f11, f12, (f15 - f13) / (f14 - f13));
    }

    public static int c(float f11, int i5, int i11) {
        return Math.round(f11 * (i11 - i5)) + i5;
    }
}
