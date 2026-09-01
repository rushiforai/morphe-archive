package defpackage;

import android.content.res.ColorStateList;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bk7 extends Drawable.ConstantState {
    public n3c a;
    public float j;
    public ColorStateList c = null;
    public ColorStateList d = null;
    public ColorStateList e = null;
    public PorterDuff.Mode f = PorterDuff.Mode.SRC_IN;
    public Rect g = null;
    public float h = 1.0f;
    public float i = 1.0f;
    public int k = 255;
    public float l = 0.0f;
    public float m = 0.0f;
    public int n = 0;
    public int o = 0;
    public Paint.Style p = Paint.Style.FILL_AND_STROKE;
    public ow3 b = null;

    public bk7(n3c n3cVar) {
        this.a = n3cVar;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final int getChangingConfigurations() {
        return 0;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable() {
        dk7 dk7Var = new dk7(this);
        dk7Var.f = true;
        dk7Var.g = true;
        return dk7Var;
    }
}
