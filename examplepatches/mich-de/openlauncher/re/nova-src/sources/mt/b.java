package mt;

import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements d {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f76729a;

    /* renamed from: b, reason: collision with root package name */
    public final ResolvableString f76730b;

    /* renamed from: c, reason: collision with root package name */
    public final s f76731c;

    public b(Throwable th2, ResolvableString message, s sVar) {
        Intrinsics.g(message, "message");
        this.f76729a = th2;
        this.f76730b = message;
        this.f76731c = sVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f76729a, bVar.f76729a) && Intrinsics.b(this.f76730b, bVar.f76730b) && Intrinsics.b(this.f76731c, bVar.f76731c);
    }

    public final int hashCode() {
        return this.f76731c.hashCode() + ((this.f76730b.hashCode() + (this.f76729a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "Fail(cause=" + this.f76729a + ", message=" + this.f76730b + ", errorType=" + this.f76731c + ")";
    }
}
