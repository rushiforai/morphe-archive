package com.pgl.ssdk;

import b.c0;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* loaded from: classes4.dex */
public class d {

    public static class a {

        /* renamed from: a, reason: collision with root package name */
        private final long f42357a;

        /* renamed from: b, reason: collision with root package name */
        private final q f42358b;

        public a(long j11, q qVar) {
            this.f42357a = j11;
            this.f42358b = qVar;
        }

        public q a() {
            return this.f42358b;
        }

        public long b() {
            return this.f42357a;
        }
    }

    public static a a(q qVar, t tVar) throws b {
        long jA = tVar.a();
        long jC = tVar.c() + jA;
        long jE = tVar.e();
        if (jC != jE) {
            StringBuilder sbU = c0.u(jC, "ZIP Central Directory is not immediately followed by End of Central Directory. CD end: ", ", EoCD start: ");
            sbU.append(jE);
            throw new b(sbU.toString());
        }
        if (jA < 32) {
            throw new b("APK too small for APK Signing Block. ZIP Central Directory offset: ".concat(String.valueOf(jA)));
        }
        ByteBuffer byteBufferA = qVar.a(jA - 24, 24);
        ByteOrder byteOrder = ByteOrder.LITTLE_ENDIAN;
        byteBufferA.order(byteOrder);
        if (byteBufferA.getLong(8) != 2334950737559900225L || byteBufferA.getLong(16) != 3617552046287187010L) {
            throw new b("No APK Signing Block before ZIP Central Directory");
        }
        long j11 = byteBufferA.getLong(0);
        if (j11 < byteBufferA.capacity() || j11 > 2147483639) {
            throw new b("APK Signing Block size out of range: ".concat(String.valueOf(j11)));
        }
        long j12 = (int) (8 + j11);
        long j13 = jA - j12;
        if (j13 < 0) {
            throw new b("APK Signing Block offset out of range: ".concat(String.valueOf(j13)));
        }
        ByteBuffer byteBufferA2 = qVar.a(j13, 8);
        byteBufferA2.order(byteOrder);
        long j14 = byteBufferA2.getLong(0);
        if (j14 == j11) {
            return new a(j13, qVar.a(j13, j12));
        }
        StringBuilder sbU2 = c0.u(j14, "APK Signing Block sizes in header and footer do not match: ", " vs ");
        sbU2.append(j11);
        throw new b(sbU2.toString());
    }

    public static t a(q qVar) throws s {
        o<ByteBuffer, Long> oVarA = p.a(qVar);
        if (oVarA == null) {
            throw new s("ZIP End of Central Directory record not found");
        }
        ByteBuffer byteBufferA = oVarA.a();
        long jLongValue = oVarA.b().longValue();
        byteBufferA.order(ByteOrder.LITTLE_ENDIAN);
        long jC = p.c(byteBufferA);
        if (jC > jLongValue) {
            StringBuilder sbU = c0.u(jC, "ZIP Central Directory start offset out of range: ", ". ZIP End of Central Directory offset: ");
            sbU.append(jLongValue);
            throw new s(sbU.toString());
        }
        long jD = p.d(byteBufferA);
        long j11 = jC + jD;
        if (j11 <= jLongValue) {
            return new t(jC, jD, p.e(byteBufferA), jLongValue, byteBufferA);
        }
        StringBuilder sbU2 = c0.u(j11, "ZIP Central Directory overlaps with End of Central Directory. CD end: ", ", EoCD start: ");
        sbU2.append(jLongValue);
        throw new s(sbU2.toString());
    }
}
