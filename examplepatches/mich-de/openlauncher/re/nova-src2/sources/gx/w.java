package gx;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import w70.g2;

/* loaded from: classes4.dex */
public final class w implements w70.m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58201a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ w70.m f58202b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f58203c;

    public /* synthetic */ w(g2 g2Var, String str, int i5) {
        this.f58201a = i5;
        this.f58202b = g2Var;
        this.f58203c = str;
    }

    @Override // w70.m
    public final Object collect(w70.n nVar, Continuation continuation) {
        switch (this.f58201a) {
            case 0:
                Object objCollect = this.f58202b.collect(new v(nVar, this.f58203c, 0), continuation);
                if (objCollect != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
            case 1:
                Object objCollect2 = this.f58202b.collect(new v(nVar, this.f58203c, 1), continuation);
                if (objCollect2 != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
            case 2:
                Object objCollect3 = this.f58202b.collect(new v(nVar, this.f58203c, 2), continuation);
                if (objCollect3 != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
            default:
                Object objCollect4 = this.f58202b.collect(new v(nVar, this.f58203c, 3), continuation);
                if (objCollect4 != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
        }
        return Unit.f71706a;
    }
}
