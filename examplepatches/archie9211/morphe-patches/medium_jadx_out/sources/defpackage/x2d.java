package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x2d {
    public static final x2d BEGIN_DEFERRED;
    public static final x2d BEGIN_EXCLUSIVE;
    public static final x2d BEGIN_IMMEDIATE;
    public static final x2d END;
    public static final x2d ROLLBACK;
    public static final /* synthetic */ x2d[] a;
    public static final /* synthetic */ i04 b;

    static {
        x2d x2dVar = new x2d("END", 0);
        END = x2dVar;
        x2d x2dVar2 = new x2d("ROLLBACK", 1);
        ROLLBACK = x2dVar2;
        x2d x2dVar3 = new x2d("BEGIN_EXCLUSIVE", 2);
        BEGIN_EXCLUSIVE = x2dVar3;
        x2d x2dVar4 = new x2d("BEGIN_IMMEDIATE", 3);
        BEGIN_IMMEDIATE = x2dVar4;
        x2d x2dVar5 = new x2d("BEGIN_DEFERRED", 4);
        BEGIN_DEFERRED = x2dVar5;
        x2d[] x2dVarArr = {x2dVar, x2dVar2, x2dVar3, x2dVar4, x2dVar5};
        a = x2dVarArr;
        b = new i04(x2dVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static x2d valueOf(String str) {
        return (x2d) Enum.valueOf(x2d.class, str);
    }

    public static x2d[] values() {
        return (x2d[]) a.clone();
    }
}
