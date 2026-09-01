package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fkc {
    public static final fkc CONSTANT;
    public static final fkc ERROR;
    public static final fkc SLACK;
    public static final fkc UNKNOWN;
    public static final fkc UNRESTRICTED;
    public static final /* synthetic */ fkc[] a;

    static {
        fkc fkcVar = new fkc("UNRESTRICTED", 0);
        UNRESTRICTED = fkcVar;
        fkc fkcVar2 = new fkc("CONSTANT", 1);
        CONSTANT = fkcVar2;
        fkc fkcVar3 = new fkc("SLACK", 2);
        SLACK = fkcVar3;
        fkc fkcVar4 = new fkc("ERROR", 3);
        ERROR = fkcVar4;
        fkc fkcVar5 = new fkc("UNKNOWN", 4);
        UNKNOWN = fkcVar5;
        a = new fkc[]{fkcVar, fkcVar2, fkcVar3, fkcVar4, fkcVar5};
    }

    public static fkc valueOf(String str) {
        return (fkc) Enum.valueOf(fkc.class, str);
    }

    public static fkc[] values() {
        return (fkc[]) a.clone();
    }
}
