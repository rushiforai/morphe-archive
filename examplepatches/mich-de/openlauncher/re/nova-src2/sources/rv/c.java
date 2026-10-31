package rv;

import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import kotlin.Pair;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {
    public /* synthetic */ Object A;
    public final /* synthetic */ d B;
    public int C;

    /* renamed from: t, reason: collision with root package name */
    public d f86393t;

    /* renamed from: u, reason: collision with root package name */
    public String f86394u;

    /* renamed from: v, reason: collision with root package name */
    public SdkTransactionId f86395v;

    /* renamed from: w, reason: collision with root package name */
    public Pair[] f86396w;

    /* renamed from: x, reason: collision with root package name */
    public Pair[] f86397x;

    /* renamed from: y, reason: collision with root package name */
    public String f86398y;

    /* renamed from: z, reason: collision with root package name */
    public int f86399z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(d dVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.B = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.A = obj;
        this.C |= Integer.MIN_VALUE;
        return this.B.a(null, null, this);
    }
}
