package ads_mobile_sdk;

import android.os.Bundle;
import b.v;
import b.wa;
import com.google.ads.mediation.facebook.FacebookMediationAdapter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import mi.h;
import w70.u1;

/* loaded from: classes.dex */
public final class bt2 extends ss2 {
    public final ul n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f1554p;

    /* renamed from: q, reason: collision with root package name */
    public final h f1555q;

    /* renamed from: r, reason: collision with root package name */
    public final b.c7 f1556r;

    /* renamed from: s, reason: collision with root package name */
    public final b71 f1557s;

    /* renamed from: t, reason: collision with root package name */
    public final i8 f1558t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bt2(ul recursiveAdLoader, mi3 traceMetaSet, ni.q baseRequest, qw2 requestType, long j11, int i5, z1 adConfiguration, hv commonConfiguration, d33 serverTransaction, String renderId, boolean z11, boolean z12, h bannerRequest, b.c7 refreshListener, b.ka refreshUpdateListener, b71 inspectorAdLifecycleMonitor, i8 adSourceResponseInfoCollector, em emVar) {
        super(traceMetaSet, baseRequest, requestType, j11, i5, adConfiguration, commonConfiguration, serverTransaction, renderId, (eg2) emVar.get());
        Intrinsics.g(recursiveAdLoader, "recursiveAdLoader");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        Intrinsics.g(serverTransaction, "serverTransaction");
        Intrinsics.g(renderId, "renderId");
        Intrinsics.g(bannerRequest, "bannerRequest");
        Intrinsics.g(refreshListener, "refreshListener");
        Intrinsics.g(refreshUpdateListener, "refreshUpdateListener");
        Intrinsics.g(inspectorAdLifecycleMonitor, "inspectorAdLifecycleMonitor");
        Intrinsics.g(adSourceResponseInfoCollector, "adSourceResponseInfoCollector");
        this.n = recursiveAdLoader;
        this.o = z11;
        this.f1554p = z12;
        this.f1555q = bannerRequest;
        this.f1556r = refreshListener;
        this.f1557s = inspectorAdLifecycleMonitor;
        this.f1558t = adSourceResponseInfoCollector;
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0137, code lost:
    
        if (r1 == r3) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    @Override // ads_mobile_sdk.e2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(boolean z11, Continuation continuation) {
        zs2 zs2Var;
        if (continuation instanceof zs2) {
            zs2Var = (zs2) continuation;
            int i5 = zs2Var.f12644c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zs2Var.f12644c = i5 - Integer.MIN_VALUE;
            } else {
                zs2Var = new zs2(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = zs2Var.f12642a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zs2Var.f12644c;
        if (i11 == 0) {
            ResultKt.b(objA);
            z1 z1Var = this.f2711f;
            com.google.gson.r rVar = z1Var.f12371c;
            ArrayList arrayList = z1Var.f12379g;
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
            h hVar = this.f1555q;
            mi.a aVarK = hVar.k();
            if (aVarK == null) {
                aVarK = new mi.a(((g2) arrayList.get(0)).f3618a, ((g2) arrayList.get(0)).f3619b);
            }
            mi.a aVar = aVarK;
            String str = this.f9655l;
            if (str == null) {
                Intrinsics.m("innerAdUnitId");
                throw null;
            }
            mi.g gVar = new mi.g(str, qVar.f78308a, qVar.f78309b, qVar.f78310c, bundleG, qVar.f78312e, qVar.f78313f, linkedHashMapU0, qVar.f78315h, aVar, ul.b.P(aVar), hVar.c(), hVar.g());
            v vVar = new v();
            zs2Var.f12644c = 1;
            qb0 qb0Var = (qb0) ((wa) this.n.f10391a.get());
            qb0Var.f8549c = kVarA;
            qb0Var.a(this.f2708c);
            mi3 mi3Var = this.f2706a;
            qb0Var.a(mi3Var.f7224a);
            qb0Var.a(mi3Var.f7225b);
            qb0Var.a(this.o);
            qb0Var.o = gVar;
            qb0Var.n = Boolean.valueOf(this.f1554p);
            b.c7 c7Var = this.f1556r;
            c7Var.getClass();
            qb0Var.f8559m = c7Var;
            qb0Var.f8558l = vVar;
            qb0Var.a(this.f9656m);
            qb0Var.b(true);
            qb0Var.a(this.f1557s);
            qb0Var.a(this.f1558t);
            qb0Var.c(false);
            objA = ((jc1) ((b.g1) qb0Var.a().E0.get())).a(zs2Var);
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
        zs2Var.f12644c = 2;
        objA = u1.o((w70.m) objA, zs2Var);
    }
}
