package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jjc {
    public static final jjc IDLE;
    public static final jjc STOPPED;
    public static final jjc SYNCING;
    public static final /* synthetic */ jjc[] a;

    static {
        jjc jjcVar = new jjc("IDLE", 0);
        IDLE = jjcVar;
        jjc jjcVar2 = new jjc("SYNCING", 1);
        SYNCING = jjcVar2;
        jjc jjcVar3 = new jjc("STOPPED", 2);
        STOPPED = jjcVar3;
        a = new jjc[]{jjcVar, jjcVar2, jjcVar3};
    }

    public static jjc valueOf(String str) {
        return (jjc) Enum.valueOf(jjc.class, str);
    }

    public static jjc[] values() {
        return (jjc[]) a.clone();
    }
}
