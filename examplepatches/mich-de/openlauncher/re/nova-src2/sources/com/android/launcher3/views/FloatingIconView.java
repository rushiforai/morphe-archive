package com.android.launcher3.views;

import aa.g0;
import aa.n;
import ab.a;
import android.animation.Animator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.CancellationSignal;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.dragndrop.DragLayer;
import com.android.launcher3.shortcuts.DeepShortcutView;
import com.android.launcher3.views.FloatingIconView;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.util.NamedIntent;
import ga.e;
import ga.f;
import java.util.regex.Pattern;
import kl.q0;
import mx.c0;
import mx.j0;
import mx.k0;
import o9.g3;
import o9.k;
import o9.n1;
import o9.s0;
import s90.r0;
import x9.s;
import ya.j;
import za.l;
import za.p;
import za.q;
import za.r;

/* loaded from: classes2.dex */
public class FloatingIconView extends FrameLayout implements Animator.AnimatorListener, ViewTreeObserver.OnGlobalLayoutListener {
    public static p o;

    /* renamed from: p, reason: collision with root package name */
    public static long f21258p;

    /* renamed from: q, reason: collision with root package name */
    public static long f21259q;

    /* renamed from: r, reason: collision with root package name */
    public static final RectF f21260r = new RectF();

    /* renamed from: s, reason: collision with root package name */
    public static final Object[] f21261s = new Object[1];

    /* renamed from: a, reason: collision with root package name */
    public r0 f21262a;

    /* renamed from: b, reason: collision with root package name */
    public CancellationSignal f21263b;

    /* renamed from: c, reason: collision with root package name */
    public final NovaLauncher f21264c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f21265d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f21266e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f21267f;

    /* renamed from: g, reason: collision with root package name */
    public p f21268g;

    /* renamed from: h, reason: collision with root package name */
    public final ImageView f21269h;

    /* renamed from: i, reason: collision with root package name */
    public final l f21270i;

    /* renamed from: j, reason: collision with root package name */
    public Drawable f21271j;

    /* renamed from: k, reason: collision with root package name */
    public View f21272k;

    /* renamed from: l, reason: collision with root package name */
    public RectF f21273l;

    /* renamed from: m, reason: collision with root package name */
    public final Rect f21274m;
    public final r n;

    public FloatingIconView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.f21266e = false;
        this.f21274m = new Rect();
        q0 q0Var = n1.C0;
        this.f21264c = (NovaLauncher) k.Y(context);
        this.f21265d = g3.p(getResources());
        r rVar = new r(context, attributeSet);
        rVar.setVisibility(8);
        this.n = rVar;
        l lVar = new l(context, attributeSet);
        this.f21270i = lVar;
        ImageView imageView = new ImageView(context, attributeSet);
        this.f21269h = imageView;
        addView(imageView);
        addView(lVar);
        setWillNotDraw(false);
    }

    public static void a() {
        f21261s[0] = null;
    }

    public static p b(final NovaLauncher novaLauncher, final View view, final e eVar) {
        n nVarK;
        final RectF rectF = new RectF();
        c(novaLauncher, view, true, rectF, new Rect());
        if (view instanceof BubbleTextView) {
            BubbleTextView bubbleTextView = (BubbleTextView) view;
            nVarK = (!(eVar instanceof f) || (((f) eVar).f57305s & 3072) == 0) ? bubbleTextView.f20869f : bubbleTextView.K();
        } else {
            nVarK = null;
        }
        final n nVar = nVarK;
        if (nVar != null) {
            nVar.i();
        }
        final p pVar = new p(eVar);
        pVar.f98477b = nVar;
        final long j11 = f21258p;
        f21258p = 1 + j11;
        j.f97149d.f97215a.postAtFrontOfQueue(new Runnable() { // from class: za.o
            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Removed duplicated region for block: B:43:0x00a4  */
            /* JADX WARN: Removed duplicated region for block: B:44:0x00a6  */
            /* JADX WARN: Removed duplicated region for block: B:60:0x0114  */
            @Override // java.lang.Runnable
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public final void run() throws Resources.NotFoundException {
                Drawable drawableK;
                Drawable drawableH;
                Drawable drawableNewDrawable;
                Drawable drawableNewDrawable2;
                g0 g0VarW;
                NamedIntent namedIntent;
                long j12 = j11;
                NovaLauncher novaLauncher2 = novaLauncher;
                View view2 = view;
                ga.e eVar2 = eVar;
                RectF rectF2 = rectF;
                aa.n nVar2 = nVar;
                p pVar2 = pVar;
                if (j12 < FloatingIconView.f21259q) {
                    return;
                }
                int i5 = 0;
                boolean z11 = u9.b.f90693f.b() && !eVar2.m();
                if (eVar2 instanceof ga.c) {
                    ga.c cVar = (ga.c) eVar2;
                    if (cVar.f57303q.f() && (namedIntent = cVar.f57308v) != null && c0.c(namedIntent.f46369b) == c0.FIRST_ITEM_IN_FOLDER) {
                        eVar2 = (ga.e) cVar.H.get(0);
                    }
                }
                if (!(eVar2 instanceof ka.t)) {
                    if (nVar2 instanceof z9.d) {
                        drawableK = nVar2;
                    } else {
                        int iWidth = (int) rectF2.width();
                        int iHeight = (int) rectF2.height();
                        if (z11) {
                            Object[] objArr = FloatingIconView.f21261s;
                            Drawable drawableK2 = g3.k(novaLauncher2, eVar2, iWidth, iHeight, objArr);
                            if (drawableK2 instanceof AdaptiveIconDrawable) {
                                drawableH = g3.h(novaLauncher2, eVar2, objArr[0]);
                                drawableK = drawableK2;
                            }
                        } else if (!(view2 instanceof BubbleTextView)) {
                            drawableK = g3.k(novaLauncher2, eVar2, iWidth, iHeight, FloatingIconView.f21261s);
                        }
                        drawableK = nVar2;
                    }
                    drawableNewDrawable = drawableK != null ? null : drawableK.getConstantState().newDrawable();
                    if ((drawableNewDrawable instanceof AdaptiveIconDrawable) && !(drawableNewDrawable instanceof x9.s)) {
                        int dimensionPixelSize = novaLauncher2.getResources().getDimensionPixelSize(2131165314);
                        Rect rect = new Rect(0, 0, ((int) rectF2.width()) + dimensionPixelSize, ((int) rectF2.height()) + dimensionPixelSize);
                        int i11 = dimensionPixelSize / 2;
                        rect.inset(i11, i11);
                        g0VarW = g0.w(novaLauncher2);
                        try {
                            g3.t(((k0) g0VarW).f77191y.e(drawableNewDrawable), rect);
                            g0VarW.D();
                            rect.inset((int) (AdaptiveIconDrawable.getExtraInsetFraction() * (-rect.width())), (int) (AdaptiveIconDrawable.getExtraInsetFraction() * (-rect.height())));
                            i5 = rect.left;
                        } catch (Throwable th2) {
                            try {
                                g0VarW.D();
                            } catch (Throwable th3) {
                                th2.addSuppressed(th3);
                            }
                            throw th2;
                        }
                    }
                    synchronized (pVar2) {
                        if (nVar2 == null || drawableNewDrawable == nVar2) {
                            drawableNewDrawable2 = null;
                        } else {
                            try {
                                drawableNewDrawable2 = nVar2.getConstantState().newDrawable();
                            } catch (Throwable th4) {
                                throw th4;
                            }
                        }
                        pVar2.f98477b = drawableNewDrawable2;
                        pVar2.f98478c = drawableNewDrawable;
                        pVar2.f98479d = drawableH;
                        pVar2.f98480e = i5;
                        r0 r0Var = pVar2.f98481f;
                        if (r0Var != null) {
                            ya.j.f97147b.execute(r0Var);
                            pVar2.f98481f = null;
                        }
                        pVar2.f98482g = true;
                    }
                    return;
                }
                drawableK = view2 instanceof ImageView ? ((ImageView) view2).getDrawable() : view2 instanceof DeepShortcutView ? ((DeepShortcutView) view2).f21244c.getBackground() : view2.getBackground();
                drawableH = null;
                if (drawableK != null) {
                }
                if (drawableNewDrawable instanceof AdaptiveIconDrawable) {
                    int dimensionPixelSize2 = novaLauncher2.getResources().getDimensionPixelSize(2131165314);
                    Rect rect2 = new Rect(0, 0, ((int) rectF2.width()) + dimensionPixelSize2, ((int) rectF2.height()) + dimensionPixelSize2);
                    int i112 = dimensionPixelSize2 / 2;
                    rect2.inset(i112, i112);
                    g0VarW = g0.w(novaLauncher2);
                    g3.t(((k0) g0VarW).f77191y.e(drawableNewDrawable), rect2);
                    g0VarW.D();
                    rect2.inset((int) (AdaptiveIconDrawable.getExtraInsetFraction() * (-rect2.width())), (int) (AdaptiveIconDrawable.getExtraInsetFraction() * (-rect2.height())));
                    i5 = rect2.left;
                }
                synchronized (pVar2) {
                }
            }
        });
        o = pVar;
        return pVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0022 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:11:0x0023  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void c(n1 n1Var, View view, boolean z11, RectF rectF, Rect rect) {
        View view2;
        View view3;
        boolean z12 = !z11;
        if (!(view instanceof za.k)) {
            boolean z13 = view.getParent() instanceof DeepShortcutView;
            view2 = view;
            if (z13) {
                view3 = ((DeepShortcutView) view.getParent()).f21244c;
            }
            if (view2 != null) {
                return;
            }
            if (view2 instanceof BubbleTextView) {
                BubbleTextView bubbleTextView = (BubbleTextView) view2;
                bubbleTextView.H(bubbleTextView.f20875l, rect);
            } else {
                rect.set(0, 0, view2.getWidth(), view2.getHeight());
            }
            DragLayer dragLayer = n1Var.P;
            Pattern pattern = g3.f79846a;
            float[] fArr = {rect.left, rect.top, rect.right, rect.bottom};
            g3.i(view2, dragLayer, fArr, false, z12);
            rectF.set(Math.min(fArr[0], fArr[2]), Math.min(fArr[1], fArr[3]), Math.max(fArr[0], fArr[2]), Math.max(fArr[1], fArr[3]));
            return;
        }
        view3 = ((DeepShortcutView) ((za.k) view)).f21243b;
        z12 = false;
        view2 = view3;
        if (view2 != null) {
        }
    }

    public final void d() {
        setTranslationX(0.0f);
        setTranslationY(0.0f);
        setScaleX(1.0f);
        setScaleY(1.0f);
        setAlpha(1.0f);
        CancellationSignal cancellationSignal = this.f21263b;
        if (cancellationSignal != null) {
            cancellationSignal.cancel();
        }
        this.f21263b = null;
        this.f21262a = null;
        this.f21274m.setEmpty();
        this.f21273l = null;
        this.n.f98483c = null;
        this.f21272k = null;
        this.f21271j = null;
        f21261s[0] = null;
        f21259q = f21258p;
        this.f21268g = null;
        l lVar = this.f21270i;
        lVar.setBackground(null);
        lVar.f98453e = false;
        lVar.f98451c = null;
        lVar.f98452d = null;
        lVar.f98457i = null;
        lVar.f98460l.setEmpty();
        ValueAnimator valueAnimator = lVar.f98454f;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        lVar.f98454f = null;
        lVar.f98458j = 0.0f;
        lVar.f98459k.setEmpty();
        lVar.n = 0.0f;
        lVar.o.a();
        lVar.f98462p = 0.0f;
        lVar.f98461m.a();
        this.f21269h.setBackground(null);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        Drawable drawable = this.f21271j;
        if (drawable != null) {
            drawable.draw(canvas);
        }
    }

    public final void e(Drawable drawable, Drawable drawable2, Drawable drawable3, int i5) {
        s0 s0Var = (s0) getLayoutParams();
        this.f21271j = drawable2;
        boolean z11 = this.f21267f;
        boolean z12 = this.f21266e;
        NovaLauncher novaLauncher = this.f21264c;
        j0 j0Var = novaLauncher.f79934x;
        l lVar = this.f21270i;
        Rect rect = lVar.f98459k;
        Rect rect2 = lVar.f98455g;
        Rect rect3 = lVar.f98460l;
        boolean z13 = drawable instanceof AdaptiveIconDrawable;
        lVar.f98453e = z13;
        if (z13) {
            boolean z14 = drawable instanceof s;
            AdaptiveIconDrawable adaptiveIconDrawable = (AdaptiveIconDrawable) drawable;
            Drawable background = adaptiveIconDrawable.getBackground();
            if (background == null) {
                background = new ColorDrawable(0);
            }
            lVar.f98452d = background;
            Drawable foreground = adaptiveIconDrawable.getForeground();
            if (foreground == null) {
                foreground = new ColorDrawable(0);
            }
            lVar.f98451c = foreground;
            int i11 = ((ViewGroup.MarginLayoutParams) s0Var).height;
            int i12 = ((ViewGroup.MarginLayoutParams) s0Var).width;
            int i13 = lVar.f98449a / 2;
            rect3.set(0, 0, i12, i11);
            if (!z14) {
                int i14 = i5 - i13;
                rect3.inset(i14, i14);
            }
            lVar.f98451c.setBounds(rect3);
            lVar.f98452d.setBounds(rect3);
            rect2.set(0, 0, i12, i11);
            if (!z14) {
                g3.t(fz.r.f56352b, rect2);
            }
            if (z12) {
                ((ViewGroup.MarginLayoutParams) s0Var).width = (int) Math.max(((ViewGroup.MarginLayoutParams) s0Var).width, ((ViewGroup.MarginLayoutParams) s0Var).height * j0Var.o);
            } else {
                ((ViewGroup.MarginLayoutParams) s0Var).height = (int) Math.max(((ViewGroup.MarginLayoutParams) s0Var).height, ((ViewGroup.MarginLayoutParams) s0Var).width * j0Var.o);
            }
            int marginStart = lVar.f98450b ? (j0Var.f77151k - s0Var.getMarginStart()) - ((ViewGroup.MarginLayoutParams) s0Var).width : ((ViewGroup.MarginLayoutParams) s0Var).leftMargin;
            int i15 = ((ViewGroup.MarginLayoutParams) s0Var).topMargin;
            lVar.layout(marginStart, i15, ((ViewGroup.MarginLayoutParams) s0Var).width + marginStart, ((ViewGroup.MarginLayoutParams) s0Var).height + i15);
            float fMax = Math.max(((ViewGroup.MarginLayoutParams) s0Var).height / i11, ((ViewGroup.MarginLayoutParams) s0Var).width / i12);
            if (z11) {
                rect.set(0, 0, i12, i11);
                fMax = 1.0f;
            } else {
                rect.set(0, 0, ((ViewGroup.MarginLayoutParams) s0Var).width, ((ViewGroup.MarginLayoutParams) s0Var).height);
            }
            lVar.a(fMax, z12);
            lVar.f98456h.set(0, 0, ((ViewGroup.MarginLayoutParams) s0Var).width, ((ViewGroup.MarginLayoutParams) s0Var).height);
            lVar.setOutlineProvider(new a(lVar, 6));
            lVar.setClipToOutline(true);
        } else {
            lVar.setBackground(drawable);
            lVar.setClipToOutline(false);
        }
        lVar.invalidate();
        lVar.invalidateOutline();
        if (z13) {
            this.f21274m.set(0, 0, ((FrameLayout.LayoutParams) s0Var).width, ((FrameLayout.LayoutParams) s0Var).height);
            float f11 = novaLauncher.f79934x.o;
            if (this.f21266e) {
                ((FrameLayout.LayoutParams) s0Var).width = (int) Math.max(((FrameLayout.LayoutParams) s0Var).width, ((FrameLayout.LayoutParams) s0Var).height * f11);
            } else {
                ((FrameLayout.LayoutParams) s0Var).height = (int) Math.max(((FrameLayout.LayoutParams) s0Var).height, ((FrameLayout.LayoutParams) s0Var).width * f11);
            }
            setLayoutParams(s0Var);
            FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) lVar.getLayoutParams();
            int i16 = layoutParams.height;
            int i17 = layoutParams.width;
            layoutParams.width = ((FrameLayout.LayoutParams) s0Var).width;
            layoutParams.height = ((FrameLayout.LayoutParams) s0Var).height;
            lVar.setLayoutParams(layoutParams);
            Drawable drawable4 = this.f21271j;
            if (drawable4 != null) {
                drawable4.setBounds(0, 0, i17, i16);
            }
        }
        if (!this.f21267f) {
            this.f21269h.setBackground(drawable3);
        }
        invalidate();
    }

    public final void f(RectF rectF, s0 s0Var) {
        this.f21273l.set(rectF);
        s0Var.f80099a = true;
        ((FrameLayout.LayoutParams) s0Var).topMargin = Math.round(rectF.top);
        NovaLauncher novaLauncher = this.f21264c;
        boolean z11 = this.f21265d;
        if (z11) {
            s0Var.setMarginStart(Math.round(novaLauncher.f79934x.f77151k - rectF.right));
        } else {
            s0Var.setMarginStart(Math.round(rectF.left));
        }
        int marginStart = z11 ? (novaLauncher.f79934x.f77151k - s0Var.getMarginStart()) - ((FrameLayout.LayoutParams) s0Var).width : ((FrameLayout.LayoutParams) s0Var).leftMargin;
        int i5 = ((FrameLayout.LayoutParams) s0Var).topMargin;
        layout(marginStart, i5, ((FrameLayout.LayoutParams) s0Var).width + marginStart, ((FrameLayout.LayoutParams) s0Var).height + i5);
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        CancellationSignal cancellationSignal = this.f21263b;
        if (cancellationSignal != null) {
            cancellationSignal.cancel();
        }
        r0 r0Var = this.f21262a;
        if (r0Var != null) {
            r0Var.run();
            return;
        }
        ValueAnimator valueAnimator = this.f21270i.f98454f;
        if (valueAnimator != null) {
            valueAnimator.end();
        }
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationRepeat(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        View view;
        p pVar = this.f21268g;
        if ((pVar != null && pVar.f98482g) || (!this.f21267f && this.f21269h.getBackground() != null)) {
            setVisibility(0);
        }
        if (this.f21267f || (view = this.f21272k) == null) {
            return;
        }
        q.g(view, false);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.f21267f) {
            return;
        }
        getViewTreeObserver().addOnGlobalLayoutListener(this);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        getViewTreeObserver().removeOnGlobalLayoutListener(this);
        super.onDetachedFromWindow();
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public final void onGlobalLayout() {
        View view = this.f21272k;
        if (view == null || !view.isAttachedToWindow() || this.f21273l == null) {
            return;
        }
        View view2 = this.f21272k;
        boolean z11 = this.f21267f;
        Rect rect = new Rect();
        NovaLauncher novaLauncher = this.f21264c;
        RectF rectF = f21260r;
        c(novaLauncher, view2, z11, rectF, rect);
        rectF.offset(0.0f, 0.0f);
        if (rectF.equals(this.f21273l)) {
            return;
        }
        f(rectF, (s0) getLayoutParams());
    }
}
