package io.branch.search.internal;

import io.branch.search.internal.InterfaceC3432w6;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.y6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public abstract class AbstractC3466y6<T extends InterfaceC3432w6> implements InterfaceC3325q0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f66310a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f66311b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f66312c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f66313d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final T f66314e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final AtomicInteger f66315f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap<Integer, Map<String, String>> f66316g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap<Integer, C3364s6> f66317h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap<Integer, String> f66318i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final CopyOnWriteArrayList<InterfaceC3415v6> f66319j;

    public /* synthetic */ AbstractC3466y6(String str, String str2, String str3, String str4, InterfaceC3432w6 interfaceC3432w6) {
        this(str, str2, str3, str4, interfaceC3432w6, new AtomicInteger(0));
    }

    @NotNull
    public final String a() {
        return this.f66313d;
    }

    public final void a(@NotNull C3364s6 data) {
        Intrinsics.g(data, "data");
        int i5 = data.f65743b;
        synchronized (this.f66317h) {
            this.f66317h.put(Integer.valueOf(i5), data);
            Unit unit = Unit.f71706a;
        }
    }

    public AbstractC3466y6(@NotNull String api, @NotNull String callerId, @NotNull String sessionId, @NotNull String requestId, @NotNull T requestData, @NotNull AtomicInteger resultIdSeed) {
        Intrinsics.g(api, "api");
        Intrinsics.g(callerId, "callerId");
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(requestData, "requestData");
        Intrinsics.g(resultIdSeed, "resultIdSeed");
        this.f66310a = api;
        this.f66311b = callerId;
        this.f66312c = sessionId;
        this.f66313d = requestId;
        this.f66314e = requestData;
        this.f66315f = resultIdSeed;
        this.f66316g = new ConcurrentHashMap<>();
        this.f66317h = new ConcurrentHashMap<>();
        this.f66318i = new ConcurrentHashMap<>();
        this.f66319j = new CopyOnWriteArrayList<>();
    }

    @Override // io.branch.search.internal.InterfaceC3325q0
    public final void a(@NotNull String cause, int i5) {
        Intrinsics.g(cause, "cause");
        synchronized (this.f66318i) {
            this.f66318i.put(Integer.valueOf(i5), cause);
            Unit unit = Unit.f71706a;
        }
    }
}
