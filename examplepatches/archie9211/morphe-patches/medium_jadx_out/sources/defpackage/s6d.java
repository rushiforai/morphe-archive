package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s6d {
    public static final s6d CHARGING;
    public static final r6d Companion;
    public static final s6d DISCHARGING;
    public static final s6d FULL;
    public static final s6d NOT_CHARGING;
    public static final s6d UNKNOWN;
    public static final /* synthetic */ s6d[] a;

    static {
        s6d s6dVar = new s6d("UNKNOWN", 0);
        UNKNOWN = s6dVar;
        s6d s6dVar2 = new s6d("CHARGING", 1);
        CHARGING = s6dVar2;
        s6d s6dVar3 = new s6d("DISCHARGING", 2);
        DISCHARGING = s6dVar3;
        s6d s6dVar4 = new s6d("NOT_CHARGING", 3);
        NOT_CHARGING = s6dVar4;
        s6d s6dVar5 = new s6d("FULL", 4);
        FULL = s6dVar5;
        a = new s6d[]{s6dVar, s6dVar2, s6dVar3, s6dVar4, s6dVar5};
        Companion = new r6d();
    }

    public static s6d valueOf(String str) {
        return (s6d) Enum.valueOf(s6d.class, str);
    }

    public static s6d[] values() {
        return (s6d[]) a.clone();
    }
}
