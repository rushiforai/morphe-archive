package com.bytedance.adsdk.zb.dj;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

/* loaded from: classes2.dex */
public class zb implements lt {
    @Override // com.bytedance.adsdk.zb.dj.lt
    public dj ycx(String str) throws IOException {
        HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
        httpURLConnection.setRequestMethod("GET");
        httpURLConnection.connect();
        return new ycx(httpURLConnection);
    }
}
