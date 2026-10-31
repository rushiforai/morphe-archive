package io.branch.search.internal;

import java.util.Collections;
import java.util.Set;
import java.util.regex.Pattern;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.q4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3329q4 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Set<String> f65530a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public static final x80.a0 f65531b;

    static {
        Set<String> setUnmodifiableSet = Collections.unmodifiableSet(kotlin.collections.c.f1(new String[]{"X-Branch-Encryption", "X-Branch-IV", "X-Branch-API-Call-Size", "X-Branch-Retry", "X-Branch-Analytics-Payload"}));
        Intrinsics.f(setUnmodifiableSet, "unmodifiableSet(\n       …_RESULT,\n        ),\n    )");
        f65530a = setUnmodifiableSet;
        Pattern pattern = x80.a0.f95396e;
        f65531b = x80.z.b("application/json; charset=utf-8");
    }
}
