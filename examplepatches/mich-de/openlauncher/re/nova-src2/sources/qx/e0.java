package qx;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.LinkedHashMap;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class e0 implements oi.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f84469a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l f84470b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f84471c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ sx.j f84472d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function2 f84473e;

    public e0(Ref.ObjectRef objectRef, l lVar, Function1 function1, sx.j jVar, Function2 function2) {
        this.f84469a = objectRef;
        this.f84470b = lVar;
        this.f84471c = function1;
        this.f84472d = jVar;
        this.f84473e = function2;
    }

    @Override // ni.d
    public final void e() {
        r rVar = (r) this.f84469a.f71863a;
        if (rVar != null) {
            rVar.f();
            LinkedHashMap linkedHashMapK0 = MapsKt.k0(new Pair("placement", this.f84470b.name()));
            String str = rVar.f84590f;
            if (str != null) {
                linkedHashMapK0.put("location_in_app", str);
            }
            zy.c cVar = zy.c.f98823a;
            zy.c.i("ad_impression_icon", linkedHashMapK0);
            this.f84471c.invoke(rVar);
        }
    }

    @Override // ni.d
    public final void f(ni.m mVar) {
        String str;
        Function2 function2;
        sx.o oVar;
        long j11 = mVar.f78293b;
        String str2 = mVar.f78294c;
        double d5 = j11 / 1000000.0d;
        zy.c cVar = zy.c.f98823a;
        Pair pair = new Pair("placement", this.f84470b.name());
        Pair pair2 = new Pair("ad_type", "icon");
        sx.j jVar = this.f84472d;
        Pair pair3 = new Pair("network", (jVar == null || (oVar = jVar.f87792a) == null) ? InneractiveMediationNameConsts.ADMOB : oVar.f87816a);
        if (jVar == null || (str = jVar.f87793b) == null) {
            str = "unknown";
        }
        zy.c.i("paid_ad_impression", MapsKt.j0(pair, pair2, pair3, new Pair("tier", str), new Pair("value", Double.valueOf(d5)), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, str2), new Pair("precision", mVar.f78292a)));
        yx.h hVar = yx.h.f97704a;
        yx.h.h(str2, d5);
        if (jVar == null || (function2 = this.f84473e) == null) {
            return;
        }
        function2.invoke(jVar, Double.valueOf(d5));
    }

    @Override // ni.d
    public final void onAdClicked() {
        String str;
        String str2;
        sx.o oVar;
        Pair pair = new Pair("placement", this.f84470b.name());
        Pair pair2 = new Pair("ad_type", "icon");
        sx.j jVar = this.f84472d;
        Pair pair3 = new Pair("network", (jVar == null || (oVar = jVar.f87792a) == null) ? InneractiveMediationNameConsts.ADMOB : oVar.f87816a);
        if (jVar == null || (str = jVar.f87793b) == null) {
            str = "unknown";
        }
        LinkedHashMap linkedHashMapK0 = MapsKt.k0(pair, pair2, pair3, new Pair("tier", str));
        r rVar = (r) this.f84469a.f71863a;
        if (rVar != null && (str2 = rVar.f84590f) != null) {
            linkedHashMapK0.put("location_in_app", str2);
        }
        zy.c cVar = zy.c.f98823a;
        zy.c.i("ad_click", linkedHashMapK0);
    }
}
