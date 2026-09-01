package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mp7 {
    public static final mp7 CREATED_AT;
    public static final mp7 VALUE;
    public static final /* synthetic */ mp7[] b;
    public static final /* synthetic */ i04 c;
    public final int a;

    static {
        mp7 mp7Var = new mp7("VALUE", 0, 0);
        VALUE = mp7Var;
        mp7 mp7Var2 = new mp7("CREATED_AT", 1, 1);
        CREATED_AT = mp7Var2;
        mp7[] mp7VarArr = {mp7Var, mp7Var2};
        b = mp7VarArr;
        c = new i04(mp7VarArr);
    }

    public mp7(String str, int i, int i2) {
        this.a = i2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static mp7 valueOf(String str) {
        return (mp7) Enum.valueOf(mp7.class, str);
    }

    public static mp7[] values() {
        return (mp7[]) b.clone();
    }

    public final int getIdx() {
        return this.a;
    }
}
