package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class t4b {
    public static final t4b HTML;
    public static final t4b PLAIN;
    public static final /* synthetic */ t4b[] a;

    static {
        s4b s4bVar = new s4b("PLAIN", 0, null);
        PLAIN = s4bVar;
        r4b r4bVar = new r4b("HTML", 1, null);
        HTML = r4bVar;
        a = new t4b[]{s4bVar, r4bVar};
    }

    public t4b(String str, int i, gy2 gy2Var) {
    }

    public static t4b valueOf(String str) {
        return (t4b) Enum.valueOf(t4b.class, str);
    }

    public static t4b[] values() {
        return (t4b[]) a.clone();
    }

    public abstract String escape(String str);
}
