package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ui2 {
    public static final ui2 NETWORK;
    public static final ui2 OTHER;
    public static final ui2 UNKNOWN;
    public static final /* synthetic */ ui2[] a;

    static {
        ui2 ui2Var = new ui2("UNKNOWN", 0);
        UNKNOWN = ui2Var;
        ui2 ui2Var2 = new ui2("NETWORK", 1);
        NETWORK = ui2Var2;
        ui2 ui2Var3 = new ui2("OTHER", 2);
        OTHER = ui2Var3;
        a = new ui2[]{ui2Var, ui2Var2, ui2Var3};
    }

    public static ui2 valueOf(String str) {
        return (ui2) Enum.valueOf(ui2.class, str);
    }

    public static ui2[] values() {
        return (ui2[]) a.clone();
    }
}
