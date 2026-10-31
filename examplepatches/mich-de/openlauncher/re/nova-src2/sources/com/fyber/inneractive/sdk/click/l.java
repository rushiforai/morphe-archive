package com.fyber.inneractive.sdk.click;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Build;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.List;
import java.util.TreeSet;

/* loaded from: classes3.dex */
public final class l extends a {

    /* renamed from: b, reason: collision with root package name */
    public static final k f27723b = new k();

    /* renamed from: a, reason: collision with root package name */
    public boolean f27724a = false;

    @Override // com.fyber.inneractive.sdk.click.a
    public final boolean a(Uri uri, r rVar) {
        return !this.f27724a;
    }

    @Override // com.fyber.inneractive.sdk.click.a
    public final b a(Context context, Uri uri, List list) {
        Intent intent;
        ResolveInfo resolveInfo;
        if (this.f27724a) {
            return null;
        }
        if (Build.VERSION.SDK_INT > 29) {
            String scheme = uri.getScheme();
            if (!"http".equalsIgnoreCase(scheme) && !"https".equalsIgnoreCase(scheme)) {
                if (this.f27724a) {
                    return null;
                }
                Intent intent2 = new Intent("android.intent.action.VIEW", uri);
                if (!(context instanceof Activity)) {
                    intent2.setFlags(268435456);
                }
                return a(context, intent2, uri, list);
            }
        }
        List<ResolveInfo> listQueryIntentActivities = context.getPackageManager().queryIntentActivities(new Intent("android.intent.action.VIEW", uri), 32);
        if (listQueryIntentActivities != null && listQueryIntentActivities.size() > 0) {
            List<ResolveInfo> listQueryIntentActivities2 = context.getPackageManager().queryIntentActivities(new Intent("android.intent.action.VIEW", Uri.parse("http://www.fyber.com")), 32);
            TreeSet treeSet = new TreeSet(f27723b);
            treeSet.addAll(listQueryIntentActivities2);
            listQueryIntentActivities.removeAll(treeSet);
            if (listQueryIntentActivities.size() <= 0 || (resolveInfo = listQueryIntentActivities.get(0)) == null) {
                intent = null;
            } else {
                intent = new Intent("android.intent.action.VIEW", uri);
                ActivityInfo activityInfo = resolveInfo.activityInfo;
                intent.setClassName(activityInfo.packageName, activityInfo.name);
                if (!(context instanceof Activity)) {
                    intent.setFlags(268435456);
                }
            }
            if (intent != null && !this.f27724a) {
                return a(context, intent, uri, list);
            }
        }
        return null;
    }

    public final b a(Context context, Intent intent, Uri uri, List list) {
        if (this.f27724a) {
            return r.a(uri.toString(), "Resolver", "The process was cancelled");
        }
        try {
            context.startActivity(intent);
            if (list != null) {
                list.add(new j(uri.toString(), true, a.a(intent.getData(), q.OPEN_IN_EXTERNAL_APPLICATION), null));
            }
            return new b(uri.toString(), a.a(intent.getData(), q.OPEN_IN_EXTERNAL_APPLICATION), "Resolver", null);
        } catch (Throwable th2) {
            IAlog.a("failed starting activity with error: %s", th2.getLocalizedMessage());
            if (list != null) {
                list.add(new j(uri.toString(), false, q.OPEN_IN_EXTERNAL_APPLICATION, null));
            }
            return r.a(uri.toString(), "Resolver", fq.c.f(th2, new StringBuilder("failed starting resolved activity - ")));
        }
    }

    @Override // com.fyber.inneractive.sdk.click.a
    public final void a() {
        this.f27724a = true;
    }
}
