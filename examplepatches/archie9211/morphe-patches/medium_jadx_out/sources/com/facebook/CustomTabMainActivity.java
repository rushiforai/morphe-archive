package com.facebook;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Bundle;
import defpackage.bm2;
import defpackage.cm2;
import defpackage.da7;
import defpackage.ea7;
import defpackage.ec2;
import defpackage.epe;
import defpackage.f94;
import defpackage.fm2;
import defpackage.g76;
import defpackage.iq1;
import defpackage.m50;
import defpackage.no7;
import defpackage.o36;
import defpackage.pkf;
import defpackage.x98;
import defpackage.ys0;
import defpackage.zg7;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class CustomTabMainActivity extends Activity {
    public static final /* synthetic */ int c = 0;
    public boolean a = true;
    public ys0 b;

    public final void a(int i, Intent intent) {
        Bundle bundle;
        ys0 ys0Var = this.b;
        if (ys0Var != null) {
            iq1.C(this).T(ys0Var);
        }
        if (intent != null) {
            String stringExtra = intent.getStringExtra("CustomTabMainActivity.extra_url");
            if (stringExtra != null) {
                Uri uri = Uri.parse(stringExtra);
                bundle = epe.P(uri.getQuery());
                bundle.putAll(epe.P(uri.getFragment()));
            } else {
                bundle = new Bundle();
            }
            Intent intent2 = getIntent();
            intent2.getClass();
            Intent intentE = x98.e(intent2, bundle, null);
            if (intentE != null) {
                intent = intentE;
            }
            setResult(i, intent);
        } else {
            Intent intent3 = getIntent();
            intent3.getClass();
            setResult(i, x98.e(intent3, null, null));
        }
        finish();
    }

    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) {
        String stringExtra;
        ea7 ea7Var;
        zg7 zg7Var;
        boolean z;
        Uri uriA;
        super.onCreate(bundle);
        if ("CustomTabActivity.action_customTabRedirect".equals(getIntent().getAction())) {
            setResult(0);
            finish();
            return;
        }
        if (bundle != null || (stringExtra = getIntent().getStringExtra("CustomTabMainActivity.extra_action")) == null) {
            return;
        }
        Bundle bundleExtra = getIntent().getBundleExtra("CustomTabMainActivity.extra_params");
        String stringExtra2 = getIntent().getStringExtra("CustomTabMainActivity.extra_chromePackage");
        da7 da7Var = ea7.Companion;
        String stringExtra3 = getIntent().getStringExtra("CustomTabMainActivity.extra_targetApp");
        da7Var.getClass();
        ea7[] ea7VarArrValues = ea7.values();
        int length = ea7VarArrValues.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                ea7Var = ea7.FACEBOOK;
                break;
            }
            ea7Var = ea7VarArrValues[i];
            if (g76.L(ea7Var.toString(), stringExtra3)) {
                break;
            } else {
                i++;
            }
        }
        if (bm2.a[ea7Var.ordinal()] == 1) {
            zg7Var = new o36(stringExtra, bundleExtra);
            if (bundleExtra == null) {
                bundleExtra = new Bundle();
            }
            if (stringExtra.equals("oauth")) {
                uriA = epe.a(no7.v(), "oauth/authorize", bundleExtra);
            } else {
                uriA = epe.a(no7.v(), f94.d() + "/dialog/" + stringExtra, bundleExtra);
            }
            if (!ec2.a.contains(zg7Var)) {
                try {
                    zg7Var.b = uriA;
                } catch (Throwable th) {
                    ec2.a(zg7Var, th);
                }
            }
        } else {
            zg7Var = new zg7(stringExtra, bundleExtra);
        }
        if (ec2.a.contains(zg7Var)) {
            z = false;
        } else {
            try {
                ReentrantLock reentrantLock = cm2.d;
                reentrantLock.lock();
                m50 m50Var = cm2.c;
                cm2.c = null;
                reentrantLock.unlock();
                Intent intent = new Intent("android.intent.action.VIEW");
                if (m50Var != null) {
                    intent.setPackage(((ComponentName) m50Var.d).getPackageName());
                    fm2 fm2Var = (fm2) m50Var.c;
                    Bundle bundle2 = new Bundle();
                    bundle2.putBinder("android.support.customtabs.extra.SESSION", fm2Var);
                    intent.putExtras(bundle2);
                }
                if (!intent.hasExtra("android.support.customtabs.extra.SESSION")) {
                    Bundle bundle3 = new Bundle();
                    bundle3.putBinder("android.support.customtabs.extra.SESSION", null);
                    intent.putExtras(bundle3);
                }
                intent.putExtra("android.support.customtabs.extra.EXTRA_ENABLE_INSTANT_APPS", true);
                intent.putExtras(new Bundle());
                intent.putExtra("androidx.browser.customtabs.extra.SHARE_STATE", 0);
                Intent intent2 = (Intent) new pkf(intent).a;
                intent2.setPackage(stringExtra2);
                try {
                    intent2.setData((Uri) zg7Var.b);
                    startActivity(intent2, null);
                    z = true;
                } catch (ActivityNotFoundException unused) {
                    z = false;
                }
            } catch (Throwable th2) {
                ec2.a(zg7Var, th2);
            }
        }
        this.a = false;
        if (!z) {
            setResult(0, getIntent().putExtra("CustomTabMainActivity.no_activity_exception", true));
            finish();
        } else {
            ys0 ys0Var = new ys0(4, this);
            this.b = ys0Var;
            iq1.C(this).L(ys0Var, new IntentFilter("CustomTabActivity.action_customTabRedirect"));
        }
    }

    @Override // android.app.Activity
    public final void onNewIntent(Intent intent) {
        intent.getClass();
        super.onNewIntent(intent);
        if ("CustomTabMainActivity.action_refresh".equals(intent.getAction())) {
            iq1.C(this).O(new Intent("CustomTabActivity.action_destroy"));
            a(-1, intent);
        } else if ("CustomTabActivity.action_customTabRedirect".equals(intent.getAction())) {
            a(-1, intent);
        }
    }

    @Override // android.app.Activity
    public final void onResume() {
        super.onResume();
        if (this.a) {
            a(0, null);
        }
        this.a = true;
    }
}
