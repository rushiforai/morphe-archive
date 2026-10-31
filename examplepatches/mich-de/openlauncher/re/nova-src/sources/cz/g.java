package cz;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public float f48612a;

    /* renamed from: b, reason: collision with root package name */
    public float f48613b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f48614c;

    public g() {
        this.f48613b = 0.0f;
        f fVar = new f();
        fVar.f48611f = 0;
        this.f48614c = fVar;
    }

    public void a(float f11, float f12, long j11) {
        f fVar = (f) this.f48614c;
        int i5 = fVar.f48611f;
        if (i5 > 0) {
            long j12 = j11 - fVar.f48608c;
            if (i5 != 1) {
                float f13 = j12;
                float f14 = (f11 - fVar.f48606a) / f13;
                float f15 = (f12 - fVar.f48607b) / f13;
                float fExp = (float) Math.exp(f13 * (-0.025f));
                if (j12 < 8) {
                    return;
                }
                if (fExp > 0.01f) {
                    float f16 = (fVar.f48609d * fExp) + f14;
                    float f17 = 1.0f + fExp;
                    fVar.f48609d = f16 / f17;
                    fVar.f48610e = ((fExp * fVar.f48610e) + f15) / f17;
                }
            } else {
                if (j12 < 8) {
                    return;
                }
                float f18 = j12;
                fVar.f48609d = (f11 - fVar.f48606a) / f18;
                fVar.f48610e = (f12 - fVar.f48607b) / f18;
            }
        }
        fVar.f48606a = f11;
        fVar.f48607b = f12;
        fVar.f48608c = j11;
        fVar.f48611f++;
    }

    public void b() {
        f fVar = (f) this.f48614c;
        fVar.f48611f = 0;
        fVar.f48609d = 0.0f;
        fVar.f48610e = 0.0f;
    }

    public void c(float f11) {
        f fVar = (f) this.f48614c;
        float f12 = 1000;
        float f13 = fVar.f48609d * f12;
        this.f48612a = f13;
        if (f13 > f11) {
            this.f48612a = f11;
        } else {
            float f14 = -f11;
            if ((-f13) < f14) {
                this.f48612a = f14;
            }
        }
        float f15 = fVar.f48610e * f12;
        this.f48613b = f15;
        if (f15 > f11) {
            this.f48613b = f11;
            return;
        }
        float f16 = -f11;
        if ((-f15) < f16) {
            this.f48613b = f16;
        }
    }

    public void d(float f11, int i5) {
        if (this.f48612a == 0.0f && this.f48613b == 0.0f) {
            this.f48613b = f11;
            this.f48612a = f11;
        }
        if (f11 < this.f48612a) {
            this.f48612a = f11;
        }
        if (f11 > this.f48613b) {
            this.f48613b = f11;
        }
        ((float[]) this.f48614c)[i5] = f11;
    }

    public int e(float f11) {
        int i5 = 0;
        for (float f12 : (float[]) this.f48614c) {
            if (f12 >= f11) {
                i5++;
            }
        }
        return i5;
    }

    public g(int i5) {
        this.f48614c = new float[i5];
    }
}
