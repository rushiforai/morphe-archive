package io.branch.search.internal;

import io.branch.search.internal.services.storage.JobInfoRaw;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.h2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3175h2 extends Lambda implements Function1<JobInfoRaw, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public static final C3175h2 f64632a = new C3175h2();

    public C3175h2() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        JobInfoRaw it = (JobInfoRaw) obj;
        Intrinsics.g(it, "it");
        return Unit.f71706a;
    }
}
