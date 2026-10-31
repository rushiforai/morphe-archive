package androidx.recyclerview.widget;

/* loaded from: classes.dex */
public final class e3 {

    /* renamed from: a, reason: collision with root package name */
    public int f14937a;

    /* renamed from: b, reason: collision with root package name */
    public int f14938b;

    /* renamed from: c, reason: collision with root package name */
    public int f14939c;

    /* renamed from: d, reason: collision with root package name */
    public int f14940d;

    /* renamed from: e, reason: collision with root package name */
    public int f14941e;

    public final boolean a() {
        int i5 = this.f14937a;
        int i11 = 2;
        if ((i5 & 7) != 0) {
            int i12 = this.f14940d;
            int i13 = this.f14938b;
            if (((i12 > i13 ? 1 : i12 == i13 ? 2 : 4) & i5) == 0) {
                return false;
            }
        }
        if ((i5 & 112) != 0) {
            int i14 = this.f14940d;
            int i15 = this.f14939c;
            if ((((i14 > i15 ? 1 : i14 == i15 ? 2 : 4) << 4) & i5) == 0) {
                return false;
            }
        }
        if ((i5 & 1792) != 0) {
            int i16 = this.f14941e;
            int i17 = this.f14938b;
            if ((((i16 > i17 ? 1 : i16 == i17 ? 2 : 4) << 8) & i5) == 0) {
                return false;
            }
        }
        if ((i5 & 28672) != 0) {
            int i18 = this.f14941e;
            int i19 = this.f14939c;
            if (i18 > i19) {
                i11 = 1;
            } else if (i18 != i19) {
                i11 = 4;
            }
            if ((i5 & (i11 << 12)) == 0) {
                return false;
            }
        }
        return true;
    }
}
