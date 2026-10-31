package wu;

import n0.w;

/* loaded from: classes4.dex */
public final class d extends h {

    /* renamed from: b, reason: collision with root package name */
    public final w f94694b;

    public d(w wVar) {
        super(null);
        this.f94694b = wVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d) && this.f94694b.equals(((d) obj).f94694b);
    }

    public final int hashCode() {
        return this.f94694b.hashCode();
    }

    public final String toString() {
        return "FinishProcessing(onComplete=" + this.f94694b + ")";
    }
}
