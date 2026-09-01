package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nq7 {
    public static final nq7 FELL_REGULAR;
    public static final nq7 MONO;
    public static final nq7 MONO_BOLD;
    public static final nq7 MONO_BOLD_ITALIC;
    public static final nq7 MONO_ITALIC;
    public static final nq7 OPEN_DYSLEXIC;
    public static final nq7 OPEN_DYSLEXIC_BOLD;
    public static final nq7 OPEN_DYSLEXIC_BOLD_ITALIC;
    public static final nq7 OPEN_DYSLEXIC_ITALIC;
    public static final nq7 OPEN_DYSLEXIC_MONO;
    public static final nq7 SOHNE_MEDIUM;
    public static final nq7 SOHNE_MEDIUM_ITALIC;
    public static final nq7 SOHNE_REGULAR;
    public static final nq7 SOHNE_REGULAR_ITALIC;
    public static final nq7 SOURCE_SERIF_PRO;
    public static final nq7 SOURCE_SERIF_PRO_BOLD;
    public static final nq7 SOURCE_SERIF_PRO_BOLD_ITALIC;
    public static final nq7 SOURCE_SERIF_PRO_ITALIC;
    public static final /* synthetic */ nq7[] a;
    public static final /* synthetic */ i04 b;

    static {
        nq7 nq7Var = new nq7("MONO", 0);
        MONO = nq7Var;
        nq7 nq7Var2 = new nq7("MONO_BOLD", 1);
        MONO_BOLD = nq7Var2;
        nq7 nq7Var3 = new nq7("MONO_ITALIC", 2);
        MONO_ITALIC = nq7Var3;
        nq7 nq7Var4 = new nq7("MONO_BOLD_ITALIC", 3);
        MONO_BOLD_ITALIC = nq7Var4;
        nq7 nq7Var5 = new nq7("SOURCE_SERIF_PRO", 4);
        SOURCE_SERIF_PRO = nq7Var5;
        nq7 nq7Var6 = new nq7("SOURCE_SERIF_PRO_BOLD", 5);
        SOURCE_SERIF_PRO_BOLD = nq7Var6;
        nq7 nq7Var7 = new nq7("SOURCE_SERIF_PRO_ITALIC", 6);
        SOURCE_SERIF_PRO_ITALIC = nq7Var7;
        nq7 nq7Var8 = new nq7("SOURCE_SERIF_PRO_BOLD_ITALIC", 7);
        SOURCE_SERIF_PRO_BOLD_ITALIC = nq7Var8;
        nq7 nq7Var9 = new nq7("SOHNE_REGULAR", 8);
        SOHNE_REGULAR = nq7Var9;
        nq7 nq7Var10 = new nq7("SOHNE_REGULAR_ITALIC", 9);
        SOHNE_REGULAR_ITALIC = nq7Var10;
        nq7 nq7Var11 = new nq7("SOHNE_MEDIUM", 10);
        SOHNE_MEDIUM = nq7Var11;
        nq7 nq7Var12 = new nq7("SOHNE_MEDIUM_ITALIC", 11);
        SOHNE_MEDIUM_ITALIC = nq7Var12;
        nq7 nq7Var13 = new nq7("FELL_REGULAR", 12);
        FELL_REGULAR = nq7Var13;
        nq7 nq7Var14 = new nq7("OPEN_DYSLEXIC", 13);
        OPEN_DYSLEXIC = nq7Var14;
        nq7 nq7Var15 = new nq7("OPEN_DYSLEXIC_BOLD", 14);
        OPEN_DYSLEXIC_BOLD = nq7Var15;
        nq7 nq7Var16 = new nq7("OPEN_DYSLEXIC_ITALIC", 15);
        OPEN_DYSLEXIC_ITALIC = nq7Var16;
        nq7 nq7Var17 = new nq7("OPEN_DYSLEXIC_BOLD_ITALIC", 16);
        OPEN_DYSLEXIC_BOLD_ITALIC = nq7Var17;
        nq7 nq7Var18 = new nq7("OPEN_DYSLEXIC_MONO", 17);
        OPEN_DYSLEXIC_MONO = nq7Var18;
        nq7[] nq7VarArr = {nq7Var, nq7Var2, nq7Var3, nq7Var4, nq7Var5, nq7Var6, nq7Var7, nq7Var8, nq7Var9, nq7Var10, nq7Var11, nq7Var12, nq7Var13, nq7Var14, nq7Var15, nq7Var16, nq7Var17, nq7Var18};
        a = nq7VarArr;
        b = new i04(nq7VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static nq7 valueOf(String str) {
        return (nq7) Enum.valueOf(nq7.class, str);
    }

    public static nq7[] values() {
        return (nq7[]) a.clone();
    }
}
