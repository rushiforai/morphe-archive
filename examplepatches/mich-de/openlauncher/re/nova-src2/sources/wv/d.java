package wv;

import com.google.android.gms.internal.consent_sdk.z;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public z f94704t;

    /* renamed from: u, reason: collision with root package name */
    public JSONObject f94705u;

    /* renamed from: v, reason: collision with root package name */
    public String f94706v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f94707w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ z f94708x;

    /* renamed from: y, reason: collision with root package name */
    public int f94709y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(z zVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f94708x = zVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94707w = obj;
        this.f94709y |= Integer.MIN_VALUE;
        return this.f94708x.d(null, this);
    }
}
