package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m7d {
    public static final m7d Divider;
    public static final m7d Indicator;
    public static final m7d Tabs;
    public static final /* synthetic */ m7d[] a;
    public static final /* synthetic */ i04 b;

    static {
        m7d m7dVar = new m7d("Tabs", 0);
        Tabs = m7dVar;
        m7d m7dVar2 = new m7d("Divider", 1);
        Divider = m7dVar2;
        m7d m7dVar3 = new m7d("Indicator", 2);
        Indicator = m7dVar3;
        m7d[] m7dVarArr = {m7dVar, m7dVar2, m7dVar3};
        a = m7dVarArr;
        b = new i04(m7dVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static m7d valueOf(String str) {
        return (m7d) Enum.valueOf(m7d.class, str);
    }

    public static m7d[] values() {
        return (m7d[]) a.clone();
    }
}
