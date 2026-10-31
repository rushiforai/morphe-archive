package com.google.android.gms.ads.identifier;

import android.net.Uri;
import android.util.Log;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

/* loaded from: classes3.dex */
public final class a extends Thread {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ HashMap f31691a;

    public a(AdvertisingIdClient advertisingIdClient, HashMap map) {
        this.f31691a = map;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() {
        Uri.Builder builderBuildUpon = Uri.parse("https://pagead2.googlesyndication.com/pagead/gen_204?id=gmob-apps").buildUpon();
        HashMap map = this.f31691a;
        for (String str : map.keySet()) {
            builderBuildUpon.appendQueryParameter(str, (String) map.get(str));
        }
        String string = builderBuildUpon.build().toString();
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(string).openConnection();
            try {
                int responseCode = httpURLConnection.getResponseCode();
                if (responseCode < 200 || responseCode >= 300) {
                    StringBuilder sb2 = new StringBuilder(String.valueOf(responseCode).length() + 54 + String.valueOf(string).length());
                    sb2.append("Received non-success response code ");
                    sb2.append(responseCode);
                    sb2.append(" from pinging URL: ");
                    sb2.append(string);
                    Log.w("HttpUrlPinger", sb2.toString());
                }
            } finally {
                httpURLConnection.disconnect();
            }
        } catch (IOException e3) {
            e = e3;
            String message = e.getMessage();
            StringBuilder sb3 = new StringBuilder(String.valueOf(message).length() + String.valueOf(string).length() + 27);
            sb3.append("Error while pinging URL: ");
            sb3.append(string);
            sb3.append(". ");
            sb3.append(message);
            Log.w("HttpUrlPinger", sb3.toString(), e);
        } catch (IndexOutOfBoundsException e11) {
            String message2 = e11.getMessage();
            StringBuilder sb4 = new StringBuilder(String.valueOf(message2).length() + String.valueOf(string).length() + 32);
            sb4.append("Error while parsing ping URL: ");
            sb4.append(string);
            sb4.append(". ");
            sb4.append(message2);
            Log.w("HttpUrlPinger", sb4.toString(), e11);
        } catch (RuntimeException e12) {
            e = e12;
            String message3 = e.getMessage();
            StringBuilder sb32 = new StringBuilder(String.valueOf(message3).length() + String.valueOf(string).length() + 27);
            sb32.append("Error while pinging URL: ");
            sb32.append(string);
            sb32.append(". ");
            sb32.append(message3);
            Log.w("HttpUrlPinger", sb32.toString(), e);
        } catch (Throwable th2) {
            throw th2;
        }
    }
}
