package com.pgl.ssdk;

import com.pgl.ssdk.c;
import com.pgl.ssdk.ces.out.DungeonFlag;
import java.io.ByteArrayInputStream;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.security.NoSuchAlgorithmException;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes4.dex */
public class l {
    @DungeonFlag
    private static e a(ByteBuffer byteBuffer) throws CertificateException {
        ByteBuffer byteBufferA = g.a(byteBuffer);
        byteBufferA.get(new byte[byteBufferA.remaining()]);
        byteBufferA.flip();
        byteBufferA.position(0);
        g.a(byteBufferA);
        byte[] bArrB = g.b(g.a(byteBufferA));
        try {
            Certificate certificateGenerateCertificate = CertificateFactory.getInstance("X.509").generateCertificate(new ByteArrayInputStream(bArrB));
            if (certificateGenerateCertificate instanceof X509Certificate) {
                return new e(String.valueOf(((X509Certificate) certificateGenerateCertificate).getSubjectDN()), bArrB);
            }
            return null;
        } catch (Exception unused) {
            return null;
        }
    }

    public static List<e> b(ByteBuffer byteBuffer) {
        try {
            ByteBuffer byteBufferA = g.a(byteBuffer);
            if (!byteBufferA.hasRemaining()) {
                return null;
            }
            ArrayList arrayList = new ArrayList();
            while (byteBufferA.hasRemaining()) {
                try {
                    arrayList.add(a(g.a(byteBufferA)));
                } catch (a | BufferUnderflowException unused) {
                    return null;
                } catch (NoSuchAlgorithmException | CertificateException unused2) {
                }
            }
            return arrayList;
        } catch (a unused3) {
            return null;
        }
    }

    public static List<e> a(q qVar, c.a aVar) {
        return b(g.a(qVar, aVar, 1896449818).f42364a);
    }
}
