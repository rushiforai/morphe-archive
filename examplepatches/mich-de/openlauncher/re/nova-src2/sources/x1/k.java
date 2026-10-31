package x1;

import android.util.Log;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import p1.t;

/* loaded from: classes2.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public static final StackTraceElement[] f94961a = new StackTraceElement[0];

    public static final int a(Object obj) {
        return System.identityHashCode(obj);
    }

    public static final void b(t tVar, Function2 function2) {
        Intrinsics.e(function2, "null cannot be cast to non-null type kotlin.Function2<androidx.compose.runtime.Composer, kotlin.Int, kotlin.Unit>");
        TypeIntrinsics.e(2, function2);
        function2.invoke(tVar, 1);
    }

    public static final void c(String str, Throwable th2) {
        Log.e("ComposeInternal", str, th2);
    }
}
