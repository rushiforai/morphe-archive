package com.google.protobuf;

import java.nio.charset.Charset;

/* loaded from: classes.dex */
public final class h1 {

    /* renamed from: b, reason: collision with root package name */
    public static final e0 f34870b = new e0(1);

    /* renamed from: a, reason: collision with root package name */
    public final Object f34871a;

    public h1(t tVar) {
        a1.a(tVar, "output");
        this.f34871a = tVar;
        tVar.f34972a = this;
    }

    public void a(int i5, Object obj, b2 b2Var) {
        t tVar = (t) this.f34871a;
        tVar.b0(i5, 3);
        b2Var.e((o1) obj, tVar.f34972a);
        tVar.b0(i5, 4);
    }

    public h1() {
        m1 m1Var;
        x1 x1Var = x1.f35001c;
        try {
            m1Var = (m1) Class.forName("com.google.protobuf.DescriptorMessageInfoFactory").getDeclaredMethod("getInstance", null).invoke(null, null);
        } catch (Exception unused) {
            m1Var = f34870b;
        }
        m1[] m1VarArr = {e0.f34845b, m1Var};
        g1 g1Var = new g1();
        g1Var.f34860a = m1VarArr;
        Charset charset = a1.f34808a;
        this.f34871a = g1Var;
    }
}
