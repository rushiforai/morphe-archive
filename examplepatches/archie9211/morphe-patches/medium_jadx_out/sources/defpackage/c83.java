package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class c83 {
    public static final c83 ERROR;
    public static final c83 HIDDEN;
    public static final c83 WARNING;
    public static final /* synthetic */ c83[] a;

    static {
        c83 c83Var = new c83("WARNING", 0);
        WARNING = c83Var;
        c83 c83Var2 = new c83("ERROR", 1);
        ERROR = c83Var2;
        c83 c83Var3 = new c83("HIDDEN", 2);
        HIDDEN = c83Var3;
        a = new c83[]{c83Var, c83Var2, c83Var3};
    }

    public static c83 valueOf(String str) {
        return (c83) Enum.valueOf(c83.class, str);
    }

    public static c83[] values() {
        return (c83[]) a.clone();
    }
}
