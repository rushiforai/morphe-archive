package com.instabridge.mobilesdk.internal.data.repo;

import ab.e0;
import b70.c;
import b70.d;
import b70.g;
import com.instabridge.mobilesdk.internal.Logger;
import com.instabridge.mobilesdk.internal.data.api.MobileApi;
import com.instabridge.mobilesdk.internal.data.api.a;
import com.instabridge.mobilesdk.internal.data.api.dto.EsimInstalledRequest;
import com.instabridge.mobilesdk.internal.data.api.dto.EsimRecordDto;
import com.instabridge.mobilesdk.internal.data.api.dto.PriceAmountDto;
import com.instabridge.mobilesdk.internal.data.api.dto.PriceDurationDto;
import com.instabridge.mobilesdk.internal.data.api.dto.RegionDto;
import com.instabridge.mobilesdk.internal.data.api.dto.RegionPricesResponse;
import com.instabridge.mobilesdk.internal.data.api.dto.SupportedRegionsResponse;
import com.instabridge.mobilesdk.internal.data.api.dto.TravelEsimDto;
import com.instabridge.mobilesdk.internal.data.api.dto.TravelEsimRequest;
import com.instabridge.mobilesdk.internal.data.api.dto.TravelEsimResponse;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import eb0.p0;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.math.MathKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;
import r70.k;

@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\t\b\u0001\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J(\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u00072\u0006\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\fH\u0086@¢\u0006\u0004\b\r\u0010\u000eJ\u001c\u0010\u000f\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00110\u00100\u0007H\u0086@¢\u0006\u0004\b\u0012\u0010\u0013J*\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00150\u00072\b\u0010\u000b\u001a\u0004\u0018\u00010\f2\b\b\u0002\u0010\u0016\u001a\u00020\u0017H\u0086@¢\u0006\u0004\b\u0018\u0010\u0019J\"\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u001b0\u00072\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\fH\u0086@¢\u0006\u0004\b\u001d\u0010\u001eJ0\u0010\u001f\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020 0\u00100\u00072\u0006\u0010!\u001a\u00020\f2\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010\fH\u0086@¢\u0006\u0004\b#\u0010$J\u001c\u0010%\u001a\b\u0012\u0004\u0012\u00020 0\u00102\f\u0010&\u001a\b\u0012\u0004\u0012\u00020 0\u0010H\u0002J\u0010\u0010'\u001a\u00020\f2\u0006\u0010(\u001a\u00020\fH\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006)"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/TravelRepository;", b.f42142b, "api", "Lcom/instabridge/mobilesdk/internal/data/api/MobileApi;", "<init>", "(Lcom/instabridge/mobilesdk/internal/data/api/MobileApi;)V", "reportEsimInstalled", "Lkotlin/Result;", b.f42142b, "esimId", b.f42142b, "deviceId", b.f42142b, "reportEsimInstalled-0E7RQCE", "(JLjava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getEsims", b.f42142b, "Lcom/instabridge/mobilesdk/internal/data/repo/EsimRecord;", "getEsims-IoAF18A", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getEsimProfile", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelEsim;", "isNewEsimRequired", b.f42142b, "getEsimProfile-0E7RQCE", "(Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getDestinations", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelDestinations;", "currentCountryCode", "getDestinations-gIAlu-s", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getPlans", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;", "regionCode", "addressCountry", "getPlans-0E7RQCE", "(Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "withPerGbSavings", "plans", "regionName", TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class TravelRepository {
    public static final int $stable = 8;

    @NotNull
    private final MobileApi api;

    public TravelRepository(@NotNull MobileApi api) {
        Intrinsics.g(api, "api");
        this.api = api;
    }

    /* renamed from: getDestinations-gIAlu-s$default, reason: not valid java name */
    public static /* synthetic */ Object m197getDestinationsgIAlus$default(TravelRepository travelRepository, String str, Continuation continuation, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = null;
        }
        return travelRepository.m200getDestinationsgIAlus(str, continuation);
    }

    /* renamed from: getEsimProfile-0E7RQCE$default, reason: not valid java name */
    public static /* synthetic */ Object m198getEsimProfile0E7RQCE$default(TravelRepository travelRepository, String str, boolean z11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        return travelRepository.m201getEsimProfile0E7RQCE(str, z11, continuation);
    }

    /* renamed from: getPlans-0E7RQCE$default, reason: not valid java name */
    public static /* synthetic */ Object m199getPlans0E7RQCE$default(TravelRepository travelRepository, String str, String str2, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            str2 = null;
        }
        return travelRepository.m203getPlans0E7RQCE(str, str2, continuation);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Comparable getPlans_0E7RQCE$lambda$25$lambda$23(TravelPlan it) {
        Intrinsics.g(it, "it");
        return Long.valueOf(it.getDataBytes());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Comparable getPlans_0E7RQCE$lambda$25$lambda$24(TravelPlan it) {
        Intrinsics.g(it, "it");
        return Integer.valueOf(it.getDurationHours());
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterative(DepthRegionTraversal.java:31)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visit(SwitchOverStringVisitor.java:60)
     */
    private final String regionName(String code) throws IOException {
        String upperCase = code.toUpperCase(Locale.ROOT);
        Intrinsics.f(upperCase, "toUpperCase(...)");
        switch (upperCase.hashCode()) {
            case -1691648921:
                if (upperCase.equals("MIDDLE_EAST")) {
                    return "Middle East";
                }
                break;
            case 2224:
                if (upperCase.equals("EU")) {
                    return "Europe";
                }
                break;
            case 2018506:
                if (upperCase.equals("ASIA")) {
                    return "Asia";
                }
                break;
            case 72206827:
                if (upperCase.equals("LATAM")) {
                    return "Latin America";
                }
                break;
            case 448015508:
                if (upperCase.equals("NORTH_AMERICA")) {
                    return "North America";
                }
                break;
            case 1928056442:
                if (upperCase.equals("AFRICA")) {
                    return "Africa";
                }
                break;
            case 2056432034:
                if (upperCase.equals("EUROPE")) {
                    return "Europe";
                }
                break;
            case 2105276323:
                if (upperCase.equals("GLOBAL")) {
                    return "Global";
                }
                break;
        }
        List listH1 = k.h1(code, new char[]{'_', ' '}, 6);
        ArrayList arrayList = new ArrayList();
        for (Object obj : listH1) {
            if (!k.U0((String) obj)) {
                arrayList.add(obj);
            }
        }
        String strF1 = g.f1(arrayList, " ", null, null, 0, new a(5), 30);
        return k.U0(strF1) ? code : strF1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence regionName$lambda$31(String word) {
        Intrinsics.g(word, "word");
        Locale locale = Locale.ROOT;
        String lowerCase = word.toLowerCase(locale);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        if (lowerCase.length() <= 0) {
            return lowerCase;
        }
        StringBuilder sb2 = new StringBuilder();
        String strValueOf = String.valueOf(lowerCase.charAt(0));
        Intrinsics.e(strValueOf, "null cannot be cast to non-null type java.lang.String");
        String upperCase = strValueOf.toUpperCase(locale);
        Intrinsics.f(upperCase, "toUpperCase(...)");
        sb2.append((Object) upperCase);
        String strSubstring = lowerCase.substring(1);
        Intrinsics.f(strSubstring, "substring(...)");
        sb2.append(strSubstring);
        return sb2.toString();
    }

    private final List<TravelPlan> withPerGbSavings(List<TravelPlan> plans) {
        List<TravelPlan> list = plans;
        ArrayList arrayList = new ArrayList();
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            Double pricePerGb = ((TravelPlan) it.next()).getPricePerGb();
            if (pricePerGb != null) {
                arrayList.add(pricePerGb);
            }
        }
        Double dK1 = g.k1(arrayList);
        if (dK1 != null) {
            double dDoubleValue = dK1.doubleValue();
            if (dDoubleValue > 0.0d) {
                ArrayList arrayList2 = new ArrayList(c.u0(list, 10));
                for (TravelPlan travelPlanCopy$default : list) {
                    Double pricePerGb2 = travelPlanCopy$default.getPricePerGb();
                    if (pricePerGb2 != null) {
                        int iA = MathKt.a((1.0d - (pricePerGb2.doubleValue() / dDoubleValue)) * 100.0d);
                        Integer numValueOf = Integer.valueOf(iA);
                        if (iA < 1) {
                            numValueOf = null;
                        }
                        travelPlanCopy$default = TravelPlan.copy$default(travelPlanCopy$default, 0L, 0, 0.0d, null, numValueOf, null, 47, null);
                    }
                    arrayList2.add(travelPlanCopy$default);
                }
                return arrayList2;
            }
        }
        return plans;
    }

    /* JADX WARN: Removed duplicated region for block: B:64:0x014c A[Catch: all -> 0x002d, TryCatch #0 {all -> 0x002d, blocks: (B:12:0x0029, B:23:0x004b, B:25:0x0055, B:27:0x005b, B:28:0x006a, B:30:0x0070, B:32:0x007c, B:33:0x0080, B:34:0x0098, B:36:0x009f, B:37:0x00a9, B:39:0x00af, B:42:0x00c1, B:44:0x00c5, B:45:0x00c9, B:47:0x00d8, B:48:0x00f3, B:49:0x0102, B:51:0x0108, B:53:0x0119, B:54:0x011d, B:55:0x012c, B:57:0x0132, B:59:0x0142, B:65:0x0154, B:64:0x014c, B:66:0x0161, B:68:0x0169, B:69:0x0170, B:70:0x0171, B:71:0x018a, B:19:0x003b), top: B:74:0x0021 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    @Nullable
    /* renamed from: getDestinations-gIAlu-s, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m200getDestinationsgIAlus(@Nullable String str, @NotNull Continuation<? super Result<TravelDestinations>> continuation) {
        TravelRepository$getDestinations$1 travelRepository$getDestinations$1;
        TravelRepository travelRepository;
        if (continuation instanceof TravelRepository$getDestinations$1) {
            travelRepository$getDestinations$1 = (TravelRepository$getDestinations$1) continuation;
            int i5 = travelRepository$getDestinations$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                travelRepository$getDestinations$1.label = i5 - Integer.MIN_VALUE;
            } else {
                travelRepository$getDestinations$1 = new TravelRepository$getDestinations$1(this, continuation);
            }
        }
        Object supportedRegions = travelRepository$getDestinations$1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = travelRepository$getDestinations$1.label;
        try {
            if (i11 == 0) {
                ResultKt.b(supportedRegions);
                int i12 = Result.f71687b;
                MobileApi mobileApi = this.api;
                travelRepository$getDestinations$1.L$0 = this;
                travelRepository$getDestinations$1.label = 1;
                supportedRegions = mobileApi.getSupportedRegions(str, travelRepository$getDestinations$1);
                if (supportedRegions == coroutineSingletons) {
                    return coroutineSingletons;
                }
                travelRepository = this;
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                travelRepository = (TravelRepository) travelRepository$getDestinations$1.L$0;
                ResultKt.b(supportedRegions);
            }
            p0 p0Var = (p0) supportedRegions;
            if (!p0Var.f52631a.c()) {
                throw new IllegalStateException(("v1/regions " + p0Var.f52631a.f95556d).toString());
            }
            SupportedRegionsResponse supportedRegionsResponse = (SupportedRegionsResponse) p0Var.f52632b;
            if (supportedRegionsResponse == null) {
                throw new IllegalStateException("empty v1/regions body");
            }
            List<String> countryCodes = supportedRegionsResponse.getCountryCodes();
            ArrayList arrayList = new ArrayList();
            Iterator<T> it = countryCodes.iterator();
            while (it.hasNext()) {
                TravelCountry travelCountryAsTravelCountry = TravelRepositoryKt.asTravelCountry((String) it.next());
                if (travelCountryAsTravelCountry != null) {
                    arrayList.add(travelCountryAsTravelCountry);
                }
            }
            List listD1 = g.D1(new Comparator() { // from class: com.instabridge.mobilesdk.internal.data.repo.TravelRepository$getDestinations_gIAlu_s$lambda$18$$inlined$sortedBy$1
                /* JADX WARN: Multi-variable type inference failed */
                @Override // java.util.Comparator
                public final int compare(T t6, T t9) {
                    String name = ((TravelCountry) t6).getName();
                    Locale locale = Locale.ROOT;
                    String lowerCase = name.toLowerCase(locale);
                    Intrinsics.f(lowerCase, "toLowerCase(...)");
                    String lowerCase2 = ((TravelCountry) t9).getName().toLowerCase(locale);
                    Intrinsics.f(lowerCase2, "toLowerCase(...)");
                    return e0.t(lowerCase, lowerCase2);
                }
            }, arrayList);
            List<String> recommendedCountryCodes = supportedRegionsResponse.getRecommendedCountryCodes();
            ArrayList arrayList2 = new ArrayList();
            Iterator<T> it2 = recommendedCountryCodes.iterator();
            while (true) {
                Object obj = null;
                if (!it2.hasNext()) {
                    break;
                }
                String str2 = (String) it2.next();
                Iterator it3 = arrayList.iterator();
                while (true) {
                    if (!it3.hasNext()) {
                        break;
                    }
                    Object next = it3.next();
                    if (j.B0(((TravelCountry) next).getCode(), str2, true)) {
                        obj = next;
                        break;
                    }
                }
                TravelCountry travelCountry = (TravelCountry) obj;
                if (travelCountry != null) {
                    arrayList2.add(travelCountry);
                }
            }
            int size = supportedRegionsResponse.getRecommendedCountryCodes().size() - arrayList2.size();
            if (size > 0) {
                Logger.INSTANCE.d("v1/regions: dropped " + size + " recommendation(s) absent from countryCodes");
            }
            List<RegionDto> regions = supportedRegionsResponse.getRegions();
            ArrayList arrayList3 = new ArrayList();
            for (Object obj2 : regions) {
                if (!k.U0(((RegionDto) obj2).getCode())) {
                    arrayList3.add(obj2);
                }
            }
            ArrayList arrayList4 = new ArrayList(c.u0(arrayList3, 10));
            Iterator it4 = arrayList3.iterator();
            while (it4.hasNext()) {
                RegionDto regionDto = (RegionDto) it4.next();
                String code = regionDto.getCode();
                String displayName = regionDto.getDisplayName();
                if (displayName == null) {
                    displayName = travelRepository.regionName(regionDto.getCode());
                } else {
                    if (k.U0(displayName)) {
                        displayName = null;
                    }
                    if (displayName == null) {
                    }
                }
                arrayList4.add(new TravelRegion(code, displayName, regionDto.getCountryCodes()));
            }
            TravelDestinations travelDestinations = new TravelDestinations(listD1, arrayList2, arrayList4);
            int i13 = Result.f71687b;
            return travelDestinations;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    @Nullable
    /* renamed from: getEsimProfile-0E7RQCE, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m201getEsimProfile0E7RQCE(@Nullable String str, boolean z11, @NotNull Continuation<? super Result<TravelEsim>> continuation) {
        TravelRepository$getEsimProfile$1 travelRepository$getEsimProfile$1;
        TravelEsimDto esim;
        if (continuation instanceof TravelRepository$getEsimProfile$1) {
            travelRepository$getEsimProfile$1 = (TravelRepository$getEsimProfile$1) continuation;
            int i5 = travelRepository$getEsimProfile$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                travelRepository$getEsimProfile$1.label = i5 - Integer.MIN_VALUE;
            } else {
                travelRepository$getEsimProfile$1 = new TravelRepository$getEsimProfile$1(this, continuation);
            }
        }
        Object travelEsim = travelRepository$getEsimProfile$1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = travelRepository$getEsimProfile$1.label;
        try {
            if (i11 == 0) {
                ResultKt.b(travelEsim);
                int i12 = Result.f71687b;
                MobileApi mobileApi = this.api;
                Boolean bool = Boolean.TRUE;
                if (!z11) {
                    bool = null;
                }
                TravelEsimRequest travelEsimRequest = new TravelEsimRequest((Integer) null, str, bool, 1, (DefaultConstructorMarker) null);
                travelRepository$getEsimProfile$1.label = 1;
                travelEsim = mobileApi.getTravelEsim(travelEsimRequest, travelRepository$getEsimProfile$1);
                if (travelEsim == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(travelEsim);
            }
            p0 p0Var = (p0) travelEsim;
            if (!p0Var.f52631a.c()) {
                throw new IllegalStateException(("esims/purchase " + p0Var.f52631a.f95556d).toString());
            }
            TravelEsimResponse travelEsimResponse = (TravelEsimResponse) p0Var.f52632b;
            if (travelEsimResponse == null || (esim = travelEsimResponse.getEsim()) == null) {
                throw new IllegalStateException("empty esims/purchase body");
            }
            TravelEsim travelEsimOrNull = TravelRepositoryKt.toTravelEsimOrNull(esim);
            if (travelEsimOrNull == null) {
                throw new IllegalStateException("esims/purchase returned no activation code");
            }
            int i13 = Result.f71687b;
            return travelEsimOrNull;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    @Nullable
    /* renamed from: getEsims-IoAF18A, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m202getEsimsIoAF18A(@NotNull Continuation<? super Result<? extends List<EsimRecord>>> continuation) {
        TravelRepository$getEsims$1 travelRepository$getEsims$1;
        if (continuation instanceof TravelRepository$getEsims$1) {
            travelRepository$getEsims$1 = (TravelRepository$getEsims$1) continuation;
            int i5 = travelRepository$getEsims$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                travelRepository$getEsims$1.label = i5 - Integer.MIN_VALUE;
            } else {
                travelRepository$getEsims$1 = new TravelRepository$getEsims$1(this, continuation);
            }
        }
        Object esims = travelRepository$getEsims$1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = travelRepository$getEsims$1.label;
        try {
            if (i11 == 0) {
                ResultKt.b(esims);
                int i12 = Result.f71687b;
                MobileApi mobileApi = this.api;
                travelRepository$getEsims$1.label = 1;
                esims = mobileApi.getEsims(travelRepository$getEsims$1);
                if (esims == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(esims);
            }
            p0 p0Var = (p0) esims;
            if (!p0Var.f52631a.c()) {
                throw new IllegalStateException(("v1/esims " + p0Var.f52631a.f95556d).toString());
            }
            List<EsimRecordDto> list = (List) p0Var.f52632b;
            if (list == null) {
                throw new IllegalStateException("empty v1/esims body");
            }
            ArrayList arrayList = new ArrayList();
            for (EsimRecordDto esimRecordDto : list) {
                String iccid = esimRecordDto.getIccid();
                EsimRecord esimRecord = null;
                String str = !k.U0(iccid) ? iccid : null;
                if (str != null) {
                    long id2 = esimRecordDto.getId();
                    String activationCode = esimRecordDto.getActivationCode();
                    String smdpAddress = esimRecordDto.getSmdpAddress();
                    String manualActivationCode = esimRecordDto.getManualActivationCode();
                    String purchaseDate = esimRecordDto.getPurchaseDate();
                    esimRecord = new EsimRecord(id2, str, activationCode, smdpAddress, manualActivationCode, (purchaseDate == null || k.U0(purchaseDate)) ? null : purchaseDate, esimRecordDto.getInstalled());
                }
                if (esimRecord != null) {
                    arrayList.add(esimRecord);
                }
            }
            final com.google.firebase.crashlytics.internal.persistence.c cVar = new com.google.firebase.crashlytics.internal.persistence.c(3);
            List listD1 = g.D1(new Comparator() { // from class: com.instabridge.mobilesdk.internal.data.repo.TravelRepository$getEsims_IoAF18A$lambda$7$$inlined$compareBy$1
                /* JADX WARN: Multi-variable type inference failed */
                @Override // java.util.Comparator
                public final int compare(T t6, T t9) {
                    return cVar.compare(((EsimRecord) t6).getPurchasedAt(), ((EsimRecord) t9).getPurchasedAt());
                }
            }, arrayList);
            int i13 = Result.f71687b;
            return listD1;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    @Nullable
    /* renamed from: getPlans-0E7RQCE, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m203getPlans0E7RQCE(@NotNull String str, @Nullable String str2, @NotNull Continuation<? super Result<? extends List<TravelPlan>>> continuation) {
        TravelRepository$getPlans$1 travelRepository$getPlans$1;
        TravelRepository travelRepository;
        TravelPlan travelPlan;
        if (continuation instanceof TravelRepository$getPlans$1) {
            travelRepository$getPlans$1 = (TravelRepository$getPlans$1) continuation;
            int i5 = travelRepository$getPlans$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                travelRepository$getPlans$1.label = i5 - Integer.MIN_VALUE;
            } else {
                travelRepository$getPlans$1 = new TravelRepository$getPlans$1(this, continuation);
            }
        }
        Object regionPrices = travelRepository$getPlans$1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = travelRepository$getPlans$1.label;
        try {
            if (i11 == 0) {
                ResultKt.b(regionPrices);
                int i12 = Result.f71687b;
                MobileApi mobileApi = this.api;
                travelRepository$getPlans$1.L$0 = this;
                travelRepository$getPlans$1.label = 1;
                regionPrices = mobileApi.getRegionPrices(str, str2, travelRepository$getPlans$1);
                if (regionPrices == coroutineSingletons) {
                    return coroutineSingletons;
                }
                travelRepository = this;
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                travelRepository = (TravelRepository) travelRepository$getPlans$1.L$0;
                ResultKt.b(regionPrices);
            }
            p0 p0Var = (p0) regionPrices;
            if (!p0Var.f52631a.c()) {
                throw new IllegalStateException(("v1/prices " + p0Var.f52631a.f95556d).toString());
            }
            RegionPricesResponse regionPricesResponse = (RegionPricesResponse) p0Var.f52632b;
            if (regionPricesResponse == null) {
                throw new IllegalStateException("empty v1/prices body");
            }
            List<PriceAmountDto> amounts = regionPricesResponse.getAmounts();
            ArrayList arrayList = new ArrayList();
            for (PriceAmountDto priceAmountDto : amounts) {
                List<PriceDurationDto> durations = priceAmountDto.getDurations();
                ArrayList arrayList2 = new ArrayList(c.u0(durations, 10));
                Iterator<T> it = durations.iterator();
                while (it.hasNext()) {
                    arrayList2.add(new Pair(priceAmountDto, (PriceDurationDto) it.next()));
                }
                d.z0(arrayList2, arrayList);
            }
            ArrayList arrayList3 = new ArrayList();
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                Pair pair = (Pair) it2.next();
                PriceAmountDto priceAmountDto2 = (PriceAmountDto) pair.f71683a;
                PriceDurationDto priceDurationDto = (PriceDurationDto) pair.f71684b;
                Double total = priceDurationDto.getPrice().getTotal();
                if (total != null) {
                    double dDoubleValue = total.doubleValue();
                    long amount = priceAmountDto2.getAmount();
                    int durationHours = (int) priceDurationDto.getDurationHours();
                    String currency = priceDurationDto.getPrice().getCurrency();
                    if (currency == null) {
                        currency = b.f42142b;
                    }
                    if (k.U0(currency)) {
                        currency = "USD";
                    }
                    travelPlan = new TravelPlan(amount, durationHours, dDoubleValue, currency, (Integer) null, priceDurationDto.getPrice().getSubTotal(), 16, (DefaultConstructorMarker) null);
                } else {
                    travelPlan = null;
                }
                if (travelPlan != null) {
                    arrayList3.add(travelPlan);
                }
            }
            List<TravelPlan> listWithPerGbSavings = travelRepository.withPerGbSavings(g.D1(new ay.g(new Function1[]{new a(3), new a(4)}, 2), arrayList3));
            int i13 = Result.f71687b;
            return listWithPerGbSavings;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    @Nullable
    /* renamed from: reportEsimInstalled-0E7RQCE, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m204reportEsimInstalled0E7RQCE(long j11, @Nullable String str, @NotNull Continuation<? super Result<Unit>> continuation) {
        TravelRepository$reportEsimInstalled$1 travelRepository$reportEsimInstalled$1;
        if (continuation instanceof TravelRepository$reportEsimInstalled$1) {
            travelRepository$reportEsimInstalled$1 = (TravelRepository$reportEsimInstalled$1) continuation;
            int i5 = travelRepository$reportEsimInstalled$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                travelRepository$reportEsimInstalled$1.label = i5 - Integer.MIN_VALUE;
            } else {
                travelRepository$reportEsimInstalled$1 = new TravelRepository$reportEsimInstalled$1(this, continuation);
            }
        }
        Object objMarkEsimInstalled = travelRepository$reportEsimInstalled$1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = travelRepository$reportEsimInstalled$1.label;
        int i12 = 1;
        try {
            if (i11 == 0) {
                ResultKt.b(objMarkEsimInstalled);
                int i13 = Result.f71687b;
                if (j11 == 0) {
                    throw new IllegalArgumentException("esim id required to report an install");
                }
                MobileApi mobileApi = this.api;
                EsimInstalledRequest esimInstalledRequest = new EsimInstalledRequest(false, str, i12, (DefaultConstructorMarker) null);
                travelRepository$reportEsimInstalled$1.J$0 = j11;
                travelRepository$reportEsimInstalled$1.label = 1;
                objMarkEsimInstalled = mobileApi.markEsimInstalled(j11, esimInstalledRequest, travelRepository$reportEsimInstalled$1);
                if (objMarkEsimInstalled == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                j11 = travelRepository$reportEsimInstalled$1.J$0;
                ResultKt.b(objMarkEsimInstalled);
            }
            p0 p0Var = (p0) objMarkEsimInstalled;
            if (p0Var.f52631a.c()) {
                Unit unit = Unit.f71706a;
                int i14 = Result.f71687b;
                return unit;
            }
            throw new IllegalStateException(("esims/" + j11 + " " + p0Var.f52631a.f95556d).toString());
        } catch (Throwable th2) {
            int i15 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }
}
