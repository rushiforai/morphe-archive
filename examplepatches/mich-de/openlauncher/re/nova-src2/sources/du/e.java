package du;

import com.stripe.android.core.networking.ApiRequest$Options;
import java.io.Serializable;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f49532t;

    /* renamed from: u, reason: collision with root package name */
    public Serializable f49533u;

    /* renamed from: v, reason: collision with root package name */
    public ApiRequest$Options f49534v;

    /* renamed from: w, reason: collision with root package name */
    public Ref.ObjectRef f49535w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f49536x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ i f49537y;

    /* renamed from: z, reason: collision with root package name */
    public int f49538z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49537y = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49536x = obj;
        this.f49538z |= Integer.MIN_VALUE;
        Object objA = i.a(this.f49537y, null, null, null, 0L, this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
