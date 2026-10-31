package tx;

import android.content.SharedPreferences;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class f0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public SharedPreferences f89721t;

    /* renamed from: u, reason: collision with root package name */
    public String f89722u;

    /* renamed from: v, reason: collision with root package name */
    public String f89723v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f89724w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ j0 f89725x;

    /* renamed from: y, reason: collision with root package name */
    public int f89726y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f0(j0 j0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89725x = j0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89724w = obj;
        this.f89726y |= Integer.MIN_VALUE;
        return this.f89725x.b(null, null, null, this);
    }
}
