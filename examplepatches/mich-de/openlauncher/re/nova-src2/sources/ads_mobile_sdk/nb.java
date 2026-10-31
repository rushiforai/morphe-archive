package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class nb extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public sb f7458a;

    /* renamed from: b, reason: collision with root package name */
    public Object f7459b;

    /* renamed from: c, reason: collision with root package name */
    public d f7460c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f7461d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ sb f7462e;

    /* renamed from: f, reason: collision with root package name */
    public int f7463f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nb(sb sbVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7462e = sbVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7461d = obj;
        this.f7463f |= Integer.MIN_VALUE;
        return sb.b(this.f7462e, this);
    }
}
