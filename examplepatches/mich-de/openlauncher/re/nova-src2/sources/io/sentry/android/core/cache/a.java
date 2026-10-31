package io.sentry.android.core.cache;

import ae.h;
import android.os.SystemClock;
import ex.i;
import i30.j;
import io.sentry.ILogger;
import io.sentry.android.core.SentryAndroidOptions;
import io.sentry.android.core.internal.util.c;
import io.sentry.android.core.performance.d;
import io.sentry.android.core.performance.e;
import io.sentry.android.core.u;
import io.sentry.cache.b;
import io.sentry.e3;
import io.sentry.g3;
import io.sentry.u4;
import io.sentry.w3;
import io.sentry.x;
import java.io.File;
import java.io.FileOutputStream;

/* loaded from: classes4.dex */
public final class a extends b {

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ int f66855i = 0;

    /* renamed from: h, reason: collision with root package name */
    public final c f66856h;

    /* JADX WARN: Illegal instructions before constructor call */
    public a(SentryAndroidOptions sentryAndroidOptions) {
        String cacheDirPath = sentryAndroidOptions.getCacheDirPath();
        j.Q(cacheDirPath, "cacheDirPath must not be null");
        super(sentryAndroidOptions, cacheDirPath, sentryAndroidOptions.getMaxCacheItems());
        this.f66856h = c.f66947a;
    }

    @Override // io.sentry.cache.b, io.sentry.cache.c
    public final void a(e3 e3Var, x xVar) {
        super.a(e3Var, xVar);
        w3 w3Var = this.f67157a;
        SentryAndroidOptions sentryAndroidOptions = (SentryAndroidOptions) w3Var;
        e eVar = d.b().f67038d;
        if (u4.class.isInstance(i.B(xVar)) && eVar.a()) {
            this.f66856h.getClass();
            long jUptimeMillis = SystemClock.uptimeMillis() - eVar.f67047c;
            if (jUptimeMillis <= sentryAndroidOptions.getStartupCrashDurationThresholdMillis()) {
                ILogger logger = sentryAndroidOptions.getLogger();
                g3 g3Var = g3.DEBUG;
                logger.g(g3Var, "Startup Crash detected %d milliseconds after SDK init. Writing a startup crash marker file to disk.", Long.valueOf(jUptimeMillis));
                String outboxPath = w3Var.getOutboxPath();
                if (outboxPath == null) {
                    w3Var.getLogger().g(g3Var, "Outbox path is null, the startup crash marker file will not be written", new Object[0]);
                } else {
                    try {
                        new File(outboxPath, "startup_crash").createNewFile();
                    } catch (Throwable th2) {
                        w3Var.getLogger().e(g3.ERROR, "Error writing the startup crash marker file to the disk", th2);
                    }
                }
            }
        }
        h hVar = new h(21, this, sentryAndroidOptions);
        Object objB = i.B(xVar);
        if (!u.class.isInstance(i.B(xVar)) || objB == null) {
            return;
        }
        a aVar = (a) hVar.f12759b;
        SentryAndroidOptions sentryAndroidOptions2 = (SentryAndroidOptions) hVar.f12760c;
        Long lValueOf = Long.valueOf(((u) objB).f67077d);
        ILogger logger2 = sentryAndroidOptions2.getLogger();
        g3 g3Var2 = g3.DEBUG;
        logger2.g(g3Var2, "Writing last reported ANR marker with timestamp %d", lValueOf);
        w3 w3Var2 = aVar.f67157a;
        String cacheDirPath = w3Var2.getCacheDirPath();
        if (cacheDirPath == null) {
            w3Var2.getLogger().g(g3Var2, "Cache dir path is null, the ANR marker will not be written", new Object[0]);
            return;
        }
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(new File(cacheDirPath, "last_anr_report"));
            try {
                fileOutputStream.write(String.valueOf(lValueOf).getBytes(b.f67156g));
                fileOutputStream.flush();
                fileOutputStream.close();
            } finally {
            }
        } catch (Throwable th3) {
            w3Var2.getLogger().e(g3.ERROR, "Error writing the ANR marker to the disk", th3);
        }
    }
}
