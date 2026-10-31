package com.facebook.ads.redexgen.X;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.Proxy;

/* renamed from: com.facebook.ads.redexgen.X.ay, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public interface InterfaceC1473ay {
    boolean AEu(C1476b1 c1476b1);

    HttpURLConnection AHy(String str, Proxy proxy) throws IOException;

    InputStream AHz(HttpURLConnection httpURLConnection) throws IOException;

    OutputStream AI0(HttpURLConnection httpURLConnection) throws IOException;

    void AIJ(HttpURLConnection httpURLConnection, EnumC1481b6 enumC1481b6, String str) throws IOException;

    byte[] AIg(InputStream inputStream) throws IOException;

    void AMS(OutputStream outputStream, byte[] bArr) throws IOException;
}
