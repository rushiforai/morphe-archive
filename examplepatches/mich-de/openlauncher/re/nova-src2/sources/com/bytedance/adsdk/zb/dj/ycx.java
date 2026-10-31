package com.bytedance.adsdk.zb.dj;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;

/* loaded from: classes2.dex */
public class ycx implements dj {
    private final HttpURLConnection ycx;

    public ycx(HttpURLConnection httpURLConnection) {
        this.ycx = httpURLConnection;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        this.ycx.disconnect();
    }

    @Override // com.bytedance.adsdk.zb.dj.dj
    public String dj() {
        try {
            if (ycx()) {
                return null;
            }
            return "Unable to fetch " + this.ycx.getURL() + ". Failed with " + this.ycx.getResponseCode() + "\n" + ycx(this.ycx);
        } catch (IOException e3) {
            return e3.getMessage();
        }
    }

    @Override // com.bytedance.adsdk.zb.dj.dj
    public String sya() {
        return this.ycx.getContentType();
    }

    @Override // com.bytedance.adsdk.zb.dj.dj
    public boolean ycx() {
        try {
            return this.ycx.getResponseCode() / 100 == 2;
        } catch (IOException unused) {
            return false;
        }
    }

    @Override // com.bytedance.adsdk.zb.dj.dj
    public InputStream zb() throws IOException {
        return this.ycx.getInputStream();
    }

    private String ycx(HttpURLConnection httpURLConnection) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
        StringBuilder sb2 = new StringBuilder();
        while (true) {
            try {
                String line = bufferedReader.readLine();
                if (line != null) {
                    sb2.append(line);
                    sb2.append('\n');
                } else {
                    try {
                        break;
                    } catch (Exception unused) {
                    }
                }
            } finally {
                try {
                    bufferedReader.close();
                } catch (Exception unused2) {
                }
            }
        }
        return sb2.toString();
    }
}
