package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bt4 {
    public static final bt4 CANT_FOLLOW;
    public static final bt4 ERROR;
    public static final bt4 FOLLOWING;
    public static final bt4 NOT_FOLLOWING;
    public static final /* synthetic */ bt4[] a;
    public static final /* synthetic */ i04 b;

    static {
        bt4 bt4Var = new bt4("FOLLOWING", 0);
        FOLLOWING = bt4Var;
        bt4 bt4Var2 = new bt4("NOT_FOLLOWING", 1);
        NOT_FOLLOWING = bt4Var2;
        bt4 bt4Var3 = new bt4("CANT_FOLLOW", 2);
        CANT_FOLLOW = bt4Var3;
        bt4 bt4Var4 = new bt4("ERROR", 3);
        ERROR = bt4Var4;
        bt4[] bt4VarArr = {bt4Var, bt4Var2, bt4Var3, bt4Var4};
        a = bt4VarArr;
        b = new i04(bt4VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static bt4 valueOf(String str) {
        return (bt4) Enum.valueOf(bt4.class, str);
    }

    public static bt4[] values() {
        return (bt4[]) a.clone();
    }
}
