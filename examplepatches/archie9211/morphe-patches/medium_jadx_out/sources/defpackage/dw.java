package defpackage;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dw extends Drawable.ConstantState {
    public final Drawable.ConstantState a;

    public dw(Drawable.ConstantState constantState) {
        this.a = constantState;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final boolean canApplyTheme() {
        return this.a.canApplyTheme();
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final int getChangingConfigurations() {
        return this.a.getChangingConfigurations();
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable() {
        fw fwVar = new fw(null, 0);
        Drawable drawableNewDrawable = this.a.newDrawable();
        fwVar.a = drawableNewDrawable;
        drawableNewDrawable.setCallback(fwVar.f);
        return fwVar;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable(Resources resources) {
        fw fwVar = new fw(null, 0);
        Drawable drawableNewDrawable = this.a.newDrawable(resources);
        fwVar.a = drawableNewDrawable;
        drawableNewDrawable.setCallback(fwVar.f);
        return fwVar;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable(Resources resources, Resources.Theme theme) {
        fw fwVar = new fw(null, 0);
        Drawable drawableNewDrawable = this.a.newDrawable(resources, theme);
        fwVar.a = drawableNewDrawable;
        drawableNewDrawable.setCallback(fwVar.f);
        return fwVar;
    }
}
