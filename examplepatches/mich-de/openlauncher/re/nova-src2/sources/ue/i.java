package ue;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class i {

    /* renamed from: e, reason: collision with root package name */
    public static final byte[] f90898e = {0, 0, 1};

    /* renamed from: a, reason: collision with root package name */
    public boolean f90899a;

    /* renamed from: b, reason: collision with root package name */
    public int f90900b;

    /* renamed from: c, reason: collision with root package name */
    public int f90901c;

    /* renamed from: d, reason: collision with root package name */
    public byte[] f90902d;

    public final void a(int i5, int i11, byte[] bArr) {
        if (this.f90899a) {
            int i12 = i11 - i5;
            byte[] bArr2 = this.f90902d;
            int length = bArr2.length;
            int i13 = this.f90900b + i12;
            if (length < i13) {
                this.f90902d = Arrays.copyOf(bArr2, i13 * 2);
            }
            System.arraycopy(bArr, i5, this.f90902d, this.f90900b, i12);
            this.f90900b += i12;
        }
    }
}
