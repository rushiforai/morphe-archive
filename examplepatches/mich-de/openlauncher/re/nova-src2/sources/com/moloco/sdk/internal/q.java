package com.moloco.sdk.internal;

import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonBuilder;
import kotlinx.serialization.json.JsonKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Lazy f37556a = LazyKt.a(new com.instabridge.ai.tools.a(19));

    public static final Json a() {
        return JsonKt.Json$default(null, new com.instabridge.mobilesdk.internal.data.api.a(9), 1, null);
    }

    @NotNull
    public static final Json b() {
        return c();
    }

    public static final Json c() {
        return (Json) f37556a.getValue();
    }

    public static final Unit a(JsonBuilder Json) {
        Intrinsics.g(Json, "$this$Json");
        Json.setLenient(true);
        Json.setIgnoreUnknownKeys(true);
        return Unit.f71706a;
    }
}
