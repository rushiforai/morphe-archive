package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kj3 {
    public static final kj3 NORMAL;
    public static final kj3 SMALL;
    public static final /* synthetic */ kj3[] d;
    public static final /* synthetic */ i04 e;
    public final float a;
    public final float b;
    public final float c;

    static {
        kj3 kj3Var = new kj3("NORMAL", 0, 24.0f, 6.0f, 2.0f);
        NORMAL = kj3Var;
        kj3 kj3Var2 = new kj3("SMALL", 1, 18.0f, 4.8f, 1.0f);
        SMALL = kj3Var2;
        kj3[] kj3VarArr = {kj3Var, kj3Var2};
        d = kj3VarArr;
        e = new i04(kj3VarArr);
    }

    public kj3(String str, int i, float f, float f2, float f3) {
        this.a = f;
        this.b = f2;
        this.c = f3;
    }

    public static g04 getEntries() {
        return e;
    }

    public static kj3 valueOf(String str) {
        return (kj3) Enum.valueOf(kj3.class, str);
    }

    public static kj3[] values() {
        return (kj3[]) d.clone();
    }

    /* JADX INFO: renamed from: getDownloadingInnerPadding-D9Ej5fM, reason: not valid java name */
    public final float m124getDownloadingInnerPaddingD9Ej5fM() {
        return this.c;
    }

    /* JADX INFO: renamed from: getDownloadingSquareSize-D9Ej5fM, reason: not valid java name */
    public final float m125getDownloadingSquareSizeD9Ej5fM() {
        return this.b;
    }

    /* JADX INFO: renamed from: getSize-D9Ej5fM, reason: not valid java name */
    public final float m126getSizeD9Ej5fM() {
        return this.a;
    }
}
