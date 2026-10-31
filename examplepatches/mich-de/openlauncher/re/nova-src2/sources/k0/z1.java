package k0;

import androidx.compose.foundation.layout.LayoutWeightElement;
import androidx.compose.foundation.layout.VerticalAlignElement;
import androidx.compose.foundation.layout.WithAlignmentLineElement;

/* loaded from: classes.dex */
public final class z1 implements y1 {

    /* renamed from: a, reason: collision with root package name */
    public static final z1 f70784a = new z1();

    @Override // k0.y1
    public final b2.t b(b2.t tVar, float f11, boolean z11) {
        if (f11 <= 0.0d) {
            l0.a.a("invalid weight; must be greater than zero");
        }
        if (f11 > Float.MAX_VALUE) {
            f11 = Float.MAX_VALUE;
        }
        return tVar.then(new LayoutWeightElement(f11, z11));
    }

    @Override // k0.y1
    public final b2.t c() {
        return new VerticalAlignElement();
    }

    @Override // k0.y1
    public final b2.t d(b2.t tVar) {
        return tVar.then(new WithAlignmentLineElement(z2.c.f98028a));
    }
}
