package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r7a {
    public static final r7a DEFAULT;
    public static final r7a FIXED;
    public static final r7a SIGNED;
    public static final /* synthetic */ r7a[] a;

    static {
        r7a r7aVar = new r7a("DEFAULT", 0);
        DEFAULT = r7aVar;
        r7a r7aVar2 = new r7a("SIGNED", 1);
        SIGNED = r7aVar2;
        r7a r7aVar3 = new r7a("FIXED", 2);
        FIXED = r7aVar3;
        a = new r7a[]{r7aVar, r7aVar2, r7aVar3};
    }

    public static r7a valueOf(String str) {
        return (r7a) Enum.valueOf(r7a.class, str);
    }

    public static r7a[] values() {
        return (r7a[]) a.clone();
    }
}
