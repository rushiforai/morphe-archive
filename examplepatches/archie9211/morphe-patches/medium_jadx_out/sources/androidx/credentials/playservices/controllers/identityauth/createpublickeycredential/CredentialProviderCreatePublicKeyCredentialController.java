package androidx.credentials.playservices.controllers.identityauth.createpublickeycredential;

import android.app.PendingIntent;
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
import androidx.credentials.exceptions.publickeycredential.CreatePublicKeyCredentialDomException;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.CredentialProviderBaseController;
import androidx.credentials.playservices.controllers.CredentialProviderController;
import androidx.credentials.playservices.controllers.identityauth.HiddenActivity;
import com.google.android.gms.common.api.ApiException;
import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import defpackage.a6g;
import defpackage.ae0;
import defpackage.ah2;
import defpackage.bf2;
import defpackage.c1e;
import defpackage.fe0;
import defpackage.fg2;
import defpackage.g76;
import defpackage.ge0;
import defpackage.gf2;
import defpackage.gg2;
import defpackage.gy2;
import defpackage.he0;
import defpackage.ho;
import defpackage.k;
import defpackage.kh2;
import defpackage.lh2;
import defpackage.m45;
import defpackage.mh2;
import defpackage.mo7;
import defpackage.nh2;
import defpackage.oh2;
import defpackage.op8;
import defpackage.ph2;
import defpackage.rd6;
import defpackage.s0;
import defpackage.v02;
import defpackage.x9a;
import defpackage.z9a;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000k\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u0003\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\b\u0005*\u00013\b\u0000\u0018\u0000 62 \u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0001:\u00016B\u000f\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ=\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000b\u001a\u00020\u00022\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\f2\u0006\u0010\u000f\u001a\u00020\u000e2\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J)\u0010\u001c\u001a\u00020\u00122\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0017\u001a\u00020\u00152\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018H\u0000¢\u0006\u0004\b\u001a\u0010\u001bJ\u0017\u0010\u001d\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0002H\u0017¢\u0006\u0004\b\u001d\u0010\u001eJ\u0017\u0010 \u001a\u00020\u00052\u0006\u0010\u001f\u001a\u00020\u0004H\u0017¢\u0006\u0004\b \u0010!J\u0017\u0010$\u001a\u00020\u00062\u0006\u0010#\u001a\u00020\"H\u0002¢\u0006\u0004\b$\u0010%J\u0017\u0010)\u001a\u00020(2\u0006\u0010'\u001a\u00020&H\u0002¢\u0006\u0004\b)\u0010*R\u0014\u0010\b\u001a\u00020\u00078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010+R(\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\f8\u0002@\u0002X\u0083.¢\u0006\f\n\u0004\b\r\u0010,\u0012\u0004\b-\u0010.R\u001c\u0010\u000f\u001a\u00020\u000e8\u0002@\u0002X\u0083.¢\u0006\f\n\u0004\b\u000f\u0010/\u0012\u0004\b0\u0010.R\u001e\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0002@\u0002X\u0083\u000e¢\u0006\f\n\u0004\b\u0011\u00101\u0012\u0004\b2\u0010.R\u0014\u00104\u001a\u0002038\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b4\u00105¨\u00067"}, d2 = {"Landroidx/credentials/playservices/controllers/identityauth/createpublickeycredential/CredentialProviderCreatePublicKeyCredentialController;", "Landroidx/credentials/playservices/controllers/CredentialProviderController;", "Lfg2;", "Lz9a;", "Lx9a;", "Lbf2;", "Landroidx/credentials/exceptions/CreateCredentialException;", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "request", "Lah2;", "callback", "Ljava/util/concurrent/Executor;", "executor", "Landroid/os/CancellationSignal;", "cancellationSignal", "Lc1e;", "invokePlayServices", "(Lfg2;Lah2;Ljava/util/concurrent/Executor;Landroid/os/CancellationSignal;)V", "", "uniqueRequestCode", "resultCode", "Landroid/content/Intent;", "data", "handleResponse$credentials_play_services_auth", "(IILandroid/content/Intent;)V", "handleResponse", "convertRequestToPlayServices", "(Lfg2;)Lz9a;", "response", "convertResponseToCredentialManager", "(Lx9a;)Lbf2;", "", "e", "fromIntentRequestException", "(Ljava/lang/Throwable;)Landroidx/credentials/exceptions/CreateCredentialException;", "Lorg/json/JSONException;", "exception", "Landroidx/credentials/exceptions/publickeycredential/CreatePublicKeyCredentialDomException;", "JSONExceptionToPKCError", "(Lorg/json/JSONException;)Landroidx/credentials/exceptions/publickeycredential/CreatePublicKeyCredentialDomException;", "Landroid/content/Context;", "Lah2;", "getCallback$annotations", "()V", "Ljava/util/concurrent/Executor;", "getExecutor$annotations", "Landroid/os/CancellationSignal;", "getCancellationSignal$annotations", "androidx/credentials/playservices/controllers/identityauth/createpublickeycredential/CredentialProviderCreatePublicKeyCredentialController$resultReceiver$1", "resultReceiver", "Landroidx/credentials/playservices/controllers/identityauth/createpublickeycredential/CredentialProviderCreatePublicKeyCredentialController$resultReceiver$1;", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class CredentialProviderCreatePublicKeyCredentialController extends CredentialProviderController<fg2, z9a, x9a, bf2, CreateCredentialException> {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static final String TAG = "CreatePublicKey";
    private ah2 callback;
    private CancellationSignal cancellationSignal;
    private final Context context;
    private Executor executor;
    private final CredentialProviderCreatePublicKeyCredentialController$resultReceiver$1 resultReceiver;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Type inference failed for: r0v1, types: [androidx.credentials.playservices.controllers.identityauth.createpublickeycredential.CredentialProviderCreatePublicKeyCredentialController$resultReceiver$1] */
    public CredentialProviderCreatePublicKeyCredentialController(Context context) {
        super(context);
        context.getClass();
        this.context = context;
        final Handler handler = new Handler(Looper.getMainLooper());
        this.resultReceiver = new ResultReceiver(handler) { // from class: androidx.credentials.playservices.controllers.identityauth.createpublickeycredential.CredentialProviderCreatePublicKeyCredentialController$resultReceiver$1
            @Override // android.os.ResultReceiver
            public void onReceiveResult(int resultCode, Bundle resultData) {
                resultData.getClass();
                CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController = this.this$0;
                CredentialProviderCreatePublicKeyCredentialController$resultReceiver$1$onReceiveResult$1 credentialProviderCreatePublicKeyCredentialController$resultReceiver$1$onReceiveResult$1 = new CredentialProviderCreatePublicKeyCredentialController$resultReceiver$1$onReceiveResult$1(CredentialProviderBaseController.INSTANCE);
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
                if (credentialProviderCreatePublicKeyCredentialController.maybeReportErrorFromResultReceiver(resultData, credentialProviderCreatePublicKeyCredentialController$resultReceiver$1$onReceiveResult$1, executor, ah2Var, this.this$0.cancellationSignal)) {
                    return;
                }
                this.this$0.handleResponse$credentials_play_services_auth(resultData.getInt(CredentialProviderBaseController.ACTIVITY_REQUEST_CODE_TAG), resultCode, (Intent) resultData.getParcelable(CredentialProviderBaseController.RESULT_DATA_TAG));
            }
        };
    }

    private final CreatePublicKeyCredentialDomException JSONExceptionToPKCError(JSONException exception) {
        String message = exception.getMessage();
        return (message == null || message.length() <= 0) ? new CreatePublicKeyCredentialDomException(new k(4), "Unknown error") : new CreatePublicKeyCredentialDomException(new k(4), message);
    }

    private final CreateCredentialException fromIntentRequestException(Throwable e) {
        String str = ((e instanceof ApiException) && CredentialProviderBaseController.INSTANCE.getRetryables().contains(Integer.valueOf(((ApiException) e).a.a))) ? CredentialProviderBaseController.CREATE_INTERRUPTED : CredentialProviderBaseController.CREATE_UNKNOWN;
        return CredentialProviderBaseController.INSTANCE.createCredentialExceptionTypeToException$credentials_play_services_auth(str, "During create public key credential, fido registration failure: " + e.getMessage());
    }

    private static /* synthetic */ void getCallback$annotations() {
    }

    private static /* synthetic */ void getCancellationSignal$annotations() {
    }

    private static /* synthetic */ void getExecutor$annotations() {
    }

    public static final CredentialProviderCreatePublicKeyCredentialController getInstance(Context context) {
        return INSTANCE.getInstance(context);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$0(CancellationSignal cancellationSignal, m45 m45Var) {
        m45Var.getClass();
        CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, m45Var);
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$1(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, CreateCredentialException createCredentialException) {
        createCredentialException.getClass();
        Executor executor = credentialProviderCreatePublicKeyCredentialController.executor;
        if (executor != null) {
            executor.execute(new lh2(credentialProviderCreatePublicKeyCredentialController, createCredentialException, 2));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$1$0(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, CreateCredentialException createCredentialException) {
        ah2 ah2Var = credentialProviderCreatePublicKeyCredentialController.callback;
        if (ah2Var != null) {
            ah2Var.a(createCredentialException);
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$2(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController) {
        ah2 ah2Var = credentialProviderCreatePublicKeyCredentialController.callback;
        if (ah2Var != null) {
            ah2Var.a(new CreatePublicKeyCredentialDomException(new k(26), "Upon handling create public key credential response, fido module giving null bytes indicating internal error"));
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$3(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, CreateCredentialException createCredentialException) {
        Executor executor = credentialProviderCreatePublicKeyCredentialController.executor;
        if (executor != null) {
            executor.execute(new lh2(credentialProviderCreatePublicKeyCredentialController, createCredentialException, 1));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$3$0(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, CreateCredentialException createCredentialException) {
        ah2 ah2Var = credentialProviderCreatePublicKeyCredentialController.callback;
        if (ah2Var != null) {
            ah2Var.a(createCredentialException);
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$4(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, bf2 bf2Var) {
        Executor executor = credentialProviderCreatePublicKeyCredentialController.executor;
        if (executor != null) {
            executor.execute(new ho(credentialProviderCreatePublicKeyCredentialController, 28, bf2Var));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$4$0(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, bf2 bf2Var) {
        ah2 ah2Var = credentialProviderCreatePublicKeyCredentialController.callback;
        if (ah2Var != null) {
            ah2Var.onResult(bf2Var);
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$5(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, JSONException jSONException) {
        Executor executor = credentialProviderCreatePublicKeyCredentialController.executor;
        if (executor != null) {
            executor.execute(new kh2(credentialProviderCreatePublicKeyCredentialController, jSONException, 0));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$5$0(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, JSONException jSONException) {
        ah2 ah2Var = credentialProviderCreatePublicKeyCredentialController.callback;
        if (ah2Var != null) {
            ah2Var.a(new CreatePublicKeyCredentialDomException(new k(4), jSONException.getMessage()));
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$6(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, Throwable th) {
        Executor executor = credentialProviderCreatePublicKeyCredentialController.executor;
        if (executor != null) {
            executor.execute(new ph2(credentialProviderCreatePublicKeyCredentialController, th, 1));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$6$0(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, Throwable th) {
        ah2 ah2Var = credentialProviderCreatePublicKeyCredentialController.callback;
        if (ah2Var != null) {
            ah2Var.a(new CreatePublicKeyCredentialDomException(new k(26), th.getMessage()));
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    private static final c1e invokePlayServices$lambda$0(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, JSONException jSONException) {
        Executor executor = credentialProviderCreatePublicKeyCredentialController.executor;
        if (executor != null) {
            executor.execute(new kh2(credentialProviderCreatePublicKeyCredentialController, jSONException, 1));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$0$0(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, JSONException jSONException) {
        ah2 ah2Var = credentialProviderCreatePublicKeyCredentialController.callback;
        if (ah2Var != null) {
            ah2Var.a(credentialProviderCreatePublicKeyCredentialController.JSONExceptionToPKCError(jSONException));
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    private static final c1e invokePlayServices$lambda$1(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, Throwable th) {
        Executor executor = credentialProviderCreatePublicKeyCredentialController.executor;
        if (executor != null) {
            executor.execute(new ph2(credentialProviderCreatePublicKeyCredentialController, th, 0));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$1$0(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, Throwable th) {
        ah2 ah2Var = credentialProviderCreatePublicKeyCredentialController.callback;
        if (ah2Var != null) {
            ah2Var.a(new CreateCredentialUnknownException(th.getMessage()));
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    private static final c1e invokePlayServices$lambda$2(CancellationSignal cancellationSignal, CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, PendingIntent pendingIntent) {
        pendingIntent.getClass();
        boolean zCancellationReviewer$credentials_play_services_auth = CredentialProviderPlayServicesImpl.INSTANCE.cancellationReviewer$credentials_play_services_auth(cancellationSignal);
        c1e c1eVar = c1e.a;
        if (zCancellationReviewer$credentials_play_services_auth) {
            return c1eVar;
        }
        Intent intent = new Intent(credentialProviderCreatePublicKeyCredentialController.context, (Class<?>) HiddenActivity.class);
        credentialProviderCreatePublicKeyCredentialController.generateHiddenActivityIntent(credentialProviderCreatePublicKeyCredentialController.resultReceiver, intent, CredentialProviderBaseController.CREATE_PUBLIC_KEY_CREDENTIAL_TAG);
        intent.putExtra(CredentialProviderBaseController.EXTRA_FLOW_PENDING_INTENT, pendingIntent);
        try {
            credentialProviderCreatePublicKeyCredentialController.context.startActivity(intent);
            return c1eVar;
        } catch (Exception unused) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new nh2(0, credentialProviderCreatePublicKeyCredentialController));
            return c1eVar;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$2$0(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController) {
        Executor executor = credentialProviderCreatePublicKeyCredentialController.executor;
        if (executor != null) {
            executor.execute(new mh2(credentialProviderCreatePublicKeyCredentialController, 0));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$2$0$0(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController) {
        ah2 ah2Var = credentialProviderCreatePublicKeyCredentialController.callback;
        if (ah2Var != null) {
            ah2Var.a(new CreateCredentialUnknownException(CredentialProviderController.ERROR_MESSAGE_START_ACTIVITY_FAILED));
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    private static final void invokePlayServices$lambda$4(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, CancellationSignal cancellationSignal, Exception exc) {
        exc.getClass();
        CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new oh2(credentialProviderCreatePublicKeyCredentialController, credentialProviderCreatePublicKeyCredentialController.fromIntentRequestException(exc), 0));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$4$0(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, CreateCredentialException createCredentialException) {
        Executor executor = credentialProviderCreatePublicKeyCredentialController.executor;
        if (executor != null) {
            executor.execute(new lh2(credentialProviderCreatePublicKeyCredentialController, createCredentialException, 0));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$4$0$0(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, CreateCredentialException createCredentialException) {
        ah2 ah2Var = credentialProviderCreatePublicKeyCredentialController.callback;
        if (ah2Var != null) {
            ah2Var.a(createCredentialException);
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public /* synthetic */ z9a convertRequestToPlayServices(fg2 fg2Var) {
        if (fg2Var == null) {
            return convertRequestToPlayServices2((fg2) null);
        }
        rd6.m();
        return null;
    }

    public final void handleResponse$credentials_play_services_auth(int uniqueRequestCode, int resultCode, Intent data) {
        CredentialProviderBaseController.Companion companion = CredentialProviderBaseController.INSTANCE;
        if (uniqueRequestCode != companion.getCONTROLLER_REQUEST_CODE$credentials_play_services_auth()) {
            Log.w(TAG, "Returned request code " + companion.getCONTROLLER_REQUEST_CODE$credentials_play_services_auth() + " does not match what was given " + uniqueRequestCode);
            return;
        }
        if (CredentialProviderController.maybeReportErrorResultCodeCreate(resultCode, new v02(25, (byte) 0), new s0(18, this), this.cancellationSignal)) {
            return;
        }
        byte[] byteArrayExtra = data != null ? data.getByteArrayExtra("FIDO2_CREDENTIAL_EXTRA") : null;
        int i = 1;
        if (byteArrayExtra == null) {
            if (CredentialProviderPlayServicesImpl.INSTANCE.cancellationReviewer$credentials_play_services_auth(this.cancellationSignal)) {
                return;
            }
            Executor executor = this.executor;
            if (executor != null) {
                executor.execute(new mh2(this, i));
                return;
            } else {
                g76.g0("executor");
                throw null;
            }
        }
        x9a x9aVar = (x9a) mo7.H(byteArrayExtra, x9a.CREATOR);
        x9aVar.getClass();
        CreateCredentialException createCredentialExceptionPublicKeyCredentialResponseContainsError = PublicKeyCredentialControllerUtility.INSTANCE.publicKeyCredentialResponseContainsError(x9aVar);
        if (createCredentialExceptionPublicKeyCredentialResponseContainsError != null) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new oh2(this, createCredentialExceptionPublicKeyCredentialResponseContainsError, i));
            return;
        }
        try {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new gf2(this, 12, convertResponseToCredentialManager(x9aVar)));
        } catch (JSONException e) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new gf2(this, 10, e));
        } catch (Throwable th) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new gf2(this, 11, th));
        }
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public /* synthetic */ void invokePlayServices(fg2 fg2Var, ah2 ah2Var, Executor executor, CancellationSignal cancellationSignal) {
        if (fg2Var == null) {
            invokePlayServices2((fg2) null, ah2Var, executor, cancellationSignal);
        } else {
            rd6.m();
        }
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public bf2 convertResponseToCredentialManager(x9a response) throws CreateCredentialUnknownException {
        JSONObject jSONObjectE;
        response.getClass();
        try {
            String str = pUlNWdybf.JHPuvTdTivnn;
            he0 he0Var = response.f;
            a6g a6gVar = response.c;
            try {
                JSONObject jSONObject = new JSONObject();
                if (a6gVar != null && a6gVar.t().length > 0) {
                    jSONObject.put("rawId", op8.U(a6gVar.t()));
                }
                String str2 = response.h;
                if (str2 != null) {
                    jSONObject.put("authenticatorAttachment", str2);
                }
                String str3 = response.b;
                if (str3 != null && he0Var == null) {
                    jSONObject.put("type", str3);
                }
                String str4 = response.a;
                if (str4 != null) {
                    jSONObject.put("id", str4);
                }
                String str5 = "response";
                fe0 fe0Var = response.e;
                boolean z = true;
                if (fe0Var != null) {
                    jSONObjectE = fe0Var.e();
                } else {
                    ge0 ge0Var = response.d;
                    if (ge0Var != null) {
                        jSONObjectE = ge0Var.e();
                    } else {
                        z = false;
                        if (he0Var != null) {
                            try {
                                JSONObject jSONObject2 = new JSONObject();
                                jSONObject2.put("code", he0Var.a.getCode());
                                String str6 = he0Var.b;
                                if (str6 != null) {
                                    jSONObject2.put("message", str6);
                                }
                                str5 = "error";
                                jSONObjectE = jSONObject2;
                            } catch (JSONException e) {
                                throw new RuntimeException("Error encoding AuthenticatorErrorResponse to JSON object", e);
                            }
                        } else {
                            jSONObjectE = null;
                        }
                    }
                }
                if (jSONObjectE != null) {
                    jSONObject.put(str5, jSONObjectE);
                }
                ae0 ae0Var = response.g;
                if (ae0Var != null) {
                    jSONObject.put(str, ae0Var.d());
                } else if (z) {
                    jSONObject.put(str, new JSONObject());
                }
                String string = jSONObject.toString();
                string.getClass();
                Bundle bundle = new Bundle();
                bundle.putString("androidx.credentials.BUNDLE_KEY_REGISTRATION_RESPONSE_JSON", string);
                return new gg2(string, bundle);
            } catch (JSONException e2) {
                throw new RuntimeException("Error encoding PublicKeyCredential to JSON object", e2);
            }
        } catch (Throwable th) {
            throw new CreateCredentialUnknownException("The PublicKeyCredential response json had an unexpected exception when parsing: " + th.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    /* JADX INFO: loaded from: classes.dex */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0007R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Landroidx/credentials/playservices/controllers/identityauth/createpublickeycredential/CredentialProviderCreatePublicKeyCredentialController$Companion;", "", "<init>", "()V", "TAG", "", "getInstance", "Landroidx/credentials/playservices/controllers/identityauth/createpublickeycredential/CredentialProviderCreatePublicKeyCredentialController;", "context", "Landroid/content/Context;", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        public final CredentialProviderCreatePublicKeyCredentialController getInstance(Context context) {
            context.getClass();
            return new CredentialProviderCreatePublicKeyCredentialController(context);
        }

        private Companion() {
        }
    }

    /* JADX INFO: renamed from: invokePlayServices, reason: avoid collision after fix types in other method */
    public void invokePlayServices2(fg2 request, ah2 callback, Executor executor, CancellationSignal cancellationSignal) {
        throw null;
    }

    /* JADX INFO: renamed from: convertRequestToPlayServices, reason: avoid collision after fix types in other method */
    public z9a convertRequestToPlayServices2(fg2 request) {
        throw null;
    }
}
