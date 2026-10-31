package z2;

/* loaded from: classes.dex */
public final class b1 implements y1, l {

    /* renamed from: b, reason: collision with root package name */
    public static final b1 f98025b = new b1(0);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f98026a;

    public /* synthetic */ b1(int i5) {
        this.f98026a = i5;
    }

    @Override // z2.l
    public long a(long j11, long j12) {
        long j13;
        long j14;
        long jFloatToRawIntBits;
        int iFloatToRawIntBits;
        switch (this.f98026a) {
            case 1:
                float fMax = Math.max(Float.intBitsToFloat((int) (j12 >> 32)) / Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j12 & 4294967295L)) / Float.intBitsToFloat((int) (j11 & 4294967295L)));
                long jFloatToRawIntBits2 = Float.floatToRawIntBits(fMax);
                long jFloatToRawIntBits3 = Float.floatToRawIntBits(fMax);
                j13 = jFloatToRawIntBits2 << 32;
                j14 = jFloatToRawIntBits3 & 4294967295L;
                break;
            case 2:
                float fC = r1.c(j11, j12);
                long jFloatToRawIntBits4 = Float.floatToRawIntBits(fC);
                long jFloatToRawIntBits5 = Float.floatToRawIntBits(fC);
                j13 = jFloatToRawIntBits4 << 32;
                j14 = 4294967295L & jFloatToRawIntBits5;
                break;
            default:
                if (Float.intBitsToFloat((int) (j11 >> 32)) > Float.intBitsToFloat((int) (j12 >> 32)) || Float.intBitsToFloat((int) (j11 & 4294967295L)) > Float.intBitsToFloat((int) (j12 & 4294967295L))) {
                    float fC2 = r1.c(j11, j12);
                    jFloatToRawIntBits = Float.floatToRawIntBits(fC2);
                    iFloatToRawIntBits = Float.floatToRawIntBits(fC2);
                } else {
                    jFloatToRawIntBits = Float.floatToRawIntBits(1.0f);
                    iFloatToRawIntBits = Float.floatToRawIntBits(1.0f);
                }
                return (jFloatToRawIntBits << 32) | (iFloatToRawIntBits & 4294967295L);
        }
        return j13 | j14;
    }

    @Override // z2.y1
    public void c(x1 x1Var) {
        x1Var.clear();
    }

    @Override // z2.y1
    public boolean e(Object obj, Object obj2) {
        return false;
    }

    public String toString() {
        switch (this.f98026a) {
            case 4:
                return "ReusedSlotId";
            default:
                return super.toString();
        }
    }
}
