package cw;

/* loaded from: classes4.dex */
public final class w implements r3.s {

    /* renamed from: b, reason: collision with root package name */
    public static final w f48348b = new w(0);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48349a;

    public /* synthetic */ w(int i5) {
        this.f48349a = i5;
    }

    @Override // r3.s
    public final int m(int i5) {
        switch (this.f48349a) {
            case 0:
                if (i5 == 0) {
                    return 0;
                }
                return i5 - (i5 / 3);
            case 1:
                return i5 <= 3 ? i5 : i5 - 3;
            case 2:
                return i5 <= 4 ? i5 : i5 <= 9 ? i5 - 1 : i5 <= 14 ? i5 - 2 : i5 - 3;
            case 3:
                return i5 <= 4 ? i5 : i5 <= 11 ? i5 - 1 : i5 - 2;
            case 4:
                return i5 <= 4 ? i5 : i5 <= 9 ? i5 - 1 : i5 <= 14 ? i5 - 2 : i5 <= 19 ? i5 - 3 : i5 - 4;
            default:
                return i5 - (i5 / 5);
        }
    }

    @Override // r3.s
    public final int o(int i5) {
        switch (this.f48349a) {
            case 0:
                if (i5 == 0) {
                    return 0;
                }
                int i11 = (i5 / 2) + i5;
                return i5 % 2 == 0 ? i11 - 1 : i11;
            case 1:
                return i5 <= 2 ? i5 : i5 + 3;
            case 2:
                return i5 <= 3 ? i5 : i5 <= 7 ? i5 + 1 : i5 <= 11 ? i5 + 2 : i5 + 3;
            case 3:
                return i5 <= 3 ? i5 : i5 <= 9 ? i5 + 1 : i5 + 2;
            case 4:
                return i5 <= 3 ? i5 : i5 <= 7 ? i5 + 1 : i5 <= 11 ? i5 + 2 : i5 <= 15 ? i5 + 3 : i5 + 4;
            default:
                return (i5 / 4) + i5;
        }
    }
}
