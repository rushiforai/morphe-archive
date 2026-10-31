package com.fyber.inneractive.sdk.click;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.activities.InneractiveInternalBrowserActivity;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.flow.x;
import com.fyber.inneractive.sdk.network.h1;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.h0;
import com.fyber.inneractive.sdk.util.v;
import com.fyber.inneractive.sdk.util.z0;
import com.fyber.inneractive.sdk.web.v0;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final z0 f27730a;

    /* renamed from: b, reason: collision with root package name */
    public Context f27731b;

    /* renamed from: c, reason: collision with root package name */
    public String f27732c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f27733d;

    /* renamed from: e, reason: collision with root package name */
    public o f27734e;

    /* renamed from: i, reason: collision with root package name */
    public h1 f27738i;

    /* renamed from: k, reason: collision with root package name */
    public v0 f27740k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f27741l;

    /* renamed from: m, reason: collision with root package name */
    public com.fyber.inneractive.sdk.ignite.m f27742m;

    /* renamed from: f, reason: collision with root package name */
    public volatile boolean f27735f = false;

    /* renamed from: h, reason: collision with root package name */
    public long f27737h = 0;

    /* renamed from: j, reason: collision with root package name */
    public final ArrayList f27739j = new ArrayList();

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f27736g = new ArrayList();
    public final boolean n = IAConfigManager.Q.f27761u.f27936b.a(false, "should_decode_url");

    public r(boolean z11, x xVar) {
        this.f27733d = true;
        this.f27733d = z11;
        this.f27730a = new z0(xVar);
    }

    public final void a(Context context, String str, o oVar, v0 v0Var, boolean z11, com.fyber.inneractive.sdk.ignite.m mVar, String str2) {
        Uri uri;
        this.f27731b = context;
        this.f27732c = str;
        this.f27734e = oVar;
        this.f27741l = z11;
        this.f27737h = System.currentTimeMillis();
        this.f27740k = v0Var;
        this.f27742m = mVar;
        b bVarA = a(this.f27732c);
        IAlog.d("%s EVENT_CLICK %s %s", "VAST_EVENT", bVarA, str);
        if (bVarA == null) {
            String str3 = this.f27732c;
            try {
                try {
                    uri = this.n ? !h0.c(str3) ? Uri.parse(URLDecoder.decode(str3, "utf-8")) : Uri.parse(str3) : h0.c(str3) ? Uri.parse(URLDecoder.decode(str3, "utf-8")) : Uri.parse(str3);
                } catch (Exception unused) {
                    IAlog.a("%sgetDecodedUri: Failed parsing Uri!", "SuperClickHandler");
                    uri = null;
                }
                if (a(uri)) {
                    IAlog.a("%sfollowRedirects: Fetching uri: %s", IAlog.a(this), uri.toString());
                    String string = uri.toString();
                    h1 h1Var = new h1(new m(this, string, str2), string);
                    this.f27738i = h1Var;
                    IAConfigManager.Q.f27759s.a(h1Var);
                }
            } catch (Exception e3) {
                if (e3 instanceof InterruptedException) {
                    return;
                }
                IAlog.b("%sfailed followRedirects %s", IAlog.a(this), e3);
                this.f27736g.add(new j(str3, false, q.INTERNAL_REDIRECT, null));
                a(new b(str3, q.FAILED, "followRedirects", e3));
            }
        }
    }

    public final b a(String str) {
        Uri uri;
        z0 z0Var;
        boolean z11;
        try {
            uri = Uri.parse(str);
        } catch (Exception unused) {
            IAlog.a("IAJavaUtil: getValidUri: Invalid url %s", str);
            uri = null;
        }
        if (uri == null) {
            this.f27736g.add(new j(str, false, null, "illegal uri"));
            return a(a(str, null, "illegal uri"));
        }
        if (this.f27739j.isEmpty()) {
            this.f27736g.add(new j(str, false, null, "no click handlers found"));
            return a(a(str, null, "no click handlers found"));
        }
        Iterator it = this.f27739j.iterator();
        while (it.hasNext()) {
            a aVar = (a) it.next();
            if (aVar.a(uri, this)) {
                Context context = this.f27731b;
                b bVarA = context != null ? aVar.a(context, uri, this.f27736g) : null;
                if (bVarA != null) {
                    if (bVarA.f27697a == q.OPEN_GOOGLE_STORE && !(z11 = (z0Var = this.f27730a).f31257c) && !z11) {
                        z0Var.f31257c = true;
                        z0Var.f31256b = System.currentTimeMillis();
                        com.fyber.inneractive.sdk.config.e eVar = IAConfigManager.Q.f27764x.f27771b;
                        if (eVar != null) {
                            eVar.f27791a.add(z0Var);
                        }
                    }
                    return a(bVarA);
                }
            }
        }
        return null;
    }

    public final boolean a(Uri uri) {
        if (uri == null) {
            IAlog.a("%s followRedirects: Got a url which is not valid: null", IAlog.a(this));
            this.f27736g.add(new j(null, false, null, "Invalid url"));
            a(a(uri.toString(), "followRedirects", "Invalid url"));
            return false;
        }
        String scheme = uri.getScheme();
        if (scheme != null && (scheme.equalsIgnoreCase("http") || scheme.equalsIgnoreCase("https"))) {
            return true;
        }
        IAlog.a("%scould not follow redirects for scheme: %s", IAlog.a(this), uri.getScheme());
        IAlog.a("%sfull url: %s", IAlog.a(this), uri.toString());
        this.f27736g.add(new j(uri.toString(), false, null, "Invalid scheme: " + uri.getScheme()));
        a(a(uri.toString(), "followRedirects", "Invalid scheme: " + uri.getScheme()));
        return false;
    }

    public static void a(r rVar, String str, String str2, String str3, Exception exc) {
        if (rVar.f27733d) {
            Intent intent = new Intent(rVar.f27731b, (Class<?>) InneractiveInternalBrowserActivity.class);
            if (!TextUtils.isEmpty(str)) {
                InneractiveInternalBrowserActivity.setHtmlExtra(str);
            }
            intent.putExtra("extra_url", str2);
            intent.putExtra("spotId", str3);
            if (!(rVar.f27731b instanceof Activity)) {
                intent.setFlags(268435456);
            }
            try {
                Context context = rVar.f27731b;
                if (context != null) {
                    context.startActivity(intent);
                }
                ArrayList arrayList = rVar.f27736g;
                boolean z11 = exc == null;
                q qVar = q.OPENED_IN_INTERNAL_BROWSER;
                arrayList.add(new j(str2, z11, qVar, v.a(exc)));
                rVar.a(new b(str2, qVar, "followRedirects", null));
                return;
            } catch (ActivityNotFoundException unused) {
                rVar.f27736g.add(new j(str2, false, q.OPENED_IN_INTERNAL_BROWSER, "internal browser not registered"));
                rVar.a(a(str2, "followRedirects", "internal browser not registered"));
                return;
            }
        }
        rVar.f27736g.add(new j(str2, false, q.OPENED_IN_INTERNAL_BROWSER, "internal browser not usable"));
        rVar.a(a(str2, "followRedirects", "internal browser not usable"));
    }

    public static b a(String str, String str2, String str3) {
        return new b(str, q.FAILED, str2, new p(str3));
    }

    public final b a(b bVar) {
        ArrayList arrayList = this.f27736g;
        bVar.f27702f.clear();
        bVar.f27702f.addAll(arrayList);
        bVar.f27701e = System.currentTimeMillis() - this.f27737h;
        IAlog.a("%s reporting result: %s", IAlog.a(this), bVar);
        com.fyber.inneractive.sdk.util.r.f31216b.post(new n(this, bVar));
        return bVar;
    }
}
