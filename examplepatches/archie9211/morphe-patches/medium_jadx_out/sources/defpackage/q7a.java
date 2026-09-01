package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q7a {
    public static final q7a EDITIONS;
    public static final q7a PROTO2;
    public static final q7a PROTO3;
    public static final /* synthetic */ q7a[] a;

    static {
        q7a q7aVar = new q7a("PROTO2", 0);
        PROTO2 = q7aVar;
        q7a q7aVar2 = new q7a("PROTO3", 1);
        PROTO3 = q7aVar2;
        q7a q7aVar3 = new q7a("EDITIONS", 2);
        EDITIONS = q7aVar3;
        a = new q7a[]{q7aVar, q7aVar2, q7aVar3};
    }

    public static q7a valueOf(String str) {
        return (q7a) Enum.valueOf(q7a.class, str);
    }

    public static q7a[] values() {
        return (q7a[]) a.clone();
    }
}
