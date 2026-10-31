package ads_mobile_sdk;

/* loaded from: classes.dex */
public final class ps2 {

    /* renamed from: a, reason: collision with root package name */
    public final cu0 f8375a;

    /* renamed from: b, reason: collision with root package name */
    public final String f8376b;

    /* renamed from: c, reason: collision with root package name */
    public final Object[] f8377c;

    /* renamed from: d, reason: collision with root package name */
    public final int f8378d;

    public ps2(cu0 cu0Var, String str, Object[] objArr) {
        this.f8375a = cu0Var;
        this.f8376b = str;
        this.f8377c = objArr;
        char cCharAt = str.charAt(0);
        if (cCharAt < 55296) {
            this.f8378d = cCharAt;
            return;
        }
        int i5 = cCharAt & 8191;
        int i11 = 13;
        int i12 = 1;
        while (true) {
            int i13 = i12 + 1;
            char cCharAt2 = str.charAt(i12);
            if (cCharAt2 < 55296) {
                this.f8378d = i5 | (cCharAt2 << i11);
                return;
            } else {
                i5 |= (cCharAt2 & 8191) << i11;
                i11 += 13;
                i12 = i13;
            }
        }
    }

    public final int d() {
        int i5 = this.f8378d;
        if ((i5 & 1) != 0) {
            return 1;
        }
        return (i5 & 4) == 4 ? 3 : 2;
    }
}
