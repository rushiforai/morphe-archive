package com.moloco.sdk.publisher.bidrequest;

import com.moloco.sdk.Init;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\n\u0010\u0000\u001a\u00020\u0001*\u00020\u0002¨\u0006\u0003"}, d2 = {"toGeo", "Lcom/moloco/sdk/publisher/bidrequest/Geo;", "Lcom/moloco/sdk/Init$SDKInitResponse$Geo;", "moloco-sdk_release"}, k = 2, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class GeoKt {
    @NotNull
    public static final Geo toGeo(@NotNull Init.SDKInitResponse.Geo geo) {
        Intrinsics.g(geo, "<this>");
        return new Geo(geo.getCity(), geo.getCountryIso3Code(), geo.getCountryIso2Code(), geo.getZipCode(), Float.valueOf(geo.getLatitude()), Float.valueOf(geo.getLongitude()));
    }
}
