package io.branch.search.internal;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import java.net.URISyntaxException;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class F8 {
    @SuppressLint({"UseKtx"})
    @NotNull
    public static Intent a(@NotNull String url, @NotNull String packageName, @NotNull Context context) throws URISyntaxException {
        Intrinsics.g(url, "url");
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(context, "context");
        Intent launchIntentForPackage = context.getPackageManager().getLaunchIntentForPackage(packageName);
        if (launchIntentForPackage == null) {
            Intent uri = (r70.k.K0(url, "play.google", false) || r70.k.K0(url, "market://", false)) ? Intent.parseUri(url, 1) : Intent.parseUri("https://play.google.com/store/apps/details?id=".concat(packageName), 1);
            Intrinsics.f(uri, "{\n            if (url.co…)\n            }\n        }");
            return uri;
        }
        if (r70.k.K0(url, "play.google", false) || r70.k.K0(url, "market://", false)) {
            String queryParameter = Uri.parse(url).getQueryParameter("referrer");
            List listI1 = queryParameter != null ? r70.k.i1(queryParameter, new String[]{"&"}, 6) : null;
            if (listI1 != null) {
                Iterator it = listI1.iterator();
                while (it.hasNext()) {
                    List listI12 = r70.k.i1((String) it.next(), new String[]{"="}, 6);
                    launchIntentForPackage.putExtra((String) b70.g.W0(listI12), (String) b70.g.h1(listI12));
                }
            }
        } else {
            launchIntentForPackage = Intent.parseUri(url, 1);
        }
        Intrinsics.f(launchIntentForPackage, "{\n            if (url.co…)\n            }\n        }");
        return launchIntentForPackage;
    }
}
