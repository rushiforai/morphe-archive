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

/* loaded from: classes.dex */
public final class kt2 extends ss2 {
    public final wy2 n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final b71 f5968p;

    /* renamed from: q, reason: collision with root package name */
    public final i8 f5969q;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kt2(wy2 recursiveAdLoader, mi3 traceMetaSet, ni.q baseRequest, qw2 requestType, long j11, int i5, z1 adConfiguration, hv commonConfiguration, d33 serverTransaction, String renderId, boolean z11, b71 inspectorAdLifecycleMonitor, i8 adSourceResponseInfoCollector, em emVar) {
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
        this.f5968p = inspectorAdLifecycleMonitor;
        this.f5969q = adSourceResponseInfoCollector;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Override // ads_mobile_sdk.e2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(boolean z11, Continuation continuation) {
        jt2 jt2Var;
        if (continuation instanceof jt2) {
            jt2Var = (jt2) continuation;
            int i5 = jt2Var.f5393c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jt2Var.f5393c = i5 - Integer.MIN_VALUE;
            } else {
                jt2Var = new jt2(this, (ContinuationImpl) continuation);
            }
        }
        jt2 jt2Var2 = jt2Var;
        Object objA = jt2Var2.f5391a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jt2Var2.f5393c;
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
            jt2Var2.f5393c = 1;
            objA = this.n.a(kVarA, this.f2708c, this.f2706a, this.o, this.f9656m, this.f5968p, this.f5969q, jt2Var2);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        b.a1 a1Var = (b.a1) ((Pair) objA).f71683a;
        if (a1Var instanceof xu0) {
            return new xu0(new n8.q(a1Var, 3));
        }
        if (a1Var instanceof pu0) {
            return a1Var;
        }
        throw new NoWhenBranchMatchedException();
    }
}
