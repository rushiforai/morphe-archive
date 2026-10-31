package ads_mobile_sdk;

import c80.d;
import java.util.Map;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class w03 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public z03 f10981a;

    /* renamed from: b, reason: collision with root package name */
    public String f10982b;

    /* renamed from: c, reason: collision with root package name */
    public h50 f10983c;

    /* renamed from: d, reason: collision with root package name */
    public Map f10984d;

    /* renamed from: e, reason: collision with root package name */
    public d f10985e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f10986f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ z03 f10987g;

    /* renamed from: h, reason: collision with root package name */
    public int f10988h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w03(z03 z03Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10987g = z03Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10986f = obj;
        this.f10988h |= Integer.MIN_VALUE;
        return z03.a(this.f10987g, null, null, null, this);
    }
}
