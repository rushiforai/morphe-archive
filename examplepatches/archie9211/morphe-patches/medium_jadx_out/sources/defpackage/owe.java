package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class owe {
    public static final owe INTERNAL;
    public static final owe LOCAL;
    public static final owe PRIVATE;
    public static final owe PRIVATE_TO_THIS;
    public static final owe PROTECTED;
    public static final owe PUBLIC;
    public static final /* synthetic */ owe[] b;
    public static final /* synthetic */ i04 c;
    public final vl4 a;

    static {
        owe oweVar = new owe("INTERNAL", 0, 0);
        INTERNAL = oweVar;
        owe oweVar2 = new owe("PRIVATE", 1, 1);
        PRIVATE = oweVar2;
        owe oweVar3 = new owe("PROTECTED", 2, 2);
        PROTECTED = oweVar3;
        owe oweVar4 = new owe("PUBLIC", 3, 3);
        PUBLIC = oweVar4;
        owe oweVar5 = new owe("PRIVATE_TO_THIS", 4, 4);
        PRIVATE_TO_THIS = oweVar5;
        owe oweVar6 = new owe("LOCAL", 5, 5);
        LOCAL = oweVar6;
        owe[] oweVarArr = {oweVar, oweVar2, oweVar3, oweVar4, oweVar5, oweVar6};
        b = oweVarArr;
        c = new i04(oweVarArr);
    }

    public owe(String str, int i, int i2) {
        yl4 yl4Var = cm4.d;
        yl4Var.getClass();
        this.a = new vl4(yl4Var, i2);
    }

    public static g04 getEntries() {
        return c;
    }

    public static owe valueOf(String str) {
        return (owe) Enum.valueOf(owe.class, str);
    }

    public static owe[] values() {
        return (owe[]) b.clone();
    }

    public final vl4 getFlag$kotlin_metadata() {
        return this.a;
    }
}
