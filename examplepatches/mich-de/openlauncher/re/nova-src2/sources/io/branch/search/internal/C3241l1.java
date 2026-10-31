package io.branch.search.internal;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.l1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3241l1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64943a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f64944b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f64945c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final C3174h1 f64946d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final String f64947e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final String f64948f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final AtomicInteger f64949g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f64950h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final C3157g1 f64951i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap<Integer, C3072b1> f64952j;

    public C3241l1(@NotNull String callerId, @NotNull String sessionId, @NotNull C3174h1 requestData, @NotNull String query, @NotNull String requestId, @NotNull AtomicInteger resultIdSeed, boolean z11) {
        Intrinsics.g(callerId, "callerId");
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(requestData, "requestData");
        Intrinsics.g(query, "query");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(resultIdSeed, "resultIdSeed");
        this.f64943a = "autosuggest";
        this.f64944b = callerId;
        this.f64945c = sessionId;
        this.f64946d = requestData;
        this.f64947e = query;
        this.f64948f = requestId;
        this.f64949g = resultIdSeed;
        this.f64950h = z11;
        this.f64951i = new C3157g1(ul.b.P("auto_suggestions"));
        this.f64952j = new ConcurrentHashMap<>();
    }
}
