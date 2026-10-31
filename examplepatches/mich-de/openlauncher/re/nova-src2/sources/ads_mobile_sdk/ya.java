package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ya extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public sb f11982a;

    /* renamed from: b, reason: collision with root package name */
    public d f11983b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f11984c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ sb f11985d;

    /* renamed from: e, reason: collision with root package name */
    public int f11986e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ya(sb sbVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11985d = sbVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11984c = obj;
        this.f11986e |= Integer.MIN_VALUE;
        return sb.a(this.f11985d, this);
    }
}
