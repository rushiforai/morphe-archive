package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p7a {
    public static final p7a PROTO2;
    public static final p7a PROTO3;
    public static final /* synthetic */ p7a[] a;

    static {
        p7a p7aVar = new p7a("PROTO2", 0);
        PROTO2 = p7aVar;
        p7a p7aVar2 = new p7a("PROTO3", 1);
        PROTO3 = p7aVar2;
        a = new p7a[]{p7aVar, p7aVar2};
    }

    public static p7a valueOf(String str) {
        return (p7a) Enum.valueOf(p7a.class, str);
    }

    public static p7a[] values() {
        return (p7a[]) a.clone();
    }
}
