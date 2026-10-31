package com.google.android.gms.internal.consent_sdk;

import android.util.Log;
import android.webkit.WebSettings;
import com.amplitude.core.Configuration;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Queue;
import java.util.Scanner;
import java.util.concurrent.atomic.AtomicReference;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final /* synthetic */ class j implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32111a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f32112b;

    public /* synthetic */ j(Object obj, int i5) {
        this.f32111a = i5;
        this.f32112b = obj;
    }

    @Override // java.lang.Runnable
    public final void run() throws IOException {
        int i5 = this.f32111a;
        Object obj = this.f32112b;
        switch (i5) {
            case 0:
                ((m) obj).c(new zzg(4, "Web view timed out."));
                break;
            case 1:
                ((p) obj).a();
                break;
            case 2:
                d0 d0Var = (d0) obj;
                AtomicReference atomicReference = d0Var.f32045k;
                String str = (String) d0Var.f32035a.get();
                if (str == null) {
                    Log.w("UserMessagingPlatform", "Metrics reporting URL is not set yet.");
                    break;
                } else {
                    int size = ((Queue) atomicReference.get()).size();
                    for (int i11 = 0; i11 < size; i11++) {
                        v2 v2Var = (v2) ((Queue) atomicReference.get()).poll();
                        if (v2Var != null) {
                            try {
                                HttpURLConnection httpURLConnection = (HttpURLConnection) new URI(str).toURL().openConnection();
                                httpURLConnection.setRequestProperty("User-Agent", WebSettings.getDefaultUserAgent(d0Var.f32036b));
                                httpURLConnection.setConnectTimeout(10000);
                                httpURLConnection.setReadTimeout(Configuration.FLUSH_INTERVAL_MILLIS);
                                httpURLConnection.setDoOutput(true);
                                httpURLConnection.setRequestMethod("POST");
                                httpURLConnection.setRequestProperty("Content-Type", "application/protobuf");
                                OutputStream outputStream = httpURLConnection.getOutputStream();
                                int iC = v2Var.c();
                                Logger logger = o5.f32197i;
                                if (iC > 4096) {
                                    iC = 4096;
                                }
                                o5 o5Var = new o5(outputStream, iC);
                                v2Var.a(o5Var);
                                if (o5Var.f32202g > 0) {
                                    o5Var.Y();
                                }
                                int responseCode = httpURLConnection.getResponseCode();
                                if (responseCode != 200 && responseCode != 204) {
                                    Log.w("UserMessagingPlatform", "Fail to ping metrics reporting URL: Http error code - " + responseCode + ".\n" + (httpURLConnection.getErrorStream() != null ? new Scanner(httpURLConnection.getErrorStream()).useDelimiter("\\A").next() : null));
                                    ((Queue) atomicReference.get()).add(v2Var);
                                }
                            } catch (IOException e3) {
                                Log.w("UserMessagingPlatform", "Fail to ping metrics reporting URL: ".concat(String.valueOf(e3.getMessage())));
                                ((Queue) atomicReference.get()).add(v2Var);
                            } catch (URISyntaxException e11) {
                                Log.w("UserMessagingPlatform", "Metrics reporting URL " + str + " is not valid: " + e11.getMessage());
                            }
                        }
                    }
                    break;
                }
                break;
            default:
                ((uk.b) obj).a();
                break;
        }
    }
}
