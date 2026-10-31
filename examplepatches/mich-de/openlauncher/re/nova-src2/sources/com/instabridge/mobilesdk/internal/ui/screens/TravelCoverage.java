package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.PurchasedPackage;
import com.instabridge.mobilesdk.internal.CountriesKt;
import com.instabridge.mobilesdk.internal.data.repo.TravelCountry;
import com.instabridge.mobilesdk.internal.data.repo.TravelDestinations;
import com.instabridge.mobilesdk.internal.data.repo.TravelRegion;
import com.instabridge.mobilesdk.internal.data.repo.TravelRepositoryKt;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00020\u0001B\u001b\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u000e\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u000e\u0010\f\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u000bJ\u000e\u0010\r\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u000bJ\u0014\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00100\u000f2\u0006\u0010\n\u001a\u00020\u000bR\u0010\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0011"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/screens/TravelCoverage;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "destinations", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelDestinations;", "currentCountry", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Lcom/instabridge/mobilesdk/internal/data/repo/TravelDestinations;Ljava/lang/String;)V", "covers", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "plan", "Lcom/instabridge/mobilesdk/PurchasedPackage;", "placeName", "hereName", "countriesOf", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/mobilesdk/internal/data/repo/TravelCountry;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class TravelCoverage {
    public static final int $stable = 8;

    @Nullable
    private final String currentCountry;

    @Nullable
    private final TravelDestinations destinations;

    public TravelCoverage(@Nullable TravelDestinations travelDestinations, @Nullable String str) {
        this.destinations = travelDestinations;
        this.currentCountry = str;
    }

    @NotNull
    public final List<TravelCountry> countriesOf(@NotNull PurchasedPackage plan) {
        TravelRegion travelRegionRegionOf;
        Intrinsics.g(plan, "plan");
        List<String> coveredCountryCodes = plan.getCoveredCountryCodes();
        List<String> countryCodes = null;
        if (coveredCountryCodes.isEmpty()) {
            coveredCountryCodes = null;
        }
        if (coveredCountryCodes == null) {
            TravelDestinations travelDestinations = this.destinations;
            if (travelDestinations != null && (travelRegionRegionOf = travelDestinations.regionOf(plan.getRegionCode())) != null) {
                countryCodes = travelRegionRegionOf.getCountryCodes();
            }
            if (countryCodes == null) {
                return EmptyList.f71733a;
            }
            coveredCountryCodes = countryCodes;
        }
        ArrayList arrayList = new ArrayList();
        Iterator<T> it = coveredCountryCodes.iterator();
        while (it.hasNext()) {
            TravelCountry travelCountryAsTravelCountry = TravelRepositoryKt.asTravelCountry((String) it.next());
            if (travelCountryAsTravelCountry != null) {
                arrayList.add(travelCountryAsTravelCountry);
            }
        }
        return b70.g.D1(new Comparator() { // from class: com.instabridge.mobilesdk.internal.ui.screens.TravelCoverage$countriesOf$$inlined$sortedBy$1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // java.util.Comparator
            public final int compare(T t6, T t9) {
                String name = ((TravelCountry) t6).getName();
                Locale locale = Locale.ROOT;
                String lowerCase = name.toLowerCase(locale);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
                String lowerCase2 = ((TravelCountry) t9).getName().toLowerCase(locale);
                Intrinsics.f(lowerCase2, "toLowerCase(...)");
                return ab.e0.t(lowerCase, lowerCase2);
            }
        }, arrayList);
    }

    public final boolean covers(@NotNull PurchasedPackage plan) {
        String string;
        TravelDestinations travelDestinations;
        TravelRegion travelRegionRegionOf;
        List<String> countryCodes;
        Intrinsics.g(plan, "plan");
        if (plan.coversCountry(this.currentCountry)) {
            return true;
        }
        String str = this.currentCountry;
        if (str != null && (string = r70.k.u1(str).toString()) != null) {
            if (r70.k.U0(string)) {
                string = null;
            }
            if (string != null && (travelDestinations = this.destinations) != null && (travelRegionRegionOf = travelDestinations.regionOf(plan.getRegionCode())) != null && (countryCodes = travelRegionRegionOf.getCountryCodes()) != null) {
                List<String> list = countryCodes;
                if (!(list instanceof Collection) || !list.isEmpty()) {
                    Iterator<T> it = list.iterator();
                    while (it.hasNext()) {
                        if (r70.j.B0(r70.k.u1((String) it.next()).toString(), string, true)) {
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    @NotNull
    public final String hereName(@NotNull PurchasedPackage plan) {
        String strCountryNameOf;
        Intrinsics.g(plan, "plan");
        String str = this.currentCountry;
        return (str == null || (strCountryNameOf = CountriesKt.countryNameOf(str)) == null) ? placeName(plan) : strCountryNameOf;
    }

    @NotNull
    public final String placeName(@NotNull PurchasedPackage plan) {
        String string;
        TravelRegion travelRegionRegionOf;
        Intrinsics.g(plan, "plan");
        String strPlanCountryName = DashboardTravelKt.planCountryName(plan);
        if (strPlanCountryName == null) {
            TravelDestinations travelDestinations = this.destinations;
            String strTitleCaseCode = null;
            strPlanCountryName = (travelDestinations == null || (travelRegionRegionOf = travelDestinations.regionOf(plan.getRegionCode())) == null) ? null : travelRegionRegionOf.getName();
            if (strPlanCountryName == null) {
                String regionCode = plan.getRegionCode();
                if (regionCode != null && (string = r70.k.u1(regionCode).toString()) != null) {
                    if (r70.k.U0(string)) {
                        string = null;
                    }
                    if (string != null) {
                        strTitleCaseCode = DashboardTravelKt.titleCaseCode(string);
                    }
                }
                return strTitleCaseCode == null ? "your destination" : strTitleCaseCode;
            }
        }
        return strPlanCountryName;
    }
}
