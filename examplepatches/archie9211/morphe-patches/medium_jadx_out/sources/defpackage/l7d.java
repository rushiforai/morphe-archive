package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l7d {
    public static final l7d Indicator;
    public static final l7d Tabs;
    public static final /* synthetic */ l7d[] a;
    public static final /* synthetic */ i04 b;

    static {
        l7d l7dVar = new l7d("Tabs", 0);
        Tabs = l7dVar;
        l7d l7dVar2 = new l7d("Indicator", 1);
        Indicator = l7dVar2;
        l7d[] l7dVarArr = {l7dVar, l7dVar2};
        a = l7dVarArr;
        b = new i04(l7dVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static l7d valueOf(String str) {
        return (l7d) Enum.valueOf(l7d.class, str);
    }

    public static l7d[] values() {
        return (l7d[]) a.clone();
    }
}
