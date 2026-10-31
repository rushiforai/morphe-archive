package fx;

import b.c0;
import dx.j;
import dx.t0;
import dx.u0;
import dx.v0;
import kotlin.Result;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import ni.s;
import t70.m;

/* loaded from: classes4.dex */
public final class a implements wi.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ m f56154a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f56155b;

    public a(m mVar, Ref.ObjectRef objectRef) {
        this.f56154a = mVar;
        this.f56155b = objectRef;
    }

    @Override // ni.d
    public final void b(s error) {
        Intrinsics.g(error, "error");
        m mVar = this.f56154a;
        if (mVar.b()) {
            int i5 = Result.f71687b;
            mVar.resumeWith(new v0(new j(c0.m("GMA ", error.f78322b.name(), ": ", error.f78323c))));
        }
    }

    @Override // ni.d
    public final void c() {
        m mVar = this.f56154a;
        if (mVar.b()) {
            wi.a aVar = (wi.a) this.f56155b.f71863a;
            int i5 = Result.f71687b;
            mVar.resumeWith(aVar != null ? new u0(aVar.getAmount(), aVar.getType()) : t0.f49793a);
        }
    }
}
