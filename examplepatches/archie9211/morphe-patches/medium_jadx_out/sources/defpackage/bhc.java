package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bhc {
    public static final bhc Indefinite;
    public static final bhc Long;
    public static final bhc Short;
    public static final /* synthetic */ bhc[] a;
    public static final /* synthetic */ i04 b;

    static {
        bhc bhcVar = new bhc("Short", 0);
        Short = bhcVar;
        bhc bhcVar2 = new bhc("Long", 1);
        Long = bhcVar2;
        bhc bhcVar3 = new bhc("Indefinite", 2);
        Indefinite = bhcVar3;
        bhc[] bhcVarArr = {bhcVar, bhcVar2, bhcVar3};
        a = bhcVarArr;
        b = new i04(bhcVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static bhc valueOf(String str) {
        return (bhc) Enum.valueOf(bhc.class, str);
    }

    public static bhc[] values() {
        return (bhc[]) a.clone();
    }
}
