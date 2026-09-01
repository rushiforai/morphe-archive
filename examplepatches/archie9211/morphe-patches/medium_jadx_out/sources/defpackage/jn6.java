package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class jn6 {
    public static final jn6 BINARY;
    public static final jn6 RUNTIME;
    public static final jn6 SOURCE;
    public static final /* synthetic */ jn6[] a;

    static {
        jn6 jn6Var = new jn6("RUNTIME", 0);
        RUNTIME = jn6Var;
        jn6 jn6Var2 = new jn6("BINARY", 1);
        BINARY = jn6Var2;
        jn6 jn6Var3 = new jn6("SOURCE", 2);
        SOURCE = jn6Var3;
        a = new jn6[]{jn6Var, jn6Var2, jn6Var3};
    }

    public static jn6 valueOf(String str) {
        return (jn6) Enum.valueOf(jn6.class, str);
    }

    public static jn6[] values() {
        return (jn6[]) a.clone();
    }
}
