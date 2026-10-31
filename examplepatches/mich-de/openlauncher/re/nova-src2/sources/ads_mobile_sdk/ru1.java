package ads_mobile_sdk;

import b.p2;
import com.google.android.libraries.ads.mobile.sdk.internal.webview.PerAdNativeJavscriptEngineJsContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ru1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f9317a;

    /* renamed from: b, reason: collision with root package name */
    public Object f9318b;

    /* renamed from: c, reason: collision with root package name */
    public p2 f9319c;

    /* renamed from: d, reason: collision with root package name */
    public PerAdNativeJavscriptEngineJsContext f9320d;

    /* renamed from: e, reason: collision with root package name */
    public eg2 f9321e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f9322f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ su1 f9323g;

    /* renamed from: h, reason: collision with root package name */
    public int f9324h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ru1(su1 su1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9323g = su1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9322f = obj;
        this.f9324h |= Integer.MIN_VALUE;
        return this.f9323g.a((com.google.gson.r) null, (p2) null, (PerAdNativeJavscriptEngineJsContext) null, this);
    }
}
