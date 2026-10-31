package e20;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;

/* loaded from: classes.dex */
public final class q extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Map f52076t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Map f52077u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ r f52078v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(r rVar, Continuation continuation) {
        super(3, continuation);
        this.f52078v = rVar;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        q qVar = new q(this.f52078v, (Continuation) obj3);
        qVar.f52076t = (Map) obj;
        qVar.f52077u = (Map) obj2;
        return qVar.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        Map map = this.f52076t;
        Map map2 = this.f52077u;
        long jCurrentTimeMillis = System.currentTimeMillis();
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : map.entrySet()) {
            Long l9 = (Long) map2.get(new h(((k) entry.getKey()).f52040b));
            if (l9 == null || jCurrentTimeMillis - l9.longValue() >= 3600000) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        ArrayList arrayList = new ArrayList(linkedHashMap.size());
        for (Map.Entry entry2 : linkedHashMap.entrySet()) {
            arrayList.add(new Pair(((k) entry2.getKey()).f52041c, entry2.getValue()));
        }
        return arrayList;
    }
}
