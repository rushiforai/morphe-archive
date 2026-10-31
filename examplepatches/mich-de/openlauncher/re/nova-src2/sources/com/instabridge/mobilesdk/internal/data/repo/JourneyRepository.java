package com.instabridge.mobilesdk.internal.data.repo;

import android.os.Build;
import com.instabridge.mobilesdk.JourneyState;
import com.instabridge.mobilesdk.internal.data.api.MobileApi;
import com.instabridge.mobilesdk.internal.data.api.a;
import com.instabridge.mobilesdk.internal.data.api.dto.ApiErrorBody;
import com.instabridge.mobilesdk.internal.data.api.dto.EnableOfferRequest;
import com.instabridge.mobilesdk.internal.data.api.dto.JourneyResponse;
import com.instabridge.mobilesdk.internal.data.repo.MobileEligibility;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import eb0.p0;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonBuilder;
import kotlinx.serialization.json.JsonKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0001\u0018\u0000 \"2\u00020\u0001:\u0001\"B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\bH\u0002¢\u0006\u0004\b\t\u0010\nJ\u0019\u0010\r\u001a\u0004\u0018\u00010\f*\u0006\u0012\u0002\b\u00030\u000bH\u0002¢\u0006\u0004\b\r\u0010\u000eJ\u0019\u0010\u000f\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\fH\u0002¢\u0006\u0004\b\u000f\u0010\u0010J'\u0010\u0014\u001a\u00020\u0013\"\u0004\b\u0000\u0010\u0011*\b\u0012\u0004\u0012\u00028\u00000\u000b2\u0006\u0010\u0012\u001a\u00020\fH\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\"\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u00190\u00182\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0016H\u0086@¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001e\u001a\u00020\u001dH\u0086@¢\u0006\u0004\b\u001e\u0010\u001fR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010 R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010!¨\u0006#"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/JourneyRepository;", b.f42142b, "Lcom/instabridge/mobilesdk/internal/data/api/MobileApi;", "api", b.f42142b, "debug", "<init>", "(Lcom/instabridge/mobilesdk/internal/data/api/MobileApi;Z)V", "Lcom/instabridge/mobilesdk/internal/data/api/dto/EnableOfferRequest;", "enableOfferRequest", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/EnableOfferRequest;", "Leb0/p0;", b.f42142b, "errorCode", "(Leb0/p0;)Ljava/lang/String;", "eligibilityFailureReason", "(Ljava/lang/String;)Ljava/lang/String;", "T", "endpoint", "Lcom/instabridge/mobilesdk/internal/data/repo/BrandJourneyException;", "toException", "(Leb0/p0;Ljava/lang/String;)Lcom/instabridge/mobilesdk/internal/data/repo/BrandJourneyException;", b.f42142b, "packageId", "Lkotlin/Result;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/JourneyResponse;", "getJourney-gIAlu-s", "(Ljava/lang/Long;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getJourney", "Lcom/instabridge/mobilesdk/internal/data/repo/MobileEligibility;", "resolveEligibility", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lcom/instabridge/mobilesdk/internal/data/api/MobileApi;", "Z", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class JourneyRepository {

    @Deprecated
    @NotNull
    public static final String ERROR_CODE_DEVICE_NOT_COMPATIBLE = "830";

    @Deprecated
    @NotNull
    public static final String ERROR_CODE_NOT_IN_US = "824";

    @Deprecated
    @NotNull
    public static final String ERROR_CODE_USER_IN_RESTRICTED_STATE = "829";

    @Deprecated
    @NotNull
    public static final String ERROR_CODE_USER_NOT_FOUND = "205";

    @Deprecated
    @NotNull
    public static final String OFFER_CODE = "US04P20S25";

    @Deprecated
    @NotNull
    public static final String REASON_DEVICE_NOT_COMPATIBLE = "device_not_compatible";

    @Deprecated
    @NotNull
    public static final String REASON_NOT_ELIGIBLE_AFTER_ENABLE = "not_eligible_after_enable_offer";

    @Deprecated
    @NotNull
    public static final String REASON_SERVICE_NOT_AVAILABLE_IN_US = "service_not_available_in_us";

    @Deprecated
    @NotNull
    public static final String REASON_USER_IN_RESTRICTED_STATE = "user_in_restricted_state";

    @Deprecated
    @NotNull
    public static final String REASON_USER_NOT_FOUND = "user_not_found";

    @NotNull
    private final MobileApi api;
    private final boolean debug;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @NotNull
    private static final Json errorJson = JsonKt.Json$default(null, new a(2), 1, null);

    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u000f\u001a\u00020\u0010¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u0013"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/JourneyRepository$Companion;", b.f42142b, "<init>", "()V", "OFFER_CODE", b.f42142b, "ERROR_CODE_USER_IN_RESTRICTED_STATE", "ERROR_CODE_DEVICE_NOT_COMPATIBLE", "ERROR_CODE_NOT_IN_US", "ERROR_CODE_USER_NOT_FOUND", "REASON_USER_IN_RESTRICTED_STATE", "REASON_DEVICE_NOT_COMPATIBLE", "REASON_SERVICE_NOT_AVAILABLE_IN_US", "REASON_USER_NOT_FOUND", "REASON_NOT_ELIGIBLE_AFTER_ENABLE", "errorJson", "Lkotlinx/serialization/json/Json;", "getErrorJson", "()Lkotlinx/serialization/json/Json;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final Json getErrorJson() {
            return JourneyRepository.errorJson;
        }

        private Companion() {
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.data.repo.JourneyRepository", f = "JourneyRepository.kt", l = {62, 67, 73}, m = "resolveEligibility")
    /* renamed from: com.instabridge.mobilesdk.internal.data.repo.JourneyRepository$resolveEligibility$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return JourneyRepository.this.resolveEligibility(this);
        }
    }

    public JourneyRepository(@NotNull MobileApi api, boolean z11) {
        Intrinsics.g(api, "api");
        this.api = api;
        this.debug = z11;
    }

    private final String eligibilityFailureReason(String errorCode) {
        return errorCode == null ? "enable_offer_error_unknown" : r70.k.K0(errorCode, ERROR_CODE_USER_IN_RESTRICTED_STATE, false) ? REASON_USER_IN_RESTRICTED_STATE : r70.k.K0(errorCode, ERROR_CODE_DEVICE_NOT_COMPATIBLE, false) ? REASON_DEVICE_NOT_COMPATIBLE : r70.k.K0(errorCode, ERROR_CODE_NOT_IN_US, false) ? REASON_SERVICE_NOT_AVAILABLE_IN_US : r70.k.K0(errorCode, ERROR_CODE_USER_NOT_FOUND, false) ? REASON_USER_NOT_FOUND : "enable_offer_error_".concat(errorCode);
    }

    private final EnableOfferRequest enableOfferRequest() {
        return new EnableOfferRequest(OFFER_CODE, Build.MODEL, Long.valueOf(Build.VERSION.SDK_INT), (String) null, this.debug ? "US" : null, 8, (DefaultConstructorMarker) null);
    }

    private final String errorCode(p0<?> p0Var) {
        Object objA;
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
        String str = (String) objA;
        if (str == null) {
            return null;
        }
        if (r70.k.U0(str)) {
            str = null;
        }
        if (str == null) {
            return null;
        }
        try {
            Json json = errorJson;
            json.getSerializersModule();
            objA2 = (ApiErrorBody) json.decodeFromString(ApiErrorBody.INSTANCE.serializer(), str);
        } catch (Throwable th3) {
            int i12 = Result.f71687b;
            objA2 = ResultKt.a(th3);
        }
        if (objA2 instanceof Result.Failure) {
            objA2 = null;
        }
        ApiErrorBody apiErrorBody = (ApiErrorBody) objA2;
        if (apiErrorBody != null) {
            return apiErrorBody.getErrorCode();
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit errorJson$lambda$12(JsonBuilder Json) {
        Intrinsics.g(Json, "$this$Json");
        Json.setIgnoreUnknownKeys(true);
        Json.setLenient(true);
        return Unit.f71706a;
    }

    /* renamed from: getJourney-gIAlu-s$default, reason: not valid java name */
    public static /* synthetic */ Object m191getJourneygIAlus$default(JourneyRepository journeyRepository, Long l9, Continuation continuation, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            l9 = null;
        }
        return journeyRepository.m192getJourneygIAlus(l9, continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x004c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final <T> BrandJourneyException toException(p0<T> p0Var, String str) {
        Object objA;
        ApiErrorBody apiErrorBody;
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
        return new BrandJourneyException(p0Var.f52631a.f95556d, apiErrorBody != null ? apiErrorBody.userFacingMessage() : null, str);
    }

    /* JADX WARN: Code restructure failed: missing block: B:44:0x00b0, code lost:
    
        if (r10 == r2) goto L45;
     */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00a3 A[Catch: all -> 0x0034, TryCatch #0 {all -> 0x0034, blocks: (B:14:0x002f, B:46:0x00b3, B:48:0x00bd, B:50:0x00c4, B:52:0x00c7, B:53:0x00ce, B:54:0x00cf, B:55:0x00d5, B:21:0x0047, B:41:0x0099, B:43:0x00a3, B:56:0x00d6, B:57:0x00ef, B:24:0x0053, B:31:0x006d, B:33:0x0077, B:35:0x007d, B:38:0x0086, B:58:0x00f0, B:59:0x00f7, B:60:0x00f8, B:61:0x00fe, B:27:0x005a), top: B:64:0x0023 }] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00d6 A[Catch: all -> 0x0034, TryCatch #0 {all -> 0x0034, blocks: (B:14:0x002f, B:46:0x00b3, B:48:0x00bd, B:50:0x00c4, B:52:0x00c7, B:53:0x00ce, B:54:0x00cf, B:55:0x00d5, B:21:0x0047, B:41:0x0099, B:43:0x00a3, B:56:0x00d6, B:57:0x00ef, B:24:0x0053, B:31:0x006d, B:33:0x0077, B:35:0x007d, B:38:0x0086, B:58:0x00f0, B:59:0x00f7, B:60:0x00f8, B:61:0x00fe, B:27:0x005a), top: B:64:0x0023 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    @Nullable
    /* renamed from: getJourney-gIAlu-s, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m192getJourneygIAlus(@Nullable Long l9, @NotNull Continuation<? super Result<JourneyResponse>> continuation) {
        JourneyRepository$getJourney$1 journeyRepository$getJourney$1;
        Long l11;
        JourneyRepository journeyRepository;
        JourneyResponse journeyResponse;
        p0 p0Var;
        if (continuation instanceof JourneyRepository$getJourney$1) {
            journeyRepository$getJourney$1 = (JourneyRepository$getJourney$1) continuation;
            int i5 = journeyRepository$getJourney$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                journeyRepository$getJourney$1.label = i5 - Integer.MIN_VALUE;
            } else {
                journeyRepository$getJourney$1 = new JourneyRepository$getJourney$1(this, continuation);
            }
        }
        Object journey = journeyRepository$getJourney$1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = journeyRepository$getJourney$1.label;
        try {
            if (i11 == 0) {
                ResultKt.b(journey);
                int i12 = Result.f71687b;
                MobileApi mobileApi = this.api;
                journeyRepository$getJourney$1.L$0 = l9;
                journeyRepository$getJourney$1.L$1 = this;
                journeyRepository$getJourney$1.label = 1;
                journey = mobileApi.getJourney(l9, journeyRepository$getJourney$1);
                if (journey == coroutineSingletons) {
                    return coroutineSingletons;
                }
                l11 = l9;
                journeyRepository = this;
            } else if (i11 == 1) {
                journeyRepository = (JourneyRepository) journeyRepository$getJourney$1.L$1;
                l11 = (Long) journeyRepository$getJourney$1.L$0;
                ResultKt.b(journey);
            } else {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    journeyRepository = (JourneyRepository) journeyRepository$getJourney$1.L$0;
                    ResultKt.b(journey);
                    p0 p0Var2 = (p0) journey;
                    if (!p0Var2.f52631a.c()) {
                        throw journeyRepository.toException(p0Var2, "brand-journey retry");
                    }
                    journeyResponse = (JourneyResponse) p0Var2.f52632b;
                    if (journeyResponse == null) {
                        throw new IllegalStateException("empty brand-journey retry body");
                    }
                    int i13 = Result.f71687b;
                    return journeyResponse;
                }
                journeyRepository = (JourneyRepository) journeyRepository$getJourney$1.L$1;
                l11 = (Long) journeyRepository$getJourney$1.L$0;
                ResultKt.b(journey);
                p0Var = (p0) journey;
                if (p0Var.f52631a.c()) {
                    throw new IllegalStateException(("enable-offer-v2 " + p0Var.f52631a.f95556d).toString());
                }
                MobileApi mobileApi2 = journeyRepository.api;
                journeyRepository$getJourney$1.L$0 = journeyRepository;
                journeyRepository$getJourney$1.L$1 = null;
                journeyRepository$getJourney$1.label = 3;
                journey = mobileApi2.getJourney(l11, journeyRepository$getJourney$1);
            }
            p0 p0Var3 = (p0) journey;
            if (!p0Var3.f52631a.c()) {
                throw journeyRepository.toException(p0Var3, "brand-journey");
            }
            journeyResponse = (JourneyResponse) p0Var3.f52632b;
            if (journeyResponse == null) {
                throw new IllegalStateException("empty brand-journey body");
            }
            if (journeyResponse.getState() != JourneyState.NotEligible) {
                int i132 = Result.f71687b;
                return journeyResponse;
            }
            MobileApi mobileApi3 = journeyRepository.api;
            EnableOfferRequest enableOfferRequest = journeyRepository.enableOfferRequest();
            journeyRepository$getJourney$1.L$0 = l11;
            journeyRepository$getJourney$1.L$1 = journeyRepository;
            journeyRepository$getJourney$1.label = 2;
            journey = mobileApi3.enableOffer(enableOfferRequest, journeyRepository$getJourney$1);
            if (journey != coroutineSingletons) {
                p0Var = (p0) journey;
                if (p0Var.f52631a.c()) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:77:0x00e5, code lost:
    
        if (r9 == r1) goto L78;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x007a A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v1 */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object resolveEligibility(@NotNull Continuation<? super MobileEligibility> continuation) {
        AnonymousClass1 anonymousClass1;
        Object objA;
        Object objA2;
        JourneyRepository journeyRepository;
        p0<?> p0Var;
        JourneyResponse journeyResponse;
        JourneyState state;
        JourneyRepository journeyRepository2;
        Object objA3;
        JourneyRepository journeyRepository3;
        p0 p0Var2;
        JourneyResponse journeyResponse2;
        JourneyState state2;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object journey$default = anonymousClass1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        try {
            try {
            } catch (Throwable th2) {
                int i12 = Result.f71687b;
                objA2 = ResultKt.a(th2);
                journeyRepository = i11;
            }
        } catch (Throwable th3) {
            int i13 = Result.f71687b;
            objA = ResultKt.a(th3);
        }
        if (i11 == 0) {
            ResultKt.b(journey$default);
            try {
                int i14 = Result.f71687b;
                MobileApi mobileApi = this.api;
                anonymousClass1.L$0 = this;
                anonymousClass1.label = 1;
                journey$default = MobileApi.DefaultImpls.getJourney$default(mobileApi, null, anonymousClass1, 1, null);
                if (journey$default != coroutineSingletons) {
                    journeyRepository2 = this;
                }
            } catch (Throwable th4) {
                th = th4;
                journeyRepository2 = this;
                int i15 = Result.f71687b;
                objA3 = ResultKt.a(th);
                journeyRepository3 = journeyRepository2;
                if (objA3 instanceof Result.Failure) {
                }
                p0Var2 = (p0) objA3;
                if (p0Var2 != null) {
                    return MobileEligibility.Unknown.INSTANCE;
                }
                journeyResponse2 = (JourneyResponse) p0Var2.f52632b;
                if (journeyResponse2 != null) {
                }
                return MobileEligibility.Unknown.INSTANCE;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            journeyRepository2 = (JourneyRepository) anonymousClass1.L$0;
            try {
                ResultKt.b(journey$default);
                journeyRepository2 = journeyRepository2;
            } catch (Throwable th5) {
                th = th5;
                int i152 = Result.f71687b;
                objA3 = ResultKt.a(th);
                journeyRepository3 = journeyRepository2;
                if (objA3 instanceof Result.Failure) {
                }
                p0Var2 = (p0) objA3;
                if (p0Var2 != null) {
                }
            }
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(journey$default);
                objA = (p0) journey$default;
                int i16 = Result.f71687b;
                if (objA instanceof Result.Failure) {
                    objA = null;
                }
                p0 p0Var3 = (p0) objA;
                if (p0Var3 == null) {
                    return MobileEligibility.Unknown.INSTANCE;
                }
                p0 p0Var4 = p0Var3.f52631a.c() ? p0Var3 : null;
                return (p0Var4 == null || (journeyResponse = (JourneyResponse) p0Var4.f52632b) == null || (state = journeyResponse.getState()) == null) ? MobileEligibility.Unknown.INSTANCE : state == JourneyState.NotEligible ? new MobileEligibility.Ineligible(REASON_NOT_ELIGIBLE_AFTER_ENABLE) : MobileEligibility.Eligible.INSTANCE;
            }
            JourneyRepository journeyRepository4 = (JourneyRepository) anonymousClass1.L$0;
            ResultKt.b(journey$default);
            i11 = journeyRepository4;
            objA2 = (p0) journey$default;
            int i17 = Result.f71687b;
            journeyRepository = i11;
            if (objA2 instanceof Result.Failure) {
                objA2 = null;
            }
            p0Var = (p0) objA2;
            if (p0Var != null) {
                return MobileEligibility.Unknown.INSTANCE;
            }
            if (!p0Var.f52631a.c()) {
                return new MobileEligibility.Ineligible(journeyRepository.eligibilityFailureReason(journeyRepository.errorCode(p0Var)));
            }
            MobileApi mobileApi2 = journeyRepository.api;
            anonymousClass1.L$0 = null;
            anonymousClass1.label = 3;
            journey$default = MobileApi.DefaultImpls.getJourney$default(mobileApi2, null, anonymousClass1, 1, null);
        }
        objA3 = (p0) journey$default;
        int i18 = Result.f71687b;
        journeyRepository3 = journeyRepository2;
        if (objA3 instanceof Result.Failure) {
            objA3 = null;
        }
        p0Var2 = (p0) objA3;
        if (p0Var2 != null && p0Var2.f52631a.c()) {
            journeyResponse2 = (JourneyResponse) p0Var2.f52632b;
            if (journeyResponse2 != null || (state2 = journeyResponse2.getState()) == null) {
                return MobileEligibility.Unknown.INSTANCE;
            }
            if (state2 != JourneyState.NotEligible) {
                return MobileEligibility.Eligible.INSTANCE;
            }
            MobileApi mobileApi3 = journeyRepository3.api;
            EnableOfferRequest enableOfferRequest = journeyRepository3.enableOfferRequest();
            anonymousClass1.L$0 = journeyRepository3;
            anonymousClass1.label = 2;
            journey$default = mobileApi3.enableOffer(enableOfferRequest, anonymousClass1);
            i11 = journeyRepository3;
            if (journey$default == coroutineSingletons) {
                return coroutineSingletons;
            }
            objA2 = (p0) journey$default;
            int i172 = Result.f71687b;
            journeyRepository = i11;
            if (objA2 instanceof Result.Failure) {
            }
            p0Var = (p0) objA2;
            if (p0Var != null) {
            }
        }
        return MobileEligibility.Unknown.INSTANCE;
    }

    public /* synthetic */ JourneyRepository(MobileApi mobileApi, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(mobileApi, (i5 & 2) != 0 ? false : z11);
    }
}
