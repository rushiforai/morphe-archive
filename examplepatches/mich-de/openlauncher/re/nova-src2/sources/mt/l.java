package mt;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l implements v {

    /* renamed from: a, reason: collision with root package name */
    public final k f76779a;

    public l(k kVar) {
        this.f76779a = kVar;
    }

    @Override // mt.v
    public final void a(xq.c logger) {
        Intrinsics.g(logger, "logger");
        logger.c("ConfirmationHandler.Result.Canceled: " + this.f76779a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof l) && this.f76779a == ((l) obj).f76779a;
    }

    public final int hashCode() {
        return this.f76779a.hashCode();
    }

    public final String toString() {
        return "Canceled(action=" + this.f76779a + ")";
    }
}
