package mt;

import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t implements v {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f76805a;

    /* renamed from: b, reason: collision with root package name */
    public final ResolvableString f76806b;

    /* renamed from: c, reason: collision with root package name */
    public final s f76807c;

    public t(Throwable cause, ResolvableString message, s sVar) {
        Intrinsics.g(cause, "cause");
        Intrinsics.g(message, "message");
        this.f76805a = cause;
        this.f76806b = message;
        this.f76807c = sVar;
    }

    @Override // mt.v
    public final void a(xq.c logger) {
        Intrinsics.g(logger, "logger");
        logger.b("ConfirmationHandler.Result.Failed", this.f76805a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t)) {
            return false;
        }
        t tVar = (t) obj;
        return Intrinsics.b(this.f76805a, tVar.f76805a) && Intrinsics.b(this.f76806b, tVar.f76806b) && Intrinsics.b(this.f76807c, tVar.f76807c);
    }

    public final int hashCode() {
        return this.f76807c.hashCode() + ((this.f76806b.hashCode() + (this.f76805a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "Failed(cause=" + this.f76805a + ", message=" + this.f76806b + ", type=" + this.f76807c + ")";
    }
}
