package b00;

import android.content.Context;
import java.util.ArrayList;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import p1.s2;
import w70.u1;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final Context f16342a;

    /* renamed from: b, reason: collision with root package name */
    public final p1.e1 f16343b;

    /* renamed from: c, reason: collision with root package name */
    public final p1.e1 f16344c;

    public f(Context context) {
        this.f16342a = context;
        EmptyList emptyList = EmptyList.f71733a;
        this.f16343b = androidx.compose.runtime.d.k(emptyList);
        this.f16344c = androidx.compose.runtime.d.k(emptyList);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(f fVar, ContinuationImpl continuationImpl) {
        a aVar;
        ArrayList arrayList;
        ArrayList arrayList2;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f16295y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f16295y = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(fVar, continuationImpl);
            }
        }
        Object obj = aVar.f16293w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f16295y;
        if (i11 == 0) {
            ArrayList arrayListX = b.c0.x(obj);
            arrayList = new ArrayList();
            a80.e eVar = t70.y0.f88884a;
            a80.d dVar = a80.d.f488c;
            b bVar = new b(fVar, arrayList, arrayListX, null);
            aVar.f16290t = fVar;
            aVar.f16291u = arrayListX;
            aVar.f16292v = arrayList;
            aVar.f16295y = 1;
            if (t70.m0.y(dVar, bVar, aVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            arrayList2 = arrayListX;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ArrayList arrayList3 = aVar.f16292v;
            arrayList2 = aVar.f16291u;
            f fVar2 = aVar.f16290t;
            ResultKt.b(obj);
            arrayList = arrayList3;
            fVar = fVar2;
        }
        ((s2) fVar.f16343b).setValue(arrayList2);
        ((s2) fVar.f16344c).setValue(arrayList);
        return Unit.f71706a;
    }

    public final Object b(SuspendLambda suspendLambda) {
        Continuation continuation = null;
        Object objI = u1.i(new n8.q(new w70.u(new lm.i(100L, 1), u1.f(new e(this, continuation, 0)), null), 4), new a60.d(this, continuation, 22), suspendLambda);
        return objI == CoroutineSingletons.f71806a ? objI : Unit.f71706a;
    }
}
