package k0;

/* loaded from: classes.dex */
public final class f implements h, j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70599a;

    /* renamed from: b, reason: collision with root package name */
    public final float f70600b;

    public f(int i5) {
        this.f70599a = i5;
        switch (i5) {
            case 1:
                this.f70600b = 0;
                break;
            case 2:
                this.f70600b = 0;
                break;
            case 3:
                this.f70600b = 0;
                break;
            default:
                this.f70600b = 0;
                break;
        }
    }

    @Override // k0.h, k0.j
    public final float a() {
        switch (this.f70599a) {
        }
        return this.f70600b;
    }

    @Override // k0.j
    public final void b(y3.c cVar, int i5, int[] iArr, int[] iArr2) {
        switch (this.f70599a) {
            case 0:
                k.a(i5, iArr, iArr2, false);
                break;
            case 1:
                k.d(i5, iArr, iArr2, false);
                break;
            case 2:
                k.e(i5, iArr, iArr2, false);
                break;
            default:
                k.f(i5, iArr, iArr2, false);
                break;
        }
    }

    @Override // k0.h
    public final void k(y3.c cVar, int i5, int[] iArr, y3.n nVar, int[] iArr2) {
        switch (this.f70599a) {
            case 0:
                if (nVar != y3.n.f96612a) {
                    k.a(i5, iArr, iArr2, true);
                    break;
                } else {
                    k.a(i5, iArr, iArr2, false);
                    break;
                }
            case 1:
                if (nVar != y3.n.f96612a) {
                    k.d(i5, iArr, iArr2, true);
                    break;
                } else {
                    k.d(i5, iArr, iArr2, false);
                    break;
                }
            case 2:
                if (nVar != y3.n.f96612a) {
                    k.e(i5, iArr, iArr2, true);
                    break;
                } else {
                    k.e(i5, iArr, iArr2, false);
                    break;
                }
            default:
                if (nVar != y3.n.f96612a) {
                    k.f(i5, iArr, iArr2, true);
                    break;
                } else {
                    k.f(i5, iArr, iArr2, false);
                    break;
                }
        }
    }

    public final String toString() {
        switch (this.f70599a) {
            case 0:
                return "Arrangement#Center";
            case 1:
                return "Arrangement#SpaceAround";
            case 2:
                return "Arrangement#SpaceBetween";
            default:
                return "Arrangement#SpaceEvenly";
        }
    }
}
