package com.fyber.inneractive.sdk.util;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.tiktok.util.UrlConst;
import java.lang.ref.WeakReference;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class d1 extends Handler {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f31182a;

    public d1(Looper looper, com.fyber.inneractive.sdk.network.f fVar) {
        super(looper);
        this.f31182a = new WeakReference(fVar);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r9v20, types: [org.json.JSONObject] */
    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        String string;
        String strA;
        super.handleMessage(message);
        e1 e1Var = (e1) v.a(this.f31182a);
        if (e1Var != null) {
            com.fyber.inneractive.sdk.network.f fVar = (com.fyber.inneractive.sdk.network.f) e1Var;
            int i5 = message.what;
            if (i5 == 12312329 || i5 == 20150330) {
                if (fVar.f28714f && fVar.f28709a.size() > 0) {
                    while (true) {
                        string = null;
                        if (fVar.f28709a.size() <= 0) {
                            break;
                        }
                        try {
                            string = (JSONObject) fVar.f28709a.poll();
                        } catch (Throwable unused) {
                        }
                        if (string != null) {
                            fVar.f28710b.put(string);
                        }
                    }
                    if (fVar.f28710b.length() > 0) {
                        JSONArray jSONArray = fVar.f28710b;
                        int i11 = com.fyber.inneractive.sdk.config.n.f27870a;
                        String property = System.getProperty("ia.testEnvironmentConfiguration.name");
                        if (TextUtils.isEmpty(property)) {
                            strA = UrlConst.HTTPS + IAConfigManager.Q.f27752j.f27879f;
                        } else {
                            strA = com.fyber.inneractive.sdk.config.a.a(property, "Event");
                        }
                        long jCurrentTimeMillis = System.currentTimeMillis();
                        try {
                            string = jSONArray.toString();
                        } catch (Throwable unused2) {
                        }
                        if (string != null) {
                            IAConfigManager.Q.f27759s.a(new com.fyber.inneractive.sdk.network.x0(new com.fyber.inneractive.sdk.network.e(strA, jSONArray, jCurrentTimeMillis), strA, string));
                        }
                        fVar.f28710b = new JSONArray();
                    }
                }
                d1 d1Var = fVar.f28712d;
                if (d1Var != null) {
                    d1Var.removeMessages(12312329);
                    long j11 = fVar.f28713e * 1000;
                    d1 d1Var2 = fVar.f28712d;
                    if (d1Var2 != null) {
                        d1Var2.post(new com.fyber.inneractive.sdk.network.c(fVar, 12312329, j11));
                    }
                }
            }
        }
    }
}
