package defpackage;

import com.google.android.material.internal.It.KLTXZbnQvj;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class o94 {
    public static final LinkedHashMap a;
    public static final Map b;

    public static ArrayList a(String... strArr) {
        ArrayList arrayList = new ArrayList(strArr.length);
        for (String str : strArr) {
            y05 y05Var = new y05(str);
            arrayList.add(new mn1(y05Var.b(), y05Var.a.g()));
        }
        return arrayList;
    }

    public static void b(mn1 mn1Var, ArrayList arrayList) {
        for (Object obj : arrayList) {
            a.put(obj, mn1Var);
        }
    }

    static {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        a = linkedHashMap;
        b(gnc.x, a("java.util.ArrayList", "java.util.LinkedList"));
        b(gnc.y, a("java.util.HashSet", "java.util.TreeSet", "java.util.LinkedHashSet"));
        b(gnc.z, a("java.util.HashMap", "java.util.TreeMap", KLTXZbnQvj.JhAypvJrWrdOLE, "java.util.concurrent.ConcurrentHashMap", "java.util.concurrent.ConcurrentSkipListMap"));
        y05 y05Var = new y05("java.util.function.Function");
        b(new mn1(y05Var.b(), y05Var.a.g()), a("java.util.function.UnaryOperator"));
        y05 y05Var2 = new y05("java.util.function.BiFunction");
        b(new mn1(y05Var2.b(), y05Var2.a.g()), a("java.util.function.BinaryOperator"));
        ArrayList arrayList = new ArrayList(linkedHashMap.size());
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            arrayList.add(new f09(((mn1) entry.getKey()).a(), ((mn1) entry.getValue()).a()));
        }
        b = ei7.V(arrayList);
    }
}
