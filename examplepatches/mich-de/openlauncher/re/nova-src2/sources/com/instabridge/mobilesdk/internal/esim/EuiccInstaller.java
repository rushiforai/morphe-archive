package com.instabridge.mobilesdk.internal.esim;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.telephony.euicc.DownloadableSubscription;
import android.telephony.euicc.EuiccManager;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.gms.internal.consent_sdk.h5;
import com.instabridge.mobilesdk.internal.Logger;
import com.instabridge.mobilesdk.internal.esim.EsimInstallResult;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.m0;
import t70.r;
import t70.s;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u0000 \u00182\u00020\u0001:\u0002\u0017\u0018B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u0006\u0010\n\u001a\u00020\u0005J*\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000e2\u0012\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u00120\u0010H\u0086@¢\u0006\u0002\u0010\u0013J\b\u0010\u0014\u001a\u00020\u0012H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\b\u001a\u0004\u0018\u00010\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0016X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0019"}, d2 = {"Lcom/instabridge/mobilesdk/internal/esim/EuiccInstaller;", b.f42142b, "appContext", "Landroid/content/Context;", "debugForceSuccess", b.f42142b, "<init>", "(Landroid/content/Context;Z)V", "euiccManager", "Landroid/telephony/euicc/EuiccManager;", "isEsimSupported", "install", "Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult;", "activationCode", b.f42142b, "onResolutionRequired", "Lkotlin/Function1;", "Landroid/content/Intent;", b.f42142b, "(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "ensureReceiverRegistered", "receiver", "Lcom/instabridge/mobilesdk/internal/esim/EsimInstallReceiver;", "InstallSignal", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class EuiccInstaller {

    @Nullable
    private static volatile r currentDeferred;
    private static volatile boolean receiverRegistered;

    @NotNull
    private final Context appContext;
    private final boolean debugForceSuccess;

    @Nullable
    private final EuiccManager euiccManager;

    @NotNull
    private final EsimInstallReceiver receiver;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0017\u0010\t\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0000¢\u0006\u0004\b\u0007\u0010\bJ\u0017\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\nH\u0000¢\u0006\u0004\b\f\u0010\rR\u001e\u0010\u0011\u001a\n\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u000f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0011\u0010\u0012R\u0016\u0010\u0014\u001a\u00020\u00138\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0014\u0010\u0015¨\u0006\u0016"}, d2 = {"Lcom/instabridge/mobilesdk/internal/esim/EuiccInstaller$Companion;", b.f42142b, "<init>", "()V", "Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult;", "result", b.f42142b, "deliver$mobile_sdk_release", "(Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult;)V", "deliver", "Landroid/content/Intent;", "resolutionIntent", "deliverResolution$mobile_sdk_release", "(Landroid/content/Intent;)V", "deliverResolution", "Lt70/r;", "Lcom/instabridge/mobilesdk/internal/esim/EuiccInstaller$InstallSignal;", "currentDeferred", "Lt70/r;", b.f42142b, "receiverRegistered", "Z", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public final void deliver$mobile_sdk_release(@NotNull EsimInstallResult result) {
            Intrinsics.g(result, "result");
            r rVar = EuiccInstaller.currentDeferred;
            EuiccInstaller.currentDeferred = null;
            if (rVar != null) {
                ((s) rVar).X(new InstallSignal.Terminal(result));
            }
        }

        public final void deliverResolution$mobile_sdk_release(@NotNull Intent resolutionIntent) {
            Intrinsics.g(resolutionIntent, "resolutionIntent");
            r rVar = EuiccInstaller.currentDeferred;
            EuiccInstaller.currentDeferred = m0.b();
            if (rVar != null) {
                ((s) rVar).X(new InstallSignal.Resolution(resolutionIntent));
            }
        }

        private Companion() {
        }
    }

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\br\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/instabridge/mobilesdk/internal/esim/EuiccInstaller$InstallSignal;", b.f42142b, "Terminal", "Resolution", "Lcom/instabridge/mobilesdk/internal/esim/EuiccInstaller$InstallSignal$Resolution;", "Lcom/instabridge/mobilesdk/internal/esim/EuiccInstaller$InstallSignal$Terminal;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public interface InstallSignal {

        @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0012"}, d2 = {"Lcom/instabridge/mobilesdk/internal/esim/EuiccInstaller$InstallSignal$Resolution;", "Lcom/instabridge/mobilesdk/internal/esim/EuiccInstaller$InstallSignal;", "intent", "Landroid/content/Intent;", "<init>", "(Landroid/content/Intent;)V", "getIntent", "()Landroid/content/Intent;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Resolution implements InstallSignal {
            public static final int $stable = 8;

            @NotNull
            private final Intent intent;

            public Resolution(@NotNull Intent intent) {
                Intrinsics.g(intent, "intent");
                this.intent = intent;
            }

            public static /* synthetic */ Resolution copy$default(Resolution resolution, Intent intent, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    intent = resolution.intent;
                }
                return resolution.copy(intent);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final Intent getIntent() {
                return this.intent;
            }

            @NotNull
            public final Resolution copy(@NotNull Intent intent) {
                Intrinsics.g(intent, "intent");
                return new Resolution(intent);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof Resolution) && Intrinsics.b(this.intent, ((Resolution) other).intent);
            }

            @NotNull
            public final Intent getIntent() {
                return this.intent;
            }

            public int hashCode() {
                return this.intent.hashCode();
            }

            @NotNull
            public String toString() {
                return "Resolution(intent=" + this.intent + ")";
            }
        }

        @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0012"}, d2 = {"Lcom/instabridge/mobilesdk/internal/esim/EuiccInstaller$InstallSignal$Terminal;", "Lcom/instabridge/mobilesdk/internal/esim/EuiccInstaller$InstallSignal;", "result", "Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult;", "<init>", "(Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult;)V", "getResult", "()Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Terminal implements InstallSignal {
            public static final int $stable = 8;

            @NotNull
            private final EsimInstallResult result;

            public Terminal(@NotNull EsimInstallResult result) {
                Intrinsics.g(result, "result");
                this.result = result;
            }

            public static /* synthetic */ Terminal copy$default(Terminal terminal, EsimInstallResult esimInstallResult, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    esimInstallResult = terminal.result;
                }
                return terminal.copy(esimInstallResult);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final EsimInstallResult getResult() {
                return this.result;
            }

            @NotNull
            public final Terminal copy(@NotNull EsimInstallResult result) {
                Intrinsics.g(result, "result");
                return new Terminal(result);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof Terminal) && Intrinsics.b(this.result, ((Terminal) other).result);
            }

            @NotNull
            public final EsimInstallResult getResult() {
                return this.result;
            }

            public int hashCode() {
                return this.result.hashCode();
            }

            @NotNull
            public String toString() {
                return "Terminal(result=" + this.result + ")";
            }
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.esim.EuiccInstaller", f = "EuiccInstaller.kt", l = {59, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE}, m = "install")
    /* renamed from: com.instabridge.mobilesdk.internal.esim.EuiccInstaller$install$1, reason: invalid class name */
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
            return EuiccInstaller.this.install(null, null, this);
        }
    }

    public EuiccInstaller(@NotNull Context appContext, boolean z11) {
        Intrinsics.g(appContext, "appContext");
        this.appContext = appContext;
        this.debugForceSuccess = z11;
        this.euiccManager = h5.e(appContext.getSystemService(h5.r()));
        this.receiver = new EsimInstallReceiver();
    }

    private final void ensureReceiverRegistered() {
        if (receiverRegistered) {
            return;
        }
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction(EsimInstallReceiver.ACTION_DOWNLOAD_SUBSCRIPTION);
        intentFilter.addAction(EsimInstallReceiver.ACTION_RESOLVE_DOWNLOAD_SUBSCRIPTION);
        this.appContext.registerReceiver(this.receiver, intentFilter, Build.VERSION.SDK_INT >= 33 ? 4 : 0);
        receiverRegistered = true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0052, code lost:
    
        if (t70.t0.b(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.a.f39430h, r0) == r1) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00b9, code lost:
    
        if (r15 == r1) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00bb, code lost:
    
        return r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:34:0x00b9 -> B:36:0x00bc). Please report as a decompilation issue!!! */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object install(@NotNull String str, @NotNull Function1<? super Intent, Unit> function1, @NotNull Continuation<? super EsimInstallResult> continuation) {
        AnonymousClass1 anonymousClass1;
        r rVar;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object objL = anonymousClass1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        if (i11 == 0) {
            ResultKt.b(objL);
            if (this.debugForceSuccess) {
                Logger.INSTANCE.d("EuiccInstaller: debugForceSuccess — skipping real install");
                anonymousClass1.label = 1;
            } else {
                EuiccManager euiccManager = this.euiccManager;
                if (euiccManager == null) {
                    return new EsimInstallResult.Failed(-1, 0, 0, 0, null, null, "EuiccManager unavailable");
                }
                ensureReceiverRegistered();
                DownloadableSubscription downloadableSubscriptionForActivationCode = DownloadableSubscription.forActivationCode(str);
                Intent intent = new Intent(EsimInstallReceiver.ACTION_DOWNLOAD_SUBSCRIPTION);
                intent.setPackage(this.appContext.getPackageName());
                PendingIntent broadcast = PendingIntent.getBroadcast(this.appContext, 0, intent, 167772160);
                currentDeferred = m0.b();
                Logger.INSTANCE.d("EuiccManager.downloadSubscription(...)");
                try {
                    euiccManager.downloadSubscription(downloadableSubscriptionForActivationCode, true, broadcast);
                    rVar = currentDeferred;
                    if (rVar != null) {
                    }
                } catch (SecurityException e3) {
                    Logger.INSTANCE.d("EuiccManager.downloadSubscription threw: " + e3.getMessage());
                    currentDeferred = null;
                    return new EsimInstallResult.Failed(-1, 0, 0, 0, null, null, c0.k("downloadSubscription SecurityException: ", e3.getMessage()));
                }
            }
        } else if (i11 == 1) {
            ResultKt.b(objL);
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Function1<? super Intent, Unit> function12 = (Function1) anonymousClass1.L$0;
            ResultKt.b(objL);
            function1 = function12;
            InstallSignal installSignal = (InstallSignal) objL;
            if (installSignal instanceof InstallSignal.Terminal) {
                return ((InstallSignal.Terminal) installSignal).getResult();
            }
            if (!(installSignal instanceof InstallSignal.Resolution)) {
                throw new NoWhenBranchMatchedException();
            }
            function1.invoke(((InstallSignal.Resolution) installSignal).getIntent());
            rVar = currentDeferred;
            if (rVar != null) {
                return new EsimInstallResult.Failed(-1, 0, 0, 0, null, null, "install protocol violation: deferred missing");
            }
            anonymousClass1.L$0 = function1;
            anonymousClass1.label = 2;
            objL = rVar.l(anonymousClass1);
        }
        return new EsimInstallResult.Ok(b.f42142b);
    }

    public final boolean isEsimSupported() {
        EuiccManager euiccManager = this.euiccManager;
        return euiccManager != null && euiccManager.isEnabled();
    }

    public /* synthetic */ EuiccInstaller(Context context, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, (i5 & 2) != 0 ? false : z11);
    }
}
