package sd;

import android.util.SparseArray;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class k0 {

    /* renamed from: a, reason: collision with root package name */
    public static final SparseArray f87172a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ k0[] f87173b;

    /* JADX INFO: Fake field, exist only in values array */
    k0 EF1;

    static {
        k0 k0Var = new k0("UNKNOWN_MOBILE_SUBTYPE", 0);
        k0 k0Var2 = new k0("GPRS", 1);
        k0 k0Var3 = new k0("EDGE", 2);
        k0 k0Var4 = new k0("UMTS", 3);
        k0 k0Var5 = new k0("CDMA", 4);
        k0 k0Var6 = new k0("EVDO_0", 5);
        k0 k0Var7 = new k0("EVDO_A", 6);
        k0 k0Var8 = new k0("RTT", 7);
        k0 k0Var9 = new k0("HSDPA", 8);
        k0 k0Var10 = new k0("HSUPA", 9);
        k0 k0Var11 = new k0("HSPA", 10);
        k0 k0Var12 = new k0("IDEN", 11);
        k0 k0Var13 = new k0("EVDO_B", 12);
        k0 k0Var14 = new k0("LTE", 13);
        k0 k0Var15 = new k0("EHRPD", 14);
        k0 k0Var16 = new k0("HSPAP", 15);
        k0 k0Var17 = new k0("GSM", 16);
        k0 k0Var18 = new k0("TD_SCDMA", 17);
        k0 k0Var19 = new k0("IWLAN", 18);
        k0 k0Var20 = new k0("LTE_CA", 19);
        f87173b = new k0[]{k0Var, k0Var2, k0Var3, k0Var4, k0Var5, k0Var6, k0Var7, k0Var8, k0Var9, k0Var10, k0Var11, k0Var12, k0Var13, k0Var14, k0Var15, k0Var16, k0Var17, k0Var18, k0Var19, k0Var20, new k0("COMBINED", 20)};
        SparseArray sparseArray = new SparseArray();
        f87172a = sparseArray;
        sparseArray.put(0, k0Var);
        sparseArray.put(1, k0Var2);
        sparseArray.put(2, k0Var3);
        sparseArray.put(3, k0Var4);
        sparseArray.put(4, k0Var5);
        sparseArray.put(5, k0Var6);
        sparseArray.put(6, k0Var7);
        sparseArray.put(7, k0Var8);
        sparseArray.put(8, k0Var9);
        sparseArray.put(9, k0Var10);
        sparseArray.put(10, k0Var11);
        sparseArray.put(11, k0Var12);
        sparseArray.put(12, k0Var13);
        sparseArray.put(13, k0Var14);
        sparseArray.put(14, k0Var15);
        sparseArray.put(15, k0Var16);
        sparseArray.put(16, k0Var17);
        sparseArray.put(17, k0Var18);
        sparseArray.put(18, k0Var19);
        sparseArray.put(19, k0Var20);
    }

    public static k0 valueOf(String str) {
        return (k0) Enum.valueOf(k0.class, str);
    }

    public static k0[] values() {
        return (k0[]) f87173b.clone();
    }
}
