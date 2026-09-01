package defpackage;

import android.graphics.Canvas;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.AnimatedImageDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hm3 extends c09 implements p3b {
    public final Drawable f;
    public final k49 g;
    public final k49 h;
    public final w5d i;

    public hm3(Drawable drawable) {
        long jFloatToRawIntBits;
        drawable.getClass();
        this.f = drawable;
        this.g = qo7.u(0);
        vq6 vq6Var = im3.a;
        if (drawable.getIntrinsicWidth() < 0 || drawable.getIntrinsicHeight() < 0) {
            jFloatToRawIntBits = 9205357640488583168L;
        } else {
            float intrinsicWidth = drawable.getIntrinsicWidth();
            jFloatToRawIntBits = (((long) Float.floatToRawIntBits(drawable.getIntrinsicHeight())) & 4294967295L) | (Float.floatToRawIntBits(intrinsicWidth) << 32);
        }
        this.h = qo7.u(new dfc(jFloatToRawIntBits));
        this.i = new w5d(new nh2(15, this));
        if (drawable.getIntrinsicWidth() < 0 || drawable.getIntrinsicHeight() < 0) {
            return;
        }
        drawable.setBounds(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
    }

    @Override // defpackage.c09
    public final boolean a(float f) {
        this.f.setAlpha(iq7.v(nk7.w0(f * 255.0f), 0, 255));
        return true;
    }

    @Override // defpackage.p3b
    public final void b() {
        c();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.p3b
    public final void c() {
        Drawable drawable = this.f;
        if (drawable instanceof Animatable) {
            ((Animatable) drawable).stop();
        }
        drawable.setVisible(false, false);
        drawable.setCallback(null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.p3b
    public final void d() {
        Drawable.Callback callback = (Drawable.Callback) this.i.getValue();
        Drawable drawable = this.f;
        drawable.setCallback(callback);
        drawable.setVisible(true, true);
        if (drawable instanceof Animatable) {
            ((Animatable) drawable).start();
        }
    }

    @Override // defpackage.c09
    public final boolean e(bs0 bs0Var) {
        this.f.setColorFilter(bs0Var != null ? bs0Var.a : null);
        return true;
    }

    @Override // defpackage.c09
    public final void f(ip6 ip6Var) {
        ip6Var.getClass();
        int i = gm3.a[ip6Var.ordinal()];
        int i2 = 1;
        if (i == 1) {
            i2 = 0;
        } else if (i != 2) {
            ygf.a();
            return;
        }
        this.f.setLayoutDirection(i2);
    }

    @Override // defpackage.c09
    public final long h() {
        return ((dfc) this.h.getValue()).a;
    }

    @Override // defpackage.c09
    public final void i(zl3 zl3Var) {
        e61 e61VarX = zl3Var.b0().x();
        ((Number) this.g.getValue()).intValue();
        try {
            e61VarX.h();
            int i = Build.VERSION.SDK_INT;
            Drawable drawable = this.f;
            if (i < 28 || i >= 31 || !(drawable instanceof AnimatedImageDrawable)) {
                drawable.setBounds(0, 0, nk7.w0(dfc.d(zl3Var.f())), nk7.w0(dfc.b(zl3Var.f())));
            } else {
                e61VarX.b(dfc.d(zl3Var.f()) / dfc.d(h()), dfc.b(zl3Var.f()) / dfc.b(h()));
            }
            Canvas canvas = qm.a;
            drawable.draw(((pm) e61VarX).a);
            e61VarX.q();
        } catch (Throwable th) {
            e61VarX.q();
            throw th;
        }
    }
}
