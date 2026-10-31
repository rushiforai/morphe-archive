package nx;

import android.graphics.PorterDuff;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.Drawable;
import f10.t;
import mx.c0;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final String f78646a;

    /* renamed from: b, reason: collision with root package name */
    public final Drawable f78647b;

    /* renamed from: c, reason: collision with root package name */
    public final c0 f78648c;

    /* renamed from: d, reason: collision with root package name */
    public final int f78649d;

    public m(t tVar, c0 c0Var) {
        this.f78646a = tVar.getString(c0Var.f77040a);
        int iA = c0Var.a();
        this.f78649d = iA;
        if (iA == -1) {
            this.f78647b = null;
        } else if (c0Var != c0.NOVA_SETTINGS) {
            Drawable drawable = tVar.getDrawable(iA);
            this.f78647b = drawable;
            if (drawable instanceof AdaptiveIconDrawable) {
                AdaptiveIconDrawable adaptiveIconDrawable = (AdaptiveIconDrawable) drawable;
                adaptiveIconDrawable.getBackground().mutate().setTint(-13619152);
                adaptiveIconDrawable.getForeground().mutate().setTint(-1);
            } else {
                drawable.setColorFilter(aa.p.b(tVar, 2130968934), PorterDuff.Mode.MULTIPLY);
            }
        } else {
            tVar.getResources();
            this.f78647b = tVar.getDrawable(iA);
        }
        this.f78648c = c0Var;
    }
}
