package g0;

import androidx.compose.foundation.gestures.FlingCancellationException;

/* loaded from: classes2.dex */
public final class d2 implements n1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h2 f56496a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f2 f56497b;

    public d2(h2 h2Var, f2 f2Var) {
        this.f56496a = h2Var;
        this.f56497b = f2Var;
    }

    @Override // g0.n1
    public final float a(float f11) {
        h2 h2Var = this.f56496a;
        boolean zBooleanValue = ((Boolean) h2Var.f56564h.invoke()).booleanValue();
        if (Math.abs(f11) != 0.0f && !zBooleanValue) {
            throw new FlingCancellationException();
        }
        return h2Var.d(h2Var.g(this.f56497b.a(2, h2Var.e(h2Var.h(f11)))));
    }
}
