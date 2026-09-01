package androidx.credentials.playservices.controllers.identityauth.createpassword;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Handler;
import android.os.Looper;
import android.os.ResultReceiver;
import android.util.Log;
import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.exceptions.CreateCredentialUnknownException;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.CredentialProviderBaseController;
import androidx.credentials.playservices.controllers.CredentialProviderController;
import androidx.credentials.playservices.controllers.identityauth.HiddenActivity;
import com.google.android.gms.common.api.ApiException;
import defpackage.ah2;
import defpackage.bf2;
import defpackage.c1e;
import defpackage.cf2;
import defpackage.g76;
import defpackage.gf2;
import defpackage.gy2;
import defpackage.ho;
import defpackage.jh2;
import defpackage.l8;
import defpackage.m45;
import defpackage.rd6;
import defpackage.s0;
import defpackage.v0;
import defpackage.v02;
import defpackage.wf2;
import defpackage.ynb;
import defpackage.znb;
import java.util.concurrent.Executor;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000O\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0003\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0011\n\u0002\b\u0005*\u0001*\b\u0000\u0018\u0000 -2 \u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0001:\u0001-B\u000f\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u0017\u0010\r\u001a\u00020\u00062\u0006\u0010\f\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\r\u0010\u000eJ=\u0010\u0016\u001a\u00020\u00042\u0006\u0010\u000f\u001a\u00020\u00022\u0012\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u00102\u0006\u0010\u0013\u001a\u00020\u00122\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u001f\u0010\u001d\u001a\u00020\u00042\u0006\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001a\u001a\u00020\u0018H\u0000¢\u0006\u0004\b\u001b\u0010\u001cJ\u0017\u0010\u001e\u001a\u00020\u00032\u0006\u0010\u000f\u001a\u00020\u0002H\u0017¢\u0006\u0004\b\u001e\u0010\u001fJ\u0017\u0010!\u001a\u00020\u00052\u0006\u0010 \u001a\u00020\u0004H\u0017¢\u0006\u0004\b!\u0010\"R\u0014\u0010\b\u001a\u00020\u00078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010#R(\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u00108\u0002@\u0002X\u0083.¢\u0006\f\n\u0004\b\u0011\u0010$\u0012\u0004\b%\u0010&R\u0016\u0010\u0013\u001a\u00020\u00128\u0002@\u0002X\u0082.¢\u0006\u0006\n\u0004\b\u0013\u0010'R\u001e\u0010\u0015\u001a\u0004\u0018\u00010\u00148\u0002@\u0002X\u0083\u000e¢\u0006\f\n\u0004\b\u0015\u0010(\u0012\u0004\b)\u0010&R\u0014\u0010+\u001a\u00020*8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b+\u0010,¨\u0006."}, d2 = {"Landroidx/credentials/playservices/controllers/identityauth/createpassword/CredentialProviderCreatePasswordController;", "Landroidx/credentials/playservices/controllers/CredentialProviderController;", "Lwf2;", "Lynb;", "Lc1e;", "Lbf2;", "Landroidx/credentials/exceptions/CreateCredentialException;", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "", "e", "fromGmsException", "(Ljava/lang/Throwable;)Landroidx/credentials/exceptions/CreateCredentialException;", "request", "Lah2;", "callback", "Ljava/util/concurrent/Executor;", "executor", "Landroid/os/CancellationSignal;", "cancellationSignal", "invokePlayServices", "(Lwf2;Lah2;Ljava/util/concurrent/Executor;Landroid/os/CancellationSignal;)V", "", "uniqueRequestCode", "resultCode", "handleResponse$credentials_play_services_auth", "(II)V", "handleResponse", "convertRequestToPlayServices", "(Lwf2;)Lynb;", "response", "convertResponseToCredentialManager", "(Lc1e;)Lbf2;", "Landroid/content/Context;", "Lah2;", "getCallback$annotations", "()V", "Ljava/util/concurrent/Executor;", "Landroid/os/CancellationSignal;", "getCancellationSignal$annotations", "androidx/credentials/playservices/controllers/identityauth/createpassword/CredentialProviderCreatePasswordController$resultReceiver$1", "resultReceiver", "Landroidx/credentials/playservices/controllers/identityauth/createpassword/CredentialProviderCreatePasswordController$resultReceiver$1;", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class CredentialProviderCreatePasswordController extends CredentialProviderController<wf2, ynb, c1e, bf2, CreateCredentialException> {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static final String TAG = "CreatePassword";
    private ah2 callback;
    private CancellationSignal cancellationSignal;
    private final Context context;
    private Executor executor;
    private final CredentialProviderCreatePasswordController$resultReceiver$1 resultReceiver;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Type inference failed for: r0v1, types: [androidx.credentials.playservices.controllers.identityauth.createpassword.CredentialProviderCreatePasswordController$resultReceiver$1] */
    public CredentialProviderCreatePasswordController(Context context) {
        super(context);
        context.getClass();
        this.context = context;
        final Handler handler = new Handler(Looper.getMainLooper());
        this.resultReceiver = new ResultReceiver(handler) { // from class: androidx.credentials.playservices.controllers.identityauth.createpassword.CredentialProviderCreatePasswordController$resultReceiver$1
            @Override // android.os.ResultReceiver
            public void onReceiveResult(int resultCode, Bundle resultData) {
                resultData.getClass();
                CredentialProviderCreatePasswordController credentialProviderCreatePasswordController = this.this$0;
                CredentialProviderCreatePasswordController$resultReceiver$1$onReceiveResult$1 credentialProviderCreatePasswordController$resultReceiver$1$onReceiveResult$1 = new CredentialProviderCreatePasswordController$resultReceiver$1$onReceiveResult$1(CredentialProviderBaseController.INSTANCE);
                Executor executor = this.this$0.executor;
                if (executor == null) {
                    g76.g0("executor");
                    throw null;
                }
                ah2 ah2Var = this.this$0.callback;
                if (ah2Var == null) {
                    g76.g0("callback");
                    throw null;
                }
                if (credentialProviderCreatePasswordController.maybeReportErrorFromResultReceiver(resultData, credentialProviderCreatePasswordController$resultReceiver$1$onReceiveResult$1, executor, ah2Var, this.this$0.cancellationSignal)) {
                    return;
                }
                this.this$0.handleResponse$credentials_play_services_auth(resultData.getInt(CredentialProviderBaseController.ACTIVITY_REQUEST_CODE_TAG), resultCode);
            }
        };
    }

    private final CreateCredentialException fromGmsException(Throwable e) {
        String str = ((e instanceof ApiException) && CredentialProviderBaseController.INSTANCE.getRetryables().contains(Integer.valueOf(((ApiException) e).a.a))) ? CredentialProviderBaseController.CREATE_INTERRUPTED : CredentialProviderBaseController.CREATE_UNKNOWN;
        return CredentialProviderBaseController.INSTANCE.createCredentialExceptionTypeToException$credentials_play_services_auth(str, "During save password, found password failure response from one tap " + e.getMessage());
    }

    public static final CredentialProviderCreatePasswordController getInstance(Context context) {
        return INSTANCE.getInstance(context);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$0(CancellationSignal cancellationSignal, m45 m45Var) {
        m45Var.getClass();
        CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, m45Var);
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$1(CredentialProviderCreatePasswordController credentialProviderCreatePasswordController, CreateCredentialException createCredentialException) {
        createCredentialException.getClass();
        Executor executor = credentialProviderCreatePasswordController.executor;
        if (executor != null) {
            executor.execute(new jh2(credentialProviderCreatePasswordController, createCredentialException, 1));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$1$0(CredentialProviderCreatePasswordController credentialProviderCreatePasswordController, CreateCredentialException createCredentialException) {
        ah2 ah2Var = credentialProviderCreatePasswordController.callback;
        if (ah2Var != null) {
            ah2Var.a(createCredentialException);
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$2(CredentialProviderCreatePasswordController credentialProviderCreatePasswordController, bf2 bf2Var) {
        Executor executor = credentialProviderCreatePasswordController.executor;
        if (executor != null) {
            executor.execute(new ho(credentialProviderCreatePasswordController, 27, bf2Var));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$2$0(CredentialProviderCreatePasswordController credentialProviderCreatePasswordController, bf2 bf2Var) {
        ah2 ah2Var = credentialProviderCreatePasswordController.callback;
        if (ah2Var != null) {
            ah2Var.onResult(bf2Var);
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    private static final c1e invokePlayServices$lambda$0(CancellationSignal cancellationSignal, CredentialProviderCreatePasswordController credentialProviderCreatePasswordController, znb znbVar) {
        boolean zCancellationReviewer$credentials_play_services_auth = CredentialProviderPlayServicesImpl.INSTANCE.cancellationReviewer$credentials_play_services_auth(cancellationSignal);
        c1e c1eVar = c1e.a;
        if (zCancellationReviewer$credentials_play_services_auth) {
            return c1eVar;
        }
        Intent intent = new Intent(credentialProviderCreatePasswordController.context, (Class<?>) HiddenActivity.class);
        credentialProviderCreatePasswordController.generateHiddenActivityIntent(credentialProviderCreatePasswordController.resultReceiver, intent, CredentialProviderBaseController.CREATE_PASSWORD_TAG);
        intent.putExtra(CredentialProviderBaseController.EXTRA_FLOW_PENDING_INTENT, znbVar.a);
        try {
            credentialProviderCreatePasswordController.context.startActivity(intent);
            return c1eVar;
        } catch (Exception unused) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new l8(29, credentialProviderCreatePasswordController));
            return c1eVar;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0$0(CredentialProviderCreatePasswordController credentialProviderCreatePasswordController) {
        Executor executor = credentialProviderCreatePasswordController.executor;
        if (executor != null) {
            executor.execute(new v0(15, credentialProviderCreatePasswordController));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$0$0$0(CredentialProviderCreatePasswordController credentialProviderCreatePasswordController) {
        ah2 ah2Var = credentialProviderCreatePasswordController.callback;
        if (ah2Var != null) {
            ah2Var.a(new CreateCredentialUnknownException(CredentialProviderController.ERROR_MESSAGE_START_ACTIVITY_FAILED));
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    private static final void invokePlayServices$lambda$2(CredentialProviderCreatePasswordController credentialProviderCreatePasswordController, CancellationSignal cancellationSignal, Exception exc) {
        exc.getClass();
        CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new gf2(credentialProviderCreatePasswordController, 9, credentialProviderCreatePasswordController.fromGmsException(exc)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$2$0(CredentialProviderCreatePasswordController credentialProviderCreatePasswordController, CreateCredentialException createCredentialException) {
        Executor executor = credentialProviderCreatePasswordController.executor;
        if (executor != null) {
            executor.execute(new jh2(credentialProviderCreatePasswordController, createCredentialException, 0));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$2$0$0(CredentialProviderCreatePasswordController credentialProviderCreatePasswordController, CreateCredentialException createCredentialException) {
        ah2 ah2Var = credentialProviderCreatePasswordController.callback;
        if (ah2Var != null) {
            ah2Var.a(createCredentialException);
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public /* synthetic */ ynb convertRequestToPlayServices(wf2 wf2Var) {
        if (wf2Var == null) {
            return convertRequestToPlayServices2((wf2) null);
        }
        rd6.m();
        return null;
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public bf2 convertResponseToCredentialManager(c1e response) {
        response.getClass();
        return new cf2();
    }

    public final void handleResponse$credentials_play_services_auth(int uniqueRequestCode, int resultCode) {
        CredentialProviderBaseController.Companion companion = CredentialProviderBaseController.INSTANCE;
        if (uniqueRequestCode == companion.getCONTROLLER_REQUEST_CODE$credentials_play_services_auth()) {
            if (CredentialProviderController.maybeReportErrorResultCodeCreate(resultCode, new v02(24, (byte) 0), new s0(17, this), this.cancellationSignal)) {
                return;
            }
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new gf2(this, 8, convertResponseToCredentialManager(c1e.a)));
            return;
        }
        Log.w(TAG, "Returned request code " + companion.getCONTROLLER_REQUEST_CODE$credentials_play_services_auth() + " which does not match what was given " + uniqueRequestCode);
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public /* synthetic */ void invokePlayServices(wf2 wf2Var, ah2 ah2Var, Executor executor, CancellationSignal cancellationSignal) {
        if (wf2Var == null) {
            invokePlayServices2((wf2) null, ah2Var, executor, cancellationSignal);
        } else {
            rd6.m();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0007R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Landroidx/credentials/playservices/controllers/identityauth/createpassword/CredentialProviderCreatePasswordController$Companion;", "", "<init>", "()V", "TAG", "", "getInstance", "Landroidx/credentials/playservices/controllers/identityauth/createpassword/CredentialProviderCreatePasswordController;", "context", "Landroid/content/Context;", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        public final CredentialProviderCreatePasswordController getInstance(Context context) {
            context.getClass();
            return new CredentialProviderCreatePasswordController(context);
        }

        private Companion() {
        }
    }

    /* JADX INFO: renamed from: invokePlayServices, reason: avoid collision after fix types in other method */
    public void invokePlayServices2(wf2 request, ah2 callback, Executor executor, CancellationSignal cancellationSignal) {
        throw null;
    }

    /* JADX INFO: renamed from: convertRequestToPlayServices, reason: avoid collision after fix types in other method */
    public ynb convertRequestToPlayServices2(wf2 request) {
        throw null;
    }

    private static /* synthetic */ void getCallback$annotations() {
    }

    private static /* synthetic */ void getCancellationSignal$annotations() {
    }
}
