package p10;

import java.util.ArrayList;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class p extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f81865t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ long f81866u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f81867v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ s f81868w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ String f81869x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(long j11, Ref.ObjectRef objectRef, s sVar, String str, Continuation continuation) {
        super(2, continuation);
        this.f81866u = j11;
        this.f81867v = objectRef;
        this.f81868w = sVar;
        this.f81869x = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        p pVar = new p(this.f81866u, this.f81867v, this.f81868w, this.f81869x, continuation);
        pVar.f81865t = obj;
        return pVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((p) create((y5.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        y5.b bVar = (y5.b) this.f81865t;
        y5.f fVar = s.f81891d;
        Long l9 = (Long) bVar.b(fVar);
        long jLongValue = l9 != null ? l9.longValue() : 0L;
        long j11 = this.f81866u;
        long j12 = jLongValue + j11;
        Ref.ObjectRef objectRef = this.f81867v;
        if (j12 < 0) {
            objectRef.f71863a = new z(jLongValue, -j11);
            return Unit.f71706a;
        }
        y5.f fVar2 = s.f81892e;
        String str = (String) bVar.b(fVar2);
        ArrayList arrayListU1 = b70.g.u1(str == null ? EmptyList.f71733a : (List) s.f81893f.decodeFromString(s.f81894g, str), new k(((Number) this.f81868w.f81896b.invoke()).longValue(), this.f81866u, this.f81869x));
        bVar.e(fVar, new Long(j12));
        bVar.e(fVar2, s.f81893f.encodeToString(s.f81894g, arrayListU1));
        objectRef.f71863a = new a0(j12);
        return Unit.f71706a;
    }
}
