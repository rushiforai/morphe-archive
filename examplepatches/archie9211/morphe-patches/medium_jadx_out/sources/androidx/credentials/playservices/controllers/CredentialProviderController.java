package androidx.credentials.playservices.controllers;

import android.content.Context;
import android.os.Bundle;
import android.os.CancellationSignal;
import androidx.credentials.exceptions.CreateCredentialCancellationException;
import androidx.credentials.exceptions.CreateCredentialUnknownException;
import androidx.credentials.exceptions.GetCredentialCancellationException;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import defpackage.ah2;
import defpackage.b55;
import defpackage.c1e;
import defpackage.ev6;
import defpackage.gy2;
import defpackage.ho;
import defpackage.ih2;
import defpackage.ik4;
import defpackage.le0;
import defpackage.m45;
import defpackage.rya;
import defpackage.x45;
import java.util.concurrent.Executor;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\t\b \u0018\u0000 #*\b\b\u0000\u0010\u0002*\u00020\u0001*\b\b\u0001\u0010\u0003*\u00020\u0001*\b\b\u0002\u0010\u0004*\u00020\u0001*\b\b\u0003\u0010\u0005*\u00020\u0001*\b\b\u0004\u0010\u0006*\u00020\u00012\u00020\u0007:\u0001#B\u000f\u0012\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ[\u0010\u0018\u001a\u00020\u00172\u0006\u0010\r\u001a\u00020\f2\u001c\u0010\u0010\u001a\u0018\u0012\u0006\u0012\u0004\u0018\u00010\u000f\u0012\u0006\u0012\u0004\u0018\u00010\u000f\u0012\u0004\u0012\u00028\u00040\u000e2\u0006\u0010\u0012\u001a\u00020\u00112\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00028\u0003\u0012\u0004\u0012\u00028\u00040\u00132\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015H\u0004¢\u0006\u0004\b\u0018\u0010\u0019J?\u0010\u001c\u001a\u00020\u001b2\u0006\u0010\u001a\u001a\u00028\u00002\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00028\u0003\u0012\u0004\u0012\u00028\u00040\u00132\u0006\u0010\u0012\u001a\u00020\u00112\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0015H&¢\u0006\u0004\b\u001c\u0010\u001dJ\u0017\u0010\u001e\u001a\u00028\u00012\u0006\u0010\u001a\u001a\u00028\u0000H$¢\u0006\u0004\b\u001e\u0010\u001fJ\u0017\u0010!\u001a\u00028\u00032\u0006\u0010 \u001a\u00028\u0002H$¢\u0006\u0004\b!\u0010\u001fR\u0014\u0010\t\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\"¨\u0006$"}, d2 = {"Landroidx/credentials/playservices/controllers/CredentialProviderController;", "", "T1", "T2", "R2", "R1", "E1", "Landroidx/credentials/playservices/controllers/CredentialProviderBaseController;", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "Landroid/os/Bundle;", "resultData", "Lkotlin/Function2;", "", "conversionFn", "Ljava/util/concurrent/Executor;", "executor", "Lah2;", "callback", "Landroid/os/CancellationSignal;", "cancellationSignal", "", "maybeReportErrorFromResultReceiver", "(Landroid/os/Bundle;Lb55;Ljava/util/concurrent/Executor;Lah2;Landroid/os/CancellationSignal;)Z", "request", "Lc1e;", "invokePlayServices", "(Ljava/lang/Object;Lah2;Ljava/util/concurrent/Executor;Landroid/os/CancellationSignal;)V", "convertRequestToPlayServices", "(Ljava/lang/Object;)Ljava/lang/Object;", "response", "convertResponseToCredentialManager", "Landroid/content/Context;", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public abstract class CredentialProviderController<T1, T2, R2, R1, E1> extends CredentialProviderBaseController {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    public static final String ERROR_MESSAGE_START_ACTIVITY_FAILED = "Failed to launch the selector UI. Hint: ensure the `context` parameter is an Activity-based context.";
    private final Context context;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    /* JADX INFO: loaded from: classes2.dex */
    @Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\t\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003JW\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0005\u001a\u00020\u00042 \u0010\n\u001a\u001c\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0012\n\u0012\b\u0012\u0004\u0012\u00020\t0\b\u0012\u0004\u0012\u00020\t0\u00062\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u00020\t0\u000b2\b\u0010\u000e\u001a\u0004\u0018\u00010\u0007H\u0005¢\u0006\u0004\b\u0010\u0010\u0011J\u0017\u0010\u0015\u001a\u00020\u00122\u0006\u0010\u0005\u001a\u00020\u0004H\u0000¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0018\u001a\u00020\u0012H\u0000¢\u0006\u0004\b\u0016\u0010\u0017JW\u0010\u001b\u001a\u00020\u000f2\u0006\u0010\u0005\u001a\u00020\u00042 \u0010\n\u001a\u001c\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0012\n\u0012\b\u0012\u0004\u0012\u00020\t0\b\u0012\u0004\u0012\u00020\t0\u00062\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0019\u0012\u0004\u0012\u00020\t0\u000b2\b\u0010\u000e\u001a\u0004\u0018\u00010\u0007H\u0001¢\u0006\u0004\b\u001a\u0010\u0011J'\u0010\u001f\u001a\u00020\t2\b\u0010\u000e\u001a\u0004\u0018\u00010\u00072\f\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\t0\bH\u0001¢\u0006\u0004\b\u001d\u0010\u001eR\u0014\u0010 \u001a\u00020\u00128\u0000X\u0080T¢\u0006\u0006\n\u0004\b \u0010!¨\u0006\""}, d2 = {"Landroidx/credentials/playservices/controllers/CredentialProviderController$Companion;", "", "<init>", "()V", "", "resultCode", "Lkotlin/Function2;", "Landroid/os/CancellationSignal;", "Lkotlin/Function0;", "Lc1e;", "cancelOnError", "Lkotlin/Function1;", "Landroidx/credentials/exceptions/CreateCredentialException;", "onError", "cancellationSignal", "", "maybeReportErrorResultCodeCreate", "(ILb55;Lx45;Landroid/os/CancellationSignal;)Z", "", "generateErrorStringUnknown$credentials_play_services_auth", "(I)Ljava/lang/String;", "generateErrorStringUnknown", "generateErrorStringCanceled$credentials_play_services_auth", "()Ljava/lang/String;", "generateErrorStringCanceled", "Landroidx/credentials/exceptions/GetCredentialException;", "maybeReportErrorResultCodeGet$credentials_play_services_auth", "maybeReportErrorResultCodeGet", "onResultOrException", "cancelOrCallbackExceptionOrResult$credentials_play_services_auth", "(Landroid/os/CancellationSignal;Lm45;)V", "cancelOrCallbackExceptionOrResult", "ERROR_MESSAGE_START_ACTIVITY_FAILED", "Ljava/lang/String;", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final c1e maybeReportErrorResultCodeCreate$lambda$0(x45 x45Var, rya ryaVar) {
            x45Var.invoke(ryaVar.a);
            return c1e.a;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final c1e maybeReportErrorResultCodeGet$lambda$0(x45 x45Var, rya ryaVar) {
            x45Var.invoke(ryaVar.a);
            return c1e.a;
        }

        public final void cancelOrCallbackExceptionOrResult$credentials_play_services_auth(CancellationSignal cancellationSignal, m45 onResultOrException) {
            onResultOrException.getClass();
            if (CredentialProviderPlayServicesImpl.INSTANCE.cancellationReviewer$credentials_play_services_auth(cancellationSignal)) {
                return;
            }
            onResultOrException.invoke();
        }

        public final String generateErrorStringUnknown$credentials_play_services_auth(int resultCode) {
            return ev6.w("activity with result code: ", resultCode, " indicating not RESULT_OK");
        }

        public final boolean maybeReportErrorResultCodeCreate(int resultCode, b55 cancelOnError, x45 onError, CancellationSignal cancellationSignal) {
            cancelOnError.getClass();
            onError.getClass();
            int i = 0;
            if (resultCode == -1) {
                return false;
            }
            rya ryaVar = new rya();
            ryaVar.a = new CreateCredentialUnknownException(generateErrorStringUnknown$credentials_play_services_auth(resultCode));
            if (resultCode == 0) {
                ryaVar.a = new CreateCredentialCancellationException(generateErrorStringCanceled$credentials_play_services_auth());
            }
            cancelOnError.invoke(cancellationSignal, new ih2(onError, ryaVar, i));
            return true;
        }

        public final boolean maybeReportErrorResultCodeGet$credentials_play_services_auth(int resultCode, b55 cancelOnError, x45 onError, CancellationSignal cancellationSignal) {
            cancelOnError.getClass();
            onError.getClass();
            if (resultCode == -1) {
                return false;
            }
            rya ryaVar = new rya();
            ryaVar.a = new GetCredentialUnknownException(generateErrorStringUnknown$credentials_play_services_auth(resultCode));
            if (resultCode == 0) {
                ryaVar.a = new GetCredentialCancellationException(generateErrorStringCanceled$credentials_play_services_auth());
            }
            cancelOnError.invoke(cancellationSignal, new ih2(onError, ryaVar, 1));
            return true;
        }

        public final String generateErrorStringCanceled$credentials_play_services_auth() {
            return HrUBqHumRuLe.wZIWcJAnqKJsA;
        }

        private Companion() {
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CredentialProviderController(Context context) {
        super(context);
        context.getClass();
        this.context = context;
    }

    public static /* synthetic */ void invokePlayServices$default(CredentialProviderController credentialProviderController, Object obj, ah2 ah2Var, Executor executor, CancellationSignal cancellationSignal, int i, Object obj2) {
        if (obj2 != null) {
            ik4.k("Super calls with default arguments not supported in this target, function: invokePlayServices");
            return;
        }
        if ((i & 8) != 0) {
            cancellationSignal = null;
        }
        credentialProviderController.invokePlayServices(obj, ah2Var, executor, cancellationSignal);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e maybeReportErrorFromResultReceiver$lambda$0(Executor executor, ah2 ah2Var, Object obj) {
        executor.execute(new ho(ah2Var, 26, obj));
        return c1e.a;
    }

    public static final boolean maybeReportErrorResultCodeCreate(int i, b55 b55Var, x45 x45Var, CancellationSignal cancellationSignal) {
        return INSTANCE.maybeReportErrorResultCodeCreate(i, b55Var, x45Var, cancellationSignal);
    }

    public abstract T2 convertRequestToPlayServices(T1 request);

    public abstract R1 convertResponseToCredentialManager(R2 response);

    public abstract void invokePlayServices(T1 request, ah2 callback, Executor executor, CancellationSignal cancellationSignal);

    public final boolean maybeReportErrorFromResultReceiver(Bundle resultData, b55 conversionFn, Executor executor, ah2 callback, CancellationSignal cancellationSignal) {
        resultData.getClass();
        conversionFn.getClass();
        executor.getClass();
        callback.getClass();
        if (!resultData.getBoolean(CredentialProviderBaseController.FAILURE_RESPONSE_TAG)) {
            return false;
        }
        INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new le0(executor, callback, conversionFn.invoke(resultData.getString(CredentialProviderBaseController.EXCEPTION_TYPE_TAG), resultData.getString(CredentialProviderBaseController.EXCEPTION_MESSAGE_TAG)), 14));
        return true;
    }
}
