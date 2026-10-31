package com.moloco.sdk.acm.http;

import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: b, reason: collision with root package name */
    public static c50.e f36129b;

    /* renamed from: c, reason: collision with root package name */
    public static String f36130c;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final b f36128a = new b();

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final Lazy f36131d = LazyKt.a(new com.instabridge.ai.tools.a(5));

    public static final f b() {
        c50.e eVar = f36129b;
        if (eVar == null) {
            Intrinsics.m("httpClient");
            throw null;
        }
        String str = f36130c;
        if (str != null) {
            return new f(eVar, str);
        }
        Intrinsics.m("apiUrl");
        throw null;
    }

    public final void a(@NotNull c50.e httpClient, @NotNull String apiUrl) {
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(apiUrl, "apiUrl");
        if (f36129b == null) {
            f36129b = httpClient;
            f36130c = apiUrl;
        }
    }

    @NotNull
    public final e a() {
        return (e) f36131d.getValue();
    }
}
