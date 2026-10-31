package ir;

import android.content.Context;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final xq.c f68014a;

    public i(Context context) {
        Intrinsics.g(context, "context");
        this.f68014a = (context.getApplicationInfo().flags & 2) != 0 ? xq.d.f96223a : xq.d.f96224b;
    }

    public final void a(String message) {
        Intrinsics.g(message, "message");
        this.f68014a.d(message);
    }
}
