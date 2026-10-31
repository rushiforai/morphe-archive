package com.android.launcher3.folder;

import a5.h1;
import aa.w;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.ContentValues;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Insets;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.text.Selection;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Pair;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.OverScroller;
import android.widget.TextView;
import androidx.annotation.Keep;
import androidx.recyclerview.widget.c0;
import androidx.recyclerview.widget.z;
import ca.g;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.CellLayout;
import com.android.launcher3.allapps.AllAppsContainerView;
import com.android.launcher3.dragndrop.DragLayer;
import com.android.launcher3.logging.StatsLogManager;
import com.android.launcher3.pageindicators.PageIndicatorDots;
import com.android.launcher3.popup.PopupContainerWithArrow;
import com.android.launcher3.views.DoubleShadowBubbleTextView;
import com.google.android.gms.internal.measurement.v6;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.launcher3.pageindicators.VerticalPageIndicatorDots;
import e10.i0;
import e10.p0;
import e10.y2;
import fa.o0;
import ga.b;
import ga.j;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.OptionalInt;
import java.util.StringJoiner;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import mx.f;
import mx.j0;
import o7.g0;
import o9.a;
import o9.b3;
import o9.g3;
import o9.h4;
import o9.j2;
import o9.k0;
import o9.l0;
import o9.l2;
import o9.m0;
import o9.n0;
import o9.n1;
import o9.u2;
import o9.v;
import ox.q;
import q4.k;
import r.l1;
import s9.l;
import v30.e;
import x9.c;
import x9.i;
import x9.t;
import y9.h;
import y9.p;
import y9.r;
import y9.u;
import y9.y;
import za.d;
import za.m;

/* loaded from: classes.dex */
public class Folder extends a implements m, k0, View.OnLongClickListener, m0, b, TextView.OnEditorActionListener, View.OnFocusChangeListener, c, n0 {

    /* renamed from: j0, reason: collision with root package name */
    public static final Rect f21093j0 = new Rect();

    /* renamed from: k0, reason: collision with root package name */
    public static final c0 f21094k0 = new c0(6);

    /* renamed from: l0, reason: collision with root package name */
    public static final boolean f21095l0;
    public boolean A;
    public boolean B;
    public View C;
    public boolean D;
    public boolean E;
    public boolean F;
    public boolean G;
    public boolean H;
    public boolean I;
    public boolean J;
    public int K;
    public int L;
    public int M;
    public final StatsLogManager N;
    public l O;
    public GradientDrawable P;
    public final v6 Q;
    public final vm.c R;
    public boolean S;
    public e10.n0 T;
    public f U;
    public l0 V;
    public pr.c W;

    /* renamed from: a0, reason: collision with root package name */
    public VerticalPageIndicatorDots f21096a0;

    /* renamed from: b0, reason: collision with root package name */
    public final Paint f21097b0;

    /* renamed from: c, reason: collision with root package name */
    public final o9.b f21098c;

    /* renamed from: c0, reason: collision with root package name */
    public final Paint f21099c0;

    /* renamed from: d, reason: collision with root package name */
    public final o9.b f21100d;

    /* renamed from: d0, reason: collision with root package name */
    public final Outline f21101d0;

    /* renamed from: e, reason: collision with root package name */
    public final o9.b f21102e;

    /* renamed from: e0, reason: collision with root package name */
    public final Path f21103e0;

    /* renamed from: f, reason: collision with root package name */
    public final o9.b f21104f;

    /* renamed from: f0, reason: collision with root package name */
    public float f21105f0;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f21106g;

    /* renamed from: g0, reason: collision with root package name */
    public FrameLayout f21107g0;

    /* renamed from: h, reason: collision with root package name */
    public AnimatorSet f21108h;

    /* renamed from: h0, reason: collision with root package name */
    public int f21109h0;

    /* renamed from: i, reason: collision with root package name */
    public boolean f21110i;

    /* renamed from: i0, reason: collision with root package name */
    public View f21111i0;

    /* renamed from: j, reason: collision with root package name */
    public final vm.c f21112j;

    /* renamed from: k, reason: collision with root package name */
    public final d f21113k;

    /* renamed from: l, reason: collision with root package name */
    public t f21114l;

    /* renamed from: m, reason: collision with root package name */
    public ga.c f21115m;
    public CharSequence n;
    public da.f o;

    /* renamed from: p, reason: collision with root package name */
    public FolderIcon f21116p;

    /* renamed from: q, reason: collision with root package name */
    public FolderPagedView f21117q;

    /* renamed from: r, reason: collision with root package name */
    public FolderNameEditText f21118r;

    /* renamed from: s, reason: collision with root package name */
    public PageIndicatorDots f21119s;

    /* renamed from: t, reason: collision with root package name */
    public View f21120t;

    /* renamed from: u, reason: collision with root package name */
    public int f21121u;

    /* renamed from: v, reason: collision with root package name */
    public int f21122v;

    /* renamed from: w, reason: collision with root package name */
    public int f21123w;

    /* renamed from: x, reason: collision with root package name */
    public int f21124x;

    /* renamed from: y, reason: collision with root package name */
    public Path f21125y;

    /* renamed from: z, reason: collision with root package name */
    public int f21126z;

    static {
        f21095l0 = Build.VERSION.SDK_INT < 28;
    }

    public Folder(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f21098c = new o9.b();
        this.f21100d = new o9.b();
        this.f21102e = new o9.b();
        this.f21104f = new o9.b();
        this.f21106g = new ArrayList();
        this.f21110i = false;
        this.f21126z = -1;
        this.A = false;
        this.B = false;
        this.E = false;
        this.F = false;
        this.G = false;
        this.H = false;
        this.I = false;
        this.L = -1;
        this.M = -1;
        this.Q = new v6(this, 26);
        this.R = new vm.c(this, 27);
        this.S = false;
        this.V = null;
        this.W = null;
        this.f21096a0 = null;
        this.f21099c0 = new Paint(1);
        this.f21101d0 = new Outline();
        this.f21103e0 = new Path();
        this.f21105f0 = 0.0f;
        this.f21109h0 = 0;
        this.f21111i0 = null;
        setAlwaysDrawnWithCacheEnabled(false);
        d dVar = (d) d.p(context);
        this.f21113k = dVar;
        this.f21112j = dVar instanceof n1 ? new vm.c((n1) dVar, 28) : new u(dVar);
        this.N = StatsLogManager.b(context);
        setFocusableInTouchMode(true);
        Paint paint = new Paint();
        this.f21097b0 = paint;
        paint.setStyle(Paint.Style.STROKE);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80173x);
        String string = typedArrayObtainStyledAttributes.getString(0);
        typedArrayObtainStyledAttributes.recycle();
        this.T = (e10.n0) y2.f51877a.j0().l();
        if ("window".equals(string)) {
            e10.n0 n0Var = this.T;
            p0 p0Var = p0.f51734b;
            n0Var.getClass();
            this.T = e10.n0.a(n0Var, p0Var, 0, false, false, 0, 0, null, false, false, 2046);
            return;
        }
        if ("immersive".equals(string)) {
            e10.n0 n0Var2 = this.T;
            p0 p0Var2 = p0.f51735c;
            n0Var2.getClass();
            this.T = e10.n0.a(n0Var2, p0Var2, 0, false, false, 0, 0, null, false, false, 2046);
        }
    }

    public static Folder f0(d dVar) {
        return (Folder) a.P(dVar, 1);
    }

    @Override // za.m
    public final void A(Path path) {
        this.f21125y = path;
        super.invalidate();
    }

    @Override // ga.b
    public final void D(List list) {
        FolderIcon folderIcon;
        View view;
        this.B = true;
        Stream map = list.stream().map(new com.google.firebase.crashlytics.internal.persistence.d(this, 8));
        FolderPagedView folderPagedView = this.f21117q;
        Objects.requireNonNull(folderPagedView);
        map.forEach(new w(folderPagedView, 10));
        if (this.f21126z == 1) {
            this.A = true;
        } else {
            i0();
            p0(false);
        }
        if (e0() <= 1) {
            if (this.f79742a) {
                K(true);
            } else {
                j0();
            }
        } else if (this.f79742a && (((folderIcon = this.f21116p) != null && folderIcon.isAttachedToWindow()) || ((view = this.f21111i0) != null && view.isAttachedToWindow()))) {
            W();
        }
        ga.c cVar = this.f21115m;
        if (cVar instanceof iz.a) {
            list.forEach(new w((iz.a) cVar, 11));
        }
    }

    @Override // x9.c
    public final void E(l0 l0Var, i iVar) {
        if (l0Var.f79957i != this) {
            return;
        }
        FolderPagedView folderPagedView = this.f21117q;
        View view = this.C;
        for (int childCount = folderPagedView.getChildCount() - 1; childCount >= 0; childCount--) {
            ((CellLayout) folderPagedView.getChildAt(childCount)).removeView(view);
        }
        if (l0Var.f79955g instanceof j) {
            this.B = true;
            y9.j jVar = new y9.j(this);
            try {
                this.f21115m.Y0((j) l0Var.f79955g, true);
                jVar.close();
            } catch (Throwable th2) {
                try {
                    jVar.close();
                } catch (Throwable th3) {
                    th2.addSuppressed(th3);
                }
                throw th2;
            }
        }
        this.E = true;
        this.H = false;
    }

    @Override // o9.n0
    public final void F() {
        String string = this.f21118r.getText().toString();
        this.f21115m.a0(string, this.f21112j.k());
        FolderIcon folderIcon = this.f21116p;
        folderIcon.J.setText(string);
        folderIcon.setContentDescription(folderIcon.Z(string));
        if (TextUtils.isEmpty(this.f21115m.f57300l)) {
            this.f21118r.setHint(2132017893);
            this.f21118r.setText(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        } else {
            this.f21118r.setHint((CharSequence) null);
        }
        ps.f.o(this, 32, getContext().getString(2132017909, string));
        this.f21118r.clearFocus();
        Selection.setSelection(this.f21118r.getText(), 0, 0);
        this.I = false;
    }

    @Override // o9.a
    public final View N() {
        View viewA;
        FolderPagedView folderPagedView = this.f21117q;
        g gVar = new g(3);
        CellLayout cellLayoutA0 = folderPagedView.A0();
        if (cellLayoutA0 == null) {
            viewA = null;
        } else {
            b3 b3Var = cellLayoutA0.P;
            gVar.applyAsInt(b3Var);
            int i5 = folderPagedView.f21138c0;
            viewA = i5 > 0 ? b3Var.a(0 % i5, 0 / i5) : b3Var.getChildAt(0);
        }
        return viewA != null ? viewA : this;
    }

    @Override // o9.a
    public final Pair O() {
        FolderPagedView folderPagedView = this.f21117q;
        return Pair.create(folderPagedView, this.f79742a ? folderPagedView.getContext().getString(2132017901, Integer.valueOf(folderPagedView.f21138c0), Integer.valueOf(folderPagedView.f21139d0)) : getContext().getString(2132017891));
    }

    @Override // o9.a
    public final void Q(boolean z11) {
        AnimatorSet animatorSet;
        this.f79742a = false;
        if (!z11 && (animatorSet = this.f21108h) != null && animatorSet.isRunning()) {
            this.f21108h.cancel();
        }
        if (this.I) {
            this.f21118r.a();
        }
        FolderIcon folderIcon = this.f21116p;
        if (folderIcon != null && (folderIcon.getLayoutParams() instanceof v) && (folderIcon.getParent() instanceof r)) {
            b3 b3Var = (b3) ((r) folderIcon.getParent());
            b3Var.getClass();
            ((v) folderIcon.getLayoutParams()).f80185i = true;
            if (b3Var.f79776c == 1) {
                CellLayout cellLayout = (CellLayout) b3Var.getParent();
                y yVar = cellLayout.f20911q;
                yVar.f80127a = -1;
                yVar.f80128b = -1;
                cellLayout.invalidate();
            }
        }
        vm.c cVar = this.f21112j;
        if (!z11) {
            if (this.W != null) {
                NovaLauncher novaLauncher = (NovaLauncher) cVar.j();
                ra.f fVar = novaLauncher.M;
                ra.a aVar = (ra.a) fVar.f85765g;
                j2 j2Var = l2.f79974m;
                if (aVar != j2Var) {
                    novaLauncher.V.setAlpha(1.0f);
                    novaLauncher.X.setAlpha(1.0f);
                } else {
                    fVar.i(l2.f79979t, false);
                    novaLauncher.M.i(j2Var, false);
                }
            }
            X(false);
            post(new y9.d(this, 0));
        } else if (!this.f21110i) {
            VerticalPageIndicatorDots verticalPageIndicatorDots = this.f21096a0;
            if (verticalPageIndicatorDots != null) {
                verticalPageIndicatorDots.animate().alpha(0.0f).setDuration(80L).start();
            }
            this.f21110i = true;
            this.f21117q.w0();
            FolderPagedView folderPagedView = this.f21117q;
            folderPagedView.n0(folderPagedView.J(folderPagedView.f80118t.g(folderPagedView)), true);
            AnimatorSet animatorSet2 = this.f21108h;
            if (animatorSet2 != null && animatorSet2.isRunning()) {
                this.f21108h.cancel();
            }
            AnimatorSet animatorSetA = new p(this, false).a();
            animatorSetA.addListener(new h(this, 1));
            cVar.h(new y9.c(this, animatorSetA));
            animatorSetA.addListener(new h1(this, animatorSetA, false, 5));
            animatorSetA.start();
        }
        this.f21113k.u().sendAccessibilityEvent(32);
    }

    @Override // o9.a
    public final boolean R(int i5) {
        return (i5 & 1) != 0;
    }

    @Override // o9.a
    public final boolean S() {
        if (this.I) {
            this.f21118r.a();
            return true;
        }
        K(true);
        return true;
    }

    @Override // o9.a
    public final boolean T() {
        return this.f21112j.j().Q.o();
    }

    public final void U(int i5, List list, boolean z11) {
        int iN;
        boolean z12 = z11 && g3.a();
        if (getParent() != null && this.f21110i) {
            this.f21108h.cancel();
            X(false);
        }
        d dVar = this.f21113k;
        Folder folderF0 = f0(dVar);
        if (folderF0 != null && folderF0 != this) {
            if (z12) {
                folderF0.post(new y9.d(folderF0, 3));
            } else {
                folderF0.K(true);
            }
        }
        vm.c cVar = this.f21112j;
        NovaLauncher novaLauncher = (NovaLauncher) cVar.j();
        novaLauncher.h();
        novaLauncher.n1(true);
        f fVar = this.U;
        tz.v vVar = h0() ? dVar.C().f90104g : dVar.C().f90102e;
        this.f21109h0 = vVar.f90178a;
        fVar.getClass();
        fVar.f77077j = vVar.f90179b;
        FolderPagedView folderPagedView = this.f21117q;
        folderPagedView.f21145j0 = fVar;
        q qVar = folderPagedView.f21142g0;
        if (folderPagedView.f21144i0) {
            folderPagedView.G0();
        }
        if (folderPagedView.D0()) {
            qVar.h(folderPagedView.getContext());
        } else {
            qVar.i();
        }
        folderPagedView.u0((List) list.stream().map(new com.google.firebase.crashlytics.internal.persistence.d(folderPagedView, 10)).collect(Collectors.toList()));
        folderPagedView.f21144i0 = true;
        W();
        this.B = true;
        q0();
        this.f79742a = true;
        za.j jVarU = dVar.u();
        if (getParent() == null) {
            g30.b bVar = (g30.b) g30.b.f57016l.h(novaLauncher);
            int color = novaLauncher.getColor(2131100990);
            if (this.W != null) {
                l2.f79979t.getClass();
                int iN2 = this.T.d() ? r4.a.n(novaLauncher.P.f21088w.a(), (int) 0.0f) : this.f21109h0;
                if (this.T.d()) {
                    iN = e.n(bVar, -1, color, iN2, -16777216);
                } else {
                    f fVar2 = this.U;
                    iN = fVar2.f77069b.f77124b ? fVar2.f77077j : e.n(bVar, -1, color, iN2, -16777216);
                }
                ((FolderNameEditText) this.W.f82826d).setTextColor(iN);
                ((FolderNameEditText) this.W.f82826d).setHintTextColor(r4.a.n(iN, 128));
                ((ImageView) this.W.f82825c).setImageTintList(ColorStateList.valueOf(iN));
                jVarU.addView(this.W.a());
            } else {
                int iN3 = e.n(bVar, -1, color, this.f21109h0, -16777216);
                this.f21118r.setTextColor(iN3);
                this.f21118r.setHintTextColor(r4.a.n(iN3, 128));
                ((ImageView) findViewById(2131428077)).setImageTintList(ColorStateList.valueOf(iN3));
            }
            pr.c cVar2 = this.W;
            View viewFindViewById = cVar2 != null ? (ImageView) cVar2.f82825c : findViewById(2131428077);
            y2.f51877a.getClass();
            viewFindViewById.setVisibility(y2.d() ? 8 : 0);
            VerticalPageIndicatorDots verticalPageIndicatorDots = this.f21096a0;
            if (verticalPageIndicatorDots != null) {
                jVarU.addView(verticalPageIndicatorDots);
            }
            jVarU.addView(this);
            this.f21114l.f95714j.add(this);
        }
        this.f21117q.w0();
        this.f21117q.g0(i5);
        this.F = false;
        AnimatorSet animatorSet = this.f21108h;
        if (animatorSet != null && animatorSet.isRunning()) {
            this.f21108h.cancel();
        }
        if (!z12) {
            AnimatorSet animatorSetA = new p(this, false).a();
            animatorSetA.setupStartValues();
            animatorSetA.getListeners().forEach(new y9.c(animatorSetA));
            this.f21116p.a(false);
            this.f21116p.Y();
            this.f21116p.J.P(0.0f);
            this.f21126z = 2;
            I();
            View viewA = this.f21117q.A0().P.a(0, 0);
            if (viewA != null) {
                viewA.requestFocus();
            }
            FolderPagedView folderPagedView2 = this.f21117q;
            folderPagedView2.H0(folderPagedView2.G());
            if (this.W == null) {
                if (h0()) {
                    novaLauncher.V.t(1.0f);
                    return;
                }
                return;
            }
            setImmersiveAlpha(1.0f);
            ra.f fVar3 = novaLauncher.M;
            ra.a aVar = (ra.a) fVar3.f85765g;
            if (aVar == l2.o || aVar == l2.f79978s) {
                novaLauncher.V.setAlpha(0.0f);
                novaLauncher.X.setAlpha(0.0f);
                return;
            }
            az.b bVar2 = l2.f79979t;
            Interpolator[] interpolatorArr = new Interpolator[15];
            fVar3.d();
            ra.c cVar3 = (ra.c) fVar3.f85760b;
            cVar3.f87094a = 100L;
            cVar3.f87095b = true;
            for (int i11 = 0; i11 < 15; i11++) {
                cVar3.f87096c[i11] = interpolatorArr[i11];
            }
            s9.m mVarE = fVar3.e(bVar2);
            s9.i iVar = new s9.i(mVarE.f(), mVarE.f86811b);
            cVar3.f85755d = iVar;
            iVar.m(1.0f);
            return;
        }
        AnimatorSet animatorSetA2 = new p(this, true).a();
        animatorSetA2.addListener(new h(this, 0));
        if (this.f21117q.getChildCount() <= 1 || (this.f21115m.F & 4) != 0) {
            this.f21118r.setTranslationX(0.0f);
            if (this.f21096a0 != null) {
                PageIndicatorDots pageIndicatorDots = this.f21119s;
                ObjectAnimator objectAnimator = pageIndicatorDots.f21208h;
                if (objectAnimator != null) {
                    objectAnimator.cancel();
                    pageIndicatorDots.f21208h = null;
                }
                float f11 = pageIndicatorDots.f21205e;
                pageIndicatorDots.f21207g = f11;
                PageIndicatorDots.f21200k.set(pageIndicatorDots, Float.valueOf(f11));
                this.f21119s.setAlpha(0.0f);
                this.f21119s.animate().setDuration(80L).alpha(1.0f).start();
            }
        } else {
            this.f21119s.setAlpha(1.0f);
            float fC0 = (((this.f21117q.C0() - this.f21120t.getPaddingLeft()) - this.f21120t.getPaddingRight()) - this.f21118r.getPaint().measureText(this.f21118r.getText().toString())) / 2.0f;
            FolderNameEditText folderNameEditText = this.f21118r;
            if (this.f21117q.T) {
                fC0 = -fC0;
            }
            folderNameEditText.setTranslationX(fC0);
            PageIndicatorDots pageIndicatorDots2 = this.f21119s;
            pageIndicatorDots2.f21209i = new float[pageIndicatorDots2.f21204d];
            pageIndicatorDots2.invalidate();
            animatorSetA2.addListener(new z(this, !this.E, 5));
        }
        if (this.f21096a0 == null) {
            PageIndicatorDots pageIndicatorDots3 = this.f21119s;
            ObjectAnimator objectAnimator2 = pageIndicatorDots3.f21208h;
            if (objectAnimator2 != null) {
                objectAnimator2.cancel();
                pageIndicatorDots3.f21208h = null;
            }
            float f12 = pageIndicatorDots3.f21205e;
            pageIndicatorDots3.f21207g = f12;
            PageIndicatorDots.f21200k.set(pageIndicatorDots3, Float.valueOf(f12));
        }
        cVar.h(new y9.c(this, animatorSetA2));
        animatorSetA2.addListener(new h1(this, animatorSetA2, false, 5));
        animatorSetA2.start();
        animatorSetA2.setCurrentPlayTime(Math.min(ya.g.b(getContext()), animatorSetA2.getTotalDuration()));
        if (this.f21114l.o()) {
            t tVar = this.f21114l;
            int[] iArr = tVar.f95707c;
            Point point = tVar.f95711g;
            m0 m0VarI = tVar.i(point.x, point.y, iArr);
            l0 l0Var = tVar.f95713i;
            l0Var.f79949a = iArr[0];
            l0Var.f79950b = iArr[1];
            tVar.e(m0VarI);
        }
        FolderPagedView folderPagedView3 = this.f21117q;
        folderPagedView3.H0(folderPagedView3.G());
    }

    public final void V(ga.c cVar) {
        ga.c cVar2 = this.f21115m;
        if (cVar2 != null) {
            cVar2.a1(this);
        }
        this.f21115m = cVar;
        this.n = cVar.f57300l;
        this.o = cVar.U0();
        Collections.sort(cVar.H, f21094k0);
        p0(true);
        if (((za.h) getLayoutParams()) == null) {
            za.h hVar = new za.h(0, 0);
            hVar.f98433d = true;
            setLayoutParams(hVar);
        }
        this.B = true;
        this.f21115m.H.f68416a.add(this);
        if (TextUtils.isEmpty(this.f21115m.f57300l)) {
            this.f21118r.setText(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            this.f21118r.setHint(2132017893);
        } else {
            this.f21118r.setText(this.f21115m.f57300l);
            this.f21118r.setHint((CharSequence) null);
        }
        this.f21116p.post(new y9.d(this, 2));
    }

    public final void W() {
        View view;
        boolean z11 = this.T.f51677a == p0.f51735c;
        this.f21112j.j().getClass();
        if (!z11 && this.T.f51685i == e10.k0.f51621c) {
            int dimensionPixelSize = this.f21117q.getChildCount() > 1 ? getResources().getDimensionPixelSize(2131165519) : this.f21117q.getPaddingLeft();
            FolderPagedView folderPagedView = this.f21117q;
            folderPagedView.setPaddingRelative(folderPagedView.getPaddingStart(), this.f21117q.getPaddingTop(), dimensionPixelSize, this.f21117q.getPaddingBottom());
        }
        za.h hVar = (za.h) getLayoutParams();
        d dVar = this.f21113k;
        za.j jVarU = dVar.u();
        int iC0 = this.f21117q.C0() + getPaddingRight() + getPaddingLeft();
        int paddingBottom = getPaddingBottom() + getPaddingTop() + b0() + this.f21121u;
        View view2 = this.f21116p;
        if ((view2 == null || !view2.isAttachedToWindow()) && (view = this.f21111i0) != null) {
            view2 = view;
        }
        this.f21111i0 = null;
        Rect rect = f21093j0;
        jVarU.i(view2, rect);
        int iCenterX = rect.centerX() - (iC0 / 2);
        int iCenterY = rect.centerY() - (paddingBottom / 2);
        rect.set(dVar.H());
        int[] iArr = {g3.c(iCenterX, rect.left, rect.right - iC0), g3.c(iCenterY, rect.top, rect.bottom - paddingBottom)};
        dVar.i(iArr, rect, iC0, paddingBottom);
        int i5 = iArr[0];
        int i11 = iArr[1];
        setPivotX((iCenterX - i5) + r9);
        setPivotY((iCenterY - i11) + r10);
        ((FrameLayout.LayoutParams) hVar).width = iC0;
        ((FrameLayout.LayoutParams) hVar).height = paddingBottom;
        hVar.f98431b = i5;
        hVar.f98432c = i11;
        this.P.setBounds(0, 0, iC0, paddingBottom);
        pr.c cVar = this.W;
        if (cVar != null) {
            za.h hVar2 = (za.h) cVar.a().getLayoutParams();
            this.W.a().measure(View.MeasureSpec.makeMeasureSpec(iC0, 1073741824), 0);
            ((FrameLayout.LayoutParams) hVar2).width = iC0;
            int measuredHeight = this.W.a().getMeasuredHeight();
            ((FrameLayout.LayoutParams) hVar2).height = measuredHeight;
            hVar2.f98431b = i5;
            hVar2.f98432c = i11 - measuredHeight;
        }
        VerticalPageIndicatorDots verticalPageIndicatorDots = this.f21096a0;
        if (verticalPageIndicatorDots != null) {
            verticalPageIndicatorDots.measure(View.MeasureSpec.makeMeasureSpec(w20.e.k(24), 1073741824), View.MeasureSpec.makeMeasureSpec(this.f21117q.B0(), 1073741824));
            za.h hVar3 = (za.h) this.f21096a0.getLayoutParams();
            ((FrameLayout.LayoutParams) hVar3).width = this.f21096a0.getMeasuredWidth();
            ((FrameLayout.LayoutParams) hVar3).height = this.f21096a0.getMeasuredHeight();
            if (g3.p(getResources())) {
                hVar3.f98431b = i5 - ((FrameLayout.LayoutParams) hVar3).width;
            } else if (this.W != null) {
                hVar3.f98431b = i5 + iC0;
            } else {
                hVar3.f98431b = (this.f21117q.C0() + i5) - ((FrameLayout.LayoutParams) hVar3).width;
            }
            hVar3.f98432c = i11;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x010b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void X(boolean r8) {
        /*
            Method dump skipped, instructions count: 356
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.launcher3.folder.Folder.X(boolean):void");
    }

    public final void Y() {
        if (this.V != null && h0()) {
            l0 l0Var = this.V;
            if (!l0Var.f79953e) {
                if (this.E) {
                    this.H = true;
                }
                j jVar = (j) l0Var.f79955g;
                this.f21115m.R0(jVar, jVar.f57299k, true);
                this.A = true;
                this.B = true;
                n1 n1VarJ = this.f21112j.j();
                ga.e eVarB = (jVar.f57290b != 0 || jVar.i() == null) ? null : n1VarJ.V.f21025g.b(lx.a.f(jVar));
                if (eVarB == null) {
                    eVarB = new j(jVar);
                    eVarB.f57289a = -1;
                    eVarB.f57291c = -1;
                }
                t tVar = n1VarJ.Q;
                AllAppsContainerView allAppsContainerView = n1VarJ.V;
                m0 m0Var = tVar.f95716l;
                if (m0Var != null) {
                    m0Var.x(tVar.f95713i);
                }
                l0 l0Var2 = tVar.f95713i;
                l0Var2.f79957i = allAppsContainerView;
                l0Var2.f79955g = eVarB;
                tVar.c();
                n1VarJ.M.h(l2.n);
            }
        }
        if (this.f79742a) {
            K(true);
            this.A = true;
        } else {
            if (this.f21126z == 1) {
                this.A = true;
                return;
            }
            i0();
            this.C = null;
            this.D = false;
        }
    }

    public final void Z(Canvas canvas) {
        Path path;
        FolderIcon folderIcon = this.f21116p;
        if (folderIcon == null || !folderIcon.d0()) {
            return;
        }
        Paint paint = this.f21097b0;
        if (paint.getAlpha() > 0) {
            if (!(getOutlineProvider() instanceof s9.q)) {
                if (getOutlineProvider() != null || (path = this.f21125y) == null) {
                    return;
                }
                canvas.drawPath(path, paint);
                return;
            }
            ViewOutlineProvider outlineProvider = getOutlineProvider();
            Outline outline = this.f21101d0;
            outlineProvider.getOutline(this, outline);
            float radius = outline.getRadius();
            outline.getRect(f21093j0);
            float strokeWidth = paint.getStrokeWidth() / 4.0f;
            canvas.drawRoundRect(r0.left + strokeWidth, r0.top + strokeWidth, r0.right - strokeWidth, r0.bottom - strokeWidth, radius, radius, paint);
        }
    }

    @Override // o9.m0
    public final void a(Rect rect) {
        getHitRect(rect);
        int i5 = rect.left;
        int i11 = this.K;
        rect.left = i5 - i11;
        rect.right += i11;
    }

    public final void a0(Canvas canvas, int i5, int i11) {
        Canvas canvas2;
        int iMin = (int) (this.f21105f0 * Math.min(this.T.d() ? 96 : 597, Color.alpha(this.f21109h0)));
        int iN = r4.a.n(this.f21113k.C().f90098a.f90178a, iMin);
        if (!this.T.d()) {
            canvas.drawColor(r4.a.n(this.f21109h0, iMin));
            return;
        }
        if (this.T.f51677a == p0.f51735c) {
            ViewOutlineProvider outlineProvider = getOutlineProvider();
            if (f21095l0) {
                Paint paint = this.f21099c0;
                paint.setColor(iN);
                int measuredWidth = ((View) getParent()).getMeasuredWidth();
                int measuredHeight = ((View) getParent()).getMeasuredHeight();
                int iO = x7.f.O(getWidth() + i5);
                int iO2 = x7.f.O(getHeight() + i11);
                float f11 = -measuredHeight;
                float f12 = i5;
                float f13 = measuredHeight;
                canvas2 = canvas;
                canvas2.drawRect(-measuredWidth, f11, f12, f13, paint);
                float f14 = iO;
                canvas2.drawRect(f14, f11, measuredWidth, f13, paint);
                canvas2.drawRect(f12, f11, f14, i11, paint);
                canvas2.drawRect(f12, iO2, f14, f13, paint);
                canvas2.clipRect(i5, i11, iO, iO2);
            } else {
                canvas2 = canvas;
            }
            if (this.f21125y != null) {
                canvas2.save();
                canvas2.clipPath(this.f21125y, Region.Op.DIFFERENCE);
                canvas2.drawColor(iN);
                canvas2.restore();
                return;
            }
            Path path = this.f21103e0;
            if (outlineProvider == null) {
                canvas2.save();
                float cornerRadius = this.P.getCornerRadius();
                path.rewind();
                path.addRoundRect(i5, i11, getWidth() + i5, getHeight() + i11, cornerRadius, cornerRadius, Path.Direction.CCW);
                canvas2.clipPath(path, Region.Op.DIFFERENCE);
                canvas2.drawColor(iN);
                canvas2.restore();
                return;
            }
            Outline outline = this.f21101d0;
            outlineProvider.getOutline(this, outline);
            outline.getRect(f21093j0);
            canvas2.save();
            float radius = outline.getRadius();
            path.rewind();
            path.addRoundRect(r14.left, r14.top, r14.right, r14.bottom, radius, radius, Path.Direction.CCW);
            canvas2.clipPath(path, Region.Op.DIFFERENCE);
            canvas2.drawColor(iN);
            canvas2.restore();
        }
    }

    @Override // o9.m0
    public final void b() {
        o9.b bVar = this.f21098c;
        if (bVar.f79770e) {
            bVar.f79770e = false;
            this.Q.onAlarm();
        }
    }

    public final int b0() {
        j0 j0VarP = this.f21113k.P();
        return Math.max(Math.min((j0VarP.n - j0VarP.l().y) - this.f21121u, this.f21117q.B0()), 5);
    }

    public final ViewGroup c0() {
        FrameLayout frameLayout = this.f21107g0;
        return frameLayout != null ? frameLayout : this.f21117q;
    }

    public final ArrayList d0() {
        boolean z11 = this.B;
        ArrayList arrayList = this.f21106g;
        if (z11) {
            arrayList.clear();
            this.f21117q.E0(new y9.b(this, 1));
            this.B = false;
        }
        return arrayList;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        boolean z11 = false;
        if (getParent() instanceof DragLayer) {
            a0(canvas, 0, 0);
        }
        GradientDrawable gradientDrawable = this.P;
        Paint paint = this.f21099c0;
        if (gradientDrawable != null && gradientDrawable.getColor() != null) {
            paint.setColor(gradientDrawable.getColor().getDefaultColor());
        }
        boolean zD = this.T.d();
        FolderIcon folderIcon = this.f21116p;
        if (folderIcon != null && (this.S || (folderIcon.f21131d0.b() && this.T.f51677a != p0.f51735c))) {
            z11 = true;
        }
        ViewOutlineProvider outlineProvider = getOutlineProvider();
        if (this.f21125y != null) {
            int iSave = canvas.save();
            if (z11) {
                canvas.clipPath(this.f21125y);
            } else {
                Z(canvas);
            }
            if (this.T.d()) {
                canvas.drawPath(this.f21125y, paint);
            } else {
                int color = paint.getColor();
                float fAlpha = Color.alpha(color);
                paint.setColor(r4.a.n(color, (int) (fAlpha - (this.f21105f0 * fAlpha))));
                canvas.drawPath(this.f21125y, paint);
                paint.setColor(color);
            }
            super.dispatchDraw(canvas);
            canvas.restoreToCount(iSave);
            if (z11) {
                Z(canvas);
                return;
            }
            return;
        }
        if (outlineProvider == null || this.f21116p == null || z11) {
            if (zD) {
                this.P.draw(canvas);
            }
            super.dispatchDraw(canvas);
            Z(canvas);
            return;
        }
        Outline outline = this.f21101d0;
        outlineProvider.getOutline(this, outline);
        outline.getRect(f21093j0);
        float radius = outline.getRadius();
        if (zD) {
            Path path = this.f21103e0;
            path.rewind();
            path.addRoundRect(r3.left, r3.top, r3.right, r3.bottom, radius, radius, Path.Direction.CCW);
            canvas.drawPath(path, paint);
        }
        Z(canvas);
        super.dispatchDraw(canvas);
    }

    @Override // android.view.View
    public final boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        return true;
    }

    @Override // android.view.ViewGroup
    public final boolean drawChild(Canvas canvas, View view, long j11) {
        int iSave;
        FolderIcon folderIcon = this.f21116p;
        if (folderIcon != null && view == this.f21117q && folderIcon.f21131d0.b() && this.T.f51677a == p0.f51735c) {
            ViewOutlineProvider outlineProvider = getOutlineProvider();
            if (this.f21125y != null) {
                iSave = canvas.save();
                canvas.clipPath(this.f21125y);
                try {
                    return super.drawChild(canvas, view, j11);
                } finally {
                }
            }
            if (outlineProvider != null && this.f21116p != null) {
                Outline outline = this.f21101d0;
                outlineProvider.getOutline(this, outline);
                outline.getRect(f21093j0);
                float radius = outline.getRadius();
                Path path = this.f21103e0;
                path.rewind();
                path.addRoundRect(r0.left, r0.top, r0.right, r0.bottom, radius, radius, Path.Direction.CCW);
                iSave = canvas.save();
                canvas.clipPath(path);
                try {
                    return super.drawChild(canvas, view, j11);
                } finally {
                }
            }
        }
        return super.drawChild(canvas, view, j11);
    }

    public final int e0() {
        return this.f21115m.H.size();
    }

    @Override // ga.b
    public final void f(j jVar, int i5) throws NumberFormatException {
        y9.q qVar = new y9.q(this.f21113k.P(), this.f21116p.N, this.T.f51677a == p0.f51735c);
        qVar.d(this.f21115m);
        qVar.e(jVar, i5);
        jVar.f57303q.h(false);
        this.f21112j.k().b(jVar, this.f21115m.T0(), 0, jVar.f57293e, jVar.f57294f);
        p0(false);
        FolderPagedView folderPagedView = this.f21117q;
        if (folderPagedView.f21144i0) {
            DoubleShadowBubbleTextView doubleShadowBubbleTextViewY0 = folderPagedView.y0(jVar);
            if (folderPagedView.f21144i0) {
                ArrayList arrayList = new ArrayList(folderPagedView.f21140e0.d0());
                arrayList.add(i5, doubleShadowBubbleTextViewY0);
                folderPagedView.u0(arrayList);
            }
        }
        this.B = true;
    }

    @Override // android.view.View
    public final View focusSearch(int i5) {
        return FocusFinder.getInstance().findNextFocus(this, null, i5);
    }

    public final int g0(l0 l0Var, float[] fArr) {
        float[] fArrA = l0Var.a(fArr);
        FolderPagedView folderPagedView = this.f21117q;
        int paddingLeft = ((int) fArrA[0]) - getPaddingLeft();
        int paddingTop = ((int) fArrA[1]) - getPaddingTop();
        int iG = folderPagedView.G();
        CellLayout cellLayout = (CellLayout) folderPagedView.getChildAt(iG);
        int[] iArr = FolderPagedView.f21135k0;
        cellLayout.v(paddingLeft, paddingTop, 1, 1, 1, 1, false, iArr, null);
        if (folderPagedView.f21140e0.getLayoutDirection() == 1) {
            iArr[0] = (cellLayout.f20903g - iArr[0]) - 1;
        }
        return Math.min(folderPagedView.f21137b0 - 1, (iArr[1] * folderPagedView.f21138c0) + (iG * folderPagedView.W.f96946d) + iArr[0]);
    }

    @Override // android.view.View
    public final Drawable getBackground() {
        return this.P;
    }

    public final boolean h0() {
        n1 n1VarJ = this.f21112j.j();
        return n1VarJ != null && ((ra.a) n1VarJ.M.f85765g) == l2.o;
    }

    @Override // o9.k0
    public final void i(View view, l0 l0Var, boolean z11) {
        if (z11) {
            if (this.F && !this.H && view != this) {
                j0();
            }
            ga.c cVar = this.f21115m;
            if (cVar instanceof iz.a) {
                ((iz.a) cVar).f1((j) l0Var.f79955g);
            }
        } else {
            j jVar = (j) l0Var.f79955g;
            View view2 = this.C;
            KeyEvent.Callback callbackY0 = (view2 == null || view2.getTag() != jVar) ? this.f21117q.y0(jVar) : this.C;
            ArrayList arrayListD0 = d0();
            int iC = g3.c(jVar.f57299k, 0, arrayListD0.size());
            jVar.f57299k = iC;
            arrayListD0.add(iC, callbackY0);
            this.f21117q.u0(arrayListD0);
            this.B = true;
            y9.j jVar2 = new y9.j(this);
            try {
                this.f21116p.f0(l0Var, true);
                jVar2.close();
            } catch (Throwable th2) {
                try {
                    jVar2.close();
                } catch (Throwable th3) {
                    th2.addSuppressed(th3);
                }
                throw th2;
            }
        }
        if (view != this) {
            o9.b bVar = this.f21100d;
            if (bVar.f79770e) {
                bVar.f79770e = false;
                if (!z11) {
                    this.G = true;
                }
                this.f21104f.f79770e = false;
                Y();
            }
        }
        this.F = false;
        this.E = false;
        this.H = false;
        this.C = null;
        p0(false);
        if (e0() <= this.f21117q.W.f96946d) {
            this.f21115m.b1(false, this.f21112j.k());
        }
    }

    public final void i0() {
        FolderPagedView folderPagedView = this.f21117q;
        if (folderPagedView.f21144i0) {
            folderPagedView.u0(d0());
            this.B = true;
        }
    }

    public final void j0() {
        ga.c cVar = this.f21115m;
        cVar.getClass();
        if (cVar instanceof iz.a) {
            return;
        }
        this.J = this.f21112j.v(this);
    }

    public final void k0(FolderIcon folderIcon) {
        FolderIcon folderIcon2 = this.f21116p;
        if (folderIcon2 != null && folderIcon2 != folderIcon) {
            folderIcon2.a(true);
        }
        this.f21116p = folderIcon;
        this.f21112j.n(this, folderIcon);
    }

    @Override // ya.k0
    public final boolean l(MotionEvent motionEvent) {
        if (motionEvent.getAction() != 0) {
            return false;
        }
        za.j jVar = (za.j) getParent();
        if (this.I) {
            if (jVar.m(this.f21118r, motionEvent)) {
                return false;
            }
            this.f21118r.a();
            return true;
        }
        if (jVar.m(this, motionEvent)) {
            return false;
        }
        pr.c cVar = this.W;
        return !(cVar != null && cVar.a().getVisibility() == 0 && jVar.m(this.W.a(), motionEvent)) && this.f21112j.o(motionEvent, jVar, this);
    }

    public final void l0(e10.n0 n0Var, f fVar) throws Resources.NotFoundException {
        double dG;
        float fLuminance;
        this.T = n0Var;
        this.U = fVar;
        mc0.d.f76206a.n("TODO setFolderWindowConfig should always use surface colors, fix for settings preview", new Object[0]);
        int i5 = h0() ? this.f21113k.C().f90099b.f90178a : 0;
        GradientDrawable gradientDrawable = this.P;
        int iC = n0Var.c();
        boolean z11 = n0Var.f51682f;
        p0 p0Var = n0Var.f51677a;
        int iN = r4.a.n(iC, n0Var.b());
        if (((i5 >> 24) & 255) < 192 || p0Var != p0.f51734b) {
            dG = 999.0d;
            fLuminance = 0.0f;
        } else {
            dG = r4.a.g(r4.a.n(i5, 255), r4.a.n(iN, 255));
            fLuminance = Color.luminance(r4.a.n(i5, 255));
        }
        double d5 = fLuminance;
        if (d5 <= 0.5d && dG < 1.37d) {
            iN = r4.a.n(r4.a.j(536870911, i5), n0Var.b());
        } else if (d5 > 0.5d && dG < 1.07d && !n0Var.e()) {
            iN = r4.a.n(r4.a.j(134217728, i5), n0Var.b());
        }
        this.f21109h0 = iN;
        if (this.T.d()) {
            gradientDrawable.setColor(this.f21109h0);
        } else {
            gradientDrawable.setColor(0);
        }
        gradientDrawable.setCornerRadius(n0Var.f51680d * getContext().getResources().getDisplayMetrics().density);
        FolderPagedView folderPagedView = this.f21117q;
        if (p0Var != p0.f51734b) {
            folderPagedView.setPadding(folderPagedView.getPaddingLeft(), this.f21117q.getPaddingTop(), this.f21117q.getPaddingRight(), this.f21117q.getPaddingTop());
            this.f21120t.setVisibility(8);
            this.f21121u = 0;
            this.W.a().setVisibility(z11 ? 0 : 8);
            return;
        }
        if (z11) {
            int dimensionPixelSize = getResources().getDimensionPixelSize(2131165522);
            int dimensionPixelSize2 = getResources().getDimensionPixelSize(2131165521);
            View view = this.f21120t;
            view.setPadding(view.getPaddingLeft(), dimensionPixelSize, this.f21120t.getPaddingRight(), Math.max(dimensionPixelSize2, w20.e.k(this.T.f51680d) / 3));
            this.f21120t.measure(0, 0);
            this.f21121u = this.f21120t.getMeasuredHeight();
            this.f21120t.setVisibility(0);
        } else {
            this.f21120t.setVisibility(4);
            this.f21121u = 0;
            if (!fVar.f77069b.f77124b) {
                FolderPagedView folderPagedView2 = this.f21117q;
                folderPagedView2.setPadding(folderPagedView2.getPaddingLeft(), 0, this.f21117q.getPaddingRight(), this.f21117q.getPaddingBottom());
            }
        }
        if (this.f21096a0 != null) {
            this.f21117q.setPadding(w20.e.k(16), this.f21117q.getPaddingTop(), w20.e.k(16), this.f21117q.getPaddingBottom());
        }
    }

    public final void m0(int i5, l0 l0Var) {
        if (this.L != i5) {
            FolderPagedView folderPagedView = this.f21117q;
            folderPagedView.getClass();
            int iN = (folderPagedView.N(folderPagedView.G()) + ((int) (((i5 == 0) ^ folderPagedView.T ? -0.07f : 0.07f) * folderPagedView.f80118t.y(folderPagedView)))) - folderPagedView.f80118t.g(folderPagedView);
            if (iN != 0) {
                OverScroller overScroller = folderPagedView.f80110j;
                overScroller.startScroll(overScroller.getCurrX(), 0, iN, 0, 500);
                folderPagedView.invalidate();
            }
            this.L = i5;
        }
        o9.b bVar = this.f21102e;
        if (bVar.f79770e && this.M == i5) {
            return;
        }
        this.M = i5;
        bVar.f79770e = false;
        bVar.f79769d = new nx.l(this, l0Var);
        bVar.a(500L);
        this.f21098c.f79770e = false;
        this.f21122v = this.f21124x;
    }

    public final void n0(boolean z11, Comparator comparator) {
        iz.b bVar = this.f21115m.H;
        FolderPagedView folderPagedView = this.f21117q;
        ArrayList arrayListD0 = d0();
        b70.c.y0(bVar, comparator);
        folderPagedView.u0(b70.g.D1(new ct.m(bVar, 7), arrayListD0));
        p0(false);
        this.B = true;
        this.f21115m.X0(z11);
        this.f21116p.invalidate();
        if (this.f79742a) {
            return;
        }
        this.f21117q.G0();
    }

    @Override // x9.c
    public final void o() {
        if (this.D && this.E) {
            Y();
        }
        this.E = false;
        this.f21114l.r(this);
    }

    public final void o0(View view, i iVar) {
        Object tag = view.getTag();
        if (tag instanceof j) {
            this.f21124x = ((j) tag).f57299k;
            this.C = view;
            this.f21114l.q();
            this.f21114l.a(this);
            if (iVar.f95648a) {
                this.f21114l.a(new h4(this, this.f21117q, new aa.t(26), 1));
            }
            this.f21112j.c(view, this, iVar);
        }
    }

    @Override // android.view.View
    public final WindowInsets onApplyWindowInsets(WindowInsets windowInsets) {
        if (g3.f79852g && this.T.f51677a == p0.f51734b) {
            setTranslationY(0.0f);
            if (windowInsets.isVisible(WindowInsets.Type.ime())) {
                Insets insets = windowInsets.getInsets(WindowInsets.Type.ime());
                za.h hVar = (za.h) getLayoutParams();
                if (insets.bottom > this.f21113k.P().f77153l - (hVar.f98432c + ((FrameLayout.LayoutParams) hVar).height)) {
                    setTranslationY((r1 - insets.bottom) - this.f21118r.getPaddingBottom());
                }
            }
        }
        return windowInsets;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        requestFocus();
        super.onAttachedToWindow();
    }

    @Override // android.widget.TextView.OnEditorActionListener
    public final boolean onEditorAction(TextView textView, int i5, KeyEvent keyEvent) {
        if (i5 != 6) {
            return false;
        }
        this.f21118r.a();
        return true;
    }

    @Override // android.view.View
    public final void onFinishInflate() throws Resources.NotFoundException {
        super.onFinishInflate();
        this.f21107g0 = (FrameLayout) findViewById(2131428074);
        int i5 = this.f21113k.P().Q;
        Resources resources = getResources();
        Resources.Theme theme = getContext().getTheme();
        ThreadLocal threadLocal = k.f83638a;
        this.P = (GradientDrawable) resources.getDrawable(2131232107, theme);
        FolderPagedView folderPagedView = (FolderPagedView) findViewById(2131428073);
        this.f21117q = folderPagedView;
        int i11 = 1;
        if (this.T.f51685i == e10.k0.f51621c) {
            folderPagedView.getClass();
            folderPagedView.f80118t = ua.f.f90758np;
            if (this.T.f51677a == p0.f51735c) {
                VerticalPageIndicatorDots verticalPageIndicatorDots = new VerticalPageIndicatorDots(getContext(), null);
                this.f21096a0 = verticalPageIndicatorDots;
                verticalPageIndicatorDots.setElevation(16.0f);
                za.h hVar = new za.h(-2, -1);
                hVar.f98431b = 0;
                hVar.f98432c = 0;
                hVar.f98433d = true;
                this.f21096a0.setLayoutParams(hVar);
                this.f21119s = this.f21096a0;
            } else {
                PageIndicatorDots pageIndicatorDots = (PageIndicatorDots) findViewById(2131429151);
                this.f21119s = pageIndicatorDots;
                pageIndicatorDots.setVisibility(0);
            }
        }
        e10.n0 n0Var = this.T;
        if (n0Var.f51677a != p0.f51734b) {
            this.f21107g0.removeView(this.f21117q);
            addView(this.f21117q, indexOfChild(this.f21107g0));
            removeView(this.f21107g0);
            this.f21107g0 = null;
            setElevation(0.0f);
            pr.c cVarB = pr.c.b(LayoutInflater.from(getContext()));
            this.W = cVarB;
            cVarB.a().setElevation(1.0f);
            za.h hVar2 = new za.h(-1, -2);
            hVar2.f98431b = 0;
            hVar2.f98432c = 0;
            hVar2.f98433d = true;
            this.W.a().setLayoutParams(hVar2);
        } else if (n0Var.e()) {
            setElevation(getContext().getResources().getDisplayMetrics().density * 5.0f);
        } else {
            setElevation(0.0f);
        }
        pr.c cVar = this.W;
        if (cVar != null) {
            PageIndicatorDots pageIndicatorDots2 = (PageIndicatorDots) cVar.f82827e;
            if (this.f21119s == null) {
                this.f21119s = pageIndicatorDots2;
            } else {
                pageIndicatorDots2.setVisibility(8);
            }
            pr.c cVar2 = this.W;
            this.f21118r = (FolderNameEditText) cVar2.f82826d;
            cVar2.a().setOnTouchListener(new dk.b(2));
        } else {
            if (this.f21119s == null) {
                this.f21119s = (PageIndicatorDots) findViewById(2131428079);
            } else {
                findViewById(2131428079).setVisibility(8);
            }
            this.f21118r = (FolderNameEditText) findViewById(2131428078);
        }
        FolderPagedView folderPagedView2 = this.f21117q;
        folderPagedView2.f21140e0 = this;
        folderPagedView2.E = this.f21119s;
        j0 j0VarP = ((d) d.p(folderPagedView2.getContext())).P();
        i0 i0Var = (i0) y2.f51877a.i0().l();
        folderPagedView2.W = new y9.q(j0VarP, i0Var.f51586b.a(i0Var.f51591g), this.T.f51677a == p0.f51735c);
        folderPagedView2.R(this);
        FolderNameEditText folderNameEditText = this.f21118r;
        folderNameEditText.f20959c = this;
        folderNameEditText.setOnFocusChangeListener(new q9.b(this, i11));
        this.f21118r.setOnEditorActionListener(this);
        this.f21118r.setSelectAllOnFocus(true);
        FolderNameEditText folderNameEditText2 = this.f21118r;
        folderNameEditText2.setInputType((folderNameEditText2.getInputType() & (-32769)) | 532480);
        this.f21118r.f20958b = true;
        View viewFindViewById = findViewById(2131428075);
        this.f21120t = viewFindViewById;
        viewFindViewById.setPadding(0, viewFindViewById.getPaddingTop(), 0, this.f21120t.getPaddingBottom());
        pr.c cVar3 = this.W;
        View viewFindViewById2 = cVar3 != null ? (ImageView) cVar3.f82825c : findViewById(2131428077);
        n1 n1VarJ = this.f21112j.j();
        Context contextI1 = n1VarJ != null ? ((NovaLauncher) n1VarJ).i1() : getContext();
        l30.e eVarQ = l30.e.q(contextI1, true);
        eVarQ.j(new y9.f(contextI1, 2131624068, new String[]{getContext().getString(2132019484), getContext().getString(2132018245)}));
        eVarQ.f84873p = new y9.g(this, eVarQ);
        eVarQ.p();
        eVarQ.o();
        eVarQ.o = viewFindViewById2;
        viewFindViewById2.setOnClickListener(new l10.f(eVarQ, 4));
        viewFindViewById2.setOnTouchListener(new l1(eVarQ, viewFindViewById2));
        l0(this.T, ((d) d.p(getContext())).P().D0);
        if (g3.f79852g) {
            l lVar = new l(this);
            this.O = lVar;
            setWindowInsetsAnimationCallback(lVar);
        }
    }

    @Override // android.view.View.OnFocusChangeListener
    public final void onFocusChange(View view, boolean z11) {
        if (view == this.f21118r) {
            if (z11) {
                this.o = this.f21115m.U0();
                this.n = this.f21115m.f57300l;
                post(new y9.d(this, 1));
                return;
            }
            ea.e eVarA = this.N.a().a(this.f21115m);
            StringJoiner stringJoiner = new StringJoiner("~");
            if (this.o.equals(da.f.FROM_SUGGESTED)) {
                stringJoiner.add(this.n);
            }
            CharSequence charSequence = this.n;
            if (charSequence == null || !charSequence.equals(this.f21115m.f57300l)) {
                ga.c cVar = this.f21115m;
                CharSequence charSequence2 = cVar.f57300l;
                da.q qVar = da.q.TO_STATE_UNSPECIFIED;
                if (charSequence2 != null) {
                    if (u9.b.f90695h.f90687d) {
                        c00.d dVar = cVar.G;
                        if (dVar == null || !dVar.s()) {
                            qVar = cVar.f57300l.length() > 0 ? da.q.TO_CUSTOM_WITH_EMPTY_SUGGESTIONS : da.q.TO_EMPTY_WITH_EMPTY_SUGGESTIONS;
                        } else {
                            c00.d dVar2 = cVar.G;
                            boolean z12 = dVar2 != null && dVar2.r();
                            if (cVar.f57300l.length() == 0) {
                                qVar = z12 ? da.q.TO_EMPTY_WITH_VALID_PRIMARY : da.q.TO_EMPTY_WITH_VALID_SUGGESTIONS_AND_EMPTY_PRIMARY;
                            } else {
                                OptionalInt optionalIntS0 = cVar.S0();
                                if (optionalIntS0.isPresent()) {
                                    int asInt = optionalIntS0.getAsInt();
                                    if (asInt == 0) {
                                        qVar = da.q.TO_SUGGESTION0;
                                    } else if (asInt == 1) {
                                        qVar = z12 ? da.q.TO_SUGGESTION1_WITH_VALID_PRIMARY : da.q.TO_SUGGESTION1_WITH_EMPTY_PRIMARY;
                                    } else if (asInt == 2) {
                                        qVar = z12 ? da.q.TO_SUGGESTION2_WITH_VALID_PRIMARY : da.q.TO_SUGGESTION2_WITH_EMPTY_PRIMARY;
                                    } else if (asInt == 3) {
                                        qVar = z12 ? da.q.TO_SUGGESTION3_WITH_VALID_PRIMARY : da.q.TO_SUGGESTION3_WITH_EMPTY_PRIMARY;
                                    }
                                } else {
                                    qVar = z12 ? da.q.TO_CUSTOM_WITH_VALID_PRIMARY : da.q.TO_CUSTOM_WITH_VALID_SUGGESTIONS_AND_EMPTY_PRIMARY;
                                }
                            }
                        }
                    } else {
                        qVar = charSequence2.length() > 0 ? da.q.TO_CUSTOM_WITH_SUGGESTIONS_DISABLED : da.q.TO_EMPTY_WITH_SUGGESTIONS_DISABLED;
                    }
                }
                if (qVar.toString().startsWith("TO_SUGGESTION")) {
                    stringJoiner.add(this.f21115m.f57300l);
                }
            }
            if (stringJoiner.length() > 0) {
                stringJoiner.toString();
            }
            eVarA.b(ea.d.LAUNCHER_FOLDER_LABEL_UPDATED);
            this.f21118r.a();
        }
    }

    @Override // android.view.View.OnLongClickListener
    public final boolean onLongClick(View view) {
        vm.c cVar = this.f21112j;
        if (ua.g.b(cVar.j())) {
            o0(view, new i());
            return true;
        }
        if ((view instanceof BubbleTextView) && PopupContainerWithArrow.r0((BubbleTextView) view) != null) {
            cVar.j().P.performHapticFeedback(0);
        }
        return true;
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        int iMax = Math.max(this.f21117q.C0(), 5);
        int iB0 = b0();
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(iMax, 1073741824);
        int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(iB0, 1073741824);
        FolderPagedView folderPagedView = this.f21117q;
        int paddingRight = iMax - (folderPagedView.getPaddingRight() + folderPagedView.getPaddingLeft());
        int paddingBottom = iB0 - (folderPagedView.getPaddingBottom() + folderPagedView.getPaddingTop());
        for (int childCount = folderPagedView.getChildCount() - 1; childCount >= 0; childCount--) {
            CellLayout cellLayout = (CellLayout) folderPagedView.getChildAt(childCount);
            cellLayout.f20913s = paddingRight;
            cellLayout.f20914t = paddingBottom;
        }
        FrameLayout frameLayout = this.f21107g0;
        if (frameLayout != null) {
            frameLayout.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
        }
        this.f21117q.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
        if (this.f21117q.getChildCount() > 0) {
            int i12 = (((CellLayout) this.f21117q.getChildAt(0)).f20893b - this.f21113k.P().M) / 2;
            this.f21120t.setPadding(this.f21117q.getPaddingLeft() + i12, this.f21120t.getPaddingTop(), (this.f21117q.getPaddingRight() + i12) - w20.e.k(11), this.f21120t.getPaddingBottom());
        }
        this.f21120t.measure(iMakeMeasureSpec, View.MeasureSpec.makeMeasureSpec(this.f21121u, 1073741824));
        setMeasuredDimension(getPaddingRight() + getPaddingLeft() + iMax, getPaddingBottom() + getPaddingTop() + iB0 + this.f21121u);
    }

    public final void p0(boolean z11) {
        y9.q qVar = new y9.q(this.f21113k.P(), this.f21116p.N, this.T.f51677a == p0.f51735c);
        qVar.d(this.f21115m);
        ArrayList arrayList = new ArrayList();
        iz.b bVar = this.f21115m.H;
        int size = bVar.size();
        for (int i5 = 0; i5 < size; i5++) {
            j jVar = (j) bVar.get(i5);
            if (qVar.e(jVar, i5)) {
                arrayList.add(jVar);
            }
        }
        boolean zIsEmpty = arrayList.isEmpty();
        vm.c cVar = this.f21112j;
        if (!zIsEmpty) {
            fa.p0 p0VarK = cVar.k();
            int iT0 = this.f21115m.T0();
            p0VarK.getClass();
            ArrayList arrayList2 = new ArrayList();
            int size2 = arrayList.size();
            p0VarK.l(new ep.c(arrayList));
            for (int i11 = 0; i11 < size2; i11++) {
                ga.e eVar = (ga.e) arrayList.get(i11);
                p0VarK.o(eVar, iT0, 0, eVar.f57293e, eVar.f57294f);
                ContentValues contentValues = new ContentValues();
                contentValues.put("container", Integer.valueOf(eVar.f57291c));
                contentValues.put("cellX", Float.valueOf(eVar.f57293e.a()));
                contentValues.put("cellY", Float.valueOf(eVar.f57294f.a()));
                contentValues.put("rank", Integer.valueOf(eVar.f57299k));
                contentValues.put("screen", Integer.valueOf(eVar.f57292d));
                arrayList2.add(contentValues);
            }
            p0VarK.i(new o0(p0VarK, arrayList, arrayList2));
        }
        if (u9.b.f90695h.f90687d && !z11 && size > 1) {
            ya.j.f97149d.a(new y9.d(this, 4));
        }
        if (this.f21115m instanceof iz.a) {
            cVar.j().O.Y0(new y9.b(this, 0));
        }
    }

    public final void q0() {
        View viewA;
        View viewA2;
        FolderPagedView folderPagedView = this.f21117q;
        g gVar = new g(3);
        CellLayout cellLayoutA0 = folderPagedView.A0();
        if (cellLayoutA0 == null) {
            viewA = null;
        } else {
            b3 b3Var = cellLayoutA0.P;
            gVar.applyAsInt(b3Var);
            int i5 = folderPagedView.f21138c0;
            viewA = i5 > 0 ? b3Var.a(0 % i5, 0 / i5) : b3Var.getChildAt(0);
        }
        FolderPagedView folderPagedView2 = this.f21117q;
        g gVar2 = new g(2);
        CellLayout cellLayoutA02 = folderPagedView2.A0();
        if (cellLayoutA02 == null) {
            viewA2 = null;
        } else {
            b3 b3Var2 = cellLayoutA02.P;
            int iApplyAsInt = gVar2.applyAsInt(b3Var2);
            int i11 = folderPagedView2.f21138c0;
            viewA2 = i11 > 0 ? b3Var2.a(iApplyAsInt % i11, iApplyAsInt / i11) : b3Var2.getChildAt(iApplyAsInt);
        }
        if (viewA == null || viewA2 == null) {
            setOnKeyListener(null);
            return;
        }
        this.f21118r.setNextFocusDownId(viewA2.getId());
        this.f21118r.setNextFocusRightId(viewA2.getId());
        this.f21118r.setNextFocusLeftId(viewA2.getId());
        this.f21118r.setNextFocusUpId(viewA2.getId());
        this.f21118r.setNextFocusForwardId(viewA.getId());
        setNextFocusDownId(viewA.getId());
        setNextFocusRightId(viewA.getId());
        setNextFocusLeftId(viewA.getId());
        setNextFocusUpId(viewA.getId());
        setOnKeyListener(new y9.e(this, viewA2));
    }

    @Override // ga.b
    public final void s(boolean z11) {
        q0();
    }

    @Keep
    public void setAnimationStrokeColor(int i5) {
        this.f21097b0.setColor(i5);
    }

    @Keep
    public void setImmersiveAlpha(float f11) {
        this.f21105f0 = f11;
        super.invalidate();
    }

    @Override // o9.m0
    public final void u(l0 l0Var) {
        this.f21123w = -1;
        this.f21100d.f79770e = false;
        this.K = (l0Var.f79954f.n.width() / 2) - l0Var.f79951c;
    }

    @Override // o9.m0
    public final void v(l0 l0Var, i iVar) throws NumberFormatException {
        View viewY0;
        FolderPagedView folderPagedView = this.f21117q;
        if (this.f21124x / folderPagedView.W.f96946d != folderPagedView.G()) {
            this.f21122v = g0(l0Var, null);
            this.Q.onAlarm();
            this.f21102e.f79770e = false;
            this.f21104f.f79770e = false;
        }
        this.f21117q.w0();
        vm.c cVar = this.f21112j;
        n1 n1VarJ = cVar.j();
        if (n1VarJ == null) {
            return;
        }
        ga.e eVar = l0Var.f79955g;
        ab.r rVar = eVar instanceof ab.r ? (ab.r) eVar : null;
        j jVarC = rVar != null ? rVar.f759s.c() : null;
        if (rVar == null || jVarC != null) {
            if (jVarC == null) {
                ga.e eVar2 = l0Var.f79955g;
                jVarC = eVar2 instanceof ga.a ? ((ga.a) eVar2).O0() : (j) eVar2;
            }
            j jVar = jVarC;
            if (this.D) {
                FolderPagedView folderPagedView2 = this.f21117q;
                int i5 = this.f21124x;
                viewY0 = folderPagedView2.y0(jVar);
                if (folderPagedView2.f21144i0) {
                    ArrayList arrayList = new ArrayList(folderPagedView2.f21140e0.d0());
                    arrayList.add(i5, viewY0);
                    folderPagedView2.u0(arrayList);
                }
                cVar.k().b(jVar, this.f21115m.T0(), 0, jVar.f57293e, jVar.f57294f);
                this.D = false;
            } else {
                viewY0 = this.C;
                this.f21117q.t0(viewY0, jVar, this.f21124x);
                jVar.f57299k = -1;
            }
            if (l0Var.f79954f.f95683q) {
                float scaleX = getScaleX();
                float scaleY = getScaleY();
                setScaleX(1.0f);
                setScaleY(1.0f);
                n1VarJ.P.q(l0Var.f79954f, viewY0, -1, null);
                setScaleX(scaleX);
                setScaleY(scaleY);
            } else {
                l0Var.f79959k = false;
                viewY0.setVisibility(0);
            }
            this.B = true;
            i0();
            y9.j jVar2 = new y9.j(this);
            try {
                this.f21115m.R0(jVar, this.f21124x, false);
                jVar2.close();
                ga.c cVar2 = this.f21115m;
                if (cVar2 instanceof iz.a) {
                    ((iz.a) cVar2).e1(jVar);
                }
                if (l0Var.f79957i != this) {
                    p0(false);
                }
            } finally {
            }
        } else {
            int iT0 = this.f21115m.T0();
            rVar.f57291c = iT0;
            rVar.f57299k = this.f21124x;
            n1VarJ.v0(rVar, iT0, rVar.f57292d, null, rVar.f57295g, rVar.f57296h);
            l0Var.f79959k = false;
            this.A = true;
        }
        this.E = false;
        if (this.f21117q.getChildCount() > 1) {
            this.f21115m.b1(true, cVar.k());
        }
        ra.f fVar = n1VarJ.M;
        if (((ra.a) fVar.f85765g) == l2.n) {
            fVar.g(l2.f79974m);
        }
        g0 g0Var = l0Var.f79960l;
        if (g0Var != null) {
            g0Var.c();
        }
        this.N.a().a(l0Var.f79955g).b(ea.d.LAUNCHER_ITEM_DROP_COMPLETED);
    }

    @Override // o9.m0
    public final boolean w() {
        return this.f21126z != 1;
    }

    @Override // o9.m0
    public final void x(l0 l0Var) {
        if (!l0Var.f79953e) {
            this.V = l0Var;
            vm.c cVar = this.R;
            o9.b bVar = this.f21100d;
            bVar.f79769d = cVar;
            bVar.a(400L);
        }
        this.f21098c.f79770e = false;
        this.f21102e.f79770e = false;
        this.f21104f.f79770e = false;
        if (this.L != -1) {
            this.f21117q.v0();
            this.L = -1;
        }
    }

    @Override // o9.m0
    public final boolean y(l0 l0Var) {
        int i5 = l0Var.f79955g.f57290b;
        return i5 == 0 || i5 == 1 || i5 == 6;
    }

    @Override // o9.m0
    public final void z(l0 l0Var) {
        if (this.f21104f.f79770e) {
            return;
        }
        float[] fArr = new float[2];
        int iG0 = g0(l0Var, fArr);
        this.f21122v = iG0;
        if (iG0 != this.f21123w) {
            o9.b bVar = this.f21098c;
            bVar.f79770e = false;
            bVar.f79769d = this.Q;
            bVar.a(250L);
            this.f21123w = this.f21122v;
            g0 g0Var = l0Var.f79960l;
            if (g0Var != null) {
                g0Var.a(getContext().getString(2132018645, Integer.valueOf(this.f21122v + 1)));
            }
        }
        int iG = this.f21117q.G();
        e10.k0 k0Var = this.T.f51685i;
        e10.k0 k0Var2 = e10.k0.f51621c;
        o9.b bVar2 = this.f21102e;
        if (k0Var == k0Var2) {
            float f11 = fArr[1];
            float f12 = this.f21117q.A0().f20895c * 0.45f;
            boolean z11 = f11 < f12;
            boolean z12 = f11 > ((float) getHeight()) - f12;
            if (iG > 0 && z11) {
                m0(0, l0Var);
                return;
            }
            if (iG < this.f21117q.getChildCount() - 1 && z12) {
                m0(1, l0Var);
                return;
            }
            bVar2.f79770e = false;
            if (this.L != -1) {
                this.f21117q.v0();
                this.L = -1;
                return;
            }
            return;
        }
        float f13 = fArr[0];
        float f14 = this.f21117q.A0().f20893b * 0.45f;
        boolean z13 = f13 < f14;
        boolean z14 = f13 > ((float) getWidth()) - f14;
        if (iG > 0 && (!this.f21117q.T ? !z13 : !z14)) {
            m0(0, l0Var);
            return;
        }
        if (iG < this.f21117q.getChildCount() - 1 && (!this.f21117q.T ? !z14 : !z13)) {
            m0(1, l0Var);
            return;
        }
        bVar2.f79770e = false;
        if (this.L != -1) {
            this.f21117q.v0();
            this.L = -1;
        }
    }
}
