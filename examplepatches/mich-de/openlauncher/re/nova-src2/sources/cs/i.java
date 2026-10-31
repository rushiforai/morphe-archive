package cs;

import kotlin.Result;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i implements bx.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t70.m f47822a;

    public i(t70.m mVar) {
        this.f47822a = mVar;
    }

    @Override // bx.b
    public final void onSuccess(Object obj) {
        yw.e result = (yw.e) obj;
        Intrinsics.g(result, "result");
        int i5 = Result.f71687b;
        this.f47822a.resumeWith(new t(result.f97673a));
    }
}
