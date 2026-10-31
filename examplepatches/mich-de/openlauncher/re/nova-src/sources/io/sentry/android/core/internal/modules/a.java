package io.sentry.android.core.internal.modules;

import android.content.Context;
import io.sentry.ILogger;
import io.sentry.g3;
import io.sentry.internal.modules.d;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.TreeMap;

/* loaded from: classes4.dex */
public final class a extends d {

    /* renamed from: d, reason: collision with root package name */
    public final Context f66921d;

    public a(Context context, ILogger iLogger) {
        super(iLogger);
        Context applicationContext = context.getApplicationContext();
        this.f66921d = applicationContext != null ? applicationContext : context;
    }

    @Override // io.sentry.internal.modules.d
    public final Map b() throws IOException {
        ILogger iLogger = this.f67339a;
        TreeMap treeMap = new TreeMap();
        try {
            InputStream inputStreamOpen = this.f66921d.getAssets().open("sentry-external-modules.txt");
            try {
                TreeMap treeMapC = c(inputStreamOpen);
                if (inputStreamOpen == null) {
                    return treeMapC;
                }
                inputStreamOpen.close();
                return treeMapC;
            } catch (Throwable th2) {
                if (inputStreamOpen != null) {
                    try {
                        inputStreamOpen.close();
                    } catch (Throwable th3) {
                        th2.addSuppressed(th3);
                    }
                }
                throw th2;
            }
        } catch (FileNotFoundException unused) {
            iLogger.g(g3.INFO, "%s file was not found.", "sentry-external-modules.txt");
            return treeMap;
        } catch (IOException e3) {
            iLogger.e(g3.ERROR, "Error extracting modules.", e3);
            return treeMap;
        }
    }
}
