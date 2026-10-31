package cw;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l0 extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f48200t;

    /* renamed from: u, reason: collision with root package name */
    public int f48201u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ w70.n f48202v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object[] f48203w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l0(int i5, Continuation continuation, int i11) {
        super(i5, continuation);
        this.f48200t = i11;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        w70.n nVar = (w70.n) obj;
        Object[] objArr = (Object[]) obj2;
        Continuation continuation = (Continuation) obj3;
        switch (this.f48200t) {
            case 0:
                l0 l0Var = new l0(3, continuation, 0);
                l0Var.f48202v = nVar;
                l0Var.f48203w = objArr;
                return l0Var.invokeSuspend(Unit.f71706a);
            case 1:
                l0 l0Var2 = new l0(3, continuation, 1);
                l0Var2.f48202v = nVar;
                l0Var2.f48203w = objArr;
                return l0Var2.invokeSuspend(Unit.f71706a);
            case 2:
                l0 l0Var3 = new l0(3, continuation, 2);
                l0Var3.f48202v = nVar;
                l0Var3.f48203w = objArr;
                return l0Var3.invokeSuspend(Unit.f71706a);
            case 3:
                l0 l0Var4 = new l0(3, continuation, 3);
                l0Var4.f48202v = nVar;
                l0Var4.f48203w = objArr;
                return l0Var4.invokeSuspend(Unit.f71706a);
            case 4:
                l0 l0Var5 = new l0(3, continuation, 4);
                l0Var5.f48202v = nVar;
                l0Var5.f48203w = objArr;
                return l0Var5.invokeSuspend(Unit.f71706a);
            case 5:
                l0 l0Var6 = new l0(3, continuation, 5);
                l0Var6.f48202v = nVar;
                l0Var6.f48203w = objArr;
                return l0Var6.invokeSuspend(Unit.f71706a);
            case 6:
                l0 l0Var7 = new l0(3, continuation, 6);
                l0Var7.f48202v = nVar;
                l0Var7.f48203w = objArr;
                return l0Var7.invokeSuspend(Unit.f71706a);
            case 7:
                l0 l0Var8 = new l0(3, continuation, 7);
                l0Var8.f48202v = nVar;
                l0Var8.f48203w = objArr;
                return l0Var8.invokeSuspend(Unit.f71706a);
            case 8:
                l0 l0Var9 = new l0(3, continuation, 8);
                l0Var9.f48202v = nVar;
                l0Var9.f48203w = objArr;
                return l0Var9.invokeSuspend(Unit.f71706a);
            case 9:
                l0 l0Var10 = new l0(3, continuation, 9);
                l0Var10.f48202v = nVar;
                l0Var10.f48203w = objArr;
                return l0Var10.invokeSuspend(Unit.f71706a);
            case 10:
                l0 l0Var11 = new l0(3, continuation, 10);
                l0Var11.f48202v = nVar;
                l0Var11.f48203w = objArr;
                return l0Var11.invokeSuspend(Unit.f71706a);
            case 11:
                l0 l0Var12 = new l0(3, continuation, 11);
                l0Var12.f48202v = nVar;
                l0Var12.f48203w = objArr;
                return l0Var12.invokeSuspend(Unit.f71706a);
            case 12:
                l0 l0Var13 = new l0(3, continuation, 12);
                l0Var13.f48202v = nVar;
                l0Var13.f48203w = objArr;
                return l0Var13.invokeSuspend(Unit.f71706a);
            default:
                l0 l0Var14 = new l0(3, continuation, 13);
                l0Var14.f48202v = nVar;
                l0Var14.f48203w = objArr;
                return l0Var14.invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws IOException {
        t7.d dVar;
        t7.d dVar2;
        switch (this.f48200t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f48201u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    w70.n nVar = this.f48202v;
                    kw.w0 w0Var = (kw.w0) b70.g.Y0(b70.g.U0(kotlin.collections.c.b1(this.f48203w)));
                    this.f48201u = 1;
                    if (nVar.emit(w0Var, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f48201u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    w70.n nVar2 = this.f48202v;
                    List listI1 = b70.g.I1(kotlin.collections.c.b1(this.f48203w));
                    this.f48201u = 1;
                    if (nVar2.emit(listI1, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f48201u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    w70.n nVar3 = this.f48202v;
                    kw.w0 w0Var2 = (kw.w0) b70.g.Y0(b70.g.U0(kotlin.collections.c.b1(this.f48203w)));
                    this.f48201u = 1;
                    if (nVar3.emit(w0Var2, this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i13 = this.f48201u;
                if (i13 == 0) {
                    ResultKt.b(obj);
                    w70.n nVar4 = this.f48202v;
                    ArrayList arrayListV0 = b70.c.v0(b70.g.I1(kotlin.collections.c.b1(this.f48203w)));
                    this.f48201u = 1;
                    if (nVar4.emit(arrayListV0, this) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 4:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                int i14 = this.f48201u;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    w70.n nVar5 = this.f48202v;
                    ArrayList arrayListV02 = b70.c.v0(b70.g.I1(kotlin.collections.c.b1(this.f48203w)));
                    this.f48201u = 1;
                    if (nVar5.emit(arrayListV02, this) == coroutineSingletons5) {
                        return coroutineSingletons5;
                    }
                } else {
                    if (i14 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 5:
                CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                int i15 = this.f48201u;
                if (i15 == 0) {
                    ResultKt.b(obj);
                    w70.n nVar6 = this.f48202v;
                    ArrayList arrayListV03 = b70.c.v0(b70.g.I1(kotlin.collections.c.b1(this.f48203w)));
                    this.f48201u = 1;
                    if (nVar6.emit(arrayListV03, this) == coroutineSingletons6) {
                        return coroutineSingletons6;
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 6:
                CoroutineSingletons coroutineSingletons7 = CoroutineSingletons.f71806a;
                int i16 = this.f48201u;
                if (i16 == 0) {
                    ResultKt.b(obj);
                    w70.n nVar7 = this.f48202v;
                    String strF1 = b70.g.f1(kotlin.collections.c.b1(this.f48203w), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null, null, 0, null, 62);
                    this.f48201u = 1;
                    if (nVar7.emit(strF1, this) == coroutineSingletons7) {
                        return coroutineSingletons7;
                    }
                } else {
                    if (i16 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 7:
                CoroutineSingletons coroutineSingletons8 = CoroutineSingletons.f71806a;
                int i17 = this.f48201u;
                if (i17 == 0) {
                    ResultKt.b(obj);
                    w70.n nVar8 = this.f48202v;
                    kw.w0 w0Var3 = (kw.w0) b70.g.Y0(b70.g.U0(kotlin.collections.c.b1(this.f48203w)));
                    this.f48201u = 1;
                    if (nVar8.emit(w0Var3, this) == coroutineSingletons8) {
                        return coroutineSingletons8;
                    }
                } else {
                    if (i17 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 8:
                CoroutineSingletons coroutineSingletons9 = CoroutineSingletons.f71806a;
                int i18 = this.f48201u;
                if (i18 == 0) {
                    ResultKt.b(obj);
                    w70.n nVar9 = this.f48202v;
                    ArrayList arrayListV04 = b70.c.v0(b70.g.I1(kotlin.collections.c.b1(this.f48203w)));
                    this.f48201u = 1;
                    if (nVar9.emit(arrayListV04, this) == coroutineSingletons9) {
                        return coroutineSingletons9;
                    }
                } else {
                    if (i18 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 9:
                CoroutineSingletons coroutineSingletons10 = CoroutineSingletons.f71806a;
                int i19 = this.f48201u;
                if (i19 == 0) {
                    ResultKt.b(obj);
                    w70.n nVar10 = this.f48202v;
                    ArrayList arrayListV05 = b70.c.v0(b70.g.I1(kotlin.collections.c.b1(this.f48203w)));
                    this.f48201u = 1;
                    if (nVar10.emit(arrayListV05, this) == coroutineSingletons10) {
                        return coroutineSingletons10;
                    }
                } else {
                    if (i19 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 10:
                CoroutineSingletons coroutineSingletons11 = CoroutineSingletons.f71806a;
                int i21 = this.f48201u;
                if (i21 == 0) {
                    ResultKt.b(obj);
                    w70.n nVar11 = this.f48202v;
                    ArrayList arrayListV06 = b70.c.v0(b70.g.I1(kotlin.collections.c.b1(this.f48203w)));
                    this.f48201u = 1;
                    if (nVar11.emit(arrayListV06, this) == coroutineSingletons11) {
                        return coroutineSingletons11;
                    }
                } else {
                    if (i21 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 11:
                CoroutineSingletons coroutineSingletons12 = CoroutineSingletons.f71806a;
                int i22 = this.f48201u;
                if (i22 == 0) {
                    ResultKt.b(obj);
                    w70.n nVar12 = this.f48202v;
                    t7.d[] dVarArr = (t7.d[]) this.f48203w;
                    int length = dVarArr.length;
                    int i23 = 0;
                    while (true) {
                        dVar = t7.b.f88761a;
                        if (i23 < length) {
                            dVar2 = dVarArr[i23];
                            if (Intrinsics.b(dVar2, dVar)) {
                                i23++;
                            }
                        } else {
                            dVar2 = null;
                        }
                    }
                    if (dVar2 != null) {
                        dVar = dVar2;
                    }
                    this.f48201u = 1;
                    if (nVar12.emit(dVar, this) == coroutineSingletons12) {
                        return coroutineSingletons12;
                    }
                } else {
                    if (i22 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 12:
                CoroutineSingletons coroutineSingletons13 = CoroutineSingletons.f71806a;
                int i24 = this.f48201u;
                if (i24 == 0) {
                    ResultKt.b(obj);
                    w70.n nVar13 = this.f48202v;
                    ArrayList arrayListV07 = b70.c.v0(kotlin.collections.c.b1((List[]) this.f48203w));
                    this.f48201u = 1;
                    if (nVar13.emit(arrayListV07, this) == coroutineSingletons13) {
                        return coroutineSingletons13;
                    }
                } else {
                    if (i24 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons14 = CoroutineSingletons.f71806a;
                int i25 = this.f48201u;
                if (i25 == 0) {
                    ResultKt.b(obj);
                    w70.n nVar14 = this.f48202v;
                    ArrayList arrayListV08 = b70.c.v0(b70.g.I1(kotlin.collections.c.b1(this.f48203w)));
                    this.f48201u = 1;
                    if (nVar14.emit(arrayListV08, this) == coroutineSingletons14) {
                        return coroutineSingletons14;
                    }
                } else {
                    if (i25 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
