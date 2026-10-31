package com.pgl.ssdk;

import java.nio.ByteBuffer;

/* loaded from: classes4.dex */
public abstract class c {

    public static class a extends t {
        public a(long j11, long j12, int i5, long j13, ByteBuffer byteBuffer) {
            super(j11, j12, i5, j13, byteBuffer);
        }
    }

    public static a a(q qVar) throws s {
        t tVarA = d.a(qVar);
        return new a(tVarA.a(), tVarA.c(), tVarA.b(), tVarA.e(), tVarA.d());
    }
}
