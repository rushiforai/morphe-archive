package ads_mobile_sdk;

import android.net.Uri;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class wm0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public zm0 f11327a;

    /* renamed from: b, reason: collision with root package name */
    public Uri.Builder f11328b;

    /* renamed from: c, reason: collision with root package name */
    public Uri.Builder f11329c;

    /* renamed from: d, reason: collision with root package name */
    public Uri f11330d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f11331e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ zm0 f11332f;

    /* renamed from: g, reason: collision with root package name */
    public int f11333g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wm0(zm0 zm0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11332f = zm0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11331e = obj;
        this.f11333g |= Integer.MIN_VALUE;
        return this.f11332f.a(null, this);
    }
}
