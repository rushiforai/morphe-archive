package com.android.launcher3.folder;

import aa.n;
import android.content.ComponentName;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.Point;
import android.os.Process;
import android.os.UserHandle;
import android.util.ArrayMap;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import ca.a;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.CellLayout;
import com.android.launcher3.pageindicators.PageIndicatorDots;
import com.android.launcher3.util.ComponentKey;
import com.android.launcher3.views.DoubleShadowBubbleTextView;
import com.teslacoilsw.launcher.NovaLauncher;
import e10.k0;
import ga.e;
import ga.j;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kl.q0;
import kotlin.jvm.internal.Intrinsics;
import mx.f;
import mx.j0;
import n30.c;
import o9.b3;
import o9.g3;
import o9.k;
import o9.n1;
import o9.s2;
import o9.v;
import ox.p;
import ua.g;
import y9.q;
import ya.w;
import za.d;
import za.m;

/* loaded from: classes.dex */
public class FolderPagedView extends s2 implements m, c {

    /* renamed from: k0, reason: collision with root package name */
    public static final int[] f21135k0 = new int[2];
    public final boolean T;
    public final a U;
    public final ArrayMap V;
    public q W;

    /* renamed from: a0, reason: collision with root package name */
    public final vm.c f21136a0;

    /* renamed from: b0, reason: collision with root package name */
    public int f21137b0;

    /* renamed from: c0, reason: collision with root package name */
    public int f21138c0;

    /* renamed from: d0, reason: collision with root package name */
    public int f21139d0;

    /* renamed from: e0, reason: collision with root package name */
    public Folder f21140e0;

    /* renamed from: f0, reason: collision with root package name */
    public p f21141f0;

    /* renamed from: g0, reason: collision with root package name */
    public final ox.q f21142g0;

    /* renamed from: h0, reason: collision with root package name */
    public Path f21143h0;

    /* renamed from: i0, reason: collision with root package name */
    public boolean f21144i0;

    /* renamed from: j0, reason: collision with root package name */
    public f f21145j0;

    public FolderPagedView(Context context, AttributeSet attributeSet) {
        vm.c cVar;
        super(context, attributeSet, 0);
        this.V = new ArrayMap();
        this.f21142g0 = ox.q.c();
        this.f21144i0 = false;
        this.T = g3.p(getResources());
        setImportantForAccessibility(1);
        this.U = new a((View) this);
        try {
            cVar = ((d) d.p(context)).j();
        } catch (Exception unused) {
            cVar = new vm.c(29);
        }
        this.f21136a0 = cVar;
    }

    public static final void z0(StringBuilder sb2, View view, int i5) {
        for (int i11 = 0; i11 < i5; i11++) {
            sb2.append(" ");
        }
        sb2.append(view.getId());
        sb2.append(" ");
        sb2.append(view);
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            int childCount = viewGroup.getChildCount();
            for (int i12 = 0; i12 < childCount; i12++) {
                z0(sb2, viewGroup.getChildAt(i12), i5 + 1);
            }
        }
    }

    @Override // za.m
    public final void A(Path path) {
        this.f21143h0 = path;
        invalidate();
    }

    public final CellLayout A0() {
        return (CellLayout) getChildAt(G());
    }

    public final int B0() {
        if (getChildCount() <= 0) {
            return 0;
        }
        CellLayout cellLayout = (CellLayout) getChildAt(0);
        return getPaddingBottom() + getPaddingTop() + ((cellLayout.f20904h - 1) * cellLayout.f20901f.y) + (Math.max(1, cellLayout.f20904h) * cellLayout.f20895c) + cellLayout.getPaddingBottom() + cellLayout.getPaddingTop();
    }

    public final int C0() {
        if (getChildCount() <= 0) {
            return 0;
        }
        CellLayout cellLayout = (CellLayout) getChildAt(0);
        return getPaddingRight() + getPaddingLeft() + ((cellLayout.f20903g - 1) * cellLayout.f20901f.x) + (Math.max(1, cellLayout.f20903g) * cellLayout.f20893b) + cellLayout.getPaddingRight() + cellLayout.getPaddingLeft();
    }

    public final boolean D0() {
        Folder folder = this.f21140e0;
        if (folder == null || !folder.h0()) {
            return false;
        }
        ga.c cVar = this.f21140e0.f21115m;
        return (cVar instanceof iz.a) && ((iz.a) cVar).I.e();
    }

    public final View E0(w wVar) {
        for (int i5 = 0; i5 < getChildCount(); i5++) {
            CellLayout cellLayout = (CellLayout) getChildAt(i5);
            for (int i11 = 0; i11 < cellLayout.f20904h; i11++) {
                for (int i12 = 0; i12 < cellLayout.f20903g; i12++) {
                    View viewA = cellLayout.P.a(i12, i11);
                    if (viewA != null && (viewA.getTag() instanceof e) && wVar.k(viewA, (e) viewA.getTag())) {
                        return viewA;
                    }
                }
            }
        }
        return null;
    }

    public final void F0(int i5) {
        this.f21137b0 = i5;
        this.W.c(i5);
        q qVar = this.W;
        this.f21138c0 = qVar.f96948f;
        this.f21139d0 = qVar.f96949g;
        for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
            ((CellLayout) getChildAt(childCount)).P(this.f21138c0, this.f21139d0);
        }
    }

    public final void G0() {
        vm.c cVar;
        int childCount = getChildCount();
        while (true) {
            childCount--;
            if (childCount < 0) {
                removeAllViews();
                this.f21141f0 = null;
                this.f21142g0.i();
                this.f21144i0 = false;
                return;
            }
            CellLayout cellLayout = (CellLayout) getChildAt(childCount);
            b3 b3Var = cellLayout.P;
            int childCount2 = b3Var.getChildCount();
            while (true) {
                childCount2--;
                cVar = this.f21136a0;
                if (childCount2 >= 0) {
                    View childAt = b3Var.getChildAt(childCount2);
                    childAt.setVisibility(0);
                    if (!(childAt instanceof FolderIcon) && !(childAt instanceof p)) {
                        cVar.u(2131624153, childAt);
                    }
                }
            }
            cellLayout.removeAllViews();
            cVar.u(2131624155, cellLayout);
        }
    }

    @Override // o9.s2
    public final View H(int i5) {
        return (CellLayout) getChildAt(i5);
    }

    public final void H0(int i5) {
        CellLayout cellLayout = (CellLayout) getChildAt(i5);
        if (cellLayout != null) {
            b3 b3Var = cellLayout.P;
            for (int childCount = b3Var.getChildCount() - 1; childCount >= 0; childCount--) {
                View childAt = b3Var.getChildAt(childCount);
                if (childAt instanceof BubbleTextView) {
                    BubbleTextView bubbleTextView = (BubbleTextView) childAt;
                    bubbleTextView.U();
                    n nVar = bubbleTextView.f20869f;
                    if (nVar != null) {
                        nVar.setCallback(bubbleTextView);
                    }
                }
            }
        }
    }

    @Override // o9.s2
    public final void U(int i5) {
        super.U(i5);
        Folder folder = this.f21140e0;
        if (folder != null) {
            folder.q0();
        }
    }

    @Override // o9.s2
    public final void W() {
        H0(this.f80106f - 1);
        H0(this.f80106f + 1);
    }

    @Override // o9.s2, android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        Path path = this.f21143h0;
        a aVar = this.U;
        if (path == null) {
            aVar.b(canvas);
            super.dispatchDraw(canvas);
            return;
        }
        int iSave = canvas.save();
        canvas.clipPath(this.f21143h0);
        aVar.b(canvas);
        super.dispatchDraw(canvas);
        canvas.restoreToCount(iSave);
    }

    @Override // n30.c
    public final boolean f() {
        return false;
    }

    @Override // o9.s2
    public final boolean n(float f11, float f12) {
        return o9.a.P(this.f21140e0.f21113k, 7471102) == null;
    }

    @Override // o9.s2, android.view.View
    public final void onScrollChanged(int i5, int i11, int i12, int i13) {
        super.onScrollChanged(i5, i11, i12, i13);
        if (this.f80109i > 0) {
            PageIndicatorDots pageIndicatorDots = (PageIndicatorDots) this.E;
            int iG = this.f80118t.g(this);
            int i14 = this.f80109i;
            int i15 = pageIndicatorDots.f21204d;
            if (i15 > 1) {
                if (pageIndicatorDots.f21203c) {
                    iG = i14 - iG;
                }
                int i16 = i14 / (i15 - 1);
                int i17 = iG / i16;
                int i18 = i17 * i16;
                int i19 = i18 + i16;
                float f11 = i16 * 0.1f;
                float f12 = iG;
                if (f12 < i18 + f11) {
                    pageIndicatorDots.d(i17);
                } else if (f12 > i19 - f11) {
                    pageIndicatorDots.d(i17 + 1);
                } else {
                    pageIndicatorDots.d(i17 + 0.5f);
                }
            }
        }
    }

    @Override // o9.s2
    public final void q(MotionEvent motionEvent, float f11) {
        if (this.f80118t == ua.f.f90758np) {
            Context context = getContext();
            q0 q0Var = n1.C0;
            NovaLauncher novaLauncher = (NovaLauncher) k.Y(context);
            boolean z11 = motionEvent.getY() - this.n <= 0.0f;
            if (z11 && (1 & novaLauncher.P.f21089x) != 0) {
                return;
            }
            if (!z11 && (novaLauncher.P.f21089x & 2) != 0) {
                return;
            }
        }
        super.q(motionEvent, 1.0f);
    }

    @Override // o9.s2
    public final int t() {
        return getPaddingRight() + getPaddingLeft();
    }

    public final void t0(View view, j jVar, int i5) {
        int i11 = i5 / this.W.f96946d;
        v vVar = (v) view.getLayoutParams();
        Point pointA = this.W.a(i5);
        vVar.getClass();
        vVar.f80177a = pointA.x;
        vVar.f80178b = pointA.y;
        ((CellLayout) getChildAt(i11)).a(view, -1, jVar.f57289a, vVar, true);
    }

    public final void u0(List list) {
        List list2;
        int i5 = 1;
        if (D0() && this.f21142g0.f()) {
            ArrayList arrayList = new ArrayList(list);
            if (this.f21141f0 == null) {
                p pVar = new p(getContext());
                pVar.c("smart_group_icon", this.f21145j0);
                this.f21141f0 = pVar;
            }
            if (this.f21141f0.getLayoutParams() == null) {
                this.f21141f0.setLayoutParams(new v(0, 0, 1, 1));
            }
            arrayList.add(this.f21141f0);
            list2 = arrayList;
        } else {
            list2 = list;
        }
        int size = list2.size();
        ArrayList arrayList2 = new ArrayList();
        for (int i11 = 0; i11 < getChildCount(); i11++) {
            CellLayout cellLayout = (CellLayout) getChildAt(i11);
            cellLayout.removeAllViews();
            arrayList2.add(cellLayout);
        }
        this.W.d(this.f21140e0.f21115m);
        if (size > 0) {
            F0(size);
        }
        Iterator it = arrayList2.iterator();
        CellLayout cellLayoutX0 = size == 0 ? x0() : null;
        int i12 = 0;
        int i13 = 0;
        int i14 = 0;
        while (i12 < size) {
            View view = list2.size() > i12 ? (View) list2.get(i12) : null;
            if (cellLayoutX0 == null || i13 >= this.W.f96946d) {
                cellLayoutX0 = it.hasNext() ? (CellLayout) it.next() : x0();
                i13 = 0;
            }
            CellLayout cellLayout2 = cellLayoutX0;
            if (view != null) {
                v vVar = (v) view.getLayoutParams();
                Point pointA = this.W.a(i14);
                vVar.getClass();
                vVar.f80177a = pointA.x;
                vVar.f80178b = pointA.y;
                cellLayout2.a(view, -1, view.getTag() instanceof e ? ((e) view.getTag()).f57289a : -1, vVar, true);
                q qVar = this.W;
                if (qVar.f96951i.a(size, i14, qVar.f96948f) >= 0 && (view instanceof BubbleTextView)) {
                    ((BubbleTextView) view).U();
                }
            }
            i14++;
            i13++;
            i12++;
            cellLayoutX0 = cellLayout2;
        }
        boolean z11 = false;
        while (it.hasNext()) {
            removeView((View) it.next());
            z11 = true;
        }
        if (z11) {
            g0(0);
        }
        this.f80124z = getChildCount() > 1;
        ((PageIndicatorDots) this.E).setVisibility(getChildCount() <= 1 ? 8 : 0);
        FolderNameEditText folderNameEditText = this.f21140e0.f21118r;
        if (getChildCount() > 1 && this.f21140e0.T.f51685i == k0.f51620b) {
            i5 = this.T ? 5 : 3;
        }
        folderNameEditText.setGravity(i5);
    }

    public final void v0() {
        if (this.f80118t.g(this) != N(G())) {
            n0(G(), false);
        }
    }

    public final void w0() {
        ArrayMap arrayMap = this.V;
        if (arrayMap.isEmpty()) {
            return;
        }
        for (Map.Entry entry : new ArrayMap(arrayMap).entrySet()) {
            ((View) entry.getKey()).animate().cancel();
            ((Runnable) entry.getValue()).run();
        }
    }

    public final CellLayout x0() {
        j0 j0VarP = this.f21140e0.f21113k.P();
        CellLayout cellLayout = (CellLayout) this.f21136a0.m(2131624155, getContext(), this);
        int i5 = j0VarP.R;
        int i11 = j0VarP.S;
        cellLayout.f20893b = i5;
        cellLayout.f20897d = i5;
        cellLayout.f20895c = i11;
        cellLayout.f20899e = i11;
        b3 b3Var = cellLayout.P;
        b3Var.getClass();
        b3Var.setMotionEventSplittingEnabled(false);
        b3Var.f79779f = true;
        cellLayout.P(this.f21138c0, this.f21139d0);
        addView(cellLayout, -1, generateDefaultLayoutParams());
        return cellLayout;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final DoubleShadowBubbleTextView y0(j jVar) {
        boolean z11;
        DoubleShadowBubbleTextView doubleShadowBubbleTextView;
        DoubleShadowBubbleTextView doubleShadowBubbleTextViewC0;
        int i5;
        if (jVar == null) {
            return null;
        }
        ComponentName component = jVar.f57322x.getComponent();
        UserHandle userHandle = jVar.o;
        if (component == null || !Intrinsics.b(userHandle, Process.myUserHandle())) {
            z11 = false;
        } else if ("com.teslacoilsw.launcher".equals(component.getPackageName()) && r70.j.I0(component.getClassName(), "FOLDER:", false)) {
            String strSubstring = component.getClassName().substring(7);
            Intrinsics.f(strSubstring, "substring(...)");
            try {
                i5 = Integer.parseInt(strSubstring);
            } catch (NumberFormatException unused) {
            }
            if (i5 == -1) {
            }
        } else {
            i5 = -1;
            if (i5 == -1) {
                z11 = true;
            }
        }
        if (z11) {
            doubleShadowBubbleTextViewC0 = FolderIcon.c0(2131624154, (n1) k.Y(getContext()), null, (ga.c) ((n1) k.Y(getContext())).V.f21025g.b(new ComponentKey(jVar.f57322x.getComponent(), jVar.o)));
            doubleShadowBubbleTextViewC0.setTag(jVar);
        } else {
            Context context = getContext();
            vm.c cVar = this.f21136a0;
            View viewM = cVar.m(2131624153, context, null);
            while (true) {
                doubleShadowBubbleTextView = (DoubleShadowBubbleTextView) viewM;
                if (doubleShadowBubbleTextView.getParent() == null) {
                    break;
                }
                StringBuilder sb2 = new StringBuilder("Got view from ViewCache already attached to parent ");
                sb2.append(doubleShadowBubbleTextView.getClass().getName());
                sb2.append(" ");
                StringBuilder sb3 = new StringBuilder();
                z0(sb3, doubleShadowBubbleTextView, 0);
                sb2.append((Object) sb3);
                mc0.d.a(new IllegalStateException(sb2.toString()));
                viewM = cVar.m(2131624153, getContext(), null);
            }
            doubleShadowBubbleTextView.w(jVar);
            doubleShadowBubbleTextViewC0 = doubleShadowBubbleTextView;
        }
        doubleShadowBubbleTextViewC0.r(this.f21145j0);
        doubleShadowBubbleTextViewC0.setOnClickListener(g.f90762b);
        doubleShadowBubbleTextViewC0.setOnLongClickListener(this.f21140e0);
        doubleShadowBubbleTextViewC0.setOnFocusChangeListener(this.U);
        LayoutInflater.Factory factoryJ = this.f21140e0.f21112j.j();
        if (factoryJ instanceof cz.k) {
            doubleShadowBubbleTextViewC0.W((cz.k) factoryJ);
        }
        v vVar = (v) doubleShadowBubbleTextViewC0.getLayoutParams();
        if (vVar == null) {
            doubleShadowBubbleTextViewC0.setLayoutParams(new v(jVar.f57293e.c(this), jVar.f57294f.c(this), jVar.f57295g.c(this), jVar.f57296h.c(this)));
            return doubleShadowBubbleTextViewC0;
        }
        vVar.f80177a = jVar.f57293e.c(this);
        vVar.f80178b = jVar.f57294f.c(this);
        vVar.f80183g = 1;
        vVar.f80182f = 1;
        return doubleShadowBubbleTextViewC0;
    }
}
