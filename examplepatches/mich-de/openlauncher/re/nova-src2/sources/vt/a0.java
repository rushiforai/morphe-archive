package vt;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a0 extends b {

    /* renamed from: c, reason: collision with root package name */
    public final au.e f93009c;

    /* renamed from: d, reason: collision with root package name */
    public final p0 f93010d;

    /* renamed from: e, reason: collision with root package name */
    public final p0 f93011e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a0(au.e eVar, p0 p0Var, p0 p0Var2, iu.f errorReporter, w60.a requestOptionsProvider) {
        super(errorReporter, requestOptionsProvider);
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(requestOptionsProvider, "requestOptionsProvider");
        this.f93009c = eVar;
        this.f93010d = p0Var;
        this.f93011e = p0Var2;
    }
}
