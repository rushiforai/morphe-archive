package io.branch.search.internal;

import io.branch.search.internal.C3296o5;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.h8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3181h8 extends AbstractC3393u1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Map<String, Object> f64655a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final AbstractC3393u1 f64656b;

    public C3181h8(@NotNull Map<String, ? extends Object> params, @NotNull AbstractC3393u1 fallback) {
        Intrinsics.g(params, "params");
        Intrinsics.g(fallback, "fallback");
        this.f64655a = params;
        this.f64656b = fallback;
    }

    @Override // io.branch.search.internal.AbstractC3393u1
    @Nullable
    public final String a(@Nullable String str) {
        String string;
        try {
            Object obj = this.f64655a.get(str);
            if (obj != null && (string = obj.toString()) != null) {
                return string;
            }
            return this.f64656b.a(str);
        } catch (IllegalStateException e3) {
            C3296o5.a aVar = C3296o5.f65426a;
            C3296o5.a(new F6("JoinBinding", "Safety net.... for now.", null, e3, null));
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }
}
