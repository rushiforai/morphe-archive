package x70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.IndexedValue;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes.dex */
public final class o implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ v70.i f95249a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f95250b;

    public o(v70.i iVar, int i5) {
        this.f95249a = iVar;
        this.f95250b = i5;
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0051, code lost:
    
        if (t70.m0.z(r0) == r1) goto L21;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        n nVar;
        if (continuation instanceof n) {
            nVar = (n) continuation;
            int i5 = nVar.f95248v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f95248v = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(this, continuation);
            }
        }
        Object obj2 = nVar.f95246t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nVar.f95248v;
        if (i11 == 0) {
            ResultKt.b(obj2);
            IndexedValue indexedValue = new IndexedValue(this.f95250b, obj);
            nVar.f95248v = 1;
            if (this.f95249a.t(indexedValue, nVar) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj2);
            return Unit.f71706a;
        }
        ResultKt.b(obj2);
        nVar.f95248v = 2;
    }
}
