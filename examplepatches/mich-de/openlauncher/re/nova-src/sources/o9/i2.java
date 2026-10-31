package o9;

import android.view.animation.Interpolator;

/* loaded from: classes.dex */
public final class i2 extends c0.g2 {

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f79885f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i2(int i5, Interpolator interpolator) {
        super(interpolator);
        this.f79885f = i5;
    }

    @Override // c0.g2
    public final float d(int i5) {
        switch (this.f79885f) {
            case 0:
                return 1.0f;
            default:
                return 0.0f;
        }
    }
}
