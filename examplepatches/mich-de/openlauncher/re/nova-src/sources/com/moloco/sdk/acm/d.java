package com.moloco.sdk.acm;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class d {
    @NotNull
    public static final String a(@NotNull EventTag eventTag) {
        Intrinsics.g(eventTag, "<this>");
        return eventTag.getKey() + AbstractJsonLexerKt.COLON + eventTag.getValue();
    }
}
