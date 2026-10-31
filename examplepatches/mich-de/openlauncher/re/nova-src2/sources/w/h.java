package w;

import a5.k0;
import android.app.ActivityOptions;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.os.LocaleList;
import android.text.TextUtils;

/* loaded from: classes2.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final Intent f93401a;

    /* renamed from: b, reason: collision with root package name */
    public final a f93402b;

    /* renamed from: c, reason: collision with root package name */
    public ActivityOptions f93403c;

    /* renamed from: d, reason: collision with root package name */
    public Bundle f93404d;

    /* renamed from: e, reason: collision with root package name */
    public int f93405e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f93406f;

    public h() {
        this.f93401a = new Intent("android.intent.action.VIEW");
        this.f93402b = new a();
        this.f93405e = 0;
        this.f93406f = true;
    }

    public final i a() {
        Intent intent = this.f93401a;
        if (!intent.hasExtra("android.support.customtabs.extra.SESSION")) {
            Bundle bundle = new Bundle();
            bundle.putBinder("android.support.customtabs.extra.SESSION", null);
            intent.putExtras(bundle);
        }
        intent.putExtra("android.support.customtabs.extra.EXTRA_ENABLE_INSTANT_APPS", this.f93406f);
        this.f93402b.getClass();
        intent.putExtras(new Bundle());
        Bundle bundle2 = this.f93404d;
        if (bundle2 != null) {
            intent.putExtras(bundle2);
        }
        intent.putExtra("androidx.browser.customtabs.extra.SHARE_STATE", this.f93405e);
        int i5 = Build.VERSION.SDK_INT;
        LocaleList adjustedDefault = LocaleList.getAdjustedDefault();
        String languageTag = adjustedDefault.size() > 0 ? adjustedDefault.get(0).toLanguageTag() : null;
        if (!TextUtils.isEmpty(languageTag)) {
            Bundle bundleExtra = intent.hasExtra("com.android.browser.headers") ? intent.getBundleExtra("com.android.browser.headers") : new Bundle();
            if (!bundleExtra.containsKey("Accept-Language")) {
                bundleExtra.putString("Accept-Language", languageTag);
                intent.putExtra("com.android.browser.headers", bundleExtra);
            }
        }
        if (i5 >= 34) {
            if (this.f93403c == null) {
                this.f93403c = ActivityOptions.makeBasic();
            }
            k0.n(this.f93403c);
        }
        if (i5 >= 36) {
            if (this.f93403c == null) {
                this.f93403c = ActivityOptions.makeBasic();
            }
            g.a(this.f93403c, !intent.getBooleanExtra("androidx.browser.customtabs.extra.DISABLE_BACKGROUND_INTERACTION", false));
        }
        ActivityOptions activityOptions = this.f93403c;
        return new i(intent, activityOptions != null ? activityOptions.toBundle() : null);
    }

    public final void b(int i5) {
        if (i5 < 0 || i5 > 2) {
            throw new IllegalArgumentException("Invalid value for the position argument");
        }
        this.f93401a.putExtra("androidx.browser.customtabs.extra.CLOSE_BUTTON_POSITION", i5);
    }

    public final void c(int i5) {
        if (i5 <= 0) {
            throw new IllegalArgumentException("Invalid value for the initialHeightPx argument");
        }
        Intent intent = this.f93401a;
        intent.putExtra("androidx.browser.customtabs.extra.INITIAL_ACTIVITY_HEIGHT_PX", i5);
        intent.putExtra("androidx.browser.customtabs.extra.ACTIVITY_HEIGHT_RESIZE_BEHAVIOR", 0);
    }

    public final void d() {
        this.f93405e = 2;
        this.f93401a.putExtra("android.support.customtabs.extra.SHARE_MENU_ITEM", false);
    }

    public h(l lVar) {
        Intent intent = new Intent("android.intent.action.VIEW");
        this.f93401a = intent;
        this.f93402b = new a();
        this.f93405e = 0;
        this.f93406f = true;
        if (lVar != null) {
            intent.setPackage(lVar.f93412d.getPackageName());
            IBinder iBinderAsBinder = lVar.f93411c.asBinder();
            Bundle bundle = new Bundle();
            bundle.putBinder("android.support.customtabs.extra.SESSION", iBinderAsBinder);
            intent.putExtras(bundle);
        }
    }
}
