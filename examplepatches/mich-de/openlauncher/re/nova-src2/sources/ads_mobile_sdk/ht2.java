package ads_mobile_sdk;

import android.os.Bundle;
import com.google.ads.mediation.facebook.FacebookMediationAdapter;
import java.util.LinkedHashMap;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import ui.o;
import w70.u1;

/* loaded from: classes2.dex */
public final class ht2 extends ss2 {
    public final b.bc n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final b71 f4527p;

    /* renamed from: q, reason: collision with root package name */
    public final ui.q f4528q;

    /* renamed from: r, reason: collision with root package name */
    public final int f4529r;

    /* renamed from: s, reason: collision with root package name */
    public final boolean f4530s;

    /* renamed from: t, reason: collision with root package name */
    public final b.ka f4531t;

    /* renamed from: u, reason: collision with root package name */
    public final i8 f4532u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ht2(b.bc recursiveAdLoader, mi3 traceMetaSet, ni.q baseRequest, qw2 requestType, long j11, int i5, z1 adConfiguration, hv commonConfiguration, d33 serverTransaction, String renderId, boolean z11, b71 inspectorAdLifecycleMonitor, ui.q nativeRequest, int i11, boolean z12, b.ka refreshUpdateListener, i8 adSourceResponseInfoCollector, eg2 placementIdWrapper) {
        super(traceMetaSet, baseRequest, requestType, j11, i5, adConfiguration, commonConfiguration, serverTransaction, renderId, placementIdWrapper);
        Intrinsics.g(recursiveAdLoader, "recursiveAdLoader");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        Intrinsics.g(serverTransaction, "serverTransaction");
        Intrinsics.g(renderId, "renderId");
        Intrinsics.g(inspectorAdLifecycleMonitor, "inspectorAdLifecycleMonitor");
        Intrinsics.g(nativeRequest, "nativeRequest");
        Intrinsics.g(refreshUpdateListener, "refreshUpdateListener");
        Intrinsics.g(adSourceResponseInfoCollector, "adSourceResponseInfoCollector");
        Intrinsics.g(placementIdWrapper, "placementIdWrapper");
        this.n = recursiveAdLoader;
        this.o = z11;
        this.f4527p = inspectorAdLifecycleMonitor;
        this.f4528q = nativeRequest;
        this.f4529r = i11;
        this.f4530s = z12;
        this.f4531t = refreshUpdateListener;
        this.f4532u = adSourceResponseInfoCollector;
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x014b, code lost:
    
        if (r1 == r3) goto L23;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    @Override // ads_mobile_sdk.e2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(boolean z11, Continuation continuation) {
        gt2 gt2Var;
        if (continuation instanceof gt2) {
            gt2Var = (gt2) continuation;
            int i5 = gt2Var.f4067c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gt2Var.f4067c = i5 - Integer.MIN_VALUE;
            } else {
                gt2Var = new gt2(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = gt2Var.f4065a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gt2Var.f4067c;
        if (i11 == 0) {
            ResultKt.b(objA);
            com.google.gson.r rVar = this.f2711f.f12371c;
            Intrinsics.g(rVar, "<this>");
            String strO = rVar.v(FacebookMediationAdapter.PLACEMENT_PARAMETER).o();
            Intrinsics.f(strO, "getAsString(...)");
            this.f9655l = strO;
            h();
            Bundle bundleG = g();
            ni.q qVar = this.f2707b;
            LinkedHashMap linkedHashMapU0 = MapsKt.u0(qVar.f78314g);
            linkedHashMapU0.put("com.google.ads.mediation.admob.AdMobAdapter", bundleG);
            ni.k kVarA = a(bundleG, linkedHashMapU0);
            String str = this.f9655l;
            if (str == null) {
                Intrinsics.m("innerAdUnitId");
                throw null;
            }
            ui.q nativeRequest = this.f4528q;
            Intrinsics.g(nativeRequest, "nativeRequest");
            o oVar = new o(str, qVar.f78308a, qVar.f78309b, qVar.f78310c, bundleG, qVar.f78312e, qVar.f78313f, linkedHashMapU0, qVar.f78315h, nativeRequest.d(), nativeRequest.a(), nativeRequest.i(), nativeRequest.getMediaAspectRatio(), nativeRequest.e(), nativeRequest.c(), nativeRequest.b(), nativeRequest.f(), nativeRequest.j(), nativeRequest.k(), nativeRequest.h(), nativeRequest.g(), false);
            gt2Var.f4067c = 1;
            cc0 cc0Var = (cc0) ((x02) this.n).f11525a.get();
            cc0Var.f1776c = kVarA;
            qw2 qw2Var = this.f2708c;
            qw2Var.getClass();
            cc0Var.f1775b = qw2Var;
            mi3 mi3Var = this.f2706a;
            ur2 ur2Var = mi3Var.f7224a;
            ur2Var.getClass();
            cc0Var.f1777d = ur2Var;
            fh1 fh1Var = mi3Var.f7225b;
            fh1Var.getClass();
            cc0Var.f1778e = fh1Var;
            cc0Var.f1780g = Boolean.valueOf(this.o);
            ts2 ts2Var = this.f9656m;
            ts2Var.getClass();
            cc0Var.f1781h = ts2Var;
            cc0Var.f1782i = Boolean.TRUE;
            cc0Var.f1783j = Boolean.FALSE;
            b71 b71Var = this.f4527p;
            b71Var.getClass();
            cc0Var.f1779f = b71Var;
            cc0Var.f1786m = oVar;
            cc0Var.f1785l = Integer.valueOf(this.f4529r);
            cc0Var.n = Boolean.valueOf(this.f4530s);
            b.ka kaVar = this.f4531t;
            kaVar.getClass();
            cc0Var.o = kaVar;
            i8 i8Var = this.f4532u;
            i8Var.getClass();
            cc0Var.f1784k = i8Var;
            objA = ((jc1) ((b.g1) cc0Var.a().G0.get())).a(gt2Var);
            if (objA != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            b.a1 a1Var = (b.a1) ((Pair) objA).f71683a;
            if (a1Var instanceof xu0) {
                return new xu0(new n8.q(new xu0(((xu0) a1Var).f11834b), 3));
            }
            if (a1Var instanceof pu0) {
                return a1Var;
            }
            throw new NoWhenBranchMatchedException();
        }
        ResultKt.b(objA);
        gt2Var.f4067c = 2;
        objA = u1.o((w70.m) objA, gt2Var);
    }
}
