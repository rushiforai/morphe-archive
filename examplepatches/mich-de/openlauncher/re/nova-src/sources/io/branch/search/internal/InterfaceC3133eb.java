package io.branch.search.internal;

import android.annotation.SuppressLint;
import android.app.Application;
import android.os.Build;
import java.lang.reflect.InvocationTargetException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.eb, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3133eb {

    /* renamed from: io.branch.search.internal.eb$a */
    public static final class a {
        @SuppressLint({"PrivateApi", "DiscouragedPrivateApi"})
        @NotNull
        public static String a() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
            if (Build.VERSION.SDK_INT >= 28) {
                String processName = Application.getProcessName();
                Intrinsics.f(processName, "{\n            Applicatio…etProcessName()\n        }");
                return processName;
            }
            Object objInvoke = Class.forName("android.app.ActivityThread").getDeclaredMethod("currentProcessName", null).invoke(null, null);
            Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.String");
            return (String) objInvoke;
        }
    }

    boolean a();

    boolean b();

    boolean c();

    boolean d();

    @SuppressLint({"PrivateApi", "DiscouragedPrivateApi"})
    @NotNull
    String e();

    boolean f();
}
