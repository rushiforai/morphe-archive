package w70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class j implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f93937a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n f93938b;

    public j(k kVar, Ref.ObjectRef objectRef, n nVar) {
        this.f93937a = objectRef;
        this.f93938b = nVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        i iVar;
        if (continuation instanceof i) {
            iVar = (i) continuation;
            int i5 = iVar.f93924v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f93924v = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(this, continuation);
            }
        }
        Object obj2 = iVar.f93922t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = iVar.f93924v;
        if (i11 == 0) {
            ResultKt.b(obj2);
            Ref.ObjectRef objectRef = this.f93937a;
            Object obj3 = objectRef.f71863a;
            if (obj3 != x70.b.f95216b && Intrinsics.b(obj3, obj)) {
                return Unit.f71706a;
            }
            objectRef.f71863a = obj;
            iVar.f93924v = 1;
            if (this.f93938b.emit(obj, iVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj2);
        }
        return Unit.f71706a;
    }
}
