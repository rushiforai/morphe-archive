package com.fyber.inneractive.sdk.protobuf;

import java.nio.charset.Charset;

/* loaded from: classes.dex */
public final class x1 {

    /* renamed from: b, reason: collision with root package name */
    public static final v1 f30950b = new v1();

    /* renamed from: a, reason: collision with root package name */
    public final b2 f30951a;

    public x1() {
        b2 b2Var;
        try {
            b2Var = (b2) Class.forName("com.google.protobuf.DescriptorMessageInfoFactory").getDeclaredMethod("getInstance", null).invoke(null, null);
        } catch (Exception unused) {
            b2Var = f30950b;
        }
        w1 w1Var = new w1(r0.f30882a, b2Var);
        Charset charset = l1.f30847a;
        this.f30951a = w1Var;
    }
}
