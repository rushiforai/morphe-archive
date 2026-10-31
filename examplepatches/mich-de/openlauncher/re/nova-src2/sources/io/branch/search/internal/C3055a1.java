package io.branch.search.internal;

import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.a1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3055a1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final t70.j1 f63866a = new t70.k1(new ThreadPoolExecutor(16, 64, 0, TimeUnit.MILLISECONDS, new LinkedBlockingQueue()));

    @NotNull
    public static final t70.j1 a() {
        return f63866a;
    }
}
