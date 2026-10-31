package com.teslacoilsw.launcher.search.shortcutsearch.authorization;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Collections;
import kotlin.Metadata;
import kotlin.NotImplementedError;
import kotlin.collections.c;
import kotlin.jvm.internal.Intrinsics;
import mc0.b;
import mc0.d;
import w.f;
import w.h;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/teslacoilsw/launcher/search/shortcutsearch/authorization/LoginOauthActivity;", "Landroid/app/Activity;", "<init>", "()V", "wh/f", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class LoginOauthActivity extends Activity {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f46279c = 0;

    /* renamed from: a, reason: collision with root package name */
    public boolean f46280a = true;

    /* renamed from: b, reason: collision with root package name */
    public DefaultOAuthRequest f46281b;

    /* JADX WARN: Removed duplicated region for block: B:4:0x0010  */
    @Override // android.app.Activity
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onCreate(Bundle bundle) {
        DefaultOAuthRequest defaultOAuthRequest;
        Uri uriBuild;
        super.onCreate(bundle);
        Bundle bundleExtra = getIntent().getBundleExtra("auth_extra");
        if (bundleExtra == null) {
            defaultOAuthRequest = null;
        } else {
            Parcelable parcelable = bundleExtra.getParcelable("request_key");
            defaultOAuthRequest = parcelable instanceof DefaultOAuthRequest ? (DefaultOAuthRequest) parcelable : null;
            if (defaultOAuthRequest == null) {
            }
        }
        if (defaultOAuthRequest == null) {
            return;
        }
        String str = defaultOAuthRequest.f46273a;
        this.f46281b = defaultOAuthRequest;
        Uri.Builder builderAppendQueryParameter = Uri.parse(defaultOAuthRequest.f46275c).buildUpon().appendQueryParameter("redirect_uri", defaultOAuthRequest.f46274b).appendQueryParameter("state", defaultOAuthRequest.f46276d);
        DefaultOAuthRequest defaultOAuthRequest2 = this.f46281b;
        if (defaultOAuthRequest2 == null) {
            Intrinsics.m("request");
            throw null;
        }
        int iOrdinal = defaultOAuthRequest2.f46278f.ordinal();
        if (iOrdinal == 0) {
            uriBuild = builderAppendQueryParameter.appendQueryParameter("client_id", str).appendQueryParameter("scope", c.O0(defaultOAuthRequest.f46277e, " ", null, null, null, 62)).build();
        } else {
            if (iOrdinal != 1) {
                throw new NotImplementedError(0);
            }
            uriBuild = builderAppendQueryParameter.appendQueryParameter("app_id", str).appendQueryParameter("perms", c.O0(defaultOAuthRequest.f46277e, ",", null, null, null, 62)).build();
        }
        if (f.b(this, Collections.EMPTY_LIST) != null) {
            new h().a().a(this, uriBuild);
        } else {
            startActivity(new Intent("android.intent.action.VIEW", uriBuild));
        }
    }

    @Override // android.app.Activity
    public final void onNewIntent(Intent intent) {
        Uri data;
        Uri data2;
        Uri data3;
        Uri data4;
        DefaultOAuthRequest defaultOAuthRequest = this.f46281b;
        String queryParameter = null;
        if (defaultOAuthRequest == null) {
            Intrinsics.m("request");
            throw null;
        }
        String queryParameter2 = (intent == null || (data4 = intent.getData()) == null) ? null : data4.getQueryParameter(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE);
        String queryParameter3 = (intent == null || (data3 = intent.getData()) == null) ? null : data3.getQueryParameter("state");
        if (queryParameter2 != null && queryParameter3 != null && queryParameter3.equals(defaultOAuthRequest.f46276d)) {
            Intent intent2 = new Intent();
            intent2.putExtra("response_code", queryParameter2);
            setResult(-1, intent2);
            finish();
            return;
        }
        String queryParameter4 = (intent == null || (data2 = intent.getData()) == null) ? null : data2.getQueryParameter("error");
        if (intent != null && (data = intent.getData()) != null) {
            queryParameter = data.getQueryParameter("error_description");
        }
        b bVar = d.f76206a;
        bVar.r("CustomTabsLoginOauthActivity");
        bVar.n("Failed to get response, error=" + queryParameter4 + ", description=" + queryParameter, new Object[0]);
        setResult(0);
        finish();
    }

    @Override // android.app.Activity
    public final void onResume() {
        super.onResume();
        if (this.f46280a) {
            this.f46280a = false;
        } else {
            finish();
        }
    }
}
