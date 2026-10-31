package com.bytedance.sdk.component.zb.ycx.ycx.ycx;

import com.bytedance.sdk.component.zb.ycx.syc;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;

/* loaded from: classes2.dex */
public class jw extends syc {
    InputStream sya;
    HttpURLConnection ycx;

    /* renamed from: zb, reason: collision with root package name */
    InputStream f24213zb;

    public jw(HttpURLConnection httpURLConnection) throws IOException {
        this.ycx = httpURLConnection;
        InputStream inputStream = httpURLConnection.getInputStream();
        this.sya = inputStream;
        this.f24213zb = new ul(inputStream, httpURLConnection);
    }

    @Override // com.bytedance.sdk.component.zb.ycx.syc, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        try {
            this.f24213zb.close();
            this.ycx.disconnect();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5pwaveciOWdJ/gxW5", "WOIihgY=", 63);
        }
    }

    @Override // com.bytedance.sdk.component.zb.ycx.syc
    public byte[] dj() throws IOException {
        try {
            if (this.sya == null) {
                return new byte[0];
            }
            byte[] bArr = new byte[1024];
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            while (true) {
                int i5 = this.f24213zb.read(bArr);
                if (i5 == -1) {
                    return byteArrayOutputStream.toByteArray();
                }
                byteArrayOutputStream.write(bArr, 0, i5);
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5pwaveciOWdJ/gxW5", "Wfc5kBA=", 86);
            return new byte[0];
        }
    }

    @Override // com.bytedance.sdk.component.zb.ycx.syc
    public String lt() {
        return this.ycx.getContentEncoding();
    }

    @Override // com.bytedance.sdk.component.zb.ycx.syc
    public com.bytedance.sdk.component.zb.ycx.jw lud() {
        if (this.ycx.getContentType() != null) {
            return com.bytedance.sdk.component.zb.ycx.jw.ycx(this.ycx.getContentType());
        }
        return null;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.syc
    public InputStream sya() {
        return this.f24213zb;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.syc
    public long ycx() {
        try {
            return this.ycx.getContentLength();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5pwaveciOWdJ/gxW5", "WOEjgQayfeuFRNBJhA==", 35);
            return 0L;
        }
    }

    @Override // com.bytedance.sdk.component.zb.ycx.syc
    public String zb() throws IOException {
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(this.f24213zb));
            StringBuffer stringBuffer = new StringBuffer();
            while (true) {
                String line = bufferedReader.readLine();
                if (line == null) {
                    String string = stringBuffer.toString();
                    close();
                    return string;
                }
                stringBuffer.append(line + "\n");
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5pwaveciOWdJ/gxW5", "SPo/nA27", 53);
            return b.f42142b;
        }
    }

    public jw(HttpURLConnection httpURLConnection, InputStream inputStream) {
        this.ycx = httpURLConnection;
        this.sya = inputStream;
        this.f24213zb = new ul(inputStream, httpURLConnection);
    }
}
