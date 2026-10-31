package f1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class g1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f53551t;

    /* renamed from: u, reason: collision with root package name */
    public int f53552u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ c0.e f53553v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ float f53554w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ boolean f53555x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ i0.h f53556y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ Object f53557z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g1(c0.e eVar, float f11, boolean z11, Object obj, i0.h hVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f53551t = i5;
        this.f53553v = eVar;
        this.f53554w = f11;
        this.f53555x = z11;
        this.f53557z = obj;
        this.f53556y = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f53551t) {
            case 0:
                return new g1(this.f53553v, this.f53554w, this.f53555x, (h1) this.f53557z, this.f53556y, continuation, 0);
            case 1:
                return new g1(this.f53553v, this.f53554w, this.f53555x, (l1.o0) this.f53557z, this.f53556y, continuation, 1);
            default:
                return new g1(this.f53553v, this.f53554w, this.f53555x, (l1.t0) this.f53557z, this.f53556y, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f53551t) {
        }
        return ((g1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:110:0x01e0  */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        Object objG;
        switch (this.f53551t) {
            case 0:
                h1 h1Var = (h1) this.f53557z;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f53552u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    c0.e eVar = this.f53553v;
                    float f11 = ((y3.f) ((p1.s2) eVar.f18758e).getValue()).f96602a;
                    float f12 = this.f53554w;
                    if (!y3.f.a(f11, f12)) {
                        if (this.f53555x) {
                            float f13 = ((y3.f) ((p1.s2) eVar.f18758e).getValue()).f96602a;
                            c0.h2 h2Var = null;
                            i0.h kVar = y3.f.a(f13, h1Var.f53590b) ? new i0.k(0L) : y3.f.a(f13, h1Var.f53592d) ? new i0.f() : y3.f.a(f13, h1Var.f53593e) ? new i0.d() : null;
                            this.f53552u = 2;
                            c0.h2 h2Var2 = y1.f54128b;
                            c0.h2 h2Var3 = y1.f54127a;
                            i0.h hVar = this.f53556y;
                            if (hVar != null) {
                                if ((hVar instanceof i0.k) || (hVar instanceof i0.b) || (hVar instanceof i0.f) || (hVar instanceof i0.d)) {
                                    h2Var = h2Var3;
                                }
                            } else if (kVar != null) {
                                if (!(kVar instanceof i0.k) && !(kVar instanceof i0.b)) {
                                    if (kVar instanceof i0.f) {
                                        h2Var = y1.f54129c;
                                    } else if (kVar instanceof i0.d) {
                                        h2Var = h2Var2;
                                    }
                                }
                            }
                            c0.h2 h2Var4 = h2Var;
                            c0.e eVar2 = this.f53553v;
                            if (h2Var4 != null) {
                                objG = c0.e.d(eVar2, new y3.f(f12), h2Var4, null, this, 12);
                                if (objG != coroutineSingletons) {
                                    objG = Unit.f71706a;
                                }
                            } else {
                                objG = eVar2.g(new y3.f(f12), this);
                                if (objG != coroutineSingletons) {
                                    objG = Unit.f71706a;
                                }
                            }
                            if (objG == coroutineSingletons) {
                                return coroutineSingletons;
                            }
                        } else {
                            y3.f fVar = new y3.f(f12);
                            this.f53552u = 1;
                            if (eVar.g(fVar, this) == coroutineSingletons) {
                                return coroutineSingletons;
                            }
                        }
                    }
                    return Unit.f71706a;
                }
                if (i5 != 1 && i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            case 1:
                l1.o0 o0Var = (l1.o0) this.f53557z;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f53552u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    c0.e eVar3 = this.f53553v;
                    float f14 = ((y3.f) ((p1.s2) eVar3.f18758e).getValue()).f96602a;
                    float f15 = this.f53554w;
                    if (!y3.f.a(f14, f15)) {
                        if (this.f53555x) {
                            float f16 = ((y3.f) ((p1.s2) eVar3.f18758e).getValue()).f96602a;
                            i0.h kVar2 = y3.f.a(f16, o0Var.f73725b) ? new i0.k(0L) : y3.f.a(f16, o0Var.f73727d) ? new i0.f() : y3.f.a(f16, o0Var.f73726c) ? new i0.d() : null;
                            this.f53552u = 2;
                            if (m1.u.a(eVar3, f15, kVar2, this.f53556y, this) == coroutineSingletons2) {
                                return coroutineSingletons2;
                            }
                        } else {
                            y3.f fVar2 = new y3.f(f15);
                            this.f53552u = 1;
                            if (eVar3.g(fVar2, this) == coroutineSingletons2) {
                                return coroutineSingletons2;
                            }
                        }
                    }
                } else {
                    if (i11 != 1 && i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                l1.t0 t0Var = (l1.t0) this.f53557z;
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f53552u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    c0.e eVar4 = this.f53553v;
                    float f17 = ((y3.f) ((p1.s2) eVar4.f18758e).getValue()).f96602a;
                    float f18 = this.f53554w;
                    if (!y3.f.a(f17, f18)) {
                        if (this.f53555x) {
                            float f19 = ((y3.f) ((p1.s2) eVar4.f18758e).getValue()).f96602a;
                            i0.h kVar3 = y3.f.a(f19, t0Var.f73984b) ? new i0.k(0L) : y3.f.a(f19, t0Var.f73986d) ? new i0.f() : y3.f.a(f19, t0Var.f73985c) ? new i0.d() : y3.f.a(f19, t0Var.f73987e) ? new i0.b() : null;
                            this.f53552u = 2;
                            if (m1.u.a(eVar4, f18, kVar3, this.f53556y, this) == coroutineSingletons3) {
                                return coroutineSingletons3;
                            }
                        } else {
                            y3.f fVar3 = new y3.f(f18);
                            this.f53552u = 1;
                            if (eVar4.g(fVar3, this) == coroutineSingletons3) {
                                return coroutineSingletons3;
                            }
                        }
                    }
                } else {
                    if (i12 != 1 && i12 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
