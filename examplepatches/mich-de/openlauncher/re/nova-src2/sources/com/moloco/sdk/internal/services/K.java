package com.moloco.sdk.internal.services;

import android.content.Context;
import android.content.pm.PackageInfo;
import androidx.webkit.WebViewCompat;
import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class K {

    /* renamed from: c, reason: collision with root package name */
    public static final int f37637c = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f37638a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final MetricsRecorder f37639b;

    public K(@NotNull Context context, @NotNull MetricsRecorder metricsRecorder) {
        Intrinsics.g(context, "context");
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        this.f37638a = context;
        this.f37639b = metricsRecorder;
    }

    @NotNull
    public final Object a() {
        PackageInfo currentWebViewPackage = WebViewCompat.getCurrentWebViewPackage(this.f37638a);
        if (currentWebViewPackage == null) {
            a("no_package");
            int i5 = Result.f71687b;
            return ResultKt.a(new Exception("No current WebView package exists"));
        }
        try {
            int applicationEnabledSetting = this.f37638a.getPackageManager().getApplicationEnabledSetting(currentWebViewPackage.packageName);
            if (applicationEnabledSetting == 2) {
                a("disabled_by_system");
                int i11 = Result.f71687b;
                return ResultKt.a(new Exception("WebView component is disabled by system"));
            }
            if (applicationEnabledSetting == 3) {
                a("disabled_by_user");
                int i12 = Result.f71687b;
                return ResultKt.a(new Exception("WebView component is disabled by user"));
            }
            if (applicationEnabledSetting != 4) {
                int i13 = Result.f71687b;
                return Unit.f71706a;
            }
            a("disabled_until_used");
            int i14 = Result.f71687b;
            return ResultKt.a(new Exception("WebView component is disabled until used"));
        } catch (IllegalArgumentException e3) {
            a("unknown_package");
            int i15 = Result.f71687b;
            return ResultKt.a(e3);
        }
    }

    public final void a(String str) {
        MetricsRecorder metricsRecorder = this.f37639b;
        a2.c.w(com.moloco.sdk.internal.client_metrics_data.d.f36294b, new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.Z.c()), str, metricsRecorder);
    }
}
