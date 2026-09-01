package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dt5 {
    public static final dt5 DELETE;
    public static final dt5 GET;
    public static final dt5 POST;
    public static final /* synthetic */ dt5[] a;

    static {
        dt5 dt5Var = new dt5("GET", 0);
        GET = dt5Var;
        dt5 dt5Var2 = new dt5("POST", 1);
        POST = dt5Var2;
        dt5 dt5Var3 = new dt5("DELETE", 2);
        DELETE = dt5Var3;
        a = new dt5[]{dt5Var, dt5Var2, dt5Var3};
    }

    public static dt5 valueOf(String str) {
        return (dt5) Enum.valueOf(dt5.class, str);
    }

    public static dt5[] values() {
        return (dt5[]) a.clone();
    }
}
