package com.fyber.inneractive.sdk.click;

import android.content.Context;
import android.net.Uri;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class a {
    public static q a(Uri uri, q qVar) {
        if (uri != null) {
            String host = uri.getHost();
            String scheme = uri.getScheme();
            if ("market".equalsIgnoreCase(scheme) || (("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme)) && ("play.google.com".equalsIgnoreCase(host) || "market.android.com".equalsIgnoreCase(host)))) {
                return q.OPEN_GOOGLE_STORE;
            }
        }
        return qVar;
    }

    public abstract b a(Context context, Uri uri, List list);

    public abstract void a();

    public abstract boolean a(Uri uri, r rVar);
}
