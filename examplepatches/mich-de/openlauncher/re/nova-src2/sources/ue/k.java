package ue;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class k {

    /* renamed from: f, reason: collision with root package name */
    public static final byte[] f90918f = {0, 0, 1};

    /* renamed from: a, reason: collision with root package name */
    public boolean f90919a;

    /* renamed from: b, reason: collision with root package name */
    public int f90920b;

    /* renamed from: c, reason: collision with root package name */
    public int f90921c;

    /* renamed from: d, reason: collision with root package name */
    public int f90922d;

    /* renamed from: e, reason: collision with root package name */
    public byte[] f90923e;

    public final void a(int i5, int i11, byte[] bArr) {
        if (this.f90919a) {
            int i12 = i11 - i5;
            byte[] bArr2 = this.f90923e;
            int length = bArr2.length;
            int i13 = this.f90921c + i12;
            if (length < i13) {
                this.f90923e = Arrays.copyOf(bArr2, i13 * 2);
            }
            System.arraycopy(bArr, i5, this.f90923e, this.f90921c, i12);
            this.f90921c += i12;
        }
    }
}
