package r10;

/* loaded from: classes.dex */
public final class x0 extends j80.a {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f85310c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ x0(String str, int i5, int i11) {
        super(str, i5);
        this.f85310c = i11;
    }

    @Override // j80.a
    public final double a(double... dArr) {
        switch (this.f85310c) {
            case 0:
                return Math.toDegrees(Math.acos(dArr[0]));
            case 1:
                return Math.toDegrees(Math.asin(dArr[0]));
            case 2:
                return Math.toDegrees(Math.atan(dArr[0]));
            case 3:
                return Math.cos(Math.toRadians(dArr[0]));
            case 4:
                return Math.sin(Math.toRadians(dArr[0]));
            default:
                return Math.tan(Math.toRadians(dArr[0]));
        }
    }
}
