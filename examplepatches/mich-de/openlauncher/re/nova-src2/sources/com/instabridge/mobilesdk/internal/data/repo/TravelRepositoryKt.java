package com.instabridge.mobilesdk.internal.data.repo;

import com.instabridge.mobilesdk.internal.CountriesKt;
import com.instabridge.mobilesdk.internal.data.api.dto.TravelEsimDto;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000\u0016\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u000e\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u0002H\u0000\u001a\u000e\u0010\u0003\u001a\u0004\u0018\u00010\u0004*\u00020\u0005H\u0000¨\u0006\u0006"}, d2 = {"asTravelCountry", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelCountry;", b.f42142b, "toTravelEsimOrNull", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelEsim;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimDto;", "mobile-sdk_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class TravelRepositoryKt {
    @Nullable
    public static final TravelCountry asTravelCountry(@NotNull String str) {
        String strCountryNameOf;
        Intrinsics.g(str, "<this>");
        String strIsoCountryCode = CountriesKt.isoCountryCode(str);
        if (strIsoCountryCode == null || (strCountryNameOf = CountriesKt.countryNameOf(strIsoCountryCode)) == null) {
            return null;
        }
        return new TravelCountry(strIsoCountryCode, strCountryNameOf);
    }

    @Nullable
    public static final TravelEsim toTravelEsimOrNull(@NotNull TravelEsimDto travelEsimDto) {
        Intrinsics.g(travelEsimDto, "<this>");
        if (k.U0(travelEsimDto.getActivationCode())) {
            travelEsimDto = null;
        }
        if (travelEsimDto != null) {
            return new TravelEsim(travelEsimDto.getId(), travelEsimDto.getIccid(), travelEsimDto.getActivationCode(), travelEsimDto.getSmdpAddress(), travelEsimDto.getManualActivationCode());
        }
        return null;
    }
}
