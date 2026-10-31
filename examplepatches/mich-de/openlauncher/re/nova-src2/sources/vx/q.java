package vx;

import com.instabridge.ai.protocol.PendingToolCall;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class q extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f93354t;

    /* renamed from: u, reason: collision with root package name */
    public PendingToolCall f93355u;

    /* renamed from: v, reason: collision with root package name */
    public long f93356v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f93357w;

    /* renamed from: x, reason: collision with root package name */
    public int f93358x;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93357w = obj;
        this.f93358x |= Integer.MIN_VALUE;
        t tVar = t.f93370a;
        return t.a(null, null, this);
    }
}
