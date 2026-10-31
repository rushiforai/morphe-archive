package qu;

import fr.l;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final l f84325a;

    /* renamed from: b, reason: collision with root package name */
    public final fr.c f84326b;

    /* renamed from: c, reason: collision with root package name */
    public final CoroutineContext f84327c;

    public c(l analyticsRequestExecutor, fr.c analyticsRequestFactory, CoroutineContext workContext) {
        Intrinsics.g(analyticsRequestExecutor, "analyticsRequestExecutor");
        Intrinsics.g(analyticsRequestFactory, "analyticsRequestFactory");
        Intrinsics.g(workContext, "workContext");
        this.f84325a = analyticsRequestExecutor;
        this.f84326b = analyticsRequestFactory;
        this.f84327c = workContext;
    }
}
