package m00;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import w70.i2;

/* loaded from: classes4.dex */
public final class a0 implements w70.m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75519a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i2 f75520b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ j0 f75521c;

    public /* synthetic */ a0(i2 i2Var, j0 j0Var, int i5) {
        this.f75519a = i5;
        this.f75520b = i2Var;
        this.f75521c = j0Var;
    }

    @Override // w70.m
    public final Object collect(w70.n nVar, Continuation continuation) {
        switch (this.f75519a) {
            case 0:
                this.f75520b.collect(new z(nVar, this.f75521c, 0), continuation);
                break;
            case 1:
                this.f75520b.collect(new z(nVar, this.f75521c, 1), continuation);
                break;
            case 2:
                this.f75520b.collect(new z(nVar, this.f75521c, 2), continuation);
                break;
            case 3:
                this.f75520b.collect(new z(nVar, this.f75521c, 3), continuation);
                break;
            case 4:
                this.f75520b.collect(new z(nVar, this.f75521c, 4), continuation);
                break;
            default:
                this.f75520b.collect(new z(nVar, this.f75521c, 5), continuation);
                break;
        }
        return CoroutineSingletons.f71806a;
    }
}
