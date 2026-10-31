package com.fyber.inneractive.sdk.protobuf;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;

/* loaded from: classes.dex */
public abstract class l1 {

    /* renamed from: a, reason: collision with root package name */
    public static final Charset f30847a = Charset.forName("UTF-8");

    /* renamed from: b, reason: collision with root package name */
    public static final byte[] f30848b;

    static {
        Charset.forName("ISO-8859-1");
        byte[] bArr = new byte[0];
        f30848b = bArr;
        ByteBuffer.wrap(bArr);
    }

    public static String a(byte[] bArr) {
        return new String(bArr, f30847a);
    }

    public static z0 a(Object obj, Object obj2) {
        d2 d2Var = (d2) obj2;
        t0 t0Var = (t0) ((d2) obj).toBuilder();
        if (!t0Var.f30900a.getClass().isInstance(d2Var)) {
            throw new IllegalArgumentException("mergeFrom(MessageLite) can only merge messages of the same type.");
        }
        t0Var.c();
        t0.a(t0Var.f30901b, (z0) ((b) d2Var));
        return t0Var.b();
    }
}
