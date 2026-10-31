package ads_mobile_sdk;

import java.util.Map;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class h03 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f4165a;

    /* renamed from: b, reason: collision with root package name */
    public Object f4166b;

    /* renamed from: c, reason: collision with root package name */
    public ni.q f4167c;

    /* renamed from: d, reason: collision with root package name */
    public Map f4168d;

    /* renamed from: e, reason: collision with root package name */
    public qw2 f4169e;

    /* renamed from: f, reason: collision with root package name */
    public mi.a f4170f;

    /* renamed from: g, reason: collision with root package name */
    public th3 f4171g;

    /* renamed from: h, reason: collision with root package name */
    public th3 f4172h;

    /* renamed from: i, reason: collision with root package name */
    public /* synthetic */ Object f4173i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ i03 f4174j;

    /* renamed from: k, reason: collision with root package name */
    public int f4175k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h03(i03 i03Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4174j = i03Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4173i = obj;
        this.f4175k |= Integer.MIN_VALUE;
        return this.f4174j.a((Map.Entry) null, (ni.q) null, (Map) null, (qw2) null, (mi.a) null, this);
    }
}
