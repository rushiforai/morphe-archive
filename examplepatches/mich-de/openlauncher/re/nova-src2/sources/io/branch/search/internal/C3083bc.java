package io.branch.search.internal;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.bc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3083bc {
    public static final Object a(@NotNull C3178h5 c3178h5, @NotNull Function1 func) {
        Intrinsics.g(c3178h5, "<this>");
        Intrinsics.g(func, "func");
        try {
            c3178h5.f64647a.beginTransaction();
            Object objInvoke = func.invoke(c3178h5);
            c3178h5.f64647a.setTransactionSuccessful();
            return objInvoke;
        } finally {
        }
    }
}
