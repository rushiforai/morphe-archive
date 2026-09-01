package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rac {
    public static final rac INVALID;
    public static final /* synthetic */ rac[] a;
    public static final /* synthetic */ i04 b;

    static {
        rac racVar = new rac("INVALID", 0);
        INVALID = racVar;
        rac[] racVarArr = {racVar};
        a = racVarArr;
        b = new i04(racVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static rac valueOf(String str) {
        return (rac) Enum.valueOf(rac.class, str);
    }

    public static rac[] values() {
        return (rac[]) a.clone();
    }
}
