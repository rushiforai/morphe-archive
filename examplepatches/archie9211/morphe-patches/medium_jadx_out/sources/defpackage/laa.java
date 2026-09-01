package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class laa {
    public static final laa EDITORS;
    public static final laa WRITERS;
    public static final /* synthetic */ laa[] a;
    public static final /* synthetic */ i04 b;

    static {
        laa laaVar = new laa("EDITORS", 0);
        EDITORS = laaVar;
        laa laaVar2 = new laa("WRITERS", 1);
        WRITERS = laaVar2;
        laa[] laaVarArr = {laaVar, laaVar2};
        a = laaVarArr;
        b = new i04(laaVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static laa valueOf(String str) {
        return (laa) Enum.valueOf(laa.class, str);
    }

    public static laa[] values() {
        return (laa[]) a.clone();
    }
}
