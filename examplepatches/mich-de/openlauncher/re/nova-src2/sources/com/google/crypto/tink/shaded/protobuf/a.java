package com.google.crypto.tink.shaded.protobuf;

import java.io.IOException;

/* loaded from: classes.dex */
public abstract class a implements n0 {
    protected int memoizedHashCode;

    public abstract int a(x0 x0Var);

    public final String b(String str) {
        return "Serializing " + getClass().getName() + " to a " + str + " threw an IOException (should never happen).";
    }

    public abstract v c();

    public final byte[] d() {
        try {
            byte[] bArr = new byte[((x) this).a(null)];
            m mVarN0 = m.n0(bArr);
            f(mVarN0);
            mVarN0.c0();
            return bArr;
        } catch (IOException e3) {
            throw new RuntimeException(b("byte array"), e3);
        }
    }

    public final g e() {
        try {
            int iA = ((x) this).a(null);
            g gVar = i.f34608b;
            c10.a aVar = new c10.a(iA);
            f(aVar.p());
            return aVar.m();
        } catch (IOException e3) {
            throw new RuntimeException(b("ByteString"), e3);
        }
    }

    public abstract void f(m mVar);
}
