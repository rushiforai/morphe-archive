package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qqb {
    public static final qqb DEVICE_CHARGING;
    public static final qqb DEVICE_IDLE;
    public static final qqb NETWORK_UNMETERED;
    public static final /* synthetic */ qqb[] a;

    static {
        qqb qqbVar = new qqb("NETWORK_UNMETERED", 0);
        NETWORK_UNMETERED = qqbVar;
        qqb qqbVar2 = new qqb("DEVICE_IDLE", 1);
        DEVICE_IDLE = qqbVar2;
        qqb qqbVar3 = new qqb("DEVICE_CHARGING", 2);
        DEVICE_CHARGING = qqbVar3;
        a = new qqb[]{qqbVar, qqbVar2, qqbVar3};
    }

    public static qqb valueOf(String str) {
        return (qqb) Enum.valueOf(qqb.class, str);
    }

    public static qqb[] values() {
        return (qqb[]) a.clone();
    }
}
