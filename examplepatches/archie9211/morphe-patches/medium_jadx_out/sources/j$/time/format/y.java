package j$.time.format;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class y {
    public static final y LENIENT;
    public static final y SMART;
    public static final y STRICT;
    public static final /* synthetic */ y[] a;

    static {
        y yVar = new y("STRICT", 0);
        STRICT = yVar;
        y yVar2 = new y("SMART", 1);
        SMART = yVar2;
        y yVar3 = new y("LENIENT", 2);
        LENIENT = yVar3;
        a = new y[]{yVar, yVar2, yVar3};
    }

    public static y valueOf(String str) {
        return (y) Enum.valueOf(y.class, str);
    }

    public static y[] values() {
        return (y[]) a.clone();
    }
}
