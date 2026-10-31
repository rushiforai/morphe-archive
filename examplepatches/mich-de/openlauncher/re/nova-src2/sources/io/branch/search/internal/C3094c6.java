package io.branch.search.internal;

import io.branch.search.internal.Y7;
import java.util.HashMap;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.c6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3094c6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final HashMap<EnumC3145f6, a> f64094a = new HashMap<>();

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final c80.a f64095b = new c80.d();

    /* renamed from: io.branch.search.internal.c6$a */
    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        public final long f64096a;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final Function0<Unit> f64097b;

        public a(long j11, @NotNull Y7.a onNewRequest) {
            Intrinsics.g(onNewRequest, "onNewRequest");
            this.f64096a = j11;
            this.f64097b = onNewRequest;
        }
    }
}
