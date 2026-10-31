package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class mb extends ContinuationImpl {

    /* renamed from: b, reason: collision with root package name */
    public ni.q f7070b;

    /* renamed from: d, reason: collision with root package name */
    public d f7071d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f7072e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ sb f7073f;

    /* renamed from: g, reason: collision with root package name */
    public int f7074g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mb(sb sbVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7073f = sbVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7072e = obj;
        this.f7074g |= Integer.MIN_VALUE;
        return sb.a(this.f7073f, (ni.q) null, (String) null, this);
    }
}
