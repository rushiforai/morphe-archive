package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class zq extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f12603a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f12604b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f12605c;

    /* renamed from: d, reason: collision with root package name */
    public Ref.ObjectRef f12606d;

    /* renamed from: e, reason: collision with root package name */
    public Ref.ObjectRef f12607e;

    /* renamed from: f, reason: collision with root package name */
    public d f12608f;

    /* renamed from: g, reason: collision with root package name */
    public /* synthetic */ Object f12609g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ dr f12610h;

    /* renamed from: i, reason: collision with root package name */
    public int f12611i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zq(dr drVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12610h = drVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12609g = obj;
        this.f12611i |= Integer.MIN_VALUE;
        return dr.a(this.f12610h, this);
    }
}
