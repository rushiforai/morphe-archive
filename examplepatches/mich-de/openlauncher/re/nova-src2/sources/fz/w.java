package fz;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;

/* loaded from: classes.dex */
public final class w extends Drawable.ConstantState {

    /* renamed from: a, reason: collision with root package name */
    public fa.t[] f56376a;

    /* renamed from: b, reason: collision with root package name */
    public int f56377b;

    /* renamed from: c, reason: collision with root package name */
    public int f56378c;

    /* renamed from: d, reason: collision with root package name */
    public int f56379d;

    /* renamed from: e, reason: collision with root package name */
    public int f56380e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f56381f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f56382g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f56383h;

    /* renamed from: i, reason: collision with root package name */
    public d f56384i;

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final boolean canApplyTheme() {
        if (super.canApplyTheme()) {
            return true;
        }
        fa.t[] tVarArr = this.f56376a;
        for (int i5 = 0; i5 < 2; i5++) {
            fa.t tVar = tVarArr[i5];
            tVar.getClass();
            Drawable drawable = (Drawable) tVar.f54486b;
            if (drawable != null && drawable.canApplyTheme()) {
                return true;
            }
        }
        return false;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final int getChangingConfigurations() {
        return this.f56379d | this.f56380e;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable() {
        return new com.teslacoilsw.launcher.icon.a(this, (Resources) null, this.f56384i);
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable(Resources resources) {
        return new com.teslacoilsw.launcher.icon.a(this, resources, this.f56384i);
    }
}
