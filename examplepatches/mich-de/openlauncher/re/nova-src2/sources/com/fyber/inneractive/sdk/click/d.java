package com.fyber.inneractive.sdk.click;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.network.z0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.h0;
import com.fyber.inneractive.sdk.util.l1;
import com.fyber.inneractive.sdk.util.m1;
import java.util.List;
import java.util.Locale;
import java.util.PriorityQueue;

/* loaded from: classes3.dex */
public final class d extends a {

    /* renamed from: a, reason: collision with root package name */
    public boolean f27705a = false;

    @Override // com.fyber.inneractive.sdk.click.a
    public final boolean a(Uri uri, r rVar) {
        return "smartlink".equalsIgnoreCase(uri.getScheme()) && !this.f27705a;
    }

    @Override // com.fyber.inneractive.sdk.click.a
    public final b a(Context context, Uri uri, List list) {
        Uri uri2;
        Uri uri3;
        Uri uri4;
        if (!a(uri, (r) null)) {
            return null;
        }
        PriorityQueue priorityQueue = new PriorityQueue();
        String queryParameter = uri.getQueryParameter("primaryUrl");
        List<String> queryParameters = uri.getQueryParameters("primaryTrackingUrl");
        l1 l1Var = l1.Primary;
        try {
            uri2 = Uri.parse(queryParameter);
        } catch (Exception unused) {
            uri2 = null;
        }
        if (uri2 != null) {
            priorityQueue.offer(new m1(l1Var, uri2, queryParameters));
        }
        String queryParameter2 = uri.getQueryParameter("fallbackUrl");
        List<String> queryParameters2 = uri.getQueryParameters("fallbackTrackingUrl");
        l1 l1Var2 = l1.FallBack;
        try {
            uri3 = Uri.parse(queryParameter2);
        } catch (Exception unused2) {
            uri3 = null;
        }
        if (uri3 != null) {
            priorityQueue.offer(new m1(l1Var2, uri3, queryParameters2));
        }
        if (priorityQueue.size() <= 0) {
            String string = uri.toString();
            q qVar = q.DEEP_LINK;
            if (list != null) {
                list.add(new j(string, false, qVar, null));
            }
            return r.a(uri.toString(), "FyberDeepLink", "fyberDeepLink is not valid");
        }
        while (true) {
            m1 m1Var = (m1) priorityQueue.poll();
            if (m1Var == null) {
                uri4 = null;
                break;
            }
            uri4 = m1Var.f31203b;
            String scheme = uri4.getScheme();
            q qVarA = a.a(uri4, (TextUtils.isEmpty(scheme) || !scheme.toLowerCase(Locale.US).startsWith("http")) ? q.OPEN_IN_EXTERNAL_APPLICATION : q.OPENED_IN_EXTERNAL_BROWSER);
            boolean zA = h0.a(context, new Intent("android.intent.action.VIEW", uri4));
            String string2 = uri4.toString();
            if (list != null) {
                list.add(new j(string2, zA, qVarA, null));
            }
            if (zA) {
                for (String str : m1Var.f31204c) {
                    if (!TextUtils.isEmpty(str)) {
                        IAlog.d("%s %s", "SMART_LINK", str);
                        z0.b(str);
                    }
                }
            }
            if (!zA) {
                uri4 = null;
            }
            if (uri4 != null) {
                break;
            }
        }
        if (uri4 != null) {
            return new b(uri.toString(), a.a(uri4, q.OPEN_IN_EXTERNAL_APPLICATION), "FyberDeepLink", null);
        }
        return r.a(uri.toString(), "FyberDeepLink", "tryHandleDeepLinkWithExternalApp has failed");
    }

    @Override // com.fyber.inneractive.sdk.click.a
    public final void a() {
        this.f27705a = true;
    }
}
