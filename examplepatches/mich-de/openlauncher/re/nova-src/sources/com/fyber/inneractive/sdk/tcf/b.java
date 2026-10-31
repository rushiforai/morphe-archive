package com.fyber.inneractive.sdk.tcf;

import android.util.Base64;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public byte[] f31113a = new byte[0];

    /* renamed from: b, reason: collision with root package name */
    public int f31114b;

    public final void a(String str) {
        if (str.trim().isEmpty()) {
            throw new IllegalArgumentException("TC string cannot be empty");
        }
        IAlog.a("%s decoding: %s", "GppTcfBitReader", str);
        this.f31114b = 0;
        byte[] bArrDecode = Base64.decode(str, 9);
        this.f31113a = bArrDecode;
        if (bArrDecode.length == 0) {
            throw new IllegalArgumentException("Invalid TC string");
        }
    }

    public final int a(int i5) {
        int i11 = 0;
        for (int i12 = 0; i12 < i5; i12++) {
            if (a()) {
                i11 |= 1 << ((i5 - 1) - i12);
            }
        }
        return i11;
    }

    public final boolean a() {
        String str;
        int i5;
        byte[] bArr = this.f31113a;
        if (bArr != null && bArr.length != 0 && (i5 = this.f31114b) < bArr.length * 8) {
            int i11 = i5 / 8;
            if (i11 >= bArr.length) {
                IAlog.a("%s readBit failed: byteIdx >= mBytes.length", "GppTcfBitReader");
                return false;
            }
            boolean z11 = (bArr[i11] & (1 << (7 - (i5 % 8)))) != 0;
            this.f31114b = i5 + 1;
            return z11;
        }
        if (bArr == null) {
            str = "mBytes == null";
        } else {
            str = bArr.length == 0 ? "mBytes.length == 0" : "mCursor >= mBytes.length * BITS_PER_BYTE";
        }
        IAlog.a("%s readBit failed: %s", "GppTcfBitReader", str);
        return false;
    }
}
