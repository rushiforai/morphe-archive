package io.branch.search.internal;

import android.content.Context;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class U4 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f63421a;

    /* renamed from: b, reason: collision with root package name */
    public final int f63422b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final InterfaceC3093c5 f63423c;

    public U4(@NotNull Context context, int i5, @NotNull C3252lc databaseConnectionProviderFactory) {
        Intrinsics.g(context, "context");
        Intrinsics.g(databaseConnectionProviderFactory, "databaseConnectionProviderFactory");
        this.f63421a = context;
        this.f63422b = i5;
        this.f63423c = databaseConnectionProviderFactory;
    }

    @NotNull
    public final V4 a() {
        return new V4("disco", "disco", this.f63422b, this.f63421a, false, this.f63423c);
    }
}
