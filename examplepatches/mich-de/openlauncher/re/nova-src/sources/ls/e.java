package ls;

import com.stripe.android.link.model.ConsentPresentation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e implements f {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f75091a;

    /* renamed from: b, reason: collision with root package name */
    public final ConsentPresentation f75092b;

    public e(boolean z11, ConsentPresentation consentPresentation) {
        this.f75091a = z11;
        this.f75092b = consentPresentation;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return this.f75091a == eVar.f75091a && Intrinsics.b(this.f75092b, eVar.f75092b);
    }

    public final int hashCode() {
        int iHashCode = Boolean.hashCode(this.f75091a) * 31;
        ConsentPresentation consentPresentation = this.f75092b;
        return iHashCode + (consentPresentation == null ? 0 : consentPresentation.hashCode());
    }

    public final String toString() {
        return "Verified(hasVerifiedSMSSession=" + this.f75091a + ", consentPresentation=" + this.f75092b + ")";
    }
}
