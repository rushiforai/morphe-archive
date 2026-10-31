package com.android.launcher3.dragndrop;

import a5.d0;
import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.animation.TypeEvaluator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.util.Property;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.Interpolator;
import androidx.annotation.Keep;
import bh.g;
import ca.a;
import com.android.launcher3.DropTargetBar;
import com.android.launcher3.Workspace;
import com.android.launcher3.dragndrop.DragLayer;
import com.android.launcher3.folder.Folder;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import cz.c;
import e10.y2;
import java.util.ArrayList;
import java.util.regex.Pattern;
import o9.b3;
import o9.g3;
import o9.n1;
import o9.p1;
import o9.t0;
import o9.v;
import s9.k;
import s9.m;
import ua.b;
import ua.i;
import x7.f;
import x9.n;
import x9.p;
import x9.t;
import x9.u;
import ya.k0;
import z9.e;
import za.d;
import za.j;

/* loaded from: classes.dex */
public class DragLayer extends j {
    public static final /* synthetic */ int E = 0;
    public final Paint A;
    public float B;
    public final Point C;
    public int D;

    /* renamed from: p, reason: collision with root package name */
    public t f21081p;

    /* renamed from: q, reason: collision with root package name */
    public Animator f21082q;

    /* renamed from: r, reason: collision with root package name */
    public n f21083r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f21084s;

    /* renamed from: t, reason: collision with root package name */
    public int f21085t;

    /* renamed from: u, reason: collision with root package name */
    public int f21086u;

    /* renamed from: v, reason: collision with root package name */
    public final a f21087v;

    /* renamed from: w, reason: collision with root package name */
    public e f21088w;

    /* renamed from: x, reason: collision with root package name */
    public int f21089x;

    /* renamed from: y, reason: collision with root package name */
    public float f21090y;

    /* renamed from: z, reason: collision with root package name */
    public final qz.a f21091z;

    public DragLayer(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 3);
        this.f21082q = null;
        this.f21083r = null;
        this.f21084s = false;
        this.f21086u = -1;
        this.f21089x = 0;
        this.f21090y = 0.0f;
        this.f21091z = new qz.a(this);
        this.A = new Paint(1);
        this.B = 0.0f;
        this.C = new Point();
        this.D = -65536;
        setMotionEventSplittingEnabled(false);
        setChildrenDrawingOrderEnabled(true);
        this.f21087v = new a((View) this);
    }

    @Override // za.j, android.view.ViewGroup, android.view.View
    public final void addChildrenForAccessibility(ArrayList arrayList) {
        Object obj = this.f98440g;
        o9.a aVarP = o9.a.P((d) obj, 7470271);
        if (aVarP == null) {
            super.addChildrenForAccessibility(arrayList);
            return;
        }
        if (aVarP.isImportantForAccessibility()) {
            arrayList.add(aVarP);
        } else {
            aVarP.addChildrenForAccessibility(arrayList);
        }
        if (((n1) obj).f80004e0.f82474c != null) {
            DropTargetBar dropTargetBar = ((n1) obj).U;
            if (dropTargetBar.isImportantForAccessibility()) {
                arrayList.add(dropTargetBar);
            } else {
                dropTargetBar.addChildrenForAccessibility(arrayList);
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void bringChildToFront(View view) {
        super.bringChildToFront(view);
        t();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        Workspace workspace = ((n1) this.f98440g).O;
        workspace.getClass();
        y2.f51877a.getClass();
        if (((Boolean) y2.B1().l()).booleanValue() && workspace.f21002j1 != null && workspace.getMeasuredWidth() > 0) {
            if (workspace.f21002j1.getBitmap().isRecycled()) {
                workspace.T0();
            }
            float intrinsicWidth = workspace.C0.f97198c.f97186c * (workspace.f21002j1.getIntrinsicWidth() - workspace.getMeasuredWidth());
            Paint paint = workspace.i1;
            Rect rect = workspace.Z0;
            Rect rect2 = workspace.f20991a1;
            int intrinsicWidth2 = workspace.f21002j1.getIntrinsicWidth();
            int intrinsicHeight = workspace.f21002j1.getIntrinsicHeight();
            float fMin = Math.min(1.0f, Math.min(intrinsicWidth2 / workspace.getMeasuredWidth(), intrinsicHeight / workspace.getMeasuredHeight()));
            int iO = f.O(intrinsicWidth);
            int measuredWidth = (int) ((workspace.getMeasuredWidth() * fMin) + iO);
            int iMin = Math.min(f.O(fMin * workspace.getMeasuredHeight()), intrinsicHeight);
            int iMax = Math.max(0, (intrinsicHeight / 2) - (iMin / 2));
            rect.set(iO, iMax, measuredWidth, iMin + iMax);
            rect2.set(0, 0, workspace.getMeasuredWidth(), workspace.getMeasuredHeight());
            canvas.drawBitmap(workspace.f21002j1.getBitmap(), rect, rect2, paint);
        }
        canvas.drawColor(this.f21088w.a());
        this.f21087v.b(canvas);
        super.dispatchDraw(canvas);
        if (this.B > 0.0f) {
            int i5 = this.D;
            Paint paint2 = this.A;
            paint2.setColor(i5);
            int measuredWidth2 = getMeasuredWidth();
            Point point = this.C;
            int iMax2 = Math.max(Math.max(measuredWidth2 - point.x, 0), point.x);
            int iMax3 = Math.max(Math.max(getMeasuredHeight() - point.y, 0), point.y);
            canvas.drawCircle(point.x, point.y, (float) (Math.sqrt((iMax3 * iMax3) + (iMax2 * iMax2)) * this.B), paint2);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return this.f21081p.f95708d != null || super.dispatchKeyEvent(keyEvent);
    }

    @Override // za.j, android.view.ViewGroup, android.view.View
    public final boolean dispatchTouchEvent(MotionEvent motionEvent) {
        float f11 = this.B;
        if (f11 > 0.0f && f11 < 1.0f) {
            return true;
        }
        motionEvent.offsetLocation(getTranslationX(), 0.0f);
        try {
            super.dispatchTouchEvent(motionEvent);
            return true;
        } finally {
            motionEvent.offsetLocation(-getTranslationX(), 0.0f);
        }
    }

    @Override // android.view.ViewGroup
    public final boolean drawChild(Canvas canvas, View view, long j11) {
        int iSave;
        qz.a aVar = this.f21091z;
        aVar.getClass();
        if (view instanceof AppSearchResultsView) {
            canvas.drawColor(aVar.a());
        }
        if (this.f21090y == 0.0f || indexOfChild(view) > 7) {
            iSave = 0;
        } else {
            iSave = canvas.save();
            canvas.translate(this.f21090y, 0.0f);
        }
        boolean zDrawChild = super.drawChild(canvas, view, j11);
        if (iSave > 0) {
            canvas.restore();
        }
        return zDrawChild;
    }

    @Override // android.view.ViewGroup
    public final int getChildDrawingOrder(int i5, int i11) {
        if (this.f21086u != i5) {
            t();
        }
        int i12 = this.f21085t;
        if (i12 != -1) {
            if (i11 == i5 - 1) {
                return i12;
            }
            if (i11 >= i12) {
                return i11 + 1;
            }
        }
        return i11;
    }

    @Keep
    public float getCircleActivityAnimationProgress() {
        return this.B;
    }

    @Override // com.android.launcher3.InsettableFrameLayout, o9.r0
    public final void h(Rect rect) {
        int i5 = rect.bottom;
        super.h(rect);
    }

    @Override // za.j
    public final void n() {
        NovaLauncher novaLauncher = (NovaLauncher) ((n1) this.f98440g);
        t tVar = novaLauncher.Q;
        c cVar = new c(novaLauncher);
        cz.d dVar = new cz.d(novaLauncher);
        b bVar = new b(novaLauncher);
        cz.b bVar2 = new cz.b();
        bVar2.f48575c = novaLauncher;
        bVar2.f48576d = new i(novaLauncher, bVar2, i.f90767x);
        bVar2.f48574b = g.N(novaLauncher.getResources().getDisplayMetrics(), 24);
        this.f98442i = new k0[]{tVar, cVar, dVar, bVar, bVar2};
    }

    public final void o(n nVar, Rect rect, float f11, float f12, float f13, int i5, Interpolator interpolator, Runnable runnable, int i11, final View view) {
        int iMax;
        ValueAnimator valueAnimator = nVar.f95684r;
        if (valueAnimator != null && valueAnimator.isRunning()) {
            valueAnimator.cancel();
        }
        nVar.requestLayout();
        int[] iArr = {i, i};
        getLocationInWindow(iArr);
        int i12 = iArr[0];
        int i13 = iArr[1];
        nVar.getLocationInWindow(iArr);
        int i14 = iArr[0] - i12;
        int i15 = iArr[1] - i13;
        float fHypot = (float) Math.hypot(rect.left - i14, rect.top - i15);
        Resources resources = getResources();
        float integer = resources.getInteger(2131492873);
        if (i5 < 0) {
            int integer2 = resources.getInteger(2131492874);
            if (fHypot < integer) {
                integer2 = (int) (k.f86793f.getInterpolation(fHypot / integer) * integer2);
            }
            iMax = Math.max(integer2, resources.getInteger(2131492875));
        } else {
            iMax = i5;
        }
        Interpolator interpolator2 = interpolator == null ? k.f86793f : interpolator;
        m mVar = new m(iMax);
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(nVar, (Property<n, Float>) View.SCALE_X, f12);
        objectAnimatorOfFloat.setInterpolator(interpolator2);
        mVar.e(objectAnimatorOfFloat);
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(nVar, (Property<n, Float>) View.SCALE_Y, f13);
        objectAnimatorOfFloat2.setInterpolator(interpolator2);
        mVar.e(objectAnimatorOfFloat2);
        mVar.c(nVar, f11, interpolator2);
        mVar.a(nVar, p1.f80066e, rect.top, interpolator2);
        ObjectAnimator objectAnimatorOfFloat3 = ObjectAnimator.ofFloat(nVar, p1.f80065d, rect.left);
        if (view != null) {
            final int scrollX = view.getScrollX();
            objectAnimatorOfFloat3.setEvaluator(new TypeEvaluator() { // from class: x9.f
                @Override // android.animation.TypeEvaluator
                public final Object evaluate(float f14, Object obj, Object obj2) {
                    int i16 = DragLayer.E;
                    float fFloatValue = ((Float) obj).floatValue();
                    float fFloatValue2 = ((Float) obj2).floatValue();
                    Pattern pattern = g3.f79846a;
                    return Float.valueOf((view.getScaleX() * (scrollX - r3.getScrollX())) + a2.c.a(fFloatValue2, fFloatValue, f14, fFloatValue));
                }
            });
        }
        objectAnimatorOfFloat3.setInterpolator(interpolator2);
        mVar.e(objectAnimatorOfFloat3);
        if (runnable != null) {
            mVar.f86812c.addListener(new t0(runnable, 1));
        }
        s(nVar, mVar.f(), i11);
    }

    @Override // android.view.View
    public final boolean onHoverEvent(MotionEvent motionEvent) {
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x008f  */
    @Override // android.view.ViewGroup
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onInterceptHoverEvent(MotionEvent motionEvent) {
        Object obj = this.f98440g;
        if (obj != null && ((n1) obj).O != null) {
            o9.a aVarP = o9.a.P((d) obj, 7471103);
            if ((aVarP instanceof Folder) && ((AccessibilityManager) getContext().getSystemService("accessibility")).isTouchExplorationEnabled()) {
                Folder folder = (Folder) aVarP;
                int action = motionEvent.getAction();
                if (action != 7) {
                    if (action == 9) {
                        if (!m(aVarP, motionEvent)) {
                            n1 n1Var = (n1) obj;
                            if (n1Var.f80004e0.f82474c == null || !m(n1Var.U, motionEvent)) {
                                ps.f.o(this, 8, getContext().getString(folder.I ? 2132017911 : 2132017910));
                                this.f21084s = true;
                                return true;
                            }
                        }
                        this.f21084s = false;
                        return false;
                    }
                } else if (!m(aVarP, motionEvent)) {
                    n1 n1Var2 = (n1) obj;
                    boolean z11 = n1Var2.f80004e0.f82474c != null && m(n1Var2.U, motionEvent);
                    if (!z11 && !this.f21084s) {
                        ps.f.o(this, 8, getContext().getString(folder.I ? 2132017911 : 2132017910));
                        this.f21084s = true;
                        return true;
                    }
                    if (!z11) {
                        return true;
                    }
                    this.f21084s = false;
                }
            }
        }
        return false;
    }

    @Override // za.j, android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0 || motionEvent.getAction() == 3) {
            this.f21089x = 0;
        }
        return super.onInterceptTouchEvent(motionEvent);
    }

    @Override // za.j, android.view.ViewGroup
    public final boolean onRequestSendAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        if (((n1) this.f98440g).f80004e0.f82474c == null || !(view instanceof DropTargetBar)) {
            return super.onRequestSendAccessibilityEvent(view, accessibilityEvent);
        }
        return true;
    }

    @Override // com.android.launcher3.InsettableFrameLayout, android.view.ViewGroup
    public final void onViewAdded(View view) {
        super.onViewAdded(view);
        t();
        ((n1) this.f98440g).getClass();
    }

    @Override // za.j, android.view.ViewGroup
    public final void onViewRemoved(View view) {
        super.onViewRemoved(view);
        t();
        ((n1) this.f98440g).getClass();
    }

    public final void p(n nVar, int i5, int i11, float f11, float f12, float f13, Runnable runnable, int i12, int i13, View view) {
        o(nVar, new Rect(i5, i11, nVar.getMeasuredWidth() + i5, nVar.getMeasuredHeight() + i11), f11, f12, f13, i13, null, runnable, i12, view);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void q(u uVar, View view, int i5, Workspace workspace) {
        float fWidth;
        b3 b3Var = (b3) view.getParent();
        if (b3Var == null) {
            if (uVar == null || uVar.getParent() == null) {
                return;
            }
            uVar.f95682p.removeView(uVar);
            return;
        }
        v vVar = (v) view.getLayoutParams();
        b3Var.d(view);
        b3Var.c(view);
        float scaleX = view.getScaleX();
        float f11 = 1.0f - scaleX;
        float[] fArr = {((view.getMeasuredWidth() * f11) / 2.0f) + vVar.f80186j, ((view.getMeasuredHeight() * f11) / 2.0f) + vVar.f80187k};
        float fI = g3.i((View) view.getParent(), this, fArr, false, false) * scaleX;
        int iRound = Math.round(fArr[0]);
        int iRound2 = Math.round(fArr[1]);
        if (view instanceof p) {
            ((p) view).d(new Rect());
            int measuredWidth = uVar.getMeasuredWidth();
            fWidth = ((r7.width() * 1.0f) / (measuredWidth - r11)) * fI;
            float f12 = 1.0f - fWidth;
            float f13 = (uVar.f95675g * fWidth) / 2.0f;
            iRound = (int) ((((r7.left * fI) - f13) - ((uVar.getMeasuredWidth() * f12) / 2.0f)) + iRound);
            iRound2 = (int) ((((fI * r7.top) - f13) - ((uVar.getMeasuredHeight() * f12) / 2.0f)) + iRound2);
        } else {
            fWidth = fI;
        }
        view.setVisibility(4);
        p(uVar, iRound, iRound2, 1.0f, fWidth, fWidth, new d0(view, 4), 0, i5, workspace);
    }

    public final void r() {
        Animator animator = this.f21082q;
        if (animator != null) {
            animator.cancel();
        }
        this.f21082q = null;
        n nVar = this.f21083r;
        if (nVar != null) {
            t tVar = this.f21081p;
            tVar.getClass();
            if (nVar.getParent() != null) {
                nVar.f95682p.removeView(nVar);
            }
            if (tVar.f95713i.f79959k) {
                tVar.b();
            }
        }
        this.f21083r = null;
        invalidate();
    }

    public final void s(n nVar, Animator animator, int i5) {
        Animator animator2 = this.f21082q;
        if (animator2 != null) {
            animator2.cancel();
        }
        this.f21083r = nVar;
        this.f21082q = animator;
        final int i11 = 0;
        animator.addListener(new t0(new Runnable(this) { // from class: x9.g

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ DragLayer f95647b;

            {
                this.f95647b = this;
            }

            @Override // java.lang.Runnable
            public final void run() {
                switch (i11) {
                    case 0:
                        this.f95647b.f21082q = null;
                        break;
                    default:
                        this.f95647b.r();
                        break;
                }
            }
        }, 1));
        if (i5 == 0) {
            final int i12 = 1;
            this.f21082q.addListener(new t0(new Runnable(this) { // from class: x9.g

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ DragLayer f95647b;

                {
                    this.f95647b = this;
                }

                @Override // java.lang.Runnable
                public final void run() {
                    switch (i12) {
                        case 0:
                            this.f95647b.f21082q = null;
                            break;
                        default:
                            this.f95647b.r();
                            break;
                    }
                }
            }, 1));
        }
        this.f21082q.start();
    }

    @Keep
    public void setCircleActivityAnimationAlpha(int i5) {
        if (Color.alpha(this.D) != i5) {
            this.D = r4.a.n(this.D, i5);
            invalidate();
        }
    }

    @Keep
    public void setCircleActivityAnimationProgress(float f11) {
        if (f11 != this.B) {
            this.B = f11;
            invalidate();
        }
    }

    public final void t() {
        this.f21085t = -1;
        int childCount = getChildCount();
        int i5 = 0;
        while (true) {
            if (i5 >= childCount) {
                break;
            }
            View childAt = getChildAt(i5);
            if (childAt instanceof n) {
                this.f21085t = i5;
            } else if (childAt instanceof ka.c) {
                this.f21085t = -1;
                break;
            }
            i5++;
        }
        this.f21086u = childCount;
    }
}
