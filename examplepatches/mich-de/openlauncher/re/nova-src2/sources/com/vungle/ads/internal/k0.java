package com.vungle.ads.internal;

import android.content.Context;
import com.vungle.ads.VungleAdSize;
import com.vungle.ads.internal.model.j3;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k0 extends s {

    /* renamed from: q, reason: collision with root package name */
    public final VungleAdSize f46862q;

    /* renamed from: r, reason: collision with root package name */
    public volatile VungleAdSize f46863r;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k0(Context context, VungleAdSize adSize) {
        super(context);
        Intrinsics.g(context, "context");
        Intrinsics.g(adSize, "adSize");
        this.f46862q = adSize;
    }

    public final j0 a(com.vungle.ads.internal.presenter.b adPlayCallback) {
        Intrinsics.g(adPlayCallback, "adPlayCallback");
        return new j0(adPlayCallback, this);
    }

    @Override // com.vungle.ads.internal.s
    public final VungleAdSize b() {
        return this.f46862q;
    }

    public final VungleAdSize m() {
        VungleAdSize vungleAdSize = this.f46863r;
        return vungleAdSize == null ? this.f46862q : vungleAdSize;
    }

    @Override // com.vungle.ads.internal.s
    public final boolean a(j3 placement) {
        Intrinsics.g(placement, "placement");
        return placement.e() || placement.h() || placement.f();
    }

    @Override // com.vungle.ads.internal.s
    public final boolean a(VungleAdSize vungleAdSize) {
        if (vungleAdSize != null) {
            return vungleAdSize.isValidSize$vungle_ads_release();
        }
        return false;
    }

    @Override // com.vungle.ads.internal.s
    public final void a(com.vungle.ads.internal.model.i0 advertisement) {
        Intrinsics.g(advertisement, "advertisement");
        super.a(advertisement);
        com.vungle.ads.internal.util.s sVarE = e();
        Long lA = sVarE != null ? sVarE.a() : null;
        if ((lA != null && lA.longValue() == 3) || (lA != null && lA.longValue() == 4)) {
            l();
        }
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("req=");
        sbA.append(this.f46862q.getWidth());
        sbA.append('x');
        sbA.append(this.f46862q.getHeight());
        sbA.append(" resp=");
        sbA.append(advertisement.d());
        sbA.append('x');
        sbA.append(advertisement.a());
        sbA.append(" adaptW=");
        sbA.append(this.f46862q.getIsAdaptiveWidth());
        sbA.append(" adaptH=");
        sbA.append(this.f46862q.getIsAdaptiveHeight());
        String string = sbA.toString();
        if (this.f46862q.getIsAdaptiveWidth() || this.f46862q.getIsAdaptiveHeight()) {
            Pair pairA = com.vungle.ads.internal.util.a0.a(d());
            int iIntValue = ((Number) pairA.f71683a).intValue();
            int iIntValue2 = ((Number) pairA.f71684b).intValue();
            string = string + " device=" + iIntValue + 'x' + iIntValue2;
            int iD = this.f46862q.getIsAdaptiveWidth() ? advertisement.d() : this.f46862q.getWidth();
            int iA = this.f46862q.getIsAdaptiveHeight() ? advertisement.a() : this.f46862q.getHeight();
            int iMin = Math.min(iIntValue, iD);
            int iMin2 = Math.min(iIntValue2, iA);
            if (this.f46862q.getIsAdaptiveHeight() && this.f46862q.getHeight() > 0) {
                iMin2 = Math.min(this.f46862q.getHeight(), iMin2);
            }
            this.f46863r = new VungleAdSize(iMin, iMin2);
        }
        VungleAdSize vungleAdSizeM = m();
        StringBuilder sbK = com.google.android.gms.internal.measurement.k2.k(string, " final=");
        sbK.append(vungleAdSizeM.getWidth());
        sbK.append('x');
        sbK.append(vungleAdSizeM.getHeight());
        AnalyticsClient.INSTANCE.a(new k2(Sdk.SDKMetric.SDKMetricType.BANNER_SIZE_NEGOTIATED), e(), sbK.toString());
    }
}
