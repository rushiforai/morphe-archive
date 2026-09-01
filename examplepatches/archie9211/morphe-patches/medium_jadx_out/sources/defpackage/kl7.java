package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kl7 {
    public static final kl7 Height;
    public static final kl7 Width;
    public static final /* synthetic */ kl7[] a;
    public static final /* synthetic */ i04 b;

    static {
        kl7 kl7Var = new kl7("Width", 0);
        Width = kl7Var;
        kl7 kl7Var2 = new kl7("Height", 1);
        Height = kl7Var2;
        kl7[] kl7VarArr = {kl7Var, kl7Var2};
        a = kl7VarArr;
        b = new i04(kl7VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static kl7 valueOf(String str) {
        return (kl7) Enum.valueOf(kl7.class, str);
    }

    public static kl7[] values() {
        return (kl7[]) a.clone();
    }
}
