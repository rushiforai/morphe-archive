package com.pgl.ssdk;

import com.pgl.ssdk.c;
import java.nio.ByteBuffer;

/* loaded from: classes4.dex */
public class g {

    /* loaded from: classes.dex */
    public static class a extends Exception {
        public a(String str) {
            super(str);
        }
    }

    public static i a(q qVar, c.a aVar, int i5) throws a {
        try {
            return h.a(qVar, aVar, i5);
        } catch (j e3) {
            throw new a(e3.getMessage());
        }
    }

    public static byte[] b(ByteBuffer byteBuffer) {
        return h.c(byteBuffer);
    }

    public static ByteBuffer a(ByteBuffer byteBuffer) {
        return h.b(byteBuffer);
    }
}
