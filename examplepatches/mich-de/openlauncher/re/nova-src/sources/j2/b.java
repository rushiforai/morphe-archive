package j2;

/* loaded from: classes.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final long f68650a;

    /* renamed from: b, reason: collision with root package name */
    public static final long f68651b;

    /* renamed from: c, reason: collision with root package name */
    public static final long f68652c;

    /* renamed from: d, reason: collision with root package name */
    public static final long f68653d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ int f68654e = 0;

    static {
        long j11 = 3;
        long j12 = j11 << 32;
        f68650a = (0 & 4294967295L) | j12;
        f68651b = (1 & 4294967295L) | j12;
        f68652c = j12 | (2 & 4294967295L);
        f68653d = (j11 & 4294967295L) | (4 << 32);
    }

    public static final boolean a(long j11, long j12) {
        return j11 == j12;
    }

    public static String b(long j11) {
        return a(j11, f68650a) ? "Rgb" : a(j11, f68651b) ? "Xyz" : a(j11, f68652c) ? "Lab" : a(j11, f68653d) ? "Cmyk" : "Unknown";
    }
}
