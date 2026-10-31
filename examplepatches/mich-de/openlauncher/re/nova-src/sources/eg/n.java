package eg;

import android.os.Bundle;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final bg.b f52724a;

    /* renamed from: b, reason: collision with root package name */
    public final Bundle f52725b;

    public n(bg.b bVar, Bundle serverParameters) {
        Intrinsics.g(serverParameters, "serverParameters");
        this.f52724a = bVar;
        this.f52725b = serverParameters;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof n)) {
            return false;
        }
        n nVar = (n) obj;
        return this.f52724a == nVar.f52724a && Intrinsics.b(this.f52725b, nVar.f52725b);
    }
}
