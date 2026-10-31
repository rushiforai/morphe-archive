package com.fyber.inneractive.sdk.click;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.h0;
import java.net.URISyntaxException;
import java.util.List;

/* loaded from: classes3.dex */
public final class h extends a {

    /* renamed from: a, reason: collision with root package name */
    public boolean f27715a = false;

    @Override // com.fyber.inneractive.sdk.click.a
    public final boolean a(Uri uri, r rVar) {
        return "intent".equalsIgnoreCase(uri.getScheme()) && !this.f27715a;
    }

    @Override // com.fyber.inneractive.sdk.click.a
    public final b a(Context context, Uri uri, List list) throws URISyntaxException {
        if (a(uri, (r) null)) {
            try {
                Intent uri2 = Intent.parseUri(uri.toString(), 1);
                if (!this.f27715a && h0.a(context, uri2)) {
                    int i5 = IAlog.f31163a;
                    IAlog.d("%s %s", "DEEPLINK", uri.toString());
                    if (list != null) {
                        list.add(new j(uri.toString(), true, q.OPEN_IN_EXTERNAL_APPLICATION, null));
                    }
                    return new b(uri.toString(), a.a(uri, q.OPEN_IN_EXTERNAL_APPLICATION), "IntentScheme", null);
                }
                String stringExtra = uri2.getStringExtra("browser_fallback_url");
                if (this.f27715a || TextUtils.isEmpty(stringExtra)) {
                    if (list != null) {
                        list.add(new j(uri.toString(), false, q.OPEN_IN_EXTERNAL_APPLICATION, "tryToOpenExternalApp has failed (intent scheme)"));
                    }
                    return r.a(uri.toString(), "IntentScheme", "tryToOpenExternalApp has failed (intent scheme)");
                }
                try {
                    Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(stringExtra));
                    if (!(context instanceof Activity)) {
                        intent.setFlags(268435456);
                    }
                    context.startActivity(intent);
                    IAlog.d("%s %s", "Intent opened successfully, url:", stringExtra);
                    if (list != null) {
                        list.add(new j(uri.toString(), false, q.DEEP_LINK, null));
                        list.add(new j(stringExtra, true, q.OPEN_IN_EXTERNAL_APPLICATION, null));
                    }
                    return new b(uri.toString(), a.a(uri, q.OPEN_IN_EXTERNAL_APPLICATION), "IntentScheme", null);
                } catch (Throwable unused) {
                    IAlog.d("%s %s", "Intent failed, url:", stringExtra);
                }
            } catch (URISyntaxException e3) {
                IAlog.a("failed parsing uri with error: %s", e3.getLocalizedMessage());
                if (list != null) {
                    list.add(new j(uri.toString(), false, q.OPEN_IN_EXTERNAL_APPLICATION, null));
                }
                return new b(uri.toString(), q.FAILED, "IntentScheme", e3);
            }
        }
        return null;
    }

    @Override // com.fyber.inneractive.sdk.click.a
    public final void a() {
        this.f27715a = true;
    }
}
