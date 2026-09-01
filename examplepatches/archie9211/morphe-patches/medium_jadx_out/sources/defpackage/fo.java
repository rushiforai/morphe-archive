package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fo {
    public static final fo SHOW_ORIGINAL;
    public static final fo SHOW_TRANSLATED;
    public static final /* synthetic */ fo[] a;
    public static final /* synthetic */ i04 b;

    static {
        fo foVar = new fo("SHOW_ORIGINAL", 0);
        SHOW_ORIGINAL = foVar;
        fo foVar2 = new fo("SHOW_TRANSLATED", 1);
        SHOW_TRANSLATED = foVar2;
        fo[] foVarArr = {foVar, foVar2};
        a = foVarArr;
        b = new i04(foVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static fo valueOf(String str) {
        return (fo) Enum.valueOf(fo.class, str);
    }

    public static fo[] values() {
        return (fo[]) a.clone();
    }
}
