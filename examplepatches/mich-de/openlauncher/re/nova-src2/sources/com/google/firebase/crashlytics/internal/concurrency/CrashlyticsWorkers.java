package com.google.firebase.crashlytics.internal.concurrency;

import a1.m;
import android.os.Looper;
import com.google.firebase.crashlytics.internal.Logger;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import java.util.concurrent.ExecutorService;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\u0018\u0000 \f2\u00020\u0001:\u0001\fB\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u0010\u0010\u0007\u001a\u00020\b8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u00020\b8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u00020\b8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u00020\b8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000¨\u0006\r"}, d2 = {"Lcom/google/firebase/crashlytics/internal/concurrency/CrashlyticsWorkers;", b.f42142b, "backgroundExecutorService", "Ljava/util/concurrent/ExecutorService;", "blockingExecutorService", "<init>", "(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ExecutorService;)V", "common", "Lcom/google/firebase/crashlytics/internal/concurrency/CrashlyticsWorker;", "diskWrite", "dataCollect", "network", k.O, "com.google.firebase-firebase-crashlytics"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final class CrashlyticsWorkers {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private static boolean enforcement;

    @JvmField
    @NotNull
    public final CrashlyticsWorker common;

    @JvmField
    @NotNull
    public final CrashlyticsWorker dataCollect;

    @JvmField
    @NotNull
    public final CrashlyticsWorker diskWrite;

    @JvmField
    @NotNull
    public final CrashlyticsWorker network;

    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\b\u0010\u0010\u001a\u00020\u0011H\u0007J\b\u0010\u0012\u001a\u00020\u0011H\u0007J\b\u0010\u0013\u001a\u00020\u0011H\u0007J\b\u0010\u0014\u001a\u00020\nH\u0002J\b\u0010\u0015\u001a\u00020\nH\u0002J\b\u0010\u0016\u001a\u00020\nH\u0002J$\u0010\u0017\u001a\u00020\u00112\f\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\n0\u00192\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00050\u0019H\u0002R\u001c\u0010\u0004\u001a\n \u0006*\u0004\u0018\u00010\u00050\u00058BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR$\u0010\t\u001a\u00020\n8\u0006@\u0006X\u0087\u000e¢\u0006\u0014\n\u0000\u0012\u0004\b\u000b\u0010\u0003\u001a\u0004\b\f\u0010\r\"\u0004\b\u000e\u0010\u000f¨\u0006\u001b"}, d2 = {"Lcom/google/firebase/crashlytics/internal/concurrency/CrashlyticsWorkers$Companion;", b.f42142b, "<init>", "()V", "threadName", b.f42142b, "kotlin.jvm.PlatformType", "getThreadName", "()Ljava/lang/String;", "enforcement", b.f42142b, "getEnforcement$annotations", "getEnforcement", "()Z", "setEnforcement", "(Z)V", "checkNotMainThread", b.f42142b, "checkBlockingThread", "checkBackgroundThread", "isNotMainThread", "isBlockingThread", "isBackgroundThread", "checkThread", "isCorrectThread", "Lkotlin/Function0;", "failureMessage", "com.google.firebase-firebase-crashlytics"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final String checkBackgroundThread$lambda$2() {
            return c1.t(new StringBuilder("Must be called on a background thread, was called on "), CrashlyticsWorkers.INSTANCE.getThreadName(), '.');
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final String checkBlockingThread$lambda$1() {
            return c1.t(new StringBuilder("Must be called on a blocking thread, was called on "), CrashlyticsWorkers.INSTANCE.getThreadName(), '.');
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final String checkNotMainThread$lambda$0() {
            return c1.t(new StringBuilder("Must not be called on a main thread, was called on "), CrashlyticsWorkers.INSTANCE.getThreadName(), '.');
        }

        private final void checkThread(Function0<Boolean> isCorrectThread, Function0<String> failureMessage) {
            if (((Boolean) isCorrectThread.invoke()).booleanValue()) {
                return;
            }
            Logger.getLogger().d((String) failureMessage.invoke());
            getEnforcement();
        }

        @JvmStatic
        public static /* synthetic */ void getEnforcement$annotations() {
        }

        private final String getThreadName() {
            return Thread.currentThread().getName();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final boolean isBackgroundThread() {
            String threadName = getThreadName();
            Intrinsics.f(threadName, "<get-threadName>(...)");
            return r70.k.K0(threadName, "Firebase Background Thread #", false);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final boolean isBlockingThread() {
            String threadName = getThreadName();
            Intrinsics.f(threadName, "<get-threadName>(...)");
            return r70.k.K0(threadName, "Firebase Blocking Thread #", false);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final boolean isNotMainThread() {
            return !Looper.getMainLooper().isCurrentThread();
        }

        @JvmStatic
        public final void checkBackgroundThread() {
            checkThread(new CrashlyticsWorkers$Companion$checkBackgroundThread$1(this), new a2.k(4));
        }

        @JvmStatic
        public final void checkBlockingThread() {
            checkThread(new CrashlyticsWorkers$Companion$checkBlockingThread$1(this), new m(27));
        }

        @JvmStatic
        public final void checkNotMainThread() {
            checkThread(new CrashlyticsWorkers$Companion$checkNotMainThread$1(this), new a2.k(5));
        }

        public final boolean getEnforcement() {
            return CrashlyticsWorkers.enforcement;
        }

        public final void setEnforcement(boolean z11) {
            CrashlyticsWorkers.enforcement = z11;
        }

        private Companion() {
        }
    }

    public CrashlyticsWorkers(@NotNull ExecutorService backgroundExecutorService, @NotNull ExecutorService blockingExecutorService) {
        Intrinsics.g(backgroundExecutorService, "backgroundExecutorService");
        Intrinsics.g(blockingExecutorService, "blockingExecutorService");
        this.common = new CrashlyticsWorker(backgroundExecutorService);
        this.diskWrite = new CrashlyticsWorker(backgroundExecutorService);
        this.dataCollect = new CrashlyticsWorker(backgroundExecutorService);
        this.network = new CrashlyticsWorker(blockingExecutorService);
    }

    @JvmStatic
    public static final void checkBackgroundThread() {
        INSTANCE.checkBackgroundThread();
    }

    @JvmStatic
    public static final void checkBlockingThread() {
        INSTANCE.checkBlockingThread();
    }

    @JvmStatic
    public static final void checkNotMainThread() {
        INSTANCE.checkNotMainThread();
    }

    public static final boolean getEnforcement() {
        return INSTANCE.getEnforcement();
    }

    public static final void setEnforcement(boolean z11) {
        INSTANCE.setEnforcement(z11);
    }
}
