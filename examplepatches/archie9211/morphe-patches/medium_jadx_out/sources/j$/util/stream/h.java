package j$.util.stream;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class h {
    public static final h CONCURRENT;
    public static final h IDENTITY_FINISH;
    public static final h UNORDERED;
    public static final /* synthetic */ h[] a;

    static {
        h hVar = new h("CONCURRENT", 0);
        CONCURRENT = hVar;
        h hVar2 = new h("UNORDERED", 1);
        UNORDERED = hVar2;
        h hVar3 = new h("IDENTITY_FINISH", 2);
        IDENTITY_FINISH = hVar3;
        a = new h[]{hVar, hVar2, hVar3};
    }

    public static h valueOf(String str) {
        return (h) Enum.valueOf(h.class, str);
    }

    public static h[] values() {
        return (h[]) a.clone();
    }
}
