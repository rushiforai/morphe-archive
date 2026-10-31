package com.android.launcher3.allapps;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Point;
import android.graphics.Rect;
import android.util.ArrayMap;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import androidx.compose.ui.node.LayoutNode;
import com.android.systemui.plugins.AllAppsRow;
import com.android.systemui.plugins.Plugin;
import com.android.systemui.plugins.PluginListener;
import com.teslacoilsw.launcher.launcher3.allapps.NovaSlidingTabStrip;
import com.teslacoilsw.launcher.launcher3.allapps.NovaSlidingTabStripTabs;
import e10.c0;
import e10.d0;
import e10.y2;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import kz.a;
import lx.e;
import mx.j0;
import o9.k;
import o9.m;
import o9.r0;
import q9.v;
import q9.w;
import q9.x;
import u9.b;

/* loaded from: classes.dex */
public class FloatingHeaderView extends LinearLayout implements ValueAnimator.AnimatorUpdateListener, PluginListener<AllAppsRow>, r0, AllAppsRow.OnHeightUpdatedListener {

    /* renamed from: u, reason: collision with root package name */
    public static final /* synthetic */ int f21053u = 0;

    /* renamed from: a, reason: collision with root package name */
    public final Rect f21054a;

    /* renamed from: b, reason: collision with root package name */
    public final ValueAnimator f21055b;

    /* renamed from: c, reason: collision with root package name */
    public final Point f21056c;

    /* renamed from: d, reason: collision with root package name */
    public final w f21057d;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayMap f21058e;

    /* renamed from: f, reason: collision with root package name */
    public NovaSlidingTabStrip f21059f;

    /* renamed from: g, reason: collision with root package name */
    public m f21060g;

    /* renamed from: h, reason: collision with root package name */
    public int f21061h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f21062i;

    /* renamed from: j, reason: collision with root package name */
    public ViewGroup f21063j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f21064k;

    /* renamed from: l, reason: collision with root package name */
    public int f21065l;

    /* renamed from: m, reason: collision with root package name */
    public int f21066m;
    public boolean n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public int f21067p;

    /* renamed from: q, reason: collision with root package name */
    public int f21068q;

    /* renamed from: r, reason: collision with root package name */
    public v[] f21069r;

    /* renamed from: s, reason: collision with root package name */
    public v[] f21070s;

    /* renamed from: t, reason: collision with root package name */
    public final ArrayList f21071t;

    public FloatingHeaderView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f21054a = new Rect(0, 0, LayoutNode.NotPlacedPlaceOrder, LayoutNode.NotPlacedPlaceOrder);
        this.f21055b = ValueAnimator.ofInt(0, 0);
        this.f21056c = new Point();
        this.f21057d = new w(this, 0);
        this.f21058e = new ArrayMap();
        this.f21068q = 0;
        v[] vVarArr = v.f83896ip;
        this.f21069r = vVarArr;
        this.f21070s = vVarArr;
        this.f21071t = new ArrayList();
        this.f21061h = context.getResources().getDimensionPixelSize(2131165282);
        this.f21062i = context.getResources().getBoolean(2131034116);
    }

    public final void a() {
        int i5 = this.f21066m;
        int iMax = Math.max(i5, -this.f21067p);
        this.f21066m = iMax;
        if (i5 < iMax - this.f21061h) {
            for (v vVar : this.f21070s) {
                vVar.c(0, true);
            }
        } else {
            for (v vVar2 : this.f21070s) {
                vVar2.c(i5, false);
            }
        }
        if (indexOfChild(this.f21059f) >= 0) {
            this.f21059f.setTranslationY(this.f21066m);
        }
        getPaddingBottom();
        int i11 = this.f21067p + this.f21066m;
        Rect rect = this.f21054a;
        rect.top = i11;
        ArrayList arrayList = this.f21071t;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            ((a) arrayList.get(size)).setClipBounds(rect);
        }
    }

    public final void b(Point point) {
        point.x = (getLeft() - this.f21060g.getLeft()) - this.f21063j.getLeft();
        point.y = (getTop() - this.f21060g.getTop()) - this.f21063j.getTop();
    }

    public final v c(Class cls) {
        for (v vVar : this.f21070s) {
            if (vVar.d() == cls) {
                return vVar;
            }
        }
        return null;
    }

    public final int d() {
        int i5 = this.f21067p;
        return (i5 == 0 && this.o) ? getResources().getDimensionPixelSize(2131165289) : (i5 <= 0 || !this.o) ? i5 : getPaddingTop() + i5;
    }

    public final int e() {
        if (this.f21062i && !this.o && this.f21064k) {
            return Math.max(getHeight() + this.f21066m, 0) + 500;
        }
        return 0;
    }

    public final void f() {
        ArrayMap arrayMap = this.f21058e;
        int size = arrayMap.size();
        if (size == 0) {
            this.f21070s = this.f21069r;
            return;
        }
        int length = this.f21069r.length;
        this.f21070s = new v[size + length];
        for (int i5 = 0; i5 < length; i5++) {
            this.f21070s[i5] = this.f21069r[i5];
        }
        Iterator it = arrayMap.values().iterator();
        while (it.hasNext()) {
            this.f21070s[length] = (x) it.next();
            length++;
        }
    }

    public final void g(boolean z11) {
        ValueAnimator valueAnimator = this.f21055b;
        if (valueAnimator.isStarted()) {
            valueAnimator.cancel();
        }
        if (this.f21064k) {
            return;
        }
        if (z11) {
            valueAnimator.setIntValues(this.f21066m, 0);
            valueAnimator.addUpdateListener(this);
            valueAnimator.setDuration(150L);
            valueAnimator.start();
        } else {
            this.f21066m = 0;
            if (isAttachedToWindow()) {
                a();
            }
        }
        this.f21064k = false;
        this.f21065l = -this.f21067p;
        this.f21060g.n();
    }

    @Override // android.view.ViewGroup
    public final View getFocusedChild() {
        if (!b.f90694g.f90687d) {
            return super.getFocusedChild();
        }
        for (v vVar : this.f21070s) {
            if (vVar.getF46270i() && vVar.e()) {
                return vVar.getFocusedChild();
            }
        }
        return null;
    }

    @Override // o9.r0
    public final void h(Rect rect) {
        j0 j0Var = k.Y(getContext()).f79934x;
        for (v vVar : this.f21070s) {
            vVar.g(j0Var);
        }
        if (y2.f51877a.S().l() != c0.f51451c) {
            this.f21061h = rect.top;
            setPadding(getPaddingLeft(), rect.top, getPaddingRight(), getPaddingBottom());
        }
    }

    @Override // android.view.View
    public final boolean hasOverlappingRendering() {
        return false;
    }

    public final void i(m mVar) {
        this.f21060g = mVar;
        AllAppsPagedView allAppsPagedView = (AllAppsPagedView) e.a(mVar, AllAppsPagedView.class);
        if (allAppsPagedView != null) {
            b80.a aVar = new b80.a(17, this, mVar);
            if (allAppsPagedView.B) {
                allAppsPagedView.C = aVar;
            } else {
                aVar.run();
            }
        }
    }

    public final void j(boolean z11) {
        this.f21064k = z11;
        if (z11) {
            ArrayList arrayList = this.f21071t;
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                m mVar = (m) arrayList.get(size);
                if (mVar != this.f21060g) {
                    mVar.scrollBy(0, (this.f21067p - mVar.getScrollY()) + 1);
                }
            }
            this.f21066m = (-this.f21067p) - getPaddingTop();
            a();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void k() {
        this.f21067p = 0;
        for (x xVar : this.f21070s) {
            int expectedHeight = xVar.getExpectedHeight();
            this.f21067p += expectedHeight;
            if (expectedHeight > 0) {
                ViewGroup.LayoutParams layoutParams = ((View) xVar).getLayoutParams();
                if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
                    ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
                    this.f21067p += marginLayoutParams.topMargin + marginLayoutParams.bottomMargin;
                }
            }
        }
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        this.f21066m = ((Integer) valueAnimator.getAnimatedValue()).intValue();
        a();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        ((wa.a) wa.a.f94126a.h(getContext())).getClass();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ((wa.a) wa.a.f94126a.h(getContext())).getClass();
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.f21059f = (NovaSlidingTabStrip) findViewById(2131428973);
        ArrayList arrayList = new ArrayList();
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            KeyEvent.Callback childAt = getChildAt(i5);
            if (childAt instanceof v) {
                arrayList.add((v) childAt);
            }
        }
        if (y2.f51877a.W().l() == d0.f51461d) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                removeView((View) ((v) it.next()));
            }
            arrayList.clear();
        }
        v[] vVarArr = (v[]) arrayList.toArray(new v[arrayList.size()]);
        this.f21069r = vVarArr;
        this.f21070s = vVarArr;
    }

    @Override // com.android.systemui.plugins.AllAppsRow.OnHeightUpdatedListener
    public final void onHeightUpdated() {
        AllAppsContainerView allAppsContainerView;
        int i5 = this.f21067p;
        k();
        if (this.f21067p == i5 || (allAppsContainerView = (AllAppsContainerView) getParent()) == null) {
            return;
        }
        allAppsContainerView.v();
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        b(this.f21056c);
        motionEvent.offsetLocation(r0.x, r0.y);
        this.n = this.f21060g.onInterceptTouchEvent(motionEvent);
        motionEvent.offsetLocation(-r0.x, -r0.y);
        return this.n || super.onInterceptTouchEvent(motionEvent);
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        ArrayList arrayList = this.f21071t;
        if (!arrayList.isEmpty() && ((a) arrayList.get(0)).getMeasuredWidth() != 0) {
            NovaSlidingTabStripTabs novaSlidingTabStripTabsD = this.f21059f.d();
            int size = (View.MeasureSpec.getSize(i5) - ((a) arrayList.get(0)).s()) / 2;
            y2.f51877a.getClass();
            if (((Set) y2.N().l()).isEmpty()) {
                novaSlidingTabStripTabsD.f45825a = size;
                novaSlidingTabStripTabsD.f45826b = size;
                novaSlidingTabStripTabsD.requestLayout();
            } else {
                novaSlidingTabStripTabsD.f45825a = size;
                novaSlidingTabStripTabsD.f45826b = 0;
                novaSlidingTabStripTabsD.requestLayout();
            }
        }
        super.onMeasure(i5, i11);
    }

    @Override // com.android.systemui.plugins.PluginListener
    public final void onPluginConnected(Plugin plugin, Context context) {
        AllAppsRow allAppsRow = (AllAppsRow) plugin;
        x xVar = new x(allAppsRow, this);
        addView(xVar.f83900b, indexOfChild(this.f21059f));
        this.f21058e.put(allAppsRow, xVar);
        f();
        allAppsRow.setOnHeightUpdatedListener(this);
    }

    @Override // com.android.systemui.plugins.PluginListener
    public final void onPluginDisconnected(Plugin plugin) {
        AllAppsRow allAppsRow = (AllAppsRow) plugin;
        ArrayMap arrayMap = this.f21058e;
        removeView(((x) arrayMap.get(allAppsRow)).f83900b);
        arrayMap.remove(allAppsRow);
        f();
        onHeightUpdated();
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        if (!this.n) {
            return super.onTouchEvent(motionEvent);
        }
        b(this.f21056c);
        motionEvent.offsetLocation(r0.x, r0.y);
        try {
            return this.f21060g.onTouchEvent(motionEvent);
        } finally {
            motionEvent.offsetLocation(-r0.x, -r0.y);
        }
    }
}
