package ads_mobile_sdk;

import android.net.Uri;
import android.os.Bundle;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ym0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public zm0 f12191a;

    /* renamed from: b, reason: collision with root package name */
    public rm0 f12192b;

    /* renamed from: c, reason: collision with root package name */
    public Bundle f12193c;

    /* renamed from: d, reason: collision with root package name */
    public Uri.Builder f12194d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f12195e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ zm0 f12196f;

    /* renamed from: g, reason: collision with root package name */
    public int f12197g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ym0(zm0 zm0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12196f = zm0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12195e = obj;
        this.f12197g |= Integer.MIN_VALUE;
        return this.f12196f.a(null, null, null, this);
    }
}
