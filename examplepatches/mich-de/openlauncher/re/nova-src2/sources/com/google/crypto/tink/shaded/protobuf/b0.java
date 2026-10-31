package com.google.crypto.tink.shaded.protobuf;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;

/* loaded from: classes.dex */
public abstract class b0 {

    /* renamed from: a, reason: collision with root package name */
    public static final Charset f34575a;

    /* renamed from: b, reason: collision with root package name */
    public static final byte[] f34576b;

    static {
        Charset.forName("US-ASCII");
        f34575a = Charset.forName("UTF-8");
        Charset.forName("ISO-8859-1");
        byte[] bArr = new byte[0];
        f34576b = bArr;
        ByteBuffer.wrap(bArr);
        try {
            new j(bArr, 0, 0, false).D(0);
        } catch (InvalidProtocolBufferException e3) {
            throw new IllegalArgumentException(e3);
        }
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
