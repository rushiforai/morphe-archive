package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xy6 {
    public static final xy6 BINARY;
    public static final xy6 SOURCE;
    public static final /* synthetic */ xy6[] a;

    static {
        xy6 xy6Var = new xy6("SOURCE", 0);
        SOURCE = xy6Var;
        xy6 xy6Var2 = new xy6("BINARY", 1);
        BINARY = xy6Var2;
        a = new xy6[]{xy6Var, xy6Var2};
    }

    public static xy6 valueOf(String str) {
        return (xy6) Enum.valueOf(xy6.class, str);
    }

    public static xy6[] values() {
        return (xy6[]) a.clone();
    }
}
