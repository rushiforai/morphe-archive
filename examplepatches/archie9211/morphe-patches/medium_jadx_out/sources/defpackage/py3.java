package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class py3 {
    public static final py3 AZTEC_LAYERS;
    public static final py3 CHARACTER_SET;
    public static final py3 DATA_MATRIX_SHAPE;
    public static final py3 ERROR_CORRECTION;
    public static final py3 GS1_FORMAT;
    public static final py3 MARGIN;

    @Deprecated
    public static final py3 MAX_SIZE;

    @Deprecated
    public static final py3 MIN_SIZE;
    public static final py3 PDF417_COMPACT;
    public static final py3 PDF417_COMPACTION;
    public static final py3 PDF417_DIMENSIONS;
    public static final py3 QR_VERSION;
    public static final /* synthetic */ py3[] a;

    static {
        py3 py3Var = new py3("ERROR_CORRECTION", 0);
        ERROR_CORRECTION = py3Var;
        py3 py3Var2 = new py3("CHARACTER_SET", 1);
        CHARACTER_SET = py3Var2;
        py3 py3Var3 = new py3("DATA_MATRIX_SHAPE", 2);
        DATA_MATRIX_SHAPE = py3Var3;
        py3 py3Var4 = new py3("MIN_SIZE", 3);
        MIN_SIZE = py3Var4;
        py3 py3Var5 = new py3("MAX_SIZE", 4);
        MAX_SIZE = py3Var5;
        py3 py3Var6 = new py3("MARGIN", 5);
        MARGIN = py3Var6;
        py3 py3Var7 = new py3("PDF417_COMPACT", 6);
        PDF417_COMPACT = py3Var7;
        py3 py3Var8 = new py3("PDF417_COMPACTION", 7);
        PDF417_COMPACTION = py3Var8;
        py3 py3Var9 = new py3("PDF417_DIMENSIONS", 8);
        PDF417_DIMENSIONS = py3Var9;
        py3 py3Var10 = new py3("AZTEC_LAYERS", 9);
        AZTEC_LAYERS = py3Var10;
        py3 py3Var11 = new py3("QR_VERSION", 10);
        QR_VERSION = py3Var11;
        py3 py3Var12 = new py3("GS1_FORMAT", 11);
        GS1_FORMAT = py3Var12;
        a = new py3[]{py3Var, py3Var2, py3Var3, py3Var4, py3Var5, py3Var6, py3Var7, py3Var8, py3Var9, py3Var10, py3Var11, py3Var12};
    }

    public static py3 valueOf(String str) {
        return (py3) Enum.valueOf(py3.class, str);
    }

    public static py3[] values() {
        return (py3[]) a.clone();
    }
}
