package qx;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.LinkedHashMap;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class k0 implements ui.e {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Function0 f84538a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l f84539b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f84540c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ sx.j f84541d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function2 f84542e;

    public k0(Function0 function0, l lVar, Function1 function1, sx.j jVar, Function2 function2) {
        this.f84538a = function0;
        this.f84539b = lVar;
        this.f84540c = function1;
        this.f84541d = jVar;
        this.f84542e = function2;
    }

    @Override // ni.d
    public final void e() {
        r rVar = (r) this.f84538a.invoke();
        if (rVar != null) {
            rVar.f();
            LinkedHashMap linkedHashMapK0 = MapsKt.k0(new Pair("placement", this.f84539b.name()));
            String str = rVar.f84590f;
            if (str != null) {
                linkedHashMapK0.put("location_in_app", str);
            }
            zy.c cVar = zy.c.f98823a;
            zy.c.i("ad_impression_native", linkedHashMapK0);
            this.f84540c.invoke(rVar);
        }
    }

    @Override // ni.d
    public final void f(ni.m mVar) {
        String strA;
        String strD;
        Function2 function2;
        sx.o oVarC;
        double dC = mVar.c() / 1000000.0d;
        zy.c cVar = zy.c.f98823a;
        Pair pair = new Pair("placement", this.f84539b.name());
        Pair pair2 = new Pair("ad_type", "native");
        sx.j jVar = this.f84541d;
        if (jVar == null || (oVarC = jVar.c()) == null || (strA = oVarC.a()) == null) {
            strA = InneractiveMediationNameConsts.ADMOB;
        }
        Pair pair3 = new Pair("network", strA);
        if (jVar == null || (strD = jVar.d()) == null) {
            strD = "unknown";
        }
        zy.c.i("paid_ad_impression", MapsKt.j0(pair, pair2, pair3, new Pair("tier", strD), new Pair("value", Double.valueOf(dC)), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, mVar.a()), new Pair("precision", mVar.b())));
        yx.h hVar = yx.h.f97704a;
        yx.h.h(mVar.a(), dC);
        if (jVar == null || (function2 = this.f84542e) == null) {
            return;
        }
        function2.invoke(jVar, Double.valueOf(dC));
    }

    @Override // ni.d
    public final void onAdClicked() {
        String strA;
        String strD;
        String str;
        sx.o oVarC;
        Pair pair = new Pair("placement", this.f84539b.name());
        Pair pair2 = new Pair("ad_type", "native");
        sx.j jVar = this.f84541d;
        if (jVar == null || (oVarC = jVar.c()) == null || (strA = oVarC.a()) == null) {
            strA = InneractiveMediationNameConsts.ADMOB;
        }
        Pair pair3 = new Pair("network", strA);
        if (jVar == null || (strD = jVar.d()) == null) {
            strD = "unknown";
        }
        LinkedHashMap linkedHashMapK0 = MapsKt.k0(pair, pair2, pair3, new Pair("tier", strD));
        r rVar = (r) this.f84538a.invoke();
        if (rVar != null && (str = rVar.f84590f) != null) {
            linkedHashMapK0.put("location_in_app", str);
        }
        zy.c cVar = zy.c.f98823a;
        zy.c.i("ad_click", linkedHashMapK0);
    }
}
