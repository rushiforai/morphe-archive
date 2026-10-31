package ads_mobile_sdk;

import android.net.Uri;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class xs3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public zs3 f11814a;

    /* renamed from: b, reason: collision with root package name */
    public Uri f11815b;

    /* renamed from: c, reason: collision with root package name */
    public String f11816c;

    /* renamed from: d, reason: collision with root package name */
    public String f11817d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f11818e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ zs3 f11819f;

    /* renamed from: g, reason: collision with root package name */
    public int f11820g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xs3(zs3 zs3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11819f = zs3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11818e = obj;
        this.f11820g |= Integer.MIN_VALUE;
        return this.f11819f.a(null, this);
    }
}
