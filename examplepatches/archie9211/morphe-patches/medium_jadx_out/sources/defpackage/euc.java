package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class euc {
    public static final euc LEGACY_STRICT;
    public static final euc LENIENT;
    public static final euc STRICT;
    public static final /* synthetic */ euc[] a;

    static {
        euc eucVar = new euc("LENIENT", 0);
        LENIENT = eucVar;
        euc eucVar2 = new euc("LEGACY_STRICT", 1);
        LEGACY_STRICT = eucVar2;
        euc eucVar3 = new euc("STRICT", 2);
        STRICT = eucVar3;
        a = new euc[]{eucVar, eucVar2, eucVar3};
    }

    public static euc valueOf(String str) {
        return (euc) Enum.valueOf(euc.class, str);
    }

    public static euc[] values() {
        return (euc[]) a.clone();
    }
}
