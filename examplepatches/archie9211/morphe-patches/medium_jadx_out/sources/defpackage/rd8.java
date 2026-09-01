package defpackage;

import android.util.SparseArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum rd8 {
    UNKNOWN_MOBILE_SUBTYPE(0),
    GPRS(1),
    EDGE(2),
    UMTS(3),
    CDMA(4),
    EVDO_0(5),
    EVDO_A(6),
    RTT(7),
    HSDPA(8),
    HSUPA(9),
    HSPA(10),
    IDEN(11),
    EVDO_B(12),
    LTE(13),
    EHRPD(14),
    HSPAP(15),
    GSM(16),
    TD_SCDMA(17),
    IWLAN(18),
    LTE_CA(19),
    COMBINED(100);

    public static final SparseArray b;
    public final int a;

    static {
        rd8 rd8Var = UNKNOWN_MOBILE_SUBTYPE;
        rd8 rd8Var2 = GPRS;
        rd8 rd8Var3 = EDGE;
        rd8 rd8Var4 = UMTS;
        rd8 rd8Var5 = CDMA;
        rd8 rd8Var6 = EVDO_0;
        rd8 rd8Var7 = EVDO_A;
        rd8 rd8Var8 = RTT;
        rd8 rd8Var9 = HSDPA;
        rd8 rd8Var10 = HSUPA;
        rd8 rd8Var11 = HSPA;
        rd8 rd8Var12 = IDEN;
        rd8 rd8Var13 = EVDO_B;
        rd8 rd8Var14 = LTE;
        rd8 rd8Var15 = EHRPD;
        rd8 rd8Var16 = HSPAP;
        rd8 rd8Var17 = GSM;
        rd8 rd8Var18 = TD_SCDMA;
        rd8 rd8Var19 = IWLAN;
        rd8 rd8Var20 = LTE_CA;
        SparseArray sparseArray = new SparseArray();
        b = sparseArray;
        sparseArray.put(0, rd8Var);
        sparseArray.put(1, rd8Var2);
        sparseArray.put(2, rd8Var3);
        sparseArray.put(3, rd8Var4);
        sparseArray.put(4, rd8Var5);
        sparseArray.put(5, rd8Var6);
        sparseArray.put(6, rd8Var7);
        sparseArray.put(7, rd8Var8);
        sparseArray.put(8, rd8Var9);
        sparseArray.put(9, rd8Var10);
        sparseArray.put(10, rd8Var11);
        sparseArray.put(11, rd8Var12);
        sparseArray.put(12, rd8Var13);
        sparseArray.put(13, rd8Var14);
        sparseArray.put(14, rd8Var15);
        sparseArray.put(15, rd8Var16);
        sparseArray.put(16, rd8Var17);
        sparseArray.put(17, rd8Var18);
        sparseArray.put(18, rd8Var19);
        sparseArray.put(19, rd8Var20);
    }

    rd8(int i) {
        this.a = i;
    }

    public static rd8 forNumber(int i) {
        return (rd8) b.get(i);
    }

    public int getValue() {
        return this.a;
    }
}
