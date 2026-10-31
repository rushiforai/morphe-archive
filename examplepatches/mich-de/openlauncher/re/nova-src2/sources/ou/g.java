package ou;

import android.content.Context;
import kotlin.LazyKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final Context f80869a;

    /* renamed from: b, reason: collision with root package name */
    public final String f80870b;

    /* renamed from: c, reason: collision with root package name */
    public final CoroutineContext f80871c;

    /* renamed from: d, reason: collision with root package name */
    public final a70.d f80872d;

    public g(Context context, String str, CoroutineContext workContext) {
        Intrinsics.g(context, "context");
        Intrinsics.g(workContext, "workContext");
        this.f80869a = context;
        this.f80870b = str;
        this.f80871c = workContext;
        this.f80872d = LazyKt.a(new n0.w(this, 2));
    }
}
