package io.branch.search.internal;

import io.branch.search.internal.services.model.BranchJob;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class Vc extends Lambda implements Function1<InterfaceC3164g8, Boolean> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ BranchJob.ScheduledQueries f63542a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Vc(BranchJob.ScheduledQueries scheduledQueries) {
        super(1);
        this.f63542a = scheduledQueries;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        InterfaceC3164g8 scheduleBranchJob = (InterfaceC3164g8) obj;
        Intrinsics.g(scheduleBranchJob, "$this$scheduleBranchJob");
        return Boolean.valueOf(scheduleBranchJob.a(this.f63542a.getID()) == null);
    }
}
