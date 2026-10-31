package com.moloco.sdk.internal.ortb;

import com.moloco.sdk.internal.q;
import kotlin.Lazy;
import kotlin.LazyKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Lazy f36621a = LazyKt.a(new com.instabridge.ai.tools.a(10));

    @NotNull
    public static final b a() {
        return c();
    }

    public static final c b() {
        return new c(q.b());
    }

    public static final b c() {
        return (b) f36621a.getValue();
    }
}
