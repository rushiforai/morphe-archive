package ni;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class j extends p {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(String adUnitId) {
        super(adUnitId);
        Intrinsics.g(adUnitId, "adUnitId");
    }

    @Override // ni.p
    public final p a() {
        return this;
    }

    public final k d() {
        String str = this.f78299a;
        if (str == null) {
            throw new IllegalArgumentException("Ad unit ID cannot be null.");
        }
        return new k(str, this.f78300b, this.f78301c, this.f78302d, this.f78303e, this.f78304f, this.f78305g, this.f78306h, this.f78307i);
    }
}
