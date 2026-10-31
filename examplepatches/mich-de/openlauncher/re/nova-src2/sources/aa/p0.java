package aa;

import android.graphics.drawable.Drawable;
import com.android.launcher3.icons.ThemedIconDrawable$ThemedBitmapInfo;

/* loaded from: classes2.dex */
public final class p0 extends m {

    /* renamed from: d, reason: collision with root package name */
    public final ThemedIconDrawable$ThemedBitmapInfo f640d;

    /* renamed from: e, reason: collision with root package name */
    public final int f641e;

    /* renamed from: f, reason: collision with root package name */
    public final int f642f;

    public p0(ThemedIconDrawable$ThemedBitmapInfo themedIconDrawable$ThemedBitmapInfo, int i5, int i11, boolean z11) {
        super(themedIconDrawable$ThemedBitmapInfo.f21151a, themedIconDrawable$ThemedBitmapInfo.f21152b, z11);
        this.f640d = themedIconDrawable$ThemedBitmapInfo;
        this.f642f = i5;
        this.f641e = i11;
    }

    @Override // aa.m
    /* renamed from: a */
    public final n newDrawable() {
        return new q0(this);
    }

    @Override // aa.m, android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable() {
        return new q0(this);
    }
}
