package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class E {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final H6 f62374a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final H6 f62375b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final H6 f62376c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final H6 f62377d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final H6 f62378e;

    public E() {
        this(0);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof E)) {
            return false;
        }
        E e3 = (E) obj;
        return Intrinsics.b(this.f62374a, e3.f62374a) && Intrinsics.b(this.f62375b, e3.f62375b) && Intrinsics.b(this.f62376c, e3.f62376c) && Intrinsics.b(this.f62377d, e3.f62377d) && Intrinsics.b(this.f62378e, e3.f62378e);
    }

    public final int hashCode() {
        return this.f62378e.f62580a.hashCode() + ((this.f62377d.f62580a.hashCode() + ((this.f62376c.f62580a.hashCode() + ((this.f62375b.f62580a.hashCode() + (this.f62374a.f62580a.hashCode() * 31)) * 31)) * 31)) * 31);
    }

    @NotNull
    public final String toString() {
        return "AllFeatures(remote_search=" + this.f62374a + ", app_store_search=" + this.f62375b + ", query_hint=" + this.f62376c + ", auto_suggest=" + this.f62377d + ", analytics=" + this.f62378e + ')';
    }

    public /* synthetic */ E(int i5) {
        this(I6.f62671a, I6.f62671a, I6.f62671a, I6.f62671a, I6.f62671a);
    }

    public E(@NotNull H6 remote_search, @NotNull H6 app_store_search, @NotNull H6 query_hint, @NotNull H6 auto_suggest, @NotNull H6 analytics) {
        Intrinsics.g(remote_search, "remote_search");
        Intrinsics.g(app_store_search, "app_store_search");
        Intrinsics.g(query_hint, "query_hint");
        Intrinsics.g(auto_suggest, "auto_suggest");
        Intrinsics.g(analytics, "analytics");
        this.f62374a = remote_search;
        this.f62375b = app_store_search;
        this.f62376c = query_hint;
        this.f62377d = auto_suggest;
        this.f62378e = analytics;
    }
}
