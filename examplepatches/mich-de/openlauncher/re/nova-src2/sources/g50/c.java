package g50;

import java.net.HttpURLConnection;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class c extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public k50.d f57174t;

    /* renamed from: u, reason: collision with root package name */
    public CoroutineContext f57175u;

    /* renamed from: v, reason: collision with root package name */
    public v50.d f57176v;

    /* renamed from: w, reason: collision with root package name */
    public r50.c f57177w;

    /* renamed from: x, reason: collision with root package name */
    public HttpURLConnection f57178x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f57179y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ e f57180z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f57180z = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f57179y = obj;
        this.A |= Integer.MIN_VALUE;
        return this.f57180z.a(null, this);
    }
}
