package com.teslacoilsw.launcher;

import ab.o;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.appwidget.AppWidgetHostView;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Parcelable;
import android.os.PersistableBundle;
import android.os.Process;
import android.os.SystemClock;
import android.os.Trace;
import android.os.UserHandle;
import android.provider.Settings;
import android.text.Editable;
import android.util.Property;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.DecelerateInterpolator;
import android.widget.FrameLayout;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.contract.ActivityResultContracts$StartActivityForResult;
import b.c9;
import b.yc;
import b00.d1;
import b00.h1;
import b10.r0;
import b20.b0;
import b6.e;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.CellLayout;
import com.android.launcher3.LauncherRootView;
import com.android.launcher3.Workspace;
import com.android.launcher3.allapps.AllAppsContainerView;
import com.android.launcher3.dragndrop.DragLayer;
import com.android.launcher3.folder.Folder;
import com.android.launcher3.folder.FolderIcon;
import com.android.launcher3.pageindicators.WorkspacePageIndicator;
import com.android.launcher3.popup.PopupContainerWithArrow;
import com.android.launcher3.util.ComponentKey;
import com.android.launcher3.util.PendingRequestArgs;
import com.android.launcher3.views.DoubleShadowBubbleTextView;
import com.android.launcher3.views.FloatingIconView;
import com.android.launcher3.views.FloatingSurfaceView;
import com.android.systemui.plugins.shared.LauncherOverlayManager;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.appwidget.WidgetsPeekingSheet;
import com.teslacoilsw.launcher.drawer.drawergroups.GroupAppListActivity;
import com.teslacoilsw.launcher.homereset.HomeReset;
import com.teslacoilsw.launcher.launcher3.NovaAppDrawerSearchBar;
import com.teslacoilsw.launcher.minusone.NovaFeedOverlayView;
import com.teslacoilsw.launcher.preferences.fragments.SettingsGestures;
import com.teslacoilsw.launcher.quicksearchbar.NovaSearchBarView;
import com.teslacoilsw.launcher.search.AppSearchFloatingView;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import com.teslacoilsw.launcher.util.DuplicateInstanceExit;
import com.teslacoilsw.launcher.util.MigrationKillSwitchExit;
import com.teslacoilsw.launcher.util.NamedIntent;
import com.teslacoilsw.launcher.widget.AlphaOptimizedEditText;
import com.teslacoilsw.launcher.widget.Rotate90ParentView;
import cz.k;
import db0.e0;
import db0.f0;
import db0.q0;
import e10.a3;
import e10.j3;
import e10.s2;
import e10.y2;
import fz.i0;
import g20.u;
import g20.w;
import g30.a;
import g30.b;
import h6.c1;
import h6.g1;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import j.c;
import java.lang.ref.WeakReference;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.random.Random;
import kotlin.reflect.KProperty;
import kw.s3;
import l1.g4;
import l10.i;
import lm.h;
import mx.b1;
import mx.g0;
import mx.m0;
import mx.n0;
import mx.p0;
import mx.t0;
import mx.u0;
import ninja.sesame.lib.bridge.v1.SesameFrontend;
import nova.branch.engage.sesame_lite.internal.IdHash;
import o9.a0;
import o9.b3;
import o9.d4;
import o9.g3;
import o9.k4;
import o9.l0;
import o9.l2;
import o9.n1;
import o9.z0;
import op.g;
import op.n;
import op.r;
import p6.a1;
import pp.x;
import q20.p;
import t70.g2;
import t70.j0;
import t70.k0;
import t70.l1;
import t70.y0;
import tx.i1;
import tz.v;
import uy.c0;
import uy.d0;
import uy.q;
import w20.j;
import w20.l;
import w20.m;
import x20.f;
import x9.t;
import y70.d;
import ya.s;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u00042\u00020\u0005:\u0001\bB\u0007¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\t"}, d2 = {"Lcom/teslacoilsw/launcher/NovaLauncher;", "Lo9/n1;", "Lcz/k;", "Luy/c0;", "Lt70/j0;", "Lg30/a;", "<init>", "()V", "ab/e0", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class NovaLauncher extends n1 implements k, c0, j0, a {

    /* renamed from: r1, reason: collision with root package name */
    public static final ComponentName f45646r1 = new ComponentName("com.teslacoilsw.launcher", NovaLauncher.class.getName());

    /* renamed from: s1, reason: collision with root package name */
    public static boolean f45647s1 = true;

    /* renamed from: t1, reason: collision with root package name */
    public static boolean f45648t1;

    /* renamed from: u1, reason: collision with root package name */
    public static NovaLauncher f45649u1;

    /* renamed from: v1, reason: collision with root package name */
    public static volatile long f45650v1;

    /* renamed from: w1, reason: collision with root package name */
    public static volatile int f45651w1;

    /* renamed from: x1, reason: collision with root package name */
    public static volatile long f45652x1;
    public b E0;
    public boolean G0;
    public f H0;
    public HandlerThread I0;
    public d J0;
    public NovaSearchBarView K0;
    public EditShortcutSavedState N0;
    public py.a O0;
    public py.a P0;
    public final a70.d Q0;
    public int R0;
    public boolean S0;
    public boolean T0;
    public tz.k U0;
    public tz.d V0;
    public final l X0;
    public Function1 Y0;
    public final c Z0;

    /* renamed from: a1, reason: collision with root package name */
    public final c f45653a1;

    /* renamed from: b1, reason: collision with root package name */
    public final c f45654b1;

    /* renamed from: d1, reason: collision with root package name */
    public final vm.c f45656d1;

    /* renamed from: e1, reason: collision with root package name */
    public g2 f45657e1;

    /* renamed from: f1, reason: collision with root package name */
    public final q0 f45658f1;
    public boolean g1;
    public final n0 h1;
    public final n0 i1;

    /* renamed from: j1, reason: collision with root package name */
    public final n0 f45659j1;

    /* renamed from: k1, reason: collision with root package name */
    public final Object f45660k1;

    /* renamed from: l1, reason: collision with root package name */
    public ObjectAnimator f45661l1;

    /* renamed from: m1, reason: collision with root package name */
    public g2 f45662m1;

    /* renamed from: n1, reason: collision with root package name */
    public String f45663n1;

    /* renamed from: o1, reason: collision with root package name */
    public final s f45664o1;

    /* renamed from: p1, reason: collision with root package name */
    public long f45665p1;

    /* renamed from: q1, reason: collision with root package name */
    public final i0 f45666q1;
    public final /* synthetic */ d D0 = k0.b();
    public final b0 F0 = new b0(this);
    public final ArrayList L0 = new ArrayList();
    public int M0 = -1;
    public final l W0 = j.c(this, "android.permission.CALL_PHONE", new h(25));

    /* renamed from: c1, reason: collision with root package name */
    public final c f45655c1 = registerForActivityResult(new ActivityResultContracts$StartActivityForResult(), new p0(this, 3));

    public NovaLauncher() {
        final int i5 = 0;
        this.Q0 = LazyKt.a(new m0(this, i5));
        this.X0 = j.c(this, "android.permission.ACCESS_FINE_LOCATION", new Function1(this) { // from class: mx.o0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ NovaLauncher f77220b;

            {
                this.f77220b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                AppSearchFloatingView appSearchFloatingViewH1;
                v9.e eVar;
                AppSearchResultsView appSearchResultsView;
                String string;
                AlphaOptimizedEditText alphaOptimizedEditText;
                Editable text;
                int i11 = i5;
                NovaLauncher novaLauncher = this.f77220b;
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                switch (i11) {
                    case 0:
                        ComponentName componentName = NovaLauncher.f45646r1;
                        if (zBooleanValue) {
                            k30.r.g(novaLauncher);
                            k30.h0 h0Var = k30.h0.f70974r;
                            lm.e.p(novaLauncher).f();
                        }
                        break;
                    default:
                        ComponentName componentName2 = NovaLauncher.f45646r1;
                        if (zBooleanValue && (appSearchFloatingViewH1 = novaLauncher.h1()) != null && (eVar = (v9.e) appSearchFloatingViewH1.V().f92298c) != null && (appSearchResultsView = eVar.f92317a) != null) {
                            AppSearchFloatingView appSearchFloatingViewH12 = novaLauncher.h1();
                            if (appSearchFloatingViewH12 == null || (alphaOptimizedEditText = (AlphaOptimizedEditText) appSearchFloatingViewH12.V().f92299d) == null || (text = alphaOptimizedEditText.getText()) == null || (string = text.toString()) == null) {
                                string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                            }
                            appSearchResultsView.L(string, true);
                        }
                        break;
                }
                return Unit.f71706a;
            }
        });
        final int i11 = 1;
        this.Y0 = new yc(i11, null, i11);
        this.Z0 = registerForActivityResult(new k.b() { // from class: com.teslacoilsw.launcher.NovaLauncher$requestSpotifyLogin$1
            @Override // k.b
            public final Intent createIntent(Context context, Object obj) {
                g20.a aVar = g20.a.f56915a;
                NovaLauncher novaLauncher = this.f45668a;
                return ((p) ul.b.E(novaLauncher, aVar)).b(novaLauncher);
            }

            @Override // k.b
            public final Object parseResult(int i12, Intent intent) {
                return new ActivityResult(i12, intent);
            }
        }, new p0(this, i5));
        this.f45653a1 = registerForActivityResult(new k.b() { // from class: com.teslacoilsw.launcher.NovaLauncher$requestDeezerLogin$1
            @Override // k.b
            public final Intent createIntent(Context context, Object obj) {
                g20.a aVar = g20.a.f56916b;
                NovaLauncher novaLauncher = this.f45667a;
                return ((j20.h) ul.b.E(novaLauncher, aVar)).b(novaLauncher);
            }

            @Override // k.b
            public final Object parseResult(int i12, Intent intent) {
                return new ActivityResult(i12, intent);
            }
        }, new p0(this, i11));
        int i12 = 2;
        this.f45654b1 = registerForActivityResult(new ActivityResultContracts$StartActivityForResult(), new p0(this, i12));
        j.c(this, "android.permission.READ_CONTACTS", new Function1(this) { // from class: mx.o0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ NovaLauncher f77220b;

            {
                this.f77220b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                AppSearchFloatingView appSearchFloatingViewH1;
                v9.e eVar;
                AppSearchResultsView appSearchResultsView;
                String string;
                AlphaOptimizedEditText alphaOptimizedEditText;
                Editable text;
                int i112 = i11;
                NovaLauncher novaLauncher = this.f77220b;
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                switch (i112) {
                    case 0:
                        ComponentName componentName = NovaLauncher.f45646r1;
                        if (zBooleanValue) {
                            k30.r.g(novaLauncher);
                            k30.h0 h0Var = k30.h0.f70974r;
                            lm.e.p(novaLauncher).f();
                        }
                        break;
                    default:
                        ComponentName componentName2 = NovaLauncher.f45646r1;
                        if (zBooleanValue && (appSearchFloatingViewH1 = novaLauncher.h1()) != null && (eVar = (v9.e) appSearchFloatingViewH1.V().f92298c) != null && (appSearchResultsView = eVar.f92317a) != null) {
                            AppSearchFloatingView appSearchFloatingViewH12 = novaLauncher.h1();
                            if (appSearchFloatingViewH12 == null || (alphaOptimizedEditText = (AlphaOptimizedEditText) appSearchFloatingViewH12.V().f92299d) == null || (text = alphaOptimizedEditText.getText()) == null || (string = text.toString()) == null) {
                                string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                            }
                            appSearchResultsView.L(string, true);
                        }
                        break;
                }
                return Unit.f71706a;
            }
        });
        this.f45656d1 = new vm.c(this, 17);
        this.f45658f1 = new q0();
        this.h1 = new n0(this, i11);
        this.i1 = new n0(this, i12);
        this.f45659j1 = new n0(this, i5);
        m0 m0Var = new m0(this, i11);
        dy.k kVar = lx.d.f75158a;
        this.f45660k1 = LazyKt.b(LazyThreadSafetyMode.f71681c, m0Var);
        this.f45664o1 = new s();
        this.f45666q1 = new i0(this, new String[]{"android.intent.action.CLOSE_SYSTEM_DIALOGS"}, i11);
    }

    /* JADX WARN: Removed duplicated region for block: B:54:0x0146  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x018b  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x01a1  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0247  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001e  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:57:0x0175 -> B:12:0x0056). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object W0(com.teslacoilsw.launcher.NovaLauncher r28, android.content.Intent r29, com.android.launcher3.util.PendingRequestArgs r30, kotlin.coroutines.jvm.internal.ContinuationImpl r31) {
        /*
            Method dump skipped, instructions count: 586
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.teslacoilsw.launcher.NovaLauncher.W0(com.teslacoilsw.launcher.NovaLauncher, android.content.Intent, com.android.launcher3.util.PendingRequestArgs, kotlin.coroutines.jvm.internal.ContinuationImpl):java.lang.Object");
    }

    public static final NovaSearchBarView a1(NovaLauncher novaLauncher, int i5) {
        View viewInflate = LayoutInflater.from(novaLauncher).inflate(i5, (ViewGroup) novaLauncher.P, false);
        Intrinsics.e(viewInflate, "null cannot be cast to non-null type com.teslacoilsw.launcher.quicksearchbar.NovaSearchBarView");
        NovaSearchBarView novaSearchBarView = (NovaSearchBarView) viewInflate;
        ViewGroup.LayoutParams layoutParams = novaSearchBarView.getLayoutParams();
        Intrinsics.e(layoutParams, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams");
        FrameLayout.LayoutParams layoutParams2 = (FrameLayout.LayoutParams) layoutParams;
        layoutParams2.leftMargin = c1.j(novaLauncher, 16);
        layoutParams2.rightMargin = c1.j(novaLauncher, 16);
        y2 y2Var = y2.f51877a;
        v vVar = novaLauncher.C().f90105h;
        y2Var.getClass();
        NovaSearchBarView.f(novaSearchBarView, y2.e(vVar), null, false, 8);
        a0 a0Var = new a0(novaSearchBarView, new i(novaSearchBarView, 0), rz.a.f86497a);
        a0Var.f79752j = false;
        novaSearchBarView.f46142a = a0Var;
        return novaSearchBarView;
    }

    public static void e1(NovaLauncher novaLauncher) {
        novaLauncher.getClass();
        o9.a.M(novaLauncher, true, 2);
    }

    public static /* synthetic */ void m1(NovaLauncher novaLauncher, mx.c0 c0Var, View view, Intent intent, int i5) {
        if ((i5 & 2) != 0) {
            view = null;
        }
        if ((i5 & 4) != 0) {
            intent = null;
        }
        novaLauncher.l1(c0Var, view, intent, null);
    }

    public static final void x1(Exception exc) {
        mc0.d.f76206a.e(exc);
    }

    @Override // za.d
    public final tz.d C() {
        tz.d dVar = this.V0;
        if (dVar != null) {
            return dVar;
        }
        Intrinsics.m("novaColorScheme");
        throw null;
    }

    @Override // uy.c0
    public final boolean D(q qVar, ga.j jVar) {
        ga.a[] aVarArr;
        q9.p pVar;
        if (qVar.e()) {
            Context context = g0.f77088a;
            r rVarI = g0.i();
            y30.b bVar = qVar.f91752d;
            Intrinsics.d(bVar);
            String strName = bVar.name();
            g.Companion.getClass();
            rVarI.e(new n(strName, op.f.a()));
        }
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        AllAppsContainerView allAppsContainerView = this.V;
        if (allAppsContainerView == null || (pVar = allAppsContainerView.f21025g) == null || (aVarArr = pVar.f83863c) == null) {
            aVarArr = new ga.a[0];
        }
        if (aVarArr.length != 0) {
            int length = aVarArr.length;
            int i5 = 0;
            while (true) {
                if (i5 >= length) {
                    break;
                }
                ga.a aVar = aVarArr[i5];
                if ((aVar instanceof iz.a) && ((iz.a) aVar).c1().equals(qVar)) {
                    objectRef.f71863a = aVar;
                    break;
                }
                i5++;
            }
        }
        Object obj = objectRef.f71863a;
        if (obj != null) {
            int iW0 = ((iz.a) obj).W0(jVar);
            jVar.f57299k = iW0;
            runOnUiThread(new com.instabridge.ai.chat.ui.c0(objectRef, jVar, iW0, 4));
            Object[] array = ((iz.a) objectRef.f71863a).H.f68416a.toArray();
            for (Object obj2 : array) {
                if (obj2 instanceof Folder) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // o9.n1
    public final DoubleShadowBubbleTextView D0(ViewGroup viewGroup, ga.j jVar) {
        BubbleTextView bubbleTextView = (BubbleTextView) LayoutInflater.from(viewGroup.getContext()).inflate(2131624043, viewGroup, false);
        bubbleTextView.w(jVar);
        bubbleTextView.setOnClickListener(ua.g.f90762b);
        bubbleTextView.setOnFocusChangeListener(this.f80012m0);
        DoubleShadowBubbleTextView doubleShadowBubbleTextView = (DoubleShadowBubbleTextView) bubbleTextView;
        doubleShadowBubbleTextView.W(this);
        return doubleShadowBubbleTextView;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x004f  */
    @Override // fa.p
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void G(ya.r r7) throws android.content.pm.PackageManager.NameNotFoundException {
        /*
            r6 = this;
            java.util.ArrayList r0 = r6.L0
            r0.clear()
            java.lang.String r0 = "finishBindingItems"
            android.os.Trace.beginSection(r0)
            com.android.launcher3.Workspace r0 = r6.O
            ya.p r1 = r0.P0
            int r2 = r0.getChildCount()
            r3 = 0
            r4 = r3
        L14:
            if (r4 >= r2) goto L22
            boolean r5 = r1.f(r4)
            if (r5 != 0) goto L1f
            r0.h1(r4)
        L1f:
            int r4 = r4 + 1
            goto L14
        L22:
            r1.f97194b = r3
            r1 = 0
            r0.O0 = r1
            r6.Z = r3
            com.android.launcher3.util.ActivityResultInfo r0 = r6.f80009j0
            if (r0 == 0) goto L38
            int r2 = r0.f21248a
            int r4 = r0.f21249b
            android.content.Intent r0 = r0.f21250c
            r6.N0(r2, r4, r0)
            r6.f80009j0 = r1
        L38:
            r0 = -100
            if (r7 == 0) goto L4f
            ya.p r7 = r7.f97209a
            boolean r2 = r7.isEmpty()
            if (r2 != 0) goto L4f
            com.android.launcher3.Workspace r2 = r6.O
            int r7 = r7.j(r3)
            int r7 = r2.N0(r7)
            goto L50
        L4f:
            r7 = r0
        L50:
            if (r7 == r0) goto L57
            com.android.launcher3.Workspace r0 = r6.O
            r0.h0(r7, r7)
        L57:
            ya.r r7 = new ya.r
            r7.<init>()
            r6.f80007h0 = r7
            mx.j0 r7 = r6.f79934x
            int r0 = r7.f77174w0
            int r7 = r7.f77172v0
            int r0 = r0 * r7
            vm.c r7 = r6.B
            java.lang.Object r2 = r7.f92857b
            android.util.SparseArray r2 = (android.util.SparseArray) r2
            java.lang.Object r7 = r7.f92857b
            android.util.SparseArray r7 = (android.util.SparseArray) r7
            ya.m0 r4 = new ya.m0
            r4.<init>(r0)
            r0 = 2131624153(0x7f0e00d9, float:1.8875478E38)
            r2.put(r0, r4)
            ya.m0 r0 = new ya.m0
            r2 = 2
            r0.<init>(r2)
            r2 = 2131624155(0x7f0e00db, float:1.8875482E38)
            r7.put(r2, r0)
            ya.m0 r0 = new ya.m0
            r2 = 64
            r0.<init>(r2)
            r2 = 2131624035(0x7f0e0063, float:1.8875238E38)
            r7.put(r2, r0)
            ya.m0 r0 = new ya.m0
            r2 = 16
            r0.<init>(r2)
            r2 = 2131624033(0x7f0e0061, float:1.8875234E38)
            r7.put(r2, r0)
            android.os.Trace.endSection()
            com.teslacoilsw.launcher.EditShortcutSavedState r7 = r6.N0
            if (r7 == 0) goto Laf
            int r7 = r7.getF45617a()
            r0 = -1
            if (r7 != r0) goto Laf
            goto Lb1
        Laf:
            r6.N0 = r1
        Lb1:
            e10.y2 r7 = e10.y2.f51877a
            e10.s2 r7 = r7.y()
            java.lang.Object r7 = r7.l()
            e10.i3 r0 = e10.i3.f51594a
            if (r7 == r0) goto Lcc
            com.android.launcher3.Workspace r7 = r6.O
            android.view.View r7 = r7.E
            com.android.launcher3.pageindicators.WorkspacePageIndicator r7 = (com.android.launcher3.pageindicators.WorkspacePageIndicator) r7
            if (r7 == 0) goto Lc9
            r7.f21224l = r3
        Lc9:
            r7.invalidate()
        Lcc:
            r6.r1()
            l1.g4 r7 = new l1.g4
            r0 = 8
            r7.<init>(r6, r1, r0)
            r0 = 3
            t70.m0.t(r6, r1, r1, r7, r0)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.teslacoilsw.launcher.NovaLauncher.G(ya.r):void");
    }

    @Override // za.d
    public final Rect H() {
        CellLayout cellLayout;
        if (((e10.n0) y2.f51877a.j0().l()).f51677a == e10.p0.f51735c || Intrinsics.b((ra.a) this.M.f85765g, l2.o)) {
            Rect rect = new Rect();
            rect.set(this.P.getLeft(), this.P.getTop(), this.P.getRight(), this.P.getBottom());
            return rect;
        }
        Workspace workspace = this.O;
        workspace.getClass();
        Rect rect2 = new Rect();
        int iG = workspace.G();
        workspace.X0();
        for (int i5 = iG; i5 < iG + 1 && (cellLayout = (CellLayout) workspace.getChildAt(i5)) != null; i5++) {
            b3 b3Var = cellLayout.P;
            Rect rect3 = new Rect();
            workspace.f21013s0.P.i(b3Var, rect3);
            rect2.union(rect3);
        }
        return rect2;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x004b  */
    @Override // o9.n1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final com.android.systemui.plugins.shared.LauncherOverlayManager J0() {
        /*
            r4 = this;
            e10.y2 r0 = e10.y2.f51877a
            r0.getClass()
            e10.s2 r0 = e10.y2.e0()
            java.lang.Object r0 = r0.l()
            e10.f0 r1 = e10.f0.f51516b
            r2 = 0
            if (r0 != r1) goto L22
            e10.s2 r0 = e10.y2.L0()
            java.lang.Object r0 = r0.l()
            java.lang.Boolean r0 = (java.lang.Boolean) r0
            boolean r0 = r0.booleanValue()
            if (r0 == 0) goto L54
        L22:
            e10.s2 r0 = e10.y2.e0()
            java.lang.Object r0 = r0.l()
            e10.f0 r1 = e10.f0.f51518d
            if (r0 == r1) goto L4b
            android.content.Context r0 = mx.g0.f77088a
            boolean r0 = mx.g0.o()
            if (r0 != 0) goto L4b
            android.content.Context r0 = r4.getApplicationContext()     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L54
            android.content.pm.PackageManager r0 = r0.getPackageManager()     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L54
            java.lang.String r1 = "com.teslacoilsw.launcherclientproxy"
            r3 = 0
            android.content.pm.ApplicationInfo r0 = r0.getApplicationInfo(r1, r3)     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L54
            int r0 = r0.flags     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L54
            r0 = r0 & 131(0x83, float:1.84E-43)
            if (r0 == 0) goto L54
        L4b:
            dz.g r0 = new dz.g
            r0.<init>(r4)
            r0.onActivityCreated(r4, r2)
            r2 = r0
        L54:
            e10.s2 r0 = e10.y2.Y0()
            java.lang.Object r0 = r0.l()
            java.lang.Boolean r0 = (java.lang.Boolean) r0
            boolean r0 = r0.booleanValue()
            if (r0 == 0) goto L75
            b00.d1 r0 = new b00.d1
            r1 = 2131428046(0x7f0b02ce, float:1.8477725E38)
            com.android.launcher3.LauncherRootView r3 = r4.L
            android.view.View r1 = r3.findViewById(r1)
            com.teslacoilsw.launcher.minusone.NovaFeedOverlayView r1 = (com.teslacoilsw.launcher.minusone.NovaFeedOverlayView) r1
            r0.<init>(r4, r1, r2)
            return r0
        L75:
            if (r2 == 0) goto L78
            return r2
        L78:
            o9.j1 r0 = new o9.j1
            r0.<init>()
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.teslacoilsw.launcher.NovaLauncher.J0():com.android.systemui.plugins.shared.LauncherOverlayManager");
    }

    @Override // o9.n1, fa.p
    public final void K(List list, boolean z11) {
        View viewL0;
        x0(list, z11, false);
        EditShortcutSavedState editShortcutSavedState = this.N0;
        int f45617a = editShortcutSavedState != null ? editShortcutSavedState.getF45617a() : -1;
        if (f45617a == -1 || (viewL0 = this.O.L0(new t0(f45617a))) == null) {
            return;
        }
        int i5 = EditShortcutFloatingView.f45599v;
        Object tag = viewL0.getTag();
        Intrinsics.e(tag, "null cannot be cast to non-null type com.android.launcher3.model.data.ItemInfoWithIcon");
        e.m(this, (ga.f) tag, this.N0);
        this.N0 = null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // fa.p
    public final void M() throws Resources.NotFoundException {
        EmptyList.f71733a.getClass();
        Trace.beginSection("startBinding");
        o9.a.M(this, true, 4218251);
        this.Z = true;
        this.Q.d();
        Workspace workspace = this.O;
        for (CellLayout cellLayout : workspace.R0()) {
            if (cellLayout != null) {
                b3 b3Var = cellLayout.P;
                int childCount = b3Var.getChildCount();
                for (int i5 = 0; i5 < childCount; i5++) {
                    View childAt = b3Var.getChildAt(i5);
                    if (childAt instanceof o9.m0) {
                        workspace.f21014t0.s((o9.m0) childAt);
                    }
                }
            }
        }
        Workspace workspace2 = this.O;
        workspace2.setLayoutTransition(null);
        workspace2.e1();
        workspace2.removeAllViews();
        workspace2.f21001j0.f97194b = 0;
        workspace2.f21000i0.clear();
        workspace2.f21013s0.I.removeCallbacksAndMessages(k4.class);
        workspace2.setLayoutTransition(workspace2.f20996f0);
        this.S.clearViews();
        Hotseat hotseat = this.T;
        if (hotseat != null) {
            boolean zO = this.f79934x.o();
            hotseat.removeAllViewsInLayout();
            hotseat.f80118t = zO ? ua.f.f90758np : ua.f.f90757lp;
            hotseat.f45624f0 = zO;
            z0 z0Var = hotseat.f45625g0.P().f77131a;
            LayoutInflater layoutInflaterFrom = LayoutInflater.from(hotseat.getContext());
            int i11 = a3.f51435a.f51551g;
            for (int i12 = 0; i12 < i11; i12++) {
                View viewInflate = layoutInflaterFrom.inflate(2131624165, (ViewGroup) hotseat, false);
                Intrinsics.e(viewInflate, "null cannot be cast to non-null type com.android.launcher3.CellLayout");
                CellLayout cellLayout2 = (CellLayout) viewInflate;
                b3 b3Var2 = cellLayout2.P;
                cellLayout2.setClipChildren(hotseat.f45628j0);
                if (zO) {
                    cellLayout2.P(1, z0Var.f80277j);
                } else {
                    cellLayout2.P(z0Var.f80277j, 1);
                }
                b3Var2.setAlpha(hotseat.f45631m0);
                s9.a.a(b3Var2);
                hotseat.addView(cellLayout2);
            }
            hotseat.g0(hotseat.y0());
            hotseat.z0(((ya.g) ya.g.f97130h.h(hotseat.getContext())).f97136f);
        }
        Trace.endSection();
        Workspace workspace3 = this.O;
        workspace3.n0(workspace3.K0(), true);
        y2 y2Var = y2.f51877a;
        int iIntValue = ((Number) y2Var.G().l()).intValue();
        if (iIntValue > -100) {
            ga.g gVar = new ga.g(null, iIntValue);
            gVar.f57291c = -151;
            if (!((j3) y2Var.q1().l()).g()) {
                this.f80002c0.h(gVar, this.S);
                y2Var.G().a();
                return;
            }
            AppWidgetHostView appWidgetHostViewO0 = O0(gVar);
            if (appWidgetHostViewO0 != null) {
                this.O.d(appWidgetHostViewO0, gVar);
                this.O.requestLayout();
            }
            if (this.A0 == null) {
                y2Var.G().a();
                this.f80002c0.h(gVar, this.S);
                ga.g gVar2 = new ga.g(null, -101);
                gVar2.f57291c = -151;
                b1(null, gVar2);
            }
        }
    }

    @Override // o9.n1
    public final boolean R0() {
        return this.R0 == 0 && a0();
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Object, kotlin.Lazy] */
    public final void X0() {
        LauncherOverlayManager launcherOverlayManager = this.f80014o0;
        d1 d1Var = launcherOverlayManager instanceof d1 ? (d1) launcherOverlayManager : null;
        if (d1Var == null) {
            ?? r02 = this.f45660k1;
            if (((h1) r02.getValue()).getParent() == null) {
                this.P.addView((h1) r02.getValue());
            }
            ((h1) r02.getValue()).U();
            return;
        }
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
        valueAnimatorOfFloat.setInterpolator(zx.d.f98806b);
        valueAnimatorOfFloat.setDuration(200L);
        valueAnimatorOfFloat.addUpdateListener(new fz.j(2, valueAnimatorOfFloat, d1Var, this));
        valueAnimatorOfFloat.start();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final boolean Y0(View view, Intent intent, ga.e eVar) {
        ComponentKey componentKeyG;
        int i5;
        if (eVar != null) {
            boolean z11 = eVar instanceof g20.g;
            Object obj = null;
            Object[] objArr = 0;
            Object[] objArr2 = 0;
            Object[] objArr3 = 0;
            if (z11) {
                Context context = g0.f77088a;
                w wVarC = g0.c();
                t70.m0.t(wVarC.f57003b, null, null, new u(wVarC, ((g20.g) eVar).f0(), ic.b.W(f1()), objArr3 == true ? 1 : 0, 1), 3);
            } else if (eVar instanceof ga.a) {
                Context context2 = g0.f77088a;
                w wVarC2 = g0.c();
                ga.a aVar = (ga.a) eVar;
                r80.j jVarW = ic.b.W(f1());
                ComponentName componentName = aVar.f57279y;
                if (componentName != null) {
                    t70.m0.t(wVarC2.f57003b, null, null, new u(wVarC2, IdHash.INSTANCE.ofAppComponent(componentName.getPackageName(), componentName.getClassName(), wVarC2.f57004c.c(aVar.o)), jVarW, objArr2 == true ? 1 : 0, 0), 3);
                }
            } else if ((eVar instanceof ga.j) && (componentKeyG = lx.a.g(eVar)) != null) {
                long jC = ((ja.h) ja.h.f69294h.h(this)).c(componentKeyG.f21252b);
                Context context3 = g0.f77088a;
                w wVarC3 = g0.c();
                ComponentName componentName2 = componentKeyG.f21251a;
                t70.m0.t(wVarC3.f57003b, null, null, new u(wVarC3, IdHash.INSTANCE.ofAppComponent(componentName2.getPackageName(), componentName2.getClassName(), jC), ic.b.W(f1()), objArr == true ? 1 : 0, 0), 3);
            }
            pp.v vVar = pp.w.Companion;
            pp.w wVarC4 = ic.b.C(eVar.f57291c);
            if (wVarC4 == pp.w.f82789m && (i5 = eVar.f57291c) < -200) {
                d0 d0Var = d0.f91699e;
                if (d0Var.f91704d) {
                    int i11 = (-200) - i5;
                    Iterator it = d0Var.j(false).iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        Object next = it.next();
                        if (((uy.s) next).f91753e == i11) {
                            obj = next;
                            break;
                        }
                    }
                    uy.s sVar = (uy.s) obj;
                    if (sVar != null && sVar.e()) {
                        wVarC4 = pp.w.f82788l;
                    }
                }
            }
            pp.u uVarD = ic.b.D(eVar);
            boolean zP0 = z11 ? ((g20.g) eVar).p0() : false;
            Context context4 = g0.f77088a;
            g0.i().c(new x(uVarD, wVarC4, zP0));
        }
        return U0(view, intent, eVar);
    }

    public final void Z0() throws Resources.NotFoundException {
        int i5;
        y2 y2Var = y2.f51877a;
        j3 j3Var = (j3) y2Var.q1().l();
        int iOrdinal = j3Var.ordinal();
        if (iOrdinal != 2 && iOrdinal != 3) {
            if (iOrdinal != 4) {
                return;
            }
            NovaSearchBarView novaSearchBarViewA1 = a1(this, this.f79934x.o() ? 2131624339 : 2131624338);
            ViewGroup.LayoutParams layoutParams = novaSearchBarViewA1.getLayoutParams();
            Intrinsics.e(layoutParams, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams");
            FrameLayout.LayoutParams layoutParams2 = (FrameLayout.LayoutParams) layoutParams;
            if (this.f79934x.o()) {
                layoutParams2.gravity = this.f79934x.n() ? 8388613 : 8388611;
                layoutParams2.height = -1;
                layoutParams2.width = getResources().getDimensionPixelSize(2131165453);
            } else {
                layoutParams2.gravity = 48;
            }
            this.P.addView(novaSearchBarViewA1, layoutParams2);
            this.K0 = novaSearchBarViewA1;
            return;
        }
        if (((Number) y2Var.G().l()).intValue() == -101) {
            if (this.f79934x.o() && a3.f51435a.f51550f) {
                NovaSearchBarView novaSearchBarViewA12 = a1(this, 2131624339);
                ViewGroup.LayoutParams layoutParams3 = novaSearchBarViewA12.getLayoutParams();
                Intrinsics.e(layoutParams3, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams");
                FrameLayout.LayoutParams layoutParams4 = (FrameLayout.LayoutParams) layoutParams3;
                layoutParams4.gravity = this.f79934x.n() ? 8388611 : 8388613;
                layoutParams4.height = -1;
                layoutParams4.width = getResources().getDimensionPixelSize(2131165453);
                if (j3Var == j3.f51611d) {
                    mx.j0 j0Var = this.f79934x;
                    int i11 = j0Var.Y - j0Var.Z;
                    if (j0Var.n()) {
                        layoutParams4.setMarginStart(i11);
                    } else {
                        layoutParams4.setMarginEnd(i11);
                    }
                }
                this.P.addView(novaSearchBarViewA12, layoutParams4);
                this.A0 = novaSearchBarViewA12;
                y1();
                return;
            }
            if (((e10.b0) y2Var.I().l()).d()) {
                NovaSearchBarView novaSearchBarViewA13 = a1(this, 2131624338);
                novaSearchBarViewA13.setTag(-151);
                ViewGroup.LayoutParams layoutParams5 = novaSearchBarViewA13.getLayoutParams();
                Intrinsics.e(layoutParams5, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams");
                FrameLayout.LayoutParams layoutParams6 = (FrameLayout.LayoutParams) layoutParams5;
                int i12 = NovaAppDrawerSearchBar.f45803w;
                int iB = jz.g.b(this, this.f79934x, 0, ((fz.d) y2.f51877a.i().l()).d());
                layoutParams6.setMarginStart(iB);
                layoutParams6.setMarginEnd(iB);
                layoutParams6.gravity = 80;
                layoutParams6.height = getResources().getDimensionPixelSize(2131165544);
                if (y2Var.q1().l() == j3.f51611d) {
                    mx.j0 j0Var2 = this.f79934x;
                    i5 = j0Var2.Y - j0Var2.Z;
                } else {
                    i5 = this.f79934x.Z;
                }
                layoutParams6.bottomMargin = i5;
                this.P.addView(novaSearchBarViewA13, layoutParams6);
                this.A0 = novaSearchBarViewA13;
            }
        }
    }

    @Override // g30.a
    public final void a(b bVar) {
        mx.f fVar = this.f79934x.B0;
        v vVar = C().f90098a;
        fVar.getClass();
        fVar.f77077j = vVar.f90179b;
        mx.f fVar2 = this.f79934x.C0;
        v vVar2 = C().f90100c;
        fVar2.getClass();
        fVar2.f77077j = vVar2.f90179b;
        mx.f fVar3 = this.f79934x.E0;
        v vVar3 = C().f90099b;
        fVar3.getClass();
        fVar3.f77077j = vVar3.f90179b;
        this.O.Y0(new ll.i(11));
    }

    @Override // o9.k
    public final void b0() {
        super.b0();
        AppSearchFloatingView appSearchFloatingViewH1 = h1();
        int i5 = 3;
        if (appSearchFloatingViewH1 != null && appSearchFloatingViewH1.f46175l) {
            appSearchFloatingViewH1.post(new d4(appSearchFloatingViewH1, i5));
            appSearchFloatingViewH1.f46175l = false;
        }
        if (p10.c0.c0(this)) {
            p10.c0.x(this);
        }
        ((x20.e) y2.f51877a.U0().l()).d(this);
        Continuation continuation = null;
        if (getIntent().getBooleanExtra("com.teslacoilsw.launcher.EXTRA_PROMPT_DEFAULT_LAUNCHER_FROM_NOTIFICATION", false)) {
            Intent intent = new Intent(getIntent());
            intent.removeExtra("com.teslacoilsw.launcher.EXTRA_PROMPT_DEFAULT_LAUNCHER_FROM_NOTIFICATION");
            setIntent(intent);
            SharedPreferences sharedPreferences = a3.f51435a.f51545a;
            int i11 = sharedPreferences.getInt("win_back_notification_tap_count", 0) + 1;
            sharedPreferences.edit().putInt("win_back_notification_tap_count", i11).apply();
            zy.c cVar = zy.c.f98823a;
            zy.c.i("win_back_notification_tapped", b70.k.e0(new Pair("tap_count", Integer.valueOf(i11))));
            a80.e eVar = y0.f88884a;
            t70.m0.t(this, a80.d.f488c, null, new u0(this, continuation, i5), 2);
        } else {
            r1();
            a80.e eVar2 = y0.f88884a;
            t70.m0.t(this, a80.d.f488c, null, new u0(this, continuation, 4), 2);
        }
        i1.e(this);
        if (m.f93700j) {
            ya.j.f97146a.execute(new n0(this, i5));
        }
    }

    public final void b1(o oVar, ga.g gVar) throws Resources.NotFoundException {
        int i5;
        ViewGroup rotate90ParentView;
        za.h hVar;
        if (oVar == null) {
            gVar.f57310r = -101;
        }
        y2 y2Var = y2.f51877a;
        if (((Number) y2Var.G().l()).intValue() != gVar.f57310r) {
            ga.g gVar2 = new ga.g(null, ((Number) y2Var.G().l()).intValue());
            gVar2.f57291c = -151;
            if (!gVar2.r0()) {
                this.f80002c0.h(gVar2, this.S);
            }
            if (gVar.r0()) {
                y2Var.G().a();
            } else {
                y2Var.G().i(Integer.valueOf(gVar.f57310r));
            }
        }
        ViewGroup viewGroup = this.A0;
        if (viewGroup != null) {
            this.P.removeView(viewGroup);
            this.A0 = null;
        }
        if (oVar != null && !gVar.r0()) {
            if (y2Var.q1().l() == j3.f51611d) {
                mx.j0 j0Var = this.f79934x;
                i5 = j0Var.Y - j0Var.Z;
            } else {
                i5 = this.f79934x.Z;
            }
            if (this.f79934x.o()) {
                rotate90ParentView = new Rotate90ParentView(oVar, !this.f79934x.n());
                hVar = new za.h(-2, -1);
                if (this.f79934x.n()) {
                    ((FrameLayout.LayoutParams) hVar).gravity = 8388611;
                    hVar.setMarginStart(i5);
                } else {
                    ((FrameLayout.LayoutParams) hVar).gravity = 8388613;
                    hVar.setMarginEnd(i5);
                }
                oVar.C(0, 0, 0, 0);
                oVar.setTag(gVar);
            } else {
                rotate90ParentView = new FrameLayout(this);
                hVar = new za.h(-1, -2);
                ((FrameLayout.LayoutParams) hVar).gravity = 80;
                oVar.C(0, 0, 0, 0);
                oVar.setTag(gVar);
                ((FrameLayout.LayoutParams) hVar).bottomMargin = i5;
                rotate90ParentView.addView(oVar);
            }
            oVar.setOnLongClickListener(new h10.b(2, this, rotate90ParentView));
            this.P.addView(rotate90ParentView, hVar);
            this.A0 = rotate90ParentView;
            y1();
        }
        View view = this.V.f21031m;
        Intrinsics.e(view, "null cannot be cast to non-null type com.teslacoilsw.launcher.launcher3.NovaAppDrawerSearchBar");
        ((NovaAppDrawerSearchBar) view).l();
        q1();
        Z0();
    }

    @Override // fa.p
    public final void c(ga.a[] aVarArr, int i5) {
        if (isDestroyed()) {
            return;
        }
        d0.f91699e.b(this);
        q9.p pVar = this.V.f21025g;
        pVar.f83867g |= 4;
        pVar.f83863c = aVarArr;
        pVar.f83866f = i5;
        pVar.d();
        PopupContainerWithArrow.n0(this);
        if (g3.f79853h) {
            Trace.endAsyncSection("DisplayAllApps", 1);
        }
        Handler handler = this.I;
        n0 n0Var = this.f45659j1;
        handler.removeCallbacks(n0Var);
        handler.postDelayed(n0Var, 100L);
        AllAppsContainerView allAppsContainerView = this.V;
        if (!allAppsContainerView.A && allAppsContainerView.o.c(d20.a0.class) != null) {
            throw new ClassCastException();
        }
    }

    @Override // o9.k
    public final void c0() {
        this.f79931u = true;
        f fVarK1 = k1();
        Window window = getWindow();
        y2.f51877a.getClass();
        boolean zBooleanValue = ((Boolean) y2.W0().l()).booleanValue();
        boolean zBooleanValue2 = ((Boolean) y2.M0().l()).booleanValue();
        if (window != null && window.getContext() != null) {
            fVarK1.f94998b.getClass();
            if (zBooleanValue || zBooleanValue2) {
                window.clearFlags(201326592);
                window.addFlags(Integer.MIN_VALUE);
                window.setStatusBarColor(zBooleanValue ? 0 : -16777216);
                window.setNavigationBarColor(zBooleanValue2 ? 0 : -16777216);
            } else {
                window.clearFlags(Integer.MIN_VALUE);
            }
        }
        Z().f95567b = ((Boolean) y2.W0().l()).booleanValue();
        Z().f95568c = ((Boolean) y2.M0().l()).booleanValue();
        g2 g2Var = this.f45657e1;
        if (g2Var == null || !g2Var.b()) {
            Context context = g0.f77088a;
            this.f45657e1 = t70.m0.t(this, null, null, new g20.l(g0.c(), null, 3), 3);
        }
    }

    public final void c1() {
        ObjectAnimator objectAnimator = this.f45661l1;
        if (objectAnimator != null) {
            objectAnimator.cancel();
        }
        this.P.setCircleActivityAnimationProgress(0.0f);
    }

    public final void d1() {
        if (this.P.getCircleActivityAnimationProgress() == 0.0f) {
            return;
        }
        g2 g2Var = this.f45662m1;
        Continuation continuation = null;
        if (g2Var != null) {
            g2Var.c(null);
        }
        a80.e eVar = y0.f88884a;
        this.f45662m1 = t70.m0.t(this, y70.o.f96819a, null, new u0(this, continuation, 0), 2);
    }

    @Override // o9.n1, n4.i, android.app.Activity, android.view.Window.Callback
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (keyEvent.getKeyCode() == 82) {
            SettingsGestures.f46097k = true;
        }
        return super.dispatchKeyEvent(keyEvent);
    }

    @Override // o9.n1, android.app.Activity, android.view.Window.Callback
    public final boolean dispatchTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            this.f45663n1 = null;
        }
        return super.dispatchTouchEvent(motionEvent);
    }

    @Override // fa.p
    public final void e(ya.v vVar) {
        ComponentName componentNameI;
        this.O.f1(vVar);
        t tVar = this.Q;
        l0 l0Var = tVar.f95713i;
        if (l0Var != null) {
            ga.e eVar = l0Var.f79955g;
            if ((eVar instanceof ga.j) && (componentNameI = eVar.i()) != null && vVar.b(eVar, componentNameI)) {
                tVar.d();
            }
        }
        PopupContainerWithArrow.n0(this);
        s sVar = this.f45664o1;
        int size = sVar.size();
        for (int i5 = 0; i5 < size; i5++) {
            Folder folder = (Folder) sVar.valueAt(i5);
            ArrayList arrayListD0 = folder.d0();
            ArrayList arrayList = new ArrayList(b70.c.u0(arrayListD0, 10));
            Iterator it = arrayListD0.iterator();
            while (it.hasNext()) {
                Object tag = ((View) it.next()).getTag();
                Intrinsics.e(tag, "null cannot be cast to non-null type com.android.launcher3.model.data.ItemInfo");
                arrayList.add((ga.e) tag);
            }
            ArrayList arrayList2 = new ArrayList();
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                Object next = it2.next();
                if (vVar.a((ga.e) next)) {
                    arrayList2.add(next);
                }
            }
            Iterator it3 = arrayList2.iterator();
            while (it3.hasNext()) {
                ga.e eVar2 = (ga.e) it3.next();
                ga.c cVar = folder.f21115m;
                Intrinsics.e(eVar2, "null cannot be cast to non-null type com.android.launcher3.model.data.WorkspaceItemInfo");
                cVar.Y0((ga.j) eVar2, false);
            }
        }
    }

    public final pp.w f1() {
        if (this.f80014o0.isShowing()) {
            LauncherOverlayManager launcherOverlayManager = this.f80014o0;
            if (launcherOverlayManager instanceof d1) {
                NovaFeedOverlayView novaFeedOverlayView = ((d1) launcherOverlayManager).f16325c;
                return (novaFeedOverlayView.f45904c == null || novaFeedOverlayView.V().b().length() <= 0) ? pp.w.f82786j : pp.w.f82787k;
            }
        }
        if (!o1()) {
            AllAppsContainerView allAppsContainerView = this.V;
            AppSearchResultsView appSearchResultsView = allAppsContainerView.L;
            boolean z11 = false;
            if (appSearchResultsView != null) {
                if (allAppsContainerView.M) {
                    z11 = appSearchResultsView.M;
                } else if (appSearchResultsView.getVisibility() == 0) {
                    z11 = true;
                }
            }
            if (!z11) {
                return Intrinsics.b((ra.a) this.M.f85767i, l2.o) ? pp.w.f82779c : pp.w.f82789m;
            }
        }
        return pp.w.f82778b;
    }

    public final Folder g1(int i5) {
        s sVar = this.f45664o1;
        Folder folder = (Folder) sVar.get(i5);
        if (folder != null) {
            return folder;
        }
        Rect rect = Folder.f21093j0;
        Folder folder2 = (Folder) LayoutInflater.from(this).cloneInContext(this).inflate(2131624443, (ViewGroup) null);
        folder2.f21114l = this.Q;
        sVar.put(i5, folder2);
        return folder2;
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.D0.f96790a;
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public final PackageManager getPackageManager() {
        return getApplicationContext().getPackageManager();
    }

    public final AppSearchFloatingView h1() {
        int i5 = o9.a.f79741b;
        DragLayer dragLayer = this.P;
        o9.a aVar = null;
        if (dragLayer != null) {
            int childCount = dragLayer.getChildCount() - 1;
            while (true) {
                if (childCount < 0) {
                    break;
                }
                View childAt = dragLayer.getChildAt(childCount);
                if (childAt instanceof o9.a) {
                    o9.a aVar2 = (o9.a) childAt;
                    if (aVar2.R(2097152)) {
                        aVar = aVar2;
                        break;
                    }
                }
                childCount--;
            }
        }
        return (AppSearchFloatingView) aVar;
    }

    @Override // za.d
    public final void i(int[] iArr, Rect rect, int i5, int i11) {
        int iMax;
        int i12;
        e10.n0 n0Var = (e10.n0) y2.f51877a.j0().l();
        if (n0Var.f51677a == e10.p0.f51735c) {
            iArr[0] = ((rect.width() - i5) / 2) + rect.left;
            if (n0Var.f51687k) {
                iArr[1] = (((rect.height() - i11) + rect.top) - this.P.f20960a.bottom) - w20.e.k(96);
                return;
            } else {
                iArr[1] = ((rect.height() - i11) / 2) + rect.top;
                return;
            }
        }
        int iWidth = iArr[0];
        int i13 = iArr[1];
        mx.j0 j0Var = this.f79934x;
        int paddingLeft = this.O.getPaddingLeft();
        if (j0Var.f77139e && (i12 = j0Var.f77155m - i5) < paddingLeft * 4) {
            iWidth = i12 / 2;
        } else if (i5 >= rect.width()) {
            iWidth = rect.left + ((rect.width() - i5) / 2);
        }
        if (i11 >= rect.height()) {
            iMax = ((rect.height() - i11) / 2) + rect.top;
        } else {
            Rect rectC = j0Var.c();
            iWidth = Math.max(rectC.left, Math.min(iWidth, rectC.right - i5));
            iMax = Math.max(rectC.top, Math.min(i13, rectC.bottom - i11));
        }
        iArr[0] = iWidth;
        iArr[1] = iMax;
    }

    public final py.a i1() {
        py.a aVar = this.O0;
        if (aVar != null) {
            return aVar;
        }
        Intrinsics.m("dayNightContext");
        throw null;
    }

    public final int j1() {
        FolderIcon folderIcon;
        Rect rect = Folder.f21093j0;
        Folder folder = (Folder) o9.a.P(this, 1);
        Object tag = (folder == null || (folderIcon = folder.f21116p) == null) ? null : folderIcon.getTag();
        ga.c cVar = tag instanceof ga.c ? (ga.c) tag : null;
        Integer numValueOf = cVar != null ? Integer.valueOf(cVar.f57289a) : null;
        if (numValueOf != null && numValueOf.intValue() == -1) {
            numValueOf = cVar != null ? Integer.valueOf(cVar.T0()) : null;
        }
        if (numValueOf != null) {
            return numValueOf.intValue();
        }
        return -1;
    }

    public final f k1() {
        f fVar = this.H0;
        if (fVar != null) {
            return fVar;
        }
        Intrinsics.m("statusBar");
        throw null;
    }

    @Override // za.d
    public final tz.k l() {
        tz.k kVar = this.U0;
        if (kVar != null) {
            return kVar;
        }
        Intrinsics.m("novaColorSchemeManager");
        throw null;
    }

    @Override // o9.k
    public final void l0(String str, String str2, Rect rect, Bundle bundle, UserHandle userHandle) {
        super.l0(str, str2, rect, bundle, userHandle);
        long jC = ((ja.h) ja.h.f69294h.h(this)).c(userHandle);
        q0 q0Var = this.f45658f1;
        q0Var.getClass();
        db0.m mVar = db0.c0.Companion;
        long jCurrentTimeMillis = System.currentTimeMillis();
        mVar.getClass();
        f0.Companion.getClass();
        q0Var.c(new db0.v(e0.a(str), e0.a(str2), jC, jCurrentTimeMillis));
        Context context = g0.f77088a;
        w wVarC = g0.c();
        t70.m0.t(wVarC.f57003b, null, null, new g20.v(wVarC, str2, str, jC, ic.b.W(f1()), null), 3);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0, types: [kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r1v1 */
    /* JADX WARN: Type inference failed for: r1v2, types: [mx.c0] */
    /* JADX WARN: Type inference failed for: r1v3 */
    public final void l1(mx.c0 c0Var, View view, Intent intent, s2 s2Var) {
        Intent intent2;
        String strD;
        int iHashCode;
        boolean z11 = view instanceof DragLayer;
        ?? C = 0;
        C = 0;
        View view2 = z11 ? null : view;
        s2 s2Var2 = s2Var != null ? s2Var : null;
        switch (c0Var) {
            case NONE:
            case NOVA_SETTINGS:
                return;
            case APP_DRAWER:
                if (view instanceof BubbleTextView) {
                    BubbleTextView bubbleTextView = (BubbleTextView) view;
                    Object tag = bubbleTextView.getTag();
                    ga.j jVar = tag instanceof ga.j ? (ga.j) tag : null;
                    if (jVar != null && (intent2 = jVar.f57322x) != null) {
                        C = mx.c0.c(intent2);
                    }
                    if (C == mx.c0.APP_DRAWER) {
                        bubbleTextView.setHapticFeedbackEnabled(true);
                        bubbleTextView.performHapticFeedback(1);
                        bubbleTextView.setHapticFeedbackEnabled(false);
                    }
                }
                this.M.h(l2.o);
                return;
            case TOGGLE_STATUS_BAR:
                s1(!((Boolean) y2.f51877a.w1().l()).booleanValue(), true);
                return;
            case EXPAND_STATUS_BAR:
                k1().a();
                return;
            case EXPAND_STATUS_SETTINGS_BAR:
                k1().b();
                return;
            case SHOW_PREVIEWS:
                this.M.h(l2.f79978s);
                return;
            case GOTO_DEFAULT_SCREEN:
                Hotseat hotseat = this.T;
                hotseat.n0(hotseat.y0(), false);
                Workspace workspace = this.O;
                workspace.l0(workspace.K0());
                return;
            case GOTO_SCREEN:
                int intExtra = intent != null ? intent.getIntExtra("PAGE_NUMBER", ((Number) y2.f51877a.t().l()).intValue()) : ((Number) y2.f51877a.t().l()).intValue();
                Workspace workspace2 = this.O;
                int iE0 = kotlin.ranges.a.e0(intExtra, 0, workspace2 != null ? workspace2.getChildCount() : 0);
                o9.a.M(this, false, 1);
                if (hasWindowFocus() || SystemClock.uptimeMillis() - this.f80024y0 < 250) {
                    Workspace workspace3 = this.O;
                    if (workspace3 != null) {
                        workspace3.l0(iE0);
                        return;
                    }
                    return;
                }
                Workspace workspace4 = this.O;
                if (workspace4 != null) {
                    workspace4.n0(iE0, true);
                    return;
                }
                return;
            case VOICE_SEARCH:
                Intent intent3 = new Intent("android.intent.action.VOICE_ASSIST");
                intent3.setFlags(268468224);
                intent3.setPackage("com.google.android.googlequicksearchbox");
                try {
                    try {
                        startActivity(intent3, null);
                        return;
                    } catch (ActivityNotFoundException e3) {
                        Intent intent4 = new Intent(intent3);
                        if (intent4.getPackage() == null) {
                            throw e3;
                        }
                        intent4.setPackage(null);
                        startActivity(intent4);
                        return;
                    }
                } catch (Exception unused) {
                    intent3.setAction("android.intent.action.VOICE_COMMAND");
                    try {
                        try {
                            startActivity(intent3, null);
                        } catch (ActivityNotFoundException e11) {
                            Intent intent5 = new Intent(intent3);
                            if (intent5.getPackage() == null) {
                                throw e11;
                            }
                            intent5.setPackage(null);
                            startActivity(intent5);
                        }
                        Unit unit = Unit.f71706a;
                        return;
                    } catch (Exception unused2) {
                        Intent intent6 = new Intent("android.speech.action.WEB_SEARCH");
                        intent6.setFlags(268435456);
                        q0(null, intent6, null);
                        return;
                    }
                }
            case ASSIST:
                cl.l0.R(this);
                return;
            case TOGGLE_DOCK:
                w1();
                return;
            case TEXT_SEARCH:
                onSearchRequested();
                return;
            case SHOW_RECENT_APPS:
                f fVarK1 = k1();
                NovaAccessibilityService novaAccessibilityServiceA = NovaAccessibilityService.a();
                if (novaAccessibilityServiceA != null) {
                    novaAccessibilityServiceA.performGlobalAction(3);
                    return;
                } else {
                    fVarK1.c();
                    return;
                }
            case OPEN_FOLDER:
            case FIRST_ITEM_IN_FOLDER:
            case GOOGLE_NOW:
            case WEATHER:
                throw new IllegalStateException("Cannot invoke virtual NovaAction");
            case APP_SEARCH:
                if (z11 && s2Var2 != null && ((iHashCode = (strD = s2Var2.d()).hashCode()) == -889580739 ? strD.equals("gesture_swipe_down") : iHashCode == 422560647 ? strD.equals("gesture_two_finger_scroll_down") : !(iHashCode != 1964956763 || !strD.equals("gesture_double_tap_swipe_down")))) {
                    DragLayer dragLayer = this.P;
                    dragLayer.setTag(2131428380, new int[]{dragLayer.getWidth() / 2, -w20.e.k(100)});
                }
                if ((view instanceof BubbleTextView) || (view instanceof l10.o)) {
                    o2.f fVar = pp.f0.f82722a;
                } else {
                    ps.j.k(s2Var != null ? s2Var.d() : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                }
                t1(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                return;
            case SCREEN_OFF:
                t70.m0.t(this, null, null, new s3(this, s2Var2, (Continuation) C, 16), 3);
                return;
            case SET_DEFAULT_LAUNCHER:
                HomeReset.e(this, false);
                return;
            case PLAY_STORE:
                Intent intent7 = new Intent("android.intent.action.MAIN");
                intent7.addCategory("android.intent.category.LAUNCHER");
                intent7.setPackage("com.android.vending");
                q0(view2, intent7, null);
                return;
            case GOOGLE_LENS:
            case DATE:
                q0(view2, c0Var.b(), null);
                return;
            case GOOGLE_SEARCH:
                Intent intent8 = new Intent(mx.c0.GOOGLE_SEARCH.b());
                intent8.setFlags(268435456);
                try {
                    startActivity(intent8, null);
                    Unit unit2 = Unit.f71706a;
                    return;
                } catch (ActivityNotFoundException unused3) {
                    intent8.setPackage("com.google.android.apps.searchlite");
                    try {
                        startActivity(intent8, null);
                        Unit unit3 = Unit.f71706a;
                        return;
                    } catch (ActivityNotFoundException unused4) {
                        q0(null, new Intent("android.intent.action.VIEW", Uri.parse("https://google.com")), null);
                        return;
                    }
                }
            case NOVA_NOW:
                if (this.f79929s) {
                    X0();
                    return;
                } else {
                    this.I.post(new kz.j(this, 4));
                    return;
                }
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    public final void n1(boolean z11) {
        AppSearchFloatingView appSearchFloatingViewH1 = h1();
        if (appSearchFloatingViewH1 == null) {
            return;
        }
        appSearchFloatingViewH1.f46175l = false;
        lx.d.d((AlphaOptimizedEditText) appSearchFloatingViewH1.V().f92299d);
        appSearchFloatingViewH1.f46175l = false;
        this.L.g(Intrinsics.b((ra.a) this.M.f85765g, l2.f79974m));
        int i5 = 1;
        if (z11) {
            this.P.getWidth();
            if (appSearchFloatingViewH1.f46174k) {
                NovaLauncher novaLauncher = appSearchFloatingViewH1.f46170g;
                if (novaLauncher == null) {
                    Intrinsics.m("launcher");
                    throw null;
                }
                novaLauncher.P.removeView(appSearchFloatingViewH1);
                ((v9.e) appSearchFloatingViewH1.V().f92298c).f92317a.A();
            } else {
                AnimatorSet animatorSet = appSearchFloatingViewH1.f46173j;
                if (animatorSet != null) {
                    animatorSet.cancel();
                }
                appSearchFloatingViewH1.f46167d = true;
                appSearchFloatingViewH1.f46174k = true;
                int iM = bh.g.M(appSearchFloatingViewH1.getContext(), 48);
                NovaLauncher novaLauncher2 = appSearchFloatingViewH1.f46170g;
                if (novaLauncher2 == null) {
                    Intrinsics.m("launcher");
                    throw null;
                }
                int iJ = c1.j(novaLauncher2, 4);
                ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(appSearchFloatingViewH1, (Property<AppSearchFloatingView, Float>) View.TRANSLATION_Y, -bh.g.M(appSearchFloatingViewH1.getContext(), 16));
                Rect rect = new Rect(iJ, 0, iJ + iM, iM);
                Rect rect2 = new Rect(0, 0, appSearchFloatingViewH1.getMeasuredWidth(), appSearchFloatingViewH1.getMeasuredHeight());
                ViewOutlineProvider outlineProvider = appSearchFloatingViewH1.getOutlineProvider();
                s9.q qVar = outlineProvider instanceof s9.q ? (s9.q) outlineProvider : null;
                if (qVar != null) {
                    qVar.b(rect2);
                }
                rect.offset((rect2.centerX() - iJ) - (iM / 2), bh.g.M(appSearchFloatingViewH1.getContext(), 32));
                if (appSearchFloatingViewH1.f46170g == null) {
                    Intrinsics.m("launcher");
                    throw null;
                }
                y2.f51877a.getClass();
                s9.q qVar2 = new s9.q(rect.width() / 2.0f, c1.j(r14, ((Number) y2.R().l()).intValue()), rect, rect2);
                qVar2.c(1.0f);
                appSearchFloatingViewH1.setOutlineProvider(qVar2);
                ViewOutlineProvider outlineProvider2 = appSearchFloatingViewH1.getOutlineProvider();
                Intrinsics.e(outlineProvider2, "null cannot be cast to non-null type com.android.launcher3.anim.RoundedRectRevealOutlineProvider");
                ValueAnimator valueAnimatorA = ((s9.q) outlineProvider2).a(appSearchFloatingViewH1, true);
                DecelerateInterpolator decelerateInterpolator = s9.k.f86792e;
                valueAnimatorA.setInterpolator(decelerateInterpolator);
                valueAnimatorA.setDuration((long) (200 * 0.6f));
                objectAnimatorOfFloat.setStartDelay(0L);
                objectAnimatorOfFloat.setDuration(200L);
                objectAnimatorOfFloat.setInterpolator(decelerateInterpolator);
                ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(appSearchFloatingViewH1, (Property<AppSearchFloatingView, Float>) View.ALPHA, 0.0f);
                objectAnimatorOfFloat2.setDuration(200L);
                objectAnimatorOfFloat2.setInterpolator(s9.k.f86795h);
                NovaLauncher novaLauncher3 = appSearchFloatingViewH1.f46170g;
                if (novaLauncher3 == null) {
                    Intrinsics.m("launcher");
                    throw null;
                }
                ObjectAnimator objectAnimatorOfFloat3 = ObjectAnimator.ofFloat(novaLauncher3.P.f21091z, z9.e.f98367f, 0.0f);
                objectAnimatorOfFloat3.setDuration(200L);
                AnimatorSet animatorSet2 = new AnimatorSet();
                animatorSet2.playTogether(objectAnimatorOfFloat, valueAnimatorA, objectAnimatorOfFloat2, objectAnimatorOfFloat3);
                animatorSet2.addListener(new r10.h(appSearchFloatingViewH1, i5));
                animatorSet2.start();
            }
        } else {
            this.P.removeView(appSearchFloatingViewH1);
        }
        this.f80014o0.hideOverlay(true);
    }

    @Override // uy.c0
    public final void o() {
        if (isFinishing()) {
            return;
        }
        runOnUiThread(new kz.j(this, 3));
    }

    public final boolean o1() {
        return h1() != null;
    }

    @Override // o9.n1, o9.l, androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) throws Resources.NotFoundException, PackageManager.NameNotFoundException {
        int i5 = 0;
        if (f45648t1) {
            a1.s(new MigrationKillSwitchExit("onCreate"));
            System.exit(0);
            throw new RuntimeException("System.exit returned normally, while it was supposed to halt JVM.");
        }
        NovaLauncher novaLauncher = f45649u1;
        int i11 = 3;
        if (novaLauncher != null && novaLauncher != this) {
            a1.r(new DuplicateInstanceExit(novaLauncher.isDestroyed()), new m0(novaLauncher, i11));
            mc0.d.f76206a.n("multiple instances, committing suicide (existing=%s isDestroyed=%s)", novaLauncher, Boolean.valueOf(novaLauncher.isDestroyed()));
            System.exit(0);
            throw new RuntimeException("System.exit returned normally, while it was supposed to halt JVM.");
        }
        Continuation continuation = null;
        if (!f45647s1) {
            bundle = null;
        }
        y2 y2Var = y2.f51877a;
        y2Var.getClass();
        if (y2.f51885c == null) {
            Boolean bool = NovaApplication.f45635g;
            fg.a.D(getApplicationContext(), g0.f(getApplicationContext()));
        }
        Context context = g0.f77088a;
        g0.j(getApplicationContext());
        a80.e eVar = y0.f88884a;
        a80.d dVar = a80.d.f488c;
        int i12 = 2;
        t70.m0.t(k0.a(dVar), null, null, new u0(this, continuation, i12), 3);
        this.U0 = u90.b.c(this);
        int i13 = 1;
        this.V0 = l().a((getResources().getConfiguration().uiMode & 48) == 32);
        this.L0.clear();
        this.M0 = bundle != null ? bundle.getInt("novalauncher.open_folder_id", -1) : -1;
        py.c.f83128b.getClass();
        py.c.a();
        if (z1(py.c.d() ? 2 : 1)) {
            recreate();
        }
        this.N0 = bundle != null ? (EditShortcutSavedState) bundle.getParcelable("novalauncher.edit") : null;
        HandlerThread handlerThread = new HandlerThread("NovaLauncherBg");
        this.I0 = handlerThread;
        handlerThread.start();
        HandlerThread handlerThread2 = this.I0;
        Intrinsics.d(handlerThread2);
        lh.i iVar = new lh.i(handlerThread2.getLooper(), i11);
        int i14 = u70.e.f90674a;
        this.J0 = k0.a(new u70.d(iVar, null, false));
        super.onCreate(bundle);
        ox.f fVar = ox.f.f81065a;
        ox.f.f81070f = new WeakReference(this);
        ox.f.f81069e = this.f79934x.f77146h0;
        s2 s2Var = y2.f51878a0;
        KProperty kProperty = y2.f51881b[46];
        s2Var.getClass();
        if (!((Boolean) s2Var.l()).booleanValue()) {
            g30.f.b(this).f(this.L.getWindowToken(), this.J0, 1.0f);
        }
        this.L.f20970d = this.f45656d1;
        this.M.b(new mx.z0(this));
        WorkspacePageIndicator workspacePageIndicator = (WorkspacePageIndicator) this.O.E;
        if (workspacePageIndicator != null) {
            workspacePageIndicator.f21224l = true;
        }
        f45649u1 = this;
        this.H0 = new f(this);
        s1(((Boolean) y2Var.w1().l()).booleanValue(), false);
        b bVar = (b) b.f57016l.h(this);
        this.E0 = bVar;
        if (bVar == null) {
            Intrinsics.m("wallpaperColorInfo");
            throw null;
        }
        a(bVar);
        b bVar2 = this.E0;
        if (bVar2 == null) {
            Intrinsics.m("wallpaperColorInfo");
            throw null;
        }
        bVar2.f57018b.add(this);
        this.L.g(true);
        Hotseat hotseat = this.T;
        e10.g2 g2Var = a3.f51435a;
        int i15 = 8;
        hotseat.setVisibility(g2Var.f51550f ? 0 : 8);
        Z0();
        if (bundle != null) {
            this.V.n(bundle);
            o9.a aVarP = o9.a.P(this, 7471103);
            WidgetsPeekingSheet widgetsPeekingSheet = aVarP instanceof WidgetsPeekingSheet ? (WidgetsPeekingSheet) aVarP : null;
            if (widgetsPeekingSheet != null) {
                widgetsPeekingSheet.t0(bundle);
            }
        }
        this.f45666q1.a(this);
        WindowManager.LayoutParams attributes = getWindow().getAttributes();
        attributes.windowAnimations = ((e10.f) y2.m().l()).f51513b;
        getWindow().setAttributes(attributes);
        ya.j.f97146a.submit(new n0(this, 4));
        String str = m.f93693c ? "com.sec.android.app.clockpackage" : m.f93695e ? "com.android.deskclock" : null;
        if (str != null) {
            new fz.j0(this, new b00.c(i15, this, str));
        }
        this.I.postDelayed(new n0(this, 5), 100L);
        if (!g2Var.f51545a.getBoolean("did_quickstart", false)) {
            startActivity(cl.l0.K());
            finish();
        } else if (mx.h1.b()) {
            ps.l.j(this, g1.e(this));
            p10.c0.P(this);
        } else {
            w20.e0.c(new m0(this, i12));
        }
        if (g2Var.f51545a.getBoolean("show_nova_whatsnew", false)) {
            this.I.postDelayed(new n0(this, 6), 200L);
        }
        t70.m0.t(this, dVar, null, new mx.a1(this, continuation, i5), 2);
        t70.m0.t(this, null, null, new mx.a1(this, continuation, i13), 3);
        t70.m0.t(this, null, null, new r0(14), 3);
        t70.m0.t(this, null, null, new mx.e0(), 3);
        t70.m0.t(this, null, null, new r0(15), 3);
        t70.m0.t(this, null, null, new u0(this, continuation, i13), 3);
    }

    @Override // o9.n1, o9.l, androidx.fragment.app.m0, android.app.Activity
    public final void onDestroy() {
        super.onDestroy();
        k0.c(this, null);
        FloatingIconView.a();
        FloatingSurfaceView.U(true);
        if (oy.c.f81124b) {
            SesameFrontend.disconnect(this);
        }
        oy.c.f81124b = false;
        s sVar = this.f45664o1;
        sVar.getClass();
        int i5 = 0;
        while (true) {
            if (!(i5 < sVar.size())) {
                break;
            }
            int i11 = i5 + 1;
            Folder folder = (Folder) sVar.valueAt(i5);
            ga.c cVar = folder.f21115m;
            if (cVar != null) {
                cVar.a1(folder);
            }
            i5 = i11;
        }
        for (q9.g gVar : this.V.f21024f) {
            int childCount = gVar.f83833g.getChildCount();
            for (int i12 = 0; i12 < childCount; i12++) {
                View childAt = gVar.f83833g.getChildAt(i12);
                if (childAt instanceof FolderIcon) {
                    ((FolderIcon) childAt).h0();
                } else if (childAt instanceof kz.f) {
                    kz.f fVar = (kz.f) childAt;
                    for (int i13 = 0; i13 < fVar.getChildCount(); i13++) {
                        CellLayout cellLayoutU0 = fVar.u0(i13);
                        if (cellLayoutU0 != null) {
                            b3 b3Var = cellLayoutU0.P;
                            for (int i14 = 0; i14 < b3Var.getChildCount(); i14++) {
                                View childAt2 = b3Var.getChildAt(i14);
                                if (childAt2 instanceof FolderIcon) {
                                    ((FolderIcon) childAt2).h0();
                                }
                            }
                        }
                    }
                }
            }
        }
        b bVar = this.E0;
        if (bVar == null) {
            Intrinsics.m("wallpaperColorInfo");
            throw null;
        }
        bVar.f57018b.remove(this);
        d0.f91699e.s(this);
        d dVar = this.J0;
        if (dVar != null) {
            k0.c(dVar, null);
        }
        this.J0 = null;
        HandlerThread handlerThread = this.I0;
        if (handlerThread != null) {
            handlerThread.quit();
        }
        this.I0 = null;
        if (f45649u1 == this) {
            f45649u1 = null;
        }
        i0 i0Var = this.f45666q1;
        i0Var.getClass();
        unregisterReceiver(i0Var);
        i0Var.f93725b = false;
        this.f45658f1.a();
    }

    @Override // o9.n1, g.o, android.app.Activity
    public final void onNewIntent(Intent intent) {
        mx.c0 c0VarC;
        setIntent(intent);
        this.M0 = -1;
        this.N0 = null;
        if (intent.hasExtra("LAUNCHER_ACTION") && (c0VarC = mx.c0.c(intent)) != null) {
            m1(this, c0VarC, null, intent, 10);
            return;
        }
        super.onNewIntent(intent);
        if (intent.getBooleanExtra("fromNovaShortcutHandler", false)) {
            long jUptimeMillis = SystemClock.uptimeMillis() - this.f45665p1;
            if (200 <= jUptimeMillis && jUptimeMillis < 5001) {
                if (Intrinsics.b(f45646r1, HomeReset.b(getPackageManager())) && Settings.Secure.getInt(getContentResolver(), "navigation_mode", 0) == 2) {
                    d9.f fVar = new d9.f(this);
                    fVar.s(getString(2132020345));
                    fVar.e(getString(2132017998));
                    fVar.j(getString(2132018038));
                    fVar.o(2132019504);
                    fVar.n(new mx.r0(this));
                    fVar.p();
                    return;
                }
            }
        }
        this.f45665p1 = 0L;
    }

    @Override // o9.n1, o9.k, androidx.fragment.app.m0, android.app.Activity
    public final void onPause() {
        super.onPause();
        d1();
        ((x20.e) y2.f51877a.U0().l()).d(this);
        if (!"org.kustom.widget".equals(this.f45663n1)) {
            for (ya.k0 k0Var : this.P.f98442i) {
                k0Var.H();
            }
        }
        FloatingSurfaceView.U(true);
        this.I.removeCallbacks(this.i1);
    }

    @Override // o9.n1, androidx.fragment.app.m0, g.o, android.app.Activity
    public final void onRequestPermissionsResult(int i5, String[] strArr, int[] iArr) {
        super.onRequestPermissionsResult(i5, strArr, iArr);
        this.f45658f1.b(this);
    }

    @Override // o9.n1, android.app.Activity
    public final void onRestoreInstanceState(Bundle bundle) {
        if (f45647s1) {
            super.onRestoreInstanceState(bundle);
        }
        f45647s1 = true;
    }

    @Override // o9.n1, ra.h, o9.l, o9.k, androidx.fragment.app.m0, android.app.Activity
    public final void onResume() {
        super.onResume();
        if (f45648t1) {
            a1.s(new MigrationKillSwitchExit("onResume"));
            System.exit(0);
            throw new RuntimeException("System.exit returned normally, while it was supposed to halt JVM.");
        }
        if (this.G0) {
            recreate();
            this.G0 = false;
        } else {
            py.c.f83128b.getClass();
            py.c.a();
            if (z1(py.c.d() ? 2 : 1)) {
                recreate();
            }
        }
        c1();
    }

    @Override // o9.n1, g.o, n4.i, android.app.Activity
    public final void onSaveInstanceState(Bundle bundle) {
        EditShortcutSavedState editShortcutSavedStateZ = this.N0;
        if (editShortcutSavedStateZ == null) {
            EditShortcutFloatingView editShortcutFloatingView = (EditShortcutFloatingView) o9.a.P(this, 1048576);
            editShortcutSavedStateZ = editShortcutFloatingView != null ? editShortcutFloatingView.Z() : null;
        }
        bundle.putParcelable("novalauncher.edit", editShortcutSavedStateZ);
        bundle.putInt("novalauncher.open_folder_id", j1());
        this.V.o(bundle);
        o9.a aVarP = o9.a.P(this, 7471103);
        WidgetsPeekingSheet widgetsPeekingSheet = aVarP instanceof WidgetsPeekingSheet ? (WidgetsPeekingSheet) aVarP : null;
        if (widgetsPeekingSheet != null) {
            widgetsPeekingSheet.u0(bundle);
        }
        super.onSaveInstanceState(bundle);
    }

    @Override // o9.n1, o9.k, androidx.fragment.app.m0, android.app.Activity
    public final void onStart() {
        super.onStart();
        Context context = g0.f77088a;
        g0.i().f80578b = p10.c0.t(this);
        r rVarI = g0.i();
        if (rVarI.f80578b) {
            qp.i iVar = rVarI.f80579c;
            iVar.getClass();
            LocalDate localDateNow = LocalDate.now();
            np.d dVar = (np.d) iVar.f84310d;
            if (dVar != null) {
                long jCurrentTimeMillis = System.currentTimeMillis();
                synchronized (iVar.f84309c) {
                    try {
                        Intrinsics.d(localDateNow);
                        LocalDate localDate = dVar.f78486a;
                        if (!localDateNow.equals(localDate) && (!Intrinsics.b(localDateNow.minusDays(1L), localDate) || jCurrentTimeMillis - dVar.f78494i >= TTAdConstant.AD_MAX_EVENT_TIME)) {
                            iVar.f84310d = iVar.q(localDateNow);
                        }
                        Unit unit = Unit.f71706a;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                dVar.f78496k = pp.l.f82757a;
            }
            long jCurrentTimeMillis2 = System.currentTimeMillis();
            LocalDate localDateNow2 = LocalDate.now();
            if (!Intrinsics.b(rVarI.f80581e, localDateNow2)) {
                rVarI.f80581e = localDateNow2;
                rVarI.f80582f = jCurrentTimeMillis2;
                Random.f71890a.getClass();
                rVarI.f80583g = Random.f71891b.g(10, 60) * 60000;
                rVarI.f80580d = false;
            } else if (!rVarI.f80580d && jCurrentTimeMillis2 - rVarI.f80582f >= rVarI.f80583g) {
                rVarI.f80580d = true;
                t70.m0.t(l1.f88818a, null, null, new g4(rVarI, localDateNow2, null, 16), 3);
            }
        }
        yx.f.f97699c.execute(new n0(this, 7));
    }

    @Override // o9.n1, ra.h, o9.k, androidx.fragment.app.m0, android.app.Activity
    public final void onStop() {
        Hotseat hotseat;
        super.onStop();
        y2.f51877a.getClass();
        y2.N2 = false;
        s2 s2Var = y2.f51908i0;
        KProperty[] kPropertyArr = y2.f51881b;
        KProperty kProperty = kPropertyArr[54];
        s2Var.getClass();
        if (((Boolean) s2Var.l()).booleanValue() && a3.f51435a.f51550f) {
            w1();
        }
        s2 s2Var2 = y2.f51911j0;
        KProperty kProperty2 = kPropertyArr[55];
        s2Var2.getClass();
        if (!((Boolean) s2Var2.l()).booleanValue() && (hotseat = this.T) != null) {
            hotseat.g0(hotseat.y0());
        }
        s2 s2Var3 = y2.C0;
        KProperty kProperty3 = kPropertyArr[75];
        s2Var3.getClass();
        if (((Boolean) s2Var3.l()).booleanValue()) {
            this.M.h(l2.f79974m);
            this.V.q(false);
        }
        c1();
        Context context = g0.f77088a;
        r rVarI = g0.i();
        if (rVarI.f80578b) {
            qp.i iVar = rVarI.f80579c;
            np.d dVar = (np.d) iVar.f84310d;
            if (dVar != null) {
                d dVar2 = (d) iVar.f84308b;
                a80.e eVar = y0.f88884a;
                t70.m0.t(dVar2, a80.d.f488c, null, new h6.w(dVar, iVar, null, 20), 2);
            }
        }
    }

    @Override // o9.n1, o9.k, android.app.Activity, android.view.Window.Callback
    public final void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        Handler handler = this.I;
        if (!z11) {
            handler.removeCallbacks(this.h1);
            d1();
        }
        if (z11) {
            WindowManager.LayoutParams attributes = getWindow().getAttributes();
            if (x7.f.I(attributes.flags, SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING)) {
                attributes.flags &= -536870913;
                getWindow().setAttributes(attributes);
            }
            n0 n0Var = this.i1;
            handler.removeCallbacks(n0Var);
            int i5 = Build.VERSION.SDK_INT;
            if (i5 < 32 || (i5 == 32 && Build.VERSION.PREVIEW_SDK_INT < 1)) {
                handler.postDelayed(n0Var, 400L);
            }
        } else if (this.g1) {
            WindowManager.LayoutParams attributes2 = getWindow().getAttributes();
            if (!x7.f.I(attributes2.flags, SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING)) {
                attributes2.flags |= SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING;
                getWindow().setAttributes(attributes2);
            }
        }
        this.g1 = false;
    }

    @Override // o9.l
    public final void p0() {
        NovaSearchBarView novaSearchBarView = this.K0;
        if (novaSearchBarView != null) {
            this.P.removeView(novaSearchBarView);
        }
        ViewGroup viewGroup = this.A0;
        if (viewGroup != null) {
            this.P.removeView(viewGroup);
        }
        Z0();
        q1();
    }

    public final boolean p1(DoubleShadowBubbleTextView doubleShadowBubbleTextView, boolean z11) {
        doubleShadowBubbleTextView.cancelLongPress();
        Object tag = doubleShadowBubbleTextView.getTag();
        Intrinsics.e(tag, "null cannot be cast to non-null type com.android.launcher3.model.data.ItemInfoWithIcon");
        ga.f fVar = (ga.f) tag;
        NamedIntent namedIntent = z11 ? fVar.f57308v : fVar.f57309w;
        if (!a3.f51435a.f51552h || namedIntent == null) {
            return false;
        }
        String str = (this.f79934x.o() && fVar.f57291c == -101) ? "translationX" : "translationY";
        AnimatorSet animatorSet = new AnimatorSet();
        ObjectAnimator objectAnimatorC = a.a.C(doubleShadowBubbleTextView, str, Arrays.copyOf(new float[]{(z11 ? 1 : -1) * getResources().getDimensionPixelSize(2131165513)}, 1));
        new o9.q0(doubleShadowBubbleTextView);
        objectAnimatorC.setDuration(125L);
        ObjectAnimator objectAnimatorC2 = a.a.C(doubleShadowBubbleTextView, str, Arrays.copyOf(new float[]{0.0f}, 1));
        new o9.q0(doubleShadowBubbleTextView);
        objectAnimatorC2.setDuration(100L);
        animatorSet.play(objectAnimatorC).before(objectAnimatorC2);
        animatorSet.setInterpolator(new DecelerateInterpolator());
        objectAnimatorC2.addListener(new b00.g1(doubleShadowBubbleTextView, 2));
        objectAnimatorC.addListener(new b1(doubleShadowBubbleTextView, z11, fVar, namedIntent, this));
        animatorSet.start();
        return true;
    }

    @Override // uy.c0
    public final void q(q qVar, ComponentKey componentKey) {
        ga.a[] aVarArr;
        Object next;
        q9.p pVar;
        if (qVar.e()) {
            Context context = g0.f77088a;
            r rVarI = g0.i();
            y30.b bVar = qVar.f91752d;
            Intrinsics.d(bVar);
            String strName = bVar.name();
            g.Companion.getClass();
            rVarI.e(new n(strName, op.f.b()));
        }
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        AllAppsContainerView allAppsContainerView = this.V;
        int i5 = 0;
        if (allAppsContainerView == null || (pVar = allAppsContainerView.f21025g) == null || (aVarArr = pVar.f83863c) == null) {
            aVarArr = new ga.a[0];
        }
        if (aVarArr.length != 0) {
            int length = aVarArr.length;
            while (true) {
                if (i5 >= length) {
                    break;
                }
                ga.a aVar = aVarArr[i5];
                if ((aVar instanceof iz.a) && ((iz.a) aVar).c1().equals(qVar)) {
                    objectRef.f71863a = aVar;
                    break;
                }
                i5++;
            }
        }
        Object obj = objectRef.f71863a;
        if (obj != null) {
            Iterator it = ((iz.a) obj).H.iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                ga.j jVar = (ga.j) next;
                if (Intrinsics.b(jVar.i(), componentKey.f21251a) && Intrinsics.b(jVar.o, componentKey.f21252b) && fg.a.F(jVar.f57322x)) {
                    break;
                }
            }
            ga.j jVar2 = (ga.j) next;
            if (jVar2 != null) {
                runOnUiThread(new kz.c(8, objectRef, jVar2));
            }
        }
    }

    @Override // o9.n1, o9.l
    public final boolean q0(View view, Intent intent, ga.e eVar) {
        View view2;
        Ref.ObjectRef objectRef;
        ga.e eVar2;
        String packageName;
        String packageName2;
        NovaLauncher novaLauncher;
        View view3;
        ga.e eVar3;
        aa.n nVar;
        Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
        objectRef2.f71863a = intent;
        mx.c0 c0VarC = mx.c0.c(intent);
        if (c0VarC != null) {
            Intent intent2 = (Intent) objectRef2.f71863a;
            w20.i iVar = eVar instanceof w20.i ? (w20.i) eVar : null;
            l1(c0VarC, view, intent2, iVar != null ? iVar.f0() : null);
            return c0VarC == mx.c0.APP_DRAWER;
        }
        boolean zA = g3.a();
        y2 y2Var = y2.f51877a;
        y2Var.getClass();
        e10.f fVar = (e10.f) y2.m().l();
        if (view != null && fVar.d() && zA) {
            int[] iArr = new int[2];
            if (!(view instanceof DragLayer) || ((Intent) objectRef2.f71863a).getSourceBounds() == null) {
                this.P.j(view, iArr);
                iArr[0] = (view.getMeasuredWidth() / 2) + iArr[0];
                iArr[1] = (view.getMeasuredHeight() / 2) + iArr[1];
            } else {
                Rect sourceBounds = ((Intent) objectRef2.f71863a).getSourceBounds();
                Intrinsics.d(sourceBounds);
                iArr[0] = sourceBounds.centerX();
                Rect sourceBounds2 = ((Intent) objectRef2.f71863a).getSourceBounds();
                Intrinsics.d(sourceBounds2);
                iArr[1] = sourceBounds2.centerY();
            }
            py.c.f83128b.getClass();
            boolean zD = py.c.d();
            int iIntValue = zD ? ((Number) y2Var.P0().l()).intValue() : -1;
            boolean z11 = view instanceof BubbleTextView;
            if (z11 && (nVar = ((BubbleTextView) view).f20869f) != null) {
                iIntValue = nVar.f628c;
            }
            if (zD && v30.e.s(iIntValue) && ((iIntValue >> 16) & 255) >= 208) {
                iIntValue = ((Number) y2Var.P0().l()).intValue();
            }
            if (fVar == e10.f.f51510f) {
                DragLayer dragLayer = this.P;
                dragLayer.C.set(iArr[0], iArr[1]);
                dragLayer.D = iIntValue;
                ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this.P, "circleActivityAnimationProgress", 0.0f, 1.0f);
                ComponentName component = ((Intent) objectRef2.f71863a).getComponent();
                if (component == null || (packageName2 = component.getPackageName()) == null) {
                    packageName2 = ((Intent) objectRef2.f71863a).getPackage();
                }
                boolean zEquals = "com.teslacoilsw.launcher".equals(packageName2);
                boolean z12 = !zEquals;
                if (zEquals) {
                    novaLauncher = this;
                    view3 = view;
                    eVar3 = eVar;
                } else {
                    a80.e eVar4 = y0.f88884a;
                    novaLauncher = this;
                    view3 = view;
                    eVar3 = eVar;
                    t70.m0.t(this, a80.d.f488c, null, new mx.c1(novaLauncher, view3, objectRef2, eVar3, null), 2);
                }
                objectAnimatorOfFloat.setDuration(280L);
                objectAnimatorOfFloat.setInterpolator(zx.d.f98808d);
                objectAnimatorOfFloat.start();
                View view4 = view3;
                NovaLauncher novaLauncher2 = novaLauncher;
                objectAnimatorOfFloat.addListener(new mx.d1(z12, novaLauncher2, view4, objectRef2, eVar3));
                novaLauncher2.f45661l1 = objectAnimatorOfFloat;
                return true;
            }
            view2 = view;
            objectRef = objectRef2;
            eVar2 = eVar;
            if (fVar == e10.f.f51509e && z11) {
                ComponentName component2 = ((Intent) objectRef.f71863a).getComponent();
                if (component2 == null || (packageName = component2.getPackageName()) == null) {
                    packageName = ((Intent) objectRef.f71863a).getPackage();
                }
                if (!"com.teslacoilsw.launcher".equals(packageName)) {
                    i30.j.F(this, view2, new b10.q(29, this, objectRef, eVar2)).start();
                    return true;
                }
            }
        } else {
            view2 = view;
            objectRef = objectRef2;
            eVar2 = eVar;
        }
        return Y0(view2, (Intent) objectRef.f71863a, eVar2);
    }

    public final void q1() throws Resources.NotFoundException {
        float f11;
        AllAppsContainerView allAppsContainerView = this.V;
        Object obj = allAppsContainerView != null ? allAppsContainerView.f21030l : null;
        NovaAppDrawerSearchBar novaAppDrawerSearchBar = obj instanceof NovaAppDrawerSearchBar ? (NovaAppDrawerSearchBar) obj : null;
        if (novaAppDrawerSearchBar != null) {
            novaAppDrawerSearchBar.l();
        }
        LauncherRootView launcherRootView = this.L;
        if (launcherRootView != null) {
            launcherRootView.f();
            this.M.n(true);
        }
        boolean z11 = this.T.getVisibility() == 0;
        e10.g2 g2Var = a3.f51435a;
        boolean z12 = g2Var.f51550f;
        if (z11 != z12) {
            ViewGroup.LayoutParams layoutParams = this.T.getLayoutParams();
            Intrinsics.e(layoutParams, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams");
            FrameLayout.LayoutParams layoutParams2 = (FrameLayout.LayoutParams) layoutParams;
            float f12 = layoutParams2.bottomMargin + layoutParams2.height;
            if (z12) {
                this.T.setTranslationY(f12);
                this.T.setVisibility(0);
                f11 = 0.0f;
            } else {
                f11 = f12;
            }
            y2 y2Var = y2.f51877a;
            y2Var.getClass();
            if (((Boolean) y2.F().l()).booleanValue()) {
                if (((sy.c) y2Var.B().l()).f87828c) {
                    this.X.setTranslationY(z12 ? f12 : 0.0f);
                    this.X.animate().translationY(f11).withEndAction(new kz.j(this, 1));
                }
                if (((j3) y2Var.q1().l()).g()) {
                    final float f13 = l2.f79974m.g(this).f16155b;
                    View view = this.V.f21031m;
                    if (!z12) {
                        f12 = 0.0f;
                    }
                    view.setTranslationY(f12 + f13);
                    this.V.f21031m.animate().translationY(f11).withEndAction(new Runnable() { // from class: mx.q0
                        @Override // java.lang.Runnable
                        public final void run() {
                            ComponentName componentName = NovaLauncher.f45646r1;
                            this.f77230a.V.f21031m.setTranslationY(f13);
                        }
                    });
                }
                this.T.animate().translationY(f11).withEndAction(new kz.j(this, 2));
            } else {
                this.T.setTranslationY(0.0f);
                this.T.setVisibility(g2Var.f51550f ? 0 : 8);
            }
            y1();
        }
    }

    public final void r1() {
        Folder folder;
        if (!this.f79930t || this.Z || this.M0 == -1) {
            return;
        }
        View viewL0 = this.O.L0(new mx.r0(this));
        FolderIcon folderIcon = viewL0 instanceof FolderIcon ? (FolderIcon) viewL0 : null;
        if (folderIcon != null && (folder = folderIcon.H) != null) {
            folder.f21116p = folderIcon;
            folder.U(0, folder.f21115m.H, false);
        }
        this.M0 = -1;
    }

    public final void s1(boolean z11, boolean z12) {
        if (z11) {
            getWindow().clearFlags(1024);
        } else {
            getWindow().addFlags(1024);
        }
        if (Build.VERSION.SDK_INT >= 28) {
            getWindow().getAttributes().layoutInDisplayCutoutMode = this.f79934x.G0;
        }
        mc0.d.f76206a.m("TODO setForceSetInsets", new Object[0]);
        if (z12) {
            y2.f51877a.w1().h(Boolean.valueOf(z11));
        }
    }

    @Override // android.app.Activity, android.content.ContextWrapper, android.content.Context
    public final void startActivity(Intent intent, Bundle bundle) {
        Intent intent2;
        try {
            super.startActivity(intent, bundle);
        } catch (SecurityException e3) {
            if (!m.b(intent)) {
                throw e3;
            }
            if (m.b(intent)) {
                intent2 = new Intent("android.intent.action.CALL", intent.getData());
                intent2.setFlags(67108864 | intent.getFlags());
            } else {
                intent2 = intent;
            }
            super.startActivity(intent2, bundle);
        }
        if (intent.getComponent() != null) {
            ComponentName component = intent.getComponent();
            Intrinsics.d(component);
            String packageName = component.getPackageName();
            ComponentName component2 = intent.getComponent();
            Intrinsics.d(component2);
            String className = component2.getClassName();
            long jC = ((ja.h) ja.h.f69294h.h(this)).c(Process.myUserHandle());
            q0 q0Var = this.f45658f1;
            q0Var.getClass();
            db0.m mVar = db0.c0.Companion;
            long jCurrentTimeMillis = System.currentTimeMillis();
            mVar.getClass();
            f0.Companion.getClass();
            q0Var.c(new db0.s(e0.a(packageName), e0.a(className), jC, jCurrentTimeMillis));
        }
    }

    @Override // o9.n1, g.o, android.app.Activity
    public final void startActivityForResult(Intent intent, int i5, Bundle bundle) {
        ComponentName component = intent.getComponent();
        if (Intrinsics.b(component != null ? component.getPackageName() : null, "ninja.sesame.app.edge")) {
            ComponentName component2 = intent.getComponent();
            if (Intrinsics.b(component2 != null ? component2.getClassName() : null, "ninja.sesame.app.edge.bridge.LinkRelayActivity")) {
                intent = SesameFrontend.addPackageAuth(this, new Intent(intent));
            }
        }
        h();
        try {
            super.startActivityForResult(intent, i5, bundle);
        } catch (SecurityException e3) {
            e3.printStackTrace();
            if (!Intrinsics.b(intent.getAction(), "android.intent.action.CALL")) {
                throw e3;
            }
            mc0.d.f76206a.p(e3, "Exception for ACTION_CALL", new Object[0]);
            this.W0.c();
        }
    }

    @Override // o9.n1, android.app.Activity
    public final void startSearch(String str, boolean z11, Bundle bundle, boolean z12) {
        if (!t0(l2.o)) {
            y2.f51877a.getClass();
            l10.n nVar = (l10.n) b70.g.Y0(((l10.w) y2.z().l()).f74466c);
            if ((nVar != null ? nVar.f74437a : null) != mx.c0.APP_SEARCH) {
                super.startSearch(str, z11, bundle, z12);
                return;
            }
        }
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        o2.f fVar = pp.f0.f82722a;
        t1(str);
    }

    public final void t1(String str) {
        y2.f51877a.getClass();
        if (((Boolean) y2.G0().l()).booleanValue()) {
            this.M.j(l2.o, true, 0L, new a5.h1(2, this, str));
            return;
        }
        if (o1()) {
            return;
        }
        this.L.g(false);
        if (!g3.a()) {
            AppSearchFloatingView.f46165m.c(this);
            return;
        }
        AppSearchFloatingView appSearchFloatingViewB = r10.g.b(AppSearchFloatingView.f46165m, this, 0.0f, 6);
        ((AlphaOptimizedEditText) appSearchFloatingViewB.V().f92299d).setText(str);
        appSearchFloatingViewB.U();
    }

    @Override // o9.n1, o9.y0
    public final void v(boolean z11) {
        a80.e eVar = y0.f88884a;
        t70.m0.t(this, y70.o.f96819a, null, new ay.d(this, z11, (Continuation) null, 6), 2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void v1(ga.c cVar) {
        ComponentName component;
        if (cVar instanceof iz.a) {
            Intent intent = new Intent(this, (Class<?>) GroupAppListActivity.class);
            iz.a aVar = (iz.a) cVar;
            aVar.c1();
            intent.putExtra("groupId", aVar.c1().f91753e);
            this.f45655c1.a(intent, null);
            return;
        }
        ArrayList<? extends Parcelable> arrayList = new ArrayList<>(cVar.H.size());
        int size = cVar.H.size();
        for (int i5 = 0; i5 < size; i5++) {
            ga.j jVar = (ga.j) cVar.H.get(i5);
            Intent intent2 = jVar.f57322x;
            if (intent2 != null && (component = intent2.getComponent()) != null) {
                ComponentKey componentKey = new ComponentKey(component, jVar.o);
                if (fg.a.F(jVar.f57322x) && !arrayList.contains(componentKey)) {
                    arrayList.add(componentKey);
                }
            }
        }
        Intent intent3 = new Intent("android.intent.action.CREATE_SHORTCUT");
        intent3.setComponent(BulkAddAppActivity.f45579v);
        intent3.putExtra("desktopSpacesAvailable", -1);
        intent3.putExtra("editFolder", cVar.f57289a);
        intent3.putParcelableArrayListExtra("existingApps", arrayList);
        this.f80010k0 = new PendingRequestArgs(cVar);
        startActivityForResult(intent3, 1014);
    }

    public final void w1() {
        c9.q(a3.f51435a.f51545a, "dock_enable", !r0.f51550f);
        y2.f51877a.getClass();
        if (((Boolean) y2.F().l()).booleanValue()) {
            p0();
        } else {
            ((z0) z0.f80267w.h(this)).h(this);
        }
    }

    public final void y1() throws Resources.NotFoundException {
        int iB;
        int i5;
        ViewGroup.LayoutParams layoutParams;
        ViewGroup.LayoutParams layoutParams2;
        int dimensionPixelSize = getResources().getDimensionPixelSize(2131165544);
        y2 y2Var = y2.f51877a;
        y2Var.getClass();
        s2 s2Var = y2.f51915k0;
        KProperty[] kPropertyArr = y2.f51881b;
        KProperty kProperty = kPropertyArr[57];
        s2Var.getClass();
        if (((Number) s2Var.l()).intValue() == -1 || ((Number) y2Var.G().l()).intValue() <= -100) {
            int i11 = NovaAppDrawerSearchBar.f45803w;
            iB = jz.g.b(this, this.f79934x, 0, ((fz.d) y2.f51877a.i().l()).d());
        } else {
            KProperty kProperty2 = kPropertyArr[57];
            s2Var.getClass();
            iB = c1.j(this, ((Number) s2Var.l()).intValue());
        }
        ViewGroup viewGroup = this.A0;
        if (viewGroup != null) {
            viewGroup.setPadding(iB, 0, iB, 0);
        }
        if (this.f79934x.o()) {
            ViewGroup viewGroup2 = this.A0;
            if (viewGroup2 != null && (layoutParams = viewGroup2.getLayoutParams()) != null) {
                layoutParams.width = dimensionPixelSize;
            }
            i5 = this.f79934x.n;
        } else {
            ViewGroup viewGroup3 = this.A0;
            if (viewGroup3 != null && (layoutParams2 = viewGroup3.getLayoutParams()) != null) {
                layoutParams2.height = dimensionPixelSize;
            }
            i5 = this.f79934x.f77155m;
        }
        int i12 = i5 - (iB * 2);
        ViewGroup viewGroup4 = this.A0;
        View childAt = viewGroup4 != null ? viewGroup4.getChildAt(0) : null;
        o oVar = childAt instanceof o ? (o) childAt : null;
        if (oVar != null) {
            oVar.setVisibility(a3.f51435a.f51550f ? 0 : 8);
        }
        if (oVar != null) {
            oVar.updateAppWidgetSize(null, i12, dimensionPixelSize, i12, dimensionPixelSize);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x006d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean z1(int r5) {
        /*
            r4 = this;
            r0 = -1
            r1 = 1
            if (r5 == r0) goto L20
            if (r5 == r1) goto L1d
            r0 = 2
            if (r5 == r0) goto L1a
            android.content.Context r5 = r4.getApplicationContext()
            android.content.res.Resources r5 = r5.getResources()
            android.content.res.Configuration r5 = r5.getConfiguration()
            int r5 = r5.uiMode
        L17:
            r5 = r5 & 48
            goto L2f
        L1a:
            r5 = 32
            goto L2f
        L1d:
            r5 = 16
            goto L2f
        L20:
            android.content.Context r5 = r4.getApplicationContext()
            android.content.res.Resources r5 = r5.getResources()
            android.content.res.Configuration r5 = r5.getConfiguration()
            int r5 = r5.uiMode
            goto L17
        L2f:
            android.content.res.Configuration r0 = new android.content.res.Configuration
            r0.<init>()
            r2 = 0
            r0.fontScale = r2
            int r2 = r0.uiMode
            r2 = r2 & (-49)
            r5 = r5 | r2
            r0.uiMode = r5
            android.content.res.Resources r5 = r4.getResources()
            android.content.res.Configuration r5 = r5.getConfiguration()
            int r5 = r5.uiMode
            r5 = r5 & 48
            int r0 = r0.uiMode
            r0 = r0 & 48
            if (r5 == r0) goto L6d
            android.content.res.Resources r5 = r4.getResources()
            android.content.res.Configuration r2 = new android.content.res.Configuration
            android.content.res.Configuration r3 = r5.getConfiguration()
            r2.<init>(r3)
            android.content.res.Configuration r3 = r5.getConfiguration()
            int r3 = r3.uiMode
            r3 = r3 & (-49)
            r0 = r0 | r3
            r2.uiMode = r0
            r0 = 0
            r5.updateConfiguration(r2, r0)
            goto L6e
        L6d:
            r1 = 0
        L6e:
            py.a r5 = new py.a
            r0 = 2132083105(0x7f1501a1, float:1.9806343E38)
            r5.<init>(r4, r0)
            r4.O0 = r5
            py.a r5 = r4.i1()
            int r0 = m.s.f75339b
            r5.a(r0)
            py.a r5 = new py.a
            r0 = 2132083106(0x7f1501a2, float:1.9806345E38)
            r5.<init>(r4, r0)
            r4.P0 = r5
            int r0 = m.s.f75339b
            r5.a(r0)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.teslacoilsw.launcher.NovaLauncher.z1(int):boolean");
    }

    @Override // android.app.Activity
    public final void onRestoreInstanceState(Bundle bundle, PersistableBundle persistableBundle) {
        if (f45647s1) {
            super.onRestoreInstanceState(bundle, persistableBundle);
        }
        f45647s1 = true;
    }
}
