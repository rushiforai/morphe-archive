package px;

import b70.k;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import dx.g;
import dx.o;
import dx.p;
import dx.q;
import dx.r;
import dx.s;
import dx.v;
import dx.x0;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import yx.h;

/* loaded from: classes4.dex */
public final class d implements dx.a {

    /* renamed from: b, reason: collision with root package name */
    public static final d f83117b = new d(0);

    /* renamed from: c, reason: collision with root package name */
    public static final d f83118c = new d(1);

    /* renamed from: d, reason: collision with root package name */
    public static final d f83119d = new d(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83120a;

    public /* synthetic */ d(int i5) {
        this.f83120a = i5;
    }

    public static Map b(o oVar) {
        return MapsKt.j0(new Pair("placement", oVar.c()), new Pair("slot_id", oVar.b()), new Pair("request_id", oVar.d()), new Pair("timestamp_ms", Long.valueOf(oVar.a())));
    }

    @Override // dx.a
    public final void a(o oVar) {
        Pair pair;
        String str;
        switch (this.f83120a) {
            case 0:
                if (oVar instanceof v) {
                    pair = new Pair("ad_requested", MapsKt.m0(b(oVar), k.e0(new Pair("candidate_id", ((v) oVar).f49805e))));
                } else if (oVar instanceof r) {
                    Map mapB = b(oVar);
                    r rVar = (r) oVar;
                    Pair pair2 = new Pair("candidate_id", rVar.f49769e);
                    Pair pair3 = new Pair("latency_ms", Long.valueOf(rVar.f49770f));
                    Pair pair4 = new Pair("presentation", rVar.f49771g.name());
                    Pair pair5 = new Pair("adapter", rVar.f49772h);
                    x0 x0Var = x0.f49820a;
                    pair = new Pair("ad_loaded", MapsKt.m0(mapB, MapsKt.j0(pair2, pair3, pair4, pair5, new Pair("warmth", "Fresh"))));
                } else if (oVar instanceof q) {
                    q qVar = (q) oVar;
                    pair = new Pair("ad_load_failed", MapsKt.m0(b(oVar), MapsKt.j0(new Pair("candidate_id", qVar.f49760e), new Pair("error", qVar.f49761f.toString()))));
                } else if (oVar instanceof p) {
                    pair = new Pair("ad_impression", MapsKt.m0(b(oVar), k.e0(new Pair("candidate_id", ((p) oVar).f49753e))));
                } else if (oVar instanceof g) {
                    pair = new Pair("ad_click", MapsKt.m0(b(oVar), k.e0(new Pair("candidate_id", ((g) oVar).f49704e))));
                } else if (oVar instanceof s) {
                    s sVar = (s) oVar;
                    pair = new Pair("ad_paid", MapsKt.m0(b(oVar), MapsKt.j0(new Pair("candidate_id", sVar.f49786e), new Pair("revenue_micros", Long.valueOf(sVar.f49787f)), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, sVar.f49788g), new Pair("precision", Integer.valueOf(sVar.f49789h)), new Pair("adapter", sVar.f49790i))));
                }
                String str2 = (String) pair.f71683a;
                Map map = (Map) pair.f71684b;
                yx.b bVar = yx.b.f97678a;
                yx.b.g(str2, map);
                break;
            case 1:
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                linkedHashMap.put("placement", oVar.c());
                linkedHashMap.put("slot_id", oVar.b());
                String strD = oVar.d();
                if (strD != null) {
                    linkedHashMap.put("request_id", strD);
                }
                if (oVar instanceof v) {
                    linkedHashMap.put("candidate_id", ((v) oVar).f49805e);
                    str = "ad_requested";
                } else if (oVar instanceof r) {
                    r rVar2 = (r) oVar;
                    linkedHashMap.put("candidate_id", rVar2.f49769e);
                    linkedHashMap.put("latency_ms", Long.valueOf(rVar2.f49770f));
                    linkedHashMap.put("presentation", rVar2.f49771g.name());
                    String str3 = rVar2.f49772h;
                    if (str3 != null) {
                        linkedHashMap.put("adapter", str3);
                    }
                    x0 x0Var2 = x0.f49820a;
                    linkedHashMap.put("warmth", "Fresh");
                    str = "ad_loaded";
                } else if (oVar instanceof q) {
                    q qVar2 = (q) oVar;
                    linkedHashMap.put("candidate_id", qVar2.f49760e);
                    linkedHashMap.put("error", qVar2.f49761f.toString());
                    str = "ad_load_failed";
                } else if (oVar instanceof p) {
                    linkedHashMap.put("candidate_id", ((p) oVar).f49753e);
                    str = "ad_impression";
                } else if (oVar instanceof g) {
                    linkedHashMap.put("candidate_id", ((g) oVar).f49704e);
                    str = "ad_click";
                } else if (oVar instanceof s) {
                    s sVar2 = (s) oVar;
                    linkedHashMap.put("candidate_id", sVar2.f49786e);
                    linkedHashMap.put("revenue_micros", Long.valueOf(sVar2.f49787f));
                    linkedHashMap.put(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, sVar2.f49788g);
                    linkedHashMap.put("precision", Integer.valueOf(sVar2.f49789h));
                    String str4 = sVar2.f49790i;
                    if (str4 != null) {
                        linkedHashMap.put("adapter", str4);
                    }
                    str = "ad_paid";
                }
                zy.c cVar = zy.c.f98823a;
                zy.c.i(str, linkedHashMap);
                break;
            default:
                if (oVar instanceof s) {
                    h hVar = h.f97704a;
                    h.h(((s) oVar).f49788g, r0.f49787f / 1000000.0d);
                    break;
                }
                break;
        }
    }
}
