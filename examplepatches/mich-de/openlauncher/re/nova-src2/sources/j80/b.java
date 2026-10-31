package j80;

/* loaded from: classes5.dex */
public final class b extends a {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f69154c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(String str, int i5, int i11) {
        super(str, i5);
        this.f69154c = i11;
    }

    @Override // j80.a
    public final double a(double... dArr) {
        switch (this.f69154c) {
            case 0:
                return Math.acos(dArr[0]);
            case 1:
                return Math.asin(dArr[0]);
            case 2:
                return Math.atan(dArr[0]);
            case 3:
                return Math.cbrt(dArr[0]);
            case 4:
                return Math.floor(dArr[0]);
            case 5:
                return Math.sinh(dArr[0]);
            case 6:
                return Math.sqrt(dArr[0]);
            case 7:
                return Math.tanh(dArr[0]);
            case 8:
                return Math.cosh(dArr[0]);
            case 9:
                return Math.ceil(dArr[0]);
            case 10:
                return Math.sin(dArr[0]);
            case 11:
                return Math.pow(dArr[0], dArr[1]);
            case 12:
                return Math.exp(dArr[0]);
            case 13:
                return Math.expm1(dArr[0]);
            case 14:
                double d5 = dArr[0];
                if (d5 > 0.0d) {
                    return 1.0d;
                }
                return d5 < 0.0d ? -1.0d : 0.0d;
            case 15:
                return Math.cos(dArr[0]);
            case 16:
                return Math.tan(dArr[0]);
            case 17:
                if (Math.tan(dArr[0]) != 0.0d) {
                    return 1.0d / Math.tan(dArr[0]);
                }
                throw new ArithmeticException("Division by zero in cotangent!");
            case 18:
                return Math.log(dArr[0]);
            case 19:
                return Math.log(dArr[0]) / Math.log(2.0d);
            case 20:
                return Math.log10(dArr[0]);
            case 21:
                return Math.log1p(dArr[0]);
            default:
                return Math.abs(dArr[0]);
        }
    }
}
