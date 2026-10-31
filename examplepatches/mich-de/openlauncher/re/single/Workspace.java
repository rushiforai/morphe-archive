package com.android.launcher3;

import aa.n;
import android.animation.LayoutTransition;
import android.animation.ValueAnimator;
import android.app.WallpaperManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Picture;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Message;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.AccelerateDecelerateInterpolator;
import b.c0;
import bn.d1;
import com.android.launcher3.Workspace;
import com.android.launcher3.allapps.AllAppsContainerView;
import com.android.launcher3.dragndrop.DragLayer;
import com.android.launcher3.folder.Folder;
import com.android.launcher3.folder.FolderIcon;
import com.android.launcher3.logging.InstanceId;
import com.android.launcher3.logging.StatsLogManager;
import com.android.launcher3.pageindicators.WorkspacePageIndicator;
import com.android.launcher3.popup.PopupContainerWithArrow;
import com.teslacoilsw.launcher.CellLayoutPagedView;
import com.teslacoilsw.launcher.Hotseat;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.popup.SimplePopupView;
import com.teslacoilsw.launcher.util.NamedIntent;
import com.teslacoilsw.launcher.workspace.CrosshairsCellLayout;
import e10.h3;
import e10.s1;
import e10.u2;
import e10.y2;
import fa.h0;
import fk.l;
import fz.i0;
import ga.e;
import ga.g;
import h6.c1;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import java.util.stream.Collectors;
import je.f;
import kl.q0;
import kotlin.math.MathKt;
import kotlin.reflect.KProperty;
import mx.j0;
import n30.a;
import o7.g0;
import o9.a0;
import o9.a4;
import o9.b;
import o9.b3;
import o9.d4;
import o9.e4;
import o9.f4;
import o9.g3;
import o9.j4;
import o9.k;
import o9.k0;
import o9.l0;
import o9.l2;
import o9.l4;
import o9.m0;
import o9.m4;
import o9.n1;
import o9.n4;
import o9.r0;
import ra.d;
import s9.m;
import x7.h;
import x9.c;
import x9.o;
import x9.t;
import x9.u;
import y9.v;
import y9.y;
import ya.f0;
import ya.i;
import ya.j;
import ya.o0;
import ya.p;
import ya.p0;
import ya.r;
import ya.s;
import ya.w;

/* loaded from: classes.dex */
public class Workspace extends CellLayoutPagedView implements m0, k0, View.OnTouchListener, c, r0, d, m4 {

    /* renamed from: m1, reason: collision with root package name */
    public static final /* synthetic */ int f20990m1 = 0;
    public boolean A0;
    public boolean B0;
    public final p0 C0;
    public boolean D0;
    public final b E0;
    public y F0;
    public FolderIcon G0;
    public boolean H0;
    public boolean I0;
    public float J0;
    public float K0;
    public int L0;
    public a M0;
    public a N0;
    public SparseArray O0;
    public final p P0;
    public float Q0;
    public float R0;
    public f0 S0;
    public boolean T0;
    public Runnable U0;
    public boolean V0;
    public float W0;
    public final n4 X0;
    public final StatsLogManager Y0;
    public final Rect Z0;

    /* renamed from: a1, reason: collision with root package name */
    public final Rect f20991a1;

    /* renamed from: b1, reason: collision with root package name */
    public int f20992b1;

    /* renamed from: c1, reason: collision with root package name */
    public int f20993c1;

    /* renamed from: d1, reason: collision with root package name */
    public boolean f20994d1;

    /* renamed from: e1, reason: collision with root package name */
    public boolean f20995e1;

    /* renamed from: f0, reason: collision with root package name */
    public final LayoutTransition f20996f0;

    /* renamed from: f1, reason: collision with root package name */
    public boolean f20997f1;

    /* renamed from: g0, reason: collision with root package name */
    public final WallpaperManager f20998g0;
    public final a0 g1;

    /* renamed from: h0, reason: collision with root package name */
    public b3 f20999h0;
    public boolean h1;

    /* renamed from: i0, reason: collision with root package name */
    public final s f21000i0;
    public final Paint i1;

    /* renamed from: j0, reason: collision with root package name */
    public final p f21001j0;

    /* renamed from: j1, reason: collision with root package name */
    public BitmapDrawable f21002j1;

    /* renamed from: k0, reason: collision with root package name */
    public boolean f21003k0;

    /* renamed from: k1, reason: collision with root package name */
    public final i0 f21004k1;

    /* renamed from: l0, reason: collision with root package name */
    public o9.s f21005l0;

    /* renamed from: l1, reason: collision with root package name */
    public boolean f21006l1;

    /* renamed from: m0, reason: collision with root package name */
    public a[] f21007m0;

    /* renamed from: n0, reason: collision with root package name */
    public int f21008n0;

    /* renamed from: o0, reason: collision with root package name */
    public int f21009o0;

    /* renamed from: p0, reason: collision with root package name */
    public CellLayout f21010p0;

    /* renamed from: q0, reason: collision with root package name */
    public CellLayout f21011q0;

    /* renamed from: r0, reason: collision with root package name */
    public CellLayout f21012r0;

    /* renamed from: s0, reason: collision with root package name */
    public final NovaLauncher f21013s0;

    /* renamed from: t0, reason: collision with root package name */
    public t f21014t0;

    /* renamed from: u0, reason: collision with root package name */
    public final int[] f21015u0;

    /* renamed from: v0, reason: collision with root package name */
    public final float[] f21016v0;

    /* renamed from: w0, reason: collision with root package name */
    public float[] f21017w0;

    /* renamed from: x0, reason: collision with root package name */
    public h f21018x0;

    /* renamed from: y0, reason: collision with root package name */
    public boolean f21019y0;

    /* renamed from: z0, reason: collision with root package name */
    public boolean f21020z0;

    public Workspace(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f21000i0 = new s();
        this.f21001j0 = new p();
        this.f21003k0 = false;
        a aVar = a.f77776b;
        this.f21007m0 = new a[]{aVar, aVar};
        this.f21008n0 = -1;
        this.f21009o0 = -1;
        this.f21010p0 = null;
        this.f21011q0 = null;
        this.f21012r0 = null;
        this.f21015u0 = new int[2];
        this.f21016v0 = new float[2];
        this.f21017w0 = new float[2];
        this.f21019y0 = false;
        this.f21020z0 = true;
        this.A0 = false;
        this.E0 = new b();
        this.G0 = null;
        this.H0 = false;
        this.I0 = false;
        this.L0 = 0;
        this.M0 = aVar;
        this.N0 = aVar;
        this.P0 = new p();
        this.T0 = false;
        this.V0 = false;
        this.Z0 = new Rect();
        this.f20991a1 = new Rect();
        this.f20992b1 = -1;
        this.f20993c1 = -1;
        this.f20994d1 = false;
        this.f20995e1 = false;
        this.f20997f1 = false;
        this.h1 = false;
        this.i1 = new Paint();
        this.f21002j1 = null;
        this.f21004k1 = new i0(this, new String[]{"android.intent.action.WALLPAPER_CHANGED"}, 2);
        this.f21006l1 = false;
        q0 q0Var = n1.C0;
        NovaLauncher novaLauncher = (NovaLauncher) k.Y(context);
        this.f21013s0 = novaLauncher;
        this.X0 = new n4(novaLauncher, this);
        WallpaperManager wallpaperManager = WallpaperManager.getInstance(context);
        this.f20998g0 = wallpaperManager;
        this.C0 = new p0(this);
        setHapticFeedbackEnabled(false);
        this.f80106f = K0();
        setClipToPadding(false);
        LayoutTransition layoutTransition = new LayoutTransition();
        this.f20996f0 = layoutTransition;
        layoutTransition.enableTransitionType(3);
        this.f20996f0.enableTransitionType(1);
        LayoutTransition layoutTransition2 = this.f20996f0;
        AccelerateDecelerateInterpolator accelerateDecelerateInterpolator = s9.k.f86798k;
        layoutTransition2.setInterpolator(3, s9.k.a(accelerateDecelerateInterpolator, 0.0f, 0.5f));
        this.f20996f0.setInterpolator(1, s9.k.a(accelerateDecelerateInterpolator, 0.5f, 1.0f));
        this.f20996f0.disableTransitionType(2);
        this.f20996f0.disableTransitionType(0);
        setLayoutTransition(this.f20996f0);
        if (wallpaperManager != null) {
            T0();
            j.f97146a.execute(new a90.d(this, 6));
        }
        setMotionEventSplittingEnabled(true);
        setOnTouchListener(new ua.j(novaLauncher, this));
        this.Y0 = StatsLogManager.b(context);
        this.g1 = new a0(this, new e4(this), null);
        if (S()) {
            this.f80124z = false;
        }
        y2.f51877a.getClass();
        if (((NamedIntent) y2.y0().l()).f46369b == null) {
            this.J = new i(getContext());
        } else {
            this.J = new cz.i(this, true, y2.y0());
        }
        if (((NamedIntent) y2.x0().l()).f46369b == null) {
            this.K = new i(getContext());
        } else {
            this.K = new cz.i(this, false, y2.x0());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean u1(android.view.View r5, ga.e r6) {
        /*
            r0 = 0
            if (r5 == 0) goto L1a
            android.view.ViewGroup$LayoutParams r1 = r5.getLayoutParams()
            o9.v r1 = (o9.v) r1
            boolean r2 = r1.f80181e
            if (r2 == 0) goto L1a
            int r2 = r1.f80179c
            int r3 = r1.f80177a
            if (r2 != r3) goto L39
            int r2 = r1.f80180d
            int r1 = r1.f80178b
            if (r2 == r1) goto L1a
            goto L39
        L1a:
            boolean r1 = r5 instanceof com.android.launcher3.folder.FolderIcon
            if (r1 == 0) goto L39
            com.android.launcher3.folder.FolderIcon r5 = (com.android.launcher3.folder.FolderIcon) r5
            com.android.launcher3.folder.Folder r1 = r5.H
            boolean r2 = r1.J
            if (r2 != 0) goto L39
            int r2 = r6.f57290b
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 == r3) goto L30
            r4 = 6
            if (r2 != r4) goto L39
        L30:
            ga.c r5 = r5.I
            if (r6 == r5) goto L39
            boolean r5 = r1.f79742a
            if (r5 != 0) goto L39
            return r3
        L39:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.launcher3.Workspace.u1(android.view.View, ga.e):boolean");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r13v0, types: [android.view.View] */
    /* JADX WARN: Type inference failed for: r14v0, types: [x9.o] */
    /* JADX WARN: Type inference failed for: r14v1, types: [x9.p] */
    /* JADX WARN: Type inference failed for: r14v10, types: [x9.p] */
    public final u A0(View view, o oVar, k0 k0Var, e eVar, l lVar, x9.i iVar) {
        float fK;
        n nVarE;
        SimplePopupView simplePopupViewP0;
        n nVar;
        float f11 = 1.0f;
        if ((view instanceof BubbleTextView) && (nVar = ((BubbleTextView) view).f20869f) != null && nVar.f633h != null) {
            f11 = nVar.f634i;
        }
        view.clearFocus();
        view.setPressed(false);
        boolean z11 = view instanceof BubbleTextView;
        if (z11) {
            BubbleTextView bubbleTextView = (BubbleTextView) view;
            bubbleTextView.setPressed(false);
            bubbleTextView.refreshDrawableState();
        }
        if (oVar == 0 && (view instanceof x9.p)) {
            oVar = (x9.p) view;
        }
        float f12 = f11;
        View viewG = lVar.g();
        Point point = null;
        int[] iArr = this.f21015u0;
        if (viewG == null) {
            nVarE = lVar.e();
            fK = lVar.i(nVarE, iArr);
        } else {
            fK = lVar.k(viewG, iArr);
            nVarE = null;
        }
        float f13 = fK;
        int i5 = lVar.f55199a / 2;
        int i11 = iArr[0];
        int i12 = iArr[1];
        Rect rect = new Rect();
        if (oVar != 0) {
            oVar.k(rect);
            i12 += rect.top;
            point = new Point(-i5, i5);
        }
        if (view.getParent() instanceof b3) {
            this.f20999h0 = (b3) view.getParent();
        }
        NovaLauncher novaLauncher = this.f21013s0;
        if (z11 && !iVar.f95648a) {
            PopupContainerWithArrow popupContainerWithArrowR0 = PopupContainerWithArrow.r0((BubbleTextView) view);
            if (popupContainerWithArrowR0 != null) {
                iVar.f95651d = new f(popupContainerWithArrowR0, 2);
            }
        } else if ((view instanceof ab.o) && !iVar.f95648a && (simplePopupViewP0 = SimplePopupView.p0(novaLauncher, (ab.o) view)) != null) {
            iVar.f95651d = simplePopupViewP0.n0();
        }
        if (viewG == null) {
            return this.f21014t0.t(nVarE, null, i11, i12, k0Var, eVar, point, rect, f13 * f12, f13, iVar);
        }
        if (viewG instanceof ab.o) {
            this.f21014t0.a(new cb.a(novaLauncher));
        }
        return this.f21014t0.t(null, viewG, i11, i12, k0Var, eVar, point, rect, f13 * f12, f13, iVar);
    }

    public final void B0(View view, k0 k0Var, x9.i iVar) {
        Object tag = view.getTag();
        if (tag instanceof e) {
            A0(view, null, k0Var, (e) tag, new l(view), iVar);
            return;
        }
        throw new IllegalStateException("Drag started with a view that has no tag set. This will cause a crash (issue 11627249) down the line. View: " + view + "  tag: " + view.getTag());
    }

    @Override // o9.s2
    public final String C() {
        int i5 = this.f80108h;
        if (i5 == -100) {
            i5 = this.f80106f;
        }
        int childCount = getChildCount();
        int iK = this.f21001j0.k(-201);
        if (iK >= 0 && childCount > 1) {
            if (i5 == iK) {
                return getContext().getString(2132020445);
            }
            childCount--;
        }
        return childCount == 0 ? getContext().getString(2132017997) : getContext().getString(2132020446, Integer.valueOf(i5 + 1), Integer.valueOf(childCount));
    }

    public final void C0() {
        FolderIcon folderIcon = this.G0;
        if (folderIcon != null) {
            y yVar = folderIcon.K;
            yVar.a(1.0f, new v(yVar, yVar.f96987p, yVar.f80127a, yVar.f80128b, 1), new d4(yVar, 18));
            folderIcon.R.f79770e = false;
            this.G0 = null;
        }
    }

    public final void D0(boolean z11) {
        if (z11) {
            this.E0.f79770e = false;
        }
        a aVar = a.f77776b;
        this.M0 = aVar;
        this.N0 = aVar;
    }

    @Override // x9.c
    public final void E(l0 l0Var, x9.i iVar) {
        boolean z11;
        boolean z12;
        boolean z13;
        o9.s sVar = this.f21005l0;
        if (sVar != null) {
            View view = sVar.f80092a;
            ((CellLayout) (view instanceof ab.o ? l0Var.f79954f.f95671c.getParent() : view.getParent().getParent())).H(this.f21005l0.f80092a);
        }
        q1();
        if ((!iVar.f95648a || l0Var.f79957i == this) && l0Var.f79955g.f57290b != 9999) {
            this.f21003k0 = false;
            b3 b3Var = this.f20999h0;
            if (b3Var != null) {
                int childCount = b3Var.getChildCount();
                X0();
                if (l0Var.f79954f.f95669a instanceof ab.o) {
                    childCount++;
                }
                z11 = childCount == 1;
                z12 = D(indexOfChild((CellLayout) this.f20999h0.getParent())) == D(getChildCount() - 1);
            } else {
                z11 = false;
                z12 = false;
            }
            if (!z11 || !z12) {
                J0(new a4(this, i));
            }
            if (l0Var.f79955g.f57290b == 4 && l0Var.f79957i != this) {
                int iJ = J(this.f80118t.g(this));
                while (true) {
                    if (iJ >= getChildCount()) {
                        break;
                    }
                    CellLayout cellLayout = (CellLayout) H(iJ);
                    e eVar = l0Var.f79955g;
                    int[] iArr = new int[2];
                    int i5 = 0;
                    while (true) {
                        if (i5 >= cellLayout.f20903g) {
                            z13 = false;
                            break;
                        }
                        int i11 = 0;
                        while (i11 < cellLayout.f20904h) {
                            cellLayout.i(i5, i11, iArr);
                            int[] iArr2 = iArr;
                            int i12 = i5;
                            int i13 = i11;
                            if (cellLayout.w(iArr2[0], iArr2[1], eVar.f57297i.c(cellLayout), eVar.f57298j.c(cellLayout), eVar.f57295g.c(cellLayout), eVar.f57296h.c(cellLayout), cellLayout.U, null, true, new o9.u(), false).f80145i) {
                                z13 = true;
                                break;
                            } else {
                                i11 = i13 + 1;
                                iArr = iArr2;
                                i5 = i12;
                            }
                        }
                        i5++;
                    }
                    if (z13) {
                        g0(iJ);
                        break;
                    }
                    iJ++;
                }
            }
        }
        NovaLauncher novaLauncher = this.f21013s0;
        if (novaLauncher.f80014o0.isShowing()) {
            novaLauncher.f80014o0.hideOverlay(true);
        }
        Rect rect = Folder.f21093j0;
        Folder folder = (Folder) o9.a.P(novaLauncher, 1);
        if (folder != null) {
            if (folder.h0()) {
                return;
            }
            if ((folder.W != null ? 1 : 0) != 0) {
                return;
            }
        }
        if (this.f20995e1 || this.f20997f1) {
            return;
        }
        if (((ra.a) novaLauncher.M.f85765g) == l2.f79974m) {
            y2.f51877a.getClass();
            if (!((Boolean) y2.f51913j2.l()).booleanValue()) {
                t0(true);
                return;
            }
        }
        novaLauncher.M.h(l2.n);
        this.Y0.a().a(l0Var.f79955g).b(ea.d.LAUNCHER_ITEM_DRAG_STARTED);
    }

    public final r E0() {
        if (this.f21013s0.Z) {
            return new r();
        }
        r rVar = new r();
        J0(new ab.f0(9, this, rVar));
        return rVar;
    }

    public final boolean F0(View view, int i5, CellLayout cellLayout, a[] aVarArr, float f11, boolean z11, l0 l0Var) throws Resources.NotFoundException {
        if (f11 <= cellLayout.y(aVarArr)) {
            View viewB = cellLayout.B(aVarArr[0], aVarArr[1]);
            o9.s sVar = this.f21005l0;
            boolean z12 = sVar != null && O0(sVar.f80092a) == cellLayout && this.f21005l0.f80095d.equals(aVarArr[0]) && this.f21005l0.f80096e.equals(aVarArr[1]);
            if (viewB != null && !z12 && this.H0) {
                this.H0 = false;
                int iM0 = M0(cellLayout);
                boolean z13 = viewB.getTag() instanceof ga.j;
                boolean z14 = view.getTag() instanceof ga.j;
                if (z13 && z14) {
                    ga.j jVar = (ga.j) view.getTag();
                    ga.j jVar2 = (ga.j) viewB.getTag();
                    if (!z11) {
                        O0(this.f21005l0.f80092a).removeView(this.f21005l0.f80092a);
                    }
                    Rect rect = new Rect();
                    NovaLauncher novaLauncher = this.f21013s0;
                    float fI = novaLauncher.P.i(viewB, rect);
                    cellLayout.removeView(viewB);
                    if (l0Var != null) {
                        this.Y0.a().a(jVar2).b(ea.d.LAUNCHER_ITEM_DROP_FOLDER_CREATED);
                    }
                    a aVar = aVarArr[0];
                    a aVar2 = aVarArr[1];
                    ga.c cVar = new ga.c();
                    iz.c cVar2 = cVar.f57303q;
                    n30.b bVar = n30.b.f77779c;
                    cVar2.h(cellLayout.F(aVar, aVar2, bVar, bVar));
                    novaLauncher.f80002c0.a(cVar, i5, iM0, aVar, aVar2);
                    FolderIcon folderIconC0 = FolderIcon.c0(2131624154, novaLauncher, cellLayout, cVar);
                    novaLauncher.O.d(folderIconC0, cVar);
                    cellLayout.P.d(folderIconC0);
                    a aVar3 = a.f77776b;
                    jVar2.f57293e = aVar3;
                    jVar2.f57294f = aVar3;
                    jVar.f57293e = aVar3;
                    jVar.f57294f = aVar3;
                    if (l0Var == null) {
                        nz.d dVar = folderIconC0.O;
                        dVar.getClass();
                        n nVar = ((BubbleTextView) viewB).f20869f;
                        dVar.b(nVar.f627b.getWidth(), viewB.getMeasuredWidth());
                        dVar.f96874g = nVar;
                        ga.c cVar3 = folderIconC0.I;
                        cVar3.R0(jVar2, cVar3.H.size(), true);
                        ga.c cVar4 = folderIconC0.I;
                        cVar4.R0(jVar, cVar4.H.size(), true);
                        return true;
                    }
                    y yVar = this.F0;
                    folderIconC0.K = yVar;
                    yVar.f96985l = folderIconC0;
                    yVar.i();
                    this.F0 = new y();
                    nz.d dVar2 = folderIconC0.O;
                    dVar2.getClass();
                    n nVar2 = ((BubbleTextView) viewB).f20869f;
                    dVar2.b(nVar2.f627b.getWidth(), viewB.getMeasuredWidth());
                    dVar2.f96874g = nVar2;
                    ga.c cVar5 = folderIconC0.I;
                    cVar5.R0(jVar2, cVar5.H.size(), true);
                    folderIconC0.O.d(false, null).c();
                    folderIconC0.e0(jVar, l0Var, rect, fI, 1, false);
                    return true;
                }
            }
        }
        return false;
    }

    public final void G0() {
        if (this.f21020z0) {
            int childCount = getChildCount();
            int[] iArrP = P();
            int iC = iArrP[0];
            int iC2 = iArrP[1];
            if (this.V0) {
                iC = g3.c(this.f80106f - 1, 0, iC2);
                iC2 = g3.c(this.f80106f + 1, iC, getChildCount() - 1);
            }
            if (iC == iC2) {
                if (iC2 < childCount - 1) {
                    iC2++;
                } else if (iC > 0) {
                    iC--;
                }
            }
            int i5 = 0;
            while (i5 < childCount) {
                CellLayout cellLayout = (CellLayout) H(i5);
                boolean z11 = iC <= i5 && i5 <= iC2;
                if ((iC == -1 && i5 == childCount - 1) || (iC2 == childCount && i5 == 0)) {
                    z11 = true;
                }
                cellLayout.s(z11);
                i5++;
            }
        }
    }

    public final int[] H0(e eVar) {
        float fV;
        int[] iArr = new int[2];
        if (getChildCount() <= 0) {
            iArr[0] = Integer.MAX_VALUE;
            iArr[1] = Integer.MAX_VALUE;
            return iArr;
        }
        CellLayout cellLayout = (CellLayout) getChildAt(0);
        boolean z11 = eVar.f57290b == 4;
        float f11 = 0.0f * 2;
        int iB = MathKt.b(f11);
        int iB2 = MathKt.b(f11);
        n30.b bVar = eVar.f57295g;
        n30.b bVar2 = eVar.f57296h;
        Rect rect = new Rect();
        if (!cellLayout.f()) {
            iB /= 2;
        }
        if (!cellLayout.f()) {
            iB2 /= 2;
        }
        cellLayout.j(iB, iB2, bVar.c(cellLayout), bVar2.c(cellLayout), rect);
        if (z11) {
            PointF pointF = this.f21013s0.f79934x.f77154l0;
            fV = g3.v(pointF.x, pointF.y, rect);
        } else {
            fV = 1.0f;
        }
        iArr[0] = rect.width();
        int iHeight = rect.height();
        iArr[1] = iHeight;
        if (z11) {
            iArr[0] = (int) (iArr[0] / fV);
            iArr[1] = (int) (iHeight / fV);
        }
        return iArr;
    }

    public final a[] I0(int i5, int i11, n30.b bVar, n30.b bVar2, CellLayout cellLayout, a[] aVarArr) {
        int iC = bVar.c(cellLayout);
        int iC2 = bVar2.c(cellLayout);
        int[] iArrV = cellLayout.v(i5, i11, iC, iC2, iC, iC2, false, this.f21015u0, null);
        a[] aVarArr2 = aVarArr == null ? new a[2] : aVarArr;
        aVarArr2[0] = a.b(cellLayout, iArrV[0]);
        aVarArr2[1] = a.b(cellLayout, iArrV[1]);
        return aVarArr2;
    }

    public final void J0(Consumer consumer) {
        consumer.accept(-201);
        X0();
    }

    public final int K0() {
        return ((Integer) y2.f51877a.t().l()).intValue();
    }

    public final View L0(w wVar) {
        boolean z11;
        View[] viewArr = new View[1];
        for (CellLayout cellLayout : R0()) {
            View view = null;
            if (cellLayout != null) {
                b3 b3Var = cellLayout.P;
                int childCount = b3Var.getChildCount();
                int i5 = 0;
                while (true) {
                    if (i5 >= childCount) {
                        break;
                    }
                    View childAt = b3Var.getChildAt(i5);
                    if (wVar.k(childAt, (e) childAt.getTag())) {
                        viewArr[0] = childAt;
                        z11 = true;
                    } else {
                        z11 = false;
                    }
                    if (z11) {
                        view = childAt;
                        break;
                    }
                    i5++;
                }
            }
            if (view != null) {
                break;
            }
        }
        return viewArr[0];
    }

    @Override // o9.s2
    public final int M() {
        X0();
        return 1;
    }

    public final int M0(CellLayout cellLayout) {
        s sVar = this.f21000i0;
        int iIndexOfValue = sVar.indexOfValue(cellLayout);
        if (iIndexOfValue != -1) {
            return sVar.keyAt(iIndexOfValue);
        }
        Hotseat hotseat = this.f21013s0.T;
        int iIndexOfChild = hotseat.indexOfChild(cellLayout);
        for (int i5 = 0; i5 < 10; i5++) {
            if (hotseat.x0(i5) == iIndexOfChild) {
                return i5;
            }
        }
        return -1;
    }

    public final int N0(int i5) {
        return indexOfChild((View) this.f21000i0.get(i5));
    }

    public final CellLayout O0(View view) {
        for (CellLayout cellLayout : R0()) {
            if (cellLayout.P.indexOfChild(view) > -1) {
                return cellLayout;
            }
        }
        return null;
    }

    public final int P0(int i5) {
        if (i5 < 0) {
            return -1;
        }
        p pVar = this.f21001j0;
        if (i5 < pVar.f97194b) {
            return pVar.j(i5);
        }
        return -1;
    }

    public final CellLayout Q0(int i5) {
        return (CellLayout) this.f21000i0.get(i5);
    }

    @Override // o9.s2
    public final void R(View view) {
        super.R(view);
        ((WorkspacePageIndicator) this.E).f(this.f21013s0.X);
    }

    public final CellLayout[] R0() {
        CellLayout[] cellLayoutArr;
        int childCount = getChildCount();
        Hotseat hotseat = this.f21013s0.T;
        if (hotseat != null) {
            cellLayoutArr = new CellLayout[hotseat.getChildCount() + childCount];
            for (int i5 = 0; i5 < hotseat.getChildCount(); i5++) {
                cellLayoutArr[childCount + i5] = (CellLayout) hotseat.getChildAt(i5);
            }
        } else {
            cellLayoutArr = new CellLayout[childCount];
        }
        for (int i11 = 0; i11 < childCount; i11++) {
            cellLayoutArr[i11] = (CellLayout) getChildAt(i11);
        }
        return cellLayoutArr;
    }

    @Override // o9.s2
    public final boolean S() {
        return getScaleX() == 1.0f && getChildCount() >= 2 && ((Boolean) y2.f51877a.w().l()).booleanValue();
    }

    public final boolean S0() {
        if (!this.f21000i0.d(-201)) {
            return false;
        }
        X0();
        return true;
    }

    public final void T0() {
        y2.f51877a.getClass();
        boolean zBooleanValue = ((Boolean) y2.B1().l()).booleanValue();
        i0 i0Var = this.f21004k1;
        if (zBooleanValue) {
            if (!i0Var.f93725b) {
                i0Var.a(getContext());
            }
            WallpaperManager wallpaperManager = this.f20998g0;
            if (wallpaperManager != null && wallpaperManager.getWallpaperInfo() == null) {
                try {
                    BitmapDrawable bitmapDrawable = (BitmapDrawable) wallpaperManager.getDrawable();
                    this.f21002j1 = bitmapDrawable;
                    if (bitmapDrawable != null && bitmapDrawable.getIntrinsicWidth() > getMeasuredWidth()) {
                        final int i5 = 0;
                        post(new Runnable(this) { // from class: o9.b4

                            /* renamed from: b, reason: collision with root package name */
                            public final /* synthetic */ Workspace f79781b;

                            {
                                this.f79781b = this;
                            }

                            @Override // java.lang.Runnable
                            public final void run() {
                                switch (i5) {
                                    case 0:
                                        Window window = this.f79781b.f21013s0.getWindow();
                                        window.setBackgroundDrawable(null);
                                        window.setFormat(-1);
                                        window.clearFlags(1048576);
                                        break;
                                    default:
                                        Window window2 = this.f79781b.f21013s0.getWindow();
                                        window2.setBackgroundDrawable(null);
                                        window2.setFormat(-2);
                                        window2.addFlags(1048576);
                                        break;
                                }
                            }
                        });
                        return;
                    }
                } catch (SecurityException e3) {
                    e3.printStackTrace();
                } catch (Exception e11) {
                    e11.printStackTrace();
                    NovaLauncher.x1(e11);
                }
            }
        } else {
            Context context = getContext();
            if (i0Var.f93725b) {
                context.unregisterReceiver(i0Var);
                i0Var.f93725b = false;
            }
        }
        this.f21002j1 = null;
        final int i11 = 1;
        post(new Runnable(this) { // from class: o9.b4

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ Workspace f79781b;

            {
                this.f79781b = this;
            }

            @Override // java.lang.Runnable
            public final void run() {
                switch (i11) {
                    case 0:
                        Window window = this.f79781b.f21013s0.getWindow();
                        window.setBackgroundDrawable(null);
                        window.setFormat(-1);
                        window.clearFlags(1048576);
                        break;
                    default:
                        Window window2 = this.f79781b.f21013s0.getWindow();
                        window2.setBackgroundDrawable(null);
                        window2.setFormat(-2);
                        window2.addFlags(1048576);
                        break;
                }
            }
        });
    }

    @Override // o9.s2
    public final void U(int i5) {
        super.U(i5);
        int i11 = this.f80106f;
        if (i5 != i11) {
            ea.d dVar = i5 < i11 ? ea.d.LAUNCHER_SWIPERIGHT : ea.d.LAUNCHER_SWIPELEFT;
            ea.e eVarA = this.f21013s0.O().a();
            da.c cVarR = da.d.r();
            da.t tVarH = da.u.h();
            tVarH.e(i5);
            cVarR.o(tVarH);
            eVarA.b(dVar);
        }
    }

    public final void U0(int i5, int i11) {
        s sVar = this.f21000i0;
        if (sVar.d(i5)) {
            throw new RuntimeException(c0.i(i5, "Screen id ", " already exists!"));
        }
        CrosshairsCellLayout crosshairsCellLayout = (CrosshairsCellLayout) LayoutInflater.from(getContext()).inflate(2131624479, (ViewGroup) this, false);
        y2.f51877a.A().l();
        boolean z11 = y2.v().l() == s1.NONE;
        crosshairsCellLayout.f46505u0 = true;
        crosshairsCellLayout.f46506v0 = z11;
        NovaLauncher novaLauncher = this.f21013s0;
        if (i5 == -201 && i11 > 0) {
            Drawable drawable = novaLauncher.getDrawable(2131231039);
            drawable.setTint(v30.e.m((g30.b) g30.b.f57016l.h(novaLauncher), 0));
            crosshairsCellLayout.f46496l0 = drawable;
        }
        sVar.put(i5, crosshairsCellLayout);
        this.f21001j0.d(i11, i5);
        addView(crosshairsCellLayout, i11);
        l2 l2Var = (l2) ((ra.a) novaLauncher.M.f85765g);
        n4.b(l2Var, crosshairsCellLayout, i11, l2Var.k((NovaLauncher) this.X0.f80036b), s9.o.f86814a, new sa.d());
        s1();
        t1();
    }

    @Override // o9.s2
    public final void V(int i5, View view) throws Resources.NotFoundException {
        p pVar = this.f21001j0;
        int iJ = pVar.j(i5);
        pVar.n(i5);
        this.f21000i0.remove(iJ);
        NovaLauncher novaLauncher = this.f21013s0;
        fa.p0 p0Var = novaLauncher.f80002c0;
        p0Var.m();
        CellLayout cellLayout = (CellLayout) view;
        b3 b3Var = cellLayout.P;
        while (b3Var.getChildCount() > 0) {
            View childAt = b3Var.getChildAt(0);
            novaLauncher.T0(childAt, (e) childAt.getTag(), true);
            b3Var.removeView(childAt);
        }
        e eVar = cellLayout.f20902f0;
        if (eVar != null) {
            p0Var.e(eVar);
        }
        l30.s.U(novaLauncher, new h0(p0Var, 2), new com.instabridge.ai.chat.ui.c0(this, i5, p0Var, 6));
    }

    public final boolean V0() {
        return !this.f21019y0 || this.R0 > 0.5f;
    }

    @Override // o9.s2
    public final void W() {
        q1();
    }

    public final boolean W0(int i5, int i11) {
        NovaLauncher novaLauncher = this.f21013s0;
        if (novaLauncher.T.getVisibility() == 0) {
            float[] fArr = this.f21016v0;
            fArr[0] = i5;
            fArr[1] = i11;
            DragLayer dragLayer = novaLauncher.P;
            dragLayer.getClass();
            g3.i(this, dragLayer, fArr, true, false);
            if (fArr[0] >= r1.getLeft() && fArr[0] <= r1.getRight() && fArr[1] >= r1.getTop() && fArr[1] <= r1.getBottom()) {
                return true;
            }
        }
        return false;
    }

    @Override // o9.s2
    public final void X() {
        super.X();
        q1();
        if (this.f21014t0.o() && w1()) {
            t tVar = this.f21014t0;
            int[] iArr = tVar.f95707c;
            Point point = tVar.f95711g;
            m0 m0VarI = tVar.i(point.x, point.y, iArr);
            l0 l0Var = tVar.f95713i;
            l0Var.f79949a = iArr[0];
            l0Var.f79950b = iArr[1];
            tVar.e(m0VarI);
        }
        if (this.A0) {
            o1();
            this.A0 = false;
        }
        ((x20.e) y2.f51877a.U0().l()).d(this.f21013s0);
    }

    public final boolean X0() {
        this.f21013s0.f79934x.getClass();
        return false;
    }

    public final void Y0(w wVar) {
        for (CellLayout cellLayout : R0()) {
            View view = null;
            if (cellLayout != null) {
                b3 b3Var = cellLayout.P;
                int childCount = b3Var.getChildCount();
                int i5 = 0;
                while (true) {
                    if (i5 >= childCount) {
                        break;
                    }
                    View childAt = b3Var.getChildAt(i5);
                    if (wVar.k(childAt, (e) childAt.getTag())) {
                        view = childAt;
                        break;
                    }
                    i5++;
                }
            }
            if (view != null) {
                return;
            }
        }
    }

    public final void Z0(CellLayout cellLayout, float[] fArr) {
        NovaLauncher novaLauncher = this.f21013s0;
        if (!novaLauncher.Q0(cellLayout)) {
            fArr[0] = fArr[0] - cellLayout.getLeft();
            fArr[1] = fArr[1] - cellLayout.getTop();
            return;
        }
        DragLayer dragLayer = novaLauncher.P;
        dragLayer.getClass();
        g3.i(this, dragLayer, fArr, true, false);
        DragLayer dragLayer2 = novaLauncher.P;
        dragLayer2.getClass();
        g3.q(cellLayout, dragLayer2, fArr);
    }

    @Override // o9.m0
    public final void a(Rect rect) {
        this.f21013s0.P.i(this, rect);
    }

    public final void a1() {
        this.f21019y0 = false;
        this.V0 = false;
        this.R0 = 1.0f;
        q1();
        NovaLauncher novaLauncher = this.f21013s0;
        int i5 = ((l2) ((ra.a) novaLauncher.M.f85765g)).n(l2.f79966e) ? 4 : 0;
        if (novaLauncher.f80004e0.f82474c == null) {
            int childCount = getChildCount();
            for (int i11 = 0; i11 < childCount; i11++) {
                CellLayout cellLayout = (CellLayout) H(i11);
                cellLayout.setImportantForAccessibility(2);
                cellLayout.P.setImportantForAccessibility(i5);
                cellLayout.setContentDescription(null);
                cellLayout.setAccessibilityDelegate(null);
            }
            setImportantForAccessibility(i5);
        }
        novaLauncher.T.B0((l2) ((ra.a) novaLauncher.M.f85765g), false);
    }

    @Override // android.view.View
    public final void announceForAccessibility(CharSequence charSequence) {
        if (this.f21013s0.t0(l2.o)) {
            return;
        }
        super.announceForAccessibility(charSequence);
    }

    @Override // o9.m0
    public final void b() {
    }

    @Override // o9.s2
    public final void b0(int i5) {
        super.b0(i5);
        if (this.f20997f1 && this.f20993c1 != -1) {
            int iB = B(1) - B(0);
            H(this.f20993c1).setTranslationX(this.f20993c1 > this.f20992b1 ? ((-getScrollX()) / B(this.f20993c1)) * iB : iB - (getScrollX() - B(this.f20993c1)));
            H(this.f20992b1).setTranslationX(getPaddingLeft() + (getScrollX() - B(this.f20992b1)));
        }
        if (getScaleX() == 1.0f) {
            int iG = this.f80118t.g(this);
            if ((iG > this.f80109i || iG < 0 || i5 < getWidth() / 2.0f) && !S()) {
                return;
            }
            y2.f51877a.getClass();
            u2 u2Var = y2.X;
            KProperty kProperty = y2.f51881b[43];
            u2Var.getClass();
            ((h3) u2Var.l()).d(this, i5);
        }
    }

    public final void b1(View view, e eVar, InstanceId instanceId) {
        NovaLauncher novaLauncher = this.f21013s0;
        com.google.android.gms.internal.consent_sdk.k0.x(novaLauncher, novaLauncher.getString(novaLauncher.Q0(view) ? 2132018001 : 2132019040), 0).show();
        this.Y0.a().a(eVar).b(ea.d.LAUNCHER_ITEM_DROP_FAILED_INSUFFICIENT_SPACE);
    }

    @Override // o9.s2
    public final boolean c0() {
        boolean z11 = this.f21019y0;
        NovaLauncher novaLauncher = this.f21013s0;
        boolean zC0 = (z11 || (!novaLauncher.t0(l2.n) && w1())) ? false : super.c0();
        Folder folderF0 = Folder.f0(novaLauncher);
        if (folderF0 != null) {
            folderF0.Y();
        }
        return zC0;
    }

    public final void c1(float f11) {
        int iCompare = Float.compare(f11, 1.0f);
        NovaLauncher novaLauncher = this.f21013s0;
        if (iCompare == 0) {
            if (!this.T0) {
                ea.e eVarA = novaLauncher.O().a();
                da.c cVarR = da.d.r();
                da.t tVarH = da.u.h();
                tVarH.e(0);
                cVarR.o(tVarH);
                eVarA.b(ea.d.LAUNCHER_SWIPELEFT);
            }
            this.T0 = true;
        } else if (Float.compare(f11, 0.0f) == 0) {
            if (this.T0) {
                ea.e eVarA2 = novaLauncher.O().a();
                da.c cVarR2 = da.d.r();
                da.t tVarH2 = da.u.h();
                tVarH2.e(-1);
                cVarR2.o(tVarH2);
                eVarA2.b(ea.d.LAUNCHER_SWIPERIGHT);
            } else if (Float.compare(this.W0, 0.0f) != 0 && ps.f.i(getContext())) {
                announceForAccessibility(C());
            }
            this.T0 = false;
            p1();
        }
        float fMin = Math.min(1.0f, Math.max(f11 - 0.0f, 0.0f) / 1.0f);
        float interpolation = 1.0f - s9.k.f86797j.getInterpolation(fMin);
        float measuredWidth = novaLauncher.P.getMeasuredWidth() * fMin;
        if (this.G) {
            measuredWidth = -measuredWidth;
        }
        this.W0 = measuredWidth;
        y2.f51877a.getClass();
        u2 u2Var = y2.f51880a2;
        KProperty kProperty = y2.f51881b[153];
        u2Var.getClass();
        if (u2Var.l() != e10.r0.f51779c) {
            novaLauncher.P.f98441h.f97110b[0].a(interpolation);
        } else {
            novaLauncher.P.setTranslationX(measuredWidth);
            novaLauncher.P.f98441h.f97110b[0].a(interpolation);
        }
    }

    @Override // o9.s2, android.view.View
    public final void computeScroll() {
        super.computeScroll();
        p0 p0Var = this.C0;
        Workspace workspace = p0Var.f97196a;
        o0 o0Var = p0Var.f97198c;
        if (workspace.getChildCount() != 0) {
            Workspace workspace2 = p0Var.f97196a;
            int childCount = workspace2.getChildCount();
            if (workspace2.S0()) {
                workspace2.X0();
                workspace2.X0();
                childCount = Math.max(1, childCount - 1);
            }
            workspace2.X0();
            int iMax = (int) Math.max(1.0d, Math.ceil(childCount / 1));
            int scrollX = workspace.getScrollX();
            int[] iArr = p0.f97195i;
            p0Var.b(scrollX, iMax, iArr);
            Message messageObtain = Message.obtain(o0Var, 2, iArr[0], iArr[1], p0Var.f97200e);
            int i5 = p0Var.f97203h;
            if (iMax != i5) {
                if (i5 > 0) {
                    messageObtain.what = 1;
                }
                p0Var.f97203h = iMax;
                if (!p0Var.f97201f) {
                    iMax = Math.max(3, iMax);
                }
                Message.obtain(o0Var, 4, iMax, 0, p0Var.f97200e).sendToTarget();
            }
            messageObtain.sendToTarget();
        }
        if (this.h1) {
            Message.obtain(o0Var, 5, p0Var.f97200e).sendToTarget();
            this.h1 = false;
        }
    }

    @Override // android.view.View
    public final AccessibilityNodeInfo createAccessibilityNodeInfo() {
        return getImportantForAccessibility() == 4 ? AccessibilityNodeInfo.obtain() : super.createAccessibilityNodeInfo();
    }

    @Override // o9.s2
    public final boolean d0() {
        boolean z11 = this.f21019y0;
        NovaLauncher novaLauncher = this.f21013s0;
        boolean zD0 = (z11 || (!novaLauncher.t0(l2.n) && w1())) ? false : super.d0();
        Folder folderF0 = Folder.f0(novaLauncher);
        if (folderF0 != null) {
            folderF0.Y();
        }
        return zD0;
    }

    public final void d1(int i5, boolean z11, Runnable runnable) {
        boolean z12 = this.f21013s0.Z;
        if (z12) {
            return;
        }
        if (i5 > 0) {
            postDelayed(new com.amplitude.android.internal.gestures.c(this, z11, runnable, 2), i5);
            return;
        }
        if (!z12) {
            X0();
            if (!S0()) {
                p pVar = this.f21001j0;
                if (pVar.f97194b >= 1) {
                    SparseArray sparseArray = new SparseArray();
                    int i11 = pVar.f97194b;
                    int i12 = i11 - 1;
                    while (true) {
                        s sVar = this.f21000i0;
                        if (i12 < i11) {
                            int iJ = pVar.j(i12);
                            CellLayout cellLayout = (CellLayout) sVar.get(iJ);
                            if (cellLayout == null || cellLayout.P.getChildCount() != 0 || cellLayout.f20902f0 != null || cellLayout.f20905i) {
                                break;
                            }
                            sparseArray.append(iJ, cellLayout);
                            i12++;
                        } else {
                            for (int i13 = 0; i13 < sparseArray.size(); i13++) {
                                int iKeyAt = sparseArray.keyAt(i13);
                                CellLayout cellLayout2 = (CellLayout) sparseArray.get(iKeyAt);
                                sVar.remove(iKeyAt);
                                pVar.o(iKeyAt);
                                int i14 = -202;
                                if (sVar.d(-202)) {
                                    i14 = -203;
                                }
                                sVar.put(i14, cellLayout2);
                                pVar.c(i14);
                            }
                        }
                    }
                }
            }
        }
        if (S0()) {
            J0(new a4(this, 2));
            g0(G());
            View view = this.E;
            if (view != null) {
                WorkspacePageIndicator workspacePageIndicator = (WorkspacePageIndicator) view;
                int scrollX = getScrollX();
                int childCount = getChildCount();
                workspacePageIndicator.g(scrollX, childCount > 0 ? N(T() ? 0 : childCount - 1) : 0);
            }
        }
        if (z11) {
            o1();
        }
        if (runnable != null) {
            runnable.run();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchRestoreInstanceState(SparseArray sparseArray) {
        this.O0 = sparseArray;
    }

    @Override // o9.s2, android.view.ViewGroup, android.view.View
    public final boolean dispatchUnhandledMove(View view, int i5) {
        if (w1() || !V0()) {
            return false;
        }
        return super.dispatchUnhandledMove(view, i5);
    }

    @Override // ra.d
    public final void e(ra.a aVar, sa.d dVar, m mVar) {
        l2 l2Var = (l2) aVar;
        l4 l4Var = new l4(this);
        this.X0.e(l2Var, mVar, dVar);
        if (l2Var.n(l2.f79965d)) {
            this.V0 = true;
        }
        invalidate();
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
        valueAnimatorOfFloat.addUpdateListener(l4Var);
        valueAnimatorOfFloat.addListener(l4Var);
        mVar.e(valueAnimatorOfFloat);
    }

    @Override // o9.s2
    public final void e0(View view, float f11) {
        NovaLauncher novaLauncher = this.f21013s0;
        novaLauncher.getClass();
        if (novaLauncher.t0(l2.o) || !(view instanceof CellLayout)) {
            return;
        }
        ((CellLayout) view).P.setAlpha(f11);
    }

    public final void e1() {
        for (CellLayout cellLayout : R0()) {
            if (cellLayout != null) {
                b3 b3Var = cellLayout.P;
                int childCount = b3Var.getChildCount();
                for (int i5 = 0; i5 < childCount; i5++) {
                    View childAt = b3Var.getChildAt(i5);
                    if (childAt instanceof FolderIcon) {
                        ((FolderIcon) childAt).h0();
                    }
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void f1(ya.v vVar) {
        AllAppsContainerView allAppsContainerView = this.f21013s0.V;
        ga.a[] aVarArr = allAppsContainerView != null ? allAppsContainerView.f21025g.f83863c : null;
        if (aVarArr == null) {
            aVarArr = ga.a.D;
        }
        for (ga.a aVar : aVarArr) {
            if (aVar instanceof iz.a) {
                iz.a aVar2 = (iz.a) aVar;
                List list = (List) aVar2.H.stream().filter(new fa.k0(vVar, 1)).collect(Collectors.toList());
                if (!list.isEmpty()) {
                    aVar2.Z0(list, false);
                }
            }
        }
        for (CellLayout cellLayout : R0()) {
            b3 b3Var = cellLayout.P;
            for (int childCount = b3Var.getChildCount() - 1; childCount >= 0; childCount--) {
                View childAt = b3Var.getChildAt(childCount);
                e eVar = (e) childAt.getTag();
                if (vVar.a(eVar)) {
                    cellLayout.removeViewInLayout(childAt);
                    if (childAt instanceof m0) {
                        this.f21014t0.s((m0) childAt);
                    }
                } else if (childAt instanceof FolderIcon) {
                    ga.c cVar = (ga.c) eVar;
                    List list2 = (List) cVar.H.stream().filter(new fa.k0(vVar, 1)).collect(Collectors.toList());
                    if (!list2.isEmpty()) {
                        cVar.Z0(list2, false);
                        Folder folder = ((FolderIcon) childAt).H;
                        if (folder.f79742a) {
                            folder.K(false);
                        }
                    }
                }
            }
        }
        o1();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void g1(View view, boolean z11) {
        CellLayout cellLayoutO0 = O0(view);
        if (cellLayoutO0 != null) {
            cellLayoutO0.removeView(view);
            if (z11) {
                cellLayoutO0.T();
            }
        }
        if (view instanceof m0) {
            this.f21014t0.s((m0) view);
        }
    }

    @Override // android.view.ViewGroup
    public final int getDescendantFocusability() {
        if (w1()) {
            return 393216;
        }
        return super.getDescendantFocusability();
    }

    @Override // o9.r0
    public final void h(Rect rect) {
        NovaLauncher novaLauncher = this.f21013s0;
        j0 j0Var = novaLauncher.f79934x;
        boolean zO = j0Var.o();
        int i5 = j0Var.f77173w;
        this.B0 = zO;
        Rect rect2 = j0Var.f77162q0;
        setPadding(rect2.left, rect2.top, rect2.right, rect2.bottom);
        this.F.set(rect);
        if (this.B0) {
            this.f80112l = i5;
            requestLayout();
        } else {
            this.f80112l = Math.max(Math.max(rect.left, rect.right), Math.max(i5, rect2.left + 1));
            requestLayout();
        }
        t1();
        p pVar = this.f21001j0;
        int i11 = pVar.f97194b;
        for (int i12 = 0; i12 < i11; i12++) {
            b3 b3Var = ((CellLayout) this.f21000i0.get(pVar.j(i12))).P;
            int childCount = b3Var.getChildCount();
            for (int i13 = 0; i13 < childCount; i13++) {
                View childAt = b3Var.getChildAt(i13);
                if ((childAt instanceof ab.o) && (childAt.getTag() instanceof g)) {
                    g gVar = (g) childAt.getTag();
                    gb.a.f((ab.o) childAt, novaLauncher, gVar.f57295g, gVar.f57296h);
                }
            }
        }
    }

    public final void h1(int i5) {
        if (this.O0 != null) {
            this.P0.c(i5);
            CellLayout cellLayout = (CellLayout) getChildAt(i5);
            if (cellLayout != null) {
                try {
                    cellLayout.dispatchRestoreInstanceState(this.O0);
                } catch (IllegalArgumentException e3) {
                    Log.e("CellLayout", "Ignoring an error while restoring a view instance state", e3);
                }
            }
        }
    }

    @Override // o9.k0
    public final void i(View view, l0 l0Var, boolean z11) {
        u uVar;
        o9.s sVar;
        if (l0Var.f79955g.f57290b == 9999) {
            for (int i5 = 0; i5 < getChildCount(); i5++) {
                H(i5).setVisibility(0);
            }
            this.f21005l0 = null;
            return;
        }
        if (!z11) {
            o9.s sVar2 = this.f21005l0;
            if (sVar2 != null) {
                if ((sVar2.f80092a instanceof ab.o) && (uVar = l0Var.f79954f) != null) {
                    uVar.c(true);
                }
                o9.s sVar3 = this.f21005l0;
                CellLayout cellLayoutI0 = this.f21013s0.I0(sVar3.f80094c, sVar3.f80093b);
                if (cellLayoutI0 != null) {
                    cellLayoutI0.K(this.f21005l0.f80092a);
                }
            }
        } else if (view != this && (sVar = this.f21005l0) != null) {
            g1(sVar.f80092a, true);
        }
        View viewL0 = L0(new e30.c(l0Var.f79956h.f57289a, 3));
        if (l0Var.f79958j && viewL0 != null) {
            viewL0.setVisibility(0);
        }
        this.f21005l0 = null;
    }

    public final void i1(CellLayout cellLayout) {
        if (this.f20995e1) {
            return;
        }
        CellLayout cellLayout2 = this.f21011q0;
        if (cellLayout2 != null) {
            cellLayout2.Q(false);
        }
        this.f21011q0 = cellLayout;
        if (cellLayout != null) {
            cellLayout.Q(true);
        }
        Hotseat hotseat = this.f21013s0.T;
        hotseat.W = (cellLayout == null || hotseat.indexOfChild(cellLayout) == -1) ? null : cellLayout;
        if (cellLayout == null || indexOfChild(cellLayout) == -1) {
            cellLayout = null;
        }
        this.W = cellLayout;
    }

    @Override // ra.d
    public final void j(Object obj) {
        this.f21019y0 = true;
        this.R0 = 0.0f;
        q1();
        NovaLauncher novaLauncher = this.f21013s0;
        novaLauncher.T.B0((l2) ((ra.a) novaLauncher.M.f85765g), true);
        n4 n4Var = this.X0;
        n4Var.getClass();
        n4Var.e((l2) obj, s9.o.f86814a, new sa.d());
        a1();
    }

    @Override // o9.s2
    public final boolean j0(int i5) {
        return Float.compare(Math.abs(this.W0), 0.0f) == 0 && super.j0(i5);
    }

    public final void j1(CellLayout cellLayout) {
        CellLayout cellLayout2 = this.f21010p0;
        if (cellLayout2 != null) {
            cellLayout2.O();
            this.f21010p0.J();
        }
        this.f21010p0 = cellLayout;
        if (cellLayout != null) {
            cellLayout.I();
        }
        D0(true);
        y yVar = this.F0;
        if (yVar != null) {
            yVar.a(1.0f, new v(yVar, yVar.f96987p, yVar.f80127a, yVar.f80128b, 1), new d4(yVar, 18));
        }
        if (-1 == this.f21008n0 && -1 == this.f21009o0) {
            return;
        }
        this.f21008n0 = -1;
        this.f21009o0 = -1;
        k1(0);
    }

    @Override // o9.s2
    public final void k0() {
        f0 f0Var = this.S0;
        if (f0Var == null || f0Var.isFinished()) {
            super.k0();
        } else {
            n0(0, true);
        }
    }

    public final void k1(int i5) {
        if (i5 != this.L0) {
            if (i5 == 0) {
                C0();
                D0(false);
                y yVar = this.F0;
                if (yVar != null) {
                    yVar.a(1.0f, new v(yVar, yVar.f96987p, yVar.f80127a, yVar.f80128b, 1), new d4(yVar, 18));
                }
            } else if (i5 == 2) {
                D0(true);
                y yVar2 = this.F0;
                if (yVar2 != null) {
                    yVar2.a(1.0f, new v(yVar2, yVar2.f96987p, yVar2.f80127a, yVar2.f80128b, 1), new d4(yVar2, 18));
                }
            } else if (i5 == 1) {
                C0();
                D0(true);
            } else if (i5 == 3) {
                C0();
                y yVar3 = this.F0;
                if (yVar3 != null) {
                    yVar3.a(1.0f, new v(yVar3, yVar3.f96987p, yVar3.f80127a, yVar3.f80128b, 1), new d4(yVar3, 18));
                }
            }
            this.L0 = i5;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0032  */
    @Override // o9.s2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean l() {
        /*
            r3 = this;
            boolean r0 = super.l()
            r1 = 1
            if (r0 != 0) goto L41
            int r0 = r3.getChildCount()
            if (r0 < r1) goto L3f
            ya.f0 r0 = r3.S0
            if (r0 == 0) goto L32
            e10.y2 r0 = e10.y2.f51877a
            r0.getClass()
            e10.s2 r0 = e10.y2.Y0()
            java.lang.Object r0 = r0.l()
            java.lang.Boolean r0 = (java.lang.Boolean) r0
            boolean r0 = r0.booleanValue()
            if (r0 != 0) goto L41
            e10.s2 r0 = e10.y2.e0()
            java.lang.Object r0 = r0.l()
            e10.f0 r2 = e10.f0.f51516b
            if (r0 != r2) goto L41
        L32:
            ya.i r0 = r3.J
            boolean r0 = r0 instanceof cz.i
            if (r0 != 0) goto L41
            ya.i r0 = r3.K
            boolean r0 = r0 instanceof cz.i
            if (r0 == 0) goto L3f
            goto L41
        L3f:
            r0 = 0
            return r0
        L41:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.launcher3.Workspace.l():boolean");
    }

    @Override // o9.s2
    public final boolean l0(int i5) {
        boolean z11 = this.f20997f1;
        if (!z11) {
            return n0(i5, false);
        }
        if (!z11) {
            return true;
        }
        boolean zN0 = n0(i5, false);
        if (zN0) {
            int i11 = this.f80106f;
            this.f20992b1 = i11;
            this.f20993c1 = i5;
            ba.a aVar = new ba.a(this, i5, i11, 1);
            if (!this.B) {
                aVar.run();
                return zN0;
            }
            this.C = aVar;
        }
        return zN0;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0073  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean l1(o9.l0 r12, float r13, float r14) {
        /*
            Method dump skipped, instructions count: 325
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.launcher3.Workspace.l1(o9.l0, float, float):boolean");
    }

    @Override // o9.s2
    public final boolean m() {
        return Float.compare(this.W0, 0.0f) == 0;
    }

    public final void m1() {
        if (this.f21019y0) {
            this.Q0 = getScaleX();
            n4 n4Var = this.X0;
            setScaleX(n4Var.f80035a);
            setScaleY(n4Var.f80035a);
        }
    }

    public final void n1(CellLayout cellLayout) {
        g gVar = new g();
        gVar.f57310r = -100;
        x7.c cVar = bb.b.f17790h;
        NovaLauncher novaLauncher = this.f21013s0;
        gVar.f57311s = ((AppWidgetProviderInfo) ((bb.b) cVar.h(novaLauncher)).a(-100)).provider;
        n30.b bVar = n30.b.f77778b;
        gVar.f57295g = fg.a.l(0.0f);
        gVar.f57296h = fg.a.l(0.0f);
        float f11 = 0.0f * 2;
        novaLauncher.f80002c0.a(gVar, -100, M0(cellLayout), new a(MathKt.b(f11)), new a(MathKt.b(f11)));
        cellLayout.f20902f0 = gVar;
    }

    @Override // x9.c
    public final void o() {
        q1();
        t0(false);
        ra.f fVar = this.f21013s0.M;
        if (((ra.a) fVar.f85765g) != l2.f79974m) {
            fVar.b(new f4(this, fVar));
        } else if (!this.f21003k0) {
            d1(0, true, null);
        }
        this.f21005l0 = null;
        this.f20999h0 = null;
        if (this.f20997f1) {
            x0();
        }
        this.f20997f1 = false;
        this.f20995e1 = false;
    }

    public final void o1() {
        p pVar;
        NovaLauncher novaLauncher = this.f21013s0;
        if (novaLauncher.Z) {
            return;
        }
        if (this.B) {
            this.A0 = true;
            return;
        }
        int iG = G();
        p pVar2 = new p();
        s sVar = this.f21000i0;
        int size = sVar.size();
        for (int i5 = 0; i5 < size; i5++) {
            int iKeyAt = sVar.keyAt(i5);
            CellLayout cellLayout = (CellLayout) sVar.valueAt(i5);
            if (cellLayout.P.getChildCount() == 0 && cellLayout.f20902f0 == null) {
                pVar2.c(iKeyAt);
            }
        }
        X0();
        X0();
        int i11 = 0;
        int i12 = 0;
        while (true) {
            int i13 = pVar2.f97194b;
            pVar = this.f21001j0;
            if (i11 >= i13) {
                break;
            }
            int iJ = pVar2.j(i11);
            CellLayout cellLayout2 = (CellLayout) sVar.get(iJ);
            sVar.remove(iJ);
            pVar.o(iJ);
            if (getChildCount() > 1) {
                if (indexOfChild(cellLayout2) < iG) {
                    i12++;
                }
                removeView(cellLayout2);
            } else {
                ((CrosshairsCellLayout) cellLayout2).f46496l0 = null;
                X0();
                sVar.put(-202, cellLayout2);
                pVar.c(-202);
            }
            i11++;
        }
        if (i12 >= 0) {
            g0(iG - i12);
        }
        if (this.f20994d1) {
            this.f20994d1 = false;
            sVar.clear();
            pVar.f97194b = 0;
            for (int i14 = 0; i14 < getChildCount(); i14++) {
                CellLayout cellLayout3 = (CellLayout) getChildAt(i14);
                sVar.put(i14, cellLayout3);
                pVar.d(i14, i14);
                e eVar = cellLayout3.f20902f0;
                if (eVar != null && eVar.f57292d != i14) {
                    eVar.f57292d = i14;
                    fa.p0 p0Var = novaLauncher.f80002c0;
                    p0Var.getClass();
                    p0Var.k(eVar, eVar.f57291c, eVar.f57292d, eVar.f57293e, eVar.f57294f);
                }
            }
            Y0(new k30.e(this, 13));
        }
        y2.f51877a.x().i(Integer.valueOf(getChildCount()));
        r0();
    }

    @Override // o9.s2, android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.C0.a(getWindowToken());
        computeScroll();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.C0.a(null);
        Context context = getContext();
        i0 i0Var = this.f21004k1;
        if (i0Var.f93725b) {
            context.unregisterReceiver(i0Var);
            i0Var.f93725b = false;
        }
    }

    @Override // o9.s2, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int i14;
        if (this.D0) {
            this.C0.f97202g = false;
            this.D0 = false;
        }
        if (this.f80105e && (i14 = this.f80106f) >= 0 && i14 < getChildCount()) {
            this.h1 = true;
        }
        super.onLayout(z11, i5, i11, i12, i13);
        r1();
    }

    @Override // o9.s2, android.view.View
    public final void onScrollChanged(int i5, int i11, int i12, int i13) {
        View view;
        super.onScrollChanged(i5, i11, i12, i13);
        if ((!this.f21019y0 || ((ra.a) this.f21013s0.M.f85767i) == l2.f79975p) && ((getLayoutTransition() == null || !getLayoutTransition().isRunning()) && (view = this.E) != null)) {
            WorkspacePageIndicator workspacePageIndicator = (WorkspacePageIndicator) view;
            int scrollX = getScrollX();
            int childCount = getChildCount();
            if (childCount > 0) {
                iN = N(T() ? 0 : childCount - 1);
            }
            workspacePageIndicator.g(scrollX, iN);
        }
        r1();
        s1();
        G0();
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        if (((l2) ((ra.a) this.f21013s0.M.f85765g)).n(l2.f79967f)) {
            return (w1() || D(indexOfChild(view)) == this.f80106f) ? false : true;
        }
        return true;
    }

    @Override // o9.s2, android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        NovaLauncher novaLauncher = this.f21013s0;
        ra.a aVar = (ra.a) novaLauncher.M.f85765g;
        ry.e eVar = l2.f79978s;
        a0 a0Var = this.g1;
        if (aVar == eVar) {
            if (motionEvent.getAction() == 0) {
                this.f21006l1 = true;
                if (!S0() || this.f80106f != getChildCount() - 1) {
                    a0Var.c();
                }
            }
            float fAbs = Math.abs(this.J0 - motionEvent.getX());
            float f11 = this.f80121w;
            if (fAbs > f11 || Math.abs(this.K0 - motionEvent.getY()) > f11) {
                this.f21006l1 = false;
                a0Var.a();
            }
            if (this.f21006l1 && motionEvent.getAction() == 1) {
                a0Var.a();
                CellLayout cellLayout = (CellLayout) H(this.f80106f);
                if (cellLayout != null && this.J0 > cellLayout.getLeft() - getScrollX() && this.J0 < cellLayout.getRight() - getScrollX() && this.K0 > cellLayout.getTop() - getScrollY() && this.K0 < cellLayout.getBottom() - getScrollY()) {
                    if (S0() && this.f80106f == getChildCount() - 1) {
                        E0();
                        n1(cellLayout);
                    }
                    o9.a.M(novaLauncher, true, 7471103);
                    novaLauncher.m();
                }
                this.f21006l1 = false;
            }
        } else {
            a0Var.a();
            this.f21006l1 = false;
        }
        return super.onTouchEvent(motionEvent);
    }

    @Override // o9.s2, android.view.ViewGroup
    public final void onViewAdded(View view) {
        if (!(view instanceof CellLayout)) {
            throw new IllegalArgumentException("A Workspace can only have CellLayout children.");
        }
        CellLayout cellLayout = (CellLayout) view;
        cellLayout.o = this;
        cellLayout.setImportantForAccessibility(2);
        super.onViewAdded(view);
    }

    @Override // o9.s2
    public final void p(MotionEvent motionEvent) {
        if (V0()) {
            float fAbs = Math.abs(motionEvent.getX() - this.J0);
            float fAbs2 = Math.abs(motionEvent.getY() - this.K0);
            if (Float.compare(fAbs, 0.0f) == 0) {
                return;
            }
            float fAtan = (float) Math.atan(fAbs2 / fAbs);
            float f11 = this.f80121w;
            if (fAbs > f11 || fAbs2 > f11) {
                s(new b.l2(10));
            }
            if (fAtan > 1.0471976f) {
                return;
            }
            if (fAtan > 0.5235988f) {
                q(motionEvent, (((float) Math.sqrt((fAtan - 0.5235988f) / 0.5235988f)) * 4.0f) + 1.0f);
            } else {
                super.p(motionEvent);
            }
        }
    }

    public final boolean p1() {
        if (this.U0 == null) {
            return true;
        }
        if (this.T0 || !hasWindowFocus()) {
            return false;
        }
        this.U0.run();
        this.U0 = null;
        return true;
    }

    @Override // o9.s2
    public final void q0(MotionEvent motionEvent) {
        super.q0(motionEvent);
        this.J0 = motionEvent.getX();
        this.K0 = motionEvent.getY();
    }

    public final void q1() {
        boolean z11 = this.f21019y0 || this.B;
        if (z11 != this.f21020z0) {
            this.f21020z0 = z11;
            if (z11) {
                G0();
                return;
            }
            for (int i5 = 0; i5 < getChildCount(); i5++) {
                ((CellLayout) getChildAt(i5)).s(false);
            }
        }
    }

    public final void r1() {
        if (w1() || this.f21019y0 || this.f21014t0.o()) {
            return;
        }
        int measuredWidth = (getMeasuredWidth() / 2) + getScrollX();
        for (int i5 = 0; i5 < getChildCount(); i5++) {
            CellLayout cellLayout = (CellLayout) getChildAt(i5);
            if (cellLayout != null) {
                b3 b3Var = cellLayout.P;
                float fAbs = 1.0f - Math.abs(O(cellLayout, measuredWidth, i5, true));
                if (this.B0) {
                    b3Var.setAlpha(fAbs);
                } else {
                    b3Var.setImportantForAccessibility(fAbs > 0.0f ? 0 : 4);
                }
            }
        }
    }

    public final void s1() {
        int measuredWidth = (getMeasuredWidth() / 2) + getScrollX();
        for (int i5 = 0; i5 < getChildCount(); i5++) {
            CellLayout cellLayout = (CellLayout) getChildAt(i5);
            if (cellLayout != null) {
                float fO = O(cellLayout, measuredWidth, i5, true);
                if (Float.compare(Math.abs(fO), cellLayout.K) != 0) {
                    cellLayout.K = Math.abs(fO);
                    cellLayout.f20912r.setAlpha((int) (cellLayout.J * 255.0f));
                }
            }
        }
    }

    public final void t1() {
        j0 j0Var = this.f21013s0.f79934x;
        int i5 = j0Var.f77169u;
        int i11 = j0Var.f77171v;
        X0();
        p pVar = this.f21001j0;
        int i12 = pVar.f97194b;
        for (int i13 = 0; i13 < i12; i13++) {
            ((CellLayout) this.f21000i0.get(pVar.j(i13))).setPadding(i5, 0, i5, i11);
        }
    }

    @Override // o9.m0
    public final void u(l0 l0Var) {
        this.H0 = false;
        this.I0 = false;
        this.f21012r0 = null;
        float[] fArrA = l0Var.a(this.f21017w0);
        this.f21017w0 = fArrA;
        l1(l0Var, fArrA[0], fArrA[1]);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:107:0x024b  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x034e  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x039d  */
    /* JADX WARN: Removed duplicated region for block: B:222:0x0552  */
    /* JADX WARN: Removed duplicated region for block: B:235:0x05bf  */
    /* JADX WARN: Removed duplicated region for block: B:238:0x05de A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:241:0x05e3  */
    /* JADX WARN: Removed duplicated region for block: B:243:0x05e6  */
    /* JADX WARN: Removed duplicated region for block: B:244:0x05ed  */
    /* JADX WARN: Removed duplicated region for block: B:249:0x05fd  */
    /* JADX WARN: Removed duplicated region for block: B:254:0x0610  */
    /* JADX WARN: Removed duplicated region for block: B:280:0x067c  */
    /* JADX WARN: Removed duplicated region for block: B:281:0x0686  */
    /* JADX WARN: Removed duplicated region for block: B:286:0x06c4  */
    /* JADX WARN: Removed duplicated region for block: B:291:0x0729  */
    /* JADX WARN: Removed duplicated region for block: B:294:0x075d  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0153  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x018c  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x019b  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x01b4  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x01ee  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x01fd  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x021a  */
    /* JADX WARN: Type inference failed for: r12v6, types: [ra.f] */
    /* JADX WARN: Type inference failed for: r15v4, types: [ra.f] */
    /* JADX WARN: Type inference failed for: r17v4 */
    /* JADX WARN: Type inference failed for: r17v5, types: [android.animation.Animator$AnimatorListener] */
    /* JADX WARN: Type inference failed for: r17v6 */
    /* JADX WARN: Type inference failed for: r20v0 */
    /* JADX WARN: Type inference failed for: r20v1, types: [android.animation.Animator$AnimatorListener] */
    /* JADX WARN: Type inference failed for: r20v2 */
    /* JADX WARN: Type inference failed for: r40v0, types: [android.view.View, com.android.launcher3.Workspace, java.lang.Object, o9.m4, o9.s2] */
    @Override // o9.m0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void v(o9.l0 r41, x9.i r42) throws android.content.res.Resources.NotFoundException {
        /*
            Method dump skipped, instructions count: 1935
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.launcher3.Workspace.v(o9.l0, x9.i):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean v1(android.view.View r5, ga.e r6, boolean r7) {
        /*
            r4 = this;
            r0 = 0
            if (r5 == 0) goto L1a
            android.view.ViewGroup$LayoutParams r1 = r5.getLayoutParams()
            o9.v r1 = (o9.v) r1
            boolean r2 = r1.f80181e
            if (r2 == 0) goto L1a
            int r2 = r1.f80179c
            int r3 = r1.f80177a
            if (r2 != r3) goto L5a
            int r2 = r1.f80180d
            int r1 = r1.f80178b
            if (r2 == r1) goto L1a
            goto L5a
        L1a:
            o9.s r1 = r4.f21005l0
            r2 = 1
            if (r1 == 0) goto L25
            android.view.View r1 = r1.f80092a
            if (r5 != r1) goto L25
            r1 = r2
            goto L26
        L25:
            r1 = r0
        L26:
            if (r5 == 0) goto L5a
            if (r1 != 0) goto L5a
            if (r7 == 0) goto L31
            boolean r7 = r4.H0
            if (r7 != 0) goto L31
            goto L5a
        L31:
            java.lang.Object r7 = r5.getTag()
            boolean r7 = r7 instanceof ga.j
            if (r7 == 0) goto L47
            java.lang.Object r5 = r5.getTag()
            ga.j r5 = (ga.j) r5
            int r5 = r5.f57291c
            r7 = -103(0xffffffffffffff99, float:NaN)
            if (r5 == r7) goto L47
            r5 = r2
            goto L48
        L47:
            r5 = r0
        L48:
            int r6 = r6.f57290b
            if (r6 == 0) goto L54
            if (r6 == r2) goto L54
            r7 = 6
            if (r6 != r7) goto L52
            goto L54
        L52:
            r6 = r0
            goto L55
        L54:
            r6 = r2
        L55:
            if (r5 == 0) goto L5a
            if (r6 == 0) goto L5a
            return r2
        L5a:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.launcher3.Workspace.v1(android.view.View, ga.e, boolean):boolean");
    }

    @Override // o9.m0
    public final boolean w() {
        return true;
    }

    public final boolean w1() {
        return !this.f21013s0.t0(l2.f79974m);
    }

    @Override // o9.m0
    public final void x(l0 l0Var) {
        this.f21012r0 = this.f21010p0;
        int i5 = this.L0;
        if (i5 == 1) {
            this.H0 = true;
        } else if (i5 == 2) {
            this.I0 = true;
        }
        j1(null);
        i1(null);
        ((b) this.f21018x0.f95137b).f79770e = false;
    }

    public final void x0() {
        J0(new a4(this, 1));
    }

    /* JADX WARN: Code restructure failed: missing block: B:38:0x00c4, code lost:
    
        if ((r1 > r5.y(r6) ? false : u1(r5.B(r6[0], r6[1]), r2)) != false) goto L31;
     */
    @Override // o9.m0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean y(o9.l0 r22) {
        /*
            Method dump skipped, instructions count: 338
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.launcher3.Workspace.y(o9.l0):boolean");
    }

    public final boolean y0(CellLayout cellLayout, a[] aVarArr, float f11, l0 l0Var, boolean z11) {
        int i5;
        if (f11 <= cellLayout.y(aVarArr)) {
            View viewB = cellLayout.B(aVarArr[0], aVarArr[1]);
            if (this.I0) {
                this.I0 = false;
                if (viewB instanceof FolderIcon) {
                    FolderIcon folderIcon = (FolderIcon) viewB;
                    e eVar = l0Var.f79955g;
                    Folder folder = folderIcon.H;
                    if (!folder.J && (((i5 = eVar.f57290b) == 0 || i5 == 1 || i5 == 6) && eVar != folderIcon.I && !folder.f79742a)) {
                        this.Y0.a().a(folderIcon.I).b(ea.d.LAUNCHER_ITEM_DROP_COMPLETED_ON_FOLDER_ICON);
                        folderIcon.f0(l0Var, false);
                        if (!z11) {
                            O0(this.f21005l0.f80092a).removeView(this.f21005l0.f80092a);
                        }
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override // o9.m0
    public final void z(l0 l0Var) {
        e eVar;
        CellLayout cellLayout;
        a aVar;
        n30.b bVar;
        e eVar2;
        int i5;
        char c11;
        char c12;
        int i11;
        int i12;
        int i13;
        Workspace workspace;
        int i14;
        CellLayout cellLayout2;
        boolean z11 = this.f21019y0;
        NovaLauncher novaLauncher = this.f21013s0;
        if ((((!z11 || this.R0 > 0.25f) && ((l2) ((ra.a) novaLauncher.M.f85765g)).n(l2.f79967f)) || this.f20997f1) && (eVar = l0Var.f79955g) != null) {
            if (eVar.f57295g.a() < 0.0f || eVar.f57296h.a() < 0.0f) {
                throw new RuntimeException("Improper spans found");
            }
            float[] fArrA = l0Var.a(this.f21017w0);
            this.f21017w0 = fArrA;
            o9.s sVar = this.f21005l0;
            View view = sVar == null ? null : sVar.f80092a;
            if (l1(l0Var, fArrA[0], fArrA[1])) {
                if (novaLauncher.Q0(this.f21010p0)) {
                    h hVar = this.f21018x0;
                    Hotseat hotseat = novaLauncher.T;
                    CellLayout cellLayout3 = this.f21010p0;
                    b bVar2 = (b) hVar.f95137b;
                    bVar2.f79770e = false;
                    bVar2.a(cellLayout3 == null ? 950L : 500L);
                    hVar.f95138c = hotseat;
                    hVar.f95139d = cellLayout3;
                } else {
                    h hVar2 = this.f21018x0;
                    CellLayout cellLayout4 = this.f21010p0;
                    b bVar3 = (b) hVar2.f95137b;
                    bVar3.f79770e = false;
                    bVar3.a(cellLayout4 == null ? 950L : 500L);
                    hVar2.f95138c = this;
                    hVar2.f95139d = cellLayout4;
                }
            }
            if (this.f20997f1 || (cellLayout = this.f21010p0) == null) {
                return;
            }
            Z0(cellLayout, this.f21017w0);
            n30.b bVar4 = eVar.f57295g;
            n30.b bVar5 = eVar.f57296h;
            if (eVar.f57297i.a() > 0.0f && eVar.f57298j.a() > 0.0f) {
                bVar4 = eVar.f57297i;
                bVar5 = eVar.f57298j;
            }
            n30.b bVar6 = bVar4;
            n30.b bVar7 = bVar5;
            float[] fArr = this.f21017w0;
            a[] aVarArrI0 = I0((int) fArr[0], (int) fArr[1], bVar6, bVar7, this.f21010p0, this.f21007m0);
            this.f21007m0 = aVarArrI0;
            a aVar2 = aVarArrI0[0];
            a aVar3 = aVarArrI0[1];
            int iC = aVar2.c(this.f21010p0);
            int iC2 = this.f21007m0[1].c(this.f21010p0);
            if (iC != this.f21008n0 || iC2 != this.f21009o0) {
                this.f21008n0 = iC;
                this.f21009o0 = iC2;
                k1(0);
            }
            CellLayout cellLayout5 = this.f21010p0;
            float[] fArr2 = this.f21017w0;
            float f11 = fArr2[0];
            float f12 = fArr2[1];
            a[] aVarArr = this.f21007m0;
            cellLayout5.getClass();
            cellLayout5.E(aVarArr[0].c(cellLayout5), aVarArr[1].c(cellLayout5), cellLayout5.f20906j);
            float fHypot = (float) Math.hypot(f11 - r10[0], f12 - r10[1]);
            if (fHypot > this.f21010p0.y(this.f21007m0)) {
                int i15 = this.L0;
                if (i15 == 2 || i15 == 1) {
                    k1(0);
                }
                aVar = aVar2;
                bVar = bVar6;
                eVar2 = eVar;
                i5 = 2;
                c11 = 0;
                c12 = 1;
            } else {
                CellLayout cellLayout6 = this.f21010p0;
                a[] aVarArr2 = this.f21007m0;
                View viewB = cellLayout6.B(aVarArr2[0], aVarArr2[1]);
                e eVar3 = l0Var.f79955g;
                boolean zV1 = v1(viewB, eVar3, false);
                if (this.L0 == 0 && zV1) {
                    y yVar = new y();
                    this.F0 = yVar;
                    int measuredWidth = viewB.getMeasuredWidth();
                    int paddingTop = viewB.getPaddingTop();
                    j0 j0VarP = novaLauncher.P();
                    aVar = aVar2;
                    bVar = bVar6;
                    eVar2 = eVar;
                    c11 = 0;
                    yVar.k(novaLauncher, novaLauncher, null, measuredWidth, paddingTop, j0VarP.M, j0VarP.N);
                    y yVar2 = this.F0;
                    yVar2.f96988q = false;
                    CellLayout cellLayout7 = this.f21010p0;
                    yVar2.a(1.2f, new v(yVar2, cellLayout7, this.f21007m0[0].c(cellLayout7), this.f21007m0[1].c(this.f21010p0), 0), null);
                    CellLayout cellLayout8 = this.f21010p0;
                    i5 = 2;
                    cellLayout8.f20918x[cellLayout8.f20919y].a(2);
                    int[] iArr = cellLayout8.L;
                    iArr[1] = -1;
                    iArr[0] = -1;
                    k1(1);
                    g0 g0Var = l0Var.f79960l;
                    if (g0Var != null) {
                        g0Var.a(p9.g.x(getContext(), viewB));
                    }
                } else {
                    aVar = aVar2;
                    bVar = bVar6;
                    eVar2 = eVar;
                    i5 = 2;
                    c11 = 0;
                    boolean zU1 = u1(viewB, eVar3);
                    if (zU1 && this.L0 == 0) {
                        FolderIcon folderIcon = (FolderIcon) viewB;
                        this.G0 = folderIcon;
                        Folder folder = folderIcon.H;
                        if (!folder.J && (((i11 = eVar3.f57290b) == 0 || i11 == 1 || i11 == 6) && eVar3 != folderIcon.I && !folder.f79742a)) {
                            o9.v vVar = (o9.v) folderIcon.getLayoutParams();
                            CellLayout cellLayout9 = (CellLayout) folderIcon.getParent().getParent();
                            y yVar3 = folderIcon.K;
                            int i16 = vVar.f80177a;
                            int i17 = vVar.f80178b;
                            yVar3.getClass();
                            yVar3.a(1.2f, new v(yVar3, cellLayout9, i16, i17, 0), null);
                            b bVar8 = folderIcon.R;
                            bVar8.f79769d = folderIcon.f21130c0;
                            if ((eVar3 instanceof ga.a) || (eVar3 instanceof ga.j) || (eVar3 instanceof ab.r)) {
                                bVar8.a(800L);
                            }
                        }
                        CellLayout cellLayout10 = this.f21010p0;
                        if (cellLayout10 != null) {
                            cellLayout10.f20918x[cellLayout10.f20919y].a(2);
                            int[] iArr2 = cellLayout10.L;
                            iArr2[1] = -1;
                            iArr2[0] = -1;
                        }
                        k1(2);
                        g0 g0Var2 = l0Var.f79960l;
                        if (g0Var2 != null) {
                            g0Var2.a(p9.g.x(getContext(), viewB));
                        }
                    } else {
                        if (this.L0 == 2 && !zU1) {
                            k1(0);
                        }
                        c12 = 1;
                        if (this.L0 == 1 && !zV1) {
                            k1(0);
                        }
                    }
                }
                c12 = 1;
            }
            CellLayout cellLayout11 = this.f21010p0;
            float[] fArr3 = this.f21017w0;
            int i18 = (int) fArr3[c11];
            int i19 = (int) fArr3[c12];
            e eVar4 = eVar2;
            n30.b bVar9 = eVar4.f57295g;
            n30.b bVar10 = eVar4.f57296h;
            a[] aVarArr3 = this.f21007m0;
            int[] iArr3 = cellLayout11.f20896c0;
            ArrayList arrayList = cellLayout11.S;
            int iC3 = bVar9.c(cellLayout11);
            int iC4 = bVar10.c(cellLayout11);
            int[] iArrV = cellLayout11.v(i18, i19, iC3, iC4, iC3, iC4, false, iArr3, null);
            cellLayout11.D(iArrV[c11], iArrV[1], iC3, iC4, view, null, arrayList);
            boolean zIsEmpty = arrayList.isEmpty();
            if (aVarArr3 != null) {
                aVarArr3[c11] = a.b(cellLayout11, iArr3[c11]);
                aVarArr3[1] = a.b(cellLayout11, iArr3[1]);
            }
            if (!zIsEmpty) {
                char c13 = c11;
                i12 = 1;
                int i21 = this.L0;
                if (i21 == 0 || i21 == 3) {
                    b bVar11 = this.E0;
                    if (!bVar11.f79770e && ((!this.M0.equals(aVar) || !this.N0.equals(aVar3)) && fHypot < this.f21010p0.A(this.f21007m0))) {
                        CellLayout cellLayout12 = this.f21010p0;
                        float[] fArr4 = this.f21017w0;
                        View view2 = view;
                        n30.b bVar12 = bVar;
                        cellLayout12.L((int) fArr4[c13], (int) fArr4[1], bVar12, bVar7, eVar4.f57295g, eVar4.f57296h, view2, this.f21007m0, new n30.b[i5], 0);
                        i13 = 1;
                        workspace = this;
                        bVar11.f79769d = new d1(this, bVar12, bVar7, eVar4.f57295g, eVar4.f57296h, l0Var, view2);
                        bVar11.a((workspace.f21010p0.f20900e0 ? i5 : 1) * 650);
                    }
                }
                i14 = workspace.L0;
                if ((i14 != i13 || i14 == i5 || zIsEmpty) && (cellLayout2 = workspace.f21010p0) != null) {
                    cellLayout2.O();
                }
                return;
            }
            char c14 = c11;
            CellLayout cellLayout13 = this.f21010p0;
            a[] aVarArr4 = this.f21007m0;
            a aVar4 = aVarArr4[c14];
            a aVar5 = aVarArr4[1];
            n30.b bVar13 = eVar4.f57295g;
            n30.b bVar14 = eVar4.f57296h;
            cellLayout13.getClass();
            i12 = 1;
            cellLayout13.U(aVar4.c(cellLayout13), aVar5.c(cellLayout13), bVar13.c(cellLayout13), bVar14.c(cellLayout13), l0Var);
            workspace = this;
            i13 = i12;
            i14 = workspace.L0;
            if (i14 != i13) {
            }
            cellLayout2.O();
        }
    }

    public final void z0(e eVar, CellLayout cellLayout, x9.n nVar, Runnable runnable, int i5, View view, boolean z11) {
        int i11;
        Bitmap bitmapCreateBitmap;
        int i12;
        int[] iArr = new int[2];
        float[] fArr = new float[2];
        boolean z12 = eVar instanceof ab.r;
        a[] aVarArr = this.f21007m0;
        n30.b bVar = eVar.f57295g;
        n30.b bVar2 = eVar.f57296h;
        a aVar = aVarArr[0];
        a aVar2 = aVarArr[1];
        Rect rect = new Rect();
        cellLayout.j(aVar.c(cellLayout), aVar2.c(cellLayout), bVar.c(cellLayout), bVar2.c(cellLayout), rect);
        int i13 = eVar.f57290b;
        NovaLauncher novaLauncher = this.f21013s0;
        if (i13 == 4) {
            PointF pointF = novaLauncher.f79934x.f77154l0;
            g3.v(pointF.x, pointF.y, rect);
        }
        float f11 = rect.left;
        float[] fArr2 = this.f21016v0;
        fArr2[0] = f11;
        fArr2[1] = rect.top;
        m1();
        DragLayer dragLayer = novaLauncher.P;
        dragLayer.getClass();
        float fI = g3.i(cellLayout, dragLayer, fArr2, true, false);
        if (this.f21019y0) {
            setScaleX(this.Q0);
            setScaleY(this.Q0);
        }
        g3.s(fArr2, iArr);
        if (z12) {
            i11 = 0;
            float f12 = nVar.f95678j * fI;
            float f13 = f12 - 1.0f;
            iArr[0] = (int) (((nVar.getWidth() * f13) / 2.0f) + iArr[0]);
            int height = (int) (((f13 * nVar.getHeight()) / 2.0f) + iArr[1]);
            iArr[1] = height;
            fArr[1] = f12;
            fArr[0] = f12;
            if (nVar.n != null) {
                iArr[0] = (int) ((r1.left * fI) + iArr[0]);
                iArr[1] = (int) ((r1.top * fI) + height);
            }
        } else {
            i11 = 0;
            iArr[0] = (int) (iArr[0] - (c1.f(fI, rect.width(), nVar.getMeasuredWidth(), 2.0f) - Math.ceil(cellLayout.C() / 2.0f)));
            iArr[1] = (int) (iArr[1] - ((nVar.getMeasuredHeight() - (rect.height() * fI)) / 2.0f));
            fArr[0] = ((rect.width() * 1.0f) / nVar.getMeasuredWidth()) * fI;
            fArr[1] = ((rect.height() * 1.0f) / nVar.getMeasuredHeight()) * fI;
        }
        int integer = novaLauncher.getResources().getInteger(2131492874) - 200;
        int i14 = eVar.f57290b;
        int i15 = (i14 == 4 || i14 == 5) ? 1 : i11;
        if ((i5 != 2 && !z11) || view == null || nVar.f95669a == view) {
            i12 = i11;
            if (i15 != 0 && z11) {
                float fMin = Math.min(fArr[i12], fArr[1]);
                fArr[1] = fMin;
                fArr[i12] = fMin;
            }
        } else {
            int[] iArrH0 = H0(eVar);
            int visibility = view.getVisibility();
            int i16 = i11;
            view.setVisibility(i16);
            view.measure(View.MeasureSpec.makeMeasureSpec(iArrH0[i16], 1073741824), View.MeasureSpec.makeMeasureSpec(iArrH0[1], 1073741824));
            view.layout(i16, i16, iArrH0[i16], iArrH0[1]);
            int i17 = iArrH0[i16];
            int i18 = iArrH0[1];
            if (aa.f.No) {
                Picture picture = new Picture();
                view.draw(picture.beginRecording(i17, i18));
                picture.endRecording();
                bitmapCreateBitmap = Bitmap.createBitmap(picture);
            } else {
                bitmapCreateBitmap = Bitmap.createBitmap(i17, i18, Bitmap.Config.ARGB_8888);
                view.draw(new Canvas(bitmapCreateBitmap));
            }
            view.setVisibility(visibility);
            i12 = 0;
            nVar.b(new n(bitmapCreateBitmap, 0, false), (int) (integer * 0.8f));
        }
        DragLayer dragLayer2 = novaLauncher.P;
        if (i5 == 4) {
            dragLayer2.getClass();
            dragLayer2.p(nVar, iArr[i12], iArr[1], 0.0f, 0.1f, 0.1f, runnable, 0, integer, null);
        } else {
            dragLayer2.p(nVar, iArr[0], iArr[1], 1.0f, fArr[0], fArr[1], new j4(view, runnable, 0), i5 != 1 ? 0 : 2, integer, this);
        }
    }
}
