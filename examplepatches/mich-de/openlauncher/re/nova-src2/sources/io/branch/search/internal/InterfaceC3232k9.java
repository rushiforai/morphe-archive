package io.branch.search.internal;

import io.branch.search.internal.util.CorosKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.k9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3232k9 {

    @NotNull
    public static final a Companion = a.f64921a;

    /* renamed from: io.branch.search.internal.k9$a */
    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ a f64921a = new a();

        public static R9 a(a aVar, long j11) {
            t70.j0 scope = CorosKt.getBNCScope();
            aVar.getClass();
            Intrinsics.g(scope, "scope");
            return new R9(100, j11, scope);
        }
    }

    void a(@NotNull Function0<Unit> function0);
}
