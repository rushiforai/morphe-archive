package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n4b {
    public static final n4b AUTOMATIC;
    public static final n4b HARDWARE;
    public static final n4b SOFTWARE;
    public static final /* synthetic */ n4b[] a;

    static {
        n4b n4bVar = new n4b("AUTOMATIC", 0);
        AUTOMATIC = n4bVar;
        n4b n4bVar2 = new n4b("HARDWARE", 1);
        HARDWARE = n4bVar2;
        n4b n4bVar3 = new n4b("SOFTWARE", 2);
        SOFTWARE = n4bVar3;
        a = new n4b[]{n4bVar, n4bVar2, n4bVar3};
    }

    public static n4b valueOf(String str) {
        return (n4b) Enum.valueOf(n4b.class, str);
    }

    public static n4b[] values() {
        return (n4b[]) a.clone();
    }

    public boolean useSoftwareRendering(int i, boolean z, int i2) {
        int i3 = m4b.a[ordinal()];
        if (i3 == 1) {
            return false;
        }
        if (i3 != 2) {
            return (z && i < 28) || i2 > 4 || i <= 25;
        }
        return true;
    }
}
