package androidx.datastore.preferences.protobuf;

/* loaded from: classes.dex */
public final class y0 {

    /* renamed from: a, reason: collision with root package name */
    public final a f14432a;

    /* renamed from: b, reason: collision with root package name */
    public final String f14433b;

    /* renamed from: c, reason: collision with root package name */
    public final Object[] f14434c;

    /* renamed from: d, reason: collision with root package name */
    public final int f14435d;

    public y0(y yVar, String str, Object[] objArr) {
        this.f14432a = yVar;
        this.f14433b = str;
        this.f14434c = objArr;
        char cCharAt = str.charAt(0);
        if (cCharAt < 55296) {
            this.f14435d = cCharAt;
            return;
        }
        int i5 = cCharAt & 8191;
        int i11 = 13;
        int i12 = 1;
        while (true) {
            int i13 = i12 + 1;
            char cCharAt2 = str.charAt(i12);
            if (cCharAt2 < 55296) {
                this.f14435d = i5 | (cCharAt2 << i11);
                return;
            } else {
                i5 |= (cCharAt2 & 8191) << i11;
                i11 += 13;
                i12 = i13;
            }
        }
    }

    public final int a() {
        int i5 = this.f14435d;
        if ((i5 & 1) != 0) {
            return 1;
        }
        return (i5 & 4) == 4 ? 3 : 2;
    }
}
