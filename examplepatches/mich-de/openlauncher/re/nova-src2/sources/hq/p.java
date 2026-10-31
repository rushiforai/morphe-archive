package hq;

import cw.x1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import w70.i2;

/* loaded from: classes4.dex */
public final class p implements w70.m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59993a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i2 f59994b;

    public /* synthetic */ p(i2 i2Var, int i5) {
        this.f59993a = i5;
        this.f59994b = i2Var;
    }

    @Override // w70.m
    public final Object collect(w70.n nVar, Continuation continuation) {
        switch (this.f59993a) {
            case 0:
                this.f59994b.collect(new x1(nVar, 6), continuation);
                break;
            case 1:
                this.f59994b.collect(new x1(nVar, 11), continuation);
                break;
            default:
                this.f59994b.collect(new x1(nVar, 12), continuation);
                break;
        }
        return CoroutineSingletons.f71806a;
    }
}
