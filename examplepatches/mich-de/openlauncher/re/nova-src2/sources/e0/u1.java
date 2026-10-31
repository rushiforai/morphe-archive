package e0;

import android.view.View;
import android.widget.Magnifier;
import kotlin.math.MathKt;

/* loaded from: classes2.dex */
public final class u1 implements q1 {

    /* renamed from: a, reason: collision with root package name */
    public static final u1 f50143a = new u1();

    @Override // e0.q1
    public final p1 a(View view, boolean z11, long j11, float f11, float f12, boolean z12, y3.c cVar, float f13) {
        if (z11) {
            return new t1(new Magnifier(view));
        }
        long jMo103toSizeXkaWNTQ = cVar.mo103toSizeXkaWNTQ(j11);
        float fMo102toPx0680j_4 = cVar.mo102toPx0680j_4(f11);
        float fMo102toPx0680j_42 = cVar.mo102toPx0680j_4(f12);
        Magnifier.Builder builder = new Magnifier.Builder(view);
        if (jMo103toSizeXkaWNTQ != 9205357640488583168L) {
            builder.setSize(MathKt.b(Float.intBitsToFloat((int) (jMo103toSizeXkaWNTQ >> 32))), MathKt.b(Float.intBitsToFloat((int) (jMo103toSizeXkaWNTQ & 4294967295L))));
        }
        if (!Float.isNaN(fMo102toPx0680j_4)) {
            builder.setCornerRadius(fMo102toPx0680j_4);
        }
        if (!Float.isNaN(fMo102toPx0680j_42)) {
            builder.setElevation(fMo102toPx0680j_42);
        }
        if (!Float.isNaN(f13)) {
            builder.setInitialZoom(f13);
        }
        builder.setClippingEnabled(z12);
        return new t1(builder.build());
    }

    @Override // e0.q1
    public final boolean b() {
        return true;
    }
}
