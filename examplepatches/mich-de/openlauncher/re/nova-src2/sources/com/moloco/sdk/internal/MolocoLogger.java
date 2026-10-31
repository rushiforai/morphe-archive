package com.moloco.sdk.internal;

import android.content.pm.PackageManager;
import android.text.TextUtils;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;
import java.util.LinkedHashSet;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0003\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\bÇ\u0002\u0018\u00002\u00020\u0001:\u0005:;<=>B\t\b\u0003¢\u0006\u0004\b\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007¢\u0006\u0004\b\u0007\u0010\bJ\u0017\u0010\t\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007¢\u0006\u0004\b\t\u0010\bJ\u001f\u0010\r\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\nH\u0002¢\u0006\u0004\b\r\u0010\u000eJ\u0013\u0010\u000f\u001a\u00020\n*\u00020\nH\u0002¢\u0006\u0004\b\u000f\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\n*\u00020\nH\u0002¢\u0006\u0004\b\u0011\u0010\u0010J\u001d\u0010\u0015\u001a\u00020\u00132\f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00130\u0012H\u0002¢\u0006\u0004\b\u0015\u0010\u0016J)\u0010\u0019\u001a\u00020\u00062\b\b\u0002\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\n2\b\b\u0002\u0010\u0018\u001a\u00020\u0017¢\u0006\u0004\b\u0019\u0010\u001aJ)\u0010\u001b\u001a\u00020\u00062\b\b\u0002\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\n2\b\b\u0002\u0010\u0018\u001a\u00020\u0017¢\u0006\u0004\b\u001b\u0010\u001aJ5\u0010\u001e\u001a\u00020\u00062\b\b\u0002\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\n2\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c2\b\b\u0002\u0010\u0018\u001a\u00020\u0017¢\u0006\u0004\b\u001e\u0010\u001fJ5\u0010 \u001a\u00020\u00062\b\b\u0002\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\n2\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c2\b\b\u0002\u0010\u0018\u001a\u00020\u0017¢\u0006\u0004\b \u0010\u001fJ5\u0010!\u001a\u00020\u00062\b\b\u0002\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\n2\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c2\b\b\u0002\u0010\u0018\u001a\u00020\u0017¢\u0006\u0004\b!\u0010\u001fJ!\u0010#\u001a\u00020\u00062\u0006\u0010\f\u001a\u00020\n2\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010\u001c¢\u0006\u0004\b#\u0010$J\r\u0010%\u001a\u00020\n¢\u0006\u0004\b%\u0010&J\u0017\u0010+\u001a\u00020\u00062\u0006\u0010(\u001a\u00020'H\u0001¢\u0006\u0004\b)\u0010*R\u0014\u0010,\u001a\u00020\n8\u0002X\u0082T¢\u0006\u0006\n\u0004\b,\u0010-R\u0016\u0010(\u001a\u00020'8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b(\u0010.R$\u00101\u001a\u0012\u0012\u0004\u0012\u00020\u00040/j\b\u0012\u0004\u0012\u00020\u0004`08\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b1\u00102R*\u00109\u001a\u00020\u00172\u0006\u00103\u001a\u00020\u00178F@FX\u0087\u000e¢\u0006\u0012\u0012\u0004\b8\u0010\u0003\u001a\u0004\b4\u00105\"\u0004\b6\u00107¨\u0006?"}, d2 = {"Lcom/moloco/sdk/internal/MolocoLogger;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Lcom/moloco/sdk/internal/MolocoLogger$LoggerListener;", "loggerListener", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "addListener", "(Lcom/moloco/sdk/internal/MolocoLogger$LoggerListener;)V", "removeListener", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "tag", "msg", "fireListeners", "(Ljava/lang/String;Ljava/lang/String;)V", "prefixWithMolocoName", "(Ljava/lang/String;)Ljava/lang/String;", "prefixWithMethodName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Ljava/lang/StackTraceElement;", "stackTraceArray", "findMostRelevantStackTrace", "([Ljava/lang/StackTraceElement;)Ljava/lang/StackTraceElement;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "forceLogging", "debug", "(Ljava/lang/String;Ljava/lang/String;Z)V", "debugBuildLog", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "exception", "info", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Z)V", "warn", "error", "throwable", "tlog", "(Ljava/lang/String;Ljava/lang/Throwable;)V", "getCallingMethodName", "()Ljava/lang/String;", "Lcom/moloco/sdk/internal/MolocoLogger$c;", "configuration", "setConfiguration$moloco_sdk_release", "(Lcom/moloco/sdk/internal/MolocoLogger$c;)V", "setConfiguration", "MOLOCO_TAG", "Ljava/lang/String;", "Lcom/moloco/sdk/internal/MolocoLogger$c;", "Ljava/util/LinkedHashSet;", "Lkotlin/collections/LinkedHashSet;", "listeners", "Ljava/util/LinkedHashSet;", "value", "getLogEnabled", "()Z", "setLogEnabled", "(Z)V", "getLogEnabled$annotations", "logEnabled", "LoggerListener", "c", "d", "a", "b", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
@SourceDebugExtension
/* loaded from: classes.dex */
public final class MolocoLogger {

    @NotNull
    private static final String MOLOCO_TAG = "Moloco";

    @NotNull
    public static final MolocoLogger INSTANCE = new MolocoLogger();

    @NotNull
    private static c configuration = new d(new b());

    @NotNull
    private static final LinkedHashSet<LoggerListener> listeners = new LinkedHashSet<>();
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\bf\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0005H&¨\u0006\u0007"}, d2 = {"Lcom/moloco/sdk/internal/MolocoLogger$LoggerListener;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onLog", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "tag", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "msg", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
    /* loaded from: classes4.dex */
    public interface LoggerListener {
        void onLog(@NotNull String tag, @NotNull String msg);
    }

    public interface a {
        void a(boolean z11);

        boolean a();
    }

    public static final class b implements a {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final a f36206b = new a(null);

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final String f36207c = "debug.moloco.internal_logging";

        /* renamed from: a, reason: collision with root package name */
        public boolean f36208a;

        public static final class a {
            public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
                this();
            }

            public a() {
            }
        }

        public b() {
            final a7.f fVar = new a7.f(this, 6);
            new Thread() { // from class: kotlin.concurrent.ThreadsKt$thread$thread$1
                @Override // java.lang.Thread, java.lang.Runnable
                public final void run() throws InterruptedException, PackageManager.NameNotFoundException {
                    fVar.invoke();
                }
            }.start();
        }

        @Override // com.moloco.sdk.internal.MolocoLogger.a
        public boolean a() {
            return this.f36208a;
        }

        public final boolean b() {
            return Boolean.parseBoolean(a(f36207c));
        }

        @Override // com.moloco.sdk.internal.MolocoLogger.a
        public void a(boolean z11) {
            this.f36208a = z11;
        }

        public static final Unit a(b bVar) {
            bVar.a(bVar.b());
            return Unit.f71706a;
        }

        public final String a(String str) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
            try {
                Object objInvoke = Class.forName("android.os.SystemProperties").getMethod("get", String.class).invoke(null, str);
                Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.String");
                String str2 = (String) objInvoke;
                try {
                    if (TextUtils.isEmpty(str2)) {
                        return null;
                    }
                    return str2;
                } catch (Exception unused) {
                    return str2;
                }
            } catch (Exception unused2) {
                return null;
            }
        }
    }

    public interface c {
        void a(boolean z11);

        boolean a();

        boolean b();

        boolean c();
    }

    public static final class d implements c {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final a f36209a;

        /* renamed from: b, reason: collision with root package name */
        public boolean f36210b;

        public d(@NotNull a adb) {
            Intrinsics.g(adb, "adb");
            this.f36209a = adb;
        }

        @Override // com.moloco.sdk.internal.MolocoLogger.c
        public boolean a() {
            return this.f36209a.a();
        }

        @Override // com.moloco.sdk.internal.MolocoLogger.c
        public boolean b() {
            return this.f36210b;
        }

        @Override // com.moloco.sdk.internal.MolocoLogger.c
        public boolean c() {
            return false;
        }

        @Override // com.moloco.sdk.internal.MolocoLogger.c
        public void a(boolean z11) {
            this.f36210b = z11;
        }
    }

    private MolocoLogger() {
    }

    @JvmStatic
    public static final void addListener(@NotNull LoggerListener loggerListener) {
        Intrinsics.g(loggerListener, "loggerListener");
        listeners.add(loggerListener);
    }

    public static /* synthetic */ void debug$default(MolocoLogger molocoLogger, String str, String str2, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = MOLOCO_TAG;
        }
        if ((i5 & 4) != 0) {
            z11 = false;
        }
        molocoLogger.debug(str, str2, z11);
    }

    public static /* synthetic */ void debugBuildLog$default(MolocoLogger molocoLogger, String str, String str2, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = MOLOCO_TAG;
        }
        if ((i5 & 4) != 0) {
            z11 = false;
        }
        molocoLogger.debugBuildLog(str, str2, z11);
    }

    public static /* synthetic */ void error$default(MolocoLogger molocoLogger, String str, String str2, Throwable th2, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = MOLOCO_TAG;
        }
        if ((i5 & 4) != 0) {
            th2 = null;
        }
        if ((i5 & 8) != 0) {
            z11 = false;
        }
        molocoLogger.error(str, str2, th2, z11);
    }

    private final StackTraceElement findMostRelevantStackTrace(StackTraceElement[] stackTraceArray) {
        for (StackTraceElement stackTraceElement : stackTraceArray) {
            if (!Intrinsics.b(stackTraceElement.getClassName(), INSTANCE.getClass().getCanonicalName())) {
                return stackTraceElement;
            }
        }
        return (StackTraceElement) kotlin.collections.c.x0(stackTraceArray);
    }

    private final void fireListeners(String tag, String msg) {
        Iterator<T> it = listeners.iterator();
        while (it.hasNext()) {
            ((LoggerListener) it.next()).onLog(INSTANCE.prefixWithMolocoName(tag), msg);
        }
    }

    public static final boolean getLogEnabled() {
        c cVar = configuration;
        return cVar.c() || cVar.a() || cVar.b();
    }

    @JvmStatic
    public static /* synthetic */ void getLogEnabled$annotations() {
    }

    public static /* synthetic */ void info$default(MolocoLogger molocoLogger, String str, String str2, Throwable th2, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = MOLOCO_TAG;
        }
        if ((i5 & 4) != 0) {
            th2 = null;
        }
        if ((i5 & 8) != 0) {
            z11 = false;
        }
        molocoLogger.info(str, str2, th2, z11);
    }

    private final String prefixWithMethodName(String str) {
        try {
            return "[" + getCallingMethodName() + "] " + str;
        } catch (Throwable unused) {
            return str;
        }
    }

    private final String prefixWithMolocoName(String str) {
        return r70.j.I0(str, MOLOCO_TAG, false) ? str : MOLOCO_TAG.concat(str);
    }

    @JvmStatic
    public static final void removeListener(@NotNull LoggerListener loggerListener) {
        Intrinsics.g(loggerListener, "loggerListener");
        listeners.remove(loggerListener);
    }

    public static final void setLogEnabled(boolean z11) {
        configuration.a(z11);
    }

    public static /* synthetic */ void tlog$default(MolocoLogger molocoLogger, String str, Throwable th2, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            th2 = null;
        }
        molocoLogger.tlog(str, th2);
    }

    public static /* synthetic */ void warn$default(MolocoLogger molocoLogger, String str, String str2, Throwable th2, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = MOLOCO_TAG;
        }
        if ((i5 & 4) != 0) {
            th2 = null;
        }
        if ((i5 & 8) != 0) {
            z11 = false;
        }
        molocoLogger.warn(str, str2, th2, z11);
    }

    public final void debug(@NotNull String tag, @NotNull String msg, boolean forceLogging) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(msg, "msg");
        if (getLogEnabled() || forceLogging) {
            fireListeners(prefixWithMolocoName(tag), prefixWithMethodName(msg));
        }
    }

    public final void debugBuildLog(@NotNull String tag, @NotNull String msg, boolean forceLogging) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(msg, "msg");
    }

    public final void error(@NotNull String tag, @NotNull String msg, @Nullable Throwable exception, boolean forceLogging) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(msg, "msg");
        if (getLogEnabled() || forceLogging) {
            String strPrefixWithMolocoName = prefixWithMolocoName(tag);
            String strPrefixWithMethodName = prefixWithMethodName(msg);
            Log.e(strPrefixWithMolocoName, strPrefixWithMethodName, exception);
            fireListeners(strPrefixWithMolocoName, strPrefixWithMethodName);
        }
    }

    @NotNull
    public final String getCallingMethodName() throws ClassNotFoundException {
        StackTraceElement[] stackTrace = new Throwable().getStackTrace();
        Intrinsics.f(stackTrace, "getStackTrace(...)");
        StackTraceElement stackTraceElementFindMostRelevantStackTrace = findMostRelevantStackTrace(stackTrace);
        Class.forName(stackTraceElementFindMostRelevantStackTrace.getClassName());
        String methodName = stackTraceElementFindMostRelevantStackTrace.getMethodName();
        if (Intrinsics.b(methodName, "invokeSuspend")) {
            String className = stackTraceElementFindMostRelevantStackTrace.getClassName();
            Intrinsics.f(className, "getClassName(...)");
            String strB1 = r70.k.b1(className, "$1");
            methodName = r70.k.o1(strB1, "$", strB1);
        }
        Intrinsics.f(methodName, "let(...)");
        return methodName;
    }

    public final void info(@NotNull String tag, @NotNull String msg, @Nullable Throwable exception, boolean forceLogging) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(msg, "msg");
        if (getLogEnabled() || forceLogging) {
            String strPrefixWithMolocoName = prefixWithMolocoName(tag);
            String strPrefixWithMethodName = prefixWithMethodName(msg);
            Log.i(strPrefixWithMolocoName, strPrefixWithMethodName, exception);
            fireListeners(strPrefixWithMolocoName, strPrefixWithMethodName);
        }
    }

    public final void setConfiguration$moloco_sdk_release(@NotNull c configuration2) {
        Intrinsics.g(configuration2, "configuration");
        configuration = configuration2;
    }

    public final void tlog(@NotNull String msg, @Nullable Throwable throwable) {
        Intrinsics.g(msg, "msg");
        Log.i("==tlog==", prefixWithMethodName(msg), throwable);
    }

    public final void warn(@NotNull String tag, @NotNull String msg, @Nullable Throwable exception, boolean forceLogging) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(msg, "msg");
        if (getLogEnabled() || forceLogging) {
            String strPrefixWithMolocoName = prefixWithMolocoName(tag);
            String strPrefixWithMethodName = prefixWithMethodName(msg);
            Log.w(strPrefixWithMolocoName, strPrefixWithMethodName, exception);
            fireListeners(strPrefixWithMolocoName, strPrefixWithMethodName);
        }
    }
}
