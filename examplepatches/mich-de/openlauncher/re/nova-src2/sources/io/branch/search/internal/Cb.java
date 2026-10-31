package io.branch.search.internal;

import android.annotation.TargetApi;
import android.os.Build;
import android.text.TextUtils;
import android.webkit.WebSettings;
import android.webkit.WebView;
import io.branch.search.internal.InterfaceC3272mf;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Cb implements InterfaceC3272mf {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f62313a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final InterfaceC3133eb f62314b;

    public Cb(@NotNull F4 context, @NotNull InterfaceC3133eb processHandler) {
        Intrinsics.g(context, "context");
        Intrinsics.g(processHandler, "processHandler");
        this.f62313a = context;
        this.f62314b = processHandler;
        if (Build.VERSION.SDK_INT < 28 || processHandler.a()) {
            return;
        }
        a(context, processHandler);
    }

    @TargetApi(28)
    public static void a(F4 f42, InterfaceC3133eb interfaceC3133eb) {
        try {
            String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            String strE = interfaceC3133eb.e();
            String packageName = f42.f62438a.getPackageName();
            Intrinsics.f(packageName, "context.packageName");
            if (!TextUtils.equals(packageName, strE)) {
                if (TextUtils.isEmpty(strE)) {
                    strE = f42.f62438a.getPackageName();
                    Intrinsics.f(strE, "context.packageName");
                }
                str = strE;
                WebView.setDataDirectorySuffix(str);
            }
            a(f42, str);
        } catch (Exception e3) {
            e3.printStackTrace();
        }
    }

    @Override // io.branch.search.internal.InterfaceC3272mf
    @NotNull
    public final Pair<String, InterfaceC3272mf.c> b() {
        C3309p1 c3309p1 = C3309p1.f65465a;
        EnumC3131e9 tag = EnumC3131e9.UserAgentFetch;
        c3309p1.getClass();
        Intrinsics.g(tag, "tag");
        long jCurrentTimeMillis = System.currentTimeMillis();
        String simpleName = null;
        String defaultUserAgent = null;
        for (int i5 = 0; i5 < 11; i5++) {
            try {
                try {
                    defaultUserAgent = WebSettings.getDefaultUserAgent(this.f62313a.f62438a);
                } catch (Exception e3) {
                    C3309p1.a(EnumC3131e9.UserAgentFetch, "Failed to fetch user agent", e3);
                }
                if (defaultUserAgent != null) {
                    break;
                }
            } catch (Throwable th2) {
                try {
                    simpleName = th2.getClass().getSimpleName();
                    throw th2;
                } catch (Throwable th3) {
                    StringBuilder sb2 = new StringBuilder("WebSettings.getDefaultUserAgent");
                    sb2.append(simpleName == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : " FAILING with ".concat(simpleName));
                    String message = sb2.toString();
                    Intrinsics.g(message, "message");
                    long jCurrentTimeMillis2 = System.currentTimeMillis();
                    StringBuilder sbK = com.google.android.gms.internal.measurement.k2.k(message, " took ");
                    sbK.append(jCurrentTimeMillis2 - jCurrentTimeMillis);
                    sbK.append("ms");
                    C3309p1.c(tag, sbK.toString());
                    throw th3;
                }
            }
        }
        Pair<String, InterfaceC3272mf.c> pair = new Pair<>(defaultUserAgent, InterfaceC3272mf.c.REAL);
        C3309p1.c(tag, "WebSettings.getDefaultUserAgent took " + (System.currentTimeMillis() - jCurrentTimeMillis) + "ms");
        return pair;
    }

    @Override // io.branch.search.internal.InterfaceC3272mf
    @Nullable
    public final String get() {
        return (String) b().f71683a;
    }

    @Override // io.branch.search.internal.InterfaceC3272mf
    public final void a() {
        System.exit(0);
        throw new RuntimeException("System.exit returned normally, while it was supposed to halt JVM.");
    }

    @TargetApi(28)
    public static void a(F4 f42, String str) throws IOException {
        File file = new File(f42.f62438a.getDataDir().getAbsolutePath() + "/app_webview_" + str + "/webview_data.lock");
        if (file.exists()) {
            try {
                FileLock fileLockTryLock = new RandomAccessFile(file, "rw").getChannel().tryLock();
                if (fileLockTryLock != null) {
                    fileLockTryLock.close();
                    return;
                }
                if (file.delete()) {
                    try {
                        if (file.exists()) {
                            return;
                        }
                        file.createNewFile();
                    } catch (Exception e3) {
                        e3.printStackTrace();
                    }
                }
            } catch (IOException e11) {
                e11.printStackTrace();
                if (file.exists() && file.delete()) {
                    try {
                        if (file.exists()) {
                            return;
                        }
                        file.createNewFile();
                    } catch (Exception e12) {
                        e12.printStackTrace();
                    }
                }
            }
        }
    }
}
