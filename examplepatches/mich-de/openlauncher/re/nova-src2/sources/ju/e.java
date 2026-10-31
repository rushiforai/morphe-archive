package ju;

import com.stripe.android.core.networking.ApiRequest$Options;
import g.o;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public abstract class e {
    public void a() {
    }

    public void b(j.b bVar, j.a aVar) {
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0064, code lost:
    
        if (r2.d(r6, r7, r8, r0) == r1) goto L22;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ww.a aVar, Object obj, ApiRequest$Options apiRequest$Options, ContinuationImpl continuationImpl) {
        d dVar;
        e eVar;
        if (continuationImpl instanceof d) {
            dVar = (d) continuationImpl;
            int i5 = dVar.f69943z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f69943z = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(this, continuationImpl);
            }
        }
        Object obj2 = dVar.f69941x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.f69943z;
        if (i11 == 0) {
            ResultKt.b(obj2);
            o oVar = aVar.f94748c;
            dVar.f69937t = this;
            dVar.f69938u = aVar;
            dVar.f69939v = obj;
            dVar.f69940w = apiRequest$Options;
            dVar.f69943z = 1;
            if (android.support.v4.media.session.b.D(oVar, dVar) != coroutineSingletons) {
                eVar = this;
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
        apiRequest$Options = dVar.f69940w;
        obj = dVar.f69939v;
        aVar = dVar.f69938u;
        eVar = dVar.f69937t;
        ResultKt.b(obj2);
        dVar.f69937t = null;
        dVar.f69938u = null;
        dVar.f69939v = null;
        dVar.f69940w = null;
        dVar.f69943z = 2;
    }

    public abstract Object d(ww.a aVar, Object obj, ApiRequest$Options apiRequest$Options, d dVar);
}
