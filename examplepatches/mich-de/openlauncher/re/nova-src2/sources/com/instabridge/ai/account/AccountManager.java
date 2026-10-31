package com.instabridge.ai.account;

import a2.c;
import android.content.Context;
import aq.f;
import aq.h0;
import aq.o;
import bq.e;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.ai.account.AppClosureResult;
import com.instabridge.ai.account.DeletionResult;
import com.instabridge.ai.auth.AccountDeletedInterceptor;
import com.instabridge.ai.auth.AiAuthManager;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import fo.d;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.y0;
import x80.a0;
import x80.d0;
import x80.e0;
import x80.g0;
import x80.j0;
import x80.k0;
import x80.m0;
import x80.p0;
import x80.z;

@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0007\u0018\u0000 \u001c2\u00020\u0001:\u0003\u001d\u001e\u001cB\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u001a\u0010\t\u001a\u00020\b2\b\b\u0002\u0010\u0007\u001a\u00020\u0006H\u0086@¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\f\u001a\u00020\u000bH\u0086@¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0006H\u0086@¢\u0006\u0004\b\u000e\u0010\rJ\u0012\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0086@¢\u0006\u0004\b\u0010\u0010\rR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0011R\u0014\u0010\u0013\u001a\u00020\u00128\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010\u0014R\u001c\u0010\u0017\u001a\n \u0016*\u0004\u0018\u00010\u00150\u00158\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010\u0018R\u0014\u0010\u001a\u001a\u00020\u00198\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001a\u0010\u001b¨\u0006\u001f"}, d2 = {"Lcom/instabridge/ai/account/AccountManager;", b.f42142b, "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", b.f42142b, "force", "Lcom/instabridge/ai/account/DeletionResult;", "requestDeletion", "(ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lcom/instabridge/ai/account/AppClosureResult;", "closeApp", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "cancelDeletion", "Lcom/instabridge/ai/account/DeletionStatus;", "getDeletionStatus", "Landroid/content/Context;", "Lx80/e0;", "client", "Lx80/e0;", "Laq/h0;", "kotlin.jvm.PlatformType", "moshi", "Laq/h0;", "Lx80/a0;", "jsonMediaType", "Lx80/a0;", k.O, "DeleteResponse", "CloseAppResponse", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AccountManager {
    private static final int DEFAULT_GRACE_PERIOD_DAYS = 30;

    @NotNull
    private final e0 client;

    @NotNull
    private final Context context;

    @NotNull
    private final a0 jsonMediaType;
    private final h0 moshi;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0010\b\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0081\b\u0018\u00002\u00020\u0001B/\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0010\b\u0001\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u0005\u0012\n\b\u0001\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0011\u0010\u0012\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u0005HÆ\u0003J\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u000fJ8\u0010\u0014\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\u0010\b\u0003\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u00052\n\b\u0003\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001¢\u0006\u0002\u0010\u0015J\u0013\u0010\u0016\u001a\u00020\u00172\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0019\u001a\u00020\u0007HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0019\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u0010\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001b"}, d2 = {"Lcom/instabridge/ai/account/AccountManager$CloseAppResponse;", b.f42142b, "status", b.f42142b, "remainingApps", b.f42142b, "gracePeriodDays", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/Integer;)V", "getStatus", "()Ljava/lang/String;", "getRemainingApps", "()Ljava/util/List;", "getGracePeriodDays", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/Integer;)Lcom/instabridge/ai/account/AccountManager$CloseAppResponse;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class CloseAppResponse {
        public static final int $stable = 8;

        @Nullable
        private final Integer gracePeriodDays;

        @Nullable
        private final List<String> remainingApps;

        @Nullable
        private final String status;

        public CloseAppResponse(@Nullable String str, @o(name = "remaining_apps") @Nullable List<String> list, @o(name = "grace_period_days") @Nullable Integer num) {
            this.status = str;
            this.remainingApps = list;
            this.gracePeriodDays = num;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ CloseAppResponse copy$default(CloseAppResponse closeAppResponse, String str, List list, Integer num, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = closeAppResponse.status;
            }
            if ((i5 & 2) != 0) {
                list = closeAppResponse.remainingApps;
            }
            if ((i5 & 4) != 0) {
                num = closeAppResponse.gracePeriodDays;
            }
            return closeAppResponse.copy(str, list, num);
        }

        @Nullable
        /* renamed from: component1, reason: from getter */
        public final String getStatus() {
            return this.status;
        }

        @Nullable
        public final List<String> component2() {
            return this.remainingApps;
        }

        @Nullable
        /* renamed from: component3, reason: from getter */
        public final Integer getGracePeriodDays() {
            return this.gracePeriodDays;
        }

        @NotNull
        public final CloseAppResponse copy(@Nullable String status, @o(name = "remaining_apps") @Nullable List<String> remainingApps, @o(name = "grace_period_days") @Nullable Integer gracePeriodDays) {
            return new CloseAppResponse(status, remainingApps, gracePeriodDays);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CloseAppResponse)) {
                return false;
            }
            CloseAppResponse closeAppResponse = (CloseAppResponse) other;
            return Intrinsics.b(this.status, closeAppResponse.status) && Intrinsics.b(this.remainingApps, closeAppResponse.remainingApps) && Intrinsics.b(this.gracePeriodDays, closeAppResponse.gracePeriodDays);
        }

        @Nullable
        public final Integer getGracePeriodDays() {
            return this.gracePeriodDays;
        }

        @Nullable
        public final List<String> getRemainingApps() {
            return this.remainingApps;
        }

        @Nullable
        public final String getStatus() {
            return this.status;
        }

        public int hashCode() {
            String str = this.status;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            List<String> list = this.remainingApps;
            int iHashCode2 = (iHashCode + (list == null ? 0 : list.hashCode())) * 31;
            Integer num = this.gracePeriodDays;
            return iHashCode2 + (num != null ? num.hashCode() : 0);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("CloseAppResponse(status=");
            sb2.append(this.status);
            sb2.append(", remainingApps=");
            sb2.append(this.remainingApps);
            sb2.append(", gracePeriodDays=");
            return c.o(sb2, this.gracePeriodDays, ')');
        }
    }

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0003\b\u0080\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J'\u0010\f\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\b\u001a\u00020\u0006H\u0000¢\u0006\u0004\b\n\u0010\u000bR\u0014\u0010\u000e\u001a\u00020\r8\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lcom/instabridge/ai/account/AccountManager$Companion;", b.f42142b, "<init>", "()V", "Lx80/e0;", "client", b.f42142b, "baseUrl", "token", "Lcom/instabridge/ai/account/AppClosureResult;", "requestAppClosure$instabridge_ai_sdk_release", "(Lx80/e0;Ljava/lang/String;Ljava/lang/String;)Lcom/instabridge/ai/account/AppClosureResult;", "requestAppClosure", b.f42142b, "DEFAULT_GRACE_PERIOD_DAYS", "I", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final AppClosureResult requestAppClosure$instabridge_ai_sdk_release(@NotNull e0 client, @NotNull String baseUrl, @NotNull String token) {
            AppClosureResult error;
            Intrinsics.g(client, "client");
            Intrinsics.g(baseUrl, "baseUrl");
            Intrinsics.g(token, "token");
            g0 g0Var = new g0();
            g0Var.k(baseUrl.concat("api/account/close-app"));
            g0Var.a("Authorization", "Bearer ".concat(token));
            g0Var.a("Content-Type", "application/json");
            g0Var.a("X-Client-Platform", "mobile-sdk");
            j0 j0Var = k0.Companion;
            Pattern pattern = a0.f95396e;
            a0 a0VarA = z.a("application/json");
            j0Var.getClass();
            g0Var.h(j0.a("{\"confirmation\":\"CLOSE\"}", a0VarA));
            try {
                m0 m0VarL = client.c(g0Var.b()).l();
                try {
                    p0 p0Var = m0VarL.f95559g;
                    String strString = p0Var != null ? p0Var.string() : null;
                    if (strString == null) {
                        strString = b.f42142b;
                    }
                    if (!m0VarL.c()) {
                        StringBuilder sb2 = new StringBuilder("HTTP ");
                        sb2.append(m0VarL.f95556d);
                        sb2.append(": ");
                        if (strString.length() == 0) {
                            strString = m0VarL.f95555c;
                        }
                        sb2.append(strString);
                        AppClosureResult.Error error2 = new AppClosureResult.Error(sb2.toString());
                        m0VarL.close();
                        return error2;
                    }
                    aq.e0 e0Var = new aq.e0(0);
                    e0Var.d(new f(6));
                    CloseAppResponse closeAppResponse = (CloseAppResponse) new h0(e0Var).b(CloseAppResponse.class, e.f18422a, null).b(strString);
                    String status = closeAppResponse != null ? closeAppResponse.getStatus() : null;
                    if (Intrinsics.b(status, "closed")) {
                        List<String> remainingApps = closeAppResponse.getRemainingApps();
                        if (remainingApps == null) {
                            remainingApps = EmptyList.f71733a;
                        }
                        error = new AppClosureResult.Closed(remainingApps);
                    } else if (Intrinsics.b(status, "pending_deletion")) {
                        Integer gracePeriodDays = closeAppResponse.getGracePeriodDays();
                        error = new AppClosureResult.DeletionScheduled(gracePeriodDays != null ? gracePeriodDays.intValue() : 30);
                    } else {
                        StringBuilder sb3 = new StringBuilder("Unexpected close-app status: ");
                        sb3.append(closeAppResponse != null ? closeAppResponse.getStatus() : null);
                        error = new AppClosureResult.Error(sb3.toString());
                    }
                    m0VarL.close();
                    return error;
                } finally {
                }
            } catch (Exception e3) {
                String message = e3.getMessage();
                if (message == null) {
                    message = "Unknown error";
                }
                return new AppClosureResult.Error(message);
            }
        }

        private Companion() {
        }
    }

    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0082\b\u0018\u00002\u00020\u0001B\u0013\u0012\n\b\u0001\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\t\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0007J\u001a\u0010\n\u001a\u00020\u00002\n\b\u0003\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010\u000bJ\u0013\u0010\f\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\b\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0012"}, d2 = {"Lcom/instabridge/ai/account/AccountManager$DeleteResponse;", b.f42142b, "gracePeriodDays", b.f42142b, "<init>", "(Ljava/lang/Integer;)V", "getGracePeriodDays", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "component1", "copy", "(Ljava/lang/Integer;)Lcom/instabridge/ai/account/AccountManager$DeleteResponse;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class DeleteResponse {

        @Nullable
        private final Integer gracePeriodDays;

        public DeleteResponse(@o(name = "grace_period_days") @Nullable Integer num) {
            this.gracePeriodDays = num;
        }

        public static /* synthetic */ DeleteResponse copy$default(DeleteResponse deleteResponse, Integer num, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                num = deleteResponse.gracePeriodDays;
            }
            return deleteResponse.copy(num);
        }

        @Nullable
        /* renamed from: component1, reason: from getter */
        public final Integer getGracePeriodDays() {
            return this.gracePeriodDays;
        }

        @NotNull
        public final DeleteResponse copy(@o(name = "grace_period_days") @Nullable Integer gracePeriodDays) {
            return new DeleteResponse(gracePeriodDays);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof DeleteResponse) && Intrinsics.b(this.gracePeriodDays, ((DeleteResponse) other).gracePeriodDays);
        }

        @Nullable
        public final Integer getGracePeriodDays() {
            return this.gracePeriodDays;
        }

        public int hashCode() {
            Integer num = this.gracePeriodDays;
            if (num == null) {
                return 0;
            }
            return num.hashCode();
        }

        @NotNull
        public String toString() {
            return c.o(new StringBuilder("DeleteResponse(gracePeriodDays="), this.gracePeriodDays, ')');
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)Z"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.account.AccountManager$cancelDeletion$2", f = "AccountManager.kt", l = {145}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.account.AccountManager$cancelDeletion$2, reason: invalid class name */
    public static final class AnonymousClass2 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Boolean>, Object> {
        int label;

        public AnonymousClass2(Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AccountManager.this.new AnonymousClass2(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            boolean zC;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                AiAuthManager aiAuthManagerA = d.a();
                this.label = 1;
                obj = aiAuthManagerA.getToken(this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            String str = (String) obj;
            if (str == null) {
                return Boolean.FALSE;
            }
            g0 g0Var = new g0();
            g0Var.k(d.c().f55437b + "api/account/cancel-deletion");
            g0Var.a("Authorization", "Bearer ".concat(str));
            g0Var.a("Content-Type", "application/json");
            g0Var.a("X-Client-Platform", "mobile-sdk");
            j0 j0Var = k0.Companion;
            a0 a0Var = AccountManager.this.jsonMediaType;
            j0Var.getClass();
            g0Var.h(j0.a("{}", a0Var));
            try {
                m0 m0VarL = AccountManager.this.client.c(g0Var.b()).l();
                try {
                    zC = m0VarL.c();
                    m0VarL.close();
                } finally {
                }
            } catch (Exception unused) {
                zC = false;
            }
            return Boolean.valueOf(zC);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(t70.j0 j0Var, Continuation<? super Boolean> continuation) {
            return ((AnonymousClass2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", "Lcom/instabridge/ai/account/AppClosureResult;", "<anonymous>", "(Lt70/j0;)Lcom/instabridge/ai/account/AppClosureResult;"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.account.AccountManager$closeApp$2", f = "AccountManager.kt", l = {Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE, Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.account.AccountManager$closeApp$2, reason: invalid class name and case insensitive filesystem */
    public static final class C27692 extends SuspendLambda implements Function2<t70.j0, Continuation<? super AppClosureResult>, Object> {
        Object L$0;
        int label;

        public C27692(Continuation<? super C27692> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AccountManager.this.new C27692(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                AiAuthManager aiAuthManagerA = d.a();
                this.label = 1;
                obj = aiAuthManagerA.getToken(this);
                if (obj != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i5 != 1) {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                AppClosureResult appClosureResult = (AppClosureResult) this.L$0;
                ResultKt.b(obj);
                return appClosureResult;
            }
            ResultKt.b(obj);
            String str = (String) obj;
            if (str == null) {
                return AppClosureResult.NotAuthenticated.INSTANCE;
            }
            AppClosureResult appClosureResultRequestAppClosure$instabridge_ai_sdk_release = AccountManager.INSTANCE.requestAppClosure$instabridge_ai_sdk_release(AccountManager.this.client, d.c().f55437b, str);
            if ((appClosureResultRequestAppClosure$instabridge_ai_sdk_release instanceof AppClosureResult.Closed) || (appClosureResultRequestAppClosure$instabridge_ai_sdk_release instanceof AppClosureResult.DeletionScheduled)) {
                AiAuthManager aiAuthManagerA2 = d.a();
                this.L$0 = appClosureResultRequestAppClosure$instabridge_ai_sdk_release;
                this.label = 2;
                if (aiAuthManagerA2.logout(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            return appClosureResultRequestAppClosure$instabridge_ai_sdk_release;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(t70.j0 j0Var, Continuation<? super AppClosureResult> continuation) {
            return ((C27692) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", "Lcom/instabridge/ai/account/DeletionStatus;", "<anonymous>", "(Lt70/j0;)Lcom/instabridge/ai/account/DeletionStatus;"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.account.AccountManager$getDeletionStatus$2", f = "AccountManager.kt", l = {169}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.account.AccountManager$getDeletionStatus$2, reason: invalid class name and case insensitive filesystem */
    public static final class C27702 extends SuspendLambda implements Function2<t70.j0, Continuation<? super DeletionStatus>, Object> {
        int label;

        public C27702(Continuation<? super C27702> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AccountManager.this.new C27702(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            String strString;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                AiAuthManager aiAuthManagerA = d.a();
                this.label = 1;
                obj = aiAuthManagerA.getToken(this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            String str = (String) obj;
            if (str != null) {
                g0 g0Var = new g0();
                g0Var.k(d.c().f55437b + "api/account/deletion-status");
                g0Var.a("Authorization", "Bearer ".concat(str));
                g0Var.a("X-Client-Platform", "mobile-sdk");
                g0Var.d();
                try {
                    m0 m0VarL = AccountManager.this.client.c(g0Var.b()).l();
                    AccountManager accountManager = AccountManager.this;
                    try {
                        if (!m0VarL.c()) {
                            m0VarL.close();
                            return null;
                        }
                        p0 p0Var = m0VarL.f95559g;
                        if (p0Var != null && (strString = p0Var.string()) != null) {
                            h0 h0Var = accountManager.moshi;
                            h0Var.getClass();
                            DeletionStatus deletionStatus = (DeletionStatus) h0Var.b(DeletionStatus.class, e.f18422a, null).b(strString);
                            m0VarL.close();
                            return deletionStatus;
                        }
                        m0VarL.close();
                        return null;
                    } finally {
                    }
                } catch (Exception unused) {
                }
            }
            return null;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(t70.j0 j0Var, Continuation<? super DeletionStatus> continuation) {
            return ((C27702) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", "Lcom/instabridge/ai/account/DeletionResult;", "<anonymous>", "(Lt70/j0;)Lcom/instabridge/ai/account/DeletionResult;"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.account.AccountManager$requestDeletion$2", f = "AccountManager.kt", l = {80}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.ai.account.AccountManager$requestDeletion$2, reason: invalid class name and case insensitive filesystem */
    public static final class C27712 extends SuspendLambda implements Function2<t70.j0, Continuation<? super DeletionResult>, Object> {
        final /* synthetic */ boolean $force;
        int label;
        final /* synthetic */ AccountManager this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C27712(boolean z11, AccountManager accountManager, Continuation<? super C27712> continuation) {
            super(2, continuation);
            this.$force = z11;
            this.this$0 = accountManager;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new C27712(this.$force, this.this$0, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            String strString;
            Object scheduled;
            Integer gracePeriodDays;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                AiAuthManager aiAuthManagerA = d.a();
                this.label = 1;
                obj = aiAuthManagerA.getToken(this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            String str = (String) obj;
            if (str == null) {
                return DeletionResult.NotAuthenticated.INSTANCE;
            }
            String strP = c.p(new StringBuilder("{\"confirmation\":\"DELETE\",\"force\":"), this.$force, AbstractJsonLexerKt.END_OBJ);
            g0 g0Var = new g0();
            g0Var.k(d.c().f55437b + "api/account/delete");
            g0Var.a("Authorization", "Bearer ".concat(str));
            g0Var.a("Content-Type", "application/json");
            g0Var.a("X-Client-Platform", "mobile-sdk");
            j0 j0Var = k0.Companion;
            a0 a0Var = this.this$0.jsonMediaType;
            j0Var.getClass();
            g0Var.g(j0.a(strP, a0Var), "DELETE");
            try {
                m0 m0VarL = this.this$0.client.c(g0Var.b()).l();
                AccountManager accountManager = this.this$0;
                boolean z11 = this.$force;
                try {
                    p0 p0Var = m0VarL.f95559g;
                    if (p0Var == null || (strString = p0Var.string()) == null) {
                        strString = b.f42142b;
                    }
                    if (m0VarL.c()) {
                        h0 h0Var = accountManager.moshi;
                        h0Var.getClass();
                        DeleteResponse deleteResponse = (DeleteResponse) h0Var.b(DeleteResponse.class, e.f18422a, null).b(strString);
                        if (z11) {
                            d.a().clearSessionAndConsent();
                            scheduled = DeletionResult.ImmediatelyDeleted.INSTANCE;
                        } else {
                            scheduled = new DeletionResult.Scheduled((deleteResponse == null || (gracePeriodDays = deleteResponse.getGracePeriodDays()) == null) ? 30 : gracePeriodDays.intValue());
                        }
                        m0VarL.close();
                        return scheduled;
                    }
                    if (strString.length() == 0) {
                        strString = m0VarL.f95555c;
                    }
                    DeletionResult.Error error = new DeletionResult.Error("HTTP " + m0VarL.f95556d + ": " + strString);
                    m0VarL.close();
                    return error;
                } finally {
                }
            } catch (Exception e3) {
                String message = e3.getMessage();
                if (message == null) {
                    message = "Unknown error";
                }
                return new DeletionResult.Error(message);
            }
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(t70.j0 j0Var, Continuation<? super DeletionResult> continuation) {
            return ((C27712) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    public AccountManager(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.context = context;
        d0 d0Var = new d0();
        TimeUnit timeUnit = TimeUnit.SECONDS;
        d0Var.c(30L, timeUnit);
        d0Var.d(30L, timeUnit);
        d0Var.e(30L);
        d0Var.a(AccountDeletedInterceptor.INSTANCE);
        this.client = new e0(d0Var);
        aq.e0 e0Var = new aq.e0(0);
        e0Var.d(new f(6));
        this.moshi = new h0(e0Var);
        Pattern pattern = a0.f95396e;
        this.jsonMediaType = z.a("application/json");
    }

    public static /* synthetic */ Object requestDeletion$default(AccountManager accountManager, boolean z11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = false;
        }
        return accountManager.requestDeletion(z11, continuation);
    }

    @Nullable
    public final Object cancelDeletion(@NotNull Continuation<? super Boolean> continuation) throws Throwable {
        a80.e eVar = y0.f88884a;
        return t70.m0.y(a80.d.f488c, new AnonymousClass2(null), continuation);
    }

    @Nullable
    public final Object closeApp(@NotNull Continuation<? super AppClosureResult> continuation) {
        a80.e eVar = y0.f88884a;
        return t70.m0.y(a80.d.f488c, new C27692(null), continuation);
    }

    @Nullable
    public final Object getDeletionStatus(@NotNull Continuation<? super DeletionStatus> continuation) throws Throwable {
        a80.e eVar = y0.f88884a;
        return t70.m0.y(a80.d.f488c, new C27702(null), continuation);
    }

    @Nullable
    public final Object requestDeletion(boolean z11, @NotNull Continuation<? super DeletionResult> continuation) {
        a80.e eVar = y0.f88884a;
        return t70.m0.y(a80.d.f488c, new C27712(z11, this, null), continuation);
    }
}
