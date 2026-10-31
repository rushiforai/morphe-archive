package c9;

import h6.t;
import h6.u;
import h6.z;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public abstract class d {
    /* JADX WARN: Removed duplicated region for block: B:29:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(u uVar, ContinuationImpl continuationImpl) throws Throwable {
        b bVar;
        u uVar2;
        Ref.ObjectRef objectRef;
        Throwable th2;
        z zVar;
        z zVar2;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.f19857w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f19857w = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuationImpl);
            }
        }
        Object obj = bVar.f19856v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f19857w;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef = bVar.f19855u;
            uVar2 = bVar.f19854t;
            try {
                ResultKt.b(obj);
                zVar2 = (z) objectRef.f71863a;
                if (zVar2 != null) {
                    uVar2.c(zVar2);
                }
                return Unit.f71706a;
            } catch (Throwable th3) {
                th2 = th3;
                zVar = (z) objectRef.f71863a;
                if (zVar != null) {
                    uVar2.c(zVar);
                }
                throw th2;
            }
        }
        ResultKt.b(obj);
        if (uVar.b().compareTo(t.f59443d) >= 0) {
            return Unit.f71706a;
        }
        Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
        try {
            bVar.f19854t = uVar;
            bVar.f19855u = objectRef2;
            bVar.f19857w = 1;
            t70.m mVar = new t70.m(1, IntrinsicsKt.b(bVar));
            mVar.t();
            c cVar = new c(mVar, 0);
            objectRef2.f71863a = cVar;
            uVar.a(cVar);
            if (mVar.s() == coroutineSingletons) {
                return coroutineSingletons;
            }
            uVar2 = uVar;
            objectRef = objectRef2;
            zVar2 = (z) objectRef.f71863a;
            if (zVar2 != null) {
            }
            return Unit.f71706a;
        } catch (Throwable th4) {
            uVar2 = uVar;
            objectRef = objectRef2;
            th2 = th4;
            zVar = (z) objectRef.f71863a;
            if (zVar != null) {
            }
            throw th2;
        }
    }
}
