package ue;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final int f91044a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f91045b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f91046c;

    /* renamed from: d, reason: collision with root package name */
    public byte[] f91047d;

    /* renamed from: e, reason: collision with root package name */
    public int f91048e;

    public u(int i5) {
        this.f91044a = i5;
        byte[] bArr = new byte[Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE];
        this.f91047d = bArr;
        bArr[2] = 1;
    }

    public final void a(int i5, int i11, byte[] bArr) {
        if (this.f91045b) {
            int i12 = i11 - i5;
            byte[] bArr2 = this.f91047d;
            int length = bArr2.length;
            int i13 = this.f91048e;
            if (length < i13 + i12) {
                this.f91047d = Arrays.copyOf(bArr2, (i13 + i12) * 2);
            }
            System.arraycopy(bArr, i5, this.f91047d, this.f91048e, i12);
            this.f91048e += i12;
        }
    }

    public final boolean b(int i5) {
        if (!this.f91045b) {
            return false;
        }
        this.f91048e -= i5;
        this.f91045b = false;
        this.f91046c = true;
        return true;
    }

    public final void c() {
        this.f91045b = false;
        this.f91046c = false;
    }

    public final void d(int i5) {
        wf.a.i(!this.f91045b);
        boolean z11 = i5 == this.f91044a;
        this.f91045b = z11;
        if (z11) {
            this.f91048e = 3;
            this.f91046c = false;
        }
    }
}
