package ma0;

import java.util.NoSuchElementException;

/* loaded from: classes5.dex */
public final class c implements b, se.d {

    /* renamed from: a, reason: collision with root package name */
    public int f76181a;

    /* renamed from: b, reason: collision with root package name */
    public int f76182b;

    /* renamed from: c, reason: collision with root package name */
    public int f76183c;

    /* renamed from: d, reason: collision with root package name */
    public int f76184d;

    /* renamed from: e, reason: collision with root package name */
    public Object f76185e;

    public c() {
        this.f76181a = 0;
        this.f76182b = -1;
        this.f76183c = 0;
        this.f76185e = new int[16];
        this.f76184d = r0.length - 1;
    }

    @Override // se.d
    public int a() {
        com.google.android.gms.internal.consent_sdk.a aVar = (com.google.android.gms.internal.consent_sdk.a) this.f76185e;
        int i5 = this.f76182b;
        if (i5 == 8) {
            return aVar.N();
        }
        if (i5 == 16) {
            return aVar.S();
        }
        int i11 = this.f76183c;
        this.f76183c = i11 + 1;
        if (i11 % 2 != 0) {
            return this.f76184d & 15;
        }
        int iN = aVar.N();
        this.f76184d = iN;
        return (iN & 240) >> 4;
    }

    @Override // se.d
    public int b() {
        return -1;
    }

    public void c(int i5) {
        int i11 = this.f76183c;
        int[] iArr = (int[]) this.f76185e;
        if (i11 == iArr.length) {
            int length = iArr.length << 1;
            if (length < 0) {
                throw new IllegalStateException();
            }
            int[] iArr2 = new int[length];
            int length2 = iArr.length;
            int i12 = this.f76181a;
            int i13 = length2 - i12;
            System.arraycopy(iArr, i12, iArr2, 0, i13);
            System.arraycopy((int[]) this.f76185e, 0, iArr2, i13, i12);
            this.f76181a = 0;
            this.f76182b = this.f76183c - 1;
            this.f76185e = iArr2;
            this.f76184d = length - 1;
        }
        int i14 = (this.f76182b + 1) & this.f76184d;
        this.f76182b = i14;
        ((int[]) this.f76185e)[i14] = i5;
        this.f76183c++;
    }

    public int d() {
        int i5 = this.f76183c;
        if (i5 == 0) {
            throw new NoSuchElementException();
        }
        int[] iArr = (int[]) this.f76185e;
        int i11 = this.f76181a;
        int i12 = iArr[i11];
        this.f76181a = (i11 + 1) & this.f76184d;
        this.f76183c = i5 - 1;
        return i12;
    }

    @Override // se.d
    public int f() {
        return this.f76181a;
    }

    @Override // ma0.b
    public int seekTo(int i5) {
        int i11;
        int i12 = this.f76181a;
        d dVar = (d) this.f76185e;
        while (true) {
            i11 = this.f76184d;
            if (i11 >= i5) {
                break;
            }
            int i13 = this.f76183c;
            if (i13 + 1 >= this.f76182b) {
                break;
            }
            int i14 = i13 + 1;
            this.f76183c = i14;
            this.f76184d = dVar.f76186b.f69343b.y((i14 * 8) + i12);
        }
        if (i11 == i5) {
            return dVar.f76186b.f69343b.y((this.f76183c * 8) + i12 + 4);
        }
        return 0;
    }

    public c(d dVar, int i5, int i11) {
        this.f76185e = dVar;
        this.f76181a = i5;
        this.f76182b = i11;
        this.f76184d = dVar.f76186b.f69343b.y(i5);
        this.f76183c = 0;
    }
}
