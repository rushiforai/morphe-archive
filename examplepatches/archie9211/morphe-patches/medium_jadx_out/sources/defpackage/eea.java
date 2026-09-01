package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class eea {
    public static final eea PUBLIC;
    public static final eea UNLISTED;
    public static final /* synthetic */ eea[] a;
    public static final /* synthetic */ i04 b;

    static {
        eea eeaVar = new eea("PUBLIC", 0);
        PUBLIC = eeaVar;
        eea eeaVar2 = new eea("UNLISTED", 1);
        UNLISTED = eeaVar2;
        eea[] eeaVarArr = {eeaVar, eeaVar2};
        a = eeaVarArr;
        b = new i04(eeaVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static eea valueOf(String str) {
        return (eea) Enum.valueOf(eea.class, str);
    }

    public static eea[] values() {
        return (eea[]) a.clone();
    }
}
