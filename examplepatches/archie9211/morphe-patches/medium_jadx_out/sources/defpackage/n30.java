package defpackage;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n30 {
    public final TextView a;
    public i42 b;
    public i42 c;
    public i42 d;
    public i42 e;
    public i42 f;
    public i42 g;
    public i42 h;
    public final w30 i;
    public int j = 0;
    public int k = -1;
    public Typeface l;
    public boolean m;

    public n30(TextView textView) {
        this.a = textView;
        this.i = new w30(textView);
    }

    public static i42 c(Context context, j20 j20Var, int i) {
        ColorStateList colorStateListI;
        synchronized (j20Var) {
            colorStateListI = j20Var.a.i(context, i);
        }
        if (colorStateListI == null) {
            return null;
        }
        i42 i42Var = new i42();
        i42Var.b = true;
        i42Var.c = colorStateListI;
        return i42Var;
    }

    public final void a(Drawable drawable, i42 i42Var) {
        if (drawable == null || i42Var == null) {
            return;
        }
        int[] drawableState = this.a.getDrawableState();
        PorterDuff.Mode mode = j20.b;
        scb.o(drawable, i42Var, drawableState);
    }

    public final void b() {
        i42 i42Var = this.b;
        TextView textView = this.a;
        if (i42Var != null || this.c != null || this.d != null || this.e != null) {
            Drawable[] compoundDrawables = textView.getCompoundDrawables();
            a(compoundDrawables[0], this.b);
            a(compoundDrawables[1], this.c);
            a(compoundDrawables[2], this.d);
            a(compoundDrawables[3], this.e);
        }
        if (this.f == null && this.g == null) {
            return;
        }
        Drawable[] compoundDrawablesRelative = textView.getCompoundDrawablesRelative();
        a(compoundDrawablesRelative[0], this.f);
        a(compoundDrawablesRelative[2], this.g);
    }

    public final ColorStateList d() {
        i42 i42Var = this.h;
        if (i42Var != null) {
            return (ColorStateList) i42Var.c;
        }
        return null;
    }

    public final PorterDuff.Mode e() {
        i42 i42Var = this.h;
        if (i42Var != null) {
            return (PorterDuff.Mode) i42Var.d;
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:244:0x03dc  */
    /* JADX WARN: Removed duplicated region for block: B:246:0x03e1  */
    /* JADX WARN: Removed duplicated region for block: B:249:0x03e8  */
    /* JADX WARN: Removed duplicated region for block: B:259:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void f(android.util.AttributeSet r25, int r26) {
        /*
            Method dump skipped, instruction units count: 1037
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n30.f(android.util.AttributeSet, int):void");
    }

    public final void g(Context context, int i) {
        String string;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(i, esa.v);
        vwa vwaVar = new vwa(context, typedArrayObtainStyledAttributes);
        boolean zHasValue = typedArrayObtainStyledAttributes.hasValue(14);
        TextView textView = this.a;
        if (zHasValue) {
            textView.setAllCaps(typedArrayObtainStyledAttributes.getBoolean(14, false));
        }
        if (typedArrayObtainStyledAttributes.hasValue(0) && typedArrayObtainStyledAttributes.getDimensionPixelSize(0, -1) == 0) {
            textView.setTextSize(0, 0.0f);
        }
        m(context, vwaVar);
        if (Build.VERSION.SDK_INT >= 26 && typedArrayObtainStyledAttributes.hasValue(13) && (string = typedArrayObtainStyledAttributes.getString(13)) != null) {
            l30.d(textView, string);
        }
        vwaVar.C();
        Typeface typeface = this.l;
        if (typeface != null) {
            textView.setTypeface(typeface, this.j);
        }
    }

    public final void h(int i, int i2, int i3, int i4) {
        w30 w30Var = this.i;
        if (w30Var.j()) {
            DisplayMetrics displayMetrics = w30Var.j.getResources().getDisplayMetrics();
            w30Var.k(TypedValue.applyDimension(i4, i, displayMetrics), TypedValue.applyDimension(i4, i2, displayMetrics), TypedValue.applyDimension(i4, i3, displayMetrics));
            if (w30Var.h()) {
                w30Var.a();
            }
        }
    }

    public final void i(int[] iArr, int i) {
        w30 w30Var = this.i;
        if (w30Var.j()) {
            int length = iArr.length;
            if (length > 0) {
                int[] iArrCopyOf = new int[length];
                if (i == 0) {
                    iArrCopyOf = Arrays.copyOf(iArr, length);
                } else {
                    DisplayMetrics displayMetrics = w30Var.j.getResources().getDisplayMetrics();
                    for (int i2 = 0; i2 < length; i2++) {
                        iArrCopyOf[i2] = Math.round(TypedValue.applyDimension(i, iArr[i2], displayMetrics));
                    }
                }
                w30Var.f = w30.b(iArrCopyOf);
                if (!w30Var.i()) {
                    z72.d("None of the preset sizes is valid: ", Arrays.toString(iArr));
                    return;
                }
            } else {
                w30Var.g = false;
            }
            if (w30Var.h()) {
                w30Var.a();
            }
        }
    }

    public final void j(int i) {
        w30 w30Var = this.i;
        if (w30Var.j()) {
            if (i == 0) {
                w30Var.a = 0;
                w30Var.d = -1.0f;
                w30Var.e = -1.0f;
                w30Var.c = -1.0f;
                w30Var.f = new int[0];
                w30Var.b = false;
                return;
            }
            if (i != 1) {
                ay0.e(b09.w(i, "Unknown auto-size text type: "));
                return;
            }
            DisplayMetrics displayMetrics = w30Var.j.getResources().getDisplayMetrics();
            w30Var.k(TypedValue.applyDimension(2, 12.0f, displayMetrics), TypedValue.applyDimension(2, 112.0f, displayMetrics), 1.0f);
            if (w30Var.h()) {
                w30Var.a();
            }
        }
    }

    public final void k(ColorStateList colorStateList) {
        i42 i42Var = this.h;
        if (i42Var == null) {
            i42Var = new i42();
            this.h = i42Var;
        }
        i42 i42Var2 = i42Var;
        i42Var.c = colorStateList;
        i42Var.b = colorStateList != null;
        this.b = i42Var2;
        this.c = i42Var2;
        this.d = i42Var2;
        this.e = i42Var2;
        this.f = i42Var2;
        this.g = i42Var2;
    }

    public final void l(PorterDuff.Mode mode) {
        i42 i42Var = this.h;
        if (i42Var == null) {
            i42Var = new i42();
            this.h = i42Var;
        }
        i42 i42Var2 = i42Var;
        i42Var.d = mode;
        i42Var.a = mode != null;
        this.b = i42Var2;
        this.c = i42Var2;
        this.d = i42Var2;
        this.e = i42Var2;
        this.f = i42Var2;
        this.g = i42Var2;
    }

    public final void m(Context context, vwa vwaVar) {
        String string;
        int i = this.j;
        TypedArray typedArray = (TypedArray) vwaVar.c;
        this.j = typedArray.getInt(2, i);
        int i2 = Build.VERSION.SDK_INT;
        if (i2 >= 28) {
            int i3 = typedArray.getInt(11, -1);
            this.k = i3;
            if (i3 != -1) {
                this.j &= 2;
            }
        }
        if (!typedArray.hasValue(10) && !typedArray.hasValue(12)) {
            if (typedArray.hasValue(1)) {
                this.m = false;
                int i4 = typedArray.getInt(1, 1);
                if (i4 == 1) {
                    this.l = Typeface.SANS_SERIF;
                    return;
                } else if (i4 == 2) {
                    this.l = Typeface.SERIF;
                    return;
                } else {
                    if (i4 != 3) {
                        return;
                    }
                    this.l = Typeface.MONOSPACE;
                    return;
                }
            }
            return;
        }
        this.l = null;
        int i5 = typedArray.hasValue(12) ? 12 : 10;
        int i6 = this.k;
        int i7 = this.j;
        if (!context.isRestricted()) {
            try {
                Typeface typefaceS = vwaVar.s(i5, this.j, new h30(this, i6, i7, new WeakReference(this.a)));
                if (typefaceS != null) {
                    if (i2 < 28 || this.k == -1) {
                        this.l = typefaceS;
                    } else {
                        this.l = m30.a(Typeface.create(typefaceS, 0), this.k, (this.j & 2) != 0);
                    }
                }
                this.m = this.l == null;
            } catch (Resources.NotFoundException | UnsupportedOperationException unused) {
            }
        }
        if (this.l != null || (string = typedArray.getString(i5)) == null) {
            return;
        }
        if (Build.VERSION.SDK_INT < 28 || this.k == -1) {
            this.l = Typeface.create(string, this.j);
        } else {
            this.l = m30.a(Typeface.create(string, 0), this.k, (this.j & 2) != 0);
        }
    }
}
