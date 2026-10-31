package ads_mobile_sdk;

import java.util.Map;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class w01 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public h11 f10974a;

    /* renamed from: b, reason: collision with root package name */
    public x80.g0 f10975b;

    /* renamed from: c, reason: collision with root package name */
    public x80.g0 f10976c;

    /* renamed from: d, reason: collision with root package name */
    public String f10977d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f10978e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ h11 f10979f;

    /* renamed from: g, reason: collision with root package name */
    public int f10980g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w01(h11 h11Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10979f = h11Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10978e = obj;
        this.f10980g |= Integer.MIN_VALUE;
        return this.f10979f.a((String) null, (Map) null, this);
    }
}
