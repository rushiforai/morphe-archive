package l30;

import android.graphics.drawable.Drawable;

/* loaded from: classes.dex */
public final class q extends d8.a {

    /* renamed from: d, reason: collision with root package name */
    public boolean f74675d;

    public q(Drawable drawable) {
        super(drawable);
        this.f74675d = false;
        setBounds(drawable.getBounds());
    }

    @Override // d8.a, android.graphics.drawable.Drawable
    public final boolean isStateful() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean setState(int[] iArr) {
        boolean z11 = this.f74675d;
        boolean z12 = false;
        for (int i5 : iArr) {
            if (i5 == 16842919 || i5 == 16842908) {
                z12 = true;
            }
        }
        if (z12 != z11) {
            this.f74675d = z12;
            if (z12) {
                setAlpha(149);
            } else {
                setAlpha(255);
            }
        }
        return super.setState(iArr) || z11 != z12;
    }
}
