package com.bytedance.sdk.component.lud.ycx;

import android.util.Log;
import com.bytedance.sdk.component.lud.lud;
import com.bytedance.sdk.component.utils.jc;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class ycx implements com.bytedance.sdk.component.lud.dj<sya> {
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r9v5 */
    /* JADX WARN: Type inference failed for: r9v7 */
    @Override // com.bytedance.sdk.component.lud.dj
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public sya<byte[]> ycx(lud ludVar) throws Throwable {
        Closeable closeable;
        InputStream inputStream;
        byte[] byteArray;
        ByteArrayOutputStream byteArrayOutputStream;
        String message;
        Closeable closeable2;
        HttpURLConnection httpURLConnection;
        InputStream inputStream2 = null;
        Map<String, String> mapYcx = null;
        int i5 = 0;
        try {
            try {
                httpURLConnection = (HttpURLConnection) new URL(ludVar.ycx()).openConnection();
                httpURLConnection.setRequestMethod("GET");
                httpURLConnection.setConnectTimeout(5000);
                httpURLConnection.setReadTimeout(5000);
                httpURLConnection.connect();
                inputStream = httpURLConnection.getInputStream();
            } catch (Throwable th2) {
                th = th2;
            }
            try {
                byte[] bArr = new byte[1024];
                byteArrayOutputStream = new ByteArrayOutputStream();
                while (true) {
                    try {
                        int i11 = inputStream.read(bArr);
                        if (i11 == -1) {
                            break;
                        }
                        byteArrayOutputStream.write(bArr, 0, i11);
                    } catch (MalformedURLException e3) {
                        e = e3;
                        byteArray = null;
                    } catch (IOException e11) {
                        e = e11;
                        byteArray = null;
                    }
                }
                i5 = 200;
                byteArray = byteArrayOutputStream.toByteArray();
                try {
                    mapYcx = ludVar.zb() ? ycx(httpURLConnection) : null;
                    jc.ycx(inputStream);
                    jc.ycx(byteArrayOutputStream);
                    message = "success";
                } catch (MalformedURLException e12) {
                    e = e12;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoCWBF6w=", "f+srlBawfe+UXsd+gBilJk8=", "WO8hmQ==", 69);
                    Log.w("InternalHttpClient", "MalformedURLException:" + e.getMessage());
                    message = e.getMessage();
                    closeable2 = byteArrayOutputStream;
                    jc.ycx(inputStream);
                    jc.ycx(closeable2);
                    return new sya<>(i5, byteArray, message, mapYcx);
                } catch (IOException e13) {
                    e = e13;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoCWBF6w=", "f+srlBawfe+UXsd+gBilJk8=", "WO8hmQ==", 74);
                    Log.w("InternalHttpClient", "IOException:" + e.getMessage());
                    message = e.getMessage();
                    closeable2 = byteArrayOutputStream;
                    jc.ycx(inputStream);
                    jc.ycx(closeable2);
                    return new sya<>(i5, byteArray, message, mapYcx);
                }
            } catch (MalformedURLException e14) {
                e = e14;
                byteArray = null;
                byteArrayOutputStream = byteArray;
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoCWBF6w=", "f+srlBawfe+UXsd+gBilJk8=", "WO8hmQ==", 69);
                Log.w("InternalHttpClient", "MalformedURLException:" + e.getMessage());
                message = e.getMessage();
                closeable2 = byteArrayOutputStream;
                jc.ycx(inputStream);
                jc.ycx(closeable2);
                return new sya<>(i5, byteArray, message, mapYcx);
            } catch (IOException e15) {
                e = e15;
                byteArray = null;
                byteArrayOutputStream = byteArray;
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoCWBF6w=", "f+srlBawfe+UXsd+gBilJk8=", "WO8hmQ==", 74);
                Log.w("InternalHttpClient", "IOException:" + e.getMessage());
                message = e.getMessage();
                closeable2 = byteArrayOutputStream;
                jc.ycx(inputStream);
                jc.ycx(closeable2);
                return new sya<>(i5, byteArray, message, mapYcx);
            } catch (Throwable th3) {
                th = th3;
                closeable = null;
                inputStream2 = inputStream;
                jc.ycx(inputStream2);
                jc.ycx(closeable);
                throw th;
            }
        } catch (MalformedURLException e16) {
            e = e16;
            inputStream = null;
            byteArray = null;
        } catch (IOException e17) {
            e = e17;
            inputStream = null;
            byteArray = null;
        } catch (Throwable th4) {
            th = th4;
            closeable = null;
            jc.ycx(inputStream2);
            jc.ycx(closeable);
            throw th;
        }
        return new sya<>(i5, byteArray, message, mapYcx);
    }

    private Map<String, String> ycx(HttpURLConnection httpURLConnection) {
        HashMap map = new HashMap();
        Map<String, List<String>> headerFields = httpURLConnection.getHeaderFields();
        for (String str : headerFields.keySet()) {
            List<String> list = headerFields.get(str);
            if (list != null && list.size() > 0) {
                map.put(str, list.get(0));
            }
        }
        return map;
    }
}
