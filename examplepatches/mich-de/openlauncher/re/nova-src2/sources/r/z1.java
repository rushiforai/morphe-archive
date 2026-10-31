package r;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public final class z1 {

    /* renamed from: g, reason: collision with root package name */
    public static z1 f84924g;

    /* renamed from: a, reason: collision with root package name */
    public WeakHashMap f84926a;

    /* renamed from: b, reason: collision with root package name */
    public final WeakHashMap f84927b = new WeakHashMap(0);

    /* renamed from: c, reason: collision with root package name */
    public TypedValue f84928c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f84929d;

    /* renamed from: e, reason: collision with root package name */
    public bn.i f84930e;

    /* renamed from: f, reason: collision with root package name */
    public static final PorterDuff.Mode f84923f = PorterDuff.Mode.SRC_IN;

    /* renamed from: h, reason: collision with root package name */
    public static final y1 f84925h = new y1(6);

    public static synchronized z1 b() {
        try {
            if (f84924g == null) {
                f84924g = new z1();
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return f84924g;
    }

    public static synchronized PorterDuffColorFilter f(int i5, PorterDuff.Mode mode) {
        PorterDuffColorFilter porterDuffColorFilter;
        y1 y1Var = f84925h;
        y1Var.getClass();
        int i11 = (31 + i5) * 31;
        porterDuffColorFilter = (PorterDuffColorFilter) y1Var.c(Integer.valueOf(mode.hashCode() + i11));
        if (porterDuffColorFilter == null) {
            porterDuffColorFilter = new PorterDuffColorFilter(i5, mode);
        }
        return porterDuffColorFilter;
    }

    public final synchronized void a(Context context, long j11, Drawable drawable) {
        try {
            Drawable.ConstantState constantState = drawable.getConstantState();
            if (constantState != null) {
                z.v vVar = (z.v) this.f84927b.get(context);
                if (vVar == null) {
                    vVar = new z.v((Object) null);
                    this.f84927b.put(context, vVar);
                }
                vVar.e(j11, new WeakReference(constantState));
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized Drawable c(Context context, long j11) {
        z.v vVar = (z.v) this.f84927b.get(context);
        if (vVar == null) {
            return null;
        }
        WeakReference weakReference = (WeakReference) vVar.c(j11);
        if (weakReference != null) {
            Drawable.ConstantState constantState = (Drawable.ConstantState) weakReference.get();
            if (constantState != null) {
                return constantState.newDrawable(context.getResources());
            }
            vVar.f(j11);
        }
        return null;
    }

    public final synchronized Drawable d(Context context, int i5) {
        return e(false, context, i5);
    }

    public final synchronized Drawable e(boolean z11, Context context, int i5) {
        Drawable drawableC;
        bn.i iVar;
        try {
            if (!this.f84929d) {
                this.f84929d = true;
                Drawable drawableD = d(context, 2131230986);
                if (drawableD == null || (!(drawableD instanceof j7.o) && !"android.graphics.drawable.VectorDrawable".equals(drawableD.getClass().getName()))) {
                    this.f84929d = false;
                    throw new IllegalStateException("This app has been built with an incorrect configuration. Please configure your build for VectorDrawableCompat.");
                }
            }
            if (this.f84928c == null) {
                this.f84928c = new TypedValue();
            }
            TypedValue typedValue = this.f84928c;
            context.getResources().getValue(i5, typedValue, true);
            long j11 = (typedValue.assetCookie << 32) | typedValue.data;
            drawableC = c(context, j11);
            Drawable drawable = null;
            PorterDuff.Mode modeV = null;
            if (drawableC == null) {
                drawableC = this.f84930e == null ? null : bn.i.o(this, context, i5);
                if (drawableC != null) {
                    drawableC.setChangingConfigurations(typedValue.changingConfigurations);
                    a(context, j11, drawableC);
                }
            }
            if (drawableC == null) {
                drawableC = context.getDrawable(i5);
            }
            if (drawableC != null) {
                ColorStateList colorStateListG = g(context, i5);
                if (colorStateListG != null) {
                    Drawable drawableMutate = drawableC.mutate();
                    ps.e0.B(drawableMutate, colorStateListG);
                    if (this.f84930e != null) {
                        modeV = bn.i.v(i5);
                    }
                    if (modeV != null) {
                        ps.e0.C(drawableMutate, modeV);
                    }
                    drawable = drawableMutate;
                } else if ((this.f84930e != null && bn.i.A(context, drawableC, i5)) || (((iVar = this.f84930e) != null && iVar.B(context, drawableC, i5)) || !z11)) {
                    drawable = drawableC;
                }
                drawableC = drawable;
            }
            if (drawableC != null) {
                a1.a(drawableC);
            }
        } finally {
        }
        return drawableC;
    }

    public final synchronized ColorStateList g(Context context, int i5) {
        ColorStateList colorStateList;
        z.d1 d1Var;
        WeakHashMap weakHashMap = this.f84926a;
        ColorStateList colorStateListU = null;
        colorStateList = (weakHashMap == null || (d1Var = (z.d1) weakHashMap.get(context)) == null) ? null : (ColorStateList) z.e1.b(d1Var, i5);
        if (colorStateList == null) {
            bn.i iVar = this.f84930e;
            if (iVar != null) {
                colorStateListU = iVar.u(context, i5);
            }
            if (colorStateListU != null) {
                if (this.f84926a == null) {
                    this.f84926a = new WeakHashMap();
                }
                z.d1 d1Var2 = (z.d1) this.f84926a.get(context);
                if (d1Var2 == null) {
                    d1Var2 = new z.d1(0);
                    this.f84926a.put(context, d1Var2);
                }
                d1Var2.a(i5, colorStateListU);
            }
            colorStateList = colorStateListU;
        }
        return colorStateList;
    }
}
