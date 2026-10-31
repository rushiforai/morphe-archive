package com.google.android.gms.internal.measurement;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/* loaded from: classes3.dex */
public final class s1 implements Iterable, f6, b6 {

    /* renamed from: a, reason: collision with root package name */
    public final TreeMap f33042a;

    /* renamed from: b, reason: collision with root package name */
    public final TreeMap f33043b;

    public s1() {
        this.f33042a = new TreeMap();
        this.f33043b = new TreeMap();
    }

    @Override // com.google.android.gms.internal.measurement.b6
    public final f6 b(String str) {
        f6 f6Var;
        return "length".equals(str) ? new s3(Double.valueOf(j())) : (!e(str) || (f6Var = (f6) this.f33043b.get(str)) == null) ? f6.Qo : f6Var;
    }

    @Override // com.google.android.gms.internal.measurement.b6
    public final void c(String str, f6 f6Var) {
        TreeMap treeMap = this.f33043b;
        if (f6Var == null) {
            treeMap.remove(str);
        } else {
            treeMap.put(str, f6Var);
        }
    }

    @Override // com.google.android.gms.internal.measurement.b6
    public final boolean e(String str) {
        return "length".equals(str) || this.f33043b.containsKey(str);
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof s1)) {
            return false;
        }
        s1 s1Var = (s1) obj;
        if (j() != s1Var.j()) {
            return false;
        }
        TreeMap treeMap = this.f33042a;
        if (treeMap.isEmpty()) {
            return s1Var.f33042a.isEmpty();
        }
        for (int iIntValue = ((Integer) treeMap.firstKey()).intValue(); iIntValue <= ((Integer) treeMap.lastKey()).intValue(); iIntValue++) {
            if (!k(iIntValue).equals(s1Var.k(iIntValue))) {
                return false;
            }
        }
        return true;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:135:0x02e5, code lost:
    
        if (com.google.android.gms.internal.measurement.fb.e(r7, r2, (com.google.android.gms.internal.measurement.e6) r0, java.lang.Boolean.FALSE, java.lang.Boolean.TRUE).j() == r7.j()) goto L169;
     */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0294  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x02ae  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x02f1  */
    /* JADX WARN: Removed duplicated region for block: B:155:0x0351  */
    /* JADX WARN: Removed duplicated region for block: B:175:0x03ce  */
    /* JADX WARN: Removed duplicated region for block: B:185:0x0409  */
    /* JADX WARN: Removed duplicated region for block: B:203:0x0450  */
    /* JADX WARN: Removed duplicated region for block: B:210:0x046e  */
    /* JADX WARN: Removed duplicated region for block: B:222:0x04a8  */
    /* JADX WARN: Removed duplicated region for block: B:244:0x053e  */
    /* JADX WARN: Removed duplicated region for block: B:275:0x05e9  */
    /* JADX WARN: Removed duplicated region for block: B:286:0x061d  */
    /* JADX WARN: Removed duplicated region for block: B:332:0x0746  */
    /* JADX WARN: Removed duplicated region for block: B:336:0x0754  */
    /* JADX WARN: Removed duplicated region for block: B:351:0x07bd  */
    /* JADX WARN: Removed duplicated region for block: B:370:0x0825  */
    /* JADX WARN: Removed duplicated region for block: B:374:0x083d  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x01bf  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x01f7  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0203  */
    @Override // com.google.android.gms.internal.measurement.f6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final f6 f(String str, j8 j8Var, ArrayList arrayList) {
        String str2;
        String str3;
        Object obj;
        String str4;
        j8 j8Var2;
        String str5;
        Object obj2;
        s1 s1Var;
        ArrayList arrayList2;
        int iHashCode;
        TreeMap treeMap;
        double d5;
        double dJ;
        String strZzc;
        double dJ2;
        String str6 = "toString";
        String str7 = "splice";
        if (!"concat".equals(str) && !"every".equals(str) && !"filter".equals(str) && !"forEach".equals(str) && !"indexOf".equals(str) && !"join".equals(str) && !"lastIndexOf".equals(str) && !"map".equals(str) && !"pop".equals(str) && !"push".equals(str) && !"reduce".equals(str) && !"reduceRight".equals(str) && !"reverse".equals(str) && !"shift".equals(str) && !"slice".equals(str) && !"some".equals(str)) {
            str3 = "filter";
            str4 = "sort";
            if (str4.equals(str)) {
                str2 = "lastIndexOf";
                obj2 = "reduce";
            } else {
                obj2 = "reduce";
                if (str7.equals(str)) {
                    str2 = "lastIndexOf";
                    str7 = str7;
                } else {
                    str7 = str7;
                    if (str6.equals(str)) {
                        str2 = "lastIndexOf";
                        str6 = str6;
                    } else {
                        str6 = str6;
                        if (!"unshift".equals(str)) {
                            return b6.d(this, new i6(str), j8Var, arrayList);
                        }
                        str2 = "lastIndexOf";
                        str5 = "forEach";
                        obj = "unshift";
                        s1Var = this;
                        j8Var2 = j8Var;
                    }
                }
            }
            obj = "unshift";
            j8Var2 = j8Var;
            arrayList2 = arrayList;
            str5 = "forEach";
            s1Var = this;
            Double dValueOf = Double.valueOf(-1.0d);
            iHashCode = str.hashCode();
            TreeMap treeMap2 = s1Var.f33042a;
            f6 f6VarE = f6.Qo;
            TreeMap treeMap3 = treeMap2;
            t4 t4Var = null;
            switch (iHashCode) {
                case -1776922004:
                    String str8 = str6;
                    if (str.equals(str8)) {
                        gh.c(0, str8, arrayList2);
                        return new i6(s1Var.p(","));
                    }
                    throw new IllegalArgumentException("Command not supported");
                case -1354795244:
                    if (str.equals("concat")) {
                        s1 s1Var2 = (s1) s1Var.zzt();
                        if (!arrayList2.isEmpty()) {
                            Iterator it = arrayList2.iterator();
                            while (it.hasNext()) {
                                f6 f6VarE2 = ((l6) j8Var2.f32683c).e(j8Var2, (f6) it.next());
                                if (f6VarE2 instanceof x2) {
                                    throw new IllegalStateException("Failed evaluation of arguments");
                                }
                                int iJ = s1Var2.j();
                                if (f6VarE2 instanceof s1) {
                                    s1 s1Var3 = (s1) f6VarE2;
                                    Iterator itH = s1Var3.h();
                                    while (itH.hasNext()) {
                                        Integer num = (Integer) itH.next();
                                        s1Var2.l(num.intValue() + iJ, s1Var3.k(num.intValue()));
                                    }
                                } else {
                                    s1Var2.l(iJ, f6VarE2);
                                }
                            }
                        }
                        return s1Var2;
                    }
                    throw new IllegalArgumentException("Command not supported");
                case -1274492040:
                    String str9 = str3;
                    if (str.equals(str9)) {
                        gh.c(1, str9, arrayList2);
                        f6 f6VarE3 = ((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList2.get(0));
                        if (!(f6VarE3 instanceof e6)) {
                            throw new IllegalArgumentException("Callback should be a method");
                        }
                        if (treeMap3.size() == 0) {
                            return new s1();
                        }
                        s1 s1Var4 = (s1) s1Var.zzt();
                        s1 s1VarE = fb.e(s1Var, j8Var2, (e6) f6VarE3, null, Boolean.TRUE);
                        s1 s1Var5 = new s1();
                        Iterator itH2 = s1VarE.h();
                        while (itH2.hasNext()) {
                            s1Var5.l(s1Var5.j(), s1Var4.k(((Integer) itH2.next()).intValue()));
                        }
                        return s1Var5;
                    }
                    throw new IllegalArgumentException("Command not supported");
                case -934873754:
                    if (str.equals(obj2)) {
                        return fb.c(s1Var, j8Var2, arrayList2, true);
                    }
                    throw new IllegalArgumentException("Command not supported");
                case -895859076:
                    if (str.equals(str7)) {
                        if (arrayList2.isEmpty()) {
                            return new s1();
                        }
                        f6 f6Var = (f6) arrayList2.get(0);
                        l6 l6Var = (l6) j8Var2.f32683c;
                        l6 l6Var2 = (l6) j8Var2.f32683c;
                        int iL = (int) gh.l(l6Var.e(j8Var2, f6Var).zzd().doubleValue());
                        if (iL < 0) {
                            iL = Math.max(0, s1Var.j() + iL);
                        } else if (iL > s1Var.j()) {
                            iL = s1Var.j();
                        }
                        int iJ2 = s1Var.j();
                        s1 s1Var6 = new s1();
                        if (arrayList2.size() > 1) {
                            int iMax = Math.max(0, (int) gh.l(l6Var2.e(j8Var2, (f6) arrayList2.get(1)).zzd().doubleValue()));
                            if (iMax > 0) {
                                for (int i5 = iL; i5 < Math.min(iJ2, iL + iMax); i5++) {
                                    s1Var6.l(s1Var6.j(), s1Var.k(iL));
                                    s1Var.o(iL);
                                }
                            }
                            int i11 = 2;
                            if (arrayList2.size() > 2) {
                                while (i11 < arrayList2.size()) {
                                    f6 f6VarE4 = l6Var2.e(j8Var2, (f6) arrayList2.get(i11));
                                    if (f6VarE4 instanceof x2) {
                                        throw new IllegalArgumentException("Failed to parse elements to add");
                                    }
                                    int i12 = (iL + i11) - 2;
                                    if (i12 < 0) {
                                        throw new IllegalArgumentException(b.c0.p(new StringBuilder(String.valueOf(i12).length() + 21), "Invalid value index: ", i12));
                                    }
                                    if (i12 >= s1Var.j()) {
                                        s1Var.l(i12, f6VarE4);
                                        treeMap = treeMap3;
                                    } else {
                                        int iIntValue = ((Integer) treeMap3.lastKey()).intValue();
                                        while (iIntValue >= i12) {
                                            Integer numValueOf = Integer.valueOf(iIntValue);
                                            TreeMap treeMap4 = treeMap3;
                                            f6 f6Var2 = (f6) treeMap4.get(numValueOf);
                                            if (f6Var2 != null) {
                                                s1Var.l(iIntValue + 1, f6Var2);
                                                treeMap4.remove(numValueOf);
                                            }
                                            iIntValue--;
                                            treeMap3 = treeMap4;
                                        }
                                        treeMap = treeMap3;
                                        s1Var.l(i12, f6VarE4);
                                    }
                                    i11++;
                                    treeMap3 = treeMap;
                                }
                            }
                        } else {
                            while (iL < iJ2) {
                                s1Var6.l(s1Var6.j(), s1Var.k(iL));
                                s1Var.l(iL, null);
                                iL++;
                            }
                        }
                        return s1Var6;
                    }
                    throw new IllegalArgumentException("Command not supported");
                case -678635926:
                    String str10 = str5;
                    if (str.equals(str10)) {
                        gh.c(1, str10, arrayList2);
                        f6 f6VarE5 = ((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList2.get(0));
                        if (!(f6VarE5 instanceof e6)) {
                            throw new IllegalArgumentException("Callback should be a method");
                        }
                        if (treeMap3.size() != 0) {
                            fb.e(s1Var, j8Var2, (e6) f6VarE5, null, null);
                            return f6VarE;
                        }
                        return f6VarE;
                    }
                    throw new IllegalArgumentException("Command not supported");
                case -467511597:
                    String str11 = str2;
                    if (str.equals(str11)) {
                        gh.g(2, str11, arrayList2);
                        if (!arrayList2.isEmpty()) {
                            f6VarE = ((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList2.get(0));
                        }
                        f6 f6Var3 = f6VarE;
                        int iJ3 = s1Var.j() - 1;
                        if (arrayList2.size() > 1) {
                            f6 f6VarE6 = ((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList2.get(1));
                            dJ = Double.isNaN(f6VarE6.zzd().doubleValue()) ? s1Var.j() - 1 : gh.l(f6VarE6.zzd().doubleValue());
                            d5 = 0.0d;
                            if (dJ < 0.0d) {
                                dJ += s1Var.j();
                            }
                        } else {
                            d5 = 0.0d;
                            dJ = iJ3;
                        }
                        if (dJ < d5) {
                            return new s3(dValueOf);
                        }
                        for (int iMin = (int) Math.min(s1Var.j(), dJ); iMin >= 0; iMin--) {
                            if (s1Var.n(iMin) && gh.j(s1Var.k(iMin), f6Var3)) {
                                return new s3(Double.valueOf(iMin));
                            }
                        }
                        return new s3(dValueOf);
                    }
                    throw new IllegalArgumentException("Command not supported");
                case -277637751:
                    if (str.equals(obj)) {
                        if (!arrayList2.isEmpty()) {
                            s1 s1Var7 = new s1();
                            Iterator it2 = arrayList2.iterator();
                            while (it2.hasNext()) {
                                f6 f6VarE7 = ((l6) j8Var2.f32683c).e(j8Var2, (f6) it2.next());
                                if (f6VarE7 instanceof x2) {
                                    throw new IllegalStateException("Argument evaluation failed");
                                }
                                s1Var7.l(s1Var7.j(), f6VarE7);
                            }
                            int iJ4 = s1Var7.j();
                            Iterator itH3 = s1Var.h();
                            while (itH3.hasNext()) {
                                Integer num2 = (Integer) itH3.next();
                                s1Var7.l(num2.intValue() + iJ4, s1Var.k(num2.intValue()));
                            }
                            treeMap3.clear();
                            Iterator itH4 = s1Var7.h();
                            while (itH4.hasNext()) {
                                Integer num3 = (Integer) itH4.next();
                                s1Var.l(num3.intValue(), s1Var7.k(num3.intValue()));
                            }
                        }
                        return new s3(Double.valueOf(s1Var.j()));
                    }
                    throw new IllegalArgumentException("Command not supported");
                case 107868:
                    if (str.equals("map")) {
                        gh.c(1, "map", arrayList2);
                        f6 f6VarE8 = ((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList2.get(0));
                        if (f6VarE8 instanceof e6) {
                            return s1Var.j() == 0 ? new s1() : fb.e(s1Var, j8Var2, (e6) f6VarE8, null, null);
                        }
                        throw new IllegalArgumentException("Callback should be a method");
                    }
                    throw new IllegalArgumentException("Command not supported");
                case 111185:
                    if (str.equals("pop")) {
                        gh.c(0, "pop", arrayList2);
                        int iJ5 = s1Var.j();
                        if (iJ5 != 0) {
                            int i13 = iJ5 - 1;
                            f6 f6VarK = s1Var.k(i13);
                            s1Var.o(i13);
                            return f6VarK;
                        }
                        return f6VarE;
                    }
                    throw new IllegalArgumentException("Command not supported");
                case 3267882:
                    if (str.equals("join")) {
                        gh.g(1, "join", arrayList2);
                        if (s1Var.j() == 0) {
                            return f6.Xo;
                        }
                        if (arrayList2.isEmpty()) {
                            strZzc = ",";
                        } else {
                            f6 f6VarE9 = ((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList2.get(0));
                            strZzc = ((f6VarE9 instanceof d6) || (f6VarE9 instanceof j6)) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : f6VarE9.zzc();
                        }
                        return new i6(s1Var.p(strZzc));
                    }
                    throw new IllegalArgumentException("Command not supported");
                case 3452698:
                    if (str.equals("push")) {
                        if (!arrayList2.isEmpty()) {
                            Iterator it3 = arrayList2.iterator();
                            while (it3.hasNext()) {
                                s1Var.l(s1Var.j(), ((l6) j8Var2.f32683c).e(j8Var2, (f6) it3.next()));
                            }
                        }
                        return new s3(Double.valueOf(s1Var.j()));
                    }
                    throw new IllegalArgumentException("Command not supported");
                case 3536116:
                    if (str.equals("some")) {
                        gh.c(1, "some", arrayList2);
                        f6 f6VarE10 = ((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList2.get(0));
                        if (!(f6VarE10 instanceof t4)) {
                            throw new IllegalArgumentException("Callback should be a method");
                        }
                        if (s1Var.j() != 0) {
                            t4 t4Var2 = (t4) f6VarE10;
                            Iterator itH5 = s1Var.h();
                            while (itH5.hasNext()) {
                                int iIntValue2 = ((Integer) itH5.next()).intValue();
                                if (s1Var.n(iIntValue2) && t4Var2.a(j8Var2, Arrays.asList(s1Var.k(iIntValue2), new s3(Double.valueOf(iIntValue2)), s1Var)).zze().booleanValue()) {
                                    return f6.Vo;
                                }
                            }
                        }
                        return f6.Wo;
                    }
                    throw new IllegalArgumentException("Command not supported");
                case 3536286:
                    if (str.equals(str4)) {
                        gh.g(1, str4, arrayList2);
                        if (s1Var.j() >= 2) {
                            List listG = s1Var.g();
                            if (!arrayList2.isEmpty()) {
                                f6 f6VarE11 = ((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList2.get(0));
                                if (!(f6VarE11 instanceof t4)) {
                                    throw new IllegalArgumentException("Comparator should be a method");
                                }
                                t4Var = (t4) f6VarE11;
                            }
                            Collections.sort(listG, new m6(t4Var, j8Var2));
                            treeMap3.clear();
                            Iterator it4 = ((ArrayList) listG).iterator();
                            int i14 = 0;
                            while (it4.hasNext()) {
                                s1Var.l(i14, (f6) it4.next());
                                i14++;
                            }
                        }
                        return s1Var;
                    }
                    throw new IllegalArgumentException("Command not supported");
                case 96891675:
                    if (str.equals("every")) {
                        gh.c(1, "every", arrayList2);
                        f6 f6VarE12 = ((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList2.get(0));
                        if (!(f6VarE12 instanceof e6)) {
                            throw new IllegalArgumentException("Callback should be a method");
                        }
                        if (s1Var.j() != 0) {
                            break;
                        }
                        return f6.Vo;
                    }
                    throw new IllegalArgumentException("Command not supported");
                case 109407362:
                    if (str.equals("shift")) {
                        gh.c(0, "shift", arrayList2);
                        if (s1Var.j() != 0) {
                            f6 f6VarK2 = s1Var.k(0);
                            s1Var.o(0);
                            return f6VarK2;
                        }
                        return f6VarE;
                    }
                    throw new IllegalArgumentException("Command not supported");
                case 109526418:
                    if (str.equals("slice")) {
                        gh.g(2, "slice", arrayList2);
                        if (arrayList2.isEmpty()) {
                            return s1Var.zzt();
                        }
                        double dJ3 = s1Var.j();
                        double dL = gh.l(((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList2.get(0)).zzd().doubleValue());
                        double dMax = dL < 0.0d ? Math.max(dL + dJ3, 0.0d) : Math.min(dL, dJ3);
                        if (arrayList2.size() == 2) {
                            double dL2 = gh.l(((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList2.get(1)).zzd().doubleValue());
                            dJ3 = dL2 < 0.0d ? Math.max(dJ3 + dL2, 0.0d) : Math.min(dJ3, dL2);
                        }
                        s1 s1Var8 = new s1();
                        for (int i15 = (int) dMax; i15 < dJ3; i15++) {
                            s1Var8.l(s1Var8.j(), s1Var.k(i15));
                        }
                        return s1Var8;
                    }
                    throw new IllegalArgumentException("Command not supported");
                case 965561430:
                    if (str.equals("reduceRight")) {
                        return fb.c(s1Var, j8Var2, arrayList2, false);
                    }
                    throw new IllegalArgumentException("Command not supported");
                case 1099846370:
                    if (str.equals("reverse")) {
                        gh.c(0, "reverse", arrayList2);
                        int iJ6 = s1Var.j();
                        if (iJ6 != 0) {
                            for (int i16 = 0; i16 < iJ6 / 2; i16++) {
                                if (s1Var.n(i16)) {
                                    f6 f6VarK3 = s1Var.k(i16);
                                    s1Var.l(i16, null);
                                    int i17 = (iJ6 - 1) - i16;
                                    if (s1Var.n(i17)) {
                                        s1Var.l(i16, s1Var.k(i17));
                                    }
                                    s1Var.l(i17, f6VarK3);
                                }
                            }
                        }
                        return s1Var;
                    }
                    throw new IllegalArgumentException("Command not supported");
                case 1943291465:
                    if (str.equals("indexOf")) {
                        gh.g(2, "indexOf", arrayList2);
                        if (!arrayList2.isEmpty()) {
                            f6VarE = ((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList2.get(0));
                        }
                        f6 f6Var4 = f6VarE;
                        if (arrayList2.size() > 1) {
                            double dL3 = gh.l(((l6) j8Var2.f32683c).e(j8Var2, (f6) arrayList2.get(1)).zzd().doubleValue());
                            if (dL3 >= s1Var.j()) {
                                return new s3(dValueOf);
                            }
                            dJ2 = dL3 < 0.0d ? s1Var.j() + dL3 : dL3;
                        } else {
                            dJ2 = 0.0d;
                        }
                        Iterator itH6 = s1Var.h();
                        while (itH6.hasNext()) {
                            int iIntValue3 = ((Integer) itH6.next()).intValue();
                            double d11 = iIntValue3;
                            if (d11 >= dJ2 && gh.j(s1Var.k(iIntValue3), f6Var4)) {
                                return new s3(Double.valueOf(d11));
                            }
                        }
                        return new s3(dValueOf);
                    }
                    throw new IllegalArgumentException("Command not supported");
                default:
                    throw new IllegalArgumentException("Command not supported");
            }
        }
        str2 = "lastIndexOf";
        str3 = "filter";
        obj = "unshift";
        str4 = "sort";
        j8Var2 = j8Var;
        str5 = "forEach";
        obj2 = "reduce";
        s1Var = this;
        arrayList2 = arrayList;
        Double dValueOf2 = Double.valueOf(-1.0d);
        iHashCode = str.hashCode();
        TreeMap treeMap22 = s1Var.f33042a;
        f6 f6VarE13 = f6.Qo;
        TreeMap treeMap32 = treeMap22;
        t4 t4Var3 = null;
        switch (iHashCode) {
            case -1776922004:
                break;
            case -1354795244:
                break;
            case -1274492040:
                break;
            case -934873754:
                break;
            case -895859076:
                break;
            case -678635926:
                break;
            case -467511597:
                break;
            case -277637751:
                break;
            case 107868:
                break;
            case 111185:
                break;
            case 3267882:
                break;
            case 3452698:
                break;
            case 3536116:
                break;
            case 3536286:
                break;
            case 96891675:
                break;
            case 109407362:
                break;
            case 109526418:
                break;
            case 965561430:
                break;
            case 1099846370:
                break;
            case 1943291465:
                break;
        }
    }

    public final List g() {
        ArrayList arrayList = new ArrayList(j());
        for (int i5 = 0; i5 < j(); i5++) {
            arrayList.add(k(i5));
        }
        return arrayList;
    }

    public final Iterator h() {
        return this.f33042a.keySet().iterator();
    }

    public final int hashCode() {
        return this.f33042a.hashCode() * 31;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new b1(this);
    }

    public final int j() {
        TreeMap treeMap = this.f33042a;
        if (treeMap.isEmpty()) {
            return 0;
        }
        return ((Integer) treeMap.lastKey()).intValue() + 1;
    }

    public final f6 k(int i5) {
        f6 f6Var;
        if (i5 < j()) {
            return (!n(i5) || (f6Var = (f6) this.f33042a.get(Integer.valueOf(i5))) == null) ? f6.Qo : f6Var;
        }
        throw new IndexOutOfBoundsException("Attempting to get element outside of current array");
    }

    public final void l(int i5, f6 f6Var) {
        if (i5 > 32468) {
            throw new IllegalStateException("Array too large");
        }
        if (i5 < 0) {
            throw new IndexOutOfBoundsException(b.c0.p(new StringBuilder(String.valueOf(i5).length() + 21), "Out of bounds index: ", i5));
        }
        TreeMap treeMap = this.f33042a;
        if (f6Var == null) {
            treeMap.remove(Integer.valueOf(i5));
        } else {
            treeMap.put(Integer.valueOf(i5), f6Var);
        }
    }

    public final boolean n(int i5) {
        if (i5 >= 0) {
            TreeMap treeMap = this.f33042a;
            if (i5 <= ((Integer) treeMap.lastKey()).intValue()) {
                return treeMap.containsKey(Integer.valueOf(i5));
            }
        }
        throw new IndexOutOfBoundsException(b.c0.p(new StringBuilder(String.valueOf(i5).length() + 21), "Out of bounds index: ", i5));
    }

    public final void o(int i5) {
        TreeMap treeMap = this.f33042a;
        int iIntValue = ((Integer) treeMap.lastKey()).intValue();
        if (i5 > iIntValue || i5 < 0) {
            return;
        }
        treeMap.remove(Integer.valueOf(i5));
        if (i5 == iIntValue) {
            int i11 = i5 - 1;
            Integer numValueOf = Integer.valueOf(i11);
            if (treeMap.containsKey(numValueOf) || i11 < 0) {
                return;
            }
            treeMap.put(numValueOf, f6.Qo);
            return;
        }
        while (true) {
            i5++;
            if (i5 > ((Integer) treeMap.lastKey()).intValue()) {
                return;
            }
            Integer numValueOf2 = Integer.valueOf(i5);
            f6 f6Var = (f6) treeMap.get(numValueOf2);
            if (f6Var != null) {
                treeMap.put(Integer.valueOf(i5 - 1), f6Var);
                treeMap.remove(numValueOf2);
            }
        }
    }

    public final String p(String str) {
        String str2;
        StringBuilder sb2 = new StringBuilder();
        if (!this.f33042a.isEmpty()) {
            int i5 = 0;
            while (true) {
                str2 = str == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str;
                if (i5 >= j()) {
                    break;
                }
                f6 f6VarK = k(i5);
                sb2.append(str2);
                if (!(f6VarK instanceof j6) && !(f6VarK instanceof d6)) {
                    sb2.append(f6VarK.zzc());
                }
                i5++;
            }
            sb2.delete(0, str2.length());
        }
        return sb2.toString();
    }

    public final String toString() {
        return p(",");
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final String zzc() {
        return p(",");
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Double zzd() {
        TreeMap treeMap = this.f33042a;
        return treeMap.size() == 1 ? k(0).zzd() : treeMap.size() <= 0 ? Double.valueOf(0.0d) : Double.valueOf(Double.NaN);
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Boolean zze() {
        return Boolean.TRUE;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Iterator zzf() {
        return new m0(this, this.f33042a.keySet().iterator(), this.f33043b.keySet().iterator());
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final f6 zzt() {
        s1 s1Var = new s1();
        for (Map.Entry entry : this.f33042a.entrySet()) {
            boolean z11 = entry.getValue() instanceof b6;
            TreeMap treeMap = s1Var.f33042a;
            if (z11) {
                treeMap.put((Integer) entry.getKey(), (f6) entry.getValue());
            } else {
                treeMap.put((Integer) entry.getKey(), ((f6) entry.getValue()).zzt());
            }
        }
        return s1Var;
    }

    public s1(List list) {
        this();
        if (list != null) {
            for (int i5 = 0; i5 < list.size(); i5++) {
                l(i5, (f6) list.get(i5));
            }
        }
    }
}
