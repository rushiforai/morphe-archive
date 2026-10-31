package ads_mobile_sdk;

import java.util.Map;
import java.util.Optional;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes.dex */
public abstract class vb1 implements b.ja {

    /* renamed from: a, reason: collision with root package name */
    private final String f10712a;

    /* renamed from: b, reason: collision with root package name */
    private final z1 f10713b;

    /* renamed from: c, reason: collision with root package name */
    private final hv f10714c;

    /* renamed from: d, reason: collision with root package name */
    private final mi3 f10715d;

    /* renamed from: f, reason: collision with root package name */
    private final y2 f10716f;

    /* renamed from: g, reason: collision with root package name */
    private final ih0 f10717g;

    /* renamed from: h, reason: collision with root package name */
    private final hf2 f10718h;

    /* renamed from: i, reason: collision with root package name */
    private final z03 f10719i;

    /* renamed from: j, reason: collision with root package name */
    private final eg2 f10720j;

    /* renamed from: k, reason: collision with root package name */
    public ni.g0 f10721k;

    public vb1(String adId, z1 adConfiguration, hv commonConfiguration, mi3 traceMetaSet, Optional gmaWebView, y2 adEventEmitter, ih0 delegatingAdEventListener, hf2 phantomReferences, z03 safeBrowsingManager, eg2 placementIdWrapper, ni.q baseRequest) {
        Intrinsics.g(adId, "adId");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(gmaWebView, "gmaWebView");
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        Intrinsics.g(delegatingAdEventListener, "delegatingAdEventListener");
        Intrinsics.g(phantomReferences, "phantomReferences");
        Intrinsics.g(safeBrowsingManager, "safeBrowsingManager");
        Intrinsics.g(placementIdWrapper, "placementIdWrapper");
        Intrinsics.g(baseRequest, "baseRequest");
        this.f10712a = adId;
        this.f10713b = adConfiguration;
        this.f10714c = commonConfiguration;
        this.f10715d = traceMetaSet;
        this.f10716f = adEventEmitter;
        this.f10717g = delegatingAdEventListener;
        this.f10718h = phantomReferences;
        this.f10719i = safeBrowsingManager;
        this.f10720j = placementIdWrapper;
        s8 s8Var = traceMetaSet.f7227d;
        s8Var.f9458b = adId;
        s8Var.f9459c = adConfiguration.f12376e0;
    }

    @Override // b.ja
    public final mi3 a() {
        return this.f10715d;
    }

    @Override // b.ja
    public final z1 b() {
        return this.f10713b;
    }

    @Override // b.ja
    public final eg2 c() {
        return this.f10720j;
    }

    @Override // b.ja
    public final il2 d() {
        return this.f10713b.f12414y0;
    }

    @Override // b.ja
    public void destroy() {
        y2 y2Var = this.f10716f;
        if (y2Var.f11924f.getAndSet(true)) {
            return;
        }
        for (Map.Entry entry : ((Map) y2Var.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) y2Var.f19222a;
            i2 i2Var = new i2(str, value, null, 4);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(i2Var, null), 2);
        }
    }

    @Override // b.ja
    public final double e() {
        return this.f10713b.f12412x0;
    }

    @Override // b.ja
    public final String f() {
        return this.f10712a;
    }

    @Override // b.ja
    public com.google.gson.r g() {
        return null;
    }

    @Override // b.ja
    public final ni.g0 getResponseInfo() {
        ni.g0 g0Var = this.f10721k;
        if (g0Var != null) {
            return g0Var;
        }
        Intrinsics.m("responseInfo");
        throw null;
    }

    public final hv i() {
        return this.f10714c;
    }

    public final ih0 j() {
        return this.f10717g;
    }

    @Override // b.ja
    public final Unit a(ContinuationImpl continuationImpl) {
        Unit unitE = this.f10716f.e();
        return unitE == CoroutineSingletons.f71806a ? unitE : Unit.f71706a;
    }

    @Override // b.ja
    public Object a(fo2 fo2Var) {
        return a(this, fo2Var);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0058, code lost:
    
        if (ads_mobile_sdk.hf2.a(r6, r5, r2, r0) == r1) goto L21;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(vb1 vb1Var, ContinuationImpl continuationImpl) {
        ub1 ub1Var;
        if (continuationImpl instanceof ub1) {
            ub1Var = (ub1) continuationImpl;
            int i5 = ub1Var.f10283d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ub1Var.f10283d = i5 - Integer.MIN_VALUE;
            } else {
                ub1Var = new ub1(vb1Var, continuationImpl);
            }
        }
        Object obj = ub1Var.f10281b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ub1Var.f10283d;
        if (i11 == 0) {
            ResultKt.b(obj);
            y2 y2Var = vb1Var.f10716f;
            ub1Var.f10280a = vb1Var;
            ub1Var.f10283d = 1;
            if (y2Var.i(ub1Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        vb1Var = ub1Var.f10280a;
        ResultKt.b(obj);
        hf2 hf2Var = vb1Var.f10718h;
        z03 z03Var = vb1Var.f10719i;
        ub1Var.f10280a = null;
        ub1Var.f10283d = 2;
        hf2Var.getClass();
    }

    @Override // b.ja
    public final void a(ni.g0 g0Var) {
        this.f10721k = g0Var;
    }
}
