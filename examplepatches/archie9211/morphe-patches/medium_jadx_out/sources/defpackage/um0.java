package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class um0 {
    public static final um0 BUFFER;
    public static final um0 DROP;
    public static final um0 ERROR;
    public static final um0 LATEST;
    public static final um0 MISSING;
    public static final /* synthetic */ um0[] a;

    static {
        um0 um0Var = new um0("MISSING", 0);
        MISSING = um0Var;
        um0 um0Var2 = new um0("ERROR", 1);
        ERROR = um0Var2;
        um0 um0Var3 = new um0("BUFFER", 2);
        BUFFER = um0Var3;
        um0 um0Var4 = new um0("DROP", 3);
        DROP = um0Var4;
        um0 um0Var5 = new um0("LATEST", 4);
        LATEST = um0Var5;
        a = new um0[]{um0Var, um0Var2, um0Var3, um0Var4, um0Var5};
    }

    public static um0 valueOf(String str) {
        return (um0) Enum.valueOf(um0.class, str);
    }

    public static um0[] values() {
        return (um0[]) a.clone();
    }
}
