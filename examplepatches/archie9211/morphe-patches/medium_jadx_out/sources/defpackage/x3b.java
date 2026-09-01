package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x3b {
    public static final x3b OPERATION_SUCCESS;
    public static final x3b SERVICE_ERROR;
    public static final x3b SERVICE_NOT_AVAILABLE;
    public static final /* synthetic */ x3b[] a;

    static {
        x3b x3bVar = new x3b("OPERATION_SUCCESS", 0);
        OPERATION_SUCCESS = x3bVar;
        x3b x3bVar2 = new x3b("SERVICE_NOT_AVAILABLE", 1);
        SERVICE_NOT_AVAILABLE = x3bVar2;
        x3b x3bVar3 = new x3b("SERVICE_ERROR", 2);
        SERVICE_ERROR = x3bVar3;
        a = new x3b[]{x3bVar, x3bVar2, x3bVar3};
    }

    public static x3b valueOf(String str) {
        return (x3b) Enum.valueOf(x3b.class, str);
    }

    public static x3b[] values() {
        return (x3b[]) a.clone();
    }
}
