package defpackage;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wj7 {
    public final vj7 a;
    public n3c b;
    public ulc c;
    public f70 d;
    public int e;
    public int f;
    public int g;
    public int h;
    public int i;
    public int j;
    public PorterDuff.Mode k;
    public ColorStateList l;
    public ColorStateList m;
    public ColorStateList n;
    public dk7 o;
    public boolean s;
    public RippleDrawable u;
    public int v;
    public boolean p = false;
    public boolean q = false;
    public boolean r = false;
    public boolean t = true;

    public wj7(vj7 vj7Var, n3c n3cVar) {
        this.a = vj7Var;
        this.b = n3cVar;
    }

    public final dk7 a(boolean z) {
        RippleDrawable rippleDrawable = this.u;
        if (rippleDrawable == null || rippleDrawable.getNumberOfLayers() <= 0) {
            return null;
        }
        return (dk7) ((LayerDrawable) ((InsetDrawable) this.u.getDrawable(0)).getDrawable()).getDrawable(!z ? 1 : 0);
    }

    public final void b(int i, int i2, int i3, int i4) {
        vj7 vj7Var = this.a;
        int paddingStart = vj7Var.getPaddingStart();
        int paddingTop = vj7Var.getPaddingTop();
        int paddingEnd = vj7Var.getPaddingEnd();
        int paddingBottom = vj7Var.getPaddingBottom();
        int i5 = this.e;
        int i6 = this.g;
        int i7 = this.f;
        int i8 = this.h;
        this.e = i;
        this.g = i2;
        this.f = i3;
        this.h = i4;
        if (!this.q) {
            c();
        }
        vj7Var.setPaddingRelative((paddingStart + i) - i5, (paddingTop + i2) - i6, (paddingEnd + i3) - i7, (paddingBottom + i4) - i8);
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x0101  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void c() {
        /*
            Method dump skipped, instruction units count: 295
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wj7.c():void");
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0038  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void d() {
        /*
            r3 = this;
            r0 = 0
            dk7 r0 = r3.a(r0)
            if (r0 == 0) goto L13
            n3c r1 = r3.b
            r0.m(r1)
            ulc r1 = r3.c
            if (r1 == 0) goto L13
            r0.j(r1)
        L13:
            r0 = 1
            dk7 r0 = r3.a(r0)
            if (r0 == 0) goto L26
            n3c r1 = r3.b
            r0.m(r1)
            ulc r1 = r3.c
            if (r1 == 0) goto L26
            r0.j(r1)
        L26:
            android.graphics.drawable.RippleDrawable r0 = r3.u
            if (r0 == 0) goto L38
            r1 = 16908334(0x102002e, float:2.3877358E-38)
            android.graphics.drawable.Drawable r0 = r0.findDrawableByLayerId(r1)
            boolean r1 = r0 instanceof defpackage.v4c
            if (r1 == 0) goto L38
            v4c r0 = (defpackage.v4c) r0
            goto L39
        L38:
            r0 = 0
        L39:
            if (r0 == 0) goto L55
            boolean r1 = r0 instanceof defpackage.dk7
            n3c r2 = r3.b
            if (r1 == 0) goto L4e
            dk7 r0 = (defpackage.dk7) r0
            r0.m(r2)
            ulc r3 = r3.c
            if (r3 == 0) goto L55
            r0.j(r3)
            return
        L4e:
            p3c r3 = r2.c()
            r0.setShapeAppearanceModel(r3)
        L55:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wj7.d():void");
    }

    public final void e() {
        dk7 dk7VarA = a(false);
        dk7 dk7VarA2 = a(true);
        if (dk7VarA != null) {
            float f = this.j;
            ColorStateList colorStateList = this.m;
            dk7VarA.b.j = f;
            dk7VarA.invalidateSelf();
            bk7 bk7Var = dk7VarA.b;
            if (bk7Var.d != colorStateList) {
                bk7Var.d = colorStateList;
                dk7VarA.onStateChange(dk7VarA.getState());
            }
            if (dk7VarA2 != null) {
                float f2 = this.j;
                int iC = this.p ? hlg.C(this.a, R.attr.colorSurface) : 0;
                dk7VarA2.b.j = f2;
                dk7VarA2.invalidateSelf();
                ColorStateList colorStateListValueOf = ColorStateList.valueOf(iC);
                bk7 bk7Var2 = dk7VarA2.b;
                if (bk7Var2.d != colorStateListValueOf) {
                    bk7Var2.d = colorStateListValueOf;
                    dk7VarA2.onStateChange(dk7VarA2.getState());
                }
            }
        }
    }
}
