package defpackage;

import com.medium.android.admin.stagebranch.uG.peNPu;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class mlc {
    public static final ArrayList a;
    public static final ArrayList b;
    public static final Map c;
    public static final LinkedHashMap d;
    public static final Set e;
    public static final Set f;
    public static final ilc g;
    public static final Map h;
    public static final LinkedHashMap i;
    public static final HashSet j;
    public static final LinkedHashMap k;

    static {
        Set<String> setS0 = k80.S0(new String[]{"containsAll", "removeAll", "retainAll"});
        ArrayList arrayList = new ArrayList(cu1.k0(setS0, 10));
        for (String str : setS0) {
            String desc = pf6.BOOLEAN.getDesc();
            desc.getClass();
            arrayList.add(aq7.u("java/util/Collection", str, "Ljava/util/Collection;", desc));
        }
        a = arrayList;
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            arrayList2.add(((ilc) it2.next()).e);
        }
        b = arrayList2;
        ArrayList arrayList3 = a;
        ArrayList arrayList4 = new ArrayList(cu1.k0(arrayList3, 10));
        Iterator it3 = arrayList3.iterator();
        while (it3.hasNext()) {
            arrayList4.add(((ilc) it3.next()).b.b());
        }
        String strConcat = "java/util/".concat("Collection");
        pf6 pf6Var = pf6.BOOLEAN;
        String desc2 = pf6Var.getDesc();
        desc2.getClass();
        ilc ilcVarU = aq7.u(strConcat, "contains", "Ljava/lang/Object;", desc2);
        llc llcVar = llc.FALSE;
        f09 f09Var = new f09(ilcVarU, llcVar);
        String strConcat2 = "java/util/".concat("Collection");
        String desc3 = pf6Var.getDesc();
        desc3.getClass();
        f09 f09Var2 = new f09(aq7.u(strConcat2, "remove", "Ljava/lang/Object;", desc3), llcVar);
        String strConcat3 = "java/util/".concat("Map");
        String desc4 = pf6Var.getDesc();
        desc4.getClass();
        f09 f09Var3 = new f09(aq7.u(strConcat3, "containsKey", "Ljava/lang/Object;", desc4), llcVar);
        String strConcat4 = "java/util/".concat("Map");
        String desc5 = pf6Var.getDesc();
        desc5.getClass();
        f09 f09Var4 = new f09(aq7.u(strConcat4, "containsValue", "Ljava/lang/Object;", desc5), llcVar);
        String strConcat5 = "java/util/".concat("Map");
        String desc6 = pf6Var.getDesc();
        desc6.getClass();
        f09 f09Var5 = new f09(aq7.u(strConcat5, "remove", "Ljava/lang/Object;Ljava/lang/Object;", desc6), llcVar);
        f09 f09Var6 = new f09(aq7.u("java/util/".concat("Map"), "getOrDefault", "Ljava/lang/Object;Ljava/lang/Object;", "Ljava/lang/Object;"), llc.MAP_GET_OR_DEFAULT);
        ilc ilcVarU2 = aq7.u("java/util/".concat("Map"), "get", "Ljava/lang/Object;", "Ljava/lang/Object;");
        llc llcVar2 = llc.NULL;
        f09 f09Var7 = new f09(ilcVarU2, llcVar2);
        f09 f09Var8 = new f09(aq7.u("java/util/".concat("Map"), "remove", "Ljava/lang/Object;", "Ljava/lang/Object;"), llcVar2);
        String strConcat6 = "java/util/".concat("List");
        pf6 pf6Var2 = pf6.INT;
        String desc7 = pf6Var2.getDesc();
        desc7.getClass();
        ilc ilcVarU3 = aq7.u(strConcat6, "indexOf", "Ljava/lang/Object;", desc7);
        llc llcVar3 = llc.INDEX;
        f09 f09Var9 = new f09(ilcVarU3, llcVar3);
        String strConcat7 = "java/util/".concat("List");
        String desc8 = pf6Var2.getDesc();
        desc8.getClass();
        f09 f09Var10 = new f09(aq7.u(strConcat7, "lastIndexOf", "Ljava/lang/Object;", desc8), llcVar3);
        boolean z = false;
        Map mapQ = ei7.Q(f09Var, f09Var2, f09Var3, f09Var4, f09Var5, f09Var6, f09Var7, f09Var8, f09Var9, f09Var10);
        c = mapQ;
        LinkedHashMap linkedHashMap = new LinkedHashMap(ei7.P(mapQ.size()));
        for (Map.Entry entry : mapQ.entrySet()) {
            linkedHashMap.put(((ilc) entry.getKey()).e, entry.getValue());
            z = z;
        }
        boolean z2 = z;
        d = linkedHashMap;
        LinkedHashSet linkedHashSetV = qo7.v(c.keySet(), a);
        ArrayList arrayList5 = new ArrayList(cu1.k0(linkedHashSetV, 10));
        Iterator it4 = linkedHashSetV.iterator();
        while (it4.hasNext()) {
            arrayList5.add(((ilc) it4.next()).b);
        }
        e = bu1.q1(arrayList5);
        ArrayList arrayList6 = new ArrayList(cu1.k0(linkedHashSetV, 10));
        Iterator it5 = linkedHashSetV.iterator();
        while (it5.hasNext()) {
            arrayList6.add(((ilc) it5.next()).e);
        }
        f = bu1.q1(arrayList6);
        pf6 pf6Var3 = pf6.INT;
        String desc9 = pf6Var3.getDesc();
        desc9.getClass();
        ilc ilcVarU4 = aq7.u("java/util/List", "removeAt", desc9, "Ljava/lang/Object;");
        g = ilcVarU4;
        String strConcat8 = "java/lang/".concat("Number");
        String desc10 = pf6.BYTE.getDesc();
        desc10.getClass();
        f09 f09Var11 = new f09(aq7.u(strConcat8, "toByte", "", desc10), n98.e("byteValue"));
        String strConcat9 = "java/lang/".concat("Number");
        String desc11 = pf6.SHORT.getDesc();
        desc11.getClass();
        f09 f09Var12 = new f09(aq7.u(strConcat9, "toShort", "", desc11), n98.e("shortValue"));
        String strConcat10 = "java/lang/".concat("Number");
        String desc12 = pf6Var3.getDesc();
        desc12.getClass();
        f09 f09Var13 = new f09(aq7.u(strConcat10, "toInt", "", desc12), n98.e("intValue"));
        String strConcat11 = "java/lang/".concat("Number");
        String desc13 = pf6.LONG.getDesc();
        desc13.getClass();
        f09 f09Var14 = new f09(aq7.u(strConcat11, "toLong", "", desc13), n98.e("longValue"));
        String strConcat12 = "java/lang/".concat("Number");
        String desc14 = pf6.FLOAT.getDesc();
        desc14.getClass();
        f09 f09Var15 = new f09(aq7.u(strConcat12, "toFloat", "", desc14), n98.e("floatValue"));
        String strConcat13 = "java/lang/".concat("Number");
        String desc15 = pf6.DOUBLE.getDesc();
        desc15.getClass();
        f09 f09Var16 = new f09(aq7.u(strConcat13, "toDouble", "", desc15), n98.e("doubleValue"));
        f09 f09Var17 = new f09(ilcVarU4, n98.e("remove"));
        String strConcat14 = "java/lang/".concat("CharSequence");
        String desc16 = pf6Var3.getDesc();
        desc16.getClass();
        String desc17 = pf6.CHAR.getDesc();
        desc17.getClass();
        f09 f09Var18 = new f09(aq7.u(strConcat14, "get", desc16, desc17), n98.e("charAt"));
        f09 f09Var19 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicInteger"), "load", "", "I"), n98.e("get"));
        f09 f09Var20 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicInteger"), "store", "I", "V"), n98.e("set"));
        f09 f09Var21 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicInteger"), "exchange", "I", "I"), n98.e("getAndSet"));
        f09 f09Var22 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicInteger"), "fetchAndAdd", "I", "I"), n98.e("getAndAdd"));
        f09 f09Var23 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicInteger"), "addAndFetch", "I", "I"), n98.e("addAndGet"));
        f09 f09Var24 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicLong"), "load", "", "J"), n98.e("get"));
        f09 f09Var25 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicLong"), "store", "J", "V"), n98.e("set"));
        f09 f09Var26 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicLong"), "exchange", "J", "J"), n98.e("getAndSet"));
        f09 f09Var27 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicLong"), "fetchAndAdd", "J", "J"), n98.e("getAndAdd"));
        f09 f09Var28 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicLong"), "addAndFetch", "J", "J"), n98.e("addAndGet"));
        f09 f09Var29 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicBoolean"), "load", "", "Z"), n98.e("get"));
        f09 f09Var30 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicBoolean"), "store", "Z", "V"), n98.e("set"));
        f09 f09Var31 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicBoolean"), "exchange", "Z", "Z"), n98.e("getAndSet"));
        f09 f09Var32 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicReference"), "load", "", "Ljava/lang/Object;"), n98.e("get"));
        f09 f09Var33 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicReference"), "store", "Ljava/lang/Object;", "V"), n98.e("set"));
        f09 f09Var34 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicReference"), "exchange", "Ljava/lang/Object;", "Ljava/lang/Object;"), n98.e("getAndSet"));
        f09 f09Var35 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicIntegerArray"), "loadAt", "I", "I"), n98.e("get"));
        f09 f09Var36 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicIntegerArray"), "storeAt", "II", "V"), n98.e("set"));
        f09 f09Var37 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicIntegerArray"), "exchangeAt", "II", "I"), n98.e("getAndSet"));
        f09 f09Var38 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicIntegerArray"), "compareAndSetAt", peNPu.vcCntPB, "Z"), n98.e("compareAndSet"));
        f09 f09Var39 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicIntegerArray"), "fetchAndAddAt", "II", "I"), n98.e("getAndAdd"));
        f09 f09Var40 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicIntegerArray"), "addAndFetchAt", "II", "I"), n98.e("addAndGet"));
        f09 f09Var41 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicLongArray"), "loadAt", "I", "J"), n98.e("get"));
        f09 f09Var42 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicLongArray"), "storeAt", "IJ", "V"), n98.e("set"));
        f09 f09Var43 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicLongArray"), "exchangeAt", "IJ", "J"), n98.e("getAndSet"));
        f09 f09Var44 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicLongArray"), "compareAndSetAt", "IJJ", "Z"), n98.e("compareAndSet"));
        f09 f09Var45 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicLongArray"), "fetchAndAddAt", "IJ", "J"), n98.e("getAndAdd"));
        f09 f09Var46 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicLongArray"), "addAndFetchAt", "IJ", "J"), n98.e("addAndGet"));
        f09 f09Var47 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicReferenceArray"), "loadAt", "I", "Ljava/lang/Object;"), n98.e("get"));
        f09 f09Var48 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicReferenceArray"), "storeAt", "ILjava/lang/Object;", "V"), n98.e("set"));
        f09 f09Var49 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicReferenceArray"), "exchangeAt", "ILjava/lang/Object;", "Ljava/lang/Object;"), n98.e("getAndSet"));
        f09 f09Var50 = new f09(aq7.u("java/util/concurrent/atomic/".concat("AtomicReferenceArray"), "compareAndSetAt", "ILjava/lang/Object;Ljava/lang/Object;", "Z"), n98.e("compareAndSet"));
        f09[] f09VarArr = new f09[40];
        f09VarArr[z2 ? 1 : 0] = f09Var11;
        f09VarArr[1] = f09Var12;
        f09VarArr[2] = f09Var13;
        f09VarArr[3] = f09Var14;
        f09VarArr[4] = f09Var15;
        f09VarArr[5] = f09Var16;
        f09VarArr[6] = f09Var17;
        f09VarArr[7] = f09Var18;
        f09VarArr[8] = f09Var19;
        f09VarArr[9] = f09Var20;
        f09VarArr[10] = f09Var21;
        f09VarArr[11] = f09Var22;
        f09VarArr[12] = f09Var23;
        f09VarArr[13] = f09Var24;
        f09VarArr[14] = f09Var25;
        f09VarArr[15] = f09Var26;
        f09VarArr[16] = f09Var27;
        f09VarArr[17] = f09Var28;
        f09VarArr[18] = f09Var29;
        f09VarArr[19] = f09Var30;
        f09VarArr[20] = f09Var31;
        f09VarArr[21] = f09Var32;
        f09VarArr[22] = f09Var33;
        f09VarArr[23] = f09Var34;
        f09VarArr[24] = f09Var35;
        f09VarArr[25] = f09Var36;
        f09VarArr[26] = f09Var37;
        f09VarArr[27] = f09Var38;
        f09VarArr[28] = f09Var39;
        f09VarArr[29] = f09Var40;
        f09VarArr[30] = f09Var41;
        f09VarArr[31] = f09Var42;
        f09VarArr[32] = f09Var43;
        f09VarArr[33] = f09Var44;
        f09VarArr[34] = f09Var45;
        f09VarArr[35] = f09Var46;
        f09VarArr[36] = f09Var47;
        f09VarArr[37] = f09Var48;
        f09VarArr[38] = f09Var49;
        f09VarArr[39] = f09Var50;
        Map mapQ2 = ei7.Q(f09VarArr);
        h = mapQ2;
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(ei7.P(mapQ2.size()));
        for (Map.Entry entry2 : mapQ2.entrySet()) {
            linkedHashMap2.put(((ilc) entry2.getKey()).e, entry2.getValue());
        }
        i = linkedHashMap2;
        Map map = h;
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (Map.Entry entry3 : map.entrySet()) {
            ilc ilcVar = (ilc) entry3.getKey();
            n98 n98Var = (n98) entry3.getValue();
            String str2 = ilcVar.a;
            String str3 = ilcVar.c;
            String str4 = ilcVar.d;
            n98Var.getClass();
            linkedHashSet.add(str2 + '.' + (n98Var + '(' + str3 + ')' + str4));
        }
        Set setKeySet = h.keySet();
        HashSet hashSet = new HashSet();
        Iterator it6 = setKeySet.iterator();
        while (it6.hasNext()) {
            hashSet.add(((ilc) it6.next()).b);
        }
        j = hashSet;
        Set<Map.Entry> setEntrySet = h.entrySet();
        ArrayList<f09> arrayList7 = new ArrayList(cu1.k0(setEntrySet, 10));
        for (Map.Entry entry4 : setEntrySet) {
            arrayList7.add(new f09(((ilc) entry4.getKey()).b, entry4.getValue()));
        }
        int iP = ei7.P(cu1.k0(arrayList7, 10));
        LinkedHashMap linkedHashMap3 = new LinkedHashMap(iP >= 16 ? iP : 16);
        for (f09 f09Var51 : arrayList7) {
            linkedHashMap3.put((n98) f09Var51.b, (n98) f09Var51.a);
        }
        k = linkedHashMap3;
    }
}
