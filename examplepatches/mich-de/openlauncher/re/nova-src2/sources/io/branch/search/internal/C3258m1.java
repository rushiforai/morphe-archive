package io.branch.search.internal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgressionIterator;
import kotlin.ranges.IntRange;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.m1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3258m1 {
    @NotNull
    public static final JSONObject a(@NotNull C3241l1 c3241l1, @NotNull List<C3275n1> entities) throws JSONException {
        C3072b1 c3072b1;
        Intrinsics.g(c3241l1, "<this>");
        Intrinsics.g(entities, "entities");
        JSONObject jSONObject = new JSONObject();
        C3174h1 c3174h1 = c3241l1.f64946d;
        Intrinsics.g(c3174h1, "<this>");
        JSONObject jSONObject2 = new JSONObject();
        jSONObject2.put("utc_timestamp", c3174h1.f64630a);
        jSONObject2.put("user_query", c3174h1.f64631b);
        jSONObject.put("request", jSONObject2);
        jSONObject.put("request_api", c3241l1.f64943a);
        jSONObject.put("request_id", c3241l1.f64948f);
        C3157g1 c3157g1 = c3241l1.f64951i;
        Intrinsics.g(c3157g1, "<this>");
        JSONObject jSONObject3 = new JSONObject();
        jSONObject3.put("container", c3157g1.f64543a);
        jSONObject.put("request_level_analytics", jSONObject3);
        JSONArray jSONArray = new JSONArray();
        ArrayList arrayList = new ArrayList(b70.c.u0(entities, 10));
        String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        int i5 = 1;
        for (C3275n1 c3275n1 : entities) {
            String str2 = c3275n1.f65301d.f63971c;
            i5 = !Intrinsics.b(str2, str) ? 1 : i5 + 1;
            Intrinsics.e(str2, "null cannot be cast to non-null type kotlin.String");
            arrayList.add(C3072b1.a(c3275n1.f65301d, Integer.valueOf(i5), null, 1535));
            str = str2;
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            jSONArray.put(C3089c1.a((C3072b1) it.next()));
        }
        if (jSONArray.length() > 0) {
            jSONObject.put("results_after", jSONArray);
        }
        JSONArray jSONArray2 = new JSONArray();
        ArrayList arrayList2 = new ArrayList(b70.c.u0(entities, 10));
        Iterator<T> it2 = entities.iterator();
        while (it2.hasNext()) {
            arrayList2.add(Integer.valueOf(((C3275n1) it2.next()).f65300c));
        }
        Set setM1 = b70.g.M1(arrayList2);
        IntRange intRangeM0 = kotlin.ranges.a.m0(0, c3241l1.f64949g.get());
        ArrayList arrayList3 = new ArrayList();
        IntProgressionIterator it3 = intRangeM0.iterator();
        while (it3.f71911c) {
            int iNextInt = it3.nextInt();
            C3072b1 c3072b1A = (setM1.contains(Integer.valueOf(iNextInt)) || (c3072b1 = c3241l1.f64952j.get(Integer.valueOf(iNextInt))) == null) ? null : C3072b1.a(c3072b1, null, "Untracked removal", 1023);
            if (c3072b1A != null) {
                arrayList3.add(c3072b1A);
            }
        }
        Iterator it4 = arrayList3.iterator();
        while (it4.hasNext()) {
            jSONArray2.put(C3089c1.a((C3072b1) it4.next()));
        }
        if (jSONArray2.length() > 0) {
            jSONObject.put("removals", jSONArray2);
        }
        return jSONObject;
    }
}
