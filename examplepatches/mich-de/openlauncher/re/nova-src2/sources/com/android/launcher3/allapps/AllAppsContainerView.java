package com.android.launcher3.allapps;

import a5.a1;
import a5.s0;
import aa.m0;
import ae.m;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Bundle;
import android.os.UserManager;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.e2;
import androidx.recyclerview.widget.g2;
import b00.z0;
import ca.c;
import com.android.launcher3.CellLayout;
import com.android.launcher3.InsettableFrameLayout;
import com.android.launcher3.allapps.AllAppsContainerView;
import com.android.launcher3.folder.Folder;
import com.android.launcher3.views.RecyclerViewFastScroller;
import com.android.launcher3.views.SpringRelativeLayout;
import com.teslacoilsw.launcher.NovaApplication;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.drawer.drawergroups.DialogAddDrawerGroupFragment;
import com.teslacoilsw.launcher.drawer.drawergroups.GroupAppListActivity;
import com.teslacoilsw.launcher.launcher3.NovaAppDrawerSearchBar;
import com.teslacoilsw.launcher.launcher3.allapps.NovaSlidingTabStrip;
import com.teslacoilsw.launcher.launcher3.appprediction.PredictionRowView;
import com.teslacoilsw.launcher.quicksearchbar.NovaSearchBarView;
import com.teslacoilsw.launcher.quicksearchbar.NovaSearchEditText;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import com.teslacoilsw.launcher.widget.SpinnerTabView;
import e10.a3;
import e10.c0;
import e10.e0;
import e10.j2;
import e10.j3;
import e10.n0;
import e10.n2;
import e10.p0;
import e10.s2;
import e10.t1;
import e10.y2;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import java.util.WeakHashMap;
import kl.q0;
import kotlin.Pair;
import kotlin.UInt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import kz.a;
import kz.f;
import l10.x;
import l30.i;
import l30.r;
import o9.g3;
import o9.j0;
import o9.k;
import o9.k0;
import o9.l;
import o9.l0;
import o9.l2;
import o9.n;
import o9.n1;
import o9.r0;
import ox.q;
import p1.v1;
import pp.f0;
import q9.d;
import q9.g;
import q9.p;
import q9.v;
import q9.w;
import q9.y;
import q9.z;
import r.l1;
import r9.b;
import uy.d0;
import uy.j;
import uy.s;
import w20.e;
import za.t;

/* loaded from: classes.dex */
public class AllAppsContainerView extends SpringRelativeLayout implements k0, r0, j0, t {
    public static final c U = new c("grayscaleFade", 5);
    public final boolean A;
    public NovaSlidingTabStrip B;
    public final Path C;
    public boolean D;
    public final Paint E;
    public final int F;
    public c0 G;
    public final c0 H;
    public boolean I;
    public c0 J;
    public final g2 K;
    public AppSearchResultsView L;
    public final boolean M;
    public View N;
    public boolean O;
    public e2 P;
    public float Q;
    public float R;
    public final i S;
    public ColorMatrix T;

    /* renamed from: c, reason: collision with root package name */
    public final Paint f21021c;

    /* renamed from: d, reason: collision with root package name */
    public final Rect f21022d;

    /* renamed from: e, reason: collision with root package name */
    public final l f21023e;

    /* renamed from: f, reason: collision with root package name */
    public g[] f21024f;

    /* renamed from: g, reason: collision with root package name */
    public final p f21025g;

    /* renamed from: h, reason: collision with root package name */
    public final d f21026h;

    /* renamed from: i, reason: collision with root package name */
    public final m0 f21027i;

    /* renamed from: j, reason: collision with root package name */
    public final Paint f21028j;

    /* renamed from: k, reason: collision with root package name */
    public int f21029k;

    /* renamed from: l, reason: collision with root package name */
    public y f21030l;

    /* renamed from: m, reason: collision with root package name */
    public View f21031m;
    public AllAppsPagedView n;
    public FloatingHeaderView o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f21032p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f21033q;

    /* renamed from: r, reason: collision with root package name */
    public RecyclerViewFastScroller f21034r;

    /* renamed from: s, reason: collision with root package name */
    public final Point f21035s;

    /* renamed from: t, reason: collision with root package name */
    public final b f21036t;

    /* renamed from: u, reason: collision with root package name */
    public final int f21037u;

    /* renamed from: v, reason: collision with root package name */
    public final int f21038v;

    /* renamed from: w, reason: collision with root package name */
    public final float f21039w;

    /* renamed from: x, reason: collision with root package name */
    public n f21040x;

    /* renamed from: y, reason: collision with root package name */
    public int f21041y;

    /* renamed from: z, reason: collision with root package name */
    public int f21042z;

    public AllAppsContainerView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public final a a() {
        AllAppsPagedView allAppsPagedView;
        if (this.f21024f.length != 1 && (allAppsPagedView = this.n) != null && allAppsPagedView.Q() != 0) {
            return this.f21024f[this.n.Q()].f83833g;
        }
        g[] gVarArr = this.f21024f;
        if (gVarArr.length == 0) {
            return null;
        }
        return gVarArr[0].f83833g;
    }

    @Override // o9.j0
    public final void b(mx.j0 j0Var) {
        this.K.a();
        for (g gVar : this.f21024f) {
            gVar.f83828b.c(j0Var);
            a aVar = gVar.f83833g;
            if (aVar != null) {
                aVar.swapAdapter(aVar.getAdapter(), true);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0030 A[PHI: r0
      0x0030: PHI (r0v6 float) = (r0v4 float), (r0v5 float) binds: [B:15:0x002e, B:18:0x0036] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int c(a aVar) {
        c0 c0Var = this.G;
        c0 c0Var2 = c0.f51452d;
        if (c0Var == c0Var2 && (!this.f21032p || this.J != c0Var2)) {
            return 255;
        }
        if (aVar == null) {
            return 0;
        }
        c0 c0Var3 = this.J;
        c0 c0Var4 = c0.f51451c;
        if (c0Var3 == c0Var4 || c0Var != c0Var4) {
            return 0;
        }
        float fH = aVar.h() / getResources().getDisplayMetrics().density;
        float f11 = 0.0f;
        if (fH < 0.0f) {
            fH = f11;
        } else {
            f11 = 255.0f;
            if (fH > 255.0f) {
            }
        }
        return (int) fH;
    }

    public final ViewGroup d() {
        AllAppsPagedView allAppsPagedView = this.n;
        return allAppsPagedView == null ? a() : allAppsPagedView;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final WindowInsets dispatchApplyWindowInsets(WindowInsets windowInsets) {
        if (g3.f79851f) {
            this.f21029k = windowInsets.getTappableElementInsets().bottom;
        } else {
            this.f21029k = windowInsets.getSystemWindowInsetBottom();
        }
        return super.dispatchApplyWindowInsets(windowInsets);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (d() == null || d().getAlpha() <= 0.0f) {
            return;
        }
        c0 c0Var = this.G;
        c0 c0Var2 = c0.f51451c;
        boolean z11 = true;
        boolean z12 = c0Var == c0Var2 || (this.f21032p && this.J == c0Var2);
        c0 c0Var3 = c0.f51452d;
        if (c0Var != c0Var3 && (!this.f21032p || this.J != c0Var3)) {
            z11 = false;
        }
        if (getTranslationY() == 0.0f && !z12 && ((Boolean) y2.f51877a.w1().l()).booleanValue()) {
            if (this.f21022d.top > 0) {
                Paint paint = this.E;
                if (paint.getAlpha() > 0) {
                    canvas.drawRect(0.0f, 0.0f, getWidth(), r1.top, paint);
                }
            }
        }
        float translationY = getTranslationY();
        int i5 = this.f21029k;
        if (translationY >= i5 || z11 || i5 <= 0) {
            return;
        }
        Paint paint2 = this.f21028j;
        if (paint2.getAlpha() > 0) {
            canvas.drawRect(0.0f, getHeight() - this.f21029k, getWidth(), getHeight(), paint2);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        this.f21030l.getClass();
        try {
            return super.dispatchKeyEvent(keyEvent);
        } catch (IllegalStateException e3) {
            Boolean bool = NovaApplication.f45635g;
            fg.a.T(e3);
            return false;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchRestoreInstanceState(SparseArray sparseArray) {
        AllAppsPagedView allAppsPagedView;
        try {
            super.dispatchRestoreInstanceState(sparseArray);
        } catch (Exception e3) {
            Log.e("AllAppsContainerView", "restoreInstanceState viewId = 0", e3);
        }
        Bundle bundle = (Bundle) sparseArray.get(2131429247, null);
        if (bundle != null) {
            int i5 = bundle.getInt("launcher.allapps.current_page", 0);
            if (i5 == 0 || (allAppsPagedView = this.n) == null) {
                q(true);
            } else {
                allAppsPagedView.g0(i5);
                p(false);
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchSaveInstanceState(SparseArray sparseArray) {
        super.dispatchSaveInstanceState(sparseArray);
        Bundle bundle = new Bundle();
        AllAppsPagedView allAppsPagedView = this.n;
        bundle.putInt("launcher.allapps.current_page", allAppsPagedView != null ? allAppsPagedView.f80106f : 0);
        sparseArray.put(2131429247, bundle);
    }

    @Override // android.view.ViewGroup
    public final boolean drawChild(Canvas canvas, View view, long j11) {
        int iSave;
        boolean z11 = (view instanceof FloatingHeaderView) || (view == d() && !(((Boolean) y2.f51877a.J().l()).booleanValue() && this.f21032p));
        if (this.M && (view == this.L || view == this.o)) {
            iSave = canvas.save();
            canvas.clipRect(0, this.f21031m.getBottom() + ((int) this.f21031m.getTranslationY()), getWidth(), getHeight());
            try {
                return super.drawChild(canvas, view, j11);
            } finally {
            }
        }
        if (this.I || !z11 || !k()) {
            boolean z12 = this.I;
            if (z12 || !z11 || this.G != c0.f51452d) {
                return (z12 || !z11) ? super.drawChild(canvas, view, j11) : super.drawChild(canvas, view, j11);
            }
            iSave = canvas.save();
            canvas.clipRect(0.0f, (this.f21031m.getHeight() / 2.0f) + this.f21031m.getTop() + this.f21031m.getTranslationY(), getWidth(), getHeight(), Region.Op.DIFFERENCE);
            try {
                return super.drawChild(canvas, view, j11);
            } finally {
            }
        }
        iSave = canvas.save();
        Path path = this.C;
        path.rewind();
        x xVar = (x) this.f21031m.getBackground();
        Rect bounds = xVar.getBounds();
        Arrays.fill(xVar.f74483r, xVar.f74475h);
        float f11 = bounds.left;
        float f12 = xVar.f74477j;
        float f13 = xVar.f74468a / 2.0f;
        path.addRoundRect(xVar.f74471d + f11 + f12, (bounds.height() / 2.0f) - f13, (bounds.right - f12) - xVar.f74471d, (bounds.height() / 2.0f) + f13, xVar.f74483r, Path.Direction.CW);
        path.offset(this.f21031m.getLeft(), this.f21031m.getTranslationY() + this.f21031m.getTop());
        Region.Op op2 = Region.Op.DIFFERENCE;
        canvas.clipPath(path, op2);
        if (this.G == c0.f51452d) {
            canvas.clipRect(0.0f, (this.f21031m.getHeight() / 2.0f) + this.f21031m.getTop() + this.f21031m.getTranslationY(), getWidth(), getHeight(), op2);
        }
        path.rewind();
        try {
            return super.drawChild(canvas, view, j11);
        } finally {
        }
    }

    public final PredictionRowView e() {
        CellLayout cellLayoutU0;
        if (!this.A) {
            return (PredictionRowView) this.o.c(PredictionRowView.class);
        }
        for (g gVar : this.f21024f) {
            if (gVar.f83837k.f()) {
                f fVar = (f) gVar.f83833g.getChildAt(0);
                if (fVar == null || fVar.getChildCount() <= 0 || (cellLayoutU0 = fVar.u0(0)) == null) {
                    return null;
                }
                View viewA = cellLayoutU0.P.a(0, 0);
                if (viewA instanceof PredictionRowView) {
                    return (PredictionRowView) viewA;
                }
                return null;
            }
        }
        return null;
    }

    public final int f() {
        int height;
        int i5;
        AppSearchResultsView appSearchResultsView = this.L;
        if (appSearchResultsView != null) {
            height = appSearchResultsView.getHeight();
            i5 = ((RelativeLayout.LayoutParams) this.L.getLayoutParams()).topMargin;
        } else {
            height = 0;
            i5 = 0;
        }
        int iD = this.o.d() + e.k((!this.f21032p || this.J == c0.f51450b) ? 8 : 16);
        return this.M ? height + i5 + iD : iD;
    }

    public final g g() {
        for (g gVar : this.f21024f) {
            if (gVar.f83827a) {
                return gVar;
            }
        }
        return null;
    }

    @Override // android.view.View
    public final void getDrawingRect(Rect rect) {
        super.getDrawingRect(rect);
        rect.offset(0, (int) getTranslationY());
    }

    @Override // o9.r0
    public void h(Rect rect) {
        y2 y2Var = y2.f51877a;
        Rect rect2 = this.f21022d;
        rect2.set(rect);
        mx.j0 j0Var = this.f21023e.f79934x;
        c0 c0Var = this.G;
        c0 c0Var2 = c0.f51452d;
        boolean z11 = c0Var == c0Var2;
        if (z11) {
            int iK = rect.bottom;
            if (!((Boolean) y2Var.J().l()).booleanValue()) {
                NovaSlidingTabStrip novaSlidingTabStrip = this.B;
                if (novaSlidingTabStrip != null && novaSlidingTabStrip.getVisibility() != 8) {
                    iK += this.B.getLayoutParams().height;
                } else if (y2Var.q1().l() == j3.f51612e) {
                    iK += e.k(16);
                }
            }
            ((RelativeLayout.LayoutParams) this.f21031m.getLayoutParams()).bottomMargin = iK;
        }
        if (this.B != null) {
            int i5 = rect.bottom;
            if (((Boolean) y2Var.J().l()).booleanValue()) {
                i5 += this.f21031m.getLayoutParams().height;
            }
            ((RelativeLayout.LayoutParams) this.B.getLayoutParams()).bottomMargin = i5;
        }
        int i11 = z11 ? this.f21031m.getLayoutParams().height / 2 : (this.f21032p && this.J == c0Var2) ? 0 : rect.bottom;
        ViewGroup viewGroupD = d();
        c0 c0Var3 = this.G;
        c0 c0Var4 = c0.f51451c;
        if (c0Var3 != c0Var4 && viewGroupD != null && viewGroupD.getParent() == this) {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) viewGroupD.getLayoutParams();
            if (this.f21032p && this.J == c0Var4) {
                marginLayoutParams.topMargin = getResources().getDimensionPixelSize(2131165281) + rect2.top;
            }
        }
        int i12 = 0;
        while (true) {
            g[] gVarArr = this.f21024f;
            if (i12 >= gVarArr.length) {
                ViewGroup.MarginLayoutParams marginLayoutParams2 = (ViewGroup.MarginLayoutParams) getLayoutParams();
                marginLayoutParams2.leftMargin = rect.left;
                marginLayoutParams2.rightMargin = rect.right;
                setLayoutParams(marginLayoutParams2);
                setPadding(0, 0, 0, 0);
                InsettableFrameLayout.a(this, rect);
                z(this.G, this.J, true, rect);
                return;
            }
            g gVar = gVarArr[i12];
            Rect rect3 = gVar.f83831e;
            rect3.bottom = i11;
            int i13 = j0Var.f77144g0;
            rect3.right = i13;
            rect3.left = i13;
            gVar.a();
            i12++;
        }
    }

    @Override // o9.k0
    public final void i(View view, l0 l0Var, boolean z11) {
    }

    public final void j() {
        n nVar = this.f21040x;
        if (nVar != null) {
            if (this.o.f21062i || this.M) {
                nVar.invalidate();
            }
        }
    }

    public final boolean k() {
        if (this.G == c0.f51450b) {
            return false;
        }
        if ((this.f21032p && ((Boolean) y2.f51877a.J().l()).booleanValue()) || !(this.f21031m.getBackground() instanceof x)) {
            return false;
        }
        x xVar = (x) this.f21031m.getBackground();
        if (Color.alpha(xVar.f74481p) < 255 || xVar.o) {
            return true;
        }
        return this.D && a().h() > 0;
    }

    public void l(int i5) {
        g[] gVarArr = this.f21024f;
        if (gVarArr.length == 0) {
            return;
        }
        this.o.i(gVarArr[i5].f83833g);
        a aVar = this.f21024f[i5].f83833g;
        if (aVar != null) {
            aVar.f();
            e2 e2Var = this.P;
            if (e2Var != null) {
                e2Var.onScrolled(this.f21024f[i5].f83833g, 0, 0);
            }
        }
        r(true, false);
        l lVar = this.f21023e;
        int i11 = lVar.C().f90099b.f90179b;
        int i12 = this.f21024f[i5].f83837k.f91755g;
        if (i12 == 262914) {
            i12 = lVar.C().f90099b.f90180c;
        }
        a aVarA = a();
        RecyclerViewFastScroller recyclerViewFastScrollerI = aVarA == null ? null : aVarA.i();
        recyclerViewFastScrollerI.f21292h.setColor(i12);
        Paint paint = recyclerViewFastScrollerI.f21296l;
        paint.setColor(i11);
        paint.setAlpha(30);
        recyclerViewFastScrollerI.invalidate();
        if (this.f21033q) {
            boolean z11 = this.f21024f[i5].f83827a;
            WorkModeSwitch workModeSwitch = (WorkModeSwitch) this.f21027i.f622e;
            if (workModeSwitch != null) {
                workModeSwitch.a(z11);
            }
        }
    }

    public final void m() {
        Bundle bundle = new Bundle();
        o(bundle);
        boolean z11 = false;
        this.f21033q = g() != null;
        p(true);
        if (this.f21033q) {
            m0 m0Var = this.f21027i;
            m0Var.y((((AllAppsContainerView) m0Var.f620c).f21025g.f83866f & 2) == 0 ? 1 : 2);
        }
        n(bundle);
        y yVar = this.f21030l;
        if (yVar != null) {
            NovaAppDrawerSearchBar novaAppDrawerSearchBar = (NovaAppDrawerSearchBar) yVar;
            NovaSearchEditText novaSearchEditText = novaAppDrawerSearchBar.b().f74425h;
            if ((novaSearchEditText != null ? novaSearchEditText.b() : null) != null) {
                NovaSearchEditText novaSearchEditText2 = novaAppDrawerSearchBar.b().f74425h;
                z11 = !TextUtils.isEmpty((novaSearchEditText2 != null ? novaSearchEditText2.b() : null).getText().toString());
            }
        }
        y(z11);
    }

    public final void n(Bundle bundle) {
        boolean z11 = bundle.getBoolean("novalauncher.apps_header_collapsed", false);
        int i5 = bundle.getInt("novalauncher.apps_tab", 0);
        int i11 = bundle.getInt("novalauncher.apps_scroll_position", 0);
        int i12 = bundle.getInt("novalauncher.apps_scroll_position_offset", 0);
        if (z11) {
            this.o.j(true);
        }
        AllAppsPagedView allAppsPagedView = this.n;
        if (allAppsPagedView != null && allAppsPagedView.getChildCount() >= i5) {
            this.n.g0(i5);
        }
        a aVarA = a();
        if (aVarA == null || (i11 <= 0 && i12 == 0)) {
            if (aVarA != null) {
                this.o.j(false);
                this.o.g(false);
                return;
            }
            return;
        }
        if (this.A) {
            ((kz.d) aVarA.getAdapter()).g(i11);
            return;
        }
        this.o.i(aVarA);
        AllAppsGridAdapter$AppsGridLayoutManager allAppsGridAdapter$AppsGridLayoutManager = (AllAppsGridAdapter$AppsGridLayoutManager) aVarA.getLayoutManager();
        if (allAppsGridAdapter$AppsGridLayoutManager != null) {
            allAppsGridAdapter$AppsGridLayoutManager.scrollToPositionWithOffset(i11, i12);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0035, code lost:
    
        if (r0 == null) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x003b, code lost:
    
        if (r0.getChildCount() <= 0) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0041, code lost:
    
        if (r7.A == false) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0043, code lost:
    
        r8.putInt("novalauncher.apps_scroll_position", ((kz.f) r0.getChildAt(0)).G());
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0050, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0051, code lost:
    
        r1 = null;
        r4 = -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0053, code lost:
    
        if (r4 >= 0) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0059, code lost:
    
        if (r3 >= r0.getChildCount()) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x005b, code lost:
    
        r1 = r3 + 1;
        r3 = r0.getChildAt(r3);
        r4 = r0.getLayoutManager().getDecoratedTop(r3) - r0.getLayoutManager().getPaddingTop();
        r3 = r1;
        r1 = r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0076, code lost:
    
        r8.putInt("novalauncher.apps_scroll_position", r0.getChildAdapterPosition(r1));
        r8.putInt("novalauncher.apps_scroll_position_offset", r0.getLayoutManager().getDecoratedTop(r1) - r0.getLayoutManager().getPaddingTop());
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0093, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:?, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:?, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void o(Bundle bundle) {
        bundle.putBoolean("novalauncher.apps_header_collapsed", this.o.f21064k);
        AllAppsPagedView allAppsPagedView = this.n;
        if (allAppsPagedView != null) {
            bundle.putInt("novalauncher.apps_tab", allAppsPagedView.G());
        }
        a aVarA = a();
        v[] vVarArr = this.o.f21070s;
        int length = vVarArr.length;
        int i5 = 0;
        int i11 = 0;
        while (true) {
            if (i11 >= length) {
                break;
            }
            if (!vVarArr[i11].getF46270i()) {
                i11++;
            } else if (!this.o.f21064k) {
                return;
            }
        }
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        setOnFocusChangeListener(new q9.b(this, 0));
        FloatingHeaderView floatingHeaderView = (FloatingHeaderView) findViewById(2131427479);
        this.o = floatingHeaderView;
        c0 c0Var = this.G;
        c0 c0Var2 = c0.f51452d;
        int i5 = 1;
        boolean z11 = c0Var == c0Var2;
        c0 c0Var3 = c0.f51451c;
        if (c0Var != c0Var3) {
            ((RelativeLayout.LayoutParams) floatingHeaderView.getLayoutParams()).removeRule(3);
        }
        if (this.J == c0Var2) {
            FloatingHeaderView floatingHeaderView2 = this.o;
            floatingHeaderView2.removeView(floatingHeaderView2.f21059f);
            NovaSlidingTabStrip novaSlidingTabStrip = floatingHeaderView2.f21059f;
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(novaSlidingTabStrip.getLayoutParams());
            layoutParams.addRule(14, 1);
            layoutParams.addRule(12, 1);
            addView(novaSlidingTabStrip, layoutParams);
            this.B = novaSlidingTabStrip;
        }
        View viewFindViewById = findViewById(2131428755);
        this.f21031m = viewFindViewById;
        if (z11) {
            viewFindViewById.setElevation(1.0f);
            ((RelativeLayout.LayoutParams) this.f21031m.getLayoutParams()).addRule(12, 1);
            this.f21031m.setTranslationY(0.0f);
        }
        this.f21030l = (y) this.f21031m;
        AppSearchResultsView appSearchResultsView = (AppSearchResultsView) findViewById(2131427503);
        this.L = appSearchResultsView;
        appSearchResultsView.D = false;
        l lVar = this.f21023e;
        mx.j0 j0Var = lVar.f79934x;
        appSearchResultsView.E((NovaLauncher) lVar, lVar.C().f90099b, j0Var.f77144g0, j0Var.K0, new v1(this, 4));
        this.L.g();
        if (this.M) {
            FloatingHeaderView floatingHeaderView3 = this.o;
            floatingHeaderView3.setPadding(floatingHeaderView3.getPaddingLeft(), 0, this.o.getPaddingRight(), this.o.getPaddingBottom());
            this.L.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: q9.c
                @Override // android.view.View.OnLayoutChangeListener
                public final void onLayoutChange(View view, int i11, int i12, int i13, int i14, int i15, int i16, int i17, int i18) {
                    ca.c cVar = AllAppsContainerView.U;
                    AllAppsContainerView allAppsContainerView = this.f83814a;
                    allAppsContainerView.getClass();
                    if (i14 - i12 == i18 - i16 && i12 == i16) {
                        return;
                    }
                    allAppsContainerView.v();
                }
            });
            this.L.f46201l0 = new j2(this, 11);
        } else {
            RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) this.o.getLayoutParams();
            layoutParams2.removeRule(3);
            if (this.G == c0Var3) {
                layoutParams2.addRule(3, 2131428755);
            }
        }
        p(true);
        NovaAppDrawerSearchBar novaAppDrawerSearchBar = (NovaAppDrawerSearchBar) this.f21030l;
        novaAppDrawerSearchBar.f45805q = this;
        int i11 = 18;
        if (novaAppDrawerSearchBar.f45806r) {
            this.L.F = new b00.t(novaAppDrawerSearchBar, i11);
        } else {
            this.L.F = null;
        }
        novaAppDrawerSearchBar.m(novaAppDrawerSearchBar.isAttachedToWindow());
        s(new d(this, i5));
        if (!this.f21032p && this.G == c0Var2) {
            ((NovaSearchBarView) this.f21031m).d(255);
        }
        RecyclerViewFastScroller recyclerViewFastScroller = (RecyclerViewFastScroller) findViewById(2131428044);
        int i12 = lVar.C().f90099b.f90179b;
        recyclerViewFastScroller.f21292h.setColor(lVar.C().f90099b.f90180c);
        Paint paint = recyclerViewFastScroller.f21296l;
        paint.setColor(i12);
        paint.setAlpha(30);
        recyclerViewFastScroller.invalidate();
        c0 c0Var4 = this.G;
        c0 c0Var5 = this.J;
        y2.f51877a.getClass();
        z(c0Var4, c0Var5, ((Boolean) y2.O().l()).booleanValue(), this.f21022d);
        if (((Boolean) y2.G0().l()).booleanValue()) {
            if (this.G != c0Var2) {
                AppSearchResultsView appSearchResultsView2 = this.L;
                z0 z0Var = new z0(this, 17);
                WeakHashMap weakHashMap = a1.f250a;
                s0.l(appSearchResultsView2, z0Var);
                return;
            }
            View view = this.f21031m;
            FloatingHeaderView floatingHeaderView4 = this.o;
            k30.e eVar = new k30.e(this, i11);
            WeakHashMap weakHashMap2 = a1.f250a;
            s0.l(view, eVar);
            a1.n(view, new q9.f(this, view, floatingHeaderView4));
        }
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        Point point = this.f21035s;
        if (action == 0) {
            a aVarA = a();
            if (aVarA == null || !aVarA.i().c(motionEvent.getX(), motionEvent.getY(), point)) {
                this.f21034r = null;
            } else {
                this.f21034r = aVarA.i();
            }
        }
        RecyclerViewFastScroller recyclerViewFastScroller = this.f21034r;
        if (recyclerViewFastScroller == null || recyclerViewFastScroller.getVisibility() != 0) {
            return false;
        }
        return this.f21034r.b(motionEvent, point);
    }

    @Override // android.widget.RelativeLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        AllAppsContainerView allAppsContainerView;
        try {
            super.onLayout(z11, i5, i11, i12, i13);
            allAppsContainerView = this;
        } catch (Exception e3) {
            allAppsContainerView = this;
            e3.printStackTrace();
        }
        View view = allAppsContainerView.N;
        if (view != null) {
            view.layout(view.getLeft(), allAppsContainerView.N.getTop(), allAppsContainerView.N.getRight(), allAppsContainerView.N.getBottom());
        }
    }

    @Override // android.widget.RelativeLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        View view = this.N;
        if (view == null || !(view instanceof AllAppsPagedView)) {
            return;
        }
        view.measure(View.MeasureSpec.makeMeasureSpec(view.getMeasuredWidth(), 1073741824), View.MeasureSpec.makeMeasureSpec(this.N.getMeasuredHeight(), 1073741824));
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        Point point = this.f21035s;
        if (action == 0) {
            a aVarA = a();
            if (aVarA == null || !aVarA.i().c(motionEvent.getX(), motionEvent.getY(), point)) {
                this.f21034r = null;
            } else {
                this.f21034r = aVarA.i();
            }
        }
        RecyclerViewFastScroller recyclerViewFastScroller = this.f21034r;
        if (recyclerViewFastScroller != null) {
            recyclerViewFastScroller.b(motionEvent, point);
        }
        return true;
    }

    @Override // android.view.ViewGroup
    public final void onViewAdded(View view) {
        super.onViewAdded(view);
        y2 y2Var = y2.f51877a;
        c0 c0Var = this.G;
        c0 c0Var2 = c0.f51452d;
        if (c0Var == c0Var2 || this.J == c0Var2) {
            return;
        }
        if ((view instanceof a) || (view instanceof AllAppsPagedView)) {
            this.N = view;
            view.setPadding(view.getPaddingLeft(), this.N.getPaddingTop(), this.N.getPaddingRight(), this.N.getPaddingBottom());
        }
    }

    @Override // android.view.ViewGroup
    public final void onViewRemoved(View view) {
        super.onViewRemoved(view);
        if (view == this.N) {
            this.N = null;
        }
    }

    public final void p(boolean z11) {
        List<s> listSingletonList;
        p pVar;
        AllAppsPagedView allAppsPagedView = this.n;
        int iG = allAppsPagedView != null ? allAppsPagedView.G() : -1;
        d0 d0Var = d0.f91699e;
        if (d0Var.f91704d) {
            d0Var.v();
            listSingletonList = d0Var.j(false);
        } else {
            listSingletonList = Collections.singletonList(new j("Apps"));
        }
        Iterator it = listSingletonList.iterator();
        int i5 = 0;
        while (it.hasNext()) {
            if (((s) it.next()) instanceof j) {
                i5++;
            }
        }
        boolean z12 = i5 >= 1;
        if (z12 != this.f21032p || z11) {
            this.f21032p = z12;
            NovaSlidingTabStrip novaSlidingTabStrip = this.B;
            if (novaSlidingTabStrip != null) {
                novaSlidingTabStrip.setVisibility(z12 ? 0 : 8);
            }
            boolean z13 = i5 > 1;
            View viewFindViewById = this.n;
            if (viewFindViewById == null) {
                viewFindViewById = findViewById(2131427512);
            }
            int iIndexOfChild = indexOfChild(viewFindViewById);
            removeView(viewFindViewById);
            int i11 = 0;
            while (true) {
                g[] gVarArr = this.f21024f;
                if (i11 >= gVarArr.length) {
                    break;
                }
                a aVar = gVarArr[i11].f83833g;
                if (aVar != null) {
                    aVar.setLayoutManager(null);
                    aVar.setAdapter(null);
                }
                i11++;
            }
            boolean z14 = this.A;
            View viewInflate = LayoutInflater.from(getContext()).inflate(z13 ? 2131624042 : z14 ? 2131624040 : 2131624039, (ViewGroup) this, false);
            if (z13) {
                for (int i12 = 0; i12 < i5; i12++) {
                    LayoutInflater.from(getContext()).inflate(z14 ? 2131624040 : 2131624039, (ViewGroup) viewInflate, true);
                }
            }
            RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) viewInflate.getLayoutParams();
            y2 y2Var = y2.f51877a;
            c0 c0Var = this.G;
            c0 c0Var2 = c0.f51451c;
            if (c0Var != c0Var2) {
                layoutParams.removeRule(3);
                layoutParams.addRule(6, 2131427479);
                viewInflate.setPadding(0, 0, 0, 0);
            }
            c0 c0Var3 = this.G;
            c0 c0Var4 = c0.f51452d;
            boolean z15 = this.M;
            if (c0Var3 == c0Var4) {
                if (z15) {
                    layoutParams.addRule(2, this.L.getId());
                } else {
                    layoutParams.addRule(8, 2131428755);
                }
                layoutParams.bottomMargin = this.f21031m.getLayoutParams().height / 2;
            }
            c0 c0Var5 = this.J;
            if (c0Var5 != c0Var2) {
                layoutParams.topMargin = 0;
                if ((c0Var5 == c0Var4 && ((Boolean) y2Var.J().l()).booleanValue()) || this.G != c0Var4) {
                    layoutParams.bottomMargin = 0;
                    layoutParams.removeRule(8);
                    NovaSlidingTabStrip novaSlidingTabStrip2 = this.B;
                    if (novaSlidingTabStrip2 != null) {
                        layoutParams.addRule(2, novaSlidingTabStrip2.getId());
                    }
                }
                viewInflate.setPadding(viewInflate.getPaddingLeft(), 0, viewInflate.getPaddingRight(), viewInflate.getPaddingBottom());
            }
            layoutParams.removeRule(3);
            char c11 = z15 ? (char) 1 : this.G == c0Var2 ? (char) 2 : (char) 0;
            if (c11 == 1) {
                layoutParams.addRule(3, this.f21031m.getId());
                layoutParams.topMargin = 0;
            } else if (c11 == 2) {
                layoutParams.addRule(3, 2131428755);
                if (this.J == c0Var2 && !z13) {
                    layoutParams.topMargin = getResources().getDimensionPixelSize(2131165282) + getResources().getDimensionPixelSize(2131165281);
                }
            }
            addView(viewInflate, iIndexOfChild);
            m0 m0Var = this.f21027i;
            if (z13) {
                AllAppsPagedView allAppsPagedView2 = (AllAppsPagedView) viewInflate;
                this.n = allAppsPagedView2;
                allAppsPagedView2.R(this);
                AllAppsPagedView allAppsPagedView3 = this.n;
                NovaSlidingTabStrip novaSlidingTabStrip3 = (NovaSlidingTabStrip) allAppsPagedView3.E;
                novaSlidingTabStrip3.f45817b = this;
                r rVar = novaSlidingTabStrip3.f45819d;
                rVar.f74685j = allAppsPagedView3;
                allAppsPagedView3.i0(rVar);
                rVar.f74686k = 3;
                if (this.f21033q) {
                    AllAppsContainerView allAppsContainerView = (AllAppsContainerView) m0Var.f620c;
                    if (((WorkModeSwitch) m0Var.f622e) == null) {
                        m0Var.f622e = (WorkModeSwitch) LayoutInflater.from(allAppsContainerView.getContext()).inflate(2131624478, (ViewGroup) allAppsContainerView, false);
                    }
                    if (((WorkModeSwitch) m0Var.f622e).getParent() != allAppsContainerView) {
                        allAppsContainerView.addView((WorkModeSwitch) m0Var.f622e);
                    }
                    if (allAppsContainerView.g() != null) {
                        allAppsContainerView.g().a();
                    }
                    ((WorkModeSwitch) m0Var.f622e).b(m0Var.f618a == 1);
                    ((WorkModeSwitch) m0Var.f622e).post(new m(this, 28));
                }
            } else {
                WorkModeSwitch workModeSwitch = (WorkModeSwitch) m0Var.f622e;
                if (workModeSwitch != null) {
                    ViewParent parent = workModeSwitch.getParent();
                    AllAppsContainerView allAppsContainerView2 = (AllAppsContainerView) m0Var.f620c;
                    if (parent == allAppsContainerView2) {
                        allAppsContainerView2.removeView((WorkModeSwitch) m0Var.f622e);
                    }
                }
                m0Var.f622e = null;
                this.n = null;
                NovaSlidingTabStrip novaSlidingTabStrip4 = (NovaSlidingTabStrip) findViewById(2131428973);
                novaSlidingTabStrip4.f45817b = this;
                r rVar2 = novaSlidingTabStrip4.f45819d;
                rVar2.f74685j = null;
                rVar2.f74686k = 3;
            }
            Rect rect = this.f21022d;
            h(rect);
            g[] gVarArr2 = this.f21024f;
            int length = gVarArr2.length;
            int i13 = 0;
            while (true) {
                pVar = this.f21025g;
                if (i13 >= length) {
                    break;
                }
                g gVar = gVarArr2[i13];
                pVar.f83865e.remove(gVar.f83833g);
                q qVar = gVar.f83836j;
                if (qVar != null) {
                    qVar.d();
                    gVar.f83836j = null;
                }
                i13++;
            }
            this.f21024f = new g[i5];
            int i14 = 0;
            for (s sVar : listSingletonList) {
                if (sVar instanceof j) {
                    g gVar2 = new g(this, (j) sVar, sVar instanceof uy.m, this.n != null);
                    AllAppsPagedView allAppsPagedView4 = this.n;
                    View viewFindViewById2 = allAppsPagedView4 == null ? findViewById(2131427512) : allAppsPagedView4.getChildAt(i14);
                    gVar2.f83832f = viewFindViewById2;
                    ya.v vVarC = gVar2.f83837k.c();
                    q9.s sVar2 = gVar2.f83830d;
                    sVar2.f83892l = vVarC;
                    sVar2.a();
                    a aVar2 = (a) viewFindViewById2.findViewById(2131427512);
                    gVar2.f83833g = aVar2;
                    aVar2.setEdgeEffectFactory(new za.x(this));
                    gVar2.f83833g.u(sVar2);
                    gVar2.f83833g.setLayoutManager(gVar2.f83829c);
                    a aVar3 = gVar2.f83833g;
                    kz.b bVar = gVar2.f83828b;
                    aVar3.setAdapter(bVar);
                    gVar2.f83833g.setHasFixedSize(true);
                    gVar2.f83833g.setRecycledViewPool(this.K);
                    gVar2.f83833g.setItemAnimator(null);
                    gVar2.f83833g.addOnScrollListener(this.f21026h);
                    a aVar4 = gVar2.f83833g;
                    ca.b bVar2 = new ca.b();
                    ca.a aVar5 = new ca.a((ViewGroup) aVar4);
                    bVar2.f19903a = aVar5;
                    gVar2.f83833g.addItemDecoration(bVar2);
                    bVar.d(aVar5);
                    gVar2.b(gVar2.f83834h);
                    gVar2.a();
                    if (u9.b.f90694g.f90687d) {
                        gVar2.f83833g.addItemDecoration(this.f21036t.f85745a);
                    }
                    String str = gVar2.f83835i;
                    if (str != null) {
                        gVar2.f83836j = q.g(gVar2.f83833g, str, new z0(gVar2, 18));
                    }
                    a aVar6 = gVar2.f83833g;
                    ArrayList arrayList = pVar.f83865e;
                    if (aVar6 != null && !arrayList.contains(aVar6)) {
                        arrayList.add(aVar6);
                    }
                    this.f21024f[i14] = gVar2;
                    i14++;
                }
            }
            if (this.n != null) {
                y2 y2Var2 = y2.f51877a;
                if (y2Var2.a0().l() == c0.f51450b) {
                    s2 s2Var = y2.f51941r0;
                    KProperty kProperty = y2.f51881b[64];
                    s2Var.getClass();
                    if (!((Boolean) s2Var.l()).booleanValue()) {
                        s2 s2VarA0 = y2Var2.a0();
                        c0 c0Var6 = c0.f51451c;
                        s2VarA0.i(c0Var6);
                        this.J = c0Var6;
                    }
                }
                if (iG > 0) {
                    this.n.g0(iG);
                }
                l(this.n.G());
                s2 s2Var2 = y2.f51941r0;
                KProperty kProperty2 = y2.f51881b[64];
                s2Var2.getClass();
                s2Var2.h(Boolean.TRUE);
            }
            v();
            if (z12 && ((Boolean) y2.f51877a.J().l()).booleanValue()) {
                int i15 = 0;
                while (true) {
                    g[] gVarArr3 = this.f21024f;
                    if (i15 >= gVarArr3.length) {
                        break;
                    }
                    gVarArr3[i15].b(false);
                    i15++;
                }
            } else {
                int i16 = 0;
                while (true) {
                    g[] gVarArr4 = this.f21024f;
                    if (i16 >= gVarArr4.length) {
                        break;
                    }
                    gVarArr4[i16].b(true);
                    i16++;
                }
            }
            ViewGroup viewGroupD = d();
            if (viewGroupD != null) {
                viewGroupD.setAlpha(this.Q);
                s9.a.a(viewGroupD);
            }
            h(rect);
            e2 e2Var = this.P;
            if (e2Var != null) {
                s(e2Var);
            }
        }
    }

    public final void q(boolean z11) {
        y2.f51877a.getClass();
        n2 n2Var = y2.D0;
        KProperty kProperty = y2.f51881b[76];
        n2Var.getClass();
        if (((Boolean) n2Var.l()).booleanValue()) {
            ((NovaAppDrawerSearchBar) this.f21030l).k();
        } else {
            r(z11, true);
        }
    }

    public final void r(boolean z11, boolean z12) {
        if (z12) {
            this.o.j(false);
            AllAppsPagedView allAppsPagedView = this.n;
            if (allAppsPagedView != null && allAppsPagedView.getChildCount() > 0) {
                if (z11) {
                    this.n.l0(0);
                } else {
                    this.n.g0(0);
                }
            }
            int i5 = 0;
            while (true) {
                g[] gVarArr = this.f21024f;
                if (i5 >= gVarArr.length) {
                    break;
                }
                a aVar = gVarArr[i5].f83833g;
                if (aVar != null) {
                    aVar.n();
                }
                i5++;
            }
        }
        FloatingHeaderView floatingHeaderView = this.o;
        if (floatingHeaderView != null && floatingHeaderView.getVisibility() == 0) {
            this.o.g(z11);
        }
        ((NovaAppDrawerSearchBar) this.f21030l).k();
        x(0);
    }

    public final void s(e2 e2Var) {
        if (this.P != null) {
            for (g gVar : this.f21024f) {
                gVar.f83833g.removeOnScrollListener(this.P);
            }
        }
        this.P = e2Var;
        if (e2Var != null) {
            for (g gVar2 : this.f21024f) {
                gVar2.f83833g.addOnScrollListener(this.P);
            }
        }
    }

    @Override // android.view.View
    public final void setTranslationY(float f11) {
        super.setTranslationY(f11);
        j();
    }

    public final void t(float f11) {
        if (f11 == this.R) {
            return;
        }
        if (f11 <= 0.01f) {
            setLayerType(0, null);
            this.R = 0.0f;
            return;
        }
        if (f11 >= 0.99f) {
            this.R = 1.0f;
        }
        if (this.T == null) {
            this.T = new ColorMatrix();
        }
        ColorMatrix colorMatrix = this.T;
        colorMatrix.setSaturation(1.0f - this.R);
        ColorMatrixColorFilter colorMatrixColorFilter = new ColorMatrixColorFilter(colorMatrix);
        i iVar = this.S;
        iVar.setColorFilter(colorMatrixColorFilter);
        iVar.getClass();
        if (getLayerType() != 2) {
            setLayerType(2, iVar);
        } else {
            setLayerPaint(iVar);
        }
        this.R = f11;
        invalidate();
    }

    public final void u(String str) {
        if (this.L != null) {
            y(!TextUtils.isEmpty(str));
            this.L.f46180b.f92318b.L(str, false);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r13v8, types: [android.view.View, android.widget.TextView] */
    /* JADX WARN: Type inference failed for: r13v9, types: [android.view.View, android.view.View$OnTouchListener, com.teslacoilsw.launcher.widget.SpinnerTabView] */
    /* JADX WARN: Type inference failed for: r2v42 */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Type inference failed for: r2v6, types: [int] */
    /* JADX WARN: Type inference failed for: r4v15, types: [android.view.ViewGroup, com.teslacoilsw.launcher.launcher3.allapps.NovaSlidingTabStripTabs] */
    public final void v() {
        final ImageView imageView;
        int i5;
        final int i11;
        g[] gVarArr;
        LayoutInflater layoutInflater;
        w wVar;
        tz.v vVar;
        e0 e0Var;
        int i12;
        String[] strArr;
        boolean z11 = false;
        this.o.setVisibility(0);
        int i13 = 1;
        if (this.M) {
            PredictionRowView predictionRowViewE = e();
            if (predictionRowViewE != null) {
                predictionRowViewE.f45853s = false;
                predictionRowViewE.f45858x = false;
                predictionRowViewE.n();
            }
            FloatingHeaderView floatingHeaderView = this.o;
            floatingHeaderView.setPadding(floatingHeaderView.getPaddingLeft(), 0, this.o.getPaddingRight(), this.o.getPaddingBottom());
            this.o.f21062i = true;
        }
        FloatingHeaderView floatingHeaderView2 = this.o;
        g[] gVarArr2 = this.f21024f;
        boolean z12 = (this.f21032p && this.B == null && this.J != c0.f51450b) ? false : true;
        w wVar2 = floatingHeaderView2.f21057d;
        ArrayList arrayList = floatingHeaderView2.f21071t;
        for (v vVar2 : floatingHeaderView2.f21070s) {
            vVar2.f(floatingHeaderView2, floatingHeaderView2.f21070s, z12);
        }
        floatingHeaderView2.k();
        floatingHeaderView2.o = z12;
        if (floatingHeaderView2.indexOfChild(floatingHeaderView2.f21059f) >= 0) {
            floatingHeaderView2.f21059f.setVisibility(z12 ? 8 : 0);
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            ((RecyclerView) it.next()).removeOnScrollListener(wVar2);
        }
        arrayList.clear();
        floatingHeaderView2.f21059f.d().removeAllViews();
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(floatingHeaderView2.getContext());
        Context context = floatingHeaderView2.getContext();
        q0 q0Var = n1.C0;
        tz.v vVar3 = ((NovaLauncher) k.Y(context)).V0.f90099b;
        e0 e0Var2 = floatingHeaderView2.f21059f.f45822g;
        int i14 = e0Var2 == e0.f51475b ? 2131624104 : 2131624103;
        int length = gVarArr2.length;
        int i15 = 0;
        while (i15 < length) {
            g gVar = gVarArr2[i15];
            a aVar = gVar.f83833g;
            int i16 = i13;
            j jVar = gVar.f83837k;
            aVar.addOnScrollListener(wVar2);
            arrayList.add(gVar.f83833g);
            ?? r13 = (TextView) layoutInflaterFrom.inflate(i14, floatingHeaderView2.f21059f.d(), z11);
            boolean z13 = jVar instanceof uy.l;
            if (z13 && ((uy.l) jVar).f91722l) {
                r13.setText(jVar.f91749a + "*");
            } else {
                r13.setText(jVar.f91749a);
            }
            r13.setOnClickListener(new l10.f(floatingHeaderView2, 3));
            if (e0Var2 == e0.f51475b) {
                int i17 = jVar.f91755g;
                if (i17 == 262914) {
                    i17 = vVar3.f90180c;
                }
                Context context2 = floatingHeaderView2.getContext();
                int i18 = NovaSlidingTabStrip.f45815j;
                gVarArr = gVarArr2;
                StateListDrawable stateListDrawable = new StateListDrawable();
                layoutInflater = layoutInflaterFrom;
                GradientDrawable gradientDrawable = new GradientDrawable();
                UInt.Companion companion = UInt.f71696b;
                Pair pairE = ab.e0.E(i17, vVar3);
                wVar = wVar2;
                GradientDrawable gradientDrawable2 = new GradientDrawable();
                vVar = vVar3;
                Pair pair = (Pair) pairE.f71683a;
                e0Var = e0Var2;
                gradientDrawable2.setColor(((tz.c) pair.f71683a).f90097a);
                i12 = i14;
                gradientDrawable2.setCornerRadius(bh.g.M(context2, 12));
                stateListDrawable.addState(new int[]{16842913}, gradientDrawable2);
                Pair pair2 = (Pair) pairE.f71684b;
                gradientDrawable.setColor(((tz.c) pair2.f71683a).f90097a);
                gradientDrawable.setCornerRadius(bh.g.N(context2.getResources().getDisplayMetrics(), 12));
                stateListDrawable.addState(new int[0], gradientDrawable);
                ColorStateList colorStateList = new ColorStateList(new int[][]{new int[]{16842913}, new int[0]}, new int[]{((tz.c) pair.f71684b).f90097a, ((tz.c) pair2.f71684b).f90097a});
                r13.setBackground(stateListDrawable);
                r13.setTextColor(colorStateList);
            } else {
                gVarArr = gVarArr2;
                layoutInflater = layoutInflaterFrom;
                wVar = wVar2;
                vVar = vVar3;
                e0Var = e0Var2;
                i12 = i14;
            }
            final NovaSlidingTabStrip novaSlidingTabStrip = floatingHeaderView2.f21059f;
            novaSlidingTabStrip.getClass();
            r13.setTag(jVar);
            novaSlidingTabStrip.d().addView(r13, r13.getLayoutParams());
            ?? r132 = (SpinnerTabView) r13;
            if (z13) {
                final uy.l lVar = (uy.l) jVar;
                Context context3 = novaSlidingTabStrip.getContext();
                q0 q0Var2 = n1.C0;
                final NovaLauncher novaLauncher = (NovaLauncher) k.Y(context3);
                final l30.e eVarQ = l30.e.q(novaLauncher.i1(), false);
                if (a3.f51435a.f51552h) {
                    strArr = new String[3];
                    strArr[0] = novaSlidingTabStrip.getContext().getString(2132018244);
                    strArr[i16] = novaSlidingTabStrip.getContext().getString(2132017776);
                    strArr[2] = novaSlidingTabStrip.getContext().getString(2132017985);
                } else {
                    strArr = new String[2];
                    strArr[0] = novaSlidingTabStrip.getContext().getString(2132017776);
                    strArr[i16] = novaSlidingTabStrip.getContext().getString(2132017985);
                }
                eVarQ.j(new kz.l(strArr, novaLauncher, lVar, novaSlidingTabStrip, novaLauncher.i1()));
                eVarQ.f84873p = new AdapterView.OnItemClickListener() { // from class: kz.h
                    @Override // android.widget.AdapterView.OnItemClickListener
                    public final void onItemClick(AdapterView adapterView, View view, int i19, long j11) {
                        int i21 = NovaSlidingTabStrip.f45815j;
                        NovaLauncher novaLauncher2 = novaLauncher;
                        if (novaLauncher2.a0()) {
                            boolean z14 = a3.f51435a.f51552h;
                            uy.l lVar2 = lVar;
                            if (z14 && i19 == 0) {
                                lVar2.f91722l = !lVar2.f91722l;
                                AllAppsContainerView allAppsContainerView = novaSlidingTabStrip.f45817b;
                                if (allAppsContainerView == null) {
                                    Intrinsics.m("containerView");
                                    throw null;
                                }
                                allAppsContainerView.m();
                            } else if (i19 == 1) {
                                DialogAddDrawerGroupFragment.o(lVar2).show(novaLauncher2.getSupportFragmentManager(), "dialog");
                            } else if (i19 == 2) {
                                novaLauncher2.startActivity(new Intent(novaLauncher2, (Class<?>) GroupAppListActivity.class));
                            }
                            eVarQ.dismiss();
                        }
                    }
                };
                eVarQ.p();
                eVarQ.o();
                r132.f46486a = eVarQ;
                eVarQ.o = r132;
                r132.f46488c = new l1(eVarQ, r132);
                r132.setOnTouchListener(r132);
            } else {
                Context context4 = novaSlidingTabStrip.getContext();
                q0 q0Var3 = n1.C0;
                NovaLauncher novaLauncher2 = (NovaLauncher) k.Y(context4);
                l30.e eVarQ2 = l30.e.q(novaLauncher2.i1(), false);
                eVarQ2.j(new kz.m(novaLauncher2.i1(), new String[]{novaSlidingTabStrip.getContext().getString(2132017776), novaSlidingTabStrip.getContext().getString(2132019484)}));
                eVarQ2.f84873p = new h10.p(i16, novaLauncher2, eVarQ2, novaSlidingTabStrip);
                eVarQ2.p();
                eVarQ2.o();
                r132.f46486a = eVarQ2;
                eVarQ2.o = r132;
                r132.f46488c = new l1(eVarQ2, r132);
                r132.setOnTouchListener(r132);
            }
            i15++;
            gVarArr2 = gVarArr;
            layoutInflaterFrom = layoutInflater;
            wVar2 = wVar;
            vVar3 = vVar;
            e0Var2 = e0Var;
            i14 = i12;
            z11 = false;
            i13 = 1;
        }
        final NovaSlidingTabStrip novaSlidingTabStrip2 = floatingHeaderView2.f21059f;
        r rVar = novaSlidingTabStrip2.f45819d;
        int[] iArr = new int[novaSlidingTabStrip2.d().getChildCount()];
        int i19 = novaSlidingTabStrip2.f45820e;
        int childCount = novaSlidingTabStrip2.d().getChildCount();
        for (int i21 = 0; i21 < childCount; i21++) {
            View childAt = novaSlidingTabStrip2.d().getChildAt(i21);
            Intrinsics.e(childAt, "null cannot be cast to non-null type android.widget.TextView");
            TextView textView = (TextView) childAt;
            Object tag = textView.getTag();
            Intrinsics.e(tag, "null cannot be cast to non-null type com.teslacoilsw.launcher.drawer.drawergroups.DrawerGroup.DrawerTab");
            int i22 = ((j) tag).f91755g;
            if (i22 == 262914) {
                i22 = novaSlidingTabStrip2.f45821f;
            }
            textView.setOnClickListener(rVar);
            if (novaSlidingTabStrip2.f45822g != e0.f51475b) {
                textView.setTextColor(new ColorStateList(new int[][]{new int[]{16842913}, new int[0]}, new int[]{i22, i19}));
            }
            iArr[i21] = i22;
        }
        rVar.f74688m = iArr;
        LayoutInflater layoutInflaterFrom2 = LayoutInflater.from(novaSlidingTabStrip2.getContext());
        while (novaSlidingTabStrip2.getChildCount() > 1) {
            novaSlidingTabStrip2.removeViewAt(1);
        }
        e10.g2 g2Var = a3.f51435a;
        EnumSet enumSet = g2Var.f51549e;
        t1 t1Var = t1.f51826c;
        if (enumSet.contains(t1Var)) {
            View viewInflate = layoutInflaterFrom2.inflate(2131624231, (ViewGroup) novaSlidingTabStrip2, false);
            Intrinsics.e(viewInflate, "null cannot be cast to non-null type android.widget.ImageView");
            imageView = (ImageView) viewInflate;
            imageView.setImageResource(2131231433);
            imageView.setContentDescription(novaSlidingTabStrip2.getResources().getString(2132018765));
            imageView.setOnKeyListener(null);
            imageView.setColorFilter(i19, PorterDuff.Mode.MULTIPLY);
            final int i23 = 0;
            imageView.setOnClickListener(new View.OnClickListener() { // from class: kz.g
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    int i24 = i23;
                    NovaSlidingTabStrip novaSlidingTabStrip3 = novaSlidingTabStrip2;
                    switch (i24) {
                        case 0:
                            int i25 = NovaSlidingTabStrip.f45815j;
                            Context context5 = novaSlidingTabStrip3.getContext();
                            q0 q0Var4 = n1.C0;
                            NovaLauncher novaLauncher3 = (NovaLauncher) o9.k.Y(context5);
                            o2.f fVar = f0.f82722a;
                            novaLauncher3.t1(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                            break;
                        default:
                            int i26 = NovaSlidingTabStrip.f45815j;
                            Context context6 = novaSlidingTabStrip3.getContext();
                            q0 q0Var5 = n1.C0;
                            ((NovaLauncher) o9.k.Y(context6)).q0(view, new Intent("android.intent.action.MAIN").addCategory("android.intent.category.APP_MARKET").addFlags(SQLiteDatabase.OPEN_NOMUTEX).addFlags(268435456).addFlags(67108864), null);
                            break;
                    }
                }
            });
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(imageView.getLayoutParams());
            layoutParams.weight = 0.0f;
            novaSlidingTabStrip2.addView(imageView, layoutParams);
        } else {
            imageView = null;
        }
        EnumSet enumSet2 = g2Var.f51549e;
        t1 t1Var2 = t1.f51825b;
        if (enumSet2.contains(t1Var2)) {
            View viewInflate2 = layoutInflaterFrom2.inflate(2131624231, (ViewGroup) novaSlidingTabStrip2, false);
            Intrinsics.e(viewInflate2, "null cannot be cast to non-null type android.widget.ImageView");
            imageView = (ImageView) viewInflate2;
            imageView.setImageResource(2131231427);
            imageView.setContentDescription(novaSlidingTabStrip2.getResources().getString(2132018207));
            imageView.setOnKeyListener(null);
            imageView.setColorFilter(i19, PorterDuff.Mode.MULTIPLY);
            i5 = 2132018207;
            final int i24 = 1;
            imageView.setOnClickListener(new View.OnClickListener() { // from class: kz.g
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    int i242 = i24;
                    NovaSlidingTabStrip novaSlidingTabStrip3 = novaSlidingTabStrip2;
                    switch (i242) {
                        case 0:
                            int i25 = NovaSlidingTabStrip.f45815j;
                            Context context5 = novaSlidingTabStrip3.getContext();
                            q0 q0Var4 = n1.C0;
                            NovaLauncher novaLauncher3 = (NovaLauncher) o9.k.Y(context5);
                            o2.f fVar = f0.f82722a;
                            novaLauncher3.t1(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                            break;
                        default:
                            int i26 = NovaSlidingTabStrip.f45815j;
                            Context context6 = novaSlidingTabStrip3.getContext();
                            q0 q0Var5 = n1.C0;
                            ((NovaLauncher) o9.k.Y(context6)).q0(view, new Intent("android.intent.action.MAIN").addCategory("android.intent.category.APP_MARKET").addFlags(SQLiteDatabase.OPEN_NOMUTEX).addFlags(268435456).addFlags(67108864), null);
                            break;
                    }
                }
            });
            LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(imageView.getLayoutParams());
            layoutParams2.weight = 0.0f;
            novaSlidingTabStrip2.addView(imageView, layoutParams2);
        } else {
            i5 = 2132018207;
        }
        EnumSet enumSet3 = g2Var.f51549e;
        t1 t1Var3 = t1.f51824a;
        if (enumSet3.contains(t1Var3)) {
            View viewInflate3 = layoutInflaterFrom2.inflate(2131624231, (ViewGroup) novaSlidingTabStrip2, false);
            Intrinsics.e(viewInflate3, "null cannot be cast to non-null type android.widget.ImageView");
            imageView = (ImageView) viewInflate3;
            imageView.setImageResource(2131231627);
            imageView.setContentDescription(novaSlidingTabStrip2.getResources().getString(2132018243));
            imageView.setOnKeyListener(null);
            imageView.setColorFilter(i19, PorterDuff.Mode.SRC_ATOP);
            LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(imageView.getLayoutParams());
            layoutParams3.weight = 0.0f;
            novaSlidingTabStrip2.addView(imageView, layoutParams3);
        }
        if (imageView != null) {
            Context context5 = novaSlidingTabStrip2.getContext();
            q0 q0Var4 = n1.C0;
            final NovaLauncher novaLauncher3 = (NovaLauncher) k.Y(context5);
            boolean zContains = g2Var.f51549e.contains(t1Var3);
            final l30.e eVarQ3 = l30.e.q(novaLauncher3.i1(), zContains);
            eVarQ3.f84871l = 8388613;
            eVarQ3.f84865f = e.k(-4);
            if (zContains) {
                eVarQ3.f(e.k(4));
            }
            final ArrayList arrayList2 = new ArrayList();
            if (g2Var.f51549e.contains(t1Var2)) {
                i11 = 0;
            } else {
                i11 = 0;
                arrayList2.add(new Pair(Integer.valueOf(i5), new Runnable() { // from class: kz.i
                    @Override // java.lang.Runnable
                    public final void run() {
                        int i25 = i11;
                        ImageView imageView2 = imageView;
                        NovaLauncher novaLauncher4 = novaLauncher3;
                        switch (i25) {
                            case 0:
                                int i26 = NovaSlidingTabStrip.f45815j;
                                novaLauncher4.q0(imageView2, new Intent("android.intent.action.MAIN").addCategory("android.intent.category.APP_MARKET").addFlags(SQLiteDatabase.OPEN_NOMUTEX).addFlags(268435456).addFlags(67108864), null);
                                break;
                            default:
                                int i27 = NovaSlidingTabStrip.f45815j;
                                novaLauncher4.q0(imageView2, mx.c0.NOVA_SETTINGS.b(), null);
                                break;
                        }
                    }
                }));
            }
            if (!g2Var.f51549e.contains(t1Var)) {
                arrayList2.add(new Pair(2132018765, new kz.j(novaLauncher3, i11)));
            }
            final int i25 = 1;
            arrayList2.add(new Pair(2132019012, new Runnable() { // from class: kz.i
                @Override // java.lang.Runnable
                public final void run() {
                    int i252 = i25;
                    ImageView imageView2 = imageView;
                    NovaLauncher novaLauncher4 = novaLauncher3;
                    switch (i252) {
                        case 0:
                            int i26 = NovaSlidingTabStrip.f45815j;
                            novaLauncher4.q0(imageView2, new Intent("android.intent.action.MAIN").addCategory("android.intent.category.APP_MARKET").addFlags(SQLiteDatabase.OPEN_NOMUTEX).addFlags(268435456).addFlags(67108864), null);
                            break;
                        default:
                            int i27 = NovaSlidingTabStrip.f45815j;
                            novaLauncher4.q0(imageView2, mx.c0.NOVA_SETTINGS.b(), null);
                            break;
                    }
                }
            }));
            String[] strArr2 = new String[arrayList2.size()];
            int size = arrayList2.size();
            for (int i26 = 0; i26 < size; i26++) {
                strArr2[i26] = novaSlidingTabStrip2.getResources().getString(((Number) ((Pair) arrayList2.get(i26)).f71683a).intValue());
            }
            eVarQ3.j(new ArrayAdapter(novaLauncher3.i1(), 2131624193, strArr2));
            eVarQ3.f84873p = new AdapterView.OnItemClickListener() { // from class: kz.k
                @Override // android.widget.AdapterView.OnItemClickListener
                public final void onItemClick(AdapterView adapterView, View view, int i27, long j11) {
                    int i28 = NovaSlidingTabStrip.f45815j;
                    ((Runnable) ((Pair) arrayList2.get(i27)).f71684b).run();
                    eVarQ3.dismiss();
                }
            };
            imageView.setOnTouchListener(new l1(eVarQ3, imageView));
            eVarQ3.o = imageView;
            eVarQ3.p();
            eVarQ3.o();
            if (zContains) {
                imageView.setOnClickListener(new fk.t(eVarQ3, 16));
            }
        }
        boolean z14 = false;
        if (arrayList.size() > 0) {
            floatingHeaderView2.f21063j = (ViewGroup) ((a) arrayList.get(0)).getParent();
            o9.m mVar = floatingHeaderView2.f21060g;
            if (mVar == null || !arrayList.contains(mVar)) {
                z14 = false;
                mVar = (o9.m) arrayList.get(0);
            } else {
                z14 = false;
            }
            floatingHeaderView2.i(mVar);
            floatingHeaderView2.g(z14);
        }
        if (floatingHeaderView2.f21064k) {
            floatingHeaderView2.j(true);
        }
        int iF = f();
        ?? r22 = z14;
        while (true) {
            g[] gVarArr3 = this.f21024f;
            if (r22 >= gVarArr3.length) {
                return;
            }
            g gVar2 = gVarArr3[r22];
            gVar2.f83831e.top = iF;
            gVar2.a();
            a aVar2 = this.f21024f[r22].f83833g;
            if (aVar2 != null) {
                aVar2.n();
            }
            r22++;
        }
    }

    public final void w(boolean z11) {
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.f21031m.getLayoutParams();
        if (z11) {
            this.G = c0.f51451c;
            layoutParams.addRule(10, 1);
            layoutParams.removeRule(12);
        } else {
            this.G = c0.f51452d;
            layoutParams.addRule(12, 1);
            layoutParams.removeRule(10);
            n1 n1Var = (n1) this.f21023e;
            if (!n1Var.t0(l2.o)) {
                this.f21031m.setTranslationY(l2.f79974m.g(n1Var).f16155b);
            }
        }
        this.f21031m.setLayoutParams(layoutParams);
        ViewGroup viewGroupD = d();
        RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) viewGroupD.getLayoutParams();
        RelativeLayout.LayoutParams layoutParams3 = (RelativeLayout.LayoutParams) this.L.getLayoutParams();
        RelativeLayout.LayoutParams layoutParams4 = (RelativeLayout.LayoutParams) this.o.getLayoutParams();
        if (this.M) {
            if (this.G == c0.f51452d) {
                layoutParams3.topMargin = 0;
                layoutParams3.bottomMargin = 0;
                layoutParams3.removeRule(3);
                layoutParams3.addRule(2, 2131428755);
                layoutParams4.topMargin = 0;
                layoutParams2.removeRule(6);
                NovaSlidingTabStrip novaSlidingTabStrip = this.B;
                if (novaSlidingTabStrip != null) {
                    layoutParams2.addRule(2, novaSlidingTabStrip.getId());
                } else {
                    layoutParams2.addRule(8, 2131428755);
                }
                if (this.f21032p && this.J == c0.f51451c) {
                    layoutParams2.topMargin = getResources().getDimensionPixelSize(2131165281) + this.f21022d.top;
                } else {
                    layoutParams2.topMargin = 0;
                }
            } else {
                layoutParams3.topMargin = -e.k(32);
                layoutParams3.removeRule(2);
                layoutParams3.addRule(3, 2131428755);
                layoutParams4.topMargin = e.k(72);
                layoutParams2.removeRule(2);
                layoutParams2.removeRule(8);
                layoutParams2.addRule(3, this.L.getId());
                if (this.f21032p && this.J == c0.f51451c) {
                    layoutParams2.topMargin = e.k(60) + getResources().getDimensionPixelSize(2131165281);
                } else {
                    layoutParams2.topMargin = e.k(20);
                }
            }
        } else if (this.G == c0.f51452d) {
            layoutParams3.topMargin = 0;
            layoutParams3.bottomMargin = 0;
            layoutParams3.removeRule(3);
            layoutParams3.addRule(2, 2131428755);
            layoutParams4.topMargin = 0;
            layoutParams2.removeRule(6);
            if (this.B != null) {
                layoutParams2.removeRule(8);
                layoutParams2.addRule(2, this.B.getId());
            } else {
                layoutParams2.addRule(8, 2131428755);
            }
            layoutParams2.topMargin = 0;
        } else {
            layoutParams3.topMargin = -e.k(32);
            layoutParams3.removeRule(2);
            layoutParams3.addRule(3, 2131428755);
            layoutParams4.topMargin = e.k(72);
            layoutParams2.addRule(6, 2131428755);
            layoutParams2.removeRule(2);
            layoutParams2.removeRule(8);
            if (this.f21032p && this.J == c0.f51451c) {
                layoutParams2.topMargin = getResources().getDimensionPixelSize(2131165282) + getResources().getDimensionPixelSize(2131165281);
            } else {
                layoutParams2.topMargin = e.k(32);
            }
        }
        viewGroupD.setLayoutParams(layoutParams2);
        this.o.setLayoutParams(layoutParams4);
        this.L.setLayoutParams(layoutParams3);
    }

    public final void x(int i5) {
        AppSearchResultsView appSearchResultsView;
        if (this.M && (appSearchResultsView = this.L) != null) {
            int height = appSearchResultsView.getHeight();
            this.L.setTranslationY(-i5);
            this.o.setTranslationY(Math.max(r2, -height));
            this.o.f21068q = height;
        }
        float f11 = this.f21039w;
        int iN = r4.a.n(r4.a.f(g3.b(i5 / f11, 0.0f, 1.0f), this.f21037u, this.f21038v), (int) (this.f21031m.getAlpha() * 255.0f));
        int iB = this.o.e() == 0 ? 0 : (int) (g3.b((i5 + this.o.f21065l) / f11, 0.0f, 1.0f) * 255.0f);
        if (iN == this.f21041y && this.f21042z == iB) {
            return;
        }
        this.f21041y = iN;
        this.f21042z = iB;
        j();
    }

    public final void y(boolean z11) {
        ViewGroup viewGroupD = d();
        a aVarA = a();
        RecyclerViewFastScroller recyclerViewFastScrollerI = aVarA == null ? null : aVarA.i();
        boolean z12 = false;
        boolean z13 = this.M;
        if (z13) {
            if (viewGroupD != null) {
                viewGroupD.setVisibility(0);
            }
            if (recyclerViewFastScrollerI != null) {
                recyclerViewFastScrollerI.setVisibility(0);
            }
            this.o.setVisibility(0);
            RecyclerViewFastScroller recyclerViewFastScroller = this.f21034r;
            if (recyclerViewFastScroller != null) {
                recyclerViewFastScroller.setVisibility(0);
            }
            NovaSlidingTabStrip novaSlidingTabStrip = this.B;
            if (novaSlidingTabStrip != null) {
                novaSlidingTabStrip.setVisibility(0);
            }
        } else if (z11) {
            if (viewGroupD != null) {
                viewGroupD.setVisibility(4);
            }
            if (recyclerViewFastScrollerI != null) {
                recyclerViewFastScrollerI.setVisibility(4);
            }
            this.o.setVisibility(4);
            RecyclerViewFastScroller recyclerViewFastScroller2 = this.f21034r;
            if (recyclerViewFastScroller2 != null) {
                recyclerViewFastScroller2.setVisibility(4);
            }
            NovaSlidingTabStrip novaSlidingTabStrip2 = this.B;
            if (novaSlidingTabStrip2 != null) {
                novaSlidingTabStrip2.setVisibility(8);
            }
        } else {
            if (viewGroupD != null) {
                s9.a.a(viewGroupD);
            }
            if (recyclerViewFastScrollerI != null) {
                s9.a.a(recyclerViewFastScrollerI);
            }
            s9.a.a(this.o);
            RecyclerViewFastScroller recyclerViewFastScroller3 = this.f21034r;
            if (recyclerViewFastScroller3 != null) {
                s9.a.a(recyclerViewFastScroller3);
            }
            NovaSlidingTabStrip novaSlidingTabStrip3 = this.B;
            if (novaSlidingTabStrip3 != null) {
                novaSlidingTabStrip3.setVisibility(0);
            }
        }
        AppSearchResultsView appSearchResultsView = this.L;
        if (appSearchResultsView != null) {
            l lVar = this.f21023e;
            if (z13) {
                appSearchResultsView.C(lVar.C().f90099b);
                RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.L.getLayoutParams();
                int i5 = z11 ? -1 : -2;
                if (layoutParams.height != i5) {
                    layoutParams.height = i5;
                    this.L.setLayoutParams(layoutParams);
                }
            } else {
                if (z11 && appSearchResultsView.getVisibility() != 0) {
                    this.L.C(lVar.C().f90099b);
                }
                this.L.setVisibility(z11 ? 0 : 8);
            }
            if (this.H == c0.f51452d) {
                if (this.O || (!z13 && z11)) {
                    z12 = true;
                }
                w(z12);
            }
        }
    }

    public final void z(c0 c0Var, c0 c0Var2, boolean z11, Rect rect) {
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) ((RecyclerViewFastScroller) findViewById(2131428044)).getLayoutParams();
        layoutParams.topMargin = getResources().getDimensionPixelOffset(2131165282);
        if (!z11) {
            layoutParams.removeRule(3);
            layoutParams.addRule(6, 2131427512);
            layoutParams.addRule(6, 2131427481);
            if (this.f21032p && c0Var2 == c0.f51451c) {
                layoutParams.topMargin = getResources().getDimensionPixelOffset(2131165281) + f() + rect.top;
            } else {
                layoutParams.topMargin = (f() + rect.top) - this.o.d();
            }
        }
        c0 c0Var3 = c0.f51452d;
        if (c0Var == c0Var3) {
            layoutParams.removeRule(3);
            layoutParams.addRule(12, 1);
            layoutParams.bottomMargin = rect.bottom + this.f21031m.getLayoutParams().height;
        } else if (c0Var == c0.f51450b) {
            layoutParams.addRule(10, 1);
            if (z11) {
                layoutParams.topMargin = rect.top;
            }
        }
        l lVar = this.f21023e;
        if (c0Var == c0Var3 && ((NovaLauncher) lVar).t0(l2.o)) {
            this.f21031m.setTranslationY(0.0f);
            this.f21031m.setElevation(1.0f);
        }
        if (c0Var2 == c0Var3) {
            int dimensionPixelSize = getResources().getDimensionPixelSize(2131165281) + rect.bottom;
            layoutParams.bottomMargin = dimensionPixelSize;
            if (c0Var == c0Var3) {
                layoutParams.bottomMargin = dimensionPixelSize + this.f21031m.getLayoutParams().height;
            }
        }
        if (isAttachedToWindow()) {
            if (((n0) y2.f51877a.j0().l()).f51677a != p0.f51735c || Folder.f0((n1) lVar) == null) {
                ((NovaLauncher) lVar).M.n(false);
            }
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AllAppsContainerView(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, 0);
        int i11 = 0;
        this.f21021c = new Paint(1);
        this.f21022d = new Rect();
        this.f21024f = new g[0];
        p pVar = new p();
        this.f21025g = pVar;
        this.f21026h = new d(this, i11);
        this.f21029k = 0;
        this.f21035s = new Point();
        this.B = null;
        this.C = new Path();
        this.D = false;
        this.I = false;
        this.O = false;
        this.P = null;
        this.Q = 1.0f;
        this.R = 0.0f;
        this.S = new i();
        this.T = null;
        l lVar = (l) k.Y(context);
        this.f21023e = lVar;
        this.f21037u = aa.p.b(context, 2130968660);
        this.f21039w = getResources().getDimensionPixelSize(2131165443);
        this.f21038v = aa.p.b(context, 2130968662);
        lVar.f79932v.add(this);
        this.f21036t = new b();
        UserManager userManager = (UserManager) lVar.getSystemService(UserManager.class);
        g3.l(lVar);
        m0 m0Var = new m0();
        m0Var.f619b = userManager;
        m0Var.f620c = this;
        m0Var.f621d = new z();
        this.f21027i = m0Var;
        y2 y2Var = y2.f51877a;
        this.A = y2Var.W().l() == e10.d0.f51461d;
        Paint paint = new Paint();
        this.f21028j = paint;
        Paint paint2 = new Paint();
        this.E = paint2;
        if (tz.v.b(lVar.C().f90099b, context)) {
            paint.setColor(1073741824);
        } else {
            paint.setColor(1728053247);
        }
        paint2.setColor(paint.getColor());
        this.F = paint.getAlpha();
        pVar.a(new q9.a(this, i11));
        zy.c cVar = zy.c.f98823a;
        boolean zD = zy.c.d("branch_search_enabled", false);
        this.M = zD;
        c0 c0Var = zD ? c0.f51451c : (c0) y2Var.S().l();
        this.G = c0Var;
        this.H = c0Var;
        this.J = (c0) y2Var.a0().l();
        this.K = new g2();
    }
}
