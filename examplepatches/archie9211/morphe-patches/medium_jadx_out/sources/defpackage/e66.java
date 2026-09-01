package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e66 {
    public static final e66 MAINTAINER;
    public static final e66 TELEMETRY;
    public static final e66 USER;
    public static final /* synthetic */ e66[] a;

    static {
        e66 e66Var = new e66("USER", 0);
        USER = e66Var;
        e66 e66Var2 = new e66("MAINTAINER", 1);
        MAINTAINER = e66Var2;
        e66 e66Var3 = new e66("TELEMETRY", 2);
        TELEMETRY = e66Var3;
        a = new e66[]{e66Var, e66Var2, e66Var3};
    }

    public static e66 valueOf(String str) {
        return (e66) Enum.valueOf(e66.class, str);
    }

    public static e66[] values() {
        return (e66[]) a.clone();
    }
}
