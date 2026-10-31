package com.fyber.inneractive.sdk.click;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.activities.InneractiveInternalBrowserActivity;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.d0;
import com.fyber.inneractive.sdk.util.e0;
import com.fyber.inneractive.sdk.util.f0;
import com.fyber.inneractive.sdk.util.g0;
import com.fyber.inneractive.sdk.util.h0;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.List;

/* loaded from: classes3.dex */
public final class i extends a {

    /* renamed from: a, reason: collision with root package name */
    public final String f27716a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f27717b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f27718c = false;

    public i(boolean z11, String str) {
        this.f27716a = str;
        this.f27717b = z11;
    }

    @Override // com.fyber.inneractive.sdk.click.a
    public final boolean a(Uri uri, r rVar) {
        if (this.f27718c) {
            return false;
        }
        return "fybernativebrowser".equalsIgnoreCase(uri.getScheme()) || "fybernativebrowser".equalsIgnoreCase(this.f27716a) || this.f27717b || uri.toString().contains("FYBER_OPEN_BROWSER");
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0032  */
    @Override // com.fyber.inneractive.sdk.click.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final b a(Context context, Uri uri, List list) {
        String queryParameter;
        d0 d0Var;
        String string = uri.toString();
        if (!TextUtils.isEmpty(string)) {
            Uri uri2 = Uri.parse(string);
            String scheme = uri2.getScheme();
            String host = uri2.getHost();
            queryParameter = (scheme == null || !scheme.equals("fybernativebrowser") || host == null || !host.equals("navigate")) ? null : uri2.getQueryParameter(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
        }
        if (queryParameter != null) {
            try {
                uri = Uri.parse(queryParameter);
            } catch (Exception unused) {
                IAlog.a("IAJavaUtil: getValidUri: Invalid url %s", queryParameter);
                uri = null;
            }
            string = queryParameter;
        }
        if (this.f27718c) {
            return r.a(uri.toString(), null, "The process was cancelled");
        }
        f0 f0Var = f0.OPEN_EVERYTHING;
        try {
            context.getClass();
        } catch (Throwable unused2) {
        }
        try {
            IAlog.a("IAJavaUtil - valid url found: '%s' opening browser", string);
            try {
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(string));
                if (!(context instanceof Activity)) {
                    intent.setFlags(268435456);
                }
                context.startActivity(intent);
                d0Var = new d0(g0.OPEN_IN_EXTERNAL_BROWSER, null);
            } catch (ActivityNotFoundException unused3) {
                if (h0.a(context, string)) {
                    d0Var = new d0(g0.OPENED_USING_CHROME_NAVIGATE, null);
                } else {
                    d0Var = new d0(g0.FAILED, new e0("tryOpeningChromeGracefully has failed and couldn't open the url"));
                }
            } catch (Throwable unused4) {
                if (!h0.d(string) && !h0.c(string) && f0Var != f0.DO_NOT_OPEN_IN_INTERNAL_BROWSER) {
                    Intent intent2 = new Intent(context, (Class<?>) InneractiveInternalBrowserActivity.class);
                    intent2.putExtra("extra_url", string);
                    intent2.putExtra("spotId", (String) null);
                    if (!(context instanceof Activity)) {
                        intent2.setFlags(268435456);
                    }
                    context.startActivity(intent2);
                    d0Var = new d0(g0.OPENED_IN_INTERNAL_BROWSER, null);
                } else {
                    d0Var = new d0(g0.FAILED, new e0("canOpenInExternalBrowser has decided it cant be opened and shouldUseInternalBrowser was set to true"));
                }
            }
        } catch (Throwable th2) {
            IAlog.a("IAJavaUtil - could not open a browser for url: %s", string);
            d0Var = new d0(g0.FAILED, th2);
        }
        if (list != null) {
            Throwable th3 = d0Var.f31181b;
            if (th3 != null) {
                list.add(new j(string, false, null, th3.toString()));
            } else {
                list.add(new j(string, true, a.a(uri, q.OPENED_IN_EXTERNAL_BROWSER), null));
            }
        }
        return new b(uri.toString(), a.a(uri, q.OPENED_IN_EXTERNAL_BROWSER), "FyberNativeBrowser", null);
    }

    @Override // com.fyber.inneractive.sdk.click.a
    public final void a() {
        this.f27718c = true;
    }
}
