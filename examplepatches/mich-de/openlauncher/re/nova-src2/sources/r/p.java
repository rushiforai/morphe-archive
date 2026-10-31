package r;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;

/* loaded from: classes2.dex */
public final class p {

    /* renamed from: b, reason: collision with root package name */
    public static final PorterDuff.Mode f84832b = PorterDuff.Mode.SRC_IN;

    /* renamed from: c, reason: collision with root package name */
    public static p f84833c;

    /* renamed from: a, reason: collision with root package name */
    public z1 f84834a;

    public static synchronized p a() {
        try {
            if (f84833c == null) {
                e();
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return f84833c;
    }

    public static synchronized PorterDuffColorFilter d(int i5, PorterDuff.Mode mode) {
        return z1.f(i5, mode);
    }

    public static synchronized void e() {
        if (f84833c == null) {
            p pVar = new p();
            f84833c = pVar;
            pVar.f84834a = z1.b();
            z1 z1Var = f84833c.f84834a;
            bn.i iVar = new bn.i();
            iVar.f18209a = new int[]{2131230984, 2131230982, 2131230906};
            iVar.f18210b = new int[]{2131230931, 2131230966, 2131230938, 2131230933, 2131230934, 2131230937, 2131230936};
            iVar.f18211c = new int[]{2131230981, 2131230983, 2131230923, 2131230977, 2131230978, 2131230979, 2131230980};
            iVar.f18212d = new int[]{2131230956, 2131230921, 2131230955};
            iVar.f18213e = new int[]{2131230975, 2131230985};
            iVar.f18214f = new int[]{2131230909, 2131230915, 2131230910, 2131230916};
            synchronized (z1Var) {
                z1Var.f84930e = iVar;
            }
        }
    }

    public static void f(Drawable drawable, p6.g gVar, int[] iArr) {
        PorterDuff.Mode mode = z1.f84923f;
        int[] state = drawable.getState();
        if (drawable.mutate() == drawable) {
            if ((drawable instanceof LayerDrawable) && drawable.isStateful()) {
                drawable.setState(new int[0]);
                drawable.setState(state);
            }
            boolean z11 = gVar.f82167b;
            if (!z11 && !gVar.f82166a) {
                drawable.clearColorFilter();
                return;
            }
            PorterDuffColorFilter porterDuffColorFilterF = null;
            ColorStateList colorStateList = z11 ? (ColorStateList) gVar.f82168c : null;
            PorterDuff.Mode mode2 = gVar.f82166a ? (PorterDuff.Mode) gVar.f82169d : z1.f84923f;
            if (colorStateList != null && mode2 != null) {
                porterDuffColorFilterF = z1.f(colorStateList.getColorForState(iArr, 0), mode2);
            }
            drawable.setColorFilter(porterDuffColorFilterF);
        }
    }

    public final synchronized Drawable b(Context context, int i5) {
        return this.f84834a.d(context, i5);
    }

    public final synchronized Drawable c(Context context, int i5) {
        return this.f84834a.e(true, context, i5);
    }
}
