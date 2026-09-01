package defpackage;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b28 {
    public static final b28 ABSTRACT;
    public static final b28 FINAL;
    public static final b28 OPEN;
    public static final b28 SEALED;
    public static final /* synthetic */ b28[] b;
    public static final /* synthetic */ i04 c;
    public final vl4 a;

    public b28(String str, int i, int i2) {
        yl4 yl4Var = cm4.e;
        yl4Var.getClass();
        this.a = new vl4(yl4Var, i2);
    }

    public static g04 getEntries() {
        return c;
    }

    public static b28 valueOf(String str) {
        return (b28) Enum.valueOf(b28.class, str);
    }

    public static b28[] values() {
        return (b28[]) b.clone();
    }

    public final vl4 getFlag$kotlin_metadata() {
        return this.a;
    }

    static {
        b28 b28Var = new b28(CspinKvYN.hNC, 0, 0);
        FINAL = b28Var;
        b28 b28Var2 = new b28("OPEN", 1, 1);
        OPEN = b28Var2;
        b28 b28Var3 = new b28("ABSTRACT", 2, 2);
        ABSTRACT = b28Var3;
        b28 b28Var4 = new b28("SEALED", 3, 3);
        SEALED = b28Var4;
        b28[] b28VarArr = {b28Var, b28Var2, b28Var3, b28Var4};
        b = b28VarArr;
        c = new i04(b28VarArr);
    }
}
