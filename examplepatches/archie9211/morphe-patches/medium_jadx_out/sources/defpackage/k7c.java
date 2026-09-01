package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class k7c {
    public static final k7c START;
    public static final k7c STOP;
    public static final k7c STOP_AND_RESET_REPLAY_CACHE;
    public static final /* synthetic */ k7c[] a;
    public static final /* synthetic */ i04 b;

    static {
        k7c k7cVar = new k7c("START", 0);
        START = k7cVar;
        k7c k7cVar2 = new k7c("STOP", 1);
        STOP = k7cVar2;
        k7c k7cVar3 = new k7c("STOP_AND_RESET_REPLAY_CACHE", 2);
        STOP_AND_RESET_REPLAY_CACHE = k7cVar3;
        k7c[] k7cVarArr = {k7cVar, k7cVar2, k7cVar3};
        a = k7cVarArr;
        b = new i04(k7cVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static k7c valueOf(String str) {
        return (k7c) Enum.valueOf(k7c.class, str);
    }

    public static k7c[] values() {
        return (k7c[]) a.clone();
    }
}
