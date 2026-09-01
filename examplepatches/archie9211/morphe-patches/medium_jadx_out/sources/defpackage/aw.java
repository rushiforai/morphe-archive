package defpackage;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aw extends Drawable implements Drawable.Callback {
    public static final /* synthetic */ int t = 0;
    public xv a;
    public Rect b;
    public Drawable c;
    public Drawable d;
    public boolean f;
    public boolean h;
    public jn i;
    public long j;
    public long k;
    public bw l;
    public xv m;
    public boolean n;
    public xv o;
    public d46 p;
    public boolean s;
    public int e = 255;
    public int g = -1;
    public int q = -1;
    public int r = -1;

    public aw(xv xvVar, Resources resources) {
        i(new xv(xvVar, this, resources));
        onStateChange(getState());
        jumpToCurrentState();
    }

    /* JADX WARN: Code restructure failed: missing block: B:98:0x0272, code lost:
    
        r5.onStateChange(r5.getState());
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x0279, code lost:
    
        return r5;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.aw c(android.content.Context r24, android.content.res.Resources r25, android.content.res.XmlResourceParser r26, android.util.AttributeSet r27, android.content.res.Resources.Theme r28) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 664
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.aw.c(android.content.Context, android.content.res.Resources, android.content.res.XmlResourceParser, android.util.AttributeSet, android.content.res.Resources$Theme):aw");
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0066 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:26:? A[ADDED_TO_REGION, RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a(boolean r14) {
        /*
            r13 = this;
            r0 = 1
            r13.f = r0
            long r1 = android.os.SystemClock.uptimeMillis()
            android.graphics.drawable.Drawable r3 = r13.c
            r4 = 255(0xff, double:1.26E-321)
            r6 = 0
            r8 = 0
            if (r3 == 0) goto L36
            long r9 = r13.j
            int r11 = (r9 > r6 ? 1 : (r9 == r6 ? 0 : -1))
            if (r11 == 0) goto L38
            int r11 = (r9 > r1 ? 1 : (r9 == r1 ? 0 : -1))
            if (r11 > 0) goto L22
            int r9 = r13.e
            r3.setAlpha(r9)
            r13.j = r6
            goto L38
        L22:
            long r9 = r9 - r1
            long r9 = r9 * r4
            int r9 = (int) r9
            xv r10 = r13.a
            int r10 = r10.y
            int r9 = r9 / r10
            int r9 = 255 - r9
            int r10 = r13.e
            int r9 = r9 * r10
            int r9 = r9 / 255
            r3.setAlpha(r9)
            r3 = r0
            goto L39
        L36:
            r13.j = r6
        L38:
            r3 = r8
        L39:
            android.graphics.drawable.Drawable r9 = r13.d
            if (r9 == 0) goto L61
            long r10 = r13.k
            int r12 = (r10 > r6 ? 1 : (r10 == r6 ? 0 : -1))
            if (r12 == 0) goto L63
            int r12 = (r10 > r1 ? 1 : (r10 == r1 ? 0 : -1))
            if (r12 > 0) goto L50
            r9.setVisible(r8, r8)
            r0 = 0
            r13.d = r0
            r13.k = r6
            goto L63
        L50:
            long r10 = r10 - r1
            long r10 = r10 * r4
            int r3 = (int) r10
            xv r4 = r13.a
            int r4 = r4.z
            int r3 = r3 / r4
            int r4 = r13.e
            int r3 = r3 * r4
            int r3 = r3 / 255
            r9.setAlpha(r3)
            goto L64
        L61:
            r13.k = r6
        L63:
            r0 = r3
        L64:
            if (r14 == 0) goto L70
            if (r0 == 0) goto L70
            jn r14 = r13.i
            r3 = 16
            long r1 = r1 + r3
            r13.scheduleSelf(r14, r1)
        L70:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.aw.a(boolean):void");
    }

    @Override // android.graphics.drawable.Drawable
    public final void applyTheme(Resources.Theme theme) {
        b(theme);
        onStateChange(getState());
    }

    public final void b(Resources.Theme theme) {
        xv xvVar = this.a;
        if (theme == null) {
            xvVar.getClass();
            return;
        }
        xvVar.c();
        int i = xvVar.h;
        Drawable[] drawableArr = xvVar.g;
        for (int i2 = 0; i2 < i; i2++) {
            Drawable drawable = drawableArr[i2];
            if (drawable != null && drawable.canApplyTheme()) {
                drawableArr[i2].applyTheme(theme);
                xvVar.e |= drawableArr[i2].getChangingConfigurations();
            }
        }
        Resources resources = theme.getResources();
        if (resources != null) {
            xvVar.b = resources;
            int i3 = resources.getDisplayMetrics().densityDpi;
            if (i3 == 0) {
                i3 = 160;
            }
            int i4 = xvVar.c;
            xvVar.c = i3;
            if (i4 != i3) {
                xvVar.m = false;
                xvVar.j = false;
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean canApplyTheme() {
        return this.a.canApplyTheme();
    }

    public final void d(Drawable drawable) {
        bw bwVar = this.l;
        if (bwVar == null) {
            bwVar = new bw();
            this.l = bwVar;
        }
        bwVar.b = drawable.getCallback();
        drawable.setCallback(bwVar);
        try {
            if (this.a.y <= 0 && this.f) {
                drawable.setAlpha(this.e);
            }
            xv xvVar = this.a;
            if (xvVar.C) {
                drawable.setColorFilter(xvVar.B);
            } else {
                if (xvVar.F) {
                    drawable.setTintList(xvVar.D);
                }
                xv xvVar2 = this.a;
                if (xvVar2.G) {
                    drawable.setTintMode(xvVar2.E);
                }
            }
            drawable.setVisible(isVisible(), true);
            drawable.setDither(this.a.w);
            drawable.setState(getState());
            drawable.setLevel(getLevel());
            drawable.setBounds(getBounds());
            drawable.setLayoutDirection(getLayoutDirection());
            drawable.setAutoMirrored(this.a.A);
            Rect rect = this.b;
            if (rect != null) {
                drawable.setHotspotBounds(rect.left, rect.top, rect.right, rect.bottom);
            }
            bw bwVar2 = this.l;
            Drawable.Callback callback = (Drawable.Callback) bwVar2.b;
            bwVar2.b = null;
            drawable.setCallback(callback);
        } catch (Throwable th) {
            bw bwVar3 = this.l;
            Drawable.Callback callback2 = (Drawable.Callback) bwVar3.b;
            bwVar3.b = null;
            drawable.setCallback(callback2);
            throw th;
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        Drawable drawable = this.c;
        if (drawable != null) {
            drawable.draw(canvas);
        }
        Drawable drawable2 = this.d;
        if (drawable2 != null) {
            drawable2.draw(canvas);
        }
    }

    public final void e() {
        boolean z;
        Drawable drawable = this.d;
        boolean z2 = true;
        if (drawable != null) {
            drawable.jumpToCurrentState();
            this.d = null;
            z = true;
        } else {
            z = false;
        }
        Drawable drawable2 = this.c;
        if (drawable2 != null) {
            drawable2.jumpToCurrentState();
            if (this.f) {
                this.c.setAlpha(this.e);
            }
        }
        if (this.k != 0) {
            this.k = 0L;
            z = true;
        }
        if (this.j != 0) {
            this.j = 0L;
        } else {
            z2 = z;
        }
        if (z2) {
            invalidateSelf();
        }
    }

    public final Drawable f() {
        if (!this.h && super.mutate() == this) {
            xv xvVar = new xv(this.o, this, null);
            xvVar.I = xvVar.I.clone();
            xvVar.J = xvVar.J.clone();
            i(xvVar);
            this.h = true;
        }
        return this;
    }

    public final Drawable g() {
        if (!this.n) {
            f();
            xv xvVar = this.m;
            xvVar.I = xvVar.I.clone();
            xvVar.J = xvVar.J.clone();
            this.n = true;
        }
        return this;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getAlpha() {
        return this.e;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getChangingConfigurations() {
        return this.a.getChangingConfigurations() | super.getChangingConfigurations();
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable.ConstantState getConstantState() {
        boolean z;
        xv xvVar = this.a;
        if (!xvVar.u) {
            xvVar.c();
            xvVar.u = true;
            int i = xvVar.h;
            Drawable[] drawableArr = xvVar.g;
            int i2 = 0;
            while (true) {
                if (i2 >= i) {
                    xvVar.v = true;
                    z = true;
                    break;
                }
                if (drawableArr[i2].getConstantState() == null) {
                    xvVar.v = false;
                    z = false;
                    break;
                }
                i2++;
            }
        } else {
            z = xvVar.v;
        }
        if (!z) {
            return null;
        }
        this.a.d = getChangingConfigurations();
        return this.a;
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable getCurrent() {
        return this.c;
    }

    @Override // android.graphics.drawable.Drawable
    public final void getHotspotBounds(Rect rect) {
        Rect rect2 = this.b;
        if (rect2 != null) {
            rect.set(rect2);
        } else {
            super.getHotspotBounds(rect);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        xv xvVar = this.a;
        if (xvVar.l) {
            if (!xvVar.m) {
                xvVar.b();
            }
            return xvVar.o;
        }
        Drawable drawable = this.c;
        if (drawable != null) {
            return drawable.getIntrinsicHeight();
        }
        return -1;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        xv xvVar = this.a;
        if (xvVar.l) {
            if (!xvVar.m) {
                xvVar.b();
            }
            return xvVar.n;
        }
        Drawable drawable = this.c;
        if (drawable != null) {
            return drawable.getIntrinsicWidth();
        }
        return -1;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getMinimumHeight() {
        xv xvVar = this.a;
        if (xvVar.l) {
            if (!xvVar.m) {
                xvVar.b();
            }
            return xvVar.q;
        }
        Drawable drawable = this.c;
        if (drawable != null) {
            return drawable.getMinimumHeight();
        }
        return 0;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getMinimumWidth() {
        xv xvVar = this.a;
        if (xvVar.l) {
            if (!xvVar.m) {
                xvVar.b();
            }
            return xvVar.p;
        }
        Drawable drawable = this.c;
        if (drawable != null) {
            return drawable.getMinimumWidth();
        }
        return 0;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        Drawable drawable = this.c;
        if (drawable != null && drawable.isVisible()) {
            xv xvVar = this.a;
            if (xvVar.r) {
                return xvVar.s;
            }
            xvVar.c();
            int i = xvVar.h;
            Drawable[] drawableArr = xvVar.g;
            opacity = i > 0 ? drawableArr[0].getOpacity() : -2;
            for (int i2 = 1; i2 < i; i2++) {
                opacity = Drawable.resolveOpacity(opacity, drawableArr[i2].getOpacity());
            }
            xvVar.s = opacity;
            xvVar.r = true;
        }
        return opacity;
    }

    @Override // android.graphics.drawable.Drawable
    public final void getOutline(Outline outline) {
        Drawable drawable = this.c;
        if (drawable != null) {
            drawable.getOutline(outline);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean getPadding(Rect rect) {
        xv xvVar = this.a;
        Rect rect2 = null;
        boolean padding = false;
        if (!xvVar.i) {
            Rect rect3 = xvVar.k;
            if (rect3 != null || xvVar.j) {
                rect2 = rect3;
            } else {
                xvVar.c();
                Rect rect4 = new Rect();
                int i = xvVar.h;
                Drawable[] drawableArr = xvVar.g;
                for (int i2 = 0; i2 < i; i2++) {
                    if (drawableArr[i2].getPadding(rect4)) {
                        if (rect2 == null) {
                            rect2 = new Rect(0, 0, 0, 0);
                        }
                        int i3 = rect4.left;
                        if (i3 > rect2.left) {
                            rect2.left = i3;
                        }
                        int i4 = rect4.top;
                        if (i4 > rect2.top) {
                            rect2.top = i4;
                        }
                        int i5 = rect4.right;
                        if (i5 > rect2.right) {
                            rect2.right = i5;
                        }
                        int i6 = rect4.bottom;
                        if (i6 > rect2.bottom) {
                            rect2.bottom = i6;
                        }
                    }
                }
                xvVar.j = true;
                xvVar.k = rect2;
            }
        }
        if (rect2 != null) {
            rect.set(rect2);
            if ((rect2.left | rect2.top | rect2.bottom | rect2.right) != 0) {
                padding = true;
            }
        } else {
            Drawable drawable = this.c;
            padding = drawable != null ? drawable.getPadding(rect) : super.getPadding(rect);
        }
        if (this.a.A && getLayoutDirection() == 1) {
            int i7 = rect.left;
            rect.left = rect.right;
            rect.right = i7;
        }
        return padding;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0055  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean h(int r10) {
        /*
            r9 = this;
            int r0 = r9.g
            r1 = 0
            if (r10 != r0) goto L6
            return r1
        L6:
            long r2 = android.os.SystemClock.uptimeMillis()
            xv r0 = r9.a
            int r0 = r0.z
            r4 = 0
            r5 = 0
            if (r0 <= 0) goto L2e
            android.graphics.drawable.Drawable r0 = r9.d
            if (r0 == 0) goto L1a
            r0.setVisible(r1, r1)
        L1a:
            android.graphics.drawable.Drawable r0 = r9.c
            if (r0 == 0) goto L29
            r9.d = r0
            xv r0 = r9.a
            int r0 = r0.z
            long r0 = (long) r0
            long r0 = r0 + r2
            r9.k = r0
            goto L35
        L29:
            r9.d = r4
            r9.k = r5
            goto L35
        L2e:
            android.graphics.drawable.Drawable r0 = r9.c
            if (r0 == 0) goto L35
            r0.setVisible(r1, r1)
        L35:
            if (r10 < 0) goto L55
            xv r0 = r9.a
            int r1 = r0.h
            if (r10 >= r1) goto L55
            android.graphics.drawable.Drawable r0 = r0.d(r10)
            r9.c = r0
            r9.g = r10
            if (r0 == 0) goto L5a
            xv r10 = r9.a
            int r10 = r10.y
            if (r10 <= 0) goto L51
            long r7 = (long) r10
            long r2 = r2 + r7
            r9.j = r2
        L51:
            r9.d(r0)
            goto L5a
        L55:
            r9.c = r4
            r10 = -1
            r9.g = r10
        L5a:
            long r0 = r9.j
            int r10 = (r0 > r5 ? 1 : (r0 == r5 ? 0 : -1))
            r0 = 1
            if (r10 != 0) goto L67
            long r1 = r9.k
            int r10 = (r1 > r5 ? 1 : (r1 == r5 ? 0 : -1))
            if (r10 == 0) goto L7a
        L67:
            jn r10 = r9.i
            if (r10 != 0) goto L74
            jn r10 = new jn
            r1 = 4
            r10.<init>(r1, r9)
            r9.i = r10
            goto L77
        L74:
            r9.unscheduleSelf(r10)
        L77:
            r9.a(r0)
        L7a:
            r9.invalidateSelf()
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.aw.h(int):boolean");
    }

    public final void i(xv xvVar) {
        this.a = xvVar;
        int i = this.g;
        if (i >= 0) {
            Drawable drawableD = xvVar.d(i);
            this.c = drawableD;
            if (drawableD != null) {
                d(drawableD);
            }
        }
        this.d = null;
        this.m = xvVar;
        this.o = xvVar;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void invalidateDrawable(Drawable drawable) {
        xv xvVar = this.a;
        if (xvVar != null) {
            xvVar.r = false;
            xvVar.t = false;
        }
        if (drawable != this.c || getCallback() == null) {
            return;
        }
        getCallback().invalidateDrawable(this);
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean isAutoMirrored() {
        return this.a.A;
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean isStateful() {
        return true;
    }

    public final boolean j(boolean z, boolean z2) {
        boolean visible = super.setVisible(z, z2);
        Drawable drawable = this.d;
        if (drawable != null) {
            drawable.setVisible(z, z2);
        }
        Drawable drawable2 = this.c;
        if (drawable2 != null) {
            drawable2.setVisible(z, z2);
        }
        return visible;
    }

    @Override // android.graphics.drawable.Drawable
    public final void jumpToCurrentState() {
        e();
        d46 d46Var = this.p;
        if (d46Var != null) {
            d46Var.f0();
            this.p = null;
            h(this.q);
            this.q = -1;
            this.r = -1;
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable mutate() {
        if (!this.s) {
            g();
            xv xvVar = this.o;
            xvVar.I = xvVar.I.clone();
            xvVar.J = xvVar.J.clone();
            this.s = true;
        }
        return this;
    }

    @Override // android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        Drawable drawable = this.d;
        if (drawable != null) {
            drawable.setBounds(rect);
        }
        Drawable drawable2 = this.c;
        if (drawable2 != null) {
            drawable2.setBounds(rect);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean onLayoutDirectionChanged(int i) {
        xv xvVar = this.a;
        int i2 = this.g;
        int i3 = xvVar.h;
        Drawable[] drawableArr = xvVar.g;
        boolean z = false;
        for (int i4 = 0; i4 < i3; i4++) {
            Drawable drawable = drawableArr[i4];
            if (drawable != null) {
                boolean layoutDirection = drawable.setLayoutDirection(i);
                if (i4 == i2) {
                    z = layoutDirection;
                }
            }
        }
        xvVar.x = i;
        return z;
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean onLevelChange(int i) {
        Drawable drawable = this.d;
        if (drawable != null) {
            return drawable.setLevel(i);
        }
        Drawable drawable2 = this.c;
        if (drawable2 != null) {
            return drawable2.setLevel(i);
        }
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00ce  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00d4  */
    @Override // android.graphics.drawable.Drawable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean onStateChange(int[] r15) {
        /*
            Method dump skipped, instruction units count: 224
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.aw.onStateChange(int[]):boolean");
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void scheduleDrawable(Drawable drawable, Runnable runnable, long j) {
        if (drawable != this.c || getCallback() == null) {
            return;
        }
        getCallback().scheduleDrawable(this, runnable, j);
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i) {
        if (this.f && this.e == i) {
            return;
        }
        this.f = true;
        this.e = i;
        Drawable drawable = this.c;
        if (drawable != null) {
            if (this.j == 0) {
                drawable.setAlpha(i);
            } else {
                a(false);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAutoMirrored(boolean z) {
        xv xvVar = this.a;
        if (xvVar.A != z) {
            xvVar.A = z;
            Drawable drawable = this.c;
            if (drawable != null) {
                drawable.setAutoMirrored(z);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        xv xvVar = this.a;
        xvVar.C = true;
        if (xvVar.B != colorFilter) {
            xvVar.B = colorFilter;
            Drawable drawable = this.c;
            if (drawable != null) {
                drawable.setColorFilter(colorFilter);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setDither(boolean z) {
        xv xvVar = this.a;
        if (xvVar.w != z) {
            xvVar.w = z;
            Drawable drawable = this.c;
            if (drawable != null) {
                drawable.setDither(z);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setHotspot(float f, float f2) {
        Drawable drawable = this.c;
        if (drawable != null) {
            drawable.setHotspot(f, f2);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setHotspotBounds(int i, int i2, int i3, int i4) {
        Rect rect = this.b;
        if (rect == null) {
            this.b = new Rect(i, i2, i3, i4);
        } else {
            rect.set(i, i2, i3, i4);
        }
        Drawable drawable = this.c;
        if (drawable != null) {
            drawable.setHotspotBounds(i, i2, i3, i4);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTint(int i) {
        setTintList(ColorStateList.valueOf(i));
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTintList(ColorStateList colorStateList) {
        xv xvVar = this.a;
        xvVar.F = true;
        if (xvVar.D != colorStateList) {
            xvVar.D = colorStateList;
            this.c.setTintList(colorStateList);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTintMode(PorterDuff.Mode mode) {
        xv xvVar = this.a;
        xvVar.G = true;
        if (xvVar.E != mode) {
            xvVar.E = mode;
            this.c.setTintMode(mode);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean setVisible(boolean z, boolean z2) {
        boolean zJ = j(z, z2);
        d46 d46Var = this.p;
        if (d46Var != null && (zJ || z2)) {
            if (z) {
                d46Var.e0();
                return zJ;
            }
            jumpToCurrentState();
        }
        return zJ;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void unscheduleDrawable(Drawable drawable, Runnable runnable) {
        if (drawable != this.c || getCallback() == null) {
            return;
        }
        getCallback().unscheduleDrawable(this, runnable);
    }
}
