package i20;

import java.io.Serializable;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public g f61201t;

    /* renamed from: u, reason: collision with root package name */
    public String f61202u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f61203v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ g f61204w;

    /* renamed from: x, reason: collision with root package name */
    public int f61205x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(g gVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f61204w = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f61203v = obj;
        this.f61205x |= Integer.MIN_VALUE;
        Serializable serializableI = g.i(this.f61204w, null, null, this);
        return serializableI == CoroutineSingletons.f71806a ? serializableI : new Result(serializableI);
    }
}
