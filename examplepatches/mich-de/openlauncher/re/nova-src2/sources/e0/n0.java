package e0;

import android.content.Context;
import android.widget.EdgeEffect;

/* loaded from: classes2.dex */
public final class n0 extends EdgeEffect {

    /* renamed from: a, reason: collision with root package name */
    public final float f50074a;

    /* renamed from: b, reason: collision with root package name */
    public float f50075b;

    public n0(Context context) {
        super(context);
        this.f50074a = v30.e.a(context).f96599a * 1;
    }

    @Override // android.widget.EdgeEffect
    public final void onAbsorb(int i5) {
        this.f50075b = 0.0f;
        super.onAbsorb(i5);
    }

    @Override // android.widget.EdgeEffect
    public final void onPull(float f11, float f12) {
        this.f50075b = 0.0f;
        super.onPull(f11, f12);
    }

    @Override // android.widget.EdgeEffect
    public final void onRelease() {
        this.f50075b = 0.0f;
        super.onRelease();
    }

    @Override // android.widget.EdgeEffect
    public final void onPull(float f11) {
        this.f50075b = 0.0f;
        super.onPull(f11);
    }
}
