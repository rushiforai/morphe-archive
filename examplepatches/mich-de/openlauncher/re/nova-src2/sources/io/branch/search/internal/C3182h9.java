package io.branch.search.internal;

import io.branch.search.internal.util.CorosKt;
import java.util.Collection;
import java.util.LinkedHashSet;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.h9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3182h9 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3350r9<X> f64657a;

    /* renamed from: io.branch.search.internal.h9$a */
    public static final class a extends Lambda implements Function0<Collection<X>> {

        /* renamed from: a, reason: collision with root package name */
        public static final a f64658a = new a();

        public a() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return new LinkedHashSet();
        }
    }

    public /* synthetic */ C3182h9() {
        this(CorosKt.getBNCScope());
    }

    public C3182h9(@NotNull t70.j0 scope) {
        Intrinsics.g(scope, "scope");
        C3282n8 c3282n8 = null;
        String str = "multi_api_impressions";
        this.f64657a = new C3350r9<>(c3282n8, str, scope, (S) null, a.f64658a, (M) null);
    }
}
