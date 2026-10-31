package t5;

import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class k implements o0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ c80.a f88628a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f88629b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f88630c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ c0 f88631d;

    public k(c80.a aVar, Ref.BooleanRef booleanRef, Ref.ObjectRef objectRef, c0 c0Var) {
        this.f88628a = aVar;
        this.f88629b = booleanRef;
        this.f88630c = objectRef;
        this.f88631d = c0Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00b6 A[Catch: all -> 0x0054, TRY_LEAVE, TryCatch #0 {all -> 0x0054, blocks: (B:21:0x0050, B:36:0x00ae, B:38:0x00b6), top: B:53:0x0050 }] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r7v2, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(e eVar, ContinuationImpl continuationImpl) throws Throwable {
        j jVar;
        c0 c0Var;
        c80.d dVar;
        Ref.BooleanRef booleanRef;
        Ref.ObjectRef objectRef;
        Function2 function2;
        c80.a aVar;
        c80.a aVar2;
        c0 c0Var2;
        Object obj;
        Ref.ObjectRef objectRef2;
        if (continuationImpl instanceof j) {
            jVar = (j) continuationImpl;
            int i5 = jVar.A;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.A = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(this, continuationImpl);
            }
        }
        Object obj2 = jVar.f88619y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jVar.A;
        try {
            if (i11 == 0) {
                ResultKt.b(obj2);
                jVar.f88614t = eVar;
                c80.a aVar3 = this.f88628a;
                jVar.f88615u = aVar3;
                Ref.BooleanRef booleanRef2 = this.f88629b;
                jVar.f88616v = booleanRef2;
                Ref.ObjectRef objectRef3 = this.f88630c;
                jVar.f88617w = objectRef3;
                c0Var = this.f88631d;
                jVar.f88618x = c0Var;
                jVar.A = 1;
                dVar = (c80.d) aVar3;
                if (dVar.e(jVar) != coroutineSingletons) {
                    booleanRef = booleanRef2;
                    objectRef = objectRef3;
                    function2 = eVar;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    obj = jVar.f88616v;
                    objectRef2 = (Ref.ObjectRef) jVar.f88615u;
                    aVar = (c80.a) jVar.f88614t;
                    try {
                        ResultKt.b(obj2);
                        objectRef2.f71863a = obj;
                        objectRef = objectRef2;
                        Object obj3 = objectRef.f71863a;
                        ((c80.d) aVar).g(null);
                        return obj3;
                    } catch (Throwable th2) {
                        th = th2;
                        ((c80.d) aVar).g(null);
                        throw th;
                    }
                }
                c0Var2 = (c0) jVar.f88616v;
                objectRef = (Ref.ObjectRef) jVar.f88615u;
                aVar2 = (c80.a) jVar.f88614t;
                try {
                    ResultKt.b(obj2);
                    if (!Intrinsics.b(obj2, objectRef.f71863a)) {
                        aVar = aVar2;
                        Object obj32 = objectRef.f71863a;
                        ((c80.d) aVar).g(null);
                        return obj32;
                    }
                    jVar.f88614t = aVar2;
                    jVar.f88615u = objectRef;
                    jVar.f88616v = obj2;
                    jVar.A = 3;
                    if (c0Var2.j(obj2, false, jVar) != coroutineSingletons) {
                        obj = obj2;
                        objectRef2 = objectRef;
                        aVar = aVar2;
                        objectRef2.f71863a = obj;
                        objectRef = objectRef2;
                        Object obj322 = objectRef.f71863a;
                        ((c80.d) aVar).g(null);
                        return obj322;
                    }
                    return coroutineSingletons;
                } catch (Throwable th3) {
                    th = th3;
                    aVar = aVar2;
                    ((c80.d) aVar).g(null);
                    throw th;
                }
            }
            c0 c0Var3 = jVar.f88618x;
            objectRef = jVar.f88617w;
            booleanRef = (Ref.BooleanRef) jVar.f88616v;
            ?? r72 = (c80.a) jVar.f88615u;
            Function2 function22 = (Function2) jVar.f88614t;
            ResultKt.b(obj2);
            c0Var = c0Var3;
            function2 = function22;
            dVar = r72;
            if (booleanRef.f71859a) {
                throw new IllegalStateException("InitializerApi.updateData should not be called after initialization is complete.");
            }
            Object obj4 = objectRef.f71863a;
            jVar.f88614t = dVar;
            jVar.f88615u = objectRef;
            jVar.f88616v = c0Var;
            jVar.f88617w = null;
            jVar.f88618x = null;
            jVar.A = 2;
            Object objInvoke = function2.invoke(obj4, jVar);
            if (objInvoke != coroutineSingletons) {
                aVar2 = dVar;
                obj2 = objInvoke;
                c0Var2 = c0Var;
                if (!Intrinsics.b(obj2, objectRef.f71863a)) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th4) {
            th = th4;
            aVar = dVar;
            ((c80.d) aVar).g(null);
            throw th;
        }
    }
}
