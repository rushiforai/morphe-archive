package com.instabridge.mobilesdk.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Locale;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\u001a\u0014\u0010\u0000\u001a\u0004\u0018\u00010\u00012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0001H\u0000\u001a\u0014\u0010\u0003\u001a\u0004\u0018\u00010\u00012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0001H\u0000\u001a\u0010\u0010\u0005\u001a\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u0001H\u0000\u001a\u0014\u0010\u0006\u001a\u0004\u0018\u00010\u00012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0001H\u0000¨\u0006\u0007"}, d2 = {"isoCountryCode", b.f42142b, "regionCode", "countryNameOf", TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "countryFlagEmoji", "flagEmoji", "mobile-sdk_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class CountriesKt {
    @NotNull
    public static final String countryFlagEmoji(@NotNull String code) {
        Intrinsics.g(code, "code");
        String upperCase = code.toUpperCase(Locale.ROOT);
        Intrinsics.f(upperCase, "toUpperCase(...)");
        char[] chars = Character.toChars(upperCase.charAt(0) - 3675);
        Intrinsics.f(chars, "toChars(...)");
        String str = new String(chars);
        char[] chars2 = Character.toChars(upperCase.charAt(1) - 3675);
        Intrinsics.f(chars2, "toChars(...)");
        return str.concat(new String(chars2));
    }

    @Nullable
    public static final String countryNameOf(@Nullable String str) {
        String strIsoCountryCode = isoCountryCode(str);
        if (strIsoCountryCode == null) {
            return null;
        }
        String displayCountry = new Locale.Builder().setRegion(strIsoCountryCode).build().getDisplayCountry();
        Intrinsics.d(displayCountry);
        if (k.U0(displayCountry) || displayCountry.equals(strIsoCountryCode)) {
            return null;
        }
        return displayCountry;
    }

    @Nullable
    public static final String flagEmoji(@Nullable String str) {
        String strIsoCountryCode = isoCountryCode(str);
        if (strIsoCountryCode != null) {
            return countryFlagEmoji(strIsoCountryCode);
        }
        return null;
    }

    @Nullable
    public static final String isoCountryCode(@Nullable String str) {
        String string;
        if (str != null && (string = k.u1(str).toString()) != null) {
            String upperCase = string.toUpperCase(Locale.ROOT);
            Intrinsics.f(upperCase, "toUpperCase(...)");
            if (upperCase.length() == 2) {
                for (int i5 = 0; i5 < upperCase.length(); i5++) {
                    char cCharAt = upperCase.charAt(i5);
                    if ('A' <= cCharAt && cCharAt < '[') {
                    }
                }
                return upperCase;
            }
        }
        return null;
    }
}
