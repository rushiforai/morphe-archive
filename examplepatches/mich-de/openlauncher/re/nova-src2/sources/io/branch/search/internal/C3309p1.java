package io.branch.search.internal;

import io.branch.search.internal.AbstractC3080b9;
import java.util.Set;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.p1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3309p1 {

    /* renamed from: b, reason: collision with root package name */
    public static volatile boolean f65466b;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final C3309p1 f65465a = new C3309p1();

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static volatile InterfaceC3148f9 f65467c = new M5();

    @NotNull
    public static String a(@NotNull String tag, boolean z11) {
        String str;
        Intrinsics.g(tag, "tag");
        if (z11) {
            Set<String> set = C3326q1.f65496a;
            StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
            int length = stackTrace.length;
            int i5 = 1;
            while (true) {
                if (i5 >= length) {
                    str = null;
                    break;
                }
                StackTraceElement stackTraceElement = stackTrace[i5];
                Intrinsics.f(stackTraceElement, "stElements[i]");
                String methodName = stackTraceElement.getMethodName();
                Intrinsics.f(methodName, "ste.methodName");
                if (!r70.j.A0(methodName, "getCallerName", false) && !C3326q1.f65496a.contains(stackTraceElement.getClassName())) {
                    String className = stackTraceElement.getClassName();
                    Intrinsics.f(className, "ste.className");
                    if (r70.k.S0(className, "java.lang.Thread", 0, false, 6) != 0) {
                        str = stackTraceElement.getClassName() + "::" + stackTraceElement.getMethodName() + '(' + stackTraceElement.getLineNumber() + ')';
                        break;
                    }
                }
                i5++;
            }
            if (str != null) {
                return str;
            }
        }
        return tag;
    }

    @JvmStatic
    public static final void b(@NotNull EnumC3131e9 logTag, @NotNull String msg) {
        Intrinsics.g(logTag, "logTag");
        Intrinsics.g(msg, "msg");
        a(a50.b.f403d, logTag.f64390a, msg, (Throwable) null);
    }

    @JvmStatic
    public static final void c(@NotNull EnumC3131e9 logTag, @NotNull String msg) {
        Intrinsics.g(logTag, "logTag");
        Intrinsics.g(msg, "msg");
        a(a50.b.f401b, logTag.f64390a, msg, (Throwable) null);
    }

    @JvmStatic
    public static final void d(@NotNull EnumC3131e9 logTag, @NotNull String msg) {
        Intrinsics.g(logTag, "logTag");
        Intrinsics.g(msg, "msg");
        a(a50.b.f402c, logTag.f64390a, msg, (Throwable) null);
    }

    @JvmStatic
    public static final void b(@NotNull EnumC3131e9 logTag, @NotNull String msg, @NotNull Throwable cause) {
        Intrinsics.g(logTag, "logTag");
        Intrinsics.g(msg, "msg");
        Intrinsics.g(cause, "cause");
        a(a50.b.f401b, logTag.f64390a, msg, cause);
    }

    @JvmStatic
    public static final void b(@NotNull String msg) {
        Intrinsics.g(msg, "msg");
        a(a50.b.f401b, "BranchSearchSDK", msg, (Throwable) null);
    }

    @JvmStatic
    public static final void b(@NotNull String tag, @NotNull String msg) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(msg, "msg");
        a(a50.b.f401b, tag, msg, (Throwable) null);
    }

    @JvmStatic
    public static final void a(@NotNull EnumC3131e9 logTag, @NotNull String msg) {
        Intrinsics.g(logTag, "logTag");
        Intrinsics.g(msg, "msg");
        a(a50.b.f400a, logTag.f64390a, msg, (Throwable) null);
    }

    public static void b(String tag, Function0 msg) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(msg, "msg");
        a(a50.b.f401b, tag, (Function0<String>) msg, (Throwable) null);
    }

    @JvmStatic
    @JvmOverloads
    public static final void a(@NotNull EnumC3131e9 logTag, @Nullable Throwable th2, @NotNull Function0<String> msg) {
        Intrinsics.g(logTag, "logTag");
        Intrinsics.g(msg, "msg");
        a(a50.b.f400a, logTag.f64390a, msg, th2);
    }

    @JvmStatic
    public static final void a(@NotNull String msg) {
        Intrinsics.g(msg, "msg");
        a(a50.b.f400a, "BranchSearchSDK", msg, (Throwable) null);
    }

    @JvmStatic
    public static final void a(@NotNull String tag, @NotNull String msg) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(msg, "msg");
        a(a50.b.f400a, tag, msg, (Throwable) null);
    }

    public static void a(String tag, Function0 msg) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(msg, "msg");
        a(a50.b.f400a, tag, (Function0<String>) msg, (Throwable) null);
    }

    @JvmStatic
    public static final void a(@NotNull EnumC3131e9 logTag, @NotNull String msg, @NotNull Throwable cause) {
        Intrinsics.g(logTag, "logTag");
        Intrinsics.g(msg, "msg");
        Intrinsics.g(cause, "cause");
        a(a50.b.f403d, logTag.f64390a, msg, cause);
    }

    @JvmStatic
    public static final void a(@NotNull EnumC3131e9 logTag, @NotNull Throwable cause) {
        Intrinsics.g(logTag, "logTag");
        Intrinsics.g(cause, "cause");
        a(a50.b.f403d, logTag.f64390a, (String) null, cause);
    }

    @JvmStatic
    public static final void a(@NotNull String tag, @NotNull Throwable cause, @NotNull String msg) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(msg, "msg");
        Intrinsics.g(cause, "cause");
        a(a50.b.f403d, tag, msg, cause);
    }

    public static void a(EnumC3131e9 logTag, Function0 msg) {
        Intrinsics.g(logTag, "logTag");
        Intrinsics.g(msg, "msg");
        a(a50.b.f401b, logTag.f64390a, (Function0<String>) msg, (Throwable) null);
    }

    @JvmStatic
    public static final void a(a50.b level, String str, String str2, Throwable th2) {
        f65465a.getClass();
        InterfaceC3148f9 interfaceC3148f9 = f65467c;
        AbstractC3080b9.a aVar = AbstractC3080b9.Companion;
        String tag = a(str, f65466b);
        aVar.getClass();
        Intrinsics.g(level, "level");
        Intrinsics.g(tag, "tag");
        interfaceC3148f9.a(new C3097c9(level, tag, str2, th2));
    }

    @JvmStatic
    public static final void a(a50.b level, String str, Function0<String> function0, Throwable th2) {
        f65465a.getClass();
        InterfaceC3148f9 interfaceC3148f9 = f65467c;
        AbstractC3080b9.a aVar = AbstractC3080b9.Companion;
        String tag = a(str, f65466b);
        aVar.getClass();
        Intrinsics.g(level, "level");
        Intrinsics.g(tag, "tag");
        interfaceC3148f9.a(new C3114d9(level, tag, function0, th2));
    }
}
