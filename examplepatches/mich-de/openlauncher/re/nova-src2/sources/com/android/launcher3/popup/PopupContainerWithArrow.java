package com.android.launcher3.popup;

import aa.n;
import aa.p;
import aa.z;
import android.animation.AnimatorSet;
import android.animation.LayoutTransition;
import android.animation.ObjectAnimator;
import android.content.ComponentName;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.widget.ImageView;
import android.widget.TextView;
import bm.t;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.folder.Folder;
import com.android.launcher3.notification.NotificationContainer;
import com.android.launcher3.popup.PopupContainerWithArrow;
import com.android.launcher3.shortcuts.DeepShortcutView;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.NovaShortcutHandler;
import com.teslacoilsw.launcher.preferences.SettingsActivity;
import com.teslacoilsw.launcher.util.NamedIntent;
import com.teslacoilsw.launcher.widget.DumbGridLayout;
import e10.q1;
import e10.s2;
import e10.y2;
import e10.z2;
import g30.b;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.function.Function;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import ka.c;
import ka.e;
import ka.s;
import kl.q0;
import kotlin.UInt;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import mx.c0;
import ninja.sesame.lib.bridge.v1.SesameFrontend;
import ninja.sesame.lib.bridge.v1.SesameShortcut;
import o9.c2;
import o9.g3;
import o9.k;
import o9.k0;
import o9.l;
import o9.l0;
import o9.l2;
import o9.n1;
import o9.y1;
import p9.f;
import r4.a;
import tz.g;
import tz.o;
import tz.u;
import x9.i;
import ya.g0;
import za.d;
import za.j;

/* loaded from: classes.dex */
public class PopupContainerWithArrow<T extends Context & d> extends c implements k0, x9.c {

    /* renamed from: g0, reason: collision with root package name */
    public static final /* synthetic */ int f21226g0 = 0;
    public final ArrayList N;
    public final PointF O;
    public final int P;
    public BubbleTextView Q;
    public int R;
    public NotificationContainer S;
    public ViewGroup T;
    public ViewGroup U;
    public ViewGroup V;
    public e W;

    /* renamed from: a0, reason: collision with root package name */
    public f f21227a0;

    /* renamed from: b0, reason: collision with root package name */
    public final PointF f21228b0;

    /* renamed from: c0, reason: collision with root package name */
    public boolean f21229c0;

    /* renamed from: d0, reason: collision with root package name */
    public ga.e f21230d0;

    /* renamed from: e0, reason: collision with root package name */
    public List f21231e0;

    /* renamed from: f0, reason: collision with root package name */
    public final int f21232f0;

    public PopupContainerWithArrow(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.N = new ArrayList();
        this.O = new PointF();
        this.f21228b0 = new PointF(Float.NaN, Float.NaN);
        this.f21229c0 = false;
        this.f21230d0 = null;
        this.f21231e0 = null;
        this.f21232f0 = ViewConfiguration.get(getContext()).getScaledTouchSlop();
        this.P = getResources().getDimensionPixelSize(2131165366);
        LayoutInflater.from(new ContextThemeWrapper(context, a.h(p.b(context, 16842806)) > 0.5d ? 2132083109 : 2132083102));
    }

    public static void n0(l lVar) {
        PopupContainerWithArrow popupContainerWithArrowO0 = o0(lVar);
        if (popupContainerWithArrowO0 != null) {
            if (popupContainerWithArrowO0.Q.isAttachedToWindow()) {
            } else {
                popupContainerWithArrowO0.U();
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static PopupContainerWithArrow o0(Context context) {
        o9.a aVarP = o9.a.P((d) context, 2);
        if (aVarP instanceof PopupContainerWithArrow) {
            return (PopupContainerWithArrow) aVarP;
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0049  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x01ff  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static PopupContainerWithArrow r0(final BubbleTextView bubbleTextView) {
        final ga.e eVar;
        List listP;
        w9.a aVarM;
        NamedIntent namedIntent;
        Context context = bubbleTextView.getContext();
        q0 q0Var = n1.C0;
        final NovaLauncher novaLauncher = (NovaLauncher) k.Y(context);
        if (o0(novaLauncher) != null) {
            bubbleTextView.clearFocus();
            return null;
        }
        final ga.e eVar2 = (ga.e) bubbleTextView.getTag();
        if (eVar2 instanceof ga.c) {
            ga.c cVar = (ga.c) eVar2;
            if (!cVar.f57303q.f() || (namedIntent = cVar.f57308v) == null || c0.c(namedIntent.f46369b) != c0.FIRST_ITEM_IN_FOLDER || (eVar = (ga.e) cVar.H.get(0)) == null) {
                eVar = eVar2;
            }
        }
        b bVar = (b) b.f57016l.h(novaLauncher);
        int iJ = bVar.f57020d;
        if (novaLauncher.t0(l2.o)) {
            iJ = a.j(novaLauncher.C().f90099b.f90178a, iJ);
        } else {
            Rect rect = Folder.f21093j0;
            if (((Folder) o9.a.P(novaLauncher, 1)) != null) {
                iJ = a.j(y2.f51877a.g0(), iJ);
            } else if (novaLauncher.o1()) {
                iJ = a.j(y2.f51877a.l(), iJ);
            }
        }
        int iN = a.n(iJ, 255);
        y2 y2Var = y2.f51877a;
        y2Var.getClass();
        u uVar = ((g) y2.b(novaLauncher).l()).f90120i;
        int i5 = bubbleTextView.f20869f.f628c;
        uVar.getClass();
        o oVar = bVar.f57023g;
        UInt.Companion companion = UInt.f71696b;
        e10.n1 n1VarB = ((q1) y2.i1().l()).b(novaLauncher, uVar.e(iN, i5, oVar), iN);
        PopupContainerWithArrow popupContainerWithArrow = (PopupContainerWithArrow) LayoutInflater.from(((double) Color.luminance(a.j(n1VarB.i(), n1VarB.b()))) > 0.5d ? new ContextThemeWrapper(novaLauncher, 2132083109) : new ContextThemeWrapper(novaLauncher, 2132083102)).inflate(2131624302, (ViewGroup) novaLauncher.P, false);
        Rect rect2 = Folder.f21093j0;
        Folder folder = (Folder) o9.a.P(novaLauncher, 1);
        if (folder != null) {
            popupContainerWithArrow.G = folder.getElevation() + 1.0f;
        }
        if (novaLauncher.o1()) {
            popupContainerWithArrow.G = w20.e.k(8);
        }
        popupContainerWithArrow.k0(n1VarB);
        if (n1VarB.b() == 0) {
            popupContainerWithArrow.setOutlineProvider(null);
        } else {
            GradientDrawable gradientDrawable = new GradientDrawable();
            gradientDrawable.setColor(popupContainerWithArrow.L.b());
            gradientDrawable.setCornerRadius(popupContainerWithArrow.L.h());
            popupContainerWithArrow.setBackground(gradientDrawable);
            popupContainerWithArrow.setOutlineProvider(ViewOutlineProvider.BACKGROUND);
            popupContainerWithArrow.setClipToOutline(true);
        }
        popupContainerWithArrow.addOnAttachStateChangeListener(new ka.f(popupContainerWithArrow, novaLauncher));
        popupContainerWithArrow.W = new e(popupContainerWithArrow, novaLauncher);
        popupContainerWithArrow.f21227a0 = new f(novaLauncher);
        novaLauncher.Q.a(popupContainerWithArrow);
        popupContainerWithArrow.getViewTreeObserver().addOnPreDrawListener(new ka.a(popupContainerWithArrow, novaLauncher));
        t tVar = novaLauncher.f80005f0;
        s2 s2Var = y2.f51891d1;
        KProperty kProperty = y2.f51881b[103];
        s2Var.getClass();
        List listN = (!((Boolean) s2Var.l()).booleanValue() || (aVarM = tVar.m(eVar)) == null) ? Collections.EMPTY_LIST : t.n(eVar, aVarM.f94116a);
        int i11 = 4;
        if (oy.c.f81123a) {
            y2Var.getClass();
            if (((Boolean) y2.t1().l()).booleanValue() && oy.c.a(eVar)) {
                if (oy.c.a(eVar)) {
                    ComponentName componentNameI = eVar.i();
                    if (Intrinsics.b(SettingsActivity.f45966y, componentNameI)) {
                        componentNameI = NovaShortcutHandler.f45670c;
                    }
                    List<SesameShortcut> recentComponentShortcuts = SesameFrontend.getRecentComponentShortcuts(componentNameI, false, 4);
                    ArrayList arrayList = new ArrayList(b70.c.u0(recentComponentShortcuts, 10));
                    Iterator<T> it = recentComponentShortcuts.iterator();
                    while (it.hasNext()) {
                        arrayList.add(g90.k.E((SesameShortcut) it.next()));
                    }
                    listP = arrayList;
                } else {
                    listP = Collections.EMPTY_LIST;
                }
                popupContainerWithArrow.f21231e0 = listP;
            } else {
                ComponentName componentNameI2 = eVar.i();
                ComponentName componentName = SettingsActivity.f45966y;
                if (Intrinsics.b(componentNameI2, componentName)) {
                    listP = Intrinsics.b(eVar.i(), componentName) ? ul.b.P(new oy.a(novaLauncher.getString(2132017511), z2.v(2131231885, "com.teslacoilsw.launcher"), c0.SET_DEFAULT_LAUNCHER.b(), new oy.e() { // from class: oy.b
                        @Override // kotlin.jvm.functions.Function1
                        public final Object invoke(Object obj) {
                            return null;
                        }
                    }, Process.myUserHandle())) : EmptyList.f71733a;
                    popupContainerWithArrow.f21231e0 = listP;
                } else {
                    listP = null;
                }
            }
        }
        int iO = listP == null ? tVar.o(eVar) : listP.size();
        List list = (List) d10.f.a().stream().map(new Function() { // from class: ka.d
            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                int i12 = PopupContainerWithArrow.f21226g0;
                return ((r) obj).b(novaLauncher, eVar, eVar2, bubbleTextView);
            }
        }).filter(new z(i11)).collect(Collectors.toList());
        if (iO == 0 && list.size() == 0 && listN.size() == 0) {
            return null;
        }
        ga.e eVar3 = eVar;
        popupContainerWithArrow.q0(bubbleTextView, eVar3, iO, listN, list);
        if (eVar3.d() != null && fg.a.F(eVar3.d())) {
            y2.f51877a.getClass();
            if (!y2.d()) {
                g0 g0VarA = g0.a(eVar3);
                c2 c2Var = novaLauncher.f80001b0;
                c2Var.getClass();
                c2Var.c(new y1(g0VarA));
            }
        }
        popupContainerWithArrow.requestFocus();
        return popupContainerWithArrow;
    }

    @Override // x9.c
    public final void E(l0 l0Var, i iVar) {
        this.A = true;
        ((NovaLauncher) this.n).n1(true);
        U();
    }

    @Override // ka.c, o9.a
    public final View N() {
        d dVar = (d) this.n;
        if (dVar.E().o()) {
            setImportantForAccessibility(4);
        }
        if (dVar.E().o()) {
            return null;
        }
        return super.N();
    }

    @Override // o9.a
    public final boolean R(int i5) {
        return (i5 & 2) != 0;
    }

    @Override // ka.c
    public final void X() {
        super.X();
        PopupContainerWithArrow<T> popupContainerWithArrowO0 = o0(this.n);
        BubbleTextView bubbleTextView = this.Q;
        if (bubbleTextView != null) {
            if (popupContainerWithArrowO0 == null || popupContainerWithArrowO0 == this || popupContainerWithArrowO0.Q != bubbleTextView) {
                bubbleTextView.P(bubbleTextView.R() ? 1.0f : 0.0f);
                this.Q.N(false);
            }
        }
    }

    @Override // ka.c
    public final int Z() {
        if (getChildCount() != 1 || !(getChildAt(0) instanceof DumbGridLayout)) {
            return this.L.a();
        }
        int iE = this.L.e();
        return iE == 0 ? this.L.b() : iE;
    }

    @Override // ka.c
    public final List a0() {
        return Arrays.asList(this.V, this.T, this.U, this.S);
    }

    @Override // ka.c
    public final void d0(Rect rect) {
        c0().i(this.Q, rect);
        BubbleTextView bubbleTextView = this.Q;
        n nVar = bubbleTextView.f20869f;
        if (nVar == null || !bubbleTextView.f20873j) {
            rect.top = bubbleTextView.getPaddingTop() + rect.top;
            rect.left = this.Q.getPaddingLeft() + rect.left;
            rect.right -= this.Q.getPaddingRight();
            rect.bottom = rect.top + (nVar != null ? nVar.getBounds().height() : this.Q.getHeight());
            return;
        }
        Rect bounds = nVar.getBounds();
        rect.top = this.Q.getPaddingTop() + rect.top;
        int paddingLeft = this.Q.getPaddingLeft() + rect.left;
        rect.left = paddingLeft;
        rect.right = bounds.width() + paddingLeft;
        rect.bottom = rect.top + bounds.bottom;
    }

    @Override // ka.c
    public final void f0(AnimatorSet animatorSet) {
        BubbleTextView bubbleTextView = this.Q;
        animatorSet.play(ObjectAnimator.ofFloat(bubbleTextView, BubbleTextView.A, bubbleTextView.R() ? 1.0f : 0.0f));
        this.Q.N(false);
    }

    @Override // android.view.View
    public final View.AccessibilityDelegate getAccessibilityDelegate() {
        return this.f21227a0;
    }

    @Override // o9.k0
    public final void i(View view, l0 l0Var, boolean z11) {
    }

    @Override // ka.c
    public final void j0(View view, int i5, AnimatorSet animatorSet) {
        super.j0(view, i5, animatorSet);
        if (view.getId() != 2131428458 || this.S == null) {
            return;
        }
        if (i5 == 0) {
            i5 = this.L.b();
        }
        this.S.e(i5, animatorSet);
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0022  */
    @Override // ya.k0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean l(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            this.f21229c0 = true;
            j jVarC0 = c0();
            if (jVarC0.m(this, motionEvent)) {
                PointF pointF = this.f21228b0;
                if (Float.isNaN(pointF.x) || Float.isNaN(pointF.y)) {
                    pointF.x = motionEvent.getX();
                    pointF.y = motionEvent.getY();
                    return false;
                }
                if (!this.f21229c0) {
                    float f11 = pointF.x;
                    float f12 = pointF.y;
                    float x11 = motionEvent.getX() - f11;
                    float y11 = motionEvent.getY() - f12;
                    if (((float) Math.sqrt((y11 * y11) + (x11 * x11))) > this.f21232f0) {
                        K(true);
                    }
                }
            } else {
                K(true);
                BubbleTextView bubbleTextView = this.Q;
                if (bubbleTextView == null || !jVarC0.m(bubbleTextView, motionEvent)) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // x9.c
    public final void o() {
        if (this.f79742a) {
            return;
        }
        if (this.f71268z != null) {
            this.A = false;
        } else if (this.A) {
            X();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        ((d) this.n).E().a(this);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ((d) this.n).E().r(this);
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        PointF pointF = this.O;
        if (action == 0) {
            pointF.set(motionEvent.getX(), motionEvent.getY());
        }
        NotificationContainer notificationContainer = this.S;
        if (notificationContainer != null && notificationContainer.a(motionEvent)) {
            return true;
        }
        float x11 = pointF.x - motionEvent.getX();
        float y11 = pointF.y - motionEvent.getY();
        Pattern pattern = g3.f79846a;
        float f11 = (y11 * y11) + (x11 * x11);
        float scaledTouchSlop = ViewConfiguration.get(getContext()).getScaledTouchSlop();
        return f11 > scaledTouchSlop * scaledTouchSlop;
    }

    @Override // o9.a, android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        NotificationContainer notificationContainer = this.S;
        if (notificationContainer != null) {
            notificationContainer.b(motionEvent);
        }
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final View p0(int i5, ViewGroup viewGroup, ka.t tVar) {
        int childCount = viewGroup.getChildCount();
        View viewInflate = LayoutInflater.from(viewGroup.getContext()).inflate(i5, viewGroup, false);
        viewGroup.addView(viewInflate, childCount);
        View viewFindViewById = viewInflate.findViewById(2131427883);
        if (viewFindViewById != null) {
            viewFindViewById.setBackgroundColor(this.L.c());
        }
        if (viewInflate instanceof DeepShortcutView) {
            DeepShortcutView deepShortcutView = (DeepShortcutView) viewInflate;
            tVar.p0(deepShortcutView.d(), deepShortcutView.b());
            deepShortcutView.d().setBackgroundTintList(ColorStateList.valueOf(this.L.f()));
        } else if (viewInflate instanceof ImageView) {
            ImageView imageView = (ImageView) viewInflate;
            tVar.f0(imageView);
            viewInflate.setTooltipText(viewInflate.getContentDescription());
            imageView.setImageTintList(ColorStateList.valueOf(this.L.f()));
        }
        viewInflate.setTag(tVar);
        viewInflate.setOnClickListener(tVar);
        if (tVar instanceof View.OnLongClickListener) {
            viewInflate.setOnLongClickListener((View.OnLongClickListener) tVar);
        }
        return viewInflate;
    }

    public final void q0(BubbleTextView bubbleTextView, ga.e eVar, int i5, List list, List list2) {
        this.R = list.size();
        this.Q = bubbleTextView;
        this.f21230d0 = eVar;
        boolean z11 = i5 > 0;
        int dimension = (int) getResources().getDimension(2131165310);
        if (this.R > 0) {
            NotificationContainer notificationContainer = this.S;
            if (notificationContainer == null) {
                NotificationContainer notificationContainer2 = (NotificationContainer) findViewById(2131428458);
                this.S = notificationContainer2;
                notificationContainer2.setVisibility(0);
                this.S.c(this);
            } else {
                notificationContainer.setVisibility(8);
            }
            w9.a aVarW = ((d) this.n).w((ga.f) this.f21230d0);
            NotificationContainer notificationContainer3 = this.S;
            if (notificationContainer3 != null && aVarW != null) {
                notificationContainer3.f(aVarW.b());
            }
        }
        int childCount = getChildCount();
        this.V = this;
        if (this.U == null) {
            this.U = (ViewGroup) findViewById(2131427843);
        }
        ArrayList arrayList = this.N;
        if (z11 || list2.size() > 4) {
            this.U.setVisibility(z11 ? 0 : 8);
            while (i5 > 0) {
                DeepShortcutView deepShortcutView = (DeepShortcutView) e0(this.U, 2131624073);
                deepShortcutView.getLayoutParams().width = dimension;
                y2.f51877a.getClass();
                if (y2.d()) {
                    ((TextView) deepShortcutView.findViewById(2131427605)).setCompoundDrawablesRelative(null, null, null, null);
                }
                arrayList.add(deepShortcutView);
                i5--;
            }
            s0();
            if (!list2.isEmpty()) {
                Iterator it = list2.iterator();
                while (it.hasNext()) {
                    ka.t tVar = (ka.t) it.next();
                    if (tVar instanceof s) {
                        if (this.T == null) {
                            this.T = (ViewGroup) e0(this, 2131624463);
                        }
                        p0(2131624433, this.T, tVar);
                    }
                }
                ViewGroup viewGroup = (ViewGroup) e0(this, 2131624436);
                this.V = viewGroup;
                viewGroup.getLayoutParams().width = dimension;
                Iterator it2 = list2.iterator();
                while (it2.hasNext()) {
                    ka.t tVar2 = (ka.t) it2.next();
                    if (!(tVar2 instanceof s)) {
                        p0(2131624435, this.V, tVar2);
                    }
                }
            }
        } else {
            this.U.setVisibility(8);
            if (!list2.isEmpty()) {
                Iterator it3 = list2.iterator();
                while (it3.hasNext()) {
                    p0(2131624433, this, (ka.t) it3.next());
                }
            }
        }
        i0(childCount);
        if (Build.VERSION.SDK_INT >= 28) {
            setAccessibilityPaneTitle(getContext().getString(this.R == 0 ? 2132017209 : 2132019524));
        }
        this.Q.N(true);
        setLayoutTransition(new LayoutTransition());
        ya.j.f97149d.f97215a.postAtFrontOfQueue(ka.n.a(this.n, eVar, new Handler(Looper.getMainLooper()), this, arrayList, list));
    }

    public final void s0() {
        int i5 = this.S != null ? 2 : 4;
        ArrayList arrayList = this.N;
        int size = arrayList.size();
        if (this.L.j() > 0) {
            this.L.getClass();
            this.L.getClass();
        }
        int i11 = 0;
        while (i11 < size) {
            ((DeepShortcutView) arrayList.get(i11)).setVisibility(i11 >= i5 ? 8 : 0);
            i11++;
        }
    }
}
