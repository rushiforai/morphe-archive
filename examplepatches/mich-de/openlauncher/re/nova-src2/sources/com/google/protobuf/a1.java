package com.google.protobuf;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;

/* loaded from: classes.dex */
public abstract class a1 {

    /* renamed from: a, reason: collision with root package name */
    public static final Charset f34808a;

    /* renamed from: b, reason: collision with root package name */
    public static final byte[] f34809b;

    static {
        Charset.forName("US-ASCII");
        f34808a = Charset.forName("UTF-8");
        Charset.forName("ISO-8859-1");
        byte[] bArr = new byte[0];
        f34809b = bArr;
        ByteBuffer.wrap(bArr);
        p.h(bArr, 0, 0, false);
    }

    public static void a(Object obj, String str) {
        if (obj == null) {
            throw new NullPointerException(str);
        }
    }

    public static int b(long j11) {
        return (int) (j11 ^ (j11 >>> 32));
    }
}
