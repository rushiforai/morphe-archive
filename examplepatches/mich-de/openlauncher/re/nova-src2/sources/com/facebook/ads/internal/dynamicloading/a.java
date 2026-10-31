package com.facebook.ads.internal.dynamicloading;

import android.content.Context;
import android.util.Log;
import com.amplitude.android.migration.DatabaseConstants;
import com.facebook.ads.AudienceNetworkAds;
import com.instabridge.ai.tools.SharedPreferencesToolRegistrationStateStore;
import com.tiktok.util.TTConst;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.UUID;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class a extends Thread {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f27504a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f27505b;

    public a(Context context, String str) {
        this.f27504a = context;
        this.f27505b = str;
    }

    /* JADX WARN: Removed duplicated region for block: B:74:0x0189 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:84:0x017f A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:96:? A[RETURN, SYNTHETIC] */
    @Override // java.lang.Thread, java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() throws IOException {
        String str;
        String str2;
        DataOutputStream dataOutputStream;
        HttpURLConnection httpURLConnection;
        InputStream inputStream;
        String string;
        DataOutputStream dataOutputStream2;
        String str3;
        String str4;
        Context context = this.f27504a;
        super.run();
        try {
            httpURLConnection = (HttpURLConnection) new URL("https://www.facebook.com/adnw_logging/").openConnection();
            try {
                httpURLConnection.setRequestMethod("POST");
                httpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
                httpURLConnection.setRequestProperty("Accept", "application/json");
                httpURLConnection.setRequestProperty("Accept-Charset", "UTF-8");
                httpURLConnection.setRequestProperty("user-agent", "[FBAN/AudienceNetworkForAndroid;FBSN/Android]");
                httpURLConnection.setDoOutput(true);
                httpURLConnection.setDoInput(true);
                httpURLConnection.connect();
                String string2 = UUID.randomUUID().toString();
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("attempt", "0");
                DexLoadErrorReporter.a(context, jSONObject, string2);
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("subtype", "generic");
                jSONObject2.put("subtype_code", "1320");
                jSONObject2.put("caught_exception", "1");
                jSONObject2.put("stacktrace", this.f27505b);
                JSONObject jSONObject3 = new JSONObject();
                jSONObject3.put("id", UUID.randomUUID().toString());
                jSONObject3.put(TTConst.TRACK_TYPE, "debug");
                StringBuilder sb2 = new StringBuilder(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                try {
                    sb2.append(System.currentTimeMillis() / 1000);
                    jSONObject3.put("session_time", sb2.toString());
                    jSONObject3.put("time", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b + (System.currentTimeMillis() / 1000));
                    jSONObject3.put(SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID, string2);
                    jSONObject3.put("data", jSONObject2);
                    jSONObject3.put("attempt", "0");
                    DexLoadErrorReporter.a(context, jSONObject2, string2);
                    JSONArray jSONArray = new JSONArray();
                    jSONArray.put(jSONObject3);
                    JSONObject jSONObject4 = new JSONObject();
                    jSONObject4.put("data", jSONObject);
                    jSONObject4.put(DatabaseConstants.EVENT_TABLE_NAME, jSONArray);
                    string = jSONObject4.toString();
                    dataOutputStream2 = new DataOutputStream(httpURLConnection.getOutputStream());
                } catch (Throwable th2) {
                    th = th2;
                    str = "Can't close connection.";
                    str2 = AudienceNetworkAds.TAG;
                    dataOutputStream = null;
                    inputStream = null;
                    try {
                        Log.e(str2, "Can't send error.", th);
                        if (dataOutputStream != null) {
                            try {
                                dataOutputStream.close();
                            } catch (Exception e3) {
                                Log.e(str2, str, e3);
                            }
                        }
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                            } catch (Exception e11) {
                                Log.e(str2, str, e11);
                            }
                        }
                        if (httpURLConnection == null) {
                            return;
                        }
                        httpURLConnection.disconnect();
                    } finally {
                    }
                }
                try {
                    dataOutputStream2.writeBytes("payload=" + URLEncoder.encode(string, "UTF-8"));
                    dataOutputStream2.flush();
                    byte[] bArr = new byte[ReaderJsonLexerKt.BATCH_SIZE];
                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                    InputStream inputStream2 = httpURLConnection.getInputStream();
                    while (true) {
                        try {
                            int i5 = inputStream2.read(bArr);
                            if (i5 == -1) {
                                break;
                            }
                            try {
                                byteArrayOutputStream.write(bArr, 0, i5);
                            } catch (Throwable th3) {
                                th = th3;
                                inputStream = inputStream2;
                                str = "Can't close connection.";
                                str2 = AudienceNetworkAds.TAG;
                                dataOutputStream = dataOutputStream2;
                                Log.e(str2, "Can't send error.", th);
                                if (dataOutputStream != null) {
                                }
                                if (inputStream != null) {
                                }
                                if (httpURLConnection == null) {
                                }
                                httpURLConnection.disconnect();
                            }
                        } catch (Throwable th4) {
                            th = th4;
                            str = "Can't close connection.";
                            str2 = AudienceNetworkAds.TAG;
                            inputStream = inputStream2;
                        }
                    }
                    byteArrayOutputStream.flush();
                    try {
                        dataOutputStream2.close();
                        str3 = "Can't close connection.";
                        str4 = AudienceNetworkAds.TAG;
                    } catch (Exception e12) {
                        str3 = "Can't close connection.";
                        str4 = AudienceNetworkAds.TAG;
                        Log.e(str4, str3, e12);
                    }
                    try {
                        inputStream2.close();
                    } catch (Exception e13) {
                        Log.e(str4, str3, e13);
                    }
                } catch (Throwable th5) {
                    th = th5;
                    str = "Can't close connection.";
                    str2 = AudienceNetworkAds.TAG;
                    dataOutputStream = dataOutputStream2;
                    inputStream = null;
                    Log.e(str2, "Can't send error.", th);
                    if (dataOutputStream != null) {
                    }
                    if (inputStream != null) {
                    }
                    if (httpURLConnection == null) {
                    }
                    httpURLConnection.disconnect();
                }
            } catch (Throwable th6) {
                th = th6;
                str = "Can't close connection.";
                str2 = AudienceNetworkAds.TAG;
            }
        } catch (Throwable th7) {
            th = th7;
            str = "Can't close connection.";
            str2 = AudienceNetworkAds.TAG;
            dataOutputStream = null;
            httpURLConnection = null;
        }
        httpURLConnection.disconnect();
    }
}
