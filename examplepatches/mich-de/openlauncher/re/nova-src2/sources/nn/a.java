package nn;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f78360a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f78361b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f78362c;

    /* renamed from: d, reason: collision with root package name */
    public static final a f78363d;

    /* renamed from: e, reason: collision with root package name */
    public static final a f78364e;

    /* renamed from: f, reason: collision with root package name */
    public static final a f78365f;

    /* renamed from: g, reason: collision with root package name */
    public static final a f78366g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ a[] f78367h;

    static {
        a aVar = new a("ERROR_CORRECTION", 0);
        f78360a = aVar;
        a aVar2 = new a("CHARACTER_SET", 1);
        f78361b = aVar2;
        a aVar3 = new a("DATA_MATRIX_SHAPE", 2);
        a aVar4 = new a("DATA_MATRIX_COMPACT", 3);
        a aVar5 = new a("MIN_SIZE", 4);
        a aVar6 = new a("MAX_SIZE", 5);
        a aVar7 = new a("MARGIN", 6);
        f78362c = aVar7;
        a aVar8 = new a("PDF417_COMPACT", 7);
        a aVar9 = new a("PDF417_COMPACTION", 8);
        a aVar10 = new a("PDF417_DIMENSIONS", 9);
        a aVar11 = new a("PDF417_AUTO_ECI", 10);
        a aVar12 = new a("AZTEC_LAYERS", 11);
        a aVar13 = new a("QR_VERSION", 12);
        f78363d = aVar13;
        a aVar14 = new a("QR_MASK_PATTERN", 13);
        f78364e = aVar14;
        a aVar15 = new a("QR_COMPACT", 14);
        f78365f = aVar15;
        a aVar16 = new a("GS1_FORMAT", 15);
        f78366g = aVar16;
        f78367h = new a[]{aVar, aVar2, aVar3, aVar4, aVar5, aVar6, aVar7, aVar8, aVar9, aVar10, aVar11, aVar12, aVar13, aVar14, aVar15, aVar16, new a("FORCE_CODE_SET", 16), new a("FORCE_C40", 17), new a("CODE128_COMPACT", 18)};
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f78367h.clone();
    }
}
