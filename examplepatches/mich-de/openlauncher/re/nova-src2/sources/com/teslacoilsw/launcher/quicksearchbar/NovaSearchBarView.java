package com.teslacoilsw.launcher.quicksearchbar;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import b00.t;
import com.teslacoilsw.launcher.NovaLauncher;
import java.util.Iterator;
import java.util.List;
import kl.q0;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.math.MathKt;
import l10.a;
import l10.b;
import l10.h;
import l10.n;
import l10.q;
import l10.w;
import l10.x;
import mx.c0;
import o9.a0;
import o9.n1;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import s9.j;
import s9.k;
import w20.e;
import za.i;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0017\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/quicksearchbar/NovaSearchBarView;", "Landroid/view/ViewGroup;", "Lza/i;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public class NovaSearchBarView extends ViewGroup implements i {
    public static final /* synthetic */ int o = 0;

    /* renamed from: a, reason: collision with root package name */
    public a0 f46142a;

    /* renamed from: b, reason: collision with root package name */
    public final int f46143b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f46144c;

    /* renamed from: d, reason: collision with root package name */
    public int f46145d;

    /* renamed from: e, reason: collision with root package name */
    public int f46146e;

    /* renamed from: f, reason: collision with root package name */
    public int f46147f;

    /* renamed from: g, reason: collision with root package name */
    public int f46148g;

    /* renamed from: h, reason: collision with root package name */
    public w f46149h;

    /* renamed from: i, reason: collision with root package name */
    public w f46150i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f46151j;

    /* renamed from: k, reason: collision with root package name */
    public final t f46152k;

    /* renamed from: l, reason: collision with root package name */
    public final j f46153l;

    /* renamed from: m, reason: collision with root package name */
    public float f46154m;
    public boolean n;

    @JvmOverloads
    public NovaSearchBarView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 4, 0);
    }

    public static boolean c(w wVar, w wVar2) {
        return (wVar.f74464a.f74454a == wVar2.f74464a.f74454a && wVar.f74465b == wVar2.f74465b && Intrinsics.b(wVar.f74466c, wVar2.f74466c) && Intrinsics.b(wVar.f74467d, wVar2.f74467d)) ? false : true;
    }

    public static /* synthetic */ void f(NovaSearchBarView novaSearchBarView, w wVar, w wVar2, boolean z11, int i5) {
        if ((i5 & 2) != 0) {
            wVar2 = null;
        }
        if ((i5 & 4) != 0) {
            z11 = false;
        }
        novaSearchBarView.e(wVar, wVar2, z11, novaSearchBarView.f46144c);
    }

    public static void i(NovaSearchBarView novaSearchBarView, boolean z11, boolean z12, int i5) {
        if ((i5 & 1) != 0) {
            z11 = novaSearchBarView.f46151j;
        }
        if ((i5 & 2) != 0) {
            z12 = novaSearchBarView.isAttachedToWindow();
        }
        t tVar = novaSearchBarView.f46152k;
        novaSearchBarView.f46151j = z11;
        if (!z11 || !z12) {
            q.f74439a.b(tVar);
            return;
        }
        q qVar = q.f74439a;
        Context context = novaSearchBarView.getContext();
        synchronized (qVar) {
            q.n.add(tVar);
            q.c(context.getApplicationContext());
        }
    }

    @Override // za.i
    public final void a() {
        a0 a0Var = this.f46142a;
        if (a0Var == null || a0Var.f79747e || a0Var.f79749g || a0Var == null) {
            return;
        }
        a0Var.a();
    }

    public final h b() {
        View childAt = getChildAt(0);
        Intrinsics.e(childAt, "null cannot be cast to non-null type com.teslacoilsw.launcher.quicksearchbar.NovaSearchBarActionLayout");
        return (h) childAt;
    }

    @Override // android.view.View
    public final void cancelLongPress() {
        super.cancelLongPress();
        a0 a0Var = this.f46142a;
        if (a0Var != null) {
            a0Var.a();
        }
    }

    public final void d(int i5) {
        Object background = getBackground();
        a aVar = background instanceof a ? (a) background : null;
        if (aVar != null) {
            aVar.a(i5);
        }
        int childCount = getChildCount();
        for (int i11 = 0; i11 < childCount; i11++) {
            View childAt = getChildAt(i11);
            Intrinsics.e(childAt, "null cannot be cast to non-null type com.teslacoilsw.launcher.quicksearchbar.NovaSearchBarActionLayout");
            h hVar = (h) childAt;
            hVar.f74427j = i5;
            int childCount2 = hVar.getChildCount();
            for (int i12 = 0; i12 < childCount2; i12++) {
                View childAt2 = hVar.getChildAt(i12);
                b bVar = childAt2 instanceof b ? (b) childAt2 : null;
                Object drawable = bVar != null ? bVar.getDrawable() : null;
                a aVar2 = drawable instanceof a ? (a) drawable : null;
                if (aVar2 != null) {
                    aVar2.a(hVar.f74427j);
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x0094  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void e(w wVar, w wVar2, boolean z11, boolean z12) {
        Object next;
        boolean z13;
        w wVar3;
        w wVar4;
        n nVar;
        Object next2;
        n nVar2;
        List list;
        Object next3;
        List list2;
        Object next4;
        this.f46144c = z12;
        Iterator it = wVar.f74466c.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            } else {
                next = it.next();
                if (((n) next).f74437a == c0.ASSIST) {
                    break;
                }
            }
        }
        if (next != null) {
            z13 = true;
        } else {
            if (wVar2 == null || (list2 = wVar2.f74466c) == null) {
                nVar = null;
            } else {
                Iterator it2 = list2.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        next4 = null;
                        break;
                    } else {
                        next4 = it2.next();
                        if (((n) next4).f74437a == c0.ASSIST) {
                            break;
                        }
                    }
                }
                nVar = (n) next4;
            }
            if (nVar == null) {
                Iterator it3 = wVar.f74467d.iterator();
                while (true) {
                    if (!it3.hasNext()) {
                        next2 = null;
                        break;
                    } else {
                        next2 = it3.next();
                        if (((n) next2).f74437a == c0.ASSIST) {
                            break;
                        }
                    }
                }
                if (next2 == null) {
                    if (wVar2 == null || (list = wVar2.f74467d) == null) {
                        nVar2 = null;
                    } else {
                        Iterator it4 = list.iterator();
                        while (true) {
                            if (!it4.hasNext()) {
                                next3 = null;
                                break;
                            } else {
                                next3 = it4.next();
                                if (((n) next3).f74437a == c0.ASSIST) {
                                    break;
                                }
                            }
                        }
                        nVar2 = (n) next3;
                    }
                    if (nVar2 == null) {
                        z13 = false;
                    }
                }
            }
        }
        i(this, z13, false, 2);
        this.f46149h = wVar;
        this.f46150i = wVar2;
        setBackground(new x(getContext().getResources(), e.k(44), wVar.f74464a, wVar2 != null ? wVar2.f74464a : null));
        setElevation(0.0f);
        if (getChildCount() > 2) {
            removeAllViewsInLayout();
        }
        h hVar = (h) getChildAt(0);
        h hVar2 = (h) getChildAt(1);
        int i5 = this.f46143b;
        if (z11 || hVar == null || (wVar4 = hVar.f74426i) == null || c(wVar4, wVar)) {
            removeView(hVar);
            addView(new h(getContext(), wVar, i5, z12), 0);
        } else {
            hVar.f(wVar);
            hVar.e();
        }
        if (z11 || wVar2 == null || hVar2 == null || (wVar3 = hVar2.f74426i) == null || c(wVar3, wVar2)) {
            removeView(hVar2);
            if (wVar2 != null) {
                addView(new h(getContext(), wVar2, i5, false), 1);
            }
        } else {
            hVar2.f(wVar2);
            hVar2.e();
        }
        h hVarB = b();
        hVarB.f74419b = this.f46147f;
        hVarB.requestLayout();
        View childAt = getChildAt(1);
        h hVar3 = childAt instanceof h ? (h) childAt : null;
        if (hVar3 != null) {
            hVar3.f74419b = this.f46148g;
            hVar3.requestLayout();
        }
        g(this.f46154m);
        invalidate();
    }

    public final void g(float f11) {
        float f12;
        float f13;
        boolean z11;
        int i5;
        int i11;
        boolean z12;
        this.f46154m = f11;
        x xVar = (x) getBackground();
        if (xVar != null) {
            l10.t tVar = xVar.f74469b;
            l10.t tVar2 = xVar.f74470c;
            float fD0 = kotlin.ranges.a.d0(f11, 0.0f, 1.0f);
            if (fD0 != xVar.f74489x) {
                xVar.f74489x = fD0;
                if (tVar2 != null && !tVar2.equals(tVar)) {
                    float f14 = 1.0f - f11;
                    xVar.f74475h = ((tVar2.f74457d * f14) + (tVar.f74457d * f11)) * (xVar.f74468a / 2.0f);
                    Object objEvaluate = k.f86807v.evaluate(k.f86798k.getInterpolation(f14), Integer.valueOf(tVar.f74456c), Integer.valueOf(tVar2.f74456c));
                    Intrinsics.e(objEvaluate, "null cannot be cast to non-null type kotlin.Int");
                    int iIntValue = ((Integer) objEvaluate).intValue();
                    boolean z13 = (f11 >= 0.5f && tVar.f74454a) || (f14 >= 0.5f && tVar2.f74454a);
                    boolean z14 = (f11 >= 0.5f && tVar.f74455b) || (f14 >= 0.5f && tVar2.f74455b);
                    if (iIntValue == xVar.f74484s && z13 == xVar.f74485t && z14 == xVar.f74486u && xVar.f74475h == xVar.f74487v) {
                        i5 = iIntValue;
                        z11 = z13;
                    } else {
                        boolean z15 = z13;
                        Bitmap bitmapB = xVar.b(z15, xVar.f74473f, xVar.f74474g, iIntValue, z14 ? 25 : 0, xVar.f74476i);
                        z11 = z15;
                        i5 = iIntValue;
                        xVar.f74476i = bitmapB;
                        xVar.f74484s = i5;
                        xVar.f74485t = z11;
                        xVar.f74486u = z14;
                        xVar.f74487v = xVar.f74475h;
                    }
                    if (Boolean.valueOf(z11).equals(xVar.f74488w)) {
                        i11 = i5;
                        z12 = z11;
                    } else {
                        int i12 = i5;
                        z12 = z11;
                        i11 = i12;
                        xVar.f74479l = xVar.b(z12, xVar.f74477j, xVar.f74478k, 0, 45, xVar.f74479l);
                        xVar.f74488w = Boolean.valueOf(z12);
                    }
                    xVar.o = z12;
                    xVar.f74481p = i11;
                    xVar.invalidateSelf();
                }
            }
        }
        if (getChildCount() < 2) {
            return;
        }
        Object parent = getParent();
        View view = parent instanceof View ? (View) parent : null;
        if (view != null) {
            view.invalidate();
        }
        View childAt = getChildAt(0);
        Intrinsics.e(childAt, "null cannot be cast to non-null type com.teslacoilsw.launcher.quicksearchbar.NovaSearchBarActionLayout");
        h hVar = (h) childAt;
        View childAt2 = getChildAt(1);
        Intrinsics.e(childAt2, "null cannot be cast to non-null type com.teslacoilsw.launcher.quicksearchbar.NovaSearchBarActionLayout");
        h hVar2 = (h) childAt2;
        if (Intrinsics.b(hVar.f74426i.f74466c, hVar2.f74426i.f74466c) && Intrinsics.b(hVar.f74426i.f74467d, hVar2.f74426i.f74467d)) {
            hVar.setVisibility(f11 >= 0.5f ? 0 : 4);
            hVar2.setVisibility(f11 >= 0.5f ? 4 : 0);
        } else {
            if (f11 > 0.5f) {
                hVar.setElevation(1.0f);
                hVar2.setElevation(0.0f);
                f13 = (1.0f - f11) * 2.0f;
                f12 = 1.0f;
            } else {
                hVar.setElevation(0.0f);
                hVar2.setElevation(1.0f);
                f12 = f11 * 2.0f;
                f13 = 1.0f;
            }
            hVar.setVisibility(((double) f12) <= 0.01d ? 4 : 0);
            hVar.setAlpha(f12);
            hVar2.setVisibility(((double) f13) <= 0.01d ? 4 : 0);
            hVar2.setAlpha(f13);
        }
        j jVar = this.f46153l;
        int iB = MathKt.b((jVar.getInterpolation(f11) * this.f46147f) + (jVar.getInterpolation(1.0f - f11) * this.f46148g));
        Drawable background = getBackground();
        Intrinsics.e(background, "null cannot be cast to non-null type com.teslacoilsw.launcher.quicksearchbar.QsbDrawable");
        ((x) background).f74471d = iB;
        b().g(iB);
        View childAt3 = getChildAt(1);
        h hVar3 = childAt3 instanceof h ? (h) childAt3 : null;
        if (hVar3 != null) {
            hVar3.g(iB);
        }
        invalidate();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        i(this, false, true, 1);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        i(this, false, false, 1);
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        a0 a0Var;
        if (motionEvent.getAction() == 0 || motionEvent.getAction() == 1 || motionEvent.getAction() == 3) {
            this.n = false;
        }
        if (motionEvent.getAction() == 0) {
            Context context = getContext();
            q0 q0Var = n1.C0;
            ((NovaLauncher) o9.k.Y(context)).P.f98444k = this;
        }
        if (!this.n && (a0Var = this.f46142a) != null) {
            a0Var.b(motionEvent);
        }
        return super.onInterceptTouchEvent(motionEvent);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int childCount = getChildCount();
        for (int i14 = 0; i14 < childCount; i14++) {
            getChildAt(i14).layout(0, 0, getMeasuredWidth(), getMeasuredHeight());
        }
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        int childCount = getChildCount();
        for (int i12 = 0; i12 < childCount; i12++) {
            getChildAt(i12).measure(i5, i11);
        }
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        a0 a0Var = this.f46142a;
        if (a0Var == null) {
            return true;
        }
        a0Var.b(motionEvent);
        return true;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestDisallowInterceptTouchEvent(boolean z11) {
        a0 a0Var;
        this.n = z11;
        if (z11 && (a0Var = this.f46142a) != null) {
            a0Var.a();
        }
        super.requestDisallowInterceptTouchEvent(z11);
    }

    public /* synthetic */ NovaSearchBarView(Context context, AttributeSet attributeSet, int i5, int i11) {
        this(context, (i5 & 2) != 0 ? null : attributeSet, 0);
    }

    public NovaSearchBarView(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, 0);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.D);
        int i11 = typedArrayObtainStyledAttributes.getInt(0, 0);
        typedArrayObtainStyledAttributes.recycle();
        this.f46143b = i11;
        w.Companion.getClass();
        this.f46149h = w.f74463g;
        this.f46152k = new t(this, 22);
        this.f46153l = k.a(k.f86788a, 0.4f, 0.6f);
        this.f46154m = 1.0f;
    }
}
