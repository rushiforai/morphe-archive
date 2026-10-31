package io.sentry;

import java.util.concurrent.ThreadFactory;

/* loaded from: classes4.dex */
public final class y implements ThreadFactory {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f67910a;

    /* renamed from: b, reason: collision with root package name */
    public int f67911b;

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        switch (this.f67910a) {
            case 0:
                StringBuilder sb2 = new StringBuilder("SentryHostnameCache-");
                int i5 = this.f67911b;
                this.f67911b = i5 + 1;
                sb2.append(i5);
                Thread thread = new Thread(runnable, sb2.toString());
                thread.setDaemon(true);
                return thread;
            case 1:
                StringBuilder sb3 = new StringBuilder("SentryExecutorServiceThreadFactory-");
                int i11 = this.f67911b;
                this.f67911b = i11 + 1;
                sb3.append(i11);
                Thread thread2 = new Thread(runnable, sb3.toString());
                thread2.setDaemon(true);
                return thread2;
            default:
                StringBuilder sb4 = new StringBuilder("SentryAsyncConnection-");
                int i12 = this.f67911b;
                this.f67911b = i12 + 1;
                sb4.append(i12);
                Thread thread3 = new Thread(runnable, sb4.toString());
                thread3.setDaemon(true);
                return thread3;
        }
    }
}
