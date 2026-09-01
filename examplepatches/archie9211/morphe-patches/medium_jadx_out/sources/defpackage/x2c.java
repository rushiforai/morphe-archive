package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x2c {
    public static final x2c FACEBOOK;
    public static final x2c X;
    public static final /* synthetic */ x2c[] a;
    public static final /* synthetic */ i04 b;

    static {
        x2c x2cVar = new x2c("X", 0);
        X = x2cVar;
        x2c x2cVar2 = new x2c("FACEBOOK", 1);
        FACEBOOK = x2cVar2;
        x2c[] x2cVarArr = {x2cVar, x2cVar2};
        a = x2cVarArr;
        b = new i04(x2cVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static x2c valueOf(String str) {
        return (x2c) Enum.valueOf(x2c.class, str);
    }

    public static x2c[] values() {
        return (x2c[]) a.clone();
    }
}
