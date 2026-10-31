package a5;

import android.view.WindowInsetsAnimation;

/* loaded from: classes.dex */
public final class r1 extends s1 {

    /* renamed from: e, reason: collision with root package name */
    public final WindowInsetsAnimation f359e;

    public r1(WindowInsetsAnimation windowInsetsAnimation) {
        super(0, null, 0L);
        this.f359e = windowInsetsAnimation;
    }

    @Override // a5.s1
    public final long a() {
        return this.f359e.getDurationMillis();
    }

    @Override // a5.s1
    public final float b() {
        return this.f359e.getInterpolatedFraction();
    }

    @Override // a5.s1
    public final int c() {
        return this.f359e.getTypeMask();
    }

    @Override // a5.s1
    public final void d(float f11) {
        this.f359e.setFraction(f11);
    }
}
