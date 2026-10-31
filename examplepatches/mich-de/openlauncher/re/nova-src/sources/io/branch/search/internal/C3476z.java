package io.branch.search.internal;

import java.util.Collection;
import kotlin.Pair;
import kotlin.Result;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.z, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3476z {
    @NotNull
    public static final Pair<Boolean, String> a(@NotNull Object obj) {
        int i5 = Result.f71687b;
        boolean z11 = obj instanceof Result.Failure;
        boolean z12 = !z11;
        if (!z11) {
            Collection collection = (Collection) (z11 ? null : obj);
            if (collection == null || collection.isEmpty()) {
                return new Pair<>(Boolean.FALSE, "NoResult");
            }
        }
        Boolean boolValueOf = Boolean.valueOf(z12);
        Throwable thA = Result.a(obj);
        return new Pair<>(boolValueOf, thA != null ? thA.getClass().getSimpleName() : null);
    }
}
