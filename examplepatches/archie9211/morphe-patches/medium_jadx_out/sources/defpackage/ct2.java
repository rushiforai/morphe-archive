package defpackage;

import j$.util.DesugarCollections;
import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ct2 {
    public LinkedHashMap a;

    public ct2(int i, boolean z) {
        switch (i) {
            case 1:
                ny3<Map.Entry> ny3Var = ny3.a;
                int iP = ei7.P(cu1.k0(ny3Var, 10));
                LinkedHashMap linkedHashMap = new LinkedHashMap(iP < 16 ? 16 : iP);
                for (Map.Entry entry : ny3Var) {
                    String str = (String) entry.getKey();
                    Locale locale = Locale.US;
                    locale.getClass();
                    String lowerCase = str.toLowerCase(locale);
                    lowerCase.getClass();
                    linkedHashMap.put(lowerCase, entry.getValue());
                }
                this.a = linkedHashMap;
                break;
            case 2:
                this.a = new LinkedHashMap(0, 0.75f, true);
                break;
            case 3:
            default:
                this.a = new LinkedHashMap();
                break;
            case 4:
                this.a = new LinkedHashMap();
                break;
            case 5:
                this.a = new LinkedHashMap();
                break;
        }
    }

    public dt2 a() {
        dt2 dt2Var = new dt2(this.a);
        ht2.E0(dt2Var);
        return dt2Var;
    }

    public Map b() {
        LinkedHashMap linkedHashMap = this.a;
        return linkedHashMap.isEmpty() ? Collections.EMPTY_MAP : DesugarCollections.unmodifiableMap(linkedHashMap);
    }

    public void c(Serializable serializable, Object obj) {
        this.a.put(serializable, obj);
    }

    public void d(String str, Object obj) {
        Object[] objArr;
        str.getClass();
        LinkedHashMap linkedHashMap = this.a;
        if (obj == null) {
            obj = null;
        } else {
            Class<?> cls = obj.getClass();
            s1b s1bVar = n1b.a;
            wg6 wg6VarB = s1bVar.b(cls);
            if (!wg6VarB.equals(s1bVar.b(Boolean.TYPE)) && !wg6VarB.equals(s1bVar.b(Byte.TYPE)) && !wg6VarB.equals(s1bVar.b(Integer.TYPE)) && !wg6VarB.equals(s1bVar.b(Long.TYPE)) && !wg6VarB.equals(s1bVar.b(Float.TYPE)) && !wg6VarB.equals(s1bVar.b(Double.TYPE)) && !wg6VarB.equals(s1bVar.b(String.class)) && !wg6VarB.equals(s1bVar.b(Boolean[].class)) && !wg6VarB.equals(s1bVar.b(Byte[].class)) && !wg6VarB.equals(s1bVar.b(Integer[].class)) && !wg6VarB.equals(s1bVar.b(Long[].class)) && !wg6VarB.equals(s1bVar.b(Float[].class)) && !wg6VarB.equals(s1bVar.b(Double[].class)) && !wg6VarB.equals(s1bVar.b(String[].class))) {
                int i = 0;
                if (wg6VarB.equals(s1bVar.b(boolean[].class))) {
                    boolean[] zArr = (boolean[]) obj;
                    String str2 = su2.a;
                    int length = zArr.length;
                    objArr = new Boolean[length];
                    while (i < length) {
                        objArr[i] = Boolean.valueOf(zArr[i]);
                        i++;
                    }
                } else if (wg6VarB.equals(s1bVar.b(byte[].class))) {
                    byte[] bArr = (byte[]) obj;
                    String str3 = su2.a;
                    int length2 = bArr.length;
                    objArr = new Byte[length2];
                    while (i < length2) {
                        objArr[i] = Byte.valueOf(bArr[i]);
                        i++;
                    }
                } else if (wg6VarB.equals(s1bVar.b(int[].class))) {
                    int[] iArr = (int[]) obj;
                    String str4 = su2.a;
                    int length3 = iArr.length;
                    objArr = new Integer[length3];
                    while (i < length3) {
                        objArr[i] = Integer.valueOf(iArr[i]);
                        i++;
                    }
                } else if (wg6VarB.equals(s1bVar.b(long[].class))) {
                    long[] jArr = (long[]) obj;
                    String str5 = su2.a;
                    int length4 = jArr.length;
                    objArr = new Long[length4];
                    while (i < length4) {
                        objArr[i] = Long.valueOf(jArr[i]);
                        i++;
                    }
                } else if (wg6VarB.equals(s1bVar.b(float[].class))) {
                    float[] fArr = (float[]) obj;
                    String str6 = su2.a;
                    int length5 = fArr.length;
                    objArr = new Float[length5];
                    while (i < length5) {
                        objArr[i] = Float.valueOf(fArr[i]);
                        i++;
                    }
                } else {
                    if (!wg6VarB.equals(s1bVar.b(double[].class))) {
                        ywb.j("Key ", str, " has invalid type ", wg6VarB);
                        return;
                    }
                    double[] dArr = (double[]) obj;
                    String str7 = su2.a;
                    int length6 = dArr.length;
                    objArr = new Double[length6];
                    while (i < length6) {
                        objArr[i] = Double.valueOf(dArr[i]);
                        i++;
                    }
                }
                obj = objArr;
            }
        }
        linkedHashMap.put(str, obj);
    }

    public void e(HashMap map) {
        for (Map.Entry entry : map.entrySet()) {
            d((String) entry.getKey(), entry.getValue());
        }
    }

    public unc f(h7f h7fVar) {
        h7fVar.getClass();
        return (unc) this.a.remove(h7fVar);
    }

    public List g(String str) {
        str.getClass();
        LinkedHashMap linkedHashMap = this.a;
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            if (g76.L(((h7f) entry.getKey()).a, str)) {
                linkedHashMap2.put(entry.getKey(), entry.getValue());
            }
        }
        Iterator it2 = linkedHashMap2.keySet().iterator();
        while (it2.hasNext()) {
            linkedHashMap.remove((h7f) it2.next());
        }
        return bu1.m1(linkedHashMap2.values());
    }

    public unc h(h7f h7fVar) {
        LinkedHashMap linkedHashMap = this.a;
        Object uncVar = linkedHashMap.get(h7fVar);
        if (uncVar == null) {
            uncVar = new unc(h7fVar);
            linkedHashMap.put(h7fVar, uncVar);
        }
        return (unc) uncVar;
    }

    public ct2(int i) {
        this.a = new LinkedHashMap(i < 3 ? i + 1 : i < 1073741824 ? (int) ((i / 0.75f) + 1.0f) : Integer.MAX_VALUE);
    }
}
