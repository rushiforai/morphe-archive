package defpackage;

import com.google.android.gms.internal.fido.Hg.kSWQKWZ;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class r79 {
    public static final r79 ASPIRATIONAL;
    public static final r79 INTRO_OFFER;
    public static final r79 PROGRAMMING;
    public static final r79 STATIC;
    public static final /* synthetic */ r79[] b;
    public static final /* synthetic */ i04 c;
    public final String a;

    public r79(String str, int i, String str2) {
        this.a = str2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static r79 valueOf(String str) {
        return (r79) Enum.valueOf(r79.class, str);
    }

    public static r79[] values() {
        return (r79[]) b.clone();
    }

    public final String getValue() {
        return this.a;
    }

    static {
        r79 r79Var = new r79("ASPIRATIONAL", 0, "ASPIRATIONAL");
        ASPIRATIONAL = r79Var;
        r79 r79Var2 = new r79("PROGRAMMING", 1, "PROGRAMMING");
        PROGRAMMING = r79Var2;
        String str = kSWQKWZ.LzlkmqTxiz;
        r79 r79Var3 = new r79(str, 2, str);
        STATIC = r79Var3;
        r79 r79Var4 = new r79("INTRO_OFFER", 3, "INTRO_OFFER");
        INTRO_OFFER = r79Var4;
        r79[] r79VarArr = {r79Var, r79Var2, r79Var3, r79Var4};
        b = r79VarArr;
        c = new i04(r79VarArr);
    }
}
