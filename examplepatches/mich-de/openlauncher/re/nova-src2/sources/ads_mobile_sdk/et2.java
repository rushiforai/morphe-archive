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
import w70.u1;

/* loaded from: classes.dex */
public final class et2 extends ss2 {
    public final hi1 n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final b71 f3000p;

    /* renamed from: q, reason: collision with root package name */
    public final i8 f3001q;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public et2(hi1 recursiveAdLoader, mi3 traceMetaSet, ni.q baseRequest, qw2 requestType, long j11, int i5, z1 adConfiguration, hv commonConfiguration, d33 serverTransaction, String renderId, boolean z11, b71 inspectorAdLifecycleMonitor, i8 adSourceResponseInfoCollector, em emVar) {
        super(traceMetaSet, baseRequest, requestType, j11, i5, adConfiguration, commonConfiguration, serverTransaction, renderId, (eg2) emVar.get());
        Intrinsics.g(recursiveAdLoader, "recursiveAdLoader");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        Intrinsics.g(serverTransaction, "serverTransaction");
        Intrinsics.g(renderId, "renderId");
        Intrinsics.g(inspectorAdLifecycleMonitor, "inspectorAdLifecycleMonitor");
        Intrinsics.g(adSourceResponseInfoCollector, "adSourceResponseInfoCollector");
        this.n = recursiveAdLoader;
        this.o = z11;
        this.f3000p = inspectorAdLifecycleMonitor;
        this.f3001q = adSourceResponseInfoCollector;
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x00d6, code lost:
    
        if (r7 == r0) goto L21;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ads_mobile_sdk.e2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(boolean z11, Continuation continuation) {
        dt2 dt2Var;
        if (continuation instanceof dt2) {
            dt2Var = (dt2) continuation;
            int i5 = dt2Var.f2631c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dt2Var.f2631c = i5 - Integer.MIN_VALUE;
            } else {
                dt2Var = new dt2(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = dt2Var.f2629a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dt2Var.f2631c;
        if (i11 == 0) {
            ResultKt.b(objA);
            com.google.gson.r rVar = this.f2711f.f12371c;
            Intrinsics.g(rVar, "<this>");
            String strO = rVar.v(FacebookMediationAdapter.PLACEMENT_PARAMETER).o();
            Intrinsics.f(strO, "getAsString(...)");
            this.f9655l = strO;
            h();
            Bundle bundleG = g();
            LinkedHashMap linkedHashMapU0 = MapsKt.u0(this.f2707b.f78314g);
            linkedHashMapU0.put("com.google.ads.mediation.admob.AdMobAdapter", bundleG);
            ni.k kVarA = a(bundleG, linkedHashMapU0);
            dt2Var.f2631c = 1;
            yb0 yb0Var = (yb0) this.n.f4398a.get();
            yb0Var.f11993c = kVarA;
            qw2 qw2Var = this.f2708c;
            qw2Var.getClass();
            yb0Var.f11992b = qw2Var;
            mi3 mi3Var = this.f2706a;
            ur2 ur2Var = mi3Var.f7224a;
            ur2Var.getClass();
            yb0Var.f11994d = ur2Var;
            fh1 fh1Var = mi3Var.f7225b;
            fh1Var.getClass();
            yb0Var.f11995e = fh1Var;
            yb0Var.f11997g = Boolean.valueOf(this.o);
            ts2 ts2Var = this.f9656m;
            ts2Var.getClass();
            yb0Var.f11998h = ts2Var;
            yb0Var.f11999i = Boolean.TRUE;
            b71 b71Var = this.f3000p;
            b71Var.getClass();
            yb0Var.f11996f = b71Var;
            i8 i8Var = this.f3001q;
            i8Var.getClass();
            yb0Var.f12001k = i8Var;
            yb0Var.f12000j = Boolean.FALSE;
            objA = ((jc1) ((b.g1) yb0Var.a().A0.get())).a(dt2Var);
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
                return new xu0(new n8.q(a1Var, 3));
            }
            if (a1Var instanceof pu0) {
                return a1Var;
            }
            throw new NoWhenBranchMatchedException();
        }
        ResultKt.b(objA);
        dt2Var.f2631c = 2;
        objA = u1.o((w70.m) objA, dt2Var);
    }
}
