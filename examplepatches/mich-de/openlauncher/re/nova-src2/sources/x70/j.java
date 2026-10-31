package x70;

import b0.b0;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Ref;
import kotlinx.coroutines.flow.internal.ChildCancelledException;
import t70.j0;
import t70.l0;
import t70.m0;
import t70.r1;

/* loaded from: classes.dex */
public final class j implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f95236a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ j0 f95237b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ l f95238c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ w70.n f95239d;

    public j(Ref.ObjectRef objectRef, j0 j0Var, l lVar, w70.n nVar) {
        this.f95236a = objectRef;
        this.f95237b = j0Var;
        this.f95238c = lVar;
        this.f95239d = nVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        i iVar;
        j jVar;
        if (continuation instanceof i) {
            iVar = (i) continuation;
            int i5 = iVar.f95235y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f95235y = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(this, continuation);
            }
        }
        Object obj2 = iVar.f95233w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = iVar.f95235y;
        if (i11 == 0) {
            ResultKt.b(obj2);
            r1 r1Var = (r1) this.f95236a.f71863a;
            if (r1Var != null) {
                r1Var.c(new ChildCancelledException());
                iVar.f95230t = this;
                iVar.f95231u = obj;
                iVar.f95232v = r1Var;
                iVar.f95235y = 1;
                if (r1Var.K(iVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            jVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            r1 r1Var2 = iVar.f95232v;
            obj = iVar.f95231u;
            jVar = iVar.f95230t;
            ResultKt.b(obj2);
        }
        jVar.f95236a.f71863a = m0.t(jVar.f95237b, null, l0.f88816d, new b0(jVar.f95238c, jVar.f95239d, obj, (Continuation) null), 1);
        return Unit.f71706a;
    }
}
