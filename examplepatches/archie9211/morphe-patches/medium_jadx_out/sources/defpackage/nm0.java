package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nm0 {
    public static final nm0 FATAL_ERROR;
    public static final nm0 INVALID_PAYLOAD;
    public static final nm0 OK;
    public static final nm0 TRANSIENT_ERROR;
    public static final /* synthetic */ nm0[] a;

    static {
        nm0 nm0Var = new nm0("OK", 0);
        OK = nm0Var;
        nm0 nm0Var2 = new nm0("TRANSIENT_ERROR", 1);
        TRANSIENT_ERROR = nm0Var2;
        nm0 nm0Var3 = new nm0("FATAL_ERROR", 2);
        FATAL_ERROR = nm0Var3;
        nm0 nm0Var4 = new nm0("INVALID_PAYLOAD", 3);
        INVALID_PAYLOAD = nm0Var4;
        a = new nm0[]{nm0Var, nm0Var2, nm0Var3, nm0Var4};
    }

    public static nm0 valueOf(String str) {
        return (nm0) Enum.valueOf(nm0.class, str);
    }

    public static nm0[] values() {
        return (nm0[]) a.clone();
    }
}
