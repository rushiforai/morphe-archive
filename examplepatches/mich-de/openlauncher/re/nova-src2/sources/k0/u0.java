package k0;

import androidx.compose.foundation.layout.LayoutWeightElement;
import androidx.compose.foundation.layout.VerticalAlignElement;
import androidx.compose.foundation.layout.WithAlignmentLineElement;

/* loaded from: classes2.dex */
public final class u0 implements y1 {

    /* renamed from: a, reason: collision with root package name */
    public static final u0 f70753a = new u0();

    @Override // k0.y1
    public final b2.t b(b2.t tVar, float f11, boolean z11) {
        if (f11 <= 0.0d) {
            l0.a.a("invalid weight; must be greater than zero");
        }
        if (f11 > Float.MAX_VALUE) {
            f11 = Float.MAX_VALUE;
        }
        return tVar.then(new LayoutWeightElement(f11, true));
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
