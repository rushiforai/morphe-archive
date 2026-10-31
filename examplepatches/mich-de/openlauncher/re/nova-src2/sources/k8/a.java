package k8;

import android.view.animation.Interpolator;
import jz.l;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public float f71193a;

    /* renamed from: b, reason: collision with root package name */
    public final float f71194b;

    /* renamed from: c, reason: collision with root package name */
    public final float f71195c;

    /* renamed from: d, reason: collision with root package name */
    public final float f71196d;

    /* renamed from: e, reason: collision with root package name */
    public final float f71197e;

    /* renamed from: f, reason: collision with root package name */
    public final Interpolator f71198f;

    public a(l lVar, float f11, float f12, float f13, float f14, Interpolator interpolator) {
        this.f71194b = f11;
        this.f71193a = f11;
        this.f71195c = f12;
        this.f71196d = f13;
        this.f71197e = f14;
        this.f71198f = interpolator;
        lVar.f70535a.add(this);
    }
}
