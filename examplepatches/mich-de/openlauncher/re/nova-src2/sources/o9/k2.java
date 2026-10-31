package o9;

import android.view.animation.Interpolator;

/* loaded from: classes2.dex */
public final class k2 extends c0.g2 {

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f79942f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k2(int i5, Interpolator interpolator) {
        super(interpolator);
        this.f79942f = i5;
    }

    @Override // c0.g2
    public final float d(int i5) {
        return i5 != this.f79942f ? 0.0f : 1.0f;
    }
}
