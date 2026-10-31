package io.branch.search.internal.ui;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Process;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import b50.f;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import g.o;
import io.branch.engage.sesame_lite.internal.Utils;
import io.branch.search.internal.C3309p1;
import io.branch.search.internal.C3346r5;
import io.branch.search.internal.C3390tf;
import io.branch.search.internal.EnumC3131e9;
import io.branch.search.internal.F8;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\u0018\u0000 \u00042\u00020\u0001:\u0001\u0005B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/ui/InvisibleRedirectActivity;", "Lg/o;", "<init>", "()V", k.O, "a", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class InvisibleRedirectActivity extends o {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion();

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public static Function1<? super Intent, Boolean> f66054b;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public String f66055a;

    /* renamed from: io.branch.search.internal.ui.InvisibleRedirectActivity$a, reason: from kotlin metadata */
    public static final class Companion {

        /* renamed from: io.branch.search.internal.ui.InvisibleRedirectActivity$a$a, reason: collision with other inner class name */
        public static final class C0353a extends Lambda implements Function1<Intent, Boolean> {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ f f66056a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ Context f66057b;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0353a(Context context, f fVar) {
                super(1);
                this.f66056a = fVar;
                this.f66057b = context;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                Intent it = (Intent) obj;
                Intrinsics.g(it, "it");
                return Boolean.valueOf(this.f66056a.openIntent(this.f66057b, it, Process.myUserHandle()));
            }
        }

        public static void a(@NotNull Context context, @NotNull f openHandler, @Nullable String str, @NotNull Uri data) {
            Intrinsics.g(context, "context");
            Intrinsics.g(openHandler, "openHandler");
            Intrinsics.g(data, "data");
            Intent intent = new Intent(context, (Class<?>) InvisibleRedirectActivity.class);
            intent.putExtra("key_url", data.toString());
            intent.putExtra("key_package_id", str);
            InvisibleRedirectActivity.f66054b = new C0353a(context, openHandler);
            context.startActivity(intent);
        }
    }

    public static final class b extends Lambda implements Function1<Intent, Boolean> {
        public b() {
            super(1);
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            Intent it = (Intent) obj;
            Intrinsics.g(it, "it");
            C3346r5.Companion.getClass();
            return Boolean.valueOf(C3346r5.f65614a.openIntent(InvisibleRedirectActivity.this, it, Process.myUserHandle()));
        }
    }

    public static final class c extends WebViewClient {
        public c() {
        }

        @Override // android.webkit.WebViewClient
        public final void onPageFinished(@Nullable WebView webView, @Nullable String str) {
            super.onPageFinished(webView, str);
            String stringExtra = InvisibleRedirectActivity.this.getIntent().getStringExtra("key_package_id");
            if (str == null || !str.equals(InvisibleRedirectActivity.this.f66055a)) {
                return;
            }
            InvisibleRedirectActivity invisibleRedirectActivity = InvisibleRedirectActivity.this;
            invisibleRedirectActivity.f66055a = null;
            if (stringExtra == null && (stringExtra = Uri.parse(str).getHost()) == null) {
                stringExtra = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            InvisibleRedirectActivity.a(invisibleRedirectActivity, stringExtra, str);
            InvisibleRedirectActivity.this.finish();
        }

        @Override // android.webkit.WebViewClient
        public final void onReceivedError(@Nullable WebView webView, @Nullable WebResourceRequest webResourceRequest, @Nullable WebResourceError webResourceError) {
            String stringExtra = InvisibleRedirectActivity.this.getIntent().getStringExtra("key_url");
            String stringExtra2 = InvisibleRedirectActivity.this.getIntent().getStringExtra("key_package_id");
            if (stringExtra != null && stringExtra2 != null) {
                InvisibleRedirectActivity.a(InvisibleRedirectActivity.this, stringExtra2, stringExtra);
            } else if (stringExtra2 != null) {
                Application application = InvisibleRedirectActivity.this.getApplication();
                Intrinsics.f(application, "application");
                Intent intentA = C3390tf.a(application, stringExtra2, Process.myUserHandle());
                if (intentA != null) {
                    ((Boolean) InvisibleRedirectActivity.this.a().invoke(intentA)).getClass();
                }
            } else if (stringExtra != null) {
                Function1<Intent, Boolean> function1A = InvisibleRedirectActivity.this.a();
                Intent data = new Intent("android.intent.action.VIEW").setData(Utils.INSTANCE.toUri(stringExtra));
                Intrinsics.f(data, "Intent(Intent.ACTION_VIEW).setData(uri.toUri())");
                function1A.invoke(data);
            }
            InvisibleRedirectActivity.INSTANCE.getClass();
            InvisibleRedirectActivity.f66054b = null;
            InvisibleRedirectActivity.this.finish();
        }

        @Override // android.webkit.WebViewClient
        public final boolean shouldOverrideUrlLoading(@Nullable WebView webView, @Nullable WebResourceRequest webResourceRequest) {
            if (webResourceRequest != null) {
                webResourceRequest.getUrl();
            }
            if (webResourceRequest != null && webResourceRequest.isRedirect()) {
                InvisibleRedirectActivity.this.f66055a = webResourceRequest.getUrl().toString();
                return super.shouldOverrideUrlLoading(webView, webResourceRequest);
            }
            String stringExtra = InvisibleRedirectActivity.this.getIntent().getStringExtra("key_package_id");
            Boolean boolValueOf = webResourceRequest != null ? Boolean.valueOf(webResourceRequest.isRedirect()) : null;
            Intrinsics.d(boolValueOf);
            if (!boolValueOf.booleanValue() || stringExtra == null) {
                return false;
            }
            InvisibleRedirectActivity invisibleRedirectActivity = InvisibleRedirectActivity.this;
            invisibleRedirectActivity.f66055a = null;
            String string = webResourceRequest.getUrl().toString();
            Intrinsics.f(string, "request.url.toString()");
            InvisibleRedirectActivity.a(invisibleRedirectActivity, stringExtra, string);
            InvisibleRedirectActivity.this.finish();
            return super.shouldOverrideUrlLoading(webView, webResourceRequest);
        }
    }

    public static final void a(InvisibleRedirectActivity invisibleRedirectActivity, String str, String str2) {
        invisibleRedirectActivity.getClass();
        try {
            Intent intentA = F8.a(str2, str, invisibleRedirectActivity);
            intentA.toString();
            if (((Boolean) invisibleRedirectActivity.a().invoke(intentA)).booleanValue()) {
                return;
            }
            Application application = invisibleRedirectActivity.getApplication();
            Intrinsics.f(application, "application");
            Intent intentA2 = C3390tf.a(application, str, Process.myUserHandle());
            if (intentA2 != null) {
                ((Boolean) invisibleRedirectActivity.a().invoke(intentA2)).getClass();
            }
        } catch (Exception e3) {
            EnumC3131e9 enumC3131e9 = EnumC3131e9.Others;
            String message = e3.getMessage();
            if (message == null) {
                message = "Exception";
            }
            C3309p1.a(enumC3131e9, message, e3);
            Application application2 = invisibleRedirectActivity.getApplication();
            Intrinsics.f(application2, "application");
            Intent intentA3 = C3390tf.a(application2, str, Process.myUserHandle());
            if (intentA3 != null) {
                ((Boolean) invisibleRedirectActivity.a().invoke(intentA3)).getClass();
            }
        }
    }

    @Override // g.o, n4.i, android.app.Activity
    @SuppressLint({"SetJavaScriptEnabled"})
    public final void onCreate(@Nullable Bundle bundle) {
        Unit unit;
        super.onCreate(bundle);
        C3309p1.b("Invisible redirect " + getIntent().getStringExtra("key_url"));
        WebView webView = new WebView(this);
        webView.getSettings().setJavaScriptEnabled(true);
        webView.getSettings().setDomStorageEnabled(true);
        webView.setVisibility(8);
        setContentView(webView);
        webView.setWebViewClient(new c());
        String stringExtra = getIntent().getStringExtra("key_url");
        if (stringExtra != null) {
            webView.loadUrl(stringExtra);
            unit = Unit.f71706a;
        } else {
            unit = null;
        }
        if (unit == null) {
            finish();
        }
    }

    public final Function1<Intent, Boolean> a() {
        Function1 function1 = f66054b;
        return function1 == null ? new b() : function1;
    }
}
