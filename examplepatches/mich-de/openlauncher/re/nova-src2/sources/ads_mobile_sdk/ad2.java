package ads_mobile_sdk;

import kotlin.Pair;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ad2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public hd2 f931a;

    /* renamed from: b, reason: collision with root package name */
    public Pair f932b;

    /* renamed from: c, reason: collision with root package name */
    public c80.a f933c;

    /* renamed from: d, reason: collision with root package name */
    public int f934d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f935e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ hd2 f936f;

    /* renamed from: g, reason: collision with root package name */
    public int f937g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ad2(hd2 hd2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f936f = hd2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f935e = obj;
        this.f937g |= Integer.MIN_VALUE;
        return hd2.a(this.f936f, (Pair) null, (ue2) null, this);
    }
}
