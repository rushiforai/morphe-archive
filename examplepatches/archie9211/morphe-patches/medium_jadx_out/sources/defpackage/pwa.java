package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pwa {
    public static final pwa Idle;
    public static final pwa Inactive;
    public static final pwa InactivePendingWork;
    public static final pwa PendingWork;
    public static final pwa ShutDown;
    public static final pwa ShuttingDown;
    public static final /* synthetic */ pwa[] a;
    public static final /* synthetic */ i04 b;

    static {
        pwa pwaVar = new pwa("ShutDown", 0);
        ShutDown = pwaVar;
        pwa pwaVar2 = new pwa("ShuttingDown", 1);
        ShuttingDown = pwaVar2;
        pwa pwaVar3 = new pwa("Inactive", 2);
        Inactive = pwaVar3;
        pwa pwaVar4 = new pwa("InactivePendingWork", 3);
        InactivePendingWork = pwaVar4;
        pwa pwaVar5 = new pwa("Idle", 4);
        Idle = pwaVar5;
        pwa pwaVar6 = new pwa("PendingWork", 5);
        PendingWork = pwaVar6;
        pwa[] pwaVarArr = {pwaVar, pwaVar2, pwaVar3, pwaVar4, pwaVar5, pwaVar6};
        a = pwaVarArr;
        b = new i04(pwaVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static pwa valueOf(String str) {
        return (pwa) Enum.valueOf(pwa.class, str);
    }

    public static pwa[] values() {
        return (pwa[]) a.clone();
    }
}
