package com.instabridge.mobilesdk.internal.data.repo;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.instabridge.mobilesdk.internal.data.api.MobileApi;
import com.instabridge.mobilesdk.internal.data.api.dto.GetEsimRequest;
import com.instabridge.mobilesdk.internal.data.api.dto.GetEsimResponse;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import eb0.p0;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J2\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\t2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u00052\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0086@¢\u0006\u0004\b\u0010\u0010\u0011R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0012"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/EsimRepository;", b.f42142b, "api", "Lcom/instabridge/mobilesdk/internal/data/api/MobileApi;", "debug", b.f42142b, "<init>", "(Lcom/instabridge/mobilesdk/internal/data/api/MobileApi;Z)V", "requestEsim", "Lkotlin/Result;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/GetEsimResponse;", "packageId", b.f42142b, "isFreeTrial", InneractiveMediationDefs.KEY_ZIPCODE, b.f42142b, "requestEsim-BWLJW6A", "(JZLjava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class EsimRepository {
    public static final int $stable = 8;

    @NotNull
    private final MobileApi api;
    private final boolean debug;

    public EsimRepository(@NotNull MobileApi api, boolean z11) {
        Intrinsics.g(api, "api");
        this.api = api;
        this.debug = z11;
    }

    /* renamed from: requestEsim-BWLJW6A$default, reason: not valid java name */
    public static /* synthetic */ Object m189requestEsimBWLJW6A$default(EsimRepository esimRepository, long j11, boolean z11, String str, Continuation continuation, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            str = null;
        }
        return esimRepository.m190requestEsimBWLJW6A(j11, z11, str, continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    @Nullable
    /* renamed from: requestEsim-BWLJW6A, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m190requestEsimBWLJW6A(long j11, boolean z11, @Nullable String str, @NotNull Continuation<? super Result<GetEsimResponse>> continuation) {
        EsimRepository$requestEsim$1 esimRepository$requestEsim$1;
        if (continuation instanceof EsimRepository$requestEsim$1) {
            esimRepository$requestEsim$1 = (EsimRepository$requestEsim$1) continuation;
            int i5 = esimRepository$requestEsim$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                esimRepository$requestEsim$1.label = i5 - Integer.MIN_VALUE;
            } else {
                esimRepository$requestEsim$1 = new EsimRepository$requestEsim$1(this, continuation);
            }
        }
        Object esim = esimRepository$requestEsim$1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = esimRepository$requestEsim$1.label;
        try {
            if (i11 == 0) {
                ResultKt.b(esim);
                int i12 = Result.f71687b;
                MobileApi mobileApi = this.api;
                boolean z12 = this.debug;
                GetEsimRequest getEsimRequest = new GetEsimRequest(j11, z11, str, (String) null, (String) null, (String) null, (String) null, z12 ? Boolean.FALSE : null, z12 ? "US" : null, 120, (DefaultConstructorMarker) null);
                esimRepository$requestEsim$1.label = 1;
                esim = mobileApi.getEsim(getEsimRequest, esimRepository$requestEsim$1);
                if (esim == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(esim);
            }
            p0 p0Var = (p0) esim;
            if (!p0Var.f52631a.c()) {
                throw new IllegalStateException(("get-esim-brand " + p0Var.f52631a.f95556d).toString());
            }
            GetEsimResponse getEsimResponse = (GetEsimResponse) p0Var.f52632b;
            if (getEsimResponse == null) {
                throw new IllegalStateException("empty get-esim-brand body");
            }
            int i13 = Result.f71687b;
            return getEsimResponse;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    public /* synthetic */ EsimRepository(MobileApi mobileApi, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(mobileApi, (i5 & 2) != 0 ? false : z11);
    }
}
