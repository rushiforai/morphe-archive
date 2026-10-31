package r;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.method.PasswordTransformationMethod;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.Arrays;

/* loaded from: classes2.dex */
public final class n0 {

    /* renamed from: a, reason: collision with root package name */
    public final TextView f84814a;

    /* renamed from: b, reason: collision with root package name */
    public p6.g f84815b;

    /* renamed from: c, reason: collision with root package name */
    public p6.g f84816c;

    /* renamed from: d, reason: collision with root package name */
    public p6.g f84817d;

    /* renamed from: e, reason: collision with root package name */
    public p6.g f84818e;

    /* renamed from: f, reason: collision with root package name */
    public p6.g f84819f;

    /* renamed from: g, reason: collision with root package name */
    public p6.g f84820g;

    /* renamed from: h, reason: collision with root package name */
    public p6.g f84821h;

    /* renamed from: i, reason: collision with root package name */
    public final v0 f84822i;

    /* renamed from: j, reason: collision with root package name */
    public int f84823j = 0;

    /* renamed from: k, reason: collision with root package name */
    public int f84824k = -1;

    /* renamed from: l, reason: collision with root package name */
    public Typeface f84825l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f84826m;

    public n0(TextView textView) {
        this.f84814a = textView;
        this.f84822i = new v0(textView);
    }

    public static p6.g c(Context context, p pVar, int i5) {
        ColorStateList colorStateListG;
        synchronized (pVar) {
            colorStateListG = pVar.f84834a.g(context, i5);
        }
        if (colorStateListG == null) {
            return null;
        }
        p6.g gVar = new p6.g();
        gVar.f82167b = true;
        gVar.f82168c = colorStateListG;
        return gVar;
    }

    public final void a(Drawable drawable, p6.g gVar) {
        if (drawable == null || gVar == null) {
            return;
        }
        p.f(drawable, gVar, this.f84814a.getDrawableState());
    }

    public final void b() {
        p6.g gVar = this.f84815b;
        TextView textView = this.f84814a;
        if (gVar != null || this.f84816c != null || this.f84817d != null || this.f84818e != null) {
            Drawable[] compoundDrawables = textView.getCompoundDrawables();
            a(compoundDrawables[0], this.f84815b);
            a(compoundDrawables[1], this.f84816c);
            a(compoundDrawables[2], this.f84817d);
            a(compoundDrawables[3], this.f84818e);
        }
        if (this.f84819f == null && this.f84820g == null) {
            return;
        }
        Drawable[] compoundDrawablesRelative = textView.getCompoundDrawablesRelative();
        a(compoundDrawablesRelative[0], this.f84819f);
        a(compoundDrawablesRelative[2], this.f84820g);
    }

    /* JADX WARN: Removed duplicated region for block: B:226:0x0390  */
    /* JADX WARN: Removed duplicated region for block: B:228:0x0395  */
    /* JADX WARN: Removed duplicated region for block: B:231:0x039c  */
    /* JADX WARN: Removed duplicated region for block: B:241:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void d(AttributeSet attributeSet, int i5) {
        boolean z11;
        boolean z12;
        String string;
        String string2;
        float dimensionPixelSize;
        int i11;
        ColorStateList colorStateList;
        int resourceId;
        int i12;
        int resourceId2;
        TextView textView = this.f84814a;
        Context context = textView.getContext();
        p pVarA = p.a();
        int[] iArr = l.a.f72895h;
        x7.u uVarR = x7.u.r(context, attributeSet, iArr, i5);
        a5.a1.j(textView, textView.getContext(), iArr, attributeSet, (TypedArray) uVarR.f95209b, i5);
        TypedArray typedArray = (TypedArray) uVarR.f95209b;
        int resourceId3 = typedArray.getResourceId(0, -1);
        if (typedArray.hasValue(3)) {
            this.f84815b = c(context, pVarA, typedArray.getResourceId(3, 0));
        }
        if (typedArray.hasValue(1)) {
            this.f84816c = c(context, pVarA, typedArray.getResourceId(1, 0));
        }
        if (typedArray.hasValue(4)) {
            this.f84817d = c(context, pVarA, typedArray.getResourceId(4, 0));
        }
        if (typedArray.hasValue(2)) {
            this.f84818e = c(context, pVarA, typedArray.getResourceId(2, 0));
        }
        if (typedArray.hasValue(5)) {
            this.f84819f = c(context, pVarA, typedArray.getResourceId(5, 0));
        }
        if (typedArray.hasValue(6)) {
            this.f84820g = c(context, pVarA, typedArray.getResourceId(6, 0));
        }
        uVarR.s();
        boolean z13 = textView.getTransformationMethod() instanceof PasswordTransformationMethod;
        int[] iArr2 = l.a.f72908w;
        if (resourceId3 != -1) {
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(resourceId3, iArr2);
            x7.u uVar = new x7.u(context, typedArrayObtainStyledAttributes);
            if (z13 || !typedArrayObtainStyledAttributes.hasValue(14)) {
                z11 = false;
                z12 = false;
            } else {
                z12 = typedArrayObtainStyledAttributes.getBoolean(14, false);
                z11 = true;
            }
            i(context, uVar);
            string2 = typedArrayObtainStyledAttributes.hasValue(15) ? typedArrayObtainStyledAttributes.getString(15) : null;
            string = typedArrayObtainStyledAttributes.hasValue(13) ? typedArrayObtainStyledAttributes.getString(13) : null;
            uVar.s();
        } else {
            z11 = false;
            z12 = false;
            string = null;
            string2 = null;
        }
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, iArr2, i5, 0);
        x7.u uVar2 = new x7.u(context, typedArrayObtainStyledAttributes2);
        if (!z13 && typedArrayObtainStyledAttributes2.hasValue(14)) {
            z12 = typedArrayObtainStyledAttributes2.getBoolean(14, false);
            z11 = true;
        }
        boolean z14 = z12;
        int i13 = Build.VERSION.SDK_INT;
        if (typedArrayObtainStyledAttributes2.hasValue(15)) {
            string2 = typedArrayObtainStyledAttributes2.getString(15);
        }
        if (typedArrayObtainStyledAttributes2.hasValue(13)) {
            string = typedArrayObtainStyledAttributes2.getString(13);
        }
        if (i13 >= 28 && typedArrayObtainStyledAttributes2.hasValue(0) && typedArrayObtainStyledAttributes2.getDimensionPixelSize(0, -1) == 0) {
            textView.setTextSize(0, 0.0f);
        }
        i(context, uVar2);
        uVar2.s();
        if (!z13 && z11) {
            textView.setAllCaps(z14);
        }
        Typeface typeface = this.f84825l;
        if (typeface != null) {
            if (this.f84824k == -1) {
                textView.setTypeface(typeface, this.f84823j);
            } else {
                textView.setTypeface(typeface);
            }
        }
        if (string != null) {
            l0.d(textView, string);
        }
        if (string2 != null) {
            k0.b(textView, k0.a(string2));
        }
        v0 v0Var = this.f84822i;
        Context context2 = v0Var.f84899j;
        int[] iArr3 = l.a.f72896i;
        TypedArray typedArrayObtainStyledAttributes3 = context2.obtainStyledAttributes(attributeSet, iArr3, i5, 0);
        TextView textView2 = v0Var.f84898i;
        a5.a1.j(textView2, textView2.getContext(), iArr3, attributeSet, typedArrayObtainStyledAttributes3, i5);
        if (typedArrayObtainStyledAttributes3.hasValue(5)) {
            v0Var.f84890a = typedArrayObtainStyledAttributes3.getInt(5, 0);
        }
        float dimension = typedArrayObtainStyledAttributes3.hasValue(4) ? typedArrayObtainStyledAttributes3.getDimension(4, -1.0f) : -1.0f;
        float dimension2 = typedArrayObtainStyledAttributes3.hasValue(2) ? typedArrayObtainStyledAttributes3.getDimension(2, -1.0f) : -1.0f;
        float dimension3 = typedArrayObtainStyledAttributes3.hasValue(1) ? typedArrayObtainStyledAttributes3.getDimension(1, -1.0f) : -1.0f;
        if (typedArrayObtainStyledAttributes3.hasValue(3) && (resourceId2 = typedArrayObtainStyledAttributes3.getResourceId(3, 0)) > 0) {
            TypedArray typedArrayObtainTypedArray = typedArrayObtainStyledAttributes3.getResources().obtainTypedArray(resourceId2);
            int length = typedArrayObtainTypedArray.length();
            int[] iArr4 = new int[length];
            if (length > 0) {
                for (int i14 = 0; i14 < length; i14++) {
                    iArr4[i14] = typedArrayObtainTypedArray.getDimensionPixelSize(i14, -1);
                }
                v0Var.f84895f = v0.b(iArr4);
                v0Var.i();
            }
            typedArrayObtainTypedArray.recycle();
        }
        typedArrayObtainStyledAttributes3.recycle();
        if (!v0Var.j()) {
            v0Var.f84890a = 0;
        } else if (v0Var.f84890a == 1) {
            if (!v0Var.f84896g) {
                DisplayMetrics displayMetrics = context2.getResources().getDisplayMetrics();
                if (dimension2 == -1.0f) {
                    i12 = 2;
                    dimension2 = TypedValue.applyDimension(2, 12.0f, displayMetrics);
                } else {
                    i12 = 2;
                }
                if (dimension3 == -1.0f) {
                    dimension3 = TypedValue.applyDimension(i12, 112.0f, displayMetrics);
                }
                float f11 = dimension3;
                if (dimension == -1.0f) {
                    dimension = 1.0f;
                }
                v0Var.k(dimension2, f11, dimension);
            }
            v0Var.h();
        }
        if (p2.f84840c && v0Var.f84890a != 0) {
            int[] iArr5 = v0Var.f84895f;
            if (iArr5.length > 0) {
                if (l0.a(textView) != -1.0f) {
                    l0.b(textView, Math.round(v0Var.f84893d), Math.round(v0Var.f84894e), Math.round(v0Var.f84892c), 0);
                } else {
                    l0.c(textView, iArr5, 0);
                }
            }
        }
        TypedArray typedArrayObtainStyledAttributes4 = context.obtainStyledAttributes(attributeSet, iArr3);
        int resourceId4 = typedArrayObtainStyledAttributes4.getResourceId(8, -1);
        Drawable drawableB = resourceId4 != -1 ? pVarA.b(context, resourceId4) : null;
        int resourceId5 = typedArrayObtainStyledAttributes4.getResourceId(13, -1);
        Drawable drawableB2 = resourceId5 != -1 ? pVarA.b(context, resourceId5) : null;
        int resourceId6 = typedArrayObtainStyledAttributes4.getResourceId(9, -1);
        Drawable drawableB3 = resourceId6 != -1 ? pVarA.b(context, resourceId6) : null;
        int resourceId7 = typedArrayObtainStyledAttributes4.getResourceId(6, -1);
        Drawable drawableB4 = resourceId7 != -1 ? pVarA.b(context, resourceId7) : null;
        int resourceId8 = typedArrayObtainStyledAttributes4.getResourceId(10, -1);
        Drawable drawableB5 = resourceId8 != -1 ? pVarA.b(context, resourceId8) : null;
        int resourceId9 = typedArrayObtainStyledAttributes4.getResourceId(7, -1);
        Drawable drawableB6 = resourceId9 != -1 ? pVarA.b(context, resourceId9) : null;
        if (drawableB5 != null || drawableB6 != null) {
            Drawable[] compoundDrawablesRelative = textView.getCompoundDrawablesRelative();
            if (drawableB5 == null) {
                drawableB5 = compoundDrawablesRelative[0];
            }
            if (drawableB2 == null) {
                drawableB2 = compoundDrawablesRelative[1];
            }
            if (drawableB6 == null) {
                drawableB6 = compoundDrawablesRelative[2];
            }
            if (drawableB4 == null) {
                drawableB4 = compoundDrawablesRelative[3];
            }
            textView.setCompoundDrawablesRelativeWithIntrinsicBounds(drawableB5, drawableB2, drawableB6, drawableB4);
        } else if (drawableB != null || drawableB2 != null || drawableB3 != null || drawableB4 != null) {
            Drawable[] compoundDrawablesRelative2 = textView.getCompoundDrawablesRelative();
            Drawable drawable = compoundDrawablesRelative2[0];
            if (drawable == null && compoundDrawablesRelative2[2] == null) {
                Drawable[] compoundDrawables = textView.getCompoundDrawables();
                if (drawableB == null) {
                    drawableB = compoundDrawables[0];
                }
                if (drawableB2 == null) {
                    drawableB2 = compoundDrawables[1];
                }
                if (drawableB3 == null) {
                    drawableB3 = compoundDrawables[2];
                }
                if (drawableB4 == null) {
                    drawableB4 = compoundDrawables[3];
                }
                textView.setCompoundDrawablesWithIntrinsicBounds(drawableB, drawableB2, drawableB3, drawableB4);
            } else {
                if (drawableB2 == null) {
                    drawableB2 = compoundDrawablesRelative2[1];
                }
                if (drawableB4 == null) {
                    drawableB4 = compoundDrawablesRelative2[3];
                }
                textView.setCompoundDrawablesRelativeWithIntrinsicBounds(drawable, drawableB2, compoundDrawablesRelative2[2], drawableB4);
            }
        }
        if (typedArrayObtainStyledAttributes4.hasValue(11)) {
            if (!typedArrayObtainStyledAttributes4.hasValue(11) || (resourceId = typedArrayObtainStyledAttributes4.getResourceId(11, 0)) == 0 || (colorStateList = o4.a.b(context, resourceId)) == null) {
                colorStateList = typedArrayObtainStyledAttributes4.getColorStateList(11);
            }
            textView.setCompoundDrawableTintList(colorStateList);
        }
        if (typedArrayObtainStyledAttributes4.hasValue(12)) {
            textView.setCompoundDrawableTintMode(a1.c(typedArrayObtainStyledAttributes4.getInt(12, -1), null));
        }
        int dimensionPixelSize2 = typedArrayObtainStyledAttributes4.getDimensionPixelSize(15, -1);
        int dimensionPixelSize3 = typedArrayObtainStyledAttributes4.getDimensionPixelSize(18, -1);
        if (typedArrayObtainStyledAttributes4.hasValue(19)) {
            TypedValue typedValuePeekValue = typedArrayObtainStyledAttributes4.peekValue(19);
            if (typedValuePeekValue != null && typedValuePeekValue.type == 5) {
                int i15 = typedValuePeekValue.data;
                i11 = i15 & 15;
                dimensionPixelSize = TypedValue.complexToFloat(i15);
                typedArrayObtainStyledAttributes4.recycle();
                if (dimensionPixelSize2 != -1) {
                    android.support.v4.media.session.b.h0(textView, dimensionPixelSize2);
                }
                if (dimensionPixelSize3 != -1) {
                    android.support.v4.media.session.b.i0(textView, dimensionPixelSize3);
                }
                if (dimensionPixelSize == -1.0f) {
                    if (i11 == -1) {
                        android.support.v4.media.session.b.j0(textView, (int) dimensionPixelSize);
                        return;
                    } else if (Build.VERSION.SDK_INT >= 34) {
                        a5.k0.m(textView, i11, dimensionPixelSize);
                        return;
                    } else {
                        android.support.v4.media.session.b.j0(textView, Math.round(TypedValue.applyDimension(i11, dimensionPixelSize, textView.getResources().getDisplayMetrics())));
                        return;
                    }
                }
                return;
            }
            dimensionPixelSize = typedArrayObtainStyledAttributes4.getDimensionPixelSize(19, -1);
        } else {
            dimensionPixelSize = -1.0f;
        }
        i11 = -1;
        typedArrayObtainStyledAttributes4.recycle();
        if (dimensionPixelSize2 != -1) {
        }
        if (dimensionPixelSize3 != -1) {
        }
        if (dimensionPixelSize == -1.0f) {
        }
    }

    public final void e(Context context, int i5) {
        String string;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(i5, l.a.f72908w);
        x7.u uVar = new x7.u(context, typedArrayObtainStyledAttributes);
        boolean zHasValue = typedArrayObtainStyledAttributes.hasValue(14);
        TextView textView = this.f84814a;
        if (zHasValue) {
            textView.setAllCaps(typedArrayObtainStyledAttributes.getBoolean(14, false));
        }
        if (typedArrayObtainStyledAttributes.hasValue(0) && typedArrayObtainStyledAttributes.getDimensionPixelSize(0, -1) == 0) {
            textView.setTextSize(0, 0.0f);
        }
        i(context, uVar);
        if (typedArrayObtainStyledAttributes.hasValue(13) && (string = typedArrayObtainStyledAttributes.getString(13)) != null) {
            l0.d(textView, string);
        }
        uVar.s();
        Typeface typeface = this.f84825l;
        if (typeface != null) {
            textView.setTypeface(typeface, this.f84823j);
        }
    }

    public final void f(int i5, int i11, int i12, int i13) {
        v0 v0Var = this.f84822i;
        if (v0Var.j()) {
            DisplayMetrics displayMetrics = v0Var.f84899j.getResources().getDisplayMetrics();
            v0Var.k(TypedValue.applyDimension(i13, i5, displayMetrics), TypedValue.applyDimension(i13, i11, displayMetrics), TypedValue.applyDimension(i13, i12, displayMetrics));
            if (v0Var.h()) {
                v0Var.a();
            }
        }
    }

    public final void g(int[] iArr, int i5) {
        v0 v0Var = this.f84822i;
        if (v0Var.j()) {
            int length = iArr.length;
            if (length > 0) {
                int[] iArrCopyOf = new int[length];
                if (i5 == 0) {
                    iArrCopyOf = Arrays.copyOf(iArr, length);
                } else {
                    DisplayMetrics displayMetrics = v0Var.f84899j.getResources().getDisplayMetrics();
                    for (int i11 = 0; i11 < length; i11++) {
                        iArrCopyOf[i11] = Math.round(TypedValue.applyDimension(i5, iArr[i11], displayMetrics));
                    }
                }
                v0Var.f84895f = v0.b(iArrCopyOf);
                if (!v0Var.i()) {
                    throw new IllegalArgumentException("None of the preset sizes is valid: " + Arrays.toString(iArr));
                }
            } else {
                v0Var.f84896g = false;
            }
            if (v0Var.h()) {
                v0Var.a();
            }
        }
    }

    public final void h(int i5) {
        v0 v0Var = this.f84822i;
        if (v0Var.j()) {
            if (i5 == 0) {
                v0Var.f84890a = 0;
                v0Var.f84893d = -1.0f;
                v0Var.f84894e = -1.0f;
                v0Var.f84892c = -1.0f;
                v0Var.f84895f = new int[0];
                v0Var.f84891b = false;
                return;
            }
            if (i5 != 1) {
                throw new IllegalArgumentException(b.c0.h(i5, "Unknown auto-size text type: "));
            }
            DisplayMetrics displayMetrics = v0Var.f84899j.getResources().getDisplayMetrics();
            v0Var.k(TypedValue.applyDimension(2, 12.0f, displayMetrics), TypedValue.applyDimension(2, 112.0f, displayMetrics), 1.0f);
            if (v0Var.h()) {
                v0Var.a();
            }
        }
    }

    public final void i(Context context, x7.u uVar) {
        String string;
        int i5 = this.f84823j;
        TypedArray typedArray = (TypedArray) uVar.f95209b;
        this.f84823j = typedArray.getInt(2, i5);
        int i11 = Build.VERSION.SDK_INT;
        if (i11 >= 28) {
            int i12 = typedArray.getInt(11, -1);
            this.f84824k = i12;
            if (i12 != -1) {
                this.f84823j &= 2;
            }
        }
        if (!typedArray.hasValue(10) && !typedArray.hasValue(12)) {
            if (typedArray.hasValue(1)) {
                this.f84826m = false;
                int i13 = typedArray.getInt(1, 1);
                if (i13 == 1) {
                    this.f84825l = Typeface.SANS_SERIF;
                    return;
                } else if (i13 == 2) {
                    this.f84825l = Typeface.SERIF;
                    return;
                } else {
                    if (i13 != 3) {
                        return;
                    }
                    this.f84825l = Typeface.MONOSPACE;
                    return;
                }
            }
            return;
        }
        this.f84825l = null;
        int i14 = typedArray.hasValue(12) ? 12 : 10;
        int i15 = this.f84824k;
        int i16 = this.f84823j;
        if (!context.isRestricted()) {
            try {
                Typeface typefaceN = uVar.n(i14, this.f84823j, new j0(this, i15, i16, new WeakReference(this.f84814a)));
                if (typefaceN != null) {
                    if (i11 < 28 || this.f84824k == -1) {
                        this.f84825l = typefaceN;
                    } else {
                        this.f84825l = m0.a(Typeface.create(typefaceN, 0), this.f84824k, (this.f84823j & 2) != 0);
                    }
                }
                this.f84826m = this.f84825l == null;
            } catch (Resources.NotFoundException | UnsupportedOperationException unused) {
            }
        }
        if (this.f84825l != null || (string = typedArray.getString(i14)) == null) {
            return;
        }
        if (Build.VERSION.SDK_INT < 28 || this.f84824k == -1) {
            this.f84825l = Typeface.create(string, this.f84823j);
        } else {
            this.f84825l = m0.a(Typeface.create(string, 0), this.f84824k, (this.f84823j & 2) != 0);
        }
    }
}
