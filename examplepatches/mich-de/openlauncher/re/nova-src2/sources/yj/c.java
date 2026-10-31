package yj;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.text.TextPaint;
import android.util.TypedValue;
import ps.f0;
import ps.i0;
import ps.j0;
import q4.k;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final ColorStateList f97353a;

    /* renamed from: b, reason: collision with root package name */
    public final String f97354b;

    /* renamed from: c, reason: collision with root package name */
    public final int f97355c;

    /* renamed from: d, reason: collision with root package name */
    public final int f97356d;

    /* renamed from: e, reason: collision with root package name */
    public final float f97357e;

    /* renamed from: f, reason: collision with root package name */
    public final float f97358f;

    /* renamed from: g, reason: collision with root package name */
    public final float f97359g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f97360h;

    /* renamed from: i, reason: collision with root package name */
    public final float f97361i;

    /* renamed from: j, reason: collision with root package name */
    public final ColorStateList f97362j;

    /* renamed from: k, reason: collision with root package name */
    public float f97363k;

    /* renamed from: l, reason: collision with root package name */
    public final int f97364l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f97365m = false;
    public Typeface n;

    public c(Context context, int i5) throws Resources.NotFoundException {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(i5, bj.a.K);
        this.f97363k = typedArrayObtainStyledAttributes.getDimension(0, 0.0f);
        this.f97362j = f0.m(context, typedArrayObtainStyledAttributes, 3);
        f0.m(context, typedArrayObtainStyledAttributes, 4);
        f0.m(context, typedArrayObtainStyledAttributes, 5);
        this.f97355c = typedArrayObtainStyledAttributes.getInt(2, 0);
        this.f97356d = typedArrayObtainStyledAttributes.getInt(1, 1);
        int i11 = typedArrayObtainStyledAttributes.hasValue(12) ? 12 : 10;
        this.f97364l = typedArrayObtainStyledAttributes.getResourceId(i11, 0);
        this.f97354b = typedArrayObtainStyledAttributes.getString(i11);
        typedArrayObtainStyledAttributes.getBoolean(14, false);
        this.f97353a = f0.m(context, typedArrayObtainStyledAttributes, 6);
        this.f97357e = typedArrayObtainStyledAttributes.getFloat(7, 0.0f);
        this.f97358f = typedArrayObtainStyledAttributes.getFloat(8, 0.0f);
        this.f97359g = typedArrayObtainStyledAttributes.getFloat(9, 0.0f);
        typedArrayObtainStyledAttributes.recycle();
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(i5, bj.a.A);
        this.f97360h = typedArrayObtainStyledAttributes2.hasValue(0);
        this.f97361i = typedArrayObtainStyledAttributes2.getFloat(0, 0.0f);
        typedArrayObtainStyledAttributes2.recycle();
    }

    public final void a() {
        String str;
        Typeface typeface = this.n;
        int i5 = this.f97355c;
        if (typeface == null && (str = this.f97354b) != null) {
            this.n = Typeface.create(str, i5);
        }
        if (this.n == null) {
            int i11 = this.f97356d;
            if (i11 == 1) {
                this.n = Typeface.SANS_SERIF;
            } else if (i11 == 2) {
                this.n = Typeface.SERIF;
            } else if (i11 != 3) {
                this.n = Typeface.DEFAULT;
            } else {
                this.n = Typeface.MONOSPACE;
            }
            this.n = Typeface.create(this.n, i5);
        }
    }

    public final Typeface b(Context context) {
        if (this.f97365m) {
            return this.n;
        }
        if (!context.isRestricted()) {
            try {
                Typeface typefaceA = k.a(context, this.f97364l);
                this.n = typefaceA;
                if (typefaceA != null) {
                    this.n = Typeface.create(typefaceA, this.f97355c);
                }
            } catch (Resources.NotFoundException | UnsupportedOperationException | Exception unused) {
            }
        }
        a();
        this.f97365m = true;
        return this.n;
    }

    public final void c(Context context, i0 i0Var) {
        if (d(context)) {
            b(context);
        } else {
            a();
        }
        int i5 = this.f97364l;
        if (i5 == 0) {
            this.f97365m = true;
        }
        if (this.f97365m) {
            i0Var.m(this.n, true);
            return;
        }
        try {
            q3.c cVar = new q3.c(this, i0Var);
            ThreadLocal threadLocal = k.f83638a;
            if (context.isRestricted()) {
                cVar.a(-4);
            } else {
                k.b(context, i5, new TypedValue(), 0, cVar, false, false);
            }
        } catch (Resources.NotFoundException unused) {
            this.f97365m = true;
            i0Var.l(1);
        } catch (Exception unused2) {
            this.f97365m = true;
            i0Var.l(-3);
        }
    }

    public final boolean d(Context context) {
        Typeface typefaceB = null;
        int i5 = this.f97364l;
        if (i5 != 0) {
            ThreadLocal threadLocal = k.f83638a;
            if (!context.isRestricted()) {
                typefaceB = k.b(context, i5, new TypedValue(), 0, null, false, true);
            }
        }
        return typefaceB != null;
    }

    public final void e(Context context, TextPaint textPaint, i0 i0Var) {
        f(context, textPaint, i0Var);
        ColorStateList colorStateList = this.f97362j;
        textPaint.setColor(colorStateList != null ? colorStateList.getColorForState(textPaint.drawableState, colorStateList.getDefaultColor()) : -16777216);
        ColorStateList colorStateList2 = this.f97353a;
        textPaint.setShadowLayer(this.f97359g, this.f97357e, this.f97358f, colorStateList2 != null ? colorStateList2.getColorForState(textPaint.drawableState, colorStateList2.getDefaultColor()) : 0);
    }

    public final void f(Context context, TextPaint textPaint, i0 i0Var) {
        if (d(context)) {
            g(context, textPaint, b(context));
            return;
        }
        a();
        g(context, textPaint, this.n);
        c(context, new b(this, context, textPaint, i0Var));
    }

    public final void g(Context context, TextPaint textPaint, Typeface typeface) {
        Typeface typefaceO = j0.o(context.getResources().getConfiguration(), typeface);
        if (typefaceO != null) {
            typeface = typefaceO;
        }
        textPaint.setTypeface(typeface);
        int i5 = (~typeface.getStyle()) & this.f97355c;
        textPaint.setFakeBoldText((i5 & 1) != 0);
        textPaint.setTextSkewX((i5 & 2) != 0 ? -0.25f : 0.0f);
        textPaint.setTextSize(this.f97363k);
        if (this.f97360h) {
            textPaint.setLetterSpacing(this.f97361i);
        }
    }
}
