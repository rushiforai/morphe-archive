package defpackage;

import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.ImageView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fy5 implements hsd, f03, rfd {
    public boolean a;
    public final ImageView b;

    public fy5(ImageView imageView) {
        this.b = imageView;
    }

    @Override // defpackage.hsd
    public final View H() {
        return this.b;
    }

    @Override // defpackage.rfd
    public final void I(ew5 ew5Var) {
        c(ew5Var);
    }

    @Override // defpackage.hsd
    public final Drawable X() {
        return this.b.getDrawable();
    }

    public final void a() {
        Object drawable = this.b.getDrawable();
        Animatable animatable = drawable instanceof Animatable ? (Animatable) drawable : null;
        if (animatable == null) {
            return;
        }
        if (this.a) {
            animatable.start();
        } else {
            animatable.stop();
        }
    }

    @Override // defpackage.rfd
    public final void b(ew5 ew5Var) {
        c(ew5Var);
    }

    public final void c(ew5 ew5Var) {
        ImageView imageView = this.b;
        Drawable drawableX = ew5Var != null ? dm2.x(ew5Var, imageView.getResources()) : null;
        Object drawable = imageView.getDrawable();
        Animatable animatable = drawable instanceof Animatable ? (Animatable) drawable : null;
        if (animatable != null) {
            animatable.stop();
        }
        imageView.setImageDrawable(drawableX);
        a();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof fy5) && this.b.equals(((fy5) obj).b);
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.rfd
    public final void n(ew5 ew5Var) {
        c(ew5Var);
    }

    @Override // defpackage.f03
    public final void onStart(iy6 iy6Var) {
        this.a = true;
        a();
    }

    @Override // defpackage.f03
    public final void onStop(iy6 iy6Var) {
        this.a = false;
        a();
    }

    public final String toString() {
        return "ImageViewTarget(view=" + this.b + ')';
    }

    @Override // defpackage.f03
    public final void onCreate(iy6 iy6Var) {
    }

    @Override // defpackage.f03
    public final void onDestroy(iy6 iy6Var) {
    }

    @Override // defpackage.f03
    public final void onPause(iy6 iy6Var) {
    }

    @Override // defpackage.f03
    public final void onResume(iy6 iy6Var) {
    }
}
