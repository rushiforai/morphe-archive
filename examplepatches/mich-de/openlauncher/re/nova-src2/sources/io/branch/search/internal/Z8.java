package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Z8 {
    @NotNull
    public static final String a(@NotNull AbstractC3080b9 abstractC3080b9) {
        Intrinsics.g(abstractC3080b9, "<this>");
        return abstractC3080b9.f64020b + AbstractJsonLexerKt.COLON + Thread.currentThread();
    }
}
