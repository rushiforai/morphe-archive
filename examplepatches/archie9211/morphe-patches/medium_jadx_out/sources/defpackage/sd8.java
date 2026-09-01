package defpackage;

import android.util.SparseArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum sd8 {
    MOBILE(0),
    WIFI(1),
    MOBILE_MMS(2),
    MOBILE_SUPL(3),
    MOBILE_DUN(4),
    MOBILE_HIPRI(5),
    WIMAX(6),
    BLUETOOTH(7),
    DUMMY(8),
    ETHERNET(9),
    MOBILE_FOTA(10),
    MOBILE_IMS(11),
    MOBILE_CBS(12),
    WIFI_P2P(13),
    MOBILE_IA(14),
    MOBILE_EMERGENCY(15),
    PROXY(16),
    VPN(17),
    NONE(-1);

    public static final SparseArray b;
    public final int a;

    static {
        sd8 sd8Var = MOBILE;
        sd8 sd8Var2 = WIFI;
        sd8 sd8Var3 = MOBILE_MMS;
        sd8 sd8Var4 = MOBILE_SUPL;
        sd8 sd8Var5 = MOBILE_DUN;
        sd8 sd8Var6 = MOBILE_HIPRI;
        sd8 sd8Var7 = WIMAX;
        sd8 sd8Var8 = BLUETOOTH;
        sd8 sd8Var9 = DUMMY;
        sd8 sd8Var10 = ETHERNET;
        sd8 sd8Var11 = MOBILE_FOTA;
        sd8 sd8Var12 = MOBILE_IMS;
        sd8 sd8Var13 = MOBILE_CBS;
        sd8 sd8Var14 = WIFI_P2P;
        sd8 sd8Var15 = MOBILE_IA;
        sd8 sd8Var16 = MOBILE_EMERGENCY;
        sd8 sd8Var17 = PROXY;
        sd8 sd8Var18 = VPN;
        sd8 sd8Var19 = NONE;
        SparseArray sparseArray = new SparseArray();
        b = sparseArray;
        sparseArray.put(0, sd8Var);
        sparseArray.put(1, sd8Var2);
        sparseArray.put(2, sd8Var3);
        sparseArray.put(3, sd8Var4);
        sparseArray.put(4, sd8Var5);
        sparseArray.put(5, sd8Var6);
        sparseArray.put(6, sd8Var7);
        sparseArray.put(7, sd8Var8);
        sparseArray.put(8, sd8Var9);
        sparseArray.put(9, sd8Var10);
        sparseArray.put(10, sd8Var11);
        sparseArray.put(11, sd8Var12);
        sparseArray.put(12, sd8Var13);
        sparseArray.put(13, sd8Var14);
        sparseArray.put(14, sd8Var15);
        sparseArray.put(15, sd8Var16);
        sparseArray.put(16, sd8Var17);
        sparseArray.put(17, sd8Var18);
        sparseArray.put(-1, sd8Var19);
    }

    sd8(int i) {
        this.a = i;
    }

    public static sd8 forNumber(int i) {
        return (sd8) b.get(i);
    }

    public int getValue() {
        return this.a;
    }
}
