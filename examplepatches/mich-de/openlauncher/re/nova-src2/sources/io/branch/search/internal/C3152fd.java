package io.branch.search.internal;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: io.branch.search.internal.fd, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3152fd implements com.google.gson.u, com.google.gson.o {
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:56:0x014c A[Catch: Exception -> 0x0292, TryCatch #0 {Exception -> 0x0292, blocks: (B:3:0x001b, B:5:0x0029, B:7:0x0030, B:9:0x0038, B:11:0x003f, B:13:0x0047, B:16:0x004f, B:18:0x0057, B:21:0x005f, B:23:0x0067, B:24:0x007a, B:26:0x0080, B:29:0x0093, B:31:0x009b, B:32:0x00ae, B:34:0x00b4, B:37:0x00c7, B:40:0x00d3, B:41:0x00e8, B:43:0x00ee, B:45:0x0109, B:46:0x0112, B:48:0x0117, B:50:0x011f, B:51:0x0132, B:53:0x0138, B:54:0x0146, B:57:0x014e, B:59:0x0156, B:60:0x016b, B:62:0x0171, B:63:0x01a3, B:65:0x01a9, B:66:0x01b7, B:68:0x01bd, B:70:0x01ce, B:73:0x01e1, B:75:0x01e9, B:76:0x01fe, B:78:0x0204, B:79:0x0230, B:81:0x0236, B:82:0x0248, B:84:0x024e, B:86:0x0259, B:89:0x0260, B:91:0x0268, B:94:0x0271, B:96:0x0279, B:99:0x0281, B:100:0x0283, B:93:0x026e, B:88:0x025d, B:72:0x01d8, B:56:0x014c, B:47:0x0115, B:36:0x00c4, B:28:0x0090), top: B:103:0x001b }] */
    /* JADX WARN: Type inference failed for: r4v0, types: [java.util.List<java.lang.String>] */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v2, types: [java.util.List<java.lang.String>] */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v6, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r4v7, types: [java.util.ArrayList] */
    @Override // com.google.gson.o
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object deserialize(com.google.gson.p json, Type typeOfT, com.google.gson.n context) {
        ?? arrayList;
        ?? arrayList2;
        Map linkedHashMap;
        Set<String> setN1;
        Set<String> set;
        int i5;
        int i11;
        Map linkedHashMap2;
        Map linkedHashMap3;
        Intrinsics.g(json, "json");
        Intrinsics.g(typeOfT, "typeOfT");
        Intrinsics.g(context, "context");
        C3135ed c3135ed = new C3135ed(0);
        try {
            com.google.gson.r rVarJ = json.j();
            com.google.gson.p pVarA = S4.a(rVarJ, "appsLimit");
            int iG = pVarA != null ? pVarA.g() : 10;
            com.google.gson.p pVarA2 = S4.a(rVarJ, "relatedAppsLimit");
            int iG2 = pVarA2 != null ? pVarA2.g() : 10;
            com.google.gson.p pVarA3 = S4.a(rVarJ, "shortcutLimits");
            int iG3 = pVarA3 != null ? pVarA3.g() : 4;
            com.google.gson.p pVarA4 = S4.a(rVarJ, "shortcutsPerAppLimit");
            int iG4 = pVarA4 != null ? pVarA4.g() : -1;
            com.google.gson.p pVarA5 = S4.a(rVarJ, "searchMoreApps");
            if (pVarA5 != null) {
                com.google.gson.m mVarH = pVarA5.h();
                arrayList = new ArrayList(b70.c.u0(mVarH, 10));
                Iterator it = mVarH.f34793a.iterator();
                while (it.hasNext()) {
                    arrayList.add(((com.google.gson.p) it.next()).o());
                }
            } else {
                arrayList = c3135ed.f64400e;
            }
            List list = arrayList;
            com.google.gson.p pVarA6 = S4.a(rVarJ, "containerOrder");
            if (pVarA6 != null) {
                com.google.gson.m mVarH2 = pVarA6.h();
                arrayList2 = new ArrayList(b70.c.u0(mVarH2, 10));
                Iterator it2 = mVarH2.f34793a.iterator();
                while (it2.hasNext()) {
                    arrayList2.add(((com.google.gson.p) it2.next()).o());
                }
            } else {
                arrayList2 = c3135ed.f64401f;
            }
            List list2 = arrayList2;
            com.google.gson.p pVarA7 = S4.a(rVarJ, "containerTypes");
            if (pVarA7 != null) {
                com.google.gson.r rVarJ2 = pVarA7.j();
                linkedHashMap = new LinkedHashMap();
                Iterator it3 = ((hn.m) rVarJ2.f34795a.entrySet()).iterator();
                while (it3.hasNext()) {
                    Map.Entry entry = (Map.Entry) it3.next();
                    Intrinsics.f(entry, "(key, value)");
                    String key = (String) entry.getKey();
                    String strO = ((com.google.gson.p) entry.getValue()).o();
                    if (strO != null) {
                        Intrinsics.f(key, "key");
                        linkedHashMap.put(key, strO);
                        Unit unit = Unit.f71706a;
                    }
                }
                Unit unit2 = Unit.f71706a;
            } else {
                linkedHashMap = c3135ed.f64402g;
            }
            com.google.gson.p pVarA8 = S4.a(rVarJ, "containersWithAds");
            if (pVarA8 != null) {
                com.google.gson.m mVarH3 = pVarA8.h();
                ArrayList arrayList3 = new ArrayList(b70.c.u0(mVarH3, 10));
                Iterator it4 = mVarH3.f34793a.iterator();
                while (it4.hasNext()) {
                    arrayList3.add(((com.google.gson.p) it4.next()).o());
                }
                setN1 = b70.g.N1(arrayList3);
                if (setN1 == null) {
                    setN1 = c3135ed.f64403h;
                }
            }
            com.google.gson.p pVarA9 = S4.a(rVarJ, "supportedAdsTypesByContainer");
            if (pVarA9 != null) {
                com.google.gson.r rVarJ3 = pVarA9.j();
                linkedHashMap2 = new LinkedHashMap();
                Iterator it5 = ((hn.m) rVarJ3.f34795a.entrySet()).iterator();
                while (it5.hasNext()) {
                    Map.Entry entry2 = (Map.Entry) it5.next();
                    Intrinsics.f(entry2, "(key, value)");
                    String key2 = (String) entry2.getKey();
                    com.google.gson.m mVarH4 = ((com.google.gson.p) entry2.getValue()).h();
                    Set<String> set2 = setN1;
                    int i12 = iG;
                    int i13 = iG2;
                    ArrayList arrayList4 = new ArrayList(b70.c.u0(mVarH4, 10));
                    Iterator it6 = mVarH4.f34793a.iterator();
                    while (it6.hasNext()) {
                        arrayList4.add(((com.google.gson.p) it6.next()).o());
                    }
                    Set setN12 = b70.g.N1(arrayList4);
                    if (setN12 != null) {
                        Intrinsics.f(key2, "key");
                        linkedHashMap2.put(key2, setN12);
                        Unit unit3 = Unit.f71706a;
                    }
                    setN1 = set2;
                    iG = i12;
                    iG2 = i13;
                }
                set = setN1;
                i5 = iG;
                i11 = iG2;
                Unit unit4 = Unit.f71706a;
            } else {
                set = setN1;
                i5 = iG;
                i11 = iG2;
                linkedHashMap2 = c3135ed.f64404i;
            }
            Map map = linkedHashMap2;
            com.google.gson.p pVarA10 = S4.a(rVarJ, "adsOrderByContainer");
            if (pVarA10 != null) {
                com.google.gson.r rVarJ4 = pVarA10.j();
                linkedHashMap3 = new LinkedHashMap();
                Iterator it7 = ((hn.m) rVarJ4.f34795a.entrySet()).iterator();
                while (it7.hasNext()) {
                    Map.Entry entry3 = (Map.Entry) it7.next();
                    Intrinsics.f(entry3, "(key, value)");
                    String key3 = (String) entry3.getKey();
                    com.google.gson.m mVarH5 = ((com.google.gson.p) entry3.getValue()).h();
                    Iterator it8 = it7;
                    ArrayList arrayList5 = new ArrayList(b70.c.u0(mVarH5, 10));
                    Iterator it9 = mVarH5.f34793a.iterator();
                    while (it9.hasNext()) {
                        arrayList5.add(Integer.valueOf(((com.google.gson.p) it9.next()).g()));
                    }
                    Set setN13 = b70.g.N1(arrayList5);
                    if (setN13 != null) {
                        Intrinsics.f(key3, "key");
                        linkedHashMap3.put(key3, setN13);
                        Unit unit5 = Unit.f71706a;
                    }
                    it7 = it8;
                }
                Unit unit6 = Unit.f71706a;
            } else {
                linkedHashMap3 = c3135ed.f64405j;
            }
            Map map2 = linkedHashMap3;
            com.google.gson.p pVarA11 = S4.a(rVarJ, "isDeduplicationEnabled");
            boolean zD = pVarA11 != null ? pVarA11.d() : c3135ed.f64406k;
            com.google.gson.p pVarA12 = S4.a(rVarJ, "matchingType");
            String strO2 = pVarA12 != null ? pVarA12.o() : null;
            if (strO2 == null) {
                strO2 = c3135ed.f64407l;
            }
            return new C3135ed(i5, i11, iG3, iG4, list, list2, linkedHashMap, set, map, map2, zD, strO2);
        } catch (Exception unused) {
            return c3135ed;
        }
    }

    @Override // com.google.gson.u
    public final com.google.gson.p serialize(Object obj, Type typeOfSrc, com.google.gson.t context) {
        C3135ed src = (C3135ed) obj;
        Intrinsics.g(src, "src");
        Intrinsics.g(typeOfSrc, "typeOfSrc");
        Intrinsics.g(context, "context");
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.p("appsLimit", new com.google.gson.s(Integer.valueOf(src.f64396a)));
        rVar.p("relatedAppsLimit", new com.google.gson.s(Integer.valueOf(src.f64397b)));
        rVar.p("shortcutLimits", new com.google.gson.s(Integer.valueOf(src.f64398c)));
        rVar.p("shortcutsPerAppLimit", new com.google.gson.s(Integer.valueOf(src.f64399d)));
        com.google.gson.m mVar = new com.google.gson.m();
        Iterator<T> it = src.f64400e.iterator();
        while (it.hasNext()) {
            mVar.p(new com.google.gson.s((String) it.next()));
        }
        Unit unit = Unit.f71706a;
        rVar.p("searchMoreApps", mVar);
        com.google.gson.m mVar2 = new com.google.gson.m();
        Iterator<T> it2 = src.f64401f.iterator();
        while (it2.hasNext()) {
            mVar2.p(new com.google.gson.s((String) it2.next()));
        }
        Unit unit2 = Unit.f71706a;
        rVar.p("containerOrder", mVar2);
        com.google.gson.r rVar2 = new com.google.gson.r();
        for (Map.Entry<String, String> entry : src.f64402g.entrySet()) {
            rVar2.p(entry.getKey(), new com.google.gson.s(entry.getValue()));
        }
        Unit unit3 = Unit.f71706a;
        rVar.p("containerTypes", rVar2);
        com.google.gson.m mVar3 = new com.google.gson.m();
        Set<String> set = src.f64403h;
        if (set != null) {
            Iterator<T> it3 = set.iterator();
            while (it3.hasNext()) {
                mVar3.p(new com.google.gson.s((String) it3.next()));
            }
        }
        Unit unit4 = Unit.f71706a;
        rVar.p("containersWithAds", mVar3);
        com.google.gson.r rVar3 = new com.google.gson.r();
        Map<String, Set<String>> map = src.f64404i;
        if (map != null) {
            for (Map.Entry<String, Set<String>> entry2 : map.entrySet()) {
                String key = entry2.getKey();
                Set<String> value = entry2.getValue();
                com.google.gson.m mVar4 = new com.google.gson.m();
                Iterator<T> it4 = value.iterator();
                while (it4.hasNext()) {
                    mVar4.p(new com.google.gson.s((String) it4.next()));
                }
                Unit unit5 = Unit.f71706a;
                rVar3.p(key, mVar4);
            }
        }
        Unit unit6 = Unit.f71706a;
        rVar.p("supportedAdsTypesByContainer", rVar3);
        com.google.gson.r rVar4 = new com.google.gson.r();
        Map<String, Set<Integer>> map2 = src.f64405j;
        if (map2 != null) {
            for (Map.Entry<String, Set<Integer>> entry3 : map2.entrySet()) {
                String key2 = entry3.getKey();
                Set<Integer> value2 = entry3.getValue();
                com.google.gson.m mVar5 = new com.google.gson.m();
                Iterator<T> it5 = value2.iterator();
                while (it5.hasNext()) {
                    mVar5.p(new com.google.gson.s(Integer.valueOf(((Number) it5.next()).intValue())));
                }
                Unit unit7 = Unit.f71706a;
                rVar4.p(key2, mVar5);
            }
        }
        Unit unit8 = Unit.f71706a;
        rVar.p("adsOrderByContainer", rVar4);
        rVar.p("isDeduplicationEnabled", new com.google.gson.s(Boolean.valueOf(src.f64406k)));
        rVar.p("matchingType", new com.google.gson.s(src.f64407l));
        return rVar;
    }
}
