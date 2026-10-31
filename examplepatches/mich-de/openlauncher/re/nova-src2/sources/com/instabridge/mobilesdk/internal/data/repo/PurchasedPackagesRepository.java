package com.instabridge.mobilesdk.internal.data.repo;

import b70.d;
import com.instabridge.mobilesdk.PurchasedPackage;
import com.instabridge.mobilesdk.internal.data.api.MobileApi;
import com.instabridge.mobilesdk.internal.data.api.dto.PackageModelDto;
import com.instabridge.mobilesdk.internal.data.api.dto.PurchasedMobileDatumDto;
import com.instabridge.mobilesdk.internal.data.api.dto.PurchasedPackageDto;
import com.instabridge.mobilesdk.internal.data.api.dto.PurchasedPackagesResponse;
import com.instabridge.mobilesdk.internal.data.api.dto.PurchasedRegionCountriesDto;
import com.instabridge.mobilesdk.internal.data.api.dto.PurchasedRegionDto;
import com.instabridge.mobilesdk.internal.data.api.dto.UsageDto;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import eb0.p0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u001c\u0010\u0006\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\t0\b0\u0007H\u0086@¢\u0006\u0004\b\n\u0010\u000bJ2\u0010\f\u001a\b\u0012\u0004\u0012\u00020\r0\u00072\u0006\u0010\u000e\u001a\u00020\u000f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0086@¢\u0006\u0004\b\u0013\u0010\u0014J\u000e\u0010\u0015\u001a\u0004\u0018\u00010\t*\u00020\u0016H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0017"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/PurchasedPackagesRepository;", b.f42142b, "api", "Lcom/instabridge/mobilesdk/internal/data/api/MobileApi;", "<init>", "(Lcom/instabridge/mobilesdk/internal/data/api/MobileApi;)V", "getPackages", "Lkotlin/Result;", b.f42142b, "Lcom/instabridge/mobilesdk/PurchasedPackage;", "getPackages-IoAF18A", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "cancelSubscription", b.f42142b, "subscriptionId", b.f42142b, "reason", b.f42142b, "feedback", "cancelSubscription-BWLJW6A", "(JLjava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "toPublic", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedPackageDto;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class PurchasedPackagesRepository {
    public static final int $stable = 8;

    @NotNull
    private final MobileApi api;

    public PurchasedPackagesRepository(@NotNull MobileApi api) {
        Intrinsics.g(api, "api");
        this.api = api;
    }

    private final PurchasedPackage toPublic(PurchasedPackageDto purchasedPackageDto) {
        PackageModelDto packageModel = purchasedPackageDto.getPackageModel();
        if (packageModel == null) {
            return null;
        }
        long packageId = packageModel.getPackageId();
        String name = packageModel.getName();
        if (name == null) {
            name = b.f42142b;
        }
        String type = packageModel.getType();
        String externalPlanType = packageModel.getExternalPlanType();
        long amount = packageModel.getAmount() / 1000000;
        int durationHours = (int) packageModel.getDurationHours();
        int cycles = packageModel.getCycles();
        if (cycles < 1) {
            cycles = 1;
        }
        int voice = (int) packageModel.getVoice();
        int sms = (int) packageModel.getSms();
        boolean zIsPremium = packageModel.isPremium();
        long purchaseId = purchasedPackageDto.getPurchaseId();
        String purchaseDate = purchasedPackageDto.getPurchaseDate();
        String startDate = purchasedPackageDto.getStartDate();
        String expirationDate = purchasedPackageDto.getExpirationDate();
        String regionCode = purchasedPackageDto.getRegionCode();
        boolean zIsSubscriptionCancelled = purchasedPackageDto.isSubscriptionCancelled();
        String subscriptionEndDate = purchasedPackageDto.getSubscriptionEndDate();
        boolean zIsPending = purchasedPackageDto.isPending();
        UsageDto mobileDataUsage = purchasedPackageDto.getMobileDataUsage();
        long consumed = mobileDataUsage != null ? mobileDataUsage.getConsumed() : 0L;
        UsageDto mobileDataUsage2 = purchasedPackageDto.getMobileDataUsage();
        long all = mobileDataUsage2 != null ? mobileDataUsage2.getAll() : 0L;
        UsageDto mobileDataUsage3 = purchasedPackageDto.getMobileDataUsage();
        long available = mobileDataUsage3 != null ? mobileDataUsage3.getAvailable() : 0L;
        UsageDto voiceUsage = purchasedPackageDto.getVoiceUsage();
        int consumed2 = voiceUsage != null ? (int) voiceUsage.getConsumed() : 0;
        UsageDto smsUsage = purchasedPackageDto.getSmsUsage();
        return new PurchasedPackage(packageId, name, type, externalPlanType, amount, durationHours, cycles, voice, sms, zIsPremium, purchaseId, purchaseDate, startDate, expirationDate, regionCode, zIsSubscriptionCancelled, subscriptionEndDate, zIsPending, consumed, all, available, consumed2, smsUsage != null ? (int) smsUsage.getConsumed() : 0, purchasedPackageDto.getSource(), null, 16777216, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    @Nullable
    /* renamed from: cancelSubscription-BWLJW6A, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m195cancelSubscriptionBWLJW6A(long j11, @Nullable String str, @Nullable String str2, @NotNull Continuation<? super Result<Unit>> continuation) {
        PurchasedPackagesRepository$cancelSubscription$1 purchasedPackagesRepository$cancelSubscription$1;
        if (continuation instanceof PurchasedPackagesRepository$cancelSubscription$1) {
            purchasedPackagesRepository$cancelSubscription$1 = (PurchasedPackagesRepository$cancelSubscription$1) continuation;
            int i5 = purchasedPackagesRepository$cancelSubscription$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                purchasedPackagesRepository$cancelSubscription$1.label = i5 - Integer.MIN_VALUE;
            } else {
                purchasedPackagesRepository$cancelSubscription$1 = new PurchasedPackagesRepository$cancelSubscription$1(this, continuation);
            }
        }
        PurchasedPackagesRepository$cancelSubscription$1 purchasedPackagesRepository$cancelSubscription$12 = purchasedPackagesRepository$cancelSubscription$1;
        Object objCancelSubscription = purchasedPackagesRepository$cancelSubscription$12.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = purchasedPackagesRepository$cancelSubscription$12.label;
        try {
            if (i11 == 0) {
                ResultKt.b(objCancelSubscription);
                int i12 = Result.f71687b;
                MobileApi mobileApi = this.api;
                purchasedPackagesRepository$cancelSubscription$12.label = 1;
                objCancelSubscription = mobileApi.cancelSubscription(j11, str2, str, purchasedPackagesRepository$cancelSubscription$12);
                if (objCancelSubscription == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objCancelSubscription);
            }
            p0 p0Var = (p0) objCancelSubscription;
            if (p0Var.f52631a.c()) {
                Unit unit = Unit.f71706a;
                int i13 = Result.f71687b;
                return unit;
            }
            throw new IllegalStateException(("local-sim/subscription DELETE " + p0Var.f52631a.f95556d).toString());
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    @Nullable
    /* renamed from: getPackages-IoAF18A, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m196getPackagesIoAF18A(@NotNull Continuation<? super Result<? extends List<PurchasedPackage>>> continuation) {
        PurchasedPackagesRepository$getPackages$1 purchasedPackagesRepository$getPackages$1;
        PurchasedPackagesRepository purchasedPackagesRepository;
        String upperCase;
        String string;
        String code;
        PurchasedRegionCountriesDto countries;
        List<String> codes;
        if (continuation instanceof PurchasedPackagesRepository$getPackages$1) {
            purchasedPackagesRepository$getPackages$1 = (PurchasedPackagesRepository$getPackages$1) continuation;
            int i5 = purchasedPackagesRepository$getPackages$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                purchasedPackagesRepository$getPackages$1.label = i5 - Integer.MIN_VALUE;
            } else {
                purchasedPackagesRepository$getPackages$1 = new PurchasedPackagesRepository$getPackages$1(this, continuation);
            }
        }
        PurchasedPackagesRepository$getPackages$1 purchasedPackagesRepository$getPackages$12 = purchasedPackagesRepository$getPackages$1;
        Object purchasedPackages$default = purchasedPackagesRepository$getPackages$12.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = purchasedPackagesRepository$getPackages$12.label;
        try {
            if (i11 == 0) {
                ResultKt.b(purchasedPackages$default);
                int i12 = Result.f71687b;
                MobileApi mobileApi = this.api;
                purchasedPackagesRepository$getPackages$12.L$0 = this;
                purchasedPackagesRepository$getPackages$12.label = 1;
                purchasedPackages$default = MobileApi.DefaultImpls.getPurchasedPackages$default(mobileApi, false, false, false, false, false, purchasedPackagesRepository$getPackages$12, 31, null);
                if (purchasedPackages$default == coroutineSingletons) {
                    return coroutineSingletons;
                }
                purchasedPackagesRepository = this;
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                purchasedPackagesRepository = (PurchasedPackagesRepository) purchasedPackagesRepository$getPackages$12.L$0;
                ResultKt.b(purchasedPackages$default);
            }
            p0 p0Var = (p0) purchasedPackages$default;
            if (!p0Var.f52631a.c()) {
                throw new IllegalStateException(("packages/purchased " + p0Var.f52631a.f95556d).toString());
            }
            PurchasedPackagesResponse purchasedPackagesResponse = (PurchasedPackagesResponse) p0Var.f52632b;
            if (purchasedPackagesResponse == null) {
                throw new IllegalStateException("empty packages/purchased body");
            }
            List<PurchasedMobileDatumDto> purchasedMobileData = purchasedPackagesResponse.getPurchasedMobileData();
            ArrayList arrayList = new ArrayList();
            Iterator<T> it = purchasedMobileData.iterator();
            while (true) {
                Pair pair = null;
                if (!it.hasNext()) {
                    break;
                }
                PurchasedMobileDatumDto purchasedMobileDatumDto = (PurchasedMobileDatumDto) it.next();
                PurchasedRegionDto region = purchasedMobileDatumDto.getRegion();
                if (region != null && (code = region.getCode()) != null) {
                    if (k.U0(code)) {
                        code = null;
                    }
                    if (code != null && (countries = purchasedMobileDatumDto.getRegion().getCountries()) != null && (codes = countries.getCodes()) != null) {
                        if (codes.isEmpty()) {
                            codes = null;
                        }
                        if (codes != null) {
                            String upperCase2 = code.toUpperCase(Locale.ROOT);
                            Intrinsics.f(upperCase2, "toUpperCase(...)");
                            pair = new Pair(upperCase2, codes);
                        }
                    }
                }
                if (pair != null) {
                    arrayList.add(pair);
                }
            }
            Map mapR0 = MapsKt.r0(arrayList);
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            List<PurchasedMobileDatumDto> purchasedMobileData2 = purchasedPackagesResponse.getPurchasedMobileData();
            ArrayList arrayList2 = new ArrayList();
            Iterator<T> it2 = purchasedMobileData2.iterator();
            while (it2.hasNext()) {
                d.z0(((PurchasedMobileDatumDto) it2.next()).getPurchasedPackages(), arrayList2);
            }
            ArrayList arrayList3 = new ArrayList();
            Iterator it3 = arrayList2.iterator();
            while (it3.hasNext()) {
                Object next = it3.next();
                PurchasedPackageDto purchasedPackageDto = (PurchasedPackageDto) next;
                if (purchasedPackageDto.getPurchaseId() == 0 || linkedHashSet.add(new Long(purchasedPackageDto.getPurchaseId()))) {
                    arrayList3.add(next);
                }
            }
            ArrayList arrayList4 = new ArrayList();
            Iterator it4 = arrayList3.iterator();
            while (it4.hasNext()) {
                PurchasedPackage purchasedPackageCopy$default = purchasedPackagesRepository.toPublic((PurchasedPackageDto) it4.next());
                if (purchasedPackageCopy$default != null) {
                    String regionCode = purchasedPackageCopy$default.getRegionCode();
                    if (regionCode == null || (string = k.u1(regionCode).toString()) == null) {
                        upperCase = null;
                    } else {
                        upperCase = string.toUpperCase(Locale.ROOT);
                        Intrinsics.f(upperCase, "toUpperCase(...)");
                    }
                    List list = (List) mapR0.get(upperCase);
                    if (list == null) {
                        list = EmptyList.f71733a;
                    }
                    List list2 = list;
                    if (!list2.isEmpty()) {
                        purchasedPackageCopy$default = PurchasedPackage.copy$default(purchasedPackageCopy$default, 0L, null, null, null, 0L, 0, 0, 0, 0, false, 0L, null, null, null, null, false, null, false, 0L, 0L, 0L, 0, 0, null, list2, 16777215, null);
                    }
                } else {
                    purchasedPackageCopy$default = null;
                }
                if (purchasedPackageCopy$default != null) {
                    arrayList4.add(purchasedPackageCopy$default);
                }
            }
            int i13 = Result.f71687b;
            return arrayList4;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }
}
