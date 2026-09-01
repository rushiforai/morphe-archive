package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class p4a {
    public static final p4a DEBUG;
    public static final p4a NONE;
    public static final p4a PRETTY;
    public static final /* synthetic */ p4a[] a;

    static {
        p4a p4aVar = new p4a("PRETTY", 0);
        PRETTY = p4aVar;
        p4a p4aVar2 = new p4a("DEBUG", 1);
        DEBUG = p4aVar2;
        p4a p4aVar3 = new p4a("NONE", 2);
        NONE = p4aVar3;
        a = new p4a[]{p4aVar, p4aVar2, p4aVar3};
    }

    public static p4a valueOf(String str) {
        return (p4a) Enum.valueOf(p4a.class, str);
    }

    public static p4a[] values() {
        return (p4a[]) a.clone();
    }
}
