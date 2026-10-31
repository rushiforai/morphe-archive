package t70;

import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class b1 extends t1 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f88772e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f88773f;

    public /* synthetic */ b1(Object obj, int i5) {
        this.f88772e = i5;
        this.f88773f = obj;
    }

    @Override // t70.t1
    public final boolean j() {
        switch (this.f88772e) {
        }
        return false;
    }

    @Override // t70.t1
    public final void k(Throwable th2) {
        int i5 = this.f88772e;
        Object obj = this.f88773f;
        switch (i5) {
            case 0:
                ((a1) obj).dispose();
                break;
            case 1:
                ((Function1) obj).invoke(th2);
                break;
            default:
                u1 u1Var = (u1) obj;
                Object obj2 = x1.f88882a.get(i());
                if (!(obj2 instanceof v)) {
                    int i11 = Result.f71687b;
                    u1Var.resumeWith(m0.x(obj2));
                    break;
                } else {
                    int i12 = Result.f71687b;
                    u1Var.resumeWith(ResultKt.a(((v) obj2).f88869a));
                    break;
                }
        }
    }
}
