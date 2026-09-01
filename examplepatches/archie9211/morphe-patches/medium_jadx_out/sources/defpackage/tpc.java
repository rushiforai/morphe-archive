package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tpc {
    public static final tpc AFTER_DOT;
    public static final tpc BEGINNING;
    public static final tpc MIDDLE;
    public static final /* synthetic */ tpc[] a;

    static {
        tpc tpcVar = new tpc("BEGINNING", 0);
        BEGINNING = tpcVar;
        tpc tpcVar2 = new tpc("MIDDLE", 1);
        MIDDLE = tpcVar2;
        tpc tpcVar3 = new tpc("AFTER_DOT", 2);
        AFTER_DOT = tpcVar3;
        a = new tpc[]{tpcVar, tpcVar2, tpcVar3};
    }

    public static tpc valueOf(String str) {
        return (tpc) Enum.valueOf(tpc.class, str);
    }

    public static tpc[] values() {
        return (tpc[]) a.clone();
    }
}
