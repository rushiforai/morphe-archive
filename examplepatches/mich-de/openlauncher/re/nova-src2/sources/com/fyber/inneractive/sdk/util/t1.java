package com.fyber.inneractive.sdk.util;

import android.content.Context;
import android.os.Handler;
import android.text.TextUtils;
import android.webkit.WebSettings;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes.dex */
public final class t1 {

    /* renamed from: a, reason: collision with root package name */
    public final AtomicBoolean f31228a = new AtomicBoolean(true);

    /* renamed from: b, reason: collision with root package name */
    public volatile String f31229b = null;

    /* renamed from: c, reason: collision with root package name */
    public Context f31230c = null;

    /* renamed from: d, reason: collision with root package name */
    public final AtomicBoolean f31231d = new AtomicBoolean(false);

    /* renamed from: e, reason: collision with root package name */
    public final q1 f31232e = new q1(this);

    public final String a() {
        if (!TextUtils.isEmpty(this.f31229b)) {
            return this.f31229b;
        }
        if (this.f31232e != null && this.f31228a.get()) {
            Handler handler = r.f31216b;
            handler.removeCallbacks(this.f31232e);
            handler.postDelayed(this.f31232e, 50L);
        }
        return System.getProperty("http.agent");
    }

    public final void b() {
        if (this.f31230c == null || !TextUtils.isEmpty(this.f31229b)) {
            return;
        }
        this.f31229b = this.f31230c.getSharedPreferences("fyber.ua", 0).getString("ua", null);
        if (!TextUtils.isEmpty(this.f31229b)) {
            IAlog.a("UserAgentProvider | populated user agent from shared prefs", new Object[0]);
            this.f31231d.compareAndSet(false, true);
        }
        r.f31215a.execute(new s1(this));
    }

    public final void c() {
        String defaultUserAgent;
        Context context = this.f31230c;
        if (context != null) {
            try {
                defaultUserAgent = WebSettings.getDefaultUserAgent(context);
            } catch (Throwable unused) {
                this.f31228a.set(false);
                defaultUserAgent = null;
            }
            if (TextUtils.isEmpty(defaultUserAgent)) {
                return;
            }
            this.f31229b = defaultUserAgent;
            if (!TextUtils.isEmpty(this.f31229b)) {
                IAlog.a("UserAgentProvider | populated user agent form updateUserAgentIfPossible", new Object[0]);
                this.f31231d.compareAndSet(false, true);
            }
            r.f31215a.execute(new r1(this, defaultUserAgent));
        }
    }
}
