package androidx.credentials.playservices.controllers.identitycredentials.createpublickeycredential;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Handler;
import android.os.Looper;
import android.os.ResultReceiver;
import android.util.Log;
import androidx.credentials.exceptions.CreateCredentialCancellationException;
import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.exceptions.CreateCredentialInterruptedException;
import androidx.credentials.exceptions.CreateCredentialNoCreateOptionException;
import androidx.credentials.exceptions.CreateCredentialUnknownException;
import androidx.credentials.exceptions.CreateCredentialUnsupportedException;
import androidx.credentials.playservices.controllers.CredentialProviderBaseController;
import androidx.credentials.playservices.controllers.CredentialProviderController;
import androidx.credentials.playservices.controllers.identityauth.HiddenActivity;
import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.UnsupportedApiCallException;
import defpackage.af2;
import defpackage.ag2;
import defpackage.ah2;
import defpackage.bf2;
import defpackage.bg2;
import defpackage.c1e;
import defpackage.cg2;
import defpackage.dg2;
import defpackage.eg2;
import defpackage.fg2;
import defpackage.g76;
import defpackage.gf2;
import defpackage.gg2;
import defpackage.gy2;
import defpackage.ho;
import defpackage.ht2;
import defpackage.kp7;
import defpackage.le0;
import defpackage.m45;
import defpackage.rd6;
import defpackage.s0;
import defpackage.v02;
import defpackage.w2g;
import defpackage.xe2;
import defpackage.ye2;
import defpackage.zf2;
import java.util.concurrent.Executor;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000]\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0003\n\u0002\b\u0010\n\u0002\b\u0005*\u0001.\b\u0001\u0018\u0000 12 \u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0001:\u00011B\u000f\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ=\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000b\u001a\u00020\u00022\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\f2\u0006\u0010\u000f\u001a\u00020\u000e2\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J)\u0010\u001c\u001a\u00020\u00122\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0017\u001a\u00020\u00152\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018H\u0000¢\u0006\u0004\b\u001a\u0010\u001bJ\u0015\u0010\u001f\u001a\u00020\u00062\u0006\u0010\u001e\u001a\u00020\u001d¢\u0006\u0004\b\u001f\u0010 J\u0017\u0010!\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b!\u0010\"J\u0017\u0010$\u001a\u00020\u00052\u0006\u0010#\u001a\u00020\u0004H\u0014¢\u0006\u0004\b$\u0010%R\u0014\u0010\b\u001a\u00020\u00078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010&R(\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\f8\u0002@\u0002X\u0083.¢\u0006\f\n\u0004\b\r\u0010'\u0012\u0004\b(\u0010)R\u001c\u0010\u000f\u001a\u00020\u000e8\u0002@\u0002X\u0083.¢\u0006\f\n\u0004\b\u000f\u0010*\u0012\u0004\b+\u0010)R\u001e\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0002@\u0002X\u0083\u000e¢\u0006\f\n\u0004\b\u0011\u0010,\u0012\u0004\b-\u0010)R\u0014\u0010/\u001a\u00020.8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b/\u00100¨\u00062"}, d2 = {"Landroidx/credentials/playservices/controllers/identitycredentials/createpublickeycredential/CreatePublicKeyCredentialController;", "Landroidx/credentials/playservices/controllers/CredentialProviderController;", "Lfg2;", "Lye2;", "Laf2;", "Lbf2;", "Landroidx/credentials/exceptions/CreateCredentialException;", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "request", "Lah2;", "callback", "Ljava/util/concurrent/Executor;", "executor", "Landroid/os/CancellationSignal;", "cancellationSignal", "Lc1e;", "invokePlayServices", "(Lfg2;Lah2;Ljava/util/concurrent/Executor;Landroid/os/CancellationSignal;)V", "", "uniqueRequestCode", "resultCode", "Landroid/content/Intent;", "data", "handleResponse$credentials_play_services_auth", "(IILandroid/content/Intent;)V", "handleResponse", "", "e", "fromGmsException", "(Ljava/lang/Throwable;)Landroidx/credentials/exceptions/CreateCredentialException;", "convertRequestToPlayServices", "(Lfg2;)Lye2;", "response", "convertResponseToCredentialManager", "(Laf2;)Lbf2;", "Landroid/content/Context;", "Lah2;", "getCallback$annotations", "()V", "Ljava/util/concurrent/Executor;", "getExecutor$annotations", "Landroid/os/CancellationSignal;", "getCancellationSignal$annotations", "androidx/credentials/playservices/controllers/identitycredentials/createpublickeycredential/CreatePublicKeyCredentialController$resultReceiver$1", "resultReceiver", "Landroidx/credentials/playservices/controllers/identitycredentials/createpublickeycredential/CreatePublicKeyCredentialController$resultReceiver$1;", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class CreatePublicKeyCredentialController extends CredentialProviderController<fg2, ye2, af2, bf2, CreateCredentialException> {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static final String TAG = "CreatePublicKey";
    private ah2 callback;
    private CancellationSignal cancellationSignal;
    private final Context context;
    private Executor executor;
    private final CreatePublicKeyCredentialController$resultReceiver$1 resultReceiver;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Type inference failed for: r0v1, types: [androidx.credentials.playservices.controllers.identitycredentials.createpublickeycredential.CreatePublicKeyCredentialController$resultReceiver$1] */
    public CreatePublicKeyCredentialController(Context context) {
        super(context);
        context.getClass();
        this.context = context;
        final Handler handler = new Handler(Looper.getMainLooper());
        this.resultReceiver = new ResultReceiver(handler) { // from class: androidx.credentials.playservices.controllers.identitycredentials.createpublickeycredential.CreatePublicKeyCredentialController$resultReceiver$1
            @Override // android.os.ResultReceiver
            public void onReceiveResult(int resultCode, Bundle resultData) {
                resultData.getClass();
                CreatePublicKeyCredentialController createPublicKeyCredentialController = this.this$0;
                CreatePublicKeyCredentialController$resultReceiver$1$onReceiveResult$1 createPublicKeyCredentialController$resultReceiver$1$onReceiveResult$1 = new CreatePublicKeyCredentialController$resultReceiver$1$onReceiveResult$1(CredentialProviderBaseController.INSTANCE);
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
                if (createPublicKeyCredentialController.maybeReportErrorFromResultReceiver(resultData, createPublicKeyCredentialController$resultReceiver$1$onReceiveResult$1, executor, ah2Var, this.this$0.cancellationSignal)) {
                    return;
                }
                this.this$0.handleResponse$credentials_play_services_auth(resultData.getInt(CredentialProviderBaseController.ACTIVITY_REQUEST_CODE_TAG), resultCode, (Intent) ht2.r0(resultData, CredentialProviderBaseController.RESULT_DATA_TAG, Intent.class));
            }
        };
    }

    private static /* synthetic */ void getCallback$annotations() {
    }

    private static /* synthetic */ void getCancellationSignal$annotations() {
    }

    private static /* synthetic */ void getExecutor$annotations() {
    }

    public static final CreatePublicKeyCredentialController getInstance(Context context) {
        return INSTANCE.getInstance(context);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$0(CancellationSignal cancellationSignal, m45 m45Var) {
        m45Var.getClass();
        CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, m45Var);
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$1(CreatePublicKeyCredentialController createPublicKeyCredentialController, CreateCredentialException createCredentialException) {
        createCredentialException.getClass();
        Executor executor = createPublicKeyCredentialController.executor;
        if (executor != null) {
            executor.execute(new cg2(createPublicKeyCredentialController, createCredentialException, 0));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$1$0(CreatePublicKeyCredentialController createPublicKeyCredentialController, CreateCredentialException createCredentialException) {
        ah2 ah2Var = createPublicKeyCredentialController.callback;
        if (ah2Var != null) {
            ah2Var.a(createCredentialException);
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$2(CreatePublicKeyCredentialController createPublicKeyCredentialController) {
        Executor executor = createPublicKeyCredentialController.executor;
        if (executor != null) {
            executor.execute(new ag2(createPublicKeyCredentialController, 0));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$2$0(CreatePublicKeyCredentialController createPublicKeyCredentialController) {
        ah2 ah2Var = createPublicKeyCredentialController.callback;
        if (ah2Var != null) {
            ah2Var.a(new CreateCredentialUnknownException("No provider data returned."));
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$3(CreatePublicKeyCredentialController createPublicKeyCredentialController, bf2 bf2Var) {
        Executor executor = createPublicKeyCredentialController.executor;
        if (executor != null) {
            executor.execute(new ho(createPublicKeyCredentialController, 22, bf2Var));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$3$0(CreatePublicKeyCredentialController createPublicKeyCredentialController, bf2 bf2Var) {
        ah2 ah2Var = createPublicKeyCredentialController.callback;
        if (ah2Var != null) {
            ah2Var.onResult(bf2Var);
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$4(CreatePublicKeyCredentialController createPublicKeyCredentialController, CreateCredentialException createCredentialException) {
        Executor executor = createPublicKeyCredentialController.executor;
        if (executor != null) {
            executor.execute(new cg2(createPublicKeyCredentialController, createCredentialException, 1));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    private static final c1e invokePlayServices$lambda$0(CancellationSignal cancellationSignal, CreatePublicKeyCredentialController createPublicKeyCredentialController, Executor executor, ah2 ah2Var, xe2 xe2Var) {
        PendingIntent pendingIntent = xe2Var.a;
        af2 af2Var = xe2Var.b;
        c1e c1eVar = c1e.a;
        if (pendingIntent == null && af2Var == null) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new dg2(executor, ah2Var, 0));
            return c1eVar;
        }
        int i = 1;
        if (pendingIntent != null) {
            Intent intent = new Intent(createPublicKeyCredentialController.context, (Class<?>) HiddenActivity.class);
            createPublicKeyCredentialController.generateHiddenActivityIntent(createPublicKeyCredentialController.resultReceiver, intent, CredentialProviderBaseController.CREATE_PUBLIC_KEY_CREDENTIAL_TAG);
            intent.putExtra(CredentialProviderBaseController.EXTRA_FLOW_PENDING_INTENT, pendingIntent);
            try {
                createPublicKeyCredentialController.context.startActivity(intent);
            } catch (Exception unused) {
                CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new bg2(createPublicKeyCredentialController, i));
            }
        }
        if (af2Var != null) {
            bf2 bf2VarConvertResponseToCredentialManager = createPublicKeyCredentialController.convertResponseToCredentialManager(af2Var);
            if (bf2VarConvertResponseToCredentialManager instanceof gg2) {
                CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new le0(executor, ah2Var, (gg2) bf2VarConvertResponseToCredentialManager, 13));
                return c1eVar;
            }
        }
        if (pendingIntent == null) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new dg2(executor, ah2Var, i));
        }
        return c1eVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0$0(Executor executor, ah2 ah2Var) {
        executor.execute(new zf2(ah2Var, 0));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$0$0$0(ah2 ah2Var) {
        ah2Var.a(new CreateCredentialUnknownException(null));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0$1(CreatePublicKeyCredentialController createPublicKeyCredentialController) {
        Executor executor = createPublicKeyCredentialController.executor;
        if (executor != null) {
            executor.execute(new ag2(createPublicKeyCredentialController, 1));
            return c1e.a;
        }
        g76.g0("executor");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$0$1$0(CreatePublicKeyCredentialController createPublicKeyCredentialController) {
        ah2 ah2Var = createPublicKeyCredentialController.callback;
        if (ah2Var != null) {
            ah2Var.a(new CreateCredentialUnknownException(CredentialProviderController.ERROR_MESSAGE_START_ACTIVITY_FAILED));
        } else {
            g76.g0("callback");
            throw null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0$2(Executor executor, ah2 ah2Var, bf2 bf2Var) {
        executor.execute(new eg2(ah2Var, bf2Var, 0));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0$3(Executor executor, ah2 ah2Var) {
        executor.execute(new zf2(ah2Var, 1));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$0$3$0(ah2 ah2Var) {
        ah2Var.a(new CreateCredentialUnknownException(null));
    }

    private static final void invokePlayServices$lambda$2(fg2 fg2Var, CreatePublicKeyCredentialController createPublicKeyCredentialController, ah2 ah2Var, Executor executor, CancellationSignal cancellationSignal, Exception exc) {
        exc.getClass();
        throw null;
    }

    private static final c1e invokePlayServices$lambda$2$0(CreatePublicKeyCredentialController createPublicKeyCredentialController, Exception exc, Executor executor, ah2 ah2Var) {
        exc.getClass();
        executor.execute(new ho(ah2Var, 21, createPublicKeyCredentialController.fromGmsException(exc)));
        return c1e.a;
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public /* synthetic */ ye2 convertRequestToPlayServices(fg2 fg2Var) {
        if (fg2Var == null) {
            return convertRequestToPlayServices2((fg2) null);
        }
        rd6.m();
        return null;
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public bf2 convertResponseToCredentialManager(af2 response) {
        response.getClass();
        return w2g.p(response.a, response.b);
    }

    public final CreateCredentialException fromGmsException(Throwable e) {
        e.getClass();
        if (!(e instanceof ApiException)) {
            if (e instanceof UnsupportedApiCallException) {
                return new CreateCredentialUnsupportedException("API is unsupported");
            }
            return new CreateCredentialUnknownException("Conditional create failed, failure: " + e);
        }
        int i = ((ApiException) e).a.a;
        if (i == 16) {
            return new CreateCredentialCancellationException(e.getMessage());
        }
        if (i == 17) {
            return new CreateCredentialUnsupportedException("API is not supported: " + e.getMessage());
        }
        if (i == 8) {
            return new CreateCredentialNoCreateOptionException(e.getMessage());
        }
        if (CredentialProviderBaseController.INSTANCE.getRetryables().contains(Integer.valueOf(i))) {
            return new CreateCredentialInterruptedException(e.getMessage());
        }
        return new CreateCredentialUnknownException("Conditional create failed, failure: " + e.getMessage());
    }

    public final void handleResponse$credentials_play_services_auth(int uniqueRequestCode, int resultCode, Intent data) {
        CredentialProviderBaseController.Companion companion = CredentialProviderBaseController.INSTANCE;
        if (uniqueRequestCode != companion.getCONTROLLER_REQUEST_CODE$credentials_play_services_auth()) {
            Log.w(TAG, "Returned request code " + companion.getCONTROLLER_REQUEST_CODE$credentials_play_services_auth() + " does not match what was given " + uniqueRequestCode);
            return;
        }
        byte b = 0;
        if (CredentialProviderController.maybeReportErrorResultCodeCreate(resultCode, new v02(22, b), new s0(15, this), this.cancellationSignal)) {
            return;
        }
        if (data == null) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new bg2(this, b));
            return;
        }
        bf2 bf2VarY = kp7.y(data, "androidx.credentials.TYPE_PUBLIC_KEY_CREDENTIAL");
        if (bf2VarY != null) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new gf2(this, 3, bf2VarY));
        } else {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new gf2(this, 4, kp7.x(data)));
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

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$4$0(CreatePublicKeyCredentialController createPublicKeyCredentialController, CreateCredentialException createCredentialException) {
        ah2 ah2Var = createPublicKeyCredentialController.callback;
        if (ah2Var == null) {
            g76.g0("callback");
            throw null;
        }
        if (createCredentialException == null) {
            createCredentialException = new CreateCredentialUnknownException(ZVsviyDAr.VHYTEsJ);
        }
        ah2Var.a(createCredentialException);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    /* JADX INFO: loaded from: classes.dex */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007R\u000e\u0010\b\u001a\u00020\tX\u0082T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Landroidx/credentials/playservices/controllers/identitycredentials/createpublickeycredential/CreatePublicKeyCredentialController$Companion;", "", "<init>", "()V", "getInstance", "Landroidx/credentials/playservices/controllers/identitycredentials/createpublickeycredential/CreatePublicKeyCredentialController;", "context", "Landroid/content/Context;", "TAG", "", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        public final CreatePublicKeyCredentialController getInstance(Context context) {
            context.getClass();
            return new CreatePublicKeyCredentialController(context);
        }

        private Companion() {
        }
    }

    /* JADX INFO: renamed from: invokePlayServices, reason: avoid collision after fix types in other method */
    public void invokePlayServices2(fg2 request, ah2 callback, Executor executor, CancellationSignal cancellationSignal) {
        throw null;
    }

    /* JADX INFO: renamed from: convertRequestToPlayServices, reason: avoid collision after fix types in other method */
    public ye2 convertRequestToPlayServices2(fg2 request) {
        throw null;
    }
}
