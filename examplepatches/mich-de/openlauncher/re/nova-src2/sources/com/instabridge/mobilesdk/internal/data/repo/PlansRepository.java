package com.instabridge.mobilesdk.internal.data.repo;

import b70.c;
import com.instabridge.mobilesdk.Brand;
import com.instabridge.mobilesdk.Plan;
import com.instabridge.mobilesdk.api.PlanFilter;
import com.instabridge.mobilesdk.api.RemoteConfigProvider;
import com.instabridge.mobilesdk.internal.data.api.MobileApi;
import com.instabridge.mobilesdk.internal.data.api.dto.LocalEsimPriceDto;
import com.instabridge.mobilesdk.internal.data.api.dto.PricesResponse;
import com.instabridge.mobilesdk.internal.data.api.dto.TrialDto;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import eb0.p0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ:\u0010\f\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000f0\u000e0\r2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u0010\u0014\u001a\u00020\u0013H\u0086@¢\u0006\u0004\b\u0015\u0010\u0016J\f\u0010\u0017\u001a\u00020\u000f*\u00020\u0018H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0019"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/PlansRepository;", b.f42142b, "api", "Lcom/instabridge/mobilesdk/internal/data/api/MobileApi;", "planFilter", "Lcom/instabridge/mobilesdk/api/PlanFilter;", "remoteConfig", "Lcom/instabridge/mobilesdk/api/RemoteConfigProvider;", "brand", "Lcom/instabridge/mobilesdk/Brand;", "<init>", "(Lcom/instabridge/mobilesdk/internal/data/api/MobileApi;Lcom/instabridge/mobilesdk/api/PlanFilter;Lcom/instabridge/mobilesdk/api/RemoteConfigProvider;Lcom/instabridge/mobilesdk/Brand;)V", "loadPlans", "Lkotlin/Result;", b.f42142b, "Lcom/instabridge/mobilesdk/Plan;", "planType", b.f42142b, "isOnboarding", b.f42142b, "cancellationWinback", "loadPlans-BWLJW6A", "(IZZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "toPlan", "Lcom/instabridge/mobilesdk/internal/data/api/dto/LocalEsimPriceDto;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class PlansRepository {
    public static final int $stable = 0;

    @NotNull
    private final MobileApi api;

    @NotNull
    private final Brand brand;

    @NotNull
    private final PlanFilter planFilter;

    @NotNull
    private final RemoteConfigProvider remoteConfig;

    public PlansRepository(@NotNull MobileApi api, @NotNull PlanFilter planFilter, @NotNull RemoteConfigProvider remoteConfig, @NotNull Brand brand) {
        Intrinsics.g(api, "api");
        Intrinsics.g(planFilter, "planFilter");
        Intrinsics.g(remoteConfig, "remoteConfig");
        Intrinsics.g(brand, "brand");
        this.api = api;
        this.planFilter = planFilter;
        this.remoteConfig = remoteConfig;
        this.brand = brand;
    }

    /* renamed from: loadPlans-BWLJW6A$default, reason: not valid java name */
    public static /* synthetic */ Object m193loadPlansBWLJW6A$default(PlansRepository plansRepository, int i5, boolean z11, boolean z12, Continuation continuation, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            i5 = 0;
        }
        if ((i11 & 2) != 0) {
            z11 = true;
        }
        if ((i11 & 4) != 0) {
            z12 = false;
        }
        return plansRepository.m194loadPlansBWLJW6A(i5, z11, z12, continuation);
    }

    private final Plan toPlan(LocalEsimPriceDto localEsimPriceDto) {
        long packageId = localEsimPriceDto.getPackageId();
        String packageName = localEsimPriceDto.getPackageName();
        long data = localEsimPriceDto.getData() / 1000000;
        int sms = localEsimPriceDto.getSms();
        int call = localEsimPriceDto.getCall();
        int durationHours = localEsimPriceDto.getDurationHours();
        long basePriceCents = localEsimPriceDto.getBasePriceCents();
        long finalPriceCents = localEsimPriceDto.getFinalPriceCents();
        String currency = localEsimPriceDto.getCurrency();
        boolean subscription = localEsimPriceDto.getSubscription();
        boolean zIsFreeTrial = localEsimPriceDto.isFreeTrial();
        boolean z11 = localEsimPriceDto.getTrial() != null;
        TrialDto trial = localEsimPriceDto.getTrial();
        int durationHours2 = trial != null ? trial.getDurationHours() : 0;
        TrialDto trial2 = localEsimPriceDto.getTrial();
        long data2 = trial2 != null ? trial2.getData() : 0L;
        TrialDto trial3 = localEsimPriceDto.getTrial();
        int sms2 = trial3 != null ? trial3.getSms() : 0;
        TrialDto trial4 = localEsimPriceDto.getTrial();
        return new Plan(packageId, packageName, data, sms, call, durationHours, basePriceCents, finalPriceCents, currency, subscription, zIsFreeTrial, z11, durationHours2, data2, sms2, trial4 != null ? trial4.getVoice() : 0, localEsimPriceDto.getInterval(), localEsimPriceDto.getIntervalCount());
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /* JADX WARN: Type inference failed for: r14v6, types: [java.util.ArrayList, java.util.List] */
    /* JADX WARN: Type inference failed for: r14v8, types: [java.util.List] */
    @Nullable
    /* renamed from: loadPlans-BWLJW6A, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m194loadPlansBWLJW6A(int i5, boolean z11, boolean z12, @NotNull Continuation<? super Result<? extends List<Plan>>> continuation) {
        PlansRepository$loadPlans$1 plansRepository$loadPlans$1;
        String str;
        PlansRepository plansRepository;
        int i11;
        if (continuation instanceof PlansRepository$loadPlans$1) {
            plansRepository$loadPlans$1 = (PlansRepository$loadPlans$1) continuation;
            int i12 = plansRepository$loadPlans$1.label;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                plansRepository$loadPlans$1.label = i12 - Integer.MIN_VALUE;
            } else {
                plansRepository$loadPlans$1 = new PlansRepository$loadPlans$1(this, continuation);
            }
        }
        PlansRepository$loadPlans$1 plansRepository$loadPlans$12 = plansRepository$loadPlans$1;
        Object prices = plansRepository$loadPlans$12.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = plansRepository$loadPlans$12.label;
        try {
            if (i13 == 0) {
                ResultKt.b(prices);
                int i14 = Result.f71687b;
                if (i5 == 0) {
                    String string = this.remoteConfig.getString("mobile_sdk_plan_variant", b.f42142b);
                    if (k.U0(string)) {
                        string = null;
                    }
                    str = string;
                } else {
                    str = null;
                }
                MobileApi mobileApi = this.api;
                int provider = this.brand.getProvider();
                plansRepository$loadPlans$12.L$0 = this;
                plansRepository$loadPlans$12.I$0 = i5;
                plansRepository$loadPlans$12.label = 1;
                prices = mobileApi.getPrices(i5, "US", provider, str, z11, z12, plansRepository$loadPlans$12);
                if (prices == coroutineSingletons) {
                    return coroutineSingletons;
                }
                plansRepository = this;
                i11 = i5;
            } else {
                if (i13 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                i11 = plansRepository$loadPlans$12.I$0;
                plansRepository = (PlansRepository) plansRepository$loadPlans$12.L$0;
                ResultKt.b(prices);
            }
            p0 p0Var = (p0) prices;
            if (!p0Var.f52631a.c()) {
                throw new IllegalStateException(("prices-v3 " + p0Var.f52631a.f95556d).toString());
            }
            PricesResponse pricesResponse = (PricesResponse) p0Var.f52632b;
            List<LocalEsimPriceDto> prices2 = pricesResponse != null ? pricesResponse.getPrices() : null;
            if (prices2 == null) {
                prices2 = EmptyList.f71733a;
            }
            List<LocalEsimPriceDto> list = prices2;
            Object arrayList = new ArrayList(c.u0(list, 10));
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                arrayList.add(plansRepository.toPlan((LocalEsimPriceDto) it.next()));
            }
            if (i11 == 0) {
                arrayList = plansRepository.planFilter.apply(arrayList);
            }
            int i15 = Result.f71687b;
            return arrayList;
        } catch (Throwable th2) {
            int i16 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }
}
