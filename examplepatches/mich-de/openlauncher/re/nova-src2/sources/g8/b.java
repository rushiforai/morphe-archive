package g8;

import android.view.animation.Animation;
import android.view.animation.Transformation;

/* loaded from: classes2.dex */
public final class b extends Animation {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e f57200a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f f57201b;

    public b(f fVar, e eVar) {
        this.f57201b = fVar;
        this.f57200a = eVar;
    }

    @Override // android.view.animation.Animation
    public final void applyTransformation(float f11, Transformation transformation) {
        e eVar = this.f57200a;
        float radians = (float) Math.toRadians(eVar.f57211g / (eVar.o * 6.283185307179586d));
        float f12 = eVar.f57216l;
        float f13 = eVar.f57215k;
        float f14 = eVar.f57217m;
        eVar.f57209e = (f.f57222m.getInterpolation(f11) * (0.8f - radians)) + f12;
        eVar.a();
        eVar.f57208d = (f.f57221l.getInterpolation(f11) * 0.8f) + f13;
        eVar.a();
        eVar.f57210f = (0.25f * f11) + f14;
        eVar.a();
        f fVar = this.f57201b;
        fVar.f57225c = ((fVar.f57229g / 5.0f) * 720.0f) + (f11 * 144.0f);
        fVar.invalidateSelf();
    }
}
