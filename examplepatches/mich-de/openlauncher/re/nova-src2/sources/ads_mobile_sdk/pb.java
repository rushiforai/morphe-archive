package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class pb extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public sb f8148a;

    /* renamed from: b, reason: collision with root package name */
    public va f8149b;

    /* renamed from: c, reason: collision with root package name */
    public d f8150c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f8151d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ sb f8152e;

    /* renamed from: f, reason: collision with root package name */
    public int f8153f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pb(sb sbVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8152e = sbVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8151d = obj;
        this.f8153f |= Integer.MIN_VALUE;
        return sb.a(this.f8152e, (va) null, this);
    }
}
