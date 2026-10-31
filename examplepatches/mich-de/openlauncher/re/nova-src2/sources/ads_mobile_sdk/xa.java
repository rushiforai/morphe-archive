package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class xa extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public sb f11646a;

    /* renamed from: b, reason: collision with root package name */
    public String f11647b;

    /* renamed from: c, reason: collision with root package name */
    public Object f11648c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f11649d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ sb f11650e;

    /* renamed from: f, reason: collision with root package name */
    public int f11651f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xa(sb sbVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11650e = sbVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11649d = obj;
        this.f11651f |= Integer.MIN_VALUE;
        return sb.a(this.f11650e, (String) null, (oa) null, this);
    }
}
