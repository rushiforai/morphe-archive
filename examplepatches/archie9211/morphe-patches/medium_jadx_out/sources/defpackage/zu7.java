package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zu7 {
    public static final zu7 DECLARATION;
    public static final zu7 DELEGATION;
    public static final zu7 FAKE_OVERRIDE;
    public static final zu7 SYNTHESIZED;
    public static final /* synthetic */ zu7[] b;
    public static final /* synthetic */ i04 c;
    public final vl4 a;

    static {
        zu7 zu7Var = new zu7("DECLARATION", 0, 0);
        DECLARATION = zu7Var;
        zu7 zu7Var2 = new zu7("FAKE_OVERRIDE", 1, 1);
        FAKE_OVERRIDE = zu7Var2;
        zu7 zu7Var3 = new zu7("DELEGATION", 2, 2);
        DELEGATION = zu7Var3;
        zu7 zu7Var4 = new zu7("SYNTHESIZED", 3, 3);
        SYNTHESIZED = zu7Var4;
        zu7[] zu7VarArr = {zu7Var, zu7Var2, zu7Var3, zu7Var4};
        b = zu7VarArr;
        c = new i04(zu7VarArr);
    }

    public zu7(String str, int i, int i2) {
        yl4 yl4Var = cm4.p;
        yl4Var.getClass();
        this.a = new vl4(yl4Var, i2);
    }

    public static g04 getEntries() {
        return c;
    }

    public static zu7 valueOf(String str) {
        return (zu7) Enum.valueOf(zu7.class, str);
    }

    public static zu7[] values() {
        return (zu7[]) b.clone();
    }

    public final vl4 getFlag$kotlin_metadata() {
        return this.a;
    }
}
