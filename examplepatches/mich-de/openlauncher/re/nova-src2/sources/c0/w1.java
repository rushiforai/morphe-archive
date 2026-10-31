package c0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public interface w1 {
    Object a();

    Object b();

    default boolean c(Object obj, Object obj2) {
        return Intrinsics.b(obj, b()) && obj2.equals(a());
    }
}
