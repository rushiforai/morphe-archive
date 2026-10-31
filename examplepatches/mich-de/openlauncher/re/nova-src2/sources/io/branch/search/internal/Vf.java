package io.branch.search.internal;

import io.branch.search.internal.multiprocess.ZeroStateCacheModel;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class Vf extends Lambda implements Function0<String> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ y40.w f63546a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ZeroStateCacheModel f63547b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Vf(y40.w wVar, ZeroStateCacheModel zeroStateCacheModel) {
        super(0);
        this.f63546a = wVar;
        this.f63547b = zeroStateCacheModel;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return "Zero state cache update - previous request analytics removal was success=" + ((Boolean) this.f63546a.f96716a).booleanValue() + " for requestId=" + this.f63547b.getRequestId();
    }
}
