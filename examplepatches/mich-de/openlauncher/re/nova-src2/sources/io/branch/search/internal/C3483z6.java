package io.branch.search.internal;

import io.branch.search.internal.InterfaceC3415v6;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgressionIterator;
import kotlin.ranges.IntRange;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.z6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3483z6 {
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:87:0x02cd  */
    /* JADX WARN: Type inference failed for: r1v15, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r1v16, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r1v17, types: [org.json.JSONObject] */
    /* JADX WARN: Type inference failed for: r2v0, types: [org.json.JSONObject] */
    /* JADX WARN: Type inference failed for: r8v16, types: [java.util.Map] */
    @NotNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final JSONObject a(@NotNull AbstractC3466y6<?> abstractC3466y6, @NotNull List<C3398u6> analytics) throws JSONException {
        JSONObject jSONObject;
        b70.h hVar;
        C3364s6 c3364s6A;
        C3364s6 c3364s6;
        C3364s6 c3364s6A2;
        Intrinsics.g(abstractC3466y6, "<this>");
        Intrinsics.g(analytics, "analytics");
        ?? jSONObject2 = new JSONObject();
        Object obj = abstractC3466y6.f66314e;
        Intrinsics.g(obj, "<this>");
        if (obj instanceof C3219jd) {
            C3219jd c3219jd = (C3219jd) obj;
            jSONObject = new JSONObject();
            jSONObject.put("user_query", c3219jd.f64899a);
            jSONObject.put("user_query_norm", c3219jd.f64900b);
            jSONObject.put("utc_timestamp", c3219jd.f64901c);
        } else if (obj instanceof gg) {
            gg ggVar = (gg) obj;
            jSONObject = new JSONObject();
            jSONObject.put("utc_timestamp", ggVar.f64608a);
            Object obj2 = ggVar.f64609b;
            if (obj2 == null) {
                obj2 = JSONObject.NULL;
            }
            jSONObject.put("user_id", obj2);
            jSONObject.put("sa_row_count", ggVar.f64610c);
            jSONObject.put("sa_row_size", ggVar.f64611d);
            jSONObject.put("sl_row_count", ggVar.f64612e);
            jSONObject.put("sl_row_size", ggVar.f64613f);
            jSONObject.put("si_row_count", ggVar.f64614g);
            jSONObject.put("si_row_size", ggVar.f64615h);
            jSONObject.put("sa_total_items", ((Number) ggVar.f64617j.getValue()).intValue());
            jSONObject.put("sl_total_items", ((Number) ggVar.f64618k.getValue()).intValue());
            jSONObject.put("for_cache_update", ggVar.f64616i);
        } else if (obj instanceof Ge) {
            jSONObject = new JSONObject();
            jSONObject.put("count", ((Ge) obj).f62545a);
        } else if (obj instanceof B0) {
            B0 b02 = (B0) obj;
            jSONObject = new JSONObject();
            jSONObject.put("user_query", b02.f62085a);
            jSONObject.put("user_query_norm", b02.f62086b);
            jSONObject.put("utc_timestamp", b02.f62087c);
        } else {
            if (!(obj instanceof C3212j6)) {
                throw new NoWhenBranchMatchedException();
            }
            jSONObject = new JSONObject();
        }
        jSONObject2.put("request", jSONObject);
        jSONObject2.put("request_api", abstractC3466y6.f66310a);
        jSONObject2.put("request_id", abstractC3466y6.f66313d);
        if (!abstractC3466y6.f66319j.isEmpty()) {
            CopyOnWriteArrayList<InterfaceC3415v6> copyOnWriteArrayList = abstractC3466y6.f66319j;
            ArrayList arrayList = new ArrayList(b70.c.u0(copyOnWriteArrayList, 10));
            Iterator<InterfaceC3415v6> it = copyOnWriteArrayList.iterator();
            while (it.hasNext()) {
                InterfaceC3415v6 analytics2 = it.next();
                Intrinsics.f(analytics2, "analytics");
                JSONObject jSONObject3 = new JSONObject();
                if (analytics2 instanceof InterfaceC3415v6.b) {
                    jSONObject3.put("containers", new JSONArray((Collection) ((InterfaceC3415v6.b) analytics2).f66171a));
                } else if (analytics2 instanceof InterfaceC3415v6.c) {
                    InterfaceC3415v6.c cVar = (InterfaceC3415v6.c) analytics2;
                    jSONObject3.put("lcs_experiment_id", cVar.f66172a);
                    jSONObject3.put("experiment_ids", cVar.f66174c);
                    jSONObject3.put("cohort_id", cVar.f66173b);
                } else if (analytics2 instanceof InterfaceC3415v6.a) {
                    for (Map.Entry<String, String> entry : ((InterfaceC3415v6.a) analytics2).f66170a.entrySet()) {
                        String key = entry.getKey();
                        String value = entry.getValue();
                        if (key != null) {
                            jSONObject3.put(key, value);
                        }
                    }
                }
                arrayList.add(jSONObject3);
            }
            Iterator it2 = arrayList.iterator();
            if (!it2.hasNext()) {
                throw new UnsupportedOperationException("Empty collection can't be reduced.");
            }
            ?? next = it2.next();
            while (it2.hasNext()) {
                JSONObject jSONObject4 = (JSONObject) it2.next();
                next = (JSONObject) next;
                Iterator<String> itKeys = jSONObject4.keys();
                Intrinsics.f(itKeys, "jsonObject.keys()");
                while (itKeys.hasNext()) {
                    String next2 = itKeys.next();
                    next.put(next2, jSONObject4.get(next2));
                }
            }
            jSONObject2.put("request_level_analytics", next);
        }
        JSONArray jSONArray = new JSONArray();
        ArrayList arrayList2 = new ArrayList(b70.c.u0(analytics, 10));
        String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        int i5 = 1;
        for (C3398u6 c3398u6 : analytics) {
            String str2 = c3398u6.f66014c.f65744c;
            i5 = !Intrinsics.b(str2, str) ? 1 : i5 + 1;
            Intrinsics.e(str2, "null cannot be cast to non-null type kotlin.String");
            arrayList2.add(C3364s6.a(c3398u6.f66014c, Integer.valueOf(i5), null, null, 28671));
            str = str2;
        }
        Iterator it3 = arrayList2.iterator();
        while (it3.hasNext()) {
            C3364s6 c3364s62 = (C3364s6) it3.next();
            JSONObject jSONObjectA = C3381t6.a(c3364s62);
            if (c3364s62.o != null) {
                jSONObjectA.put("extras", new JSONObject(c3364s62.o));
            }
            jSONArray.put(jSONObjectA);
        }
        if (jSONArray.length() > 0) {
            jSONObject2.put("results_after", jSONArray);
        }
        JSONArray jSONArray2 = new JSONArray();
        ArrayList arrayList3 = new ArrayList(b70.c.u0(analytics, 10));
        Iterator it4 = analytics.iterator();
        while (it4.hasNext()) {
            arrayList3.add(Integer.valueOf(((C3398u6) it4.next()).f66013b));
        }
        Set setM1 = b70.g.M1(arrayList3);
        ConcurrentHashMap<Integer, String> concurrentHashMap = abstractC3466y6.f66318i;
        ArrayList arrayList4 = new ArrayList();
        Iterator<Map.Entry<Integer, String>> it5 = concurrentHashMap.entrySet().iterator();
        while (true) {
            boolean zHasNext = it5.hasNext();
            hVar = b70.h.f17594a;
            if (!zHasNext) {
                break;
            }
            Map.Entry<Integer, String> next3 = it5.next();
            int iIntValue = next3.getKey().intValue();
            String value2 = next3.getValue();
            if (setM1.contains(Integer.valueOf(iIntValue))) {
                c3364s6A2 = null;
            } else {
                setM1.add(Integer.valueOf(iIntValue));
                C3364s6 c3364s63 = abstractC3466y6.f66317h.get(Integer.valueOf(iIntValue));
                if (c3364s63 != null) {
                    ?? r82 = (Map) abstractC3466y6.f66316g.get(Integer.valueOf(iIntValue));
                    if (r82 != 0) {
                        hVar = r82;
                    }
                    c3364s6A2 = C3364s6.a(c3364s63, null, value2, hVar, 8191);
                }
            }
            if (c3364s6A2 != null) {
                arrayList4.add(c3364s6A2);
            }
        }
        IntRange intRangeM0 = kotlin.ranges.a.m0(0, abstractC3466y6.f66315f.get());
        ArrayList arrayList5 = new ArrayList();
        IntProgressionIterator it6 = intRangeM0.iterator();
        while (it6.f71911c) {
            int iNextInt = it6.nextInt();
            if (setM1.contains(Integer.valueOf(iNextInt)) || (c3364s6 = abstractC3466y6.f66317h.get(Integer.valueOf(iNextInt))) == null) {
                c3364s6A = null;
            } else {
                Map<String, String> map = abstractC3466y6.f66316g.get(Integer.valueOf(iNextInt));
                if (map == null) {
                    map = hVar;
                }
                c3364s6A = C3364s6.a(c3364s6, null, "Untracked removal", map, 8191);
            }
            if (c3364s6A != null) {
                arrayList5.add(c3364s6A);
            }
        }
        Iterator it7 = b70.g.t1(arrayList5, arrayList4).iterator();
        while (it7.hasNext()) {
            C3364s6 c3364s64 = (C3364s6) it7.next();
            JSONObject jSONObjectA2 = C3381t6.a(c3364s64);
            if (c3364s64.o != null) {
                jSONObjectA2.put("extras", new JSONObject(c3364s64.o));
            }
            jSONArray2.put(jSONObjectA2);
        }
        if (jSONArray2.length() > 0) {
            jSONObject2.put("removals", jSONArray2);
        }
        return jSONObject2;
    }
}
