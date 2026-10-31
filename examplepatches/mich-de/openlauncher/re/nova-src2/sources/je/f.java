package je;

import a5.a0;
import a5.a1;
import a5.f2;
import a5.h2;
import ads_mobile_sdk.jf3;
import ads_mobile_sdk.of3;
import ads_mobile_sdk.po1;
import ads_mobile_sdk.to1;
import ads_mobile_sdk.vo1;
import ads_mobile_sdk.xo1;
import ai.k4;
import ai.y0;
import android.content.Context;
import android.location.Location;
import android.os.Parcel;
import android.os.RemoteException;
import android.view.MotionEvent;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import b.c0;
import b.u4;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.popup.PopupContainerWithArrow;
import com.android.launcher3.secondarydisplay.SecondaryDisplayLauncher;
import com.android.launcher3.secondarydisplay.SecondaryDragLayer;
import com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAdInteractionListener;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAdInteractionListener;
import com.bytedance.sdk.openadsdk.api.open.PAGAppOpenAdInteractionListener;
import com.bytedance.sdk.openadsdk.api.reward.PAGRewardItem;
import com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAdInteractionListener;
import com.google.android.exoplayer2.drm.DrmSession$DrmSessionException;
import com.google.android.gms.location.LocationResult;
import com.teslacoilsw.launcher.widget.DumbRadioGrid;
import com.vungle.ads.nativead.NativeVideoListener;
import cw.r;
import eg.v;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.text.Collator;
import java.util.ArrayDeque;
import java.util.List;
import java.util.Objects;
import java.util.UUID;
import java.util.WeakHashMap;
import kd.k;
import kd.m;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import nb0.u;
import o9.l0;
import rg.i;
import rg.j;
import sg.j0;
import sg.w;
import t70.m0;
import x9.h;
import ya.k0;

/* loaded from: classes3.dex */
public final class f implements kk.c, h, PAGAppOpenAdInteractionListener, PAGInterstitialAdInteractionListener, PAGNativeAdInteractionListener, PAGRewardedAdInteractionListener, l30.c, a0, ib0.f, NativeVideoListener, fi.h, j, k0 {

    /* renamed from: c, reason: collision with root package name */
    public static Method f69485c;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f69486a;

    /* renamed from: b, reason: collision with root package name */
    public Object f69487b;

    public /* synthetic */ f(int i5, boolean z11) {
        this.f69486a = i5;
    }

    private final void q() {
    }

    public void A(long j11) throws IOException {
        long jB = B();
        if (jB != j11) {
            if (jB != -1) {
                if (jB != -2) {
                    return;
                } else {
                    jB = -2;
                }
            }
            StringBuilder sbU = c0.u(j11, "expected non-string scope or scope ", " but found ");
            sbU.append(jB);
            throw new IOException(sbU.toString());
        }
    }

    public long B() {
        ArrayDeque arrayDeque = (ArrayDeque) this.f69487b;
        if (arrayDeque.isEmpty()) {
            return 0L;
        }
        return ((Long) arrayDeque.peek()).longValue();
    }

    @Override // l30.c
    public void a(DumbRadioGrid dumbRadioGrid, int i5) {
        ((Function2) this.f69487b).invoke(dumbRadioGrid, Integer.valueOf(i5));
    }

    @Override // x9.h
    public void b(l0 l0Var) {
        PopupContainerWithArrow popupContainerWithArrow = (PopupContainerWithArrow) this.f69487b;
        if (popupContainerWithArrow.f71266x) {
            BubbleTextView bubbleTextView = popupContainerWithArrow.Q;
            if (bubbleTextView.f20871h != 5) {
                bubbleTextView.a(false);
            }
            popupContainerWithArrow.Q.setVisibility(0);
        } else {
            BubbleTextView bubbleTextView2 = popupContainerWithArrow.Q;
            if (bubbleTextView2.f20871h != 5) {
                bubbleTextView2.setVisibility(4);
            }
        }
        if (popupContainerWithArrow.Q.f20871h == 5) {
            l0Var.f79954f.setAlpha(0.0f);
        }
    }

    public void c(gf.a0 a0Var) {
    }

    public r d() {
        return (r) this.f69487b;
    }

    @Override // rg.j
    public void e(Object obj) {
        switch (this.f69486a) {
            case 24:
                oh.b bVar = (oh.b) obj;
                LocationResult locationResult = (LocationResult) this.f69487b;
                fi.j jVar = bVar.f80415a;
                List list = locationResult.f33712f;
                int size = list.size();
                jVar.c(size == 0 ? null : (Location) list.get(size - 1));
                try {
                    oh.h hVar = bVar.f80416b;
                    w.f("GetCurrentLocation", "Listener type must not be empty");
                    hVar.b(new i(bVar, "GetCurrentLocation"), false, new fi.j());
                    break;
                } catch (RemoteException unused) {
                    return;
                }
            default:
                ((fi.j) ((oh.g) this.f69487b).f80424b.f80413c).c(null);
                break;
        }
    }

    @Override // x9.h
    public void f(l0 l0Var, boolean z11) {
        PopupContainerWithArrow popupContainerWithArrow = (PopupContainerWithArrow) this.f69487b;
        popupContainerWithArrow.Q.a(true);
        if (z11) {
            if (l0Var.f79954f.getAlpha() == 0.0f) {
                l0Var.f79954f.setAlpha(1.0f);
            }
            popupContainerWithArrow.Q.setVisibility(4);
            return;
        }
        if (!popupContainerWithArrow.f71266x) {
            popupContainerWithArrow.Q.setVisibility(0);
            BubbleTextView bubbleTextView = popupContainerWithArrow.Q;
            bubbleTextView.getClass();
            bubbleTextView.P(0.0f);
        }
        popupContainerWithArrow.setImportantForAccessibility(1);
        View viewN = popupContainerWithArrow.N();
        if (viewN != null) {
            viewN.performAccessibilityAction(64, null);
        }
    }

    @Override // x9.h
    public boolean g(double d5) {
        return d5 > ((double) ((PopupContainerWithArrow) this.f69487b).P);
    }

    public p8.f h() {
        p8.b bVarC;
        y0 y0Var = (y0) this.f69487b;
        p8.d dVar = (p8.d) y0Var.f13477e;
        synchronized (dVar) {
            y0Var.h(true);
            bVarC = dVar.c(((p8.a) y0Var.f13475c).f82420a);
        }
        if (bVarC != null) {
            return new p8.f(bVarC, 0);
        }
        return null;
    }

    public Throwable i() {
        return (Throwable) this.f69487b;
    }

    @Override // ib0.f
    public void j(long j11) {
        switch (this.f69486a) {
            case 19:
                nb0.f fVar = (nb0.f) this.f69487b;
                if (j11 > 0) {
                    fVar.f78117g.j(j11);
                    return;
                }
                fVar.getClass();
                if (j11 < 0) {
                    throw new IllegalArgumentException(u4.g(j11, "n >= 0 required but it was "));
                }
                return;
            default:
                u uVar = (u) this.f69487b;
                if (j11 > 0) {
                    jk.b.A(uVar.f78164j, j11);
                    uVar.i();
                    return;
                }
                return;
        }
    }

    @Override // ya.k0
    public boolean k(MotionEvent motionEvent) {
        return false;
    }

    @Override // ya.k0
    public boolean l(MotionEvent motionEvent) {
        SecondaryDragLayer secondaryDragLayer = (SecondaryDragLayer) this.f69487b;
        int i5 = SecondaryDragLayer.f21236t;
        Object obj = secondaryDragLayer.f98440g;
        if (!((SecondaryDisplayLauncher) obj).N || o9.a.P((za.d) obj, 7471103) != null || motionEvent.getAction() != 0 || secondaryDragLayer.m(((SecondaryDisplayLauncher) obj).K, motionEvent)) {
            return false;
        }
        ((SecondaryDisplayLauncher) obj).t0(false);
        return true;
    }

    public DrmSession$DrmSessionException m() {
        return (DrmSession$DrmSessionException) this.f69487b;
    }

    public UUID o() {
        return fe.f.f54753a;
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGAdListener
    public void onAdClicked() {
        switch (this.f69486a) {
            case 3:
                po1 po1Var = ((kd.c) this.f69487b).f71336e;
                if (po1Var != null) {
                    po1Var.reportAdClicked();
                    break;
                }
                break;
            case 4:
                to1 to1Var = ((kd.h) this.f69487b).f71355e;
                if (to1Var != null) {
                    to1Var.reportAdClicked();
                    break;
                }
                break;
            case 5:
                vo1 vo1Var = ((k) this.f69487b).f71362q;
                if (vo1Var != null) {
                    vo1Var.reportAdClicked();
                    break;
                }
                break;
            default:
                v vVar = ((m) this.f69487b).f71369e;
                if (vVar != null) {
                    ((xo1) vVar).reportAdClicked();
                    break;
                }
                break;
        }
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGAdListener
    public void onAdDismissed() {
        switch (this.f69486a) {
            case 3:
                po1 po1Var = ((kd.c) this.f69487b).f71336e;
                if (po1Var != null) {
                    po1Var.f8345a.b();
                    break;
                }
                break;
            case 4:
                to1 to1Var = ((kd.h) this.f69487b).f71355e;
                if (to1Var != null) {
                    to1Var.onAdClosed();
                    break;
                }
                break;
            case 5:
                break;
            default:
                v vVar = ((m) this.f69487b).f71369e;
                if (vVar != null) {
                    ((xo1) vVar).onAdClosed();
                    break;
                }
                break;
        }
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGAdListener
    public void onAdShowed() {
        switch (this.f69486a) {
            case 3:
                kd.c cVar = (kd.c) this.f69487b;
                po1 po1Var = cVar.f71336e;
                if (po1Var != null) {
                    po1Var.onAdOpened();
                    cVar.f71336e.reportAdImpression();
                    break;
                }
                break;
            case 4:
                kd.h hVar = (kd.h) this.f69487b;
                to1 to1Var = hVar.f71355e;
                if (to1Var != null) {
                    to1Var.onAdOpened();
                    hVar.f71355e.reportAdImpression();
                    break;
                }
                break;
            case 5:
                vo1 vo1Var = ((k) this.f69487b).f71362q;
                if (vo1Var != null) {
                    vo1Var.reportAdImpression();
                    break;
                }
                break;
            default:
                m mVar = (m) this.f69487b;
                v vVar = mVar.f71369e;
                if (vVar != null) {
                    ((xo1) vVar).onAdOpened();
                    ((xo1) mVar.f71369e).reportAdImpression();
                    break;
                }
                break;
        }
    }

    @Override // fi.h
    public void onCanceled() {
        try {
            j0 j0Var = (j0) ((sg.i) this.f69487b);
            Parcel parcelU = j0Var.U();
            try {
                j0Var.f74935b.transact(2, parcelU, null, 1);
            } finally {
                parcelU.recycle();
            }
        } catch (RemoteException unused) {
        }
    }

    @Override // com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAdInteractionListener
    public void onUserEarnedReward(PAGRewardItem pAGRewardItem) {
        v vVar = ((m) this.f69487b).f71369e;
        if (vVar != null) {
            ((xo1) vVar).onUserEarnedReward();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAdInteractionListener
    public void onUserEarnedRewardFail(int i5, String str) {
        new StringBuilder("Failed to reward user: ").append(str);
    }

    @Override // com.vungle.ads.nativead.NativeVideoListener
    public void onVideoEnd() {
        ((nd.e) this.f69487b).n.onVideoComplete();
    }

    @Override // com.vungle.ads.nativead.NativeVideoListener
    public void onVideoMute() {
        vo1 vo1Var = ((nd.e) this.f69487b).n;
        switch (vo1Var.f10838b) {
            case 0:
                of3 of3VarA = vo1Var.f10837a.a();
                if (of3VarA != null) {
                    t70.j0 j0Var = of3VarA.f7910a;
                    jf3 jf3Var = new jf3(of3VarA, null, 1);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    m0.t(j0Var, context, null, new ar.a(jf3Var, null), 2);
                    break;
                }
                break;
            default:
                of3 of3VarA2 = vo1Var.f10837a.a();
                if (of3VarA2 != null) {
                    t70.j0 j0Var2 = of3VarA2.f7910a;
                    jf3 jf3Var2 = new jf3(of3VarA2, null, 1);
                    EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var2, "<this>");
                    Intrinsics.g(context2, "context");
                    m0.t(j0Var2, context2, null, new ar.a(jf3Var2, null), 2);
                    break;
                }
                break;
        }
    }

    @Override // com.vungle.ads.nativead.NativeVideoListener
    public void onVideoPause() {
        vo1 vo1Var = ((nd.e) this.f69487b).n;
        switch (vo1Var.f10838b) {
            case 0:
                of3 of3VarA = vo1Var.f10837a.a();
                if (of3VarA != null) {
                    t70.j0 j0Var = of3VarA.f7910a;
                    jf3 jf3Var = new jf3(of3VarA, null, 2);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    m0.t(j0Var, context, null, new ar.a(jf3Var, null), 2);
                    break;
                }
                break;
            default:
                of3 of3VarA2 = vo1Var.f10837a.a();
                if (of3VarA2 != null) {
                    t70.j0 j0Var2 = of3VarA2.f7910a;
                    jf3 jf3Var2 = new jf3(of3VarA2, null, 2);
                    EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var2, "<this>");
                    Intrinsics.g(context2, "context");
                    m0.t(j0Var2, context2, null, new ar.a(jf3Var2, null), 2);
                    break;
                }
                break;
        }
    }

    @Override // com.vungle.ads.nativead.NativeVideoListener
    public void onVideoPlay() {
        vo1 vo1Var = ((nd.e) this.f69487b).n;
        switch (vo1Var.f10838b) {
            case 0:
                of3 of3VarA = vo1Var.f10837a.a();
                if (of3VarA != null) {
                    t70.j0 j0Var = of3VarA.f7910a;
                    jf3 jf3Var = new jf3(of3VarA, null, 3);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    m0.t(j0Var, context, null, new ar.a(jf3Var, null), 2);
                    break;
                }
                break;
            default:
                of3 of3VarA2 = vo1Var.f10837a.a();
                if (of3VarA2 != null) {
                    t70.j0 j0Var2 = of3VarA2.f7910a;
                    jf3 jf3Var2 = new jf3(of3VarA2, null, 3);
                    EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var2, "<this>");
                    Intrinsics.g(context2, "context");
                    m0.t(j0Var2, context2, null, new ar.a(jf3Var2, null), 2);
                    break;
                }
                break;
        }
    }

    @Override // com.vungle.ads.nativead.NativeVideoListener
    public void onVideoUnmute() {
        vo1 vo1Var = ((nd.e) this.f69487b).n;
        switch (vo1Var.f10838b) {
            case 0:
                of3 of3VarA = vo1Var.f10837a.a();
                if (of3VarA != null) {
                    t70.j0 j0Var = of3VarA.f7910a;
                    jf3 jf3Var = new jf3(of3VarA, null, 4);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    m0.t(j0Var, context, null, new ar.a(jf3Var, null), 2);
                    break;
                }
                break;
            default:
                of3 of3VarA2 = vo1Var.f10837a.a();
                if (of3VarA2 != null) {
                    t70.j0 j0Var2 = of3VarA2.f7910a;
                    jf3 jf3Var2 = new jf3(of3VarA2, null, 4);
                    EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var2, "<this>");
                    Intrinsics.g(context2, "context");
                    m0.t(j0Var2, context2, null, new ar.a(jf3Var2, null), 2);
                    break;
                }
                break;
        }
    }

    public int p() {
        return 1;
    }

    public int r() {
        int i5 = 0;
        for (int i11 = 0; i11 != 32; i11 += 8) {
            int i12 = ((InputStream) this.f69487b).read();
            if (i12 == -1) {
                throw new EOFException();
            }
            i5 |= i12 << i11;
        }
        return i5;
    }

    public int[] s(int i5) {
        int[] iArr = new int[i5];
        int i11 = 0;
        while (i5 > 0) {
            iArr[i11] = r();
            i5--;
            i11++;
        }
        return iArr;
    }

    public void t(gf.a0 a0Var) {
    }

    @Override // a5.a0
    public h2 u(View view, h2 h2Var) {
        f2 f2Var = h2Var.f296a;
        CoordinatorLayout coordinatorLayout = (CoordinatorLayout) this.f69487b;
        if (!Objects.equals(coordinatorLayout.n, h2Var)) {
            coordinatorLayout.n = h2Var;
            boolean z11 = h2Var.d() > 0;
            coordinatorLayout.o = z11;
            coordinatorLayout.setWillNotDraw(!z11 && coordinatorLayout.getBackground() == null);
            if (!f2Var.o()) {
                int childCount = coordinatorLayout.getChildCount();
                for (int i5 = 0; i5 < childCount; i5++) {
                    View childAt = coordinatorLayout.getChildAt(i5);
                    WeakHashMap weakHashMap = a1.f250a;
                    if (childAt.getFitsSystemWindows() && ((l4.e) childAt.getLayoutParams()).f74696a != null && f2Var.o()) {
                        break;
                    }
                }
            }
            coordinatorLayout.requestLayout();
        }
        return h2Var;
    }

    public void v(String str) {
        ((r) this.f69487b).f48282f = str;
    }

    public void w() {
        r rVar = (r) this.f69487b;
        rVar.f48280d = null;
        rVar.f48281e = null;
    }

    public void x() {
        ((r) this.f69487b).getClass();
    }

    public void y() throws IOException {
        long j11 = 4;
        long jSkip = ((InputStream) this.f69487b).skip(j11);
        if (jSkip != j11) {
            for (long jMax = Math.max(jSkip, 0L); jMax < j11; jMax++) {
                ((InputStream) this.f69487b).read();
            }
        }
    }

    public void z() {
        ArrayDeque arrayDeque = (ArrayDeque) this.f69487b;
        if (arrayDeque.isEmpty()) {
            return;
        }
        throw new IOException("data item not completed, stackSize: " + arrayDeque.size() + " scope: " + B());
    }

    @Override // kk.c
    public Object zza() {
        return ((k4) this.f69487b).f13083a;
    }

    public /* synthetic */ f(Object obj, int i5) {
        this.f69486a = i5;
        this.f69487b = obj;
    }

    public f(int i5) {
        this.f69486a = i5;
        switch (i5) {
            case 17:
                this.f69487b = new ArrayDeque(16);
                break;
            case 18:
                this.f69487b = new r("default_launcher_win_back", 2);
                break;
            case 22:
                Collator collator = Collator.getInstance();
                this.f69487b = collator;
                collator.setStrength(0);
                collator.setDecomposition(1);
                break;
            default:
                this.f69487b = new com.google.android.gms.internal.consent_sdk.a(10);
                break;
        }
    }

    public f(Context context) {
        this.f69486a = 15;
        this.f69487b = new n7.d(context, 0);
    }
}
