package com.google.android.gms.internal.measurement;

import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public abstract class w1 {

    /* renamed from: a, reason: collision with root package name */
    public static final byte[] f33176a;

    static {
        byte[] bArr = new byte[0];
        f33176a = bArr;
        ByteBuffer.wrap(bArr);
        int i5 = 0 + 0;
        try {
            if (i5 < 0) {
                throw new zzaeh("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
            }
            if (i5 > Integer.MAX_VALUE) {
                throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
        } catch (zzaeh e3) {
            throw new IllegalArgumentException(e3);
        }
    }

    public static int a(int i5, byte[] bArr, int i11, int i12) {
        for (int i13 = i11; i13 < i11 + i12; i13++) {
            i5 = (i5 * 31) + bArr[i13];
        }
        return i5;
    }
}
