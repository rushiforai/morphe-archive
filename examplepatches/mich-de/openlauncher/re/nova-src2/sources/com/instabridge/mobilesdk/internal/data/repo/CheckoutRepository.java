package com.instabridge.mobilesdk.internal.data.repo;

import b.c0;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.EsimInstallStore;
import com.instabridge.mobilesdk.internal.data.api.MobileApi;
import com.instabridge.mobilesdk.internal.data.api.a;
import com.instabridge.mobilesdk.internal.data.api.dto.AddressInfo;
import com.instabridge.mobilesdk.internal.data.api.dto.ApiErrorBody;
import com.instabridge.mobilesdk.internal.data.api.dto.CheckoutRequest;
import com.instabridge.mobilesdk.internal.data.api.dto.CheckoutResponse;
import com.instabridge.mobilesdk.internal.data.api.dto.PayIntentRequest;
import com.instabridge.mobilesdk.internal.data.api.dto.PayIntentResponse;
import com.instabridge.mobilesdk.internal.data.api.dto.PlanDetails;
import com.instabridge.mobilesdk.internal.data.api.dto.PriceDetails;
import com.instabridge.mobilesdk.internal.data.api.dto.VerifyPurchaseRequest;
import com.instabridge.mobilesdk.internal.data.api.dto.VerifyPurchaseResponse;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import eb0.p0;
import java.util.concurrent.CancellationException;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonBuilder;
import kotlinx.serialization.json.JsonKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\b\u0001\u0018\u0000 12\u00020\u0001:\u00011B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J'\u0010\f\u001a\u00020\u000b\"\u0004\b\u0000\u0010\b*\b\u0012\u0004\u0012\u00028\u00000\t2\u0006\u0010\n\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\f\u0010\rJ\u0013\u0010\u000e\u001a\u00020\u0004*\u00020\u0004H\u0002¢\u0006\u0004\b\u000e\u0010\u000fJB\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00170\u00162\u0006\u0010\u0011\u001a\u00020\u00102\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00122\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0004H\u0086@¢\u0006\u0004\b\u0018\u0010\u0019J(\u0010!\u001a\b\u0012\u0004\u0012\u00020\u001e0\u00162\u0006\u0010\u001b\u001a\u00020\u00042\b\b\u0002\u0010\u001d\u001a\u00020\u001cH\u0086@¢\u0006\u0004\b\u001f\u0010 JN\u0010+\u001a\b\u0012\u0004\u0012\u00020(0\u00162\u0006\u0010\"\u001a\u00020\u00042\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010$\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010&\u001a\u0004\u0018\u00010%2\n\b\u0002\u0010'\u001a\u0004\u0018\u00010\u0004H\u0086@¢\u0006\u0004\b)\u0010*R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010,R\u0014\u0010-\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b-\u0010.R\u0014\u0010/\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b/\u0010.R\u0014\u00100\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b0\u0010.¨\u00062"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/CheckoutRepository;", b.f42142b, "Lcom/instabridge/mobilesdk/internal/data/api/MobileApi;", "api", b.f42142b, "baseUrl", "<init>", "(Lcom/instabridge/mobilesdk/internal/data/api/MobileApi;Ljava/lang/String;)V", "T", "Leb0/p0;", "endpoint", "Lcom/instabridge/mobilesdk/internal/data/repo/CheckoutException;", "toException", "(Leb0/p0;Ljava/lang/String;)Lcom/instabridge/mobilesdk/internal/data/repo/CheckoutException;", "ensureTrailingSlash", "(Ljava/lang/String;)Ljava/lang/String;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PlanDetails;", "plan", "Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;", PlaceTypes.ADDRESS, "firstName", "lastName", "Lkotlin/Result;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/CheckoutResponse;", "checkout-yxL6bBk", "(Lcom/instabridge/mobilesdk/internal/data/api/dto/PlanDetails;Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "checkout", "purchaseId", b.f42142b, "enablePayAsYouGo", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PayIntentResponse;", "pay-0E7RQCE", "(Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "pay", "purchaseToken", "productId", "packageId", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;", "price", EsimInstallStore.KEY_ICCID, "Lcom/instabridge/mobilesdk/internal/data/api/dto/VerifyPurchaseResponse;", "verify-hUnOzRk", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "verify", "Lcom/instabridge/mobilesdk/internal/data/api/MobileApi;", "checkoutUrl", "Ljava/lang/String;", "payUrl", "verifyUrl", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class CheckoutRepository {

    @NotNull
    private final MobileApi api;

    @NotNull
    private final String checkoutUrl;

    @NotNull
    private final String payUrl;

    @NotNull
    private final String verifyUrl;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @NotNull
    private static final Json errorJson = JsonKt.Json$default(null, new a(1), 1, null);

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/CheckoutRepository$Companion;", b.f42142b, "<init>", "()V", "errorJson", "Lkotlinx/serialization/json/Json;", "getErrorJson", "()Lkotlinx/serialization/json/Json;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final Json getErrorJson() {
            return CheckoutRepository.errorJson;
        }

        private Companion() {
        }
    }

    public CheckoutRepository(@NotNull MobileApi api, @NotNull String baseUrl) {
        Intrinsics.g(api, "api");
        Intrinsics.g(baseUrl, "baseUrl");
        this.api = api;
        this.checkoutUrl = c0.E(ensureTrailingSlash(baseUrl), "v1/purchases/checkout");
        this.payUrl = c0.E(ensureTrailingSlash(baseUrl), "v1/purchases/pay");
        this.verifyUrl = c0.E(ensureTrailingSlash(baseUrl), "v1/purchases/verify/");
    }

    /* renamed from: checkout-yxL6bBk$default, reason: not valid java name */
    public static /* synthetic */ Object m183checkoutyxL6bBk$default(CheckoutRepository checkoutRepository, PlanDetails planDetails, AddressInfo addressInfo, String str, String str2, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            addressInfo = null;
        }
        if ((i5 & 4) != 0) {
            str = null;
        }
        if ((i5 & 8) != 0) {
            str2 = null;
        }
        return checkoutRepository.m186checkoutyxL6bBk(planDetails, addressInfo, str, str2, continuation);
    }

    private final String ensureTrailingSlash(String str) {
        return r70.k.M0(str, '/') ? str : str.concat("/");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit errorJson$lambda$9(JsonBuilder Json) {
        Intrinsics.g(Json, "$this$Json");
        Json.setIgnoreUnknownKeys(true);
        Json.setLenient(true);
        return Unit.f71706a;
    }

    /* renamed from: pay-0E7RQCE$default, reason: not valid java name */
    public static /* synthetic */ Object m184pay0E7RQCE$default(CheckoutRepository checkoutRepository, String str, boolean z11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        return checkoutRepository.m187pay0E7RQCE(str, z11, continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x005f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final <T> CheckoutException toException(p0<T> p0Var, String str) {
        Object objA;
        ApiErrorBody apiErrorBody;
        String error;
        Object objA2;
        try {
            int i5 = Result.f71687b;
            x80.p0 p0Var2 = p0Var.f52633c;
            objA = p0Var2 != null ? p0Var2.string() : null;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        String str2 = (String) objA;
        if (str2 == null) {
            apiErrorBody = null;
        } else {
            if (r70.k.U0(str2)) {
                str2 = null;
            }
            if (str2 != null) {
                try {
                    Json json = errorJson;
                    json.getSerializersModule();
                    objA2 = (ApiErrorBody) json.decodeFromString(ApiErrorBody.INSTANCE.serializer(), str2);
                } catch (Throwable th3) {
                    int i12 = Result.f71687b;
                    objA2 = ResultKt.a(th3);
                }
                if (objA2 instanceof Result.Failure) {
                    objA2 = null;
                }
                apiErrorBody = (ApiErrorBody) objA2;
            }
        }
        if (apiErrorBody != null && (error = apiErrorBody.getErrorCode()) != null) {
            if (r70.k.U0(error)) {
                error = null;
            }
            if (error == null) {
            }
        } else if (apiErrorBody == null || (error = apiErrorBody.getError()) == null || r70.k.U0(error)) {
            error = null;
        }
        return new CheckoutException(p0Var.f52631a.f95556d, error, apiErrorBody != null ? apiErrorBody.userFacingMessage() : null, str);
    }

    /* renamed from: verify-hUnOzRk$default, reason: not valid java name */
    public static /* synthetic */ Object m185verifyhUnOzRk$default(CheckoutRepository checkoutRepository, String str, String str2, String str3, PriceDetails priceDetails, String str4, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            str2 = null;
        }
        if ((i5 & 4) != 0) {
            str3 = null;
        }
        if ((i5 & 8) != 0) {
            priceDetails = null;
        }
        if ((i5 & 16) != 0) {
            str4 = null;
        }
        return checkoutRepository.m188verifyhUnOzRk(str, str2, str3, priceDetails, str4, continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    @Nullable
    /* renamed from: checkout-yxL6bBk, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m186checkoutyxL6bBk(@NotNull PlanDetails planDetails, @Nullable AddressInfo addressInfo, @Nullable String str, @Nullable String str2, @NotNull Continuation<? super Result<CheckoutResponse>> continuation) {
        CheckoutRepository$checkout$1 checkoutRepository$checkout$1;
        CheckoutRepository checkoutRepository;
        if (continuation instanceof CheckoutRepository$checkout$1) {
            checkoutRepository$checkout$1 = (CheckoutRepository$checkout$1) continuation;
            int i5 = checkoutRepository$checkout$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                checkoutRepository$checkout$1.label = i5 - Integer.MIN_VALUE;
            } else {
                checkoutRepository$checkout$1 = new CheckoutRepository$checkout$1(this, continuation);
            }
        }
        Object objCheckout = checkoutRepository$checkout$1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = checkoutRepository$checkout$1.label;
        try {
            if (i11 == 0) {
                ResultKt.b(objCheckout);
                int i12 = Result.f71687b;
                MobileApi mobileApi = this.api;
                String str3 = this.checkoutUrl;
                CheckoutRequest checkoutRequest = new CheckoutRequest(planDetails, addressInfo, (String) null, (Boolean) null, (String) null, str, str2, 28, (DefaultConstructorMarker) null);
                checkoutRepository$checkout$1.L$0 = this;
                checkoutRepository$checkout$1.label = 1;
                objCheckout = mobileApi.checkout(str3, checkoutRequest, checkoutRepository$checkout$1);
                if (objCheckout == coroutineSingletons) {
                    return coroutineSingletons;
                }
                checkoutRepository = this;
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                checkoutRepository = (CheckoutRepository) checkoutRepository$checkout$1.L$0;
                ResultKt.b(objCheckout);
            }
            p0 p0Var = (p0) objCheckout;
            if (!p0Var.f52631a.c()) {
                throw checkoutRepository.toException(p0Var, "purchases/checkout");
            }
            CheckoutResponse checkoutResponse = (CheckoutResponse) p0Var.f52632b;
            if (checkoutResponse == null) {
                throw new IllegalStateException("empty purchases/checkout body");
            }
            int i13 = Result.f71687b;
            return checkoutResponse;
        } catch (CancellationException e3) {
            throw e3;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /* renamed from: pay-0E7RQCE, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m187pay0E7RQCE(@NotNull String str, boolean z11, @NotNull Continuation<? super Result<PayIntentResponse>> continuation) {
        CheckoutRepository$pay$1 checkoutRepository$pay$1;
        CheckoutRepository checkoutRepository;
        if (continuation instanceof CheckoutRepository$pay$1) {
            checkoutRepository$pay$1 = (CheckoutRepository$pay$1) continuation;
            int i5 = checkoutRepository$pay$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                checkoutRepository$pay$1.label = i5 - Integer.MIN_VALUE;
            } else {
                checkoutRepository$pay$1 = new CheckoutRepository$pay$1(this, continuation);
            }
        }
        Object objPay = checkoutRepository$pay$1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = checkoutRepository$pay$1.label;
        try {
            if (i11 == 0) {
                ResultKt.b(objPay);
                int i12 = Result.f71687b;
                MobileApi mobileApi = this.api;
                String str2 = this.payUrl;
                PayIntentRequest payIntentRequest = new PayIntentRequest(str, z11);
                checkoutRepository$pay$1.L$0 = this;
                checkoutRepository$pay$1.label = 1;
                objPay = mobileApi.pay(str2, payIntentRequest, checkoutRepository$pay$1);
                if (objPay == coroutineSingletons) {
                    return coroutineSingletons;
                }
                checkoutRepository = this;
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                checkoutRepository = (CheckoutRepository) checkoutRepository$pay$1.L$0;
                ResultKt.b(objPay);
            }
            p0 p0Var = (p0) objPay;
            if (!p0Var.f52631a.c()) {
                throw checkoutRepository.toException(p0Var, "purchases/pay");
            }
            PayIntentResponse payIntentResponse = (PayIntentResponse) p0Var.f52632b;
            if (payIntentResponse == null) {
                throw new IllegalStateException("empty purchases/pay body");
            }
            int i13 = Result.f71687b;
            return payIntentResponse;
        } catch (CancellationException e3) {
            throw e3;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    @Nullable
    /* renamed from: verify-hUnOzRk, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m188verifyhUnOzRk(@NotNull String str, @Nullable String str2, @Nullable String str3, @Nullable PriceDetails priceDetails, @Nullable String str4, @NotNull Continuation<? super Result<VerifyPurchaseResponse>> continuation) {
        CheckoutRepository$verify$1 checkoutRepository$verify$1;
        if (continuation instanceof CheckoutRepository$verify$1) {
            checkoutRepository$verify$1 = (CheckoutRepository$verify$1) continuation;
            int i5 = checkoutRepository$verify$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                checkoutRepository$verify$1.label = i5 - Integer.MIN_VALUE;
            } else {
                checkoutRepository$verify$1 = new CheckoutRepository$verify$1(this, continuation);
            }
        }
        Object objVerifyPurchase = checkoutRepository$verify$1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = checkoutRepository$verify$1.label;
        try {
            if (i11 == 0) {
                ResultKt.b(objVerifyPurchase);
                int i12 = Result.f71687b;
                MobileApi mobileApi = this.api;
                String str5 = this.verifyUrl;
                VerifyPurchaseRequest verifyPurchaseRequest = new VerifyPurchaseRequest(str, "Stripe", str4, str2, str3, priceDetails);
                checkoutRepository$verify$1.label = 1;
                objVerifyPurchase = mobileApi.verifyPurchase(str5, verifyPurchaseRequest, checkoutRepository$verify$1);
                if (objVerifyPurchase == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objVerifyPurchase);
            }
            p0 p0Var = (p0) objVerifyPurchase;
            if (!p0Var.f52631a.c()) {
                throw new IllegalStateException(("purchases/verify " + p0Var.f52631a.f95556d).toString());
            }
            VerifyPurchaseResponse verifyPurchaseResponse = (VerifyPurchaseResponse) p0Var.f52632b;
            if (verifyPurchaseResponse == null) {
                throw new IllegalStateException("empty purchases/verify body");
            }
            int i13 = Result.f71687b;
            return verifyPurchaseResponse;
        } catch (CancellationException e3) {
            throw e3;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }
}
