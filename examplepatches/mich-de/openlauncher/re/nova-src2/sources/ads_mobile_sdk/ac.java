package ads_mobile_sdk;

import b.x2;
import b70.h;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class ac implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final sb f919a;

    /* renamed from: b, reason: collision with root package name */
    public final List f920b;

    public ac(jr0 flags, sb adapterInitializer) {
        Intrinsics.g(flags, "flags");
        Intrinsics.g(adapterInitializer, "adapterInitializer");
        this.f919a = adapterInitializer;
        List defaultValue = ul.b.Q("com.google.ads.mediation.inmobi.InMobiMediationAdapter", "com.google.ads.mediation.imobile.IMobileMediationAdapter", "com.google.ads.mediation.nend.NendMediationAdapter", "com.google.ads.mediation.adcolony.AdColonyMediationAdapter", "com.google.ads.mediation.facebook.FacebookMediationAdapter", "com.google.ads.mediation.mopub.MoPubMediationAdapter", "com.google.ads.mediation.applovin.AppLovinMediationAdapter", "com.google.ads.mediation.tapjoy.TapjoyMediationAdapter", "com.google.ads.mediation.vungle.VungleMediationAdapter", "com.google.ads.mediation.unity.UnityMediationAdapter", "com.google.ads.mediation.chartboost.ChartboostMediationAdapter", "com.google.ads.mediation.mytarget.MyTargetMediationAdapter", "com.google.ads.mediation.maio.MaioMediationAdapter", "com.google.ads.mediation.ironsource.IronSourceMediationAdapter", "com.google.ads.mediation.fyber.FyberMediationAdapter", "com.google.ads.mediation.verizon.VerizonMediationAdapter");
        Intrinsics.g(defaultValue, "defaultValue");
        this.f920b = (List) flags.a("gads:logged_adapter_version_classes", defaultValue, u.a$4);
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.ADAPTER_VERSIONS;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        zb zbVar;
        LinkedHashMap linkedHashMap;
        ac acVar;
        pi.a aVar;
        if (continuation instanceof zb) {
            zbVar = (zb) continuation;
            int i5 = zbVar.f12511e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zbVar.f12511e = i5 - Integer.MIN_VALUE;
            } else {
                zbVar = new zb(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = zbVar.f12509c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zbVar.f12511e;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (this.f920b.isEmpty()) {
                return new xu0(new yb(h.f17594a));
            }
            LinkedHashMap linkedHashMap2 = new LinkedHashMap();
            zbVar.f12507a = this;
            zbVar.f12508b = linkedHashMap2;
            zbVar.f12511e = 1;
            sb sbVar = this.f919a;
            sbVar.getClass();
            Object objA = sb.a(sbVar, zbVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            linkedHashMap = linkedHashMap2;
            obj = objA;
            acVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            linkedHashMap = zbVar.f12508b;
            acVar = zbVar.f12507a;
            ResultKt.b(obj);
        }
        Map map = (Map) obj;
        for (String str : acVar.f920b) {
            ma maVar = (ma) map.get(str);
            if (maVar == null || (aVar = maVar.f7059a.f10641a) == null) {
                aVar = pi.a.f82594a;
            }
            ma maVar2 = (ma) map.get(str);
            ti.c cVar = maVar2 != null ? maVar2.f7060b : null;
            if (aVar == pi.a.f82596c && cVar != null) {
                linkedHashMap.put(str, cVar);
            }
        }
        return new xu0(new yb(linkedHashMap));
    }
}
