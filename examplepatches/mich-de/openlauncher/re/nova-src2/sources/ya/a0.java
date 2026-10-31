package ya;

/* loaded from: classes.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f97099a;

    /* renamed from: b, reason: collision with root package name */
    public float f97100b = 1.0f;

    /* renamed from: c, reason: collision with root package name */
    public float f97101c = 1.0f;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ b0 f97102d;

    public a0(b0 b0Var, int i5) {
        this.f97102d = b0Var;
        this.f97099a = i5;
    }

    public final void a(float f11) {
        if (this.f97100b == f11) {
            return;
        }
        b0 b0Var = this.f97102d;
        int i5 = b0Var.f97111c;
        int i11 = this.f97099a;
        if ((i5 & i11) == 0) {
            this.f97101c = 1.0f;
            for (a0 a0Var : b0Var.f97110b) {
                if (a0Var != this) {
                    this.f97101c *= a0Var.f97100b;
                }
            }
        }
        b0Var.f97111c = i11;
        this.f97100b = f11;
        b0Var.f97109a.setAlpha(this.f97101c * f11);
    }

    public final String toString() {
        return Float.toString(this.f97100b);
    }
}
