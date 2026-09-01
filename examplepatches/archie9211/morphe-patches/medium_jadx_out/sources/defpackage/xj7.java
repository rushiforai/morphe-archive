package defpackage;

import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xj7 extends nu {
    public final /* synthetic */ zj7 b;

    public xj7(zj7 zj7Var) {
        this.b = zj7Var;
    }

    @Override // defpackage.nu
    public final void a(Drawable drawable) {
        ColorStateList colorStateList = this.b.o;
        if (colorStateList != null) {
            drawable.setTintList(colorStateList);
        }
    }

    @Override // defpackage.nu
    public final void b(Drawable drawable) {
        zj7 zj7Var = this.b;
        ColorStateList colorStateList = zj7Var.o;
        if (colorStateList != null) {
            drawable.setTint(colorStateList.getColorForState(zj7Var.s, colorStateList.getDefaultColor()));
        }
    }
}
