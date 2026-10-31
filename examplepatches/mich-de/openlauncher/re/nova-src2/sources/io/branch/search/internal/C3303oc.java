package io.branch.search.internal;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.oc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3303oc extends Lambda implements Function0<Boolean> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3269mc f65435a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3303oc(C3269mc c3269mc) {
        super(0);
        this.f65435a = c3269mc;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws ClassNotFoundException {
        boolean z11 = false;
        if (this.f65435a.f65154a) {
            try {
                Class.forName("u40.h", false, C3269mc.class.getClassLoader());
                z11 = true;
            } catch (ClassNotFoundException unused) {
            }
            C3309p1.a(EnumC3131e9.WorkflowExecution, new C3286nc(z11));
        }
        return Boolean.valueOf(z11);
    }
}
