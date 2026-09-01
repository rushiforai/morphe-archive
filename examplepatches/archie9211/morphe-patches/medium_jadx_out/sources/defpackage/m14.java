package defpackage;

import com.medium.android.core.navigation.NotificationFilterType;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m14 extends p4d implements c55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public /* synthetic */ Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m14(Object obj, n92 n92Var, int i) {
        super(3, n92Var);
        this.b = i;
        this.d = obj;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) throws Throwable {
        int i = this.b;
        int i2 = 3;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                m14 m14Var = new m14((h00) this.d, (n92) obj3, 0);
                m14Var.c = (Throwable) obj2;
                m14Var.invokeSuspend(c1eVar);
                throw null;
            case 1:
                m14 m14Var2 = new m14(i2, 1, (n92) obj3);
                m14Var2.c = (x64) obj;
                m14Var2.d = (az5) obj2;
                return m14Var2.invokeSuspend(c1eVar);
            case 2:
                m14 m14Var3 = new m14((xm4) this.d, (n92) obj3, 2);
                m14Var3.c = (Map) obj2;
                return m14Var3.invokeSuspend(c1eVar);
            case 3:
                m14 m14Var4 = new m14(i2, i2, (n92) obj3);
                m14Var4.c = (Boolean) obj;
                m14Var4.d = (Boolean) obj2;
                return m14Var4.invokeSuspend(c1eVar);
            case 4:
                m14 m14Var5 = new m14(i2, 4, (n92) obj3);
                m14Var5.c = (NotificationFilterType) obj;
                m14Var5.d = (Map) obj2;
                return m14Var5.invokeSuspend(c1eVar);
            case 5:
                m14 m14Var6 = new m14(i2, 5, (n92) obj3);
                m14Var6.c = (rba) obj;
                m14Var6.d = (String) obj2;
                return m14Var6.invokeSuspend(c1eVar);
            case 6:
                m14 m14Var7 = new m14(i2, 6, (n92) obj3);
                m14Var7.c = (z6c) obj;
                m14Var7.d = (b78) obj2;
                return m14Var7.invokeSuspend(c1eVar);
            case 7:
                m14 m14Var8 = new m14(i2, 7, (n92) obj3);
                m14Var8.c = (String) obj;
                m14Var8.d = (ncd) obj2;
                return m14Var8.invokeSuspend(c1eVar);
            default:
                m14 m14Var9 = new m14(i2, 8, (n92) obj3);
                m14Var9.c = (qz8) obj;
                m14Var9.d = (Map) obj2;
                return m14Var9.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        qm4 nm4Var;
        String str;
        int iIntValue;
        switch (this.b) {
            case 0:
                Throwable th = (Throwable) this.c;
                br7.v(obj);
                String strX = ev6.x("GraphQL operation ", ((h00) this.d).a.name(), " failed");
                Map mapSingletonMap = Collections.singletonMap("error_type", gv2.GRAPHQL);
                mapSingletonMap.getClass();
                wld.a.e(th, strX, new Object[0]);
                hy2 hy2Var = g01.y;
                if (hy2Var == null) {
                    throw th;
                }
                hy2Var.a(strX, th, mapSingletonMap);
                throw th;
            case 1:
                x64 x64Var = (x64) this.c;
                az5 az5Var = (az5) this.d;
                br7.v(obj);
                if (!(x64Var instanceof u64)) {
                    return x64Var;
                }
                u64 u64Var = (u64) x64Var;
                az5 az5Var2 = u64Var.a;
                az5 az5Var3 = u64Var.b;
                az5 az5Var4 = u64Var.c;
                az5 az5Var5 = u64Var.d;
                az5 az5Var6 = u64Var.e;
                boolean z = u64Var.g;
                SourceParameter sourceParameter = u64Var.h;
                az5Var2.getClass();
                az5Var3.getClass();
                az5Var4.getClass();
                az5Var5.getClass();
                az5Var6.getClass();
                az5Var.getClass();
                sourceParameter.getClass();
                return new u64(az5Var2, az5Var3, az5Var4, az5Var5, az5Var6, az5Var, z, sourceParameter);
            case 2:
                Map map = (Map) this.c;
                br7.v(obj);
                g04<nl4> entries = nl4.getEntries();
                dm4 dm4Var = ((xm4) this.d).e;
                ArrayList arrayList = new ArrayList();
                for (nl4 nl4Var : entries) {
                    if (d46.P(nl4Var.getType(), n1b.a(Integer.TYPE))) {
                        String serverId = nl4Var.getServerId();
                        dm4Var.getClass();
                        am4 am4VarA = dm4Var.a();
                        am4VarA.getClass();
                        Object obj2 = ((Map) am4VarA.b.get()).get(nl4Var);
                        if (obj2 == null || !(obj2 instanceof Integer)) {
                            Object obj3 = ((Map) dm4Var.g.get()).get(nl4Var.getSharedPreferencesKey());
                            iIntValue = obj3 instanceof Integer ? ((Number) obj3).intValue() : 0;
                        } else {
                            iIntValue = ((Number) obj2).intValue();
                        }
                        nm4Var = new om4(serverId, iIntValue, nl4Var.getExperimentDesc());
                    } else if (d46.P(nl4Var.getType(), n1b.a(String.class))) {
                        String serverId2 = nl4Var.getServerId();
                        dm4Var.getClass();
                        am4 am4VarA2 = dm4Var.a();
                        am4VarA2.getClass();
                        Object obj4 = ((Map) am4VarA2.b.get()).get(nl4Var);
                        if (obj4 == null || !(obj4 instanceof String)) {
                            Object obj5 = ((Map) dm4Var.g.get()).get(nl4Var.getSharedPreferencesKey());
                            str = obj5 instanceof String ? (String) obj5 : "";
                        } else {
                            str = (String) obj4;
                        }
                        nm4Var = new pm4(serverId2, str, nl4Var.getExperimentDesc());
                    } else if (d46.P(nl4Var.getType(), n1b.a(Boolean.TYPE))) {
                        nm4Var = new nm4(nl4Var.getServerId(), dm4Var.b(nl4Var), nl4Var.getExperimentDesc());
                    } else {
                        wld.a.m(ev6.x("Flag ", nl4Var.getServerId(), " is not supported"), new Object[0]);
                        nm4Var = null;
                    }
                    if (nm4Var != null) {
                        arrayList.add(nm4Var);
                    }
                }
                ArrayList arrayList2 = new ArrayList(map.size());
                for (Map.Entry entry : map.entrySet()) {
                    arrayList2.add(new rm4((String) entry.getKey(), ((Boolean) entry.getValue()).booleanValue()));
                }
                return new sm4(arrayList, arrayList2);
            case 3:
                Boolean bool = (Boolean) this.c;
                Boolean bool2 = (Boolean) this.d;
                br7.v(obj);
                return new f09(Boolean.valueOf(bool != null ? bool.booleanValue() : true), Boolean.valueOf(bool2 != null ? bool2.booleanValue() : false));
            case 4:
                NotificationFilterType notificationFilterType = (NotificationFilterType) this.c;
                Map map2 = (Map) this.d;
                br7.v(obj);
                return new gl8(notificationFilterType, map2);
            case 5:
                rba rbaVar = (rba) this.c;
                String str2 = (String) this.d;
                br7.v(obj);
                rbaVar.getClass();
                return (str2 == null || rbaVar != rba.MOST_POPULAR) ? rbaVar : rba.LATEST;
            case 6:
                br7.v(obj);
                z6c z6cVar = (z6c) this.c;
                b78 b78Var = (b78) this.d;
                Set setKeySet = b78Var.a().keySet();
                ArrayList arrayList3 = new ArrayList(cu1.k0(setKeySet, 10));
                Iterator it2 = setKeySet.iterator();
                while (it2.hasNext()) {
                    arrayList3.add(((ny9) it2.next()).a);
                }
                Map<String, ?> all = z6cVar.a.getAll();
                all.getClass();
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                for (Map.Entry<String, ?> entry2 : all.entrySet()) {
                    String key = entry2.getKey();
                    Set set = z6cVar.b;
                    if (set != null ? set.contains(key) : true) {
                        linkedHashMap.put(entry2.getKey(), entry2.getValue());
                    }
                }
                LinkedHashMap linkedHashMap2 = new LinkedHashMap(ei7.P(linkedHashMap.size()));
                for (Map.Entry entry3 : linkedHashMap.entrySet()) {
                    Object key2 = entry3.getKey();
                    Object value = entry3.getValue();
                    if (value instanceof Set) {
                        value = bu1.q1((Iterable) value);
                    }
                    linkedHashMap2.put(key2, value);
                }
                LinkedHashMap linkedHashMap3 = new LinkedHashMap();
                for (Map.Entry entry4 : linkedHashMap2.entrySet()) {
                    if (!arrayList3.contains((String) entry4.getKey())) {
                        linkedHashMap3.put(entry4.getKey(), entry4.getValue());
                    }
                }
                b78 b78Var2 = new b78(new LinkedHashMap(b78Var.a()), false);
                for (Map.Entry entry5 : linkedHashMap3.entrySet()) {
                    String str3 = (String) entry5.getKey();
                    Object value2 = entry5.getValue();
                    if (value2 instanceof Boolean) {
                        str3.getClass();
                        b78Var2.d(new ny9(str3), value2);
                    } else if (value2 instanceof Float) {
                        str3.getClass();
                        b78Var2.d(new ny9(str3), value2);
                    } else if (value2 instanceof Integer) {
                        str3.getClass();
                        b78Var2.d(new ny9(str3), value2);
                    } else if (value2 instanceof Long) {
                        str3.getClass();
                        b78Var2.d(new ny9(str3), value2);
                    } else if (value2 instanceof String) {
                        str3.getClass();
                        b78Var2.d(new ny9(str3), value2);
                    } else if (value2 instanceof Set) {
                        str3.getClass();
                        b78Var2.d(new ny9(str3), (Set) value2);
                    }
                }
                return new b78(new LinkedHashMap(b78Var2.a()), true);
            case 7:
                String str4 = (String) this.c;
                ncd ncdVar = (ncd) this.d;
                br7.v(obj);
                if (!(ncdVar instanceof kcd)) {
                    if ((ncdVar instanceof lcd) || g76.L(ncdVar, mcd.a)) {
                        return ncdVar;
                    }
                    ygf.a();
                    return null;
                }
                kcd kcdVar = (kcd) ncdVar;
                List<k9d> list = kcdVar.a;
                ArrayList arrayList4 = new ArrayList(cu1.k0(list, 10));
                for (k9d k9dVar : list) {
                    boolean zL = g76.L(k9dVar.a, str4);
                    String str5 = k9dVar.a;
                    String str6 = k9dVar.b;
                    SourceParameter sourceParameter2 = k9dVar.d;
                    str5.getClass();
                    arrayList4.add(new k9d(sourceParameter2, str5, str6, zL));
                }
                return new kcd(arrayList4, kcdVar.b);
            default:
                qz8 qz8Var = (qz8) this.c;
                Map map3 = (Map) this.d;
                br7.v(obj);
                return new f09(qz8Var, map3);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m14(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }
}
