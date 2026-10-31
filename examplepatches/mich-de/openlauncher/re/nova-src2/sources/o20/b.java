package o20;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.json.JSONException;
import t70.j0;

/* loaded from: classes4.dex */
public final class b extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f79392t;

    /* renamed from: u, reason: collision with root package name */
    public int f79393u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ f f79394v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ String f79395w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(f fVar, String str, Continuation continuation, int i5) {
        super(2, continuation);
        this.f79392t = i5;
        this.f79394v = fVar;
        this.f79395w = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f79392t) {
            case 0:
                return new b(this.f79394v, this.f79395w, continuation, 0);
            default:
                return new b(this.f79394v, this.f79395w, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        j0 j0Var = (j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f79392t) {
        }
        return ((b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws JSONException, IOException {
        switch (this.f79392t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f79393u;
                try {
                    if (i5 == 0) {
                        ResultKt.b(obj);
                        l lVar = this.f79394v.f79416b;
                        String str = this.f79395w;
                        this.f79393u = 1;
                        obj = lVar.d(str, this);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    } else {
                        if (i5 != 1) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                    }
                    List<p20.g> list = ((p20.i) obj).f82028a;
                    ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
                    for (p20.g gVar : list) {
                        arrayList.add(new o(gVar.f82024d, gVar.f82021a, "@" + gVar.f82022b, gVar.f82023c));
                    }
                    return arrayList;
                } catch (Throwable th2) {
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("SSML-SlackIngester");
                    bVar.p(th2, "usergroups.list failed, skipping", new Object[0]);
                    return EmptyList.f71733a;
                }
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f79393u;
                if (i11 != 0) {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                l lVar2 = this.f79394v.f79416b;
                this.f79393u = 1;
                Object objC = lVar2.c(this.f79395w, this);
                return objC == coroutineSingletons2 ? coroutineSingletons2 : objC;
        }
    }
}
