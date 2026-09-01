package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w67 {
    public static final w67 COMPUTING;
    public static final w67 NOT_COMPUTED;
    public static final w67 RECURSION_WAS_DETECTED;
    public static final /* synthetic */ w67[] a;

    static {
        w67 w67Var = new w67("NOT_COMPUTED", 0);
        NOT_COMPUTED = w67Var;
        w67 w67Var2 = new w67("COMPUTING", 1);
        COMPUTING = w67Var2;
        w67 w67Var3 = new w67("RECURSION_WAS_DETECTED", 2);
        RECURSION_WAS_DETECTED = w67Var3;
        a = new w67[]{w67Var, w67Var2, w67Var3};
    }

    public static w67 valueOf(String str) {
        return (w67) Enum.valueOf(w67.class, str);
    }

    public static w67[] values() {
        return (w67[]) a.clone();
    }
}
