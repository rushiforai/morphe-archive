package com.instabridge.mobilesdk.internal.data.repo;

import a80.m;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;
import r70.k;

@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001B7\u0012\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u000e\b\u0002\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00070\u0003¢\u0006\u0004\b\b\u0010\tJ\u001a\u0010\u000e\u001a\u00020\u000f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011J\u0012\u0010\u0013\u001a\u0004\u0018\u00010\u00072\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011J\u000f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u000f\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u000f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00070\u0003HÆ\u0003J9\u0010\u0017\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\u000e\b\u0002\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00070\u0003HÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u000f2\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u001bHÖ\u0001J\t\u0010\u001c\u001a\u00020\u0011HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0017\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00070\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000b¨\u0006\u001d"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/TravelDestinations;", b.f42142b, "countries", b.f42142b, "Lcom/instabridge/mobilesdk/internal/data/repo/TravelCountry;", "popular", "regions", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelRegion;", "<init>", "(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V", "getCountries", "()Ljava/util/List;", "getPopular", "getRegions", "covers", b.f42142b, "packageRegion", b.f42142b, "country", "regionOf", "component1", "component2", "component3", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final /* data */ class TravelDestinations {
    public static final int $stable = 8;

    @NotNull
    private final List<TravelCountry> countries;

    @NotNull
    private final List<TravelCountry> popular;

    @NotNull
    private final List<TravelRegion> regions;

    public TravelDestinations() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ TravelDestinations copy$default(TravelDestinations travelDestinations, List list, List list2, List list3, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            list = travelDestinations.countries;
        }
        if ((i5 & 2) != 0) {
            list2 = travelDestinations.popular;
        }
        if ((i5 & 4) != 0) {
            list3 = travelDestinations.regions;
        }
        return travelDestinations.copy(list, list2, list3);
    }

    @NotNull
    public final List<TravelCountry> component1() {
        return this.countries;
    }

    @NotNull
    public final List<TravelCountry> component2() {
        return this.popular;
    }

    @NotNull
    public final List<TravelRegion> component3() {
        return this.regions;
    }

    @NotNull
    public final TravelDestinations copy(@NotNull List<TravelCountry> countries, @NotNull List<TravelCountry> popular, @NotNull List<TravelRegion> regions) {
        Intrinsics.g(countries, "countries");
        Intrinsics.g(popular, "popular");
        Intrinsics.g(regions, "regions");
        return new TravelDestinations(countries, popular, regions);
    }

    public final boolean covers(@Nullable String packageRegion, @Nullable String country) {
        String string;
        String string2;
        List<String> countryCodes;
        if (packageRegion != null && (string = k.u1(packageRegion).toString()) != null) {
            Object obj = null;
            if (k.U0(string)) {
                string = null;
            }
            if (string != null && country != null && (string2 = k.u1(country).toString()) != null) {
                if (k.U0(string2)) {
                    string2 = null;
                }
                if (string2 != null) {
                    if (string.equalsIgnoreCase(string2)) {
                        return true;
                    }
                    Iterator<T> it = this.regions.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        Object next = it.next();
                        if (j.B0(((TravelRegion) next).getCode(), string, true)) {
                            obj = next;
                            break;
                        }
                    }
                    TravelRegion travelRegion = (TravelRegion) obj;
                    if (travelRegion != null && (countryCodes = travelRegion.getCountryCodes()) != null) {
                        List<String> list = countryCodes;
                        if (!(list instanceof Collection) || !list.isEmpty()) {
                            Iterator<T> it2 = list.iterator();
                            while (it2.hasNext()) {
                                if (j.B0((String) it2.next(), string2, true)) {
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TravelDestinations)) {
            return false;
        }
        TravelDestinations travelDestinations = (TravelDestinations) other;
        return Intrinsics.b(this.countries, travelDestinations.countries) && Intrinsics.b(this.popular, travelDestinations.popular) && Intrinsics.b(this.regions, travelDestinations.regions);
    }

    @NotNull
    public final List<TravelCountry> getCountries() {
        return this.countries;
    }

    @NotNull
    public final List<TravelCountry> getPopular() {
        return this.popular;
    }

    @NotNull
    public final List<TravelRegion> getRegions() {
        return this.regions;
    }

    public int hashCode() {
        return this.regions.hashCode() + u4.c(this.countries.hashCode() * 31, 31, this.popular);
    }

    @Nullable
    public final TravelRegion regionOf(@Nullable String packageRegion) {
        String string;
        Object obj = null;
        if (packageRegion == null || (string = k.u1(packageRegion).toString()) == null) {
            return null;
        }
        if (k.U0(string)) {
            string = null;
        }
        if (string == null) {
            return null;
        }
        Iterator<T> it = this.regions.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Object next = it.next();
            if (j.B0(((TravelRegion) next).getCode(), string, true)) {
                obj = next;
                break;
            }
        }
        return (TravelRegion) obj;
    }

    @NotNull
    public String toString() {
        List<TravelCountry> list = this.countries;
        List<TravelCountry> list2 = this.popular;
        List<TravelRegion> list3 = this.regions;
        StringBuilder sb2 = new StringBuilder("TravelDestinations(countries=");
        sb2.append(list);
        sb2.append(", popular=");
        sb2.append(list2);
        sb2.append(", regions=");
        return m.j(sb2, list3, ")");
    }

    public TravelDestinations(@NotNull List<TravelCountry> countries, @NotNull List<TravelCountry> popular, @NotNull List<TravelRegion> regions) {
        Intrinsics.g(countries, "countries");
        Intrinsics.g(popular, "popular");
        Intrinsics.g(regions, "regions");
        this.countries = countries;
        this.popular = popular;
        this.regions = regions;
    }

    public TravelDestinations(List list, List list2, List list3, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? EmptyList.f71733a : list, (i5 & 2) != 0 ? EmptyList.f71733a : list2, (i5 & 4) != 0 ? EmptyList.f71733a : list3);
    }
}
