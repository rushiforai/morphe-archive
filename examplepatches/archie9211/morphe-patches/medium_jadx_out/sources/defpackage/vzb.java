package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vzb {
    public static final vzb IDLE;
    public static final vzb QUEUED;
    public static final vzb QUEUING;
    public static final vzb RUNNING;
    public static final /* synthetic */ vzb[] a;

    static {
        vzb vzbVar = new vzb("IDLE", 0);
        IDLE = vzbVar;
        vzb vzbVar2 = new vzb("QUEUING", 1);
        QUEUING = vzbVar2;
        vzb vzbVar3 = new vzb("QUEUED", 2);
        QUEUED = vzbVar3;
        vzb vzbVar4 = new vzb("RUNNING", 3);
        RUNNING = vzbVar4;
        a = new vzb[]{vzbVar, vzbVar2, vzbVar3, vzbVar4};
    }

    public static vzb valueOf(String str) {
        return (vzb) Enum.valueOf(vzb.class, str);
    }

    public static vzb[] values() {
        return (vzb[]) a.clone();
    }
}
