package oi;

import kotlin.jvm.internal.Intrinsics;
import ni.p;

/* loaded from: classes3.dex */
public final class e extends p {

    /* renamed from: j, reason: collision with root package name */
    public d f80447j;

    /* renamed from: k, reason: collision with root package name */
    public String f80448k;

    /* renamed from: l, reason: collision with root package name */
    public ni.b f80449l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(String adUnitId) {
        super(adUnitId);
        Intrinsics.g(adUnitId, "adUnitId");
        this.f80447j = d.f80442b;
        this.f80448k = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f80449l = ni.b.f78245c;
    }

    @Override // ni.p
    public final p a() {
        return this;
    }

    public final f d() {
        String str = this.f78299a;
        if (str == null) {
            throw new IllegalArgumentException("Ad unit ID cannot be null.");
        }
        return new f(str, this.f78300b, this.f78301c, this.f78302d, this.f78303e, this.f78304f, this.f78305g, this.f78306h, this.f78307i, this.f80447j, this.f80449l, this.f80448k);
    }
}
