package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tx {
    public static final tx CALL_BY_NAME;
    public static final tx POSITIONAL_CALL;
    public static final /* synthetic */ tx[] a;

    static {
        tx txVar = new tx("CALL_BY_NAME", 0);
        CALL_BY_NAME = txVar;
        tx txVar2 = new tx("POSITIONAL_CALL", 1);
        POSITIONAL_CALL = txVar2;
        a = new tx[]{txVar, txVar2};
    }

    public static tx valueOf(String str) {
        return (tx) Enum.valueOf(tx.class, str);
    }

    public static tx[] values() {
        return (tx[]) a.clone();
    }
}
