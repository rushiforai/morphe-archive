package io.sentry.android.core.internal.debugmeta;

import android.content.Context;
import io.sentry.ILogger;
import io.sentry.g3;
import java.io.BufferedInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

/* loaded from: classes4.dex */
public final class a implements io.sentry.internal.debugmeta.a {

    /* renamed from: a, reason: collision with root package name */
    public final Context f66903a;

    /* renamed from: b, reason: collision with root package name */
    public final ILogger f66904b;

    public a(Context context, ILogger iLogger) {
        Context applicationContext = context.getApplicationContext();
        this.f66903a = applicationContext != null ? applicationContext : context;
        this.f66904b = iLogger;
    }

    @Override // io.sentry.internal.debugmeta.a
    public final List f() throws IOException {
        ILogger iLogger = this.f66904b;
        try {
            BufferedInputStream bufferedInputStream = new BufferedInputStream(this.f66903a.getAssets().open("sentry-debug-meta.properties"));
            try {
                Properties properties = new Properties();
                properties.load(bufferedInputStream);
                List listSingletonList = Collections.singletonList(properties);
                bufferedInputStream.close();
                return listSingletonList;
            } catch (Throwable th2) {
                try {
                    bufferedInputStream.close();
                } catch (Throwable th3) {
                    th2.addSuppressed(th3);
                }
                throw th2;
            }
        } catch (FileNotFoundException e3) {
            iLogger.d(g3.INFO, e3, "%s file was not found.", "sentry-debug-meta.properties");
            return null;
        } catch (IOException e11) {
            iLogger.e(g3.ERROR, "Error getting Proguard UUIDs.", e11);
            return null;
        } catch (RuntimeException e12) {
            iLogger.d(g3.ERROR, e12, "%s file is malformed.", "sentry-debug-meta.properties");
            return null;
        }
    }
}
