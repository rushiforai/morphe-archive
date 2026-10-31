package io.branch.search.internal;

import io.branch.search.internal.services.storage.JobInfoRaw;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.m2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3259m2 extends Lambda implements Function3<C3465y5, JobInfoRaw, Boolean, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3327q2 f65072a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3259m2(C3327q2 c3327q2) {
        super(3);
        this.f65072a = c3327q2;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        C3465y5 request = (C3465y5) obj;
        JobInfoRaw params = (JobInfoRaw) obj2;
        boolean zBooleanValue = ((Boolean) obj3).booleanValue();
        Intrinsics.g(request, "request");
        Intrinsics.g(params, "params");
        this.f65072a.a("cache_update_service", params, zBooleanValue);
        return Unit.f71706a;
    }
}
