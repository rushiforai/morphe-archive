package io.branch.search.internal;

import android.content.Context;
import android.content.SharedPreferences;
import io.branch.search.internal.Y2;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Sd {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final t70.c0 f63356a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Lazy f63357b;

    public static final class a {
    }

    public static final class b extends Lambda implements Function0<SharedPreferences> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ F4 f63358a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(F4 f42) {
            super(0);
            this.f63358a = f42;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            Y2.a aVar = Y2.Companion;
            Context context = this.f63358a.f62438a;
            Y2.b bVar = Y2.b.BundleJobSchedule;
            aVar.getClass();
            return Y2.a.a(context, bVar);
        }
    }

    public Sd(@NotNull F4 contextDelegate, @NotNull t70.c0 ioDispatcher) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(ioDispatcher, "ioDispatcher");
        this.f63356a = ioDispatcher;
        this.f63357b = LazyKt.a(new b(contextDelegate));
    }
}
