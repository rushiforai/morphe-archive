package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final int f29926a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f29927b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f29928c;

    /* renamed from: d, reason: collision with root package name */
    public byte[] f29929d;

    /* renamed from: e, reason: collision with root package name */
    public int f29930e;

    public r(int i5) {
        this.f29926a = i5;
        byte[] bArr = new byte[Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE];
        this.f29929d = bArr;
        bArr[2] = 1;
    }

    public final void a(byte[] bArr, int i5, int i11) {
        if (this.f29927b) {
            int i12 = i11 - i5;
            byte[] bArr2 = this.f29929d;
            int length = bArr2.length;
            int i13 = this.f29930e + i12;
            if (length < i13) {
                this.f29929d = Arrays.copyOf(bArr2, i13 * 2);
            }
            System.arraycopy(bArr, i5, this.f29929d, this.f29930e, i12);
            this.f29930e += i12;
        }
    }

    public final void b(int i5) {
        if (this.f29927b) {
            throw new IllegalStateException();
        }
        boolean z11 = i5 == this.f29926a;
        this.f29927b = z11;
        if (z11) {
            this.f29930e = 3;
            this.f29928c = false;
        }
    }

    public final boolean a(int i5) {
        if (!this.f29927b) {
            return false;
        }
        this.f29930e -= i5;
        this.f29927b = false;
        this.f29928c = true;
        return true;
    }
}
