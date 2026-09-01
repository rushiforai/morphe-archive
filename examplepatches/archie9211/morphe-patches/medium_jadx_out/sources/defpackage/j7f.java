package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j7f {
    public static final j7f BLOCKED;
    public static final j7f CANCELLED;
    public static final j7f ENQUEUED;
    public static final j7f FAILED;
    public static final j7f RUNNING;
    public static final j7f SUCCEEDED;
    public static final /* synthetic */ j7f[] a;
    public static final /* synthetic */ i04 b;

    static {
        j7f j7fVar = new j7f("ENQUEUED", 0);
        ENQUEUED = j7fVar;
        j7f j7fVar2 = new j7f("RUNNING", 1);
        RUNNING = j7fVar2;
        j7f j7fVar3 = new j7f("SUCCEEDED", 2);
        SUCCEEDED = j7fVar3;
        j7f j7fVar4 = new j7f("FAILED", 3);
        FAILED = j7fVar4;
        j7f j7fVar5 = new j7f("BLOCKED", 4);
        BLOCKED = j7fVar5;
        j7f j7fVar6 = new j7f("CANCELLED", 5);
        CANCELLED = j7fVar6;
        j7f[] j7fVarArr = {j7fVar, j7fVar2, j7fVar3, j7fVar4, j7fVar5, j7fVar6};
        a = j7fVarArr;
        b = new i04(j7fVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static j7f valueOf(String str) {
        return (j7f) Enum.valueOf(j7f.class, str);
    }

    public static j7f[] values() {
        return (j7f[]) a.clone();
    }

    public final boolean isFinished() {
        return this == SUCCEEDED || this == FAILED || this == CANCELLED;
    }
}
