package r;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final View f84802a;

    /* renamed from: d, reason: collision with root package name */
    public p6.g f84805d;

    /* renamed from: e, reason: collision with root package name */
    public p6.g f84806e;

    /* renamed from: f, reason: collision with root package name */
    public p6.g f84807f;

    /* renamed from: c, reason: collision with root package name */
    public int f84804c = -1;

    /* renamed from: b, reason: collision with root package name */
    public final p f84803b = p.a();

    public m(View view) {
        this.f84802a = view;
    }

    public final void a() {
        View view = this.f84802a;
        Drawable background = view.getBackground();
        if (background != null) {
            if (this.f84805d != null) {
                if (this.f84807f == null) {
                    this.f84807f = new p6.g();
                }
                p6.g gVar = this.f84807f;
                gVar.f82168c = null;
                gVar.f82167b = false;
                gVar.f82169d = null;
                gVar.f82166a = false;
                WeakHashMap weakHashMap = a5.a1.f250a;
                ColorStateList colorStateListC = a5.s0.c(view);
                if (colorStateListC != null) {
                    gVar.f82167b = true;
                    gVar.f82168c = colorStateListC;
                }
                PorterDuff.Mode modeD = a5.s0.d(view);
                if (modeD != null) {
                    gVar.f82166a = true;
                    gVar.f82169d = modeD;
                }
                if (gVar.f82167b || gVar.f82166a) {
                    p.f(background, gVar, view.getDrawableState());
                    return;
                }
            }
            p6.g gVar2 = this.f84806e;
            if (gVar2 != null) {
                p.f(background, gVar2, view.getDrawableState());
                return;
            }
            p6.g gVar3 = this.f84805d;
            if (gVar3 != null) {
                p.f(background, gVar3, view.getDrawableState());
            }
        }
    }

    public final ColorStateList b() {
        p6.g gVar = this.f84806e;
        if (gVar != null) {
            return (ColorStateList) gVar.f82168c;
        }
        return null;
    }

    public final PorterDuff.Mode c() {
        p6.g gVar = this.f84806e;
        if (gVar != null) {
            return (PorterDuff.Mode) gVar.f82169d;
        }
        return null;
    }

    public final void d(AttributeSet attributeSet, int i5) {
        ColorStateList colorStateListG;
        View view = this.f84802a;
        Context context = view.getContext();
        int[] iArr = l.a.f72911z;
        x7.u uVarR = x7.u.r(context, attributeSet, iArr, i5);
        TypedArray typedArray = (TypedArray) uVarR.f95209b;
        View view2 = this.f84802a;
        a5.a1.j(view2, view2.getContext(), iArr, attributeSet, (TypedArray) uVarR.f95209b, i5);
        try {
            if (typedArray.hasValue(0)) {
                this.f84804c = typedArray.getResourceId(0, -1);
                p pVar = this.f84803b;
                Context context2 = view.getContext();
                int i11 = this.f84804c;
                synchronized (pVar) {
                    colorStateListG = pVar.f84834a.g(context2, i11);
                }
                if (colorStateListG != null) {
                    g(colorStateListG);
                }
            }
            if (typedArray.hasValue(1)) {
                a5.s0.i(view, uVarR.k(1));
            }
            if (typedArray.hasValue(2)) {
                a5.s0.j(view, a1.c(typedArray.getInt(2, -1), null));
            }
            uVarR.s();
        } catch (Throwable th2) {
            uVarR.s();
            throw th2;
        }
    }

    public final void e() {
        this.f84804c = -1;
        g(null);
        a();
    }

    public final void f(int i5) {
        ColorStateList colorStateListG;
        this.f84804c = i5;
        p pVar = this.f84803b;
        if (pVar != null) {
            Context context = this.f84802a.getContext();
            synchronized (pVar) {
                colorStateListG = pVar.f84834a.g(context, i5);
            }
        } else {
            colorStateListG = null;
        }
        g(colorStateListG);
        a();
    }

    public final void g(ColorStateList colorStateList) {
        if (colorStateList != null) {
            if (this.f84805d == null) {
                this.f84805d = new p6.g();
            }
            p6.g gVar = this.f84805d;
            gVar.f82168c = colorStateList;
            gVar.f82167b = true;
        } else {
            this.f84805d = null;
        }
        a();
    }

    public final void h(ColorStateList colorStateList) {
        if (this.f84806e == null) {
            this.f84806e = new p6.g();
        }
        p6.g gVar = this.f84806e;
        gVar.f82168c = colorStateList;
        gVar.f82167b = true;
        a();
    }

    public final void i(PorterDuff.Mode mode) {
        if (this.f84806e == null) {
            this.f84806e = new p6.g();
        }
        p6.g gVar = this.f84806e;
        gVar.f82169d = mode;
        gVar.f82166a = true;
        a();
    }
}
