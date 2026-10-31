package com.google.crypto.tink.shaded.protobuf;

import java.nio.charset.Charset;

/* loaded from: classes.dex */
public final class i0 {

    /* renamed from: b, reason: collision with root package name */
    public static final u f34611b = new u(1);

    /* renamed from: a, reason: collision with root package name */
    public final h0 f34612a;

    public i0() {
        m0 m0Var;
        u0 u0Var = u0.f34670c;
        try {
            m0Var = (m0) Class.forName("com.google.crypto.tink.shaded.protobuf.DescriptorMessageInfoFactory").getDeclaredMethod("getInstance", null).invoke(null, null);
        } catch (Exception unused) {
            m0Var = f34611b;
        }
        m0[] m0VarArr = {u.f34668b, m0Var};
        h0 h0Var = new h0();
        h0Var.f34606a = m0VarArr;
        Charset charset = b0.f34575a;
        this.f34612a = h0Var;
    }
}
