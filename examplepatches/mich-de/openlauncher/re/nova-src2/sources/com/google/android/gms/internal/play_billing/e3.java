package com.google.android.gms.internal.play_billing;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;

/* loaded from: classes3.dex */
public abstract class e3 {

    /* renamed from: a, reason: collision with root package name */
    public static final Charset f33385a = Charset.forName("UTF-8");

    /* renamed from: b, reason: collision with root package name */
    public static final byte[] f33386b;

    static {
        Charset.forName("ISO-8859-1");
        byte[] bArr = new byte[0];
        f33386b = bArr;
        ByteBuffer.wrap(bArr);
    }

    public static int a(int i5, byte[] bArr, int i11, int i12) {
        for (int i13 = i11; i13 < i11 + i12; i13++) {
            i5 = (i5 * 31) + bArr[i13];
        }
        return i5;
    }
}
