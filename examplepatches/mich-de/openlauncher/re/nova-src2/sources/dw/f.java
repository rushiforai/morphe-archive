package dw;

import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;

/* loaded from: classes4.dex */
public final class f implements e {

    /* renamed from: a, reason: collision with root package name */
    public final iu.f f49680a;

    public f(iu.f fVar) {
        this.f49680a = fVar;
    }

    @Override // dw.e
    public final Object a(String str, Continuation continuation) {
        IllegalStateException illegalStateException = new IllegalStateException("Missing Google Places dependency, please add it to your apps build.gradle");
        t2.c.L(this.f49680a, iu.e.f68096k, null, null, 6);
        int i5 = Result.f71687b;
        return ResultKt.a(illegalStateException);
    }

    @Override // dw.e
    public final Object b(int i5, String str, String str2, Continuation continuation) {
        IllegalStateException illegalStateException = new IllegalStateException("Missing Google Places dependency, please add it to your apps build.gradle");
        t2.c.L(this.f49680a, iu.e.f68095j, null, null, 6);
        int i11 = Result.f71687b;
        return ResultKt.a(illegalStateException);
    }
}
