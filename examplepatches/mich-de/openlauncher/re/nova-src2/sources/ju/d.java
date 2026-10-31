package ju;

import com.stripe.android.core.networking.ApiRequest$Options;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public e f69937t;

    /* renamed from: u, reason: collision with root package name */
    public ww.a f69938u;

    /* renamed from: v, reason: collision with root package name */
    public Object f69939v;

    /* renamed from: w, reason: collision with root package name */
    public ApiRequest$Options f69940w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f69941x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ e f69942y;

    /* renamed from: z, reason: collision with root package name */
    public int f69943z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f69942y = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f69941x = obj;
        this.f69943z |= Integer.MIN_VALUE;
        return this.f69942y.c(null, null, null, this);
    }
}
