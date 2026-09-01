package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ow {
    public static final ow BoundReached;
    public static final ow Finished;
    public static final /* synthetic */ ow[] a;
    public static final /* synthetic */ i04 b;

    static {
        ow owVar = new ow("BoundReached", 0);
        BoundReached = owVar;
        ow owVar2 = new ow("Finished", 1);
        Finished = owVar2;
        ow[] owVarArr = {owVar, owVar2};
        a = owVarArr;
        b = new i04(owVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ow valueOf(String str) {
        return (ow) Enum.valueOf(ow.class, str);
    }

    public static ow[] values() {
        return (ow[]) a.clone();
    }
}
