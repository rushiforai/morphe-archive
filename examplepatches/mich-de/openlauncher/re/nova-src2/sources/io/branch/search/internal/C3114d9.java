package io.branch.search.internal;

import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.d9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3114d9 extends AbstractC3080b9 {

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final Function0<String> f64288d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final Lazy f64289e;

    /* renamed from: io.branch.search.internal.d9$a */
    public static final class a extends Lambda implements Function0<String> {
        public a() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            Function0<String> function0 = C3114d9.this.f64288d;
            if (function0 != null) {
                return (String) function0.invoke();
            }
            return null;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3114d9(@NotNull a50.b level, @NotNull String tag, @Nullable Function0<String> function0, @Nullable Throwable th2) {
        super(level, tag, th2, 0);
        Intrinsics.g(level, "level");
        Intrinsics.g(tag, "tag");
        this.f64288d = function0;
        this.f64289e = LazyKt.a(new a());
    }

    @Override // io.branch.search.internal.AbstractC3080b9
    @Nullable
    public final String a() {
        return (String) this.f64289e.getValue();
    }
}
