package e4;

import java.util.Arrays;

/* loaded from: classes2.dex */
public final class f implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public boolean f52155a;

    /* renamed from: e, reason: collision with root package name */
    public float f52159e;

    /* renamed from: l, reason: collision with root package name */
    public int f52166l;

    /* renamed from: b, reason: collision with root package name */
    public int f52156b = -1;

    /* renamed from: c, reason: collision with root package name */
    public int f52157c = -1;

    /* renamed from: d, reason: collision with root package name */
    public int f52158d = 0;

    /* renamed from: f, reason: collision with root package name */
    public boolean f52160f = false;

    /* renamed from: g, reason: collision with root package name */
    public final float[] f52161g = new float[9];

    /* renamed from: h, reason: collision with root package name */
    public final float[] f52162h = new float[9];

    /* renamed from: i, reason: collision with root package name */
    public b[] f52163i = new b[16];

    /* renamed from: j, reason: collision with root package name */
    public int f52164j = 0;

    /* renamed from: k, reason: collision with root package name */
    public int f52165k = 0;

    public f(int i5) {
        this.f52166l = i5;
    }

    public final void a(b bVar) {
        int i5 = 0;
        while (true) {
            int i11 = this.f52164j;
            if (i5 >= i11) {
                b[] bVarArr = this.f52163i;
                if (i11 >= bVarArr.length) {
                    this.f52163i = (b[]) Arrays.copyOf(bVarArr, bVarArr.length * 2);
                }
                b[] bVarArr2 = this.f52163i;
                int i12 = this.f52164j;
                bVarArr2[i12] = bVar;
                this.f52164j = i12 + 1;
                return;
            }
            if (this.f52163i[i5] == bVar) {
                return;
            } else {
                i5++;
            }
        }
    }

    public final void b(b bVar) {
        int i5 = this.f52164j;
        int i11 = 0;
        while (i11 < i5) {
            if (this.f52163i[i11] == bVar) {
                while (i11 < i5 - 1) {
                    b[] bVarArr = this.f52163i;
                    int i12 = i11 + 1;
                    bVarArr[i11] = bVarArr[i12];
                    i11 = i12;
                }
                this.f52164j--;
                return;
            }
            i11++;
        }
    }

    public final void c() {
        this.f52166l = 5;
        this.f52158d = 0;
        this.f52156b = -1;
        this.f52157c = -1;
        this.f52159e = 0.0f;
        this.f52160f = false;
        int i5 = this.f52164j;
        for (int i11 = 0; i11 < i5; i11++) {
            this.f52163i[i11] = null;
        }
        this.f52164j = 0;
        this.f52165k = 0;
        this.f52155a = false;
        Arrays.fill(this.f52162h, 0.0f);
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return this.f52156b - ((f) obj).f52156b;
    }

    public final void d(c cVar, float f11) {
        this.f52159e = f11;
        this.f52160f = true;
        int i5 = this.f52164j;
        this.f52157c = -1;
        for (int i11 = 0; i11 < i5; i11++) {
            this.f52163i[i11].h(cVar, this, false);
        }
        this.f52164j = 0;
    }

    public final void g(c cVar, b bVar) {
        int i5 = this.f52164j;
        for (int i11 = 0; i11 < i5; i11++) {
            this.f52163i[i11].i(cVar, bVar, false);
        }
        this.f52164j = 0;
    }

    public final String toString() {
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b + this.f52156b;
    }
}
