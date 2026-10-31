package io.branch.search.internal;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Z6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f63818a = new a();

    @NotNull
    public static a a() {
        return f63818a;
    }

    public static final class a implements Be {

        /* renamed from: a, reason: collision with root package name */
        public final long f63819a = TimeUnit.MILLISECONDS.convert(30, TimeUnit.MINUTES);

        /* renamed from: b, reason: collision with root package name */
        public final int f63820b = 7340032;

        /* renamed from: c, reason: collision with root package name */
        public final int f63821c = 11010048;

        /* renamed from: d, reason: collision with root package name */
        @NotNull
        public final AtomicBoolean f63822d = new AtomicBoolean(false);

        /* renamed from: e, reason: collision with root package name */
        public long f63823e = -1;

        /* renamed from: f, reason: collision with root package name */
        @NotNull
        public final ArrayList f63824f = new ArrayList();

        public final void a(@NotNull Q6 flushListener) {
            Intrinsics.g(flushListener, "flushListener");
            this.f63824f.add(new WeakReference(flushListener));
        }

        @Override // io.branch.search.internal.Be
        public final boolean b() {
            return this.f63822d.get();
        }

        @Override // io.branch.search.internal.Be
        public final void a() {
            this.f63822d.set(true);
            this.f63823e = System.currentTimeMillis();
        }
    }
}
