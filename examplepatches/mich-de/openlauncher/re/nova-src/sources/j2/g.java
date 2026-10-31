package j2;

/* loaded from: classes.dex */
public class g {

    /* renamed from: a, reason: collision with root package name */
    public final c f68684a;

    /* renamed from: b, reason: collision with root package name */
    public final c f68685b;

    /* renamed from: c, reason: collision with root package name */
    public final c f68686c;

    /* renamed from: d, reason: collision with root package name */
    public final float[] f68687d;

    public g(c cVar, c cVar2, c cVar3, float[] fArr) {
        this.f68684a = cVar;
        this.f68685b = cVar2;
        this.f68686c = cVar3;
        this.f68687d = fArr;
    }

    public long a(long j11) {
        float fG = i2.s.g(j11);
        float f11 = i2.s.f(j11);
        float fD = i2.s.d(j11);
        float fC = i2.s.c(j11);
        c cVar = this.f68685b;
        long jD = cVar.d(fG, f11, fD);
        float fIntBitsToFloat = Float.intBitsToFloat((int) (jD >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (jD & 4294967295L));
        float fE = cVar.e(fG, f11, fD);
        float[] fArr = this.f68687d;
        if (fArr != null) {
            fIntBitsToFloat *= fArr[0];
            fIntBitsToFloat2 *= fArr[1];
            fE *= fArr[2];
        }
        float f12 = fIntBitsToFloat;
        float f13 = fIntBitsToFloat2;
        return this.f68686c.f(f12, f13, fE, fC, this.f68684a);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0069  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public g(c cVar, c cVar2, int i5) {
        float[] fArr;
        long j11 = cVar.f68656b;
        long j12 = b.f68650a;
        c cVarA = b.a(j11, j12) ? j.a(cVar) : cVar;
        c cVarA2 = b.a(cVar2.f68656b, j12) ? j.a(cVar2) : cVar2;
        if (i5 == 3) {
            boolean zA = b.a(cVar.f68656b, j12);
            boolean zA2 = b.a(cVar2.f68656b, j12);
            if (!(zA && zA2) && (zA || zA2)) {
                s sVar = ((q) (zA ? cVar : cVar2)).f68708d;
                float[] fArrA = j.f68693e;
                float[] fArrA2 = zA ? sVar.a() : fArrA;
                fArrA = zA2 ? sVar.a() : fArrA;
                fArr = new float[]{fArrA2[0] / fArrA[0], fArrA2[1] / fArrA[1], fArrA2[2] / fArrA[2]};
            } else {
                fArr = null;
            }
        }
        this(cVar2, cVarA, cVarA2, fArr);
    }
}
