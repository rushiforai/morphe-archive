package ads_mobile_sdk;

import b.p2;
import com.google.android.libraries.ads.mobile.sdk.internal.webview.PerAdNativeJavscriptEngineJsContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class qu1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public su1 f8814a;

    /* renamed from: b, reason: collision with root package name */
    public p2 f8815b;

    /* renamed from: c, reason: collision with root package name */
    public PerAdNativeJavscriptEngineJsContext f8816c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f8817d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ su1 f8818e;

    /* renamed from: f, reason: collision with root package name */
    public int f8819f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qu1(su1 su1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8818e = su1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8817d = obj;
        this.f8819f |= Integer.MIN_VALUE;
        return su1.a(this.f8818e, this);
    }
}
