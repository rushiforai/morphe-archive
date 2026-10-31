package w20;

import android.content.Context;
import android.content.SharedPreferences;
import b10.v0;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.TextStreamsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import t70.m0;
import t70.y0;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f93666a = new c();

    public static String a(int i5, String str) {
        URLConnection uRLConnectionOpenConnection = new URL(str).openConnection();
        Intrinsics.e(uRLConnectionOpenConnection, "null cannot be cast to non-null type java.net.HttpURLConnection");
        HttpURLConnection httpURLConnection = (HttpURLConnection) uRLConnectionOpenConnection;
        httpURLConnection.setInstanceFollowRedirects(false);
        httpURLConnection.setConnectTimeout(5000);
        httpURLConnection.setReadTimeout(5000);
        try {
            int responseCode = httpURLConnection.getResponseCode();
            if (301 > responseCode || responseCode >= 303) {
                if (responseCode == 200) {
                    return r70.k.u1(TextStreamsKt.b(new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream(), Charsets.f72000b), UserMetadata.MAX_INTERNAL_KEY_SIZE))).toString();
                }
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("CountryLocation");
                bVar.n("Unexpected response code: %d from %s", Integer.valueOf(responseCode), str);
                return null;
            }
            if (i5 <= 0) {
                return null;
            }
            String headerField = httpURLConnection.getHeaderField("Location");
            if (headerField == null) {
                return null;
            }
            return a(i5 - 1, headerField);
        } finally {
            httpURLConnection.disconnect();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(Context context, ContinuationImpl continuationImpl) throws Throwable {
        b bVar;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.f93657v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f93657v = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuationImpl);
            }
        }
        Object objY = bVar.f93655t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f93657v;
        if (i11 == 0) {
            ResultKt.b(objY);
            SharedPreferences sharedPreferences = context.getSharedPreferences("country_location", 0);
            Continuation continuation = null;
            String string = sharedPreferences.getString("country_code", null);
            if (string == null) {
                string = null;
                if (string == null) {
                    mc0.b bVar2 = mc0.d.f76206a;
                    bVar2.r("CountryLocation");
                    bVar2.b("Using cached country: %s", string);
                    return string;
                }
                bVar.f93657v = 1;
                a80.e eVar = y0.f88884a;
                objY = m0.y(a80.d.f488c, new v0(context, continuation, 19), bVar);
                if (objY == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (System.currentTimeMillis() - sharedPreferences.getLong("country_timestamp", 0L) >= 86400000) {
                }
                if (string == null) {
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        String str = (String) objY;
        mc0.b bVar3 = mc0.d.f76206a;
        bVar3.r("CountryLocation");
        if (Intrinsics.b(str, "KR")) {
            str = "(redacted)";
        }
        bVar3.b("Fetched country from endpoint: %s", str);
        return objY;
    }
}
