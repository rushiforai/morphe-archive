package o9;

import android.content.Context;
import android.graphics.Rect;

/* loaded from: classes.dex */
public final class i0 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f79878a;

    /* renamed from: b, reason: collision with root package name */
    public final z0 f79879b;

    /* renamed from: c, reason: collision with root package name */
    public final ya.e f79880c;

    /* renamed from: d, reason: collision with root package name */
    public ya.q0 f79881d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f79882e = false;

    /* renamed from: f, reason: collision with root package name */
    public Boolean f79883f;

    public i0(Context context, z0 z0Var, ya.e eVar) {
        this.f79878a = context;
        this.f79879b = z0Var;
        this.f79880c = eVar;
    }

    public final mx.j0 a() {
        ya.q0 q0Var = this.f79881d;
        if (q0Var == null) {
            throw new IllegalArgumentException("Window bounds not set");
        }
        Rect rect = q0Var.f97206a;
        if (this.f79883f == null) {
            ya.e eVar = this.f79880c;
            eVar.getClass();
            int iHeight = rect.height();
            int iWidth = rect.width();
            if (iWidth > iHeight) {
                iHeight = iWidth;
                iWidth = iHeight;
            }
            float f11 = iWidth;
            this.f79883f = Boolean.valueOf(((double) (((float) iHeight) / f11)) >= 1.25d && g3.f(f11, eVar.f97117d) < 720.0f);
        }
        return new mx.j0(this.f79878a, this.f79879b, this.f79880c, this.f79881d, this.f79882e, this.f79883f.booleanValue());
    }
}
