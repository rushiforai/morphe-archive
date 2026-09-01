package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pv8 {
    public static final pv8 IAPParameters;
    public static final /* synthetic */ pv8[] a;

    static {
        pv8 pv8Var = new pv8("IAPParameters", 0);
        IAPParameters = pv8Var;
        a = new pv8[]{pv8Var};
    }

    public static pv8 valueOf(String str) {
        return (pv8) Enum.valueOf(pv8.class, str);
    }

    public static pv8[] values() {
        return (pv8[]) a.clone();
    }

    public final String getValue() {
        return "iap_parameters";
    }
}
