package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;
import ni.w;

/* loaded from: classes2.dex */
public final class su0 extends pu0 {

    /* renamed from: c, reason: collision with root package name */
    public final w f9692c;

    public su0(w wVar) {
        super(wd1.f11219g);
        this.f9692c = wVar;
    }

    public final w c() {
        return this.f9692c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof su0) && Intrinsics.b(this.f9692c, ((su0) obj).f9692c);
    }

    public final int hashCode() {
        return this.f9692c.hashCode();
    }

    public final String toString() {
        return "InternalMediationAdError(mediationAdError=" + this.f9692c + ")";
    }
}
