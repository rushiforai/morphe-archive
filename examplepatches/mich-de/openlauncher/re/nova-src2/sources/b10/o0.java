package b10;

import android.content.Context;
import android.net.Uri;
import com.teslacoilsw.launcher.onboarding.FirstRunActivityCompose;
import java.io.FileNotFoundException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class o0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f16820t;

    /* renamed from: u, reason: collision with root package name */
    public int f16821u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Context f16822v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Uri f16823w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ w20.l f16824x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f16825y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f16826z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o0(Context context, Uri uri, w20.l lVar, p1.e1 e1Var, p1.e1 e1Var2, Continuation continuation, int i5) {
        super(2, continuation);
        this.f16820t = i5;
        this.f16822v = context;
        this.f16823w = uri;
        this.f16824x = lVar;
        this.f16825y = e1Var;
        this.f16826z = e1Var2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f16820t) {
            case 0:
                return new o0(this.f16822v, this.f16823w, this.f16824x, this.f16825y, this.f16826z, continuation, 0);
            default:
                return new o0(this.f16822v, this.f16823w, this.f16824x, this.f16825y, this.f16826z, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f16820t) {
        }
        return ((o0) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        Object objY;
        Object objY2;
        int i5 = this.f16820t;
        p1.e1 e1Var = this.f16826z;
        int i11 = 14;
        Uri uri = this.f16823w;
        w20.l lVar = this.f16824x;
        int i12 = 2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        switch (i5) {
            case 0:
                int i13 = this.f16821u;
                Context context = this.f16822v;
                Continuation continuation = null;
                try {
                } catch (Exception e3) {
                    mc0.d.f76206a.o(e3);
                    if ((e3 instanceof FileNotFoundException) && cl.l0.J(uri) && !lVar.a(context)) {
                        lVar.c();
                        int i14 = FirstRunActivityCompose.f45937s;
                        e1Var.setValue(uri);
                    } else {
                        a80.e eVar = t70.y0.f88884a;
                        u70.d dVar = y70.o.f96819a;
                        n0 n0Var = new n0(context, e3, continuation, 0);
                        this.f16821u = 3;
                        if (t70.m0.y(dVar, n0Var, this) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                }
                if (i13 == 0) {
                    ResultKt.b(obj);
                    this.f16821u = 1;
                    a80.e eVar2 = t70.y0.f88884a;
                    objY = t70.m0.y(a80.d.f488c, new ar.d(context, uri, continuation, i11), this);
                    if (objY == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i13 != 1) {
                        if (i13 != 2 && i13 != 3) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    ResultKt.b(obj);
                    objY = obj;
                }
                ay.r rVar = (ay.r) objY;
                a80.e eVar3 = t70.y0.f88884a;
                u70.d dVar2 = y70.o.f96819a;
                m0 m0Var = new m0(rVar, this.f16825y, context, continuation, 0);
                this.f16821u = 2;
                if (t70.m0.y(dVar2, m0Var, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                return Unit.f71706a;
            default:
                int i15 = this.f16821u;
                Context context2 = this.f16822v;
                Continuation continuation2 = null;
                try {
                } catch (Exception e11) {
                    mc0.d.f76206a.o(e11);
                    if ((e11 instanceof FileNotFoundException) && cl.l0.J(uri) && !lVar.a(context2)) {
                        lVar.c();
                        e1Var.setValue(uri);
                    } else {
                        a80.e eVar4 = t70.y0.f88884a;
                        u70.d dVar3 = y70.o.f96819a;
                        n0 n0Var2 = new n0(context2, e11, continuation2, i12);
                        this.f16821u = 3;
                        if (t70.m0.y(dVar3, n0Var2, this) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                }
                if (i15 == 0) {
                    ResultKt.b(obj);
                    this.f16821u = 1;
                    a80.e eVar5 = t70.y0.f88884a;
                    objY2 = t70.m0.y(a80.d.f488c, new ar.d(context2, uri, continuation2, i11), this);
                    if (objY2 == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i15 != 1) {
                        if (i15 != 2 && i15 != 3) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    ResultKt.b(obj);
                    objY2 = obj;
                }
                ay.r rVar2 = (ay.r) objY2;
                a80.e eVar6 = t70.y0.f88884a;
                u70.d dVar4 = y70.o.f96819a;
                m0 m0Var2 = new m0(rVar2, this.f16825y, context2, continuation2, 1);
                this.f16821u = 2;
                if (t70.m0.y(dVar4, m0Var2, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                return Unit.f71706a;
        }
    }
}
