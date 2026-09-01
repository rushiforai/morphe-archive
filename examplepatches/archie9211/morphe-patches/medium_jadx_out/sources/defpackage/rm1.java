package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rm1 {
    public static final rm1 M;
    public static final rm1 S;
    public static final /* synthetic */ rm1[] b;
    public static final /* synthetic */ i04 c;
    public final float a;

    static {
        rm1 rm1Var = new rm1("S", 0, 16.0f);
        S = rm1Var;
        rm1 rm1Var2 = new rm1("M", 1, 24.0f);
        M = rm1Var2;
        rm1[] rm1VarArr = {rm1Var, rm1Var2};
        b = rm1VarArr;
        c = new i04(rm1VarArr);
    }

    public rm1(String str, int i, float f) {
        this.a = f;
    }

    public static g04 getEntries() {
        return c;
    }

    public static rm1 valueOf(String str) {
        return (rm1) Enum.valueOf(rm1.class, str);
    }

    public static rm1[] values() {
        return (rm1[]) b.clone();
    }

    /* JADX INFO: renamed from: getSize-D9Ej5fM, reason: not valid java name */
    public final float m146getSizeD9Ej5fM() {
        return this.a;
    }
}
