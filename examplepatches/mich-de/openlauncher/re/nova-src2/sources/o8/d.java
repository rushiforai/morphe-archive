package o8;

import c3.c1;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import x8.n;

/* loaded from: classes2.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final k f79692a;

    /* renamed from: b, reason: collision with root package name */
    public final n f79693b;

    /* renamed from: c, reason: collision with root package name */
    public final c80.f f79694c;

    public d(k kVar, n nVar, c80.f fVar) {
        this.f79692a = kVar;
        this.f79693b = nVar;
        this.f79694c = fVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) throws Throwable {
        c cVar;
        d dVar;
        c80.f fVar;
        Object obj;
        Throwable th2;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.f79691x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f79691x = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        Object obj2 = cVar.f79689v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f79691x;
        try {
            if (i11 == 0) {
                ResultKt.b(obj2);
                cVar.f79687t = this;
                c80.f fVar2 = this.f79694c;
                cVar.f79688u = fVar2;
                cVar.f79691x = 1;
                if (((c80.i) fVar2).a(cVar) != coroutineSingletons) {
                    dVar = this;
                    fVar = fVar2;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                obj = (c80.f) cVar.f79687t;
                try {
                    ResultKt.b(obj2);
                    e eVar = (e) obj2;
                    ((c80.i) obj).c();
                    return eVar;
                } catch (Throwable th3) {
                    th2 = th3;
                    ((c80.i) obj).c();
                    throw th2;
                }
            }
            c80.f fVar3 = cVar.f79688u;
            dVar = (d) cVar.f79687t;
            ResultKt.b(obj2);
            fVar = fVar3;
            c1 c1Var = new c1(dVar, 20);
            cVar.f79687t = fVar;
            cVar.f79688u = null;
            cVar.f79691x = 2;
            Object objS = ps.c.s(c1Var, cVar);
            if (objS != coroutineSingletons) {
                obj = fVar;
                obj2 = objS;
                e eVar2 = (e) obj2;
                ((c80.i) obj).c();
                return eVar2;
            }
            return coroutineSingletons;
        } catch (Throwable th4) {
            obj = fVar;
            th2 = th4;
            ((c80.i) obj).c();
            throw th2;
        }
    }
}
