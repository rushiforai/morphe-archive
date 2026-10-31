package com.amplitude.android.diagnostics;

import android.content.Context;
import android.os.Build;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.amplitude.core.diagnostics.DiagnosticsContextInfo;
import com.amplitude.core.diagnostics.DiagnosticsContextProvider;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\n\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0002J\b\u0010\u0007\u001a\u00020\bH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\t"}, d2 = {"Lcom/amplitude/android/diagnostics/AndroidDiagnosticsContextProvider;", "Lcom/amplitude/core/diagnostics/DiagnosticsContextProvider;", "context", "Landroid/content/Context;", "(Landroid/content/Context;)V", "fetchVersionName", b.f42142b, "getContextInfo", "Lcom/amplitude/core/diagnostics/DiagnosticsContextInfo;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AndroidDiagnosticsContextProvider implements DiagnosticsContextProvider {

    @NotNull
    private final Context context;

    public AndroidDiagnosticsContextProvider(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.context = context;
    }

    private final String fetchVersionName() {
        try {
            return this.context.getPackageManager().getPackageInfo(this.context.getPackageName(), 0).versionName;
        } catch (Exception unused) {
            return null;
        }
    }

    @Override // com.amplitude.core.diagnostics.DiagnosticsContextProvider
    @NotNull
    public DiagnosticsContextInfo getContextInfo() {
        String MANUFACTURER = Build.MANUFACTURER;
        Intrinsics.f(MANUFACTURER, "MANUFACTURER");
        String MODEL = Build.MODEL;
        Intrinsics.f(MODEL, "MODEL");
        String RELEASE = Build.VERSION.RELEASE;
        Intrinsics.f(RELEASE, "RELEASE");
        return new DiagnosticsContextInfo(MANUFACTURER, MODEL, AndroidContextPlugin.PLATFORM, RELEASE, AndroidContextPlugin.PLATFORM, fetchVersionName());
    }
}
