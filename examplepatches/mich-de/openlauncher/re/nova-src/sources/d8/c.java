package d8;

/* loaded from: classes2.dex */
public final class c implements Cloneable {

    /* renamed from: a, reason: collision with root package name */
    public final float f49016a;

    /* renamed from: b, reason: collision with root package name */
    public int f49017b;

    public c() {
        this(0.0f, 0);
    }

    public final int a(int i5) {
        return ((int) (i5 * this.f49016a)) + this.f49017b;
    }

    public final void c(int i5, int i11) {
        int i12 = this.f49017b;
        if (i12 != 0) {
            int i13 = d.f49018g;
            if (i5 != 0 && i11 != 0 && i5 != i11) {
                i12 = ((i12 * i11) + (i5 >> 1)) / i5;
            }
            this.f49017b = i12;
        }
    }

    public final Object clone() {
        return new c(this.f49016a, this.f49017b);
    }

    public c(float f11, int i5) {
        this.f49016a = f11;
        this.f49017b = i5;
    }
}
