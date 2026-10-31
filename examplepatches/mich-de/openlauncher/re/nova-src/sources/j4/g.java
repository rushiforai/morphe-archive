package j4;

import java.util.Arrays;

/* loaded from: classes2.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public int[] f68958a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f68959b;

    /* renamed from: c, reason: collision with root package name */
    public int f68960c;

    /* renamed from: d, reason: collision with root package name */
    public int[] f68961d;

    /* renamed from: e, reason: collision with root package name */
    public float[] f68962e;

    /* renamed from: f, reason: collision with root package name */
    public int f68963f;

    /* renamed from: g, reason: collision with root package name */
    public int[] f68964g;

    /* renamed from: h, reason: collision with root package name */
    public String[] f68965h;

    /* renamed from: i, reason: collision with root package name */
    public int f68966i;

    /* renamed from: j, reason: collision with root package name */
    public int[] f68967j;

    /* renamed from: k, reason: collision with root package name */
    public boolean[] f68968k;

    /* renamed from: l, reason: collision with root package name */
    public int f68969l;

    public final void a(float f11, int i5) {
        int i11 = this.f68963f;
        int[] iArr = this.f68961d;
        if (i11 >= iArr.length) {
            this.f68961d = Arrays.copyOf(iArr, iArr.length * 2);
            float[] fArr = this.f68962e;
            this.f68962e = Arrays.copyOf(fArr, fArr.length * 2);
        }
        int[] iArr2 = this.f68961d;
        int i12 = this.f68963f;
        iArr2[i12] = i5;
        float[] fArr2 = this.f68962e;
        this.f68963f = i12 + 1;
        fArr2[i12] = f11;
    }

    public final void b(int i5, int i11) {
        int i12 = this.f68960c;
        int[] iArr = this.f68958a;
        if (i12 >= iArr.length) {
            this.f68958a = Arrays.copyOf(iArr, iArr.length * 2);
            int[] iArr2 = this.f68959b;
            this.f68959b = Arrays.copyOf(iArr2, iArr2.length * 2);
        }
        int[] iArr3 = this.f68958a;
        int i13 = this.f68960c;
        iArr3[i13] = i5;
        int[] iArr4 = this.f68959b;
        this.f68960c = i13 + 1;
        iArr4[i13] = i11;
    }

    public final void c(int i5, String str) {
        int i11 = this.f68966i;
        int[] iArr = this.f68964g;
        if (i11 >= iArr.length) {
            this.f68964g = Arrays.copyOf(iArr, iArr.length * 2);
            String[] strArr = this.f68965h;
            this.f68965h = (String[]) Arrays.copyOf(strArr, strArr.length * 2);
        }
        int[] iArr2 = this.f68964g;
        int i12 = this.f68966i;
        iArr2[i12] = i5;
        String[] strArr2 = this.f68965h;
        this.f68966i = i12 + 1;
        strArr2[i12] = str;
    }

    public final void d(int i5, boolean z11) {
        int i11 = this.f68969l;
        int[] iArr = this.f68967j;
        if (i11 >= iArr.length) {
            this.f68967j = Arrays.copyOf(iArr, iArr.length * 2);
            boolean[] zArr = this.f68968k;
            this.f68968k = Arrays.copyOf(zArr, zArr.length * 2);
        }
        int[] iArr2 = this.f68967j;
        int i12 = this.f68969l;
        iArr2[i12] = i5;
        boolean[] zArr2 = this.f68968k;
        this.f68969l = i12 + 1;
        zArr2[i12] = z11;
    }
}
