package eg;

import android.content.Context;
import android.os.Bundle;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public final Context f52708a;

    public e(Context context, String str, Bundle bundle, Bundle bundle2) {
        Intrinsics.g(context, "context");
        this.f52708a = context;
    }

    public abstract int a();

    public abstract int b();

    public abstract String c();

    public final int d() {
        return a();
    }

    public final int e() {
        return b();
    }
}
