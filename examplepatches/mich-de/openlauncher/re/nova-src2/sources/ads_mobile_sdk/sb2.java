package ads_mobile_sdk;

import c80.d;
import com.google.android.libraries.ads.mobile.sdk.internal.webview.PerAdNativeJavscriptEngineJsContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class sb2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public PerAdNativeJavscriptEngineJsContext f9499a;

    /* renamed from: b, reason: collision with root package name */
    public String f9500b;

    /* renamed from: c, reason: collision with root package name */
    public b.gb f9501c;

    /* renamed from: d, reason: collision with root package name */
    public d f9502d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f9503e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ PerAdNativeJavscriptEngineJsContext f9504f;

    /* renamed from: g, reason: collision with root package name */
    public int f9505g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sb2(PerAdNativeJavscriptEngineJsContext perAdNativeJavscriptEngineJsContext, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9504f = perAdNativeJavscriptEngineJsContext;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9503e = obj;
        this.f9505g |= Integer.MIN_VALUE;
        return this.f9504f.a((String) null, (b.gb) null, this);
    }
}
