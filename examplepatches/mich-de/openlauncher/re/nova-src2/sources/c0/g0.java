package c0;

import ads_mobile_sdk.d3;
import ads_mobile_sdk.fz;
import ads_mobile_sdk.gq;
import ads_mobile_sdk.hq;
import ads_mobile_sdk.x52;
import android.content.Context;
import android.content.SharedPreferences;
import com.instabridge.ai.context.ContextType;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import tx.f4;

/* loaded from: classes2.dex */
public final class g0 extends SuspendLambda implements Function1 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f18810t;

    /* renamed from: u, reason: collision with root package name */
    public int f18811u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Object f18812v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g0(Object obj, Continuation continuation, int i5) {
        super(1, continuation);
        this.f18810t = i5;
        this.f18812v = obj;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        switch (this.f18810t) {
            case 0:
                return new g0((Function1) this.f18812v, continuation, 0);
            case 1:
                return new g0((d3) this.f18812v, continuation, 1);
            case 2:
                return new g0((x52) this.f18812v, continuation, 2);
            case 3:
                return new g0((cu.y) this.f18812v, continuation, 3);
            case 4:
                return new g0((t70.g2) this.f18812v, continuation, 4);
            case 5:
                return new g0((l00.o) this.f18812v, continuation, 5);
            case 6:
                return new g0((kv.c) this.f18812v, continuation, 6);
            case 7:
                return new g0((w5.c) this.f18812v, continuation, 7);
            case 8:
                return new g0((t5.x) this.f18812v, continuation, 8);
            case 9:
                return new g0((Context) this.f18812v, continuation, 9);
            default:
                return new g0((vs.o) this.f18812v, continuation, 10);
        }
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f18810t) {
            case 1:
                break;
            case 2:
                break;
        }
        return ((g0) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:231:? A[RETURN, SYNTHETIC] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) throws Throwable {
        Object objY;
        Context context;
        String str;
        Object objB;
        int i5 = this.f18810t;
        Continuation continuation = null;
        int i11 = 2;
        Object obj2 = this.f18812v;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i12 = this.f18811u;
                if (i12 != 0) {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                this.f18811u = 1;
                Object objS = p1.b1.a(getContext()).s((Function1) obj2, this);
                return objS == coroutineSingletons ? coroutineSingletons : objS;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i13 = this.f18811u;
                if (i13 != 0) {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                fz fzVar = ((d3) obj2).f2163l;
                this.f18811u = 1;
                Object objW = fzVar.w(this);
                return objW == coroutineSingletons2 ? coroutineSingletons2 : objW;
            case 2:
                x52 x52Var = (x52) obj2;
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i14 = this.f18811u;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    if (gq.f4020a != hq.f4481d) {
                        this.f18811u = 1;
                        if (t70.m0.z(this) == coroutineSingletons3) {
                            return coroutineSingletons3;
                        }
                    }
                    return Unit.f71706a;
                }
                if (i14 != 1) {
                    if (i14 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    x52Var.f11583i.j0();
                    return Unit.f71706a;
                }
                ResultKt.b(obj);
                CoroutineContext coroutineContext = x52Var.f11578d;
                androidx.room.c cVar = new androidx.room.c(x52Var, continuation, 12);
                this.f18811u = 2;
                if (t70.m0.y(coroutineContext, cVar, this) == coroutineSingletons3) {
                    return coroutineSingletons3;
                }
                x52Var.f11583i.j0();
                return Unit.f71706a;
            case 3:
                cu.y yVar = (cu.y) obj2;
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i15 = this.f18811u;
                if (i15 == 0) {
                    ResultKt.b(obj);
                    if (((List) yVar.f47978d.f80805c.f91586b.invoke()).size() > 1) {
                        ((cu.w) yVar.f47979e.get()).a(cu.q.f47963b);
                        CoroutineContext coroutineContext2 = yVar.f47981g;
                        b10.r0 r0Var = new b10.r0(i11, continuation, 3);
                        this.f18811u = 1;
                        if (t70.m0.y(coroutineContext2, r0Var, this) == coroutineSingletons4) {
                            return coroutineSingletons4;
                        }
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 4:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                int i16 = this.f18811u;
                if (i16 == 0) {
                    ResultKt.b(obj);
                    this.f18811u = 1;
                    if (((t70.g2) obj2).K(this) == coroutineSingletons5) {
                        return coroutineSingletons5;
                    }
                } else {
                    if (i16 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 5:
                CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                int i17 = this.f18811u;
                if (i17 == 0) {
                    ResultKt.b(obj);
                    this.f18811u = 1;
                    int i18 = l00.o.f72967p;
                    if (((l00.o) obj2).n(this) == coroutineSingletons6) {
                        return coroutineSingletons6;
                    }
                } else {
                    if (i17 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 6:
                Object obj3 = CoroutineSingletons.f71806a;
                int i19 = this.f18811u;
                if (i19 == 0) {
                    ResultKt.b(obj);
                    kv.c cVar2 = (kv.c) obj2;
                    this.f18811u = 1;
                    xu.f fVar = cVar2.f72278m;
                    CoroutineContext coroutineContext3 = cVar2.f72268c;
                    xu.v vVar = (xu.v) fVar.f96343h.f91586b.invoke();
                    int i21 = 16;
                    if (vVar instanceof xu.r) {
                        if (((List) cVar2.f72289z.f80805c.f91586b.invoke()).size() == 1) {
                            Object value = cVar2.f72277l.getValue();
                            if (value == null) {
                                throw new IllegalArgumentException("Required value was null.");
                            }
                            fVar.d(ul.b.P(new xu.i(t2.c.q(cVar2, (PaymentMethodMetadata) value))));
                            objY = Unit.f71706a;
                            if (objY == obj3) {
                                return obj3;
                            }
                        } else {
                            fVar.b();
                            objY = t70.m0.y(coroutineContext3, new b10.r0(i11, continuation, i21), this);
                            if (objY != obj3) {
                                objY = Unit.f71706a;
                            }
                            if (objY != obj3) {
                                objY = Unit.f71706a;
                            }
                            if (objY == obj3) {
                            }
                        }
                    } else if ((vVar instanceof xu.n) || (vVar instanceof xu.t)) {
                        fVar.b();
                        objY = t70.m0.y(coroutineContext3, new b10.r0(i11, continuation, i21), this);
                        if (objY != obj3) {
                            objY = Unit.f71706a;
                        }
                        if (objY != obj3) {
                            objY = Unit.f71706a;
                        }
                        if (objY == obj3) {
                        }
                    } else {
                        if (!(vVar instanceof xu.h) && !(vVar instanceof xu.i) && !(vVar instanceof xu.l) && !Intrinsics.b(vVar, xu.m.f96372a) && !(vVar instanceof xu.s) && !(vVar instanceof xu.u) && vVar != null) {
                            throw new NoWhenBranchMatchedException();
                        }
                        objY = Unit.f71706a;
                        if (objY == obj3) {
                        }
                    }
                } else {
                    if (i19 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 7:
                CoroutineSingletons coroutineSingletons7 = CoroutineSingletons.f71806a;
                int i22 = this.f18811u;
                if (i22 == 0) {
                    ResultKt.b(obj);
                    w5.c cVar3 = (w5.c) obj2;
                    this.f18811u = 1;
                    SharedPreferences.Editor editorEdit = ((SharedPreferences) cVar3.f93762e.getValue()).edit();
                    Set set = cVar3.f93763f;
                    if (set == null) {
                        editorEdit.clear();
                    } else {
                        Iterator it = set.iterator();
                        while (it.hasNext()) {
                            editorEdit.remove((String) it.next());
                        }
                    }
                    if (!editorEdit.commit()) {
                        throw new IOException("Unable to delete migrated keys from SharedPreferences.");
                    }
                    if (((SharedPreferences) cVar3.f93762e.getValue()).getAll().isEmpty() && (context = cVar3.f93760c) != null && (str = cVar3.f93761d) != null) {
                        w5.a.a(context, str);
                    }
                    if (set != null) {
                        set.clear();
                    }
                    if (Unit.f71706a == coroutineSingletons7) {
                        return coroutineSingletons7;
                    }
                } else {
                    if (i22 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 8:
                CoroutineSingletons coroutineSingletons8 = CoroutineSingletons.f71806a;
                int i23 = this.f18811u;
                if (i23 != 0) {
                    if (i23 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                this.f18811u = 1;
                Object objInvoke = ((t5.x) obj2).invoke(this);
                return objInvoke == coroutineSingletons8 ? coroutineSingletons8 : objInvoke;
            case 9:
                CoroutineSingletons coroutineSingletons9 = CoroutineSingletons.f71806a;
                int i24 = this.f18811u;
                if (i24 == 0) {
                    ResultKt.b(obj);
                    tx.j0 j0Var = tx.j0.f89820a;
                    Context context2 = (Context) obj2;
                    this.f18811u = 1;
                    long jCurrentTimeMillis = System.currentTimeMillis() - 2592000000L;
                    p8.f fVar2 = new p8.f(context2);
                    try {
                        ArrayList arrayListA = fVar2.a(50);
                        ArrayList arrayList = new ArrayList();
                        Iterator it2 = arrayListA.iterator();
                        while (it2.hasNext()) {
                            Object next = it2.next();
                            if (((f4) next).f89742b >= jCurrentTimeMillis) {
                                arrayList.add(next);
                            }
                        }
                        fVar2.close();
                        if (arrayList.isEmpty()) {
                            objB = Unit.f71706a;
                        } else {
                            objB = j0Var.b(context2, ContextType.SEARCH_HISTORY, b.c0.k("Recent searches (last 30 days): ", b70.g.f1(arrayList, "; ", null, null, 0, new s10.i(27), 30)), this);
                            if (objB != CoroutineSingletons.f71806a) {
                                objB = Unit.f71706a;
                            }
                        }
                        if (objB == coroutineSingletons9) {
                            return coroutineSingletons9;
                        }
                    } catch (Throwable th2) {
                        try {
                            throw th2;
                        } catch (Throwable th3) {
                            CloseableKt.a(fVar2, th2);
                            throw th3;
                        }
                    }
                } else {
                    if (i24 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons10 = CoroutineSingletons.f71806a;
                int i25 = this.f18811u;
                if (i25 == 0) {
                    ResultKt.b(obj);
                    this.f18811u = 1;
                    if (vs.o.f((vs.o) obj2, this) == coroutineSingletons10) {
                        return coroutineSingletons10;
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
