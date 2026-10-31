package io.sentry.android.core;

import io.sentry.g3;
import java.io.File;

/* loaded from: classes4.dex */
public final /* synthetic */ class l implements io.sentry.util.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ SentryAndroidOptions f66987a;

    @Override // io.sentry.util.b
    public Object a() {
        int i5 = io.sentry.android.core.cache.a.f66855i;
        SentryAndroidOptions sentryAndroidOptions = this.f66987a;
        String outboxPath = sentryAndroidOptions.getOutboxPath();
        boolean z11 = false;
        if (outboxPath == null) {
            sentryAndroidOptions.getLogger().g(g3.DEBUG, "Outbox path is null, the startup crash marker file does not exist", new Object[0]);
        } else {
            File file = new File(outboxPath, "startup_crash");
            try {
                boolean zExists = file.exists();
                if (zExists && !file.delete()) {
                    sentryAndroidOptions.getLogger().g(g3.ERROR, "Failed to delete the startup crash marker file. %s.", file.getAbsolutePath());
                }
                z11 = zExists;
            } catch (Throwable th2) {
                sentryAndroidOptions.getLogger().e(g3.ERROR, "Error reading/deleting the startup crash marker file on the disk", th2);
            }
        }
        return Boolean.valueOf(z11);
    }
}
