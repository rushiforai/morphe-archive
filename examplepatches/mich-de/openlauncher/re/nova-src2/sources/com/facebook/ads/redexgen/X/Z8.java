package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.Metadata;
import java.io.EOFException;
import java.io.IOException;

/* loaded from: assets/audience_network/classes.dex */
public final class Z8 {
    public static String[] A01 = {"K8c2PDUhA08QEb0fsw1E8pqH2BL6gelB", "8h5MGTSozqA7eXfqKAzoNXZ34GyFmhfQ", "nQ6TvOleVO0PQIjN6lD6dOMTYkHXOE6S", "N", "DmBHlsaTS3PuClURBzXRih9F5DY3yYcf", "Ch5RLIatCpQOwjPtL2aKENPXdGHTRdOe", "vNS3YCxzKGkEUezS4txAt4W6QdMxkbAm", "CO5nSVqfXD4UNWijMQbKcjF1H2YAgeUo"};
    public final C1084Mk A00 = new C1084Mk(10);

    public final Metadata A00(Q9 q92, InterfaceC1414a0 interfaceC1414a0) throws IOException {
        int i5 = 0;
        Metadata metadataA0S = null;
        while (true) {
            try {
                q92.AI6(this.A00.A0l(), 0, 10);
                C1084Mk c1084Mk = this.A00;
                String[] strArr = A01;
                String str = strArr[4];
                String str2 = strArr[5];
                int iCharAt = str.charAt(6);
                int peekedId3Bytes = str2.charAt(6);
                if (iCharAt != peekedId3Bytes) {
                    throw new RuntimeException();
                }
                A01[2] = "KDh0PMd98DhiQKe9MzDyGCqCr7augWx7";
                c1084Mk.A0f(0);
                if (this.A00.A0K() != 4801587) {
                    break;
                }
                this.A00.A0g(3);
                int iA0H = this.A00.A0H();
                int framesLength = iA0H + 10;
                if (metadataA0S == null) {
                    byte[] bArr = new byte[framesLength];
                    System.arraycopy(this.A00.A0l(), 0, bArr, 0, 10);
                    q92.AI6(bArr, 10, iA0H);
                    metadataA0S = new C8V(interfaceC1414a0).A0S(bArr, framesLength);
                } else {
                    q92.A4X(iA0H);
                }
                i5 += framesLength;
            } catch (EOFException unused) {
            }
        }
        q92.AK3();
        q92.A4X(i5);
        return metadataA0S;
    }
}
