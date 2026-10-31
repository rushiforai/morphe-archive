package n0;

import java.util.ArrayList;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.TypeIntrinsics;

/* loaded from: classes.dex */
public final class d implements z2.c1 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f77407a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f77408b = new ArrayList();

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        c cVar;
        Ref.ObjectRef objectRef;
        Throwable th2;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.f77401w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f77401w = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        Object obj = cVar.f77399u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f77401w;
        ArrayList arrayList = this.f77408b;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (!this.f77407a) {
                Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
                try {
                    cVar.f77398t = objectRef2;
                    cVar.f77401w = 1;
                    t70.m mVar = new t70.m(1, IntrinsicsKt.b(cVar));
                    mVar.t();
                    objectRef2.f71863a = mVar;
                    arrayList.add(mVar);
                    if (mVar.s() == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    objectRef = objectRef2;
                    Object obj2 = objectRef.f71863a;
                    TypeIntrinsics.a(arrayList);
                    arrayList.remove(obj2);
                } catch (Throwable th3) {
                    objectRef = objectRef2;
                    th2 = th3;
                    Object obj3 = objectRef.f71863a;
                    TypeIntrinsics.a(arrayList);
                    arrayList.remove(obj3);
                    throw th2;
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef = cVar.f77398t;
            try {
                ResultKt.b(obj);
                Object obj22 = objectRef.f71863a;
                TypeIntrinsics.a(arrayList);
                arrayList.remove(obj22);
            } catch (Throwable th4) {
                th2 = th4;
                Object obj32 = objectRef.f71863a;
                TypeIntrinsics.a(arrayList);
                arrayList.remove(obj32);
                throw th2;
            }
        }
        return Unit.f71706a;
    }
}
