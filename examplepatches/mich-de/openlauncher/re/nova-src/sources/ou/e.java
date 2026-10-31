package ou;

import android.content.Context;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final Context f80846a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f80847b;

    public e(Context context, CoroutineContext workContext) {
        Intrinsics.g(context, "context");
        Intrinsics.g(workContext, "workContext");
        this.f80846a = context;
        this.f80847b = workContext;
    }
}
