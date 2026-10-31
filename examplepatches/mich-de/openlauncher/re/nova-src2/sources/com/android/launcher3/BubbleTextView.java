package com.android.launcher3;

import aa.c0;
import aa.i0;
import aa.l;
import aa.n;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.icu.text.MessageFormat;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.widget.TextView;
import com.android.launcher3.allapps.AllAppsRecyclerView;
import com.android.launcher3.folder.FolderIcon;
import com.android.launcher3.icons.BitmapInfo;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.launcher.Hotseat;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.drawer.AppPageStandard;
import fz.d0;
import fz.r;
import ga.f;
import ga.h;
import ga.j;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.regex.Pattern;
import kl.q0;
import kotlin.UInt;
import mx.j0;
import mz.e;
import mz.g;
import o9.a0;
import o9.g3;
import o9.k;
import o9.n1;
import o9.o;
import o9.t1;
import o9.u2;
import o9.v2;
import tz.v;
import w9.a;
import x9.p;
import za.d;
import za.q;

/* loaded from: classes.dex */
public class BubbleTextView extends TextView implements c0, q, p, v2 {

    /* renamed from: a, reason: collision with root package name */
    public final PointF f20864a;

    /* renamed from: b, reason: collision with root package name */
    public final PointF f20865b;

    /* renamed from: c, reason: collision with root package name */
    public final PointF f20866c;

    /* renamed from: d, reason: collision with root package name */
    public float f20867d;

    /* renamed from: e, reason: collision with root package name */
    public final d f20868e;

    /* renamed from: f, reason: collision with root package name */
    public n f20869f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f20870g;

    /* renamed from: h, reason: collision with root package name */
    public final int f20871h;

    /* renamed from: i, reason: collision with root package name */
    public final a0 f20872i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f20873j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f20874k;

    /* renamed from: l, reason: collision with root package name */
    public int f20875l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f20876m;
    public int n;
    public float o;

    /* renamed from: p, reason: collision with root package name */
    public a f20877p;

    /* renamed from: q, reason: collision with root package name */
    public g f20878q;

    /* renamed from: r, reason: collision with root package name */
    public final e f20879r;

    /* renamed from: s, reason: collision with root package name */
    public ObjectAnimator f20880s;

    /* renamed from: t, reason: collision with root package name */
    public boolean f20881t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f20882u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f20883v;

    /* renamed from: w, reason: collision with root package name */
    public ba.e f20884w;

    /* renamed from: x, reason: collision with root package name */
    public boolean f20885x;

    /* renamed from: y, reason: collision with root package name */
    public final int f20886y;

    /* renamed from: z, reason: collision with root package name */
    public static final l f20863z = new l(5, Float.TYPE, "dotScale");
    public static final l A = new l(6, Float.class, "textAlpha");

    public BubbleTextView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public final z9.d A() {
        if (!(getTag() instanceof f)) {
            return null;
        }
        f fVar = (f) getTag();
        int iF0 = fVar.f0();
        if (iF0 >= 100) {
            CharSequence charSequence = fVar.f57301m;
            if (charSequence == null) {
                charSequence = b.f42142b;
            }
            setContentDescription(charSequence);
        } else if (iF0 > 0) {
            M(fVar, iF0);
        } else {
            setContentDescription(getContext().getString(2132017515, fVar.f57300l));
        }
        n nVar = this.f20869f;
        if (nVar == null) {
            return null;
        }
        if (!(nVar instanceof z9.d)) {
            z9.d dVarK = K();
            O(dVarK);
            return dVarK;
        }
        z9.d dVar = (z9.d) nVar;
        dVar.setLevel(iF0);
        dVar.j(!fVar.p0());
        return dVar;
    }

    public final void B() {
        if (u9.b.f90708w.b()) {
            float width = (getWidth() - getCompoundPaddingLeft()) - getCompoundPaddingRight();
            if (width <= 0.0f) {
                return;
            }
            setLetterSpacing(0.0f);
            String string = getText().toString();
            TextPaint paint = getPaint();
            if (paint.measureText(string) < width) {
                return;
            }
            float f11 = -0.05f;
            paint.setLetterSpacing(-0.05f);
            if (paint.measureText(string) <= width) {
                float f12 = 0.0f;
                for (int i5 = 0; i5 < 20; i5++) {
                    float f13 = (f12 + f11) / 2.0f;
                    paint.setLetterSpacing(f13);
                    if (paint.measureText(string) < width) {
                        f11 = f13;
                    } else {
                        f12 = f13;
                    }
                }
            }
            paint.setLetterSpacing(0.0f);
            setLetterSpacing(f11);
        }
    }

    public void C(Canvas canvas) {
        if (this.f20881t) {
            return;
        }
        boolean zJ = J();
        e eVar = this.f20879r;
        if (zJ || eVar.f77309c > 0.0f) {
            H(this.f20875l, eVar.f77308b);
            g3.t(r.f56352b, eVar.f77308b);
            canvas.translate(getScrollX(), getScrollY());
            this.f20878q.b(canvas, eVar);
            canvas.translate(-r0, -r2);
        }
    }

    public final void E(Canvas canvas) {
        super.onDraw(canvas);
    }

    public a F() {
        return this.f20877p;
    }

    public float G() {
        return this.f20879r.f77309c;
    }

    public final void H(int i5, Rect rect) {
        Pattern pattern = g3.f79846a;
        int height = (getHeight() - i5) / 2;
        int width = (getWidth() - i5) / 2;
        rect.set(width, height, width + i5, height + i5);
        if (!this.f20873j) {
            rect.offsetTo(rect.left, getPaddingTop());
        } else if (this.f20874k) {
            rect.offsetTo((getWidth() - i5) - getPaddingRight(), rect.top);
        } else {
            rect.offsetTo(getPaddingLeft(), rect.top);
        }
    }

    public final int I() {
        if (this.o == 0.0f) {
            return 0;
        }
        return aa.p.d(this.n, Math.round(Color.alpha(r0) * this.o));
    }

    public boolean J() {
        return this.f20877p != null;
    }

    public final z9.d K() {
        if (!(getTag() instanceof f)) {
            return null;
        }
        f fVar = (f) getTag();
        int iF0 = fVar.f0();
        z9.d dVarM = z9.d.m(getContext(), fVar);
        dVarM.setLevel(iF0);
        dVarM.j(!fVar.p0());
        return dVarM;
    }

    public void L(float f11) {
        this.f20879r.f77309c = f11;
        invalidate();
    }

    public final void M(f fVar, int i5) {
        if ((fVar.f57305s & 3072) != 0) {
            String str = NumberFormat.getPercentInstance().format(i5 * 0.01d);
            int i11 = fVar.f57305s;
            if ((i11 & 1024) != 0) {
                setContentDescription(getContext().getString(2132017506, fVar.f57300l, str));
            } else if ((i11 & 2048) != 0) {
                setContentDescription(getContext().getString(2132017501, fVar.f57300l, str));
            }
        }
    }

    public final void N(boolean z11) {
        if (this.f20881t == z11) {
            return;
        }
        this.f20881t = z11;
        if (z11) {
            invalidate();
        } else if (J()) {
            q(0.0f, 1.0f);
        }
    }

    public final void O(n nVar) {
        if (this.f20876m) {
            t(nVar);
        }
        this.f20869f = nVar;
        if (nVar != null) {
            nVar.setVisible(getWindowVisibility() == 0 && isShown(), false);
        }
    }

    public final void P(float f11) {
        this.o = f11;
        super.setTextColor(I());
    }

    public boolean Q(float f11, float f12) {
        if (this.f20871h == 5) {
            return false;
        }
        return f12 < ((float) getPaddingTop()) || f11 < ((float) getPaddingLeft()) || f12 > ((float) (getHeight() - getPaddingBottom())) || f11 > ((float) (getWidth() - getPaddingRight()));
    }

    public final boolean R() {
        Context context = getContext();
        q0 q0Var = n1.C0;
        j0 j0Var = ((NovaLauncher) k.Y(context)).f79934x;
        ViewParent parent = getParent();
        if (parent instanceof AllAppsRecyclerView) {
            return j0Var.E0.f77069b.f77124b;
        }
        if (parent instanceof AppPageStandard) {
            return j0Var.F0.f77069b.f77124b;
        }
        Object tag = getParent() instanceof FolderIcon ? ((View) getParent()).getTag() : getTag();
        int i5 = (tag instanceof ga.e ? (ga.e) tag : null).f57291c;
        if (i5 == -101 || i5 == -103) {
            return j0Var.C0.f77069b.f77124b;
        }
        if (i5 == -100) {
            return j0Var.B0.f77069b.f77124b;
        }
        if (i5 > 0 || i5 <= -200) {
            return j0Var.D0.f77069b.f77124b;
        }
        return true;
    }

    public final void S() {
        CharSequence charSequence;
        Object tag = getTag();
        if (tag instanceof ga.e) {
            ga.e eVar = (ga.e) tag;
            if (eVar.f57301m != null) {
                if (getParent() == null || getParent().getParent() == null || getParent().getParent().getParent() == null || !(getParent().getParent().getParent() instanceof Hotseat)) {
                    charSequence = eVar.f57301m;
                } else {
                    charSequence = ((Object) eVar.f57301m) + ", " + getResources().getString(2132019216);
                }
                if (eVar.m()) {
                    setContentDescription(getContext().getString(2132017740, charSequence));
                    return;
                }
                if (!J()) {
                    setContentDescription(charSequence);
                    return;
                }
                int iB = F().b();
                String string = eVar.f57301m.toString();
                MessageFormat messageFormat = new MessageFormat(getResources().getString(2132017759), Locale.getDefault());
                HashMap map = new HashMap();
                map.put("app_name", string);
                map.put("count", Integer.valueOf(iB));
                setContentDescription(messageFormat.format(map));
            }
        }
    }

    public final void T() {
        PointF pointF = this.f20864a;
        float f11 = pointF.x;
        PointF pointF2 = this.f20865b;
        float f12 = f11 + pointF2.x;
        PointF pointF3 = this.f20866c;
        super.setTranslationX(f12 + pointF3.x + 0.0f);
        super.setTranslationY(pointF.y + pointF2.y + pointF3.y);
    }

    public void U() {
        ba.e eVar = this.f20884w;
        if (eVar != null) {
            eVar.a();
            this.f20884w = null;
        }
        if (getTag() instanceof f) {
            f fVar = (f) getTag();
            if (fVar.L0()) {
                this.f20884w = t1.c(getContext()).f80135d.D(this, fVar);
            }
        }
    }

    @Override // za.q
    public void a(boolean z11) {
        n nVar;
        this.f20876m = z11;
        if (!z11 && (nVar = this.f20869f) != null) {
            ObjectAnimator objectAnimator = nVar.f633h;
            if (objectAnimator != null) {
                objectAnimator.cancel();
                nVar.f633h = null;
            }
            nVar.f634i = 1.0f;
            nVar.invalidateSelf();
        }
        t(z11 ? this.f20869f : new ColorDrawable(0));
    }

    @Override // o9.v2
    public float b() {
        return this.f20867d;
    }

    @Override // o9.v2
    public View c() {
        return this;
    }

    @Override // android.widget.TextView, android.view.View
    public final void cancelLongPress() {
        super.cancelLongPress();
        this.f20872i.a();
    }

    @Override // x9.p
    public final void d(Rect rect) {
        H(this.f20875l, rect);
    }

    @Override // x9.p
    public final ya.j0 e() {
        n nVar = this.f20869f;
        if (nVar != null) {
            ObjectAnimator objectAnimator = nVar.f633h;
            if (objectAnimator != null) {
                objectAnimator.cancel();
                nVar.f633h = null;
            }
            nVar.f634i = 1.0f;
            nVar.invalidateSelf();
        }
        N(true);
        return new o(0);
    }

    @Override // o9.v2
    public void h(float f11) {
        this.f20867d = f11;
        super.setScaleX(f11);
        super.setScaleY(f11);
    }

    @Override // o9.v2
    public void i(float f11, float f12) {
        this.f20864a.set(f11, f12);
        T();
    }

    @Override // o9.v2
    public void j(float f11, float f12) {
        this.f20865b.set(f11, f12);
        T();
    }

    @Override // x9.p
    public final void k(Rect rect) {
        H(this.f20875l, rect);
    }

    @Override // x9.p
    public int m() {
        return 0;
    }

    @Override // aa.c0
    public final void n(f fVar) {
        if (getTag() == fVar) {
            this.f20884w = null;
            this.f20883v = true;
            this.f20885x = true;
            fVar.f57304r.f21151a.prepareToDraw();
            if (fVar instanceof ga.a) {
                v((ga.a) fVar);
            } else if (fVar instanceof j) {
                w((j) fVar);
                this.f20868e.k(fVar);
            } else if (fVar instanceof h) {
                h hVar = (h) fVar;
                y(hVar);
                setTag(hVar);
                U();
                M(hVar, hVar.f0());
            }
            this.f20883v = false;
            this.f20885x = false;
        }
    }

    @Override // o9.v2
    public void o(PointF pointF) {
        pointF.set(this.f20865b);
    }

    @Override // android.widget.TextView, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        S();
    }

    @Override // android.widget.TextView, android.view.View
    public final int[] onCreateDrawableState(int i5) {
        return super.onCreateDrawableState(i5 + 1);
    }

    @Override // android.widget.TextView, android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        C(canvas);
    }

    @Override // android.widget.TextView, android.view.View
    public final void onFocusChanged(boolean z11, int i5, Rect rect) {
        setEllipsize(z11 ? TextUtils.TruncateAt.MARQUEE : TextUtils.TruncateAt.END);
        super.onFocusChanged(z11, i5, rect);
    }

    @Override // android.widget.TextView, android.view.View, android.view.KeyEvent.Callback
    public final boolean onKeyUp(int i5, KeyEvent keyEvent) {
        this.f20882u = true;
        boolean zOnKeyUp = super.onKeyUp(i5, keyEvent);
        this.f20882u = false;
        refreshDrawableState();
        return zOnKeyUp;
    }

    @Override // android.widget.TextView, android.view.View
    public void onMeasure(int i5, int i11) {
        if (this.f20870g) {
            Paint.FontMetrics fontMetrics = getPaint().getFontMetrics();
            setPadding(getPaddingLeft(), (View.MeasureSpec.getSize(i11) - (this.f20873j ? this.f20875l : ((int) (Math.ceil(fontMetrics.bottom - fontMetrics.top) * (getMaxLines() > 1 ? 2.02f : 1.0f))) + (getCompoundDrawablePadding() + this.f20875l))) / 2, getPaddingRight(), getPaddingBottom());
        }
        super.onMeasure(i5, i11);
    }

    @Override // android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        B();
    }

    @Override // android.widget.TextView
    public final void onTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
        super.onTextChanged(charSequence, i5, i11, i12);
        B();
    }

    @Override // android.widget.TextView, android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0 && Q(motionEvent.getX(), motionEvent.getY())) {
            return false;
        }
        if (!isLongClickable()) {
            return super.onTouchEvent(motionEvent);
        }
        super.onTouchEvent(motionEvent);
        this.f20872i.b(motionEvent);
        return true;
    }

    @Override // android.widget.TextView, android.view.View
    public final void onVisibilityAggregated(boolean z11) {
        super.onVisibilityAggregated(z11);
        n nVar = this.f20869f;
        if (nVar != null) {
            nVar.setVisible(z11, false);
        }
    }

    @Override // o9.v2
    public void p(PointF pointF) {
        pointF.set(this.f20864a);
    }

    public final void q(float... fArr) {
        ObjectAnimator objectAnimator = this.f20880s;
        if (objectAnimator != null) {
            objectAnimator.cancel();
        }
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, f20863z, fArr);
        this.f20880s = objectAnimatorOfFloat;
        objectAnimatorOfFloat.addListener(new i0(this, 12));
        this.f20880s.setDuration(400L);
        this.f20880s.start();
    }

    public void r(mx.f fVar) {
        throw new IllegalStateException();
    }

    @Override // android.view.View
    public final void refreshDrawableState() {
        if (this.f20882u) {
            return;
        }
        super.refreshDrawableState();
    }

    @Override // android.view.View
    public final void requestLayout() {
        if (this.f20883v) {
            return;
        }
        super.requestLayout();
    }

    @Override // android.view.View
    public final void setAccessibilityDelegate(View.AccessibilityDelegate accessibilityDelegate) {
        if (accessibilityDelegate instanceof p9.e) {
            super.setAccessibilityDelegate(accessibilityDelegate);
        }
    }

    @Override // android.widget.TextView
    public final void setTextColor(int i5) {
        this.n = i5;
        super.setTextColor(I());
    }

    public void t(Drawable drawable) {
        this.f20883v = this.f20869f != null;
        int i5 = this.f20875l;
        drawable.setBounds(0, 0, i5, i5);
        if (this.f20873j) {
            setCompoundDrawablesRelative(drawable, null, null, null);
        } else {
            setCompoundDrawables(null, drawable, null, null);
        }
        n nVar = this.f20869f;
        if (nVar != null && (nVar instanceof aa.j0) && this.f20885x) {
            ((aa.j0) nVar).l(drawable);
        }
        this.f20883v = false;
    }

    public final void u(ga.e eVar, boolean z11) {
        if (this.f20869f != null) {
            boolean z12 = this.f20877p != null;
            d dVar = this.f20868e;
            a aVarW = dVar.w(eVar);
            this.f20877p = aVarW;
            boolean z13 = aVarW != null;
            float f11 = z13 ? 1.0f : 0.0f;
            this.f20878q = (g) dVar.P().i(this.f20875l);
            a aVar = this.f20877p;
            int iB = aVar != null ? aVar.b() : 0;
            a aVar2 = this.f20877p;
            e eVar2 = this.f20879r;
            if (aVar2 != null) {
                eVar2.f77313g = ((mz.f) aVar2).f77320e;
            } else {
                eVar2.f77313g = null;
            }
            invalidate();
            if (eVar2.f77312f != iB) {
                eVar2.f77312f = iB;
                invalidate();
            }
            if (z12 || z13) {
                if (z11 && (z13 ^ z12) && isShown()) {
                    q(f11);
                } else {
                    ObjectAnimator objectAnimator = this.f20880s;
                    if (objectAnimator != null) {
                        objectAnimator.cancel();
                    }
                    eVar2.f77309c = f11;
                    invalidate();
                }
            }
            S();
        }
    }

    public final void v(ga.a aVar) {
        y(aVar);
        setTag(aVar);
        U();
        if ((aVar.f57305s & 3072) != 0) {
            A();
        }
        u(aVar, false);
        M(aVar, aVar.f0());
    }

    public void w(j jVar) {
        x(jVar, false);
    }

    public void x(j jVar, boolean z11) {
        y(jVar);
        setTag(jVar);
        z(z11);
        u(jVar, false);
        M(jVar, jVar.f0());
    }

    public final void y(f fVar) {
        n nVarR0;
        Drawable drawableR0;
        boolean z11 = fVar instanceof s10.d;
        int i5 = this.f20871h;
        boolean z12 = true;
        if (z11 && fVar.f57303q.a()) {
            try {
                s10.d dVar = (s10.d) fVar;
                d0 d0Var = t1.c(getContext()).f80135d;
                int id2 = dVar.F.getId();
                BitmapInfo bitmapInfoM = (BitmapInfo) d0Var.C.get(Integer.valueOf(id2));
                if (bitmapInfoM == null && (bitmapInfoM = d0Var.N().M(fVar.f57307u, fVar.o, false, false)) != null) {
                    d0Var.C.put(Integer.valueOf(id2), bitmapInfoM);
                    Drawable drawableR02 = dVar.R0(getContext());
                    if (drawableR02 != null) {
                        d0Var.N().b(bitmapInfoM.f21151a, drawableR02);
                    }
                }
                nVarR0 = new n(bitmapInfoM);
            } catch (Exception e3) {
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("BubbleTextView");
                bVar.f(e3, "Error loading Branch icon for %s", fVar.f57300l);
                if (i5 != 0 && i5 != 2 && i5 != 5) {
                    z12 = false;
                }
                nVarR0 = fVar.r0(getContext(), z12);
            }
        } else {
            nVarR0 = fVar.r0(getContext(), i5 == 0 || i5 == 2 || i5 == 5);
            if ((fVar instanceof s10.d) && (drawableR0 = ((s10.d) fVar).R0(getContext())) != null) {
                d0 d0Var2 = t1.c(getContext()).f80135d;
                Bitmap bitmapCopy = nVarR0.g().copy(Bitmap.Config.ARGB_8888, true);
                d0Var2.N().b(bitmapCopy, drawableR0);
                nVarR0 = new n(bitmapCopy, 0, false);
            }
        }
        this.f20879r.a(fVar.i(), fVar.f57304r, this.f20868e.C().f90110m);
        O(nVarR0);
        setText(fVar.f57300l);
        if (fVar.f57301m != null) {
            setContentDescription(fVar.m() ? getContext().getString(2132017740, fVar.f57301m) : fVar.f57301m);
        }
    }

    public final void z(boolean z11) {
        z9.d dVarA;
        if (getTag() instanceof f) {
            j jVar = (j) getTag();
            if ((jVar.f57305s & 2048) != 0) {
                boolean z12 = jVar.f0() == 100;
                z9.d dVarA2 = A();
                if (dVarA2 == null || !z12) {
                    return;
                }
                dVarA2.l();
                return;
            }
            if ((jVar.N0() || (jVar.f57305s & 1024) != 0) && (dVarA = A()) != null && z11) {
                dVarA.l();
            }
        }
    }

    public BubbleTextView(Context context, AttributeSet attributeSet, int i5) {
        int dimensionPixelSize;
        super(context, attributeSet, 0);
        this.f20864a = new PointF(0.0f, 0.0f);
        this.f20865b = new PointF(0.0f, 0.0f);
        this.f20866c = new PointF(0.0f, 0.0f);
        this.f20867d = 1.0f;
        this.f20876m = true;
        this.o = 1.0f;
        this.f20883v = false;
        this.f20885x = false;
        d dVar = (d) d.p(context);
        this.f20868e = dVar;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80153b, 0, 0);
        this.f20873j = typedArrayObtainStyledAttributes.getBoolean(5, false);
        this.f20874k = getResources().getConfiguration().getLayoutDirection() == 1;
        j0 j0VarP = dVar.P();
        int integer = typedArrayObtainStyledAttributes.getInteger(3, 0);
        this.f20871h = integer;
        if (integer == 0) {
            setTextSize(0, j0VarP.E);
            setCompoundDrawablePadding(j0VarP.F);
            dimensionPixelSize = j0VarP.D;
            this.f20870g = j0VarP.f77159p;
        } else if (integer == 1) {
            setTextSize(0, j0VarP.f77148i0);
            setCompoundDrawablePadding(j0VarP.f77142f0);
            dimensionPixelSize = j0VarP.f77140e0;
        } else if (integer == 5) {
            dimensionPixelSize = j0VarP.f77140e0;
        } else if (integer == 2) {
            setTextSize(0, j0VarP.U);
            setCompoundDrawablePadding(j0VarP.V);
            dimensionPixelSize = j0VarP.T;
        } else {
            dimensionPixelSize = integer == 6 ? getResources().getDimensionPixelSize(2131166381) : integer == 7 ? getResources().getDimensionPixelSize(2131166382) : integer == 5 ? j0VarP.D : j0VarP.D;
        }
        this.f20875l = typedArrayObtainStyledAttributes.getDimensionPixelSize(4, dimensionPixelSize);
        this.f20886y = typedArrayObtainStyledAttributes.getResourceId(0, 0);
        typedArrayObtainStyledAttributes.recycle();
        this.f20872i = new a0(this, null, rz.a.f86497a);
        e eVar = new e();
        eVar.f77308b = new Rect();
        UInt.Companion companion = UInt.f71696b;
        eVar.f77314h = new v(-1, -16777216, -1, -1, -1);
        this.f20879r = eVar;
        setEllipsize(TextUtils.TruncateAt.END);
        setAccessibilityDelegate(dVar.z());
        P(1.0f);
    }

    @Override // android.widget.TextView
    public final void setTextColor(ColorStateList colorStateList) {
        this.n = colorStateList.getDefaultColor();
        if (Float.compare(this.o, 1.0f) == 0) {
            super.setTextColor(colorStateList);
        } else {
            super.setTextColor(I());
        }
    }
}
