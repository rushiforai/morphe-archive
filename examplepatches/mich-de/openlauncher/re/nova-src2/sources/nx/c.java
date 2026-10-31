package nx;

import android.content.Context;
import b.u4;
import java.util.List;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;
import t70.m0;
import t70.y0;

/* loaded from: classes4.dex */
public final class c {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Context context, iv.c cVar, iv.c cVar2, ContinuationImpl continuationImpl) {
        a aVar;
        Ref.ObjectRef objectRefL;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f78611z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f78611z = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        Object obj = aVar.f78609x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f78611z;
        if (i11 == 0) {
            objectRefL = u4.l(obj);
            a80.e eVar = y0.f88884a;
            a80.d dVar = a80.d.f488c;
            b bVar = new b(context, objectRefL, null);
            aVar.f78605t = context;
            aVar.f78606u = cVar;
            aVar.f78607v = cVar2;
            aVar.f78608w = objectRefL;
            aVar.f78611z = 1;
            if (m0.y(dVar, bVar, aVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Ref.ObjectRef objectRef = aVar.f78608w;
            cVar2 = aVar.f78607v;
            cVar = aVar.f78606u;
            Context context2 = aVar.f78605t;
            ResultKt.b(obj);
            objectRefL = objectRef;
            context = context2;
        }
        return new d(context, (List) objectRefL.f71863a, cVar, cVar2);
    }
}
