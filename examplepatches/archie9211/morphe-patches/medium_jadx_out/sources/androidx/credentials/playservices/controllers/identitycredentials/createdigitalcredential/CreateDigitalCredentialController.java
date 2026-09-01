package androidx.credentials.playservices.controllers.identitycredentials.createdigitalcredential;

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
import androidx.credentials.playservices.controllers.identitycredentials.IdentityCredentialApiHiddenActivity;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import defpackage.af2;
import defpackage.ah2;
import defpackage.bf2;
import defpackage.c1e;
import defpackage.df2;
import defpackage.ef2;
import defpackage.ff2;
import defpackage.g76;
import defpackage.gf2;
import defpackage.gy2;
import defpackage.hf2;
import defpackage.ho;
import defpackage.kp7;
import defpackage.l8;
import defpackage.m45;
import defpackage.n;
import defpackage.rd6;
import defpackage.s0;
import defpackage.v0;
import defpackage.v02;
import defpackage.w2g;
import defpackage.xe2;
import defpackage.ye2;
import java.util.concurrent.Executor;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000U\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0018\n\u0002\b\u0006*\u00012\b\u0001\u0018\u0000 62 \u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0001:\u00016B\u000f\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ)\u0010\u0013\u001a\u00020\u00102\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\u000b2\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0000¢\u0006\u0004\b\u0011\u0010\u0012J=\u0010\u001b\u001a\u00020\u00102\u0006\u0010\u0014\u001a\u00020\u00022\u0012\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u00152\u0006\u0010\u0018\u001a\u00020\u00172\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0017\u0010\u001d\u001a\u00020\u00032\u0006\u0010\u0014\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u0017\u0010 \u001a\u00020\u00052\u0006\u0010\u001f\u001a\u00020\u0004H\u0016¢\u0006\u0004\b \u0010!R\u0014\u0010\b\u001a\u00020\u00078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\"R4\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u00158\u0006@\u0006X\u0087.¢\u0006\u0018\n\u0004\b\u0016\u0010#\u0012\u0004\b(\u0010)\u001a\u0004\b$\u0010%\"\u0004\b&\u0010'R(\u0010\u0018\u001a\u00020\u00178\u0006@\u0006X\u0087.¢\u0006\u0018\n\u0004\b\u0018\u0010*\u0012\u0004\b/\u0010)\u001a\u0004\b+\u0010,\"\u0004\b-\u0010.R\u001e\u0010\u001a\u001a\u0004\u0018\u00010\u00198\u0002@\u0002X\u0083\u000e¢\u0006\f\n\u0004\b\u001a\u00100\u0012\u0004\b1\u0010)R\u001a\u00103\u001a\u0002028\u0002X\u0082\u0004¢\u0006\f\n\u0004\b3\u00104\u0012\u0004\b5\u0010)¨\u00067"}, d2 = {"Landroidx/credentials/playservices/controllers/identitycredentials/createdigitalcredential/CreateDigitalCredentialController;", "Landroidx/credentials/playservices/controllers/CredentialProviderController;", "Lhf2;", "Lye2;", "Laf2;", "Lbf2;", "Landroidx/credentials/exceptions/CreateCredentialException;", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "", "uniqueRequestCode", "resultCode", "Landroid/content/Intent;", "data", "Lc1e;", "handleResponse$credentials_play_services_auth", "(IILandroid/content/Intent;)V", "handleResponse", "request", "Lah2;", "callback", "Ljava/util/concurrent/Executor;", "executor", "Landroid/os/CancellationSignal;", "cancellationSignal", "invokePlayServices", "(Lhf2;Lah2;Ljava/util/concurrent/Executor;Landroid/os/CancellationSignal;)V", "convertRequestToPlayServices", "(Lhf2;)Lye2;", "response", "convertResponseToCredentialManager", "(Laf2;)Lbf2;", "Landroid/content/Context;", "Lah2;", "getCallback", "()Lah2;", "setCallback", "(Lah2;)V", "getCallback$annotations", "()V", "Ljava/util/concurrent/Executor;", "getExecutor", "()Ljava/util/concurrent/Executor;", "setExecutor", "(Ljava/util/concurrent/Executor;)V", "getExecutor$annotations", "Landroid/os/CancellationSignal;", "getCancellationSignal$annotations", "androidx/credentials/playservices/controllers/identitycredentials/createdigitalcredential/CreateDigitalCredentialController$resultReceiver$1", "resultReceiver", "Landroidx/credentials/playservices/controllers/identitycredentials/createdigitalcredential/CreateDigitalCredentialController$resultReceiver$1;", "getResultReceiver$annotations", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class CreateDigitalCredentialController extends CredentialProviderController<hf2, ye2, af2, bf2, CreateCredentialException> {
    private static final Companion Companion = new Companion(null);
    private static final String TAG = "DigitalCredentialClient";
    public ah2 callback;
    private CancellationSignal cancellationSignal;
    private final Context context;
    public Executor executor;
    private final CreateDigitalCredentialController$resultReceiver$1 resultReceiver;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Type inference failed for: r0v1, types: [androidx.credentials.playservices.controllers.identitycredentials.createdigitalcredential.CreateDigitalCredentialController$resultReceiver$1] */
    public CreateDigitalCredentialController(Context context) {
        super(context);
        context.getClass();
        this.context = context;
        final Handler handler = new Handler(Looper.getMainLooper());
        this.resultReceiver = new ResultReceiver(handler) { // from class: androidx.credentials.playservices.controllers.identitycredentials.createdigitalcredential.CreateDigitalCredentialController$resultReceiver$1
            @Override // android.os.ResultReceiver
            public void onReceiveResult(int resultCode, Bundle resultData) {
                resultData.getClass();
                if (this.this$0.maybeReportErrorFromResultReceiver(resultData, new CreateDigitalCredentialController$resultReceiver$1$onReceiveResult$1(CredentialProviderBaseController.INSTANCE), this.this$0.getExecutor(), this.this$0.getCallback(), this.this$0.cancellationSignal)) {
                    return;
                }
                this.this$0.handleResponse$credentials_play_services_auth(resultData.getInt(CredentialProviderBaseController.ACTIVITY_REQUEST_CODE_TAG), resultCode, (Intent) resultData.getParcelable(CredentialProviderBaseController.RESULT_DATA_TAG));
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$0(CancellationSignal cancellationSignal, m45 m45Var) {
        m45Var.getClass();
        CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, m45Var);
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$1(CreateDigitalCredentialController createDigitalCredentialController, CreateCredentialException createCredentialException) {
        createCredentialException.getClass();
        createDigitalCredentialController.getExecutor().execute(new df2(createDigitalCredentialController, createCredentialException, 1));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$1$0(CreateDigitalCredentialController createDigitalCredentialController, CreateCredentialException createCredentialException) {
        createDigitalCredentialController.getCallback().a(createCredentialException);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$2(CreateDigitalCredentialController createDigitalCredentialController) {
        createDigitalCredentialController.getExecutor().execute(new v0(13, createDigitalCredentialController));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$2$0(CreateDigitalCredentialController createDigitalCredentialController) {
        createDigitalCredentialController.getCallback().a(new CreateCredentialUnknownException("No provider data returned."));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$3(CreateDigitalCredentialController createDigitalCredentialController, CreateCredentialException createCredentialException) {
        createDigitalCredentialController.getExecutor().execute(new df2(createDigitalCredentialController, createCredentialException, 0));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$3$0(CreateDigitalCredentialController createDigitalCredentialController, CreateCredentialException createCredentialException) {
        ah2 callback = createDigitalCredentialController.getCallback();
        if (createCredentialException == null) {
            createCredentialException = new CreateCredentialUnknownException("Unexpected configuration error");
        }
        callback.a(createCredentialException);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$4(CreateDigitalCredentialController createDigitalCredentialController, bf2 bf2Var) {
        createDigitalCredentialController.getExecutor().execute(new ho(createDigitalCredentialController, 19, bf2Var));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$4$0(CreateDigitalCredentialController createDigitalCredentialController, bf2 bf2Var) {
        createDigitalCredentialController.getCallback().onResult(bf2Var);
    }

    private static final c1e invokePlayServices$lambda$0(CancellationSignal cancellationSignal, CreateDigitalCredentialController createDigitalCredentialController, xe2 xe2Var) {
        boolean zCancellationReviewer$credentials_play_services_auth = CredentialProviderPlayServicesImpl.INSTANCE.cancellationReviewer$credentials_play_services_auth(cancellationSignal);
        c1e c1eVar = c1e.a;
        if (zCancellationReviewer$credentials_play_services_auth) {
            return c1eVar;
        }
        Intent intent = new Intent(createDigitalCredentialController.context, (Class<?>) IdentityCredentialApiHiddenActivity.class);
        intent.setFlags(ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        intent.putExtra(CredentialProviderBaseController.RESULT_RECEIVER_TAG, createDigitalCredentialController.toIpcFriendlyResultReceiver(createDigitalCredentialController.resultReceiver));
        intent.putExtra(CredentialProviderBaseController.EXTRA_FLOW_PENDING_INTENT, xe2Var.a);
        intent.putExtra(CredentialProviderBaseController.EXTRA_ERROR_NAME, CredentialProviderBaseController.CREATE_UNKNOWN);
        createDigitalCredentialController.context.startActivity(intent);
        return c1eVar;
    }

    private static final void invokePlayServices$lambda$2(CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var, Exception exc) {
        exc.getClass();
        CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new ef2(executor, ah2Var, exc, 0));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$2$0(Executor executor, ah2 ah2Var, Exception exc) {
        executor.execute(new ff2(ah2Var, exc, 0));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$2$0$0(ah2 ah2Var, Exception exc) {
        ah2Var.a(new CreateCredentialUnknownException(exc.getMessage()));
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public /* synthetic */ ye2 convertRequestToPlayServices(hf2 hf2Var) {
        if (hf2Var == null) {
            return convertRequestToPlayServices2((hf2) null);
        }
        rd6.m();
        return null;
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public bf2 convertResponseToCredentialManager(af2 response) {
        response.getClass();
        return w2g.p("androidx.credentials.TYPE_DIGITAL_CREDENTIAL", response.b);
    }

    public final ah2 getCallback() {
        ah2 ah2Var = this.callback;
        if (ah2Var != null) {
            return ah2Var;
        }
        g76.g0("callback");
        throw null;
    }

    public final Executor getExecutor() {
        Executor executor = this.executor;
        if (executor != null) {
            return executor;
        }
        g76.g0("executor");
        throw null;
    }

    public final void handleResponse$credentials_play_services_auth(int uniqueRequestCode, int resultCode, Intent data) {
        CredentialProviderBaseController.Companion companion = CredentialProviderBaseController.INSTANCE;
        if (uniqueRequestCode != companion.getCONTROLLER_REQUEST_CODE$credentials_play_services_auth()) {
            Log.w(TAG, "Returned request code " + companion.getCONTROLLER_REQUEST_CODE$credentials_play_services_auth() + " which  does not match what was given " + uniqueRequestCode);
            return;
        }
        byte b = 0;
        if (CredentialProviderController.maybeReportErrorResultCodeCreate(resultCode, new v02(20, b), new s0(13, this), this.cancellationSignal)) {
            return;
        }
        if (data == null) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new l8(27, this));
            return;
        }
        bf2 bf2VarY = kp7.y(data, "androidx.credentials.TYPE_DIGITAL_CREDENTIAL");
        if (bf2VarY != null) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new gf2(this, b, bf2VarY));
        } else {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new n(this, 29, kp7.x(data)));
        }
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public /* synthetic */ void invokePlayServices(hf2 hf2Var, ah2 ah2Var, Executor executor, CancellationSignal cancellationSignal) {
        if (hf2Var == null) {
            invokePlayServices2((hf2) null, ah2Var, executor, cancellationSignal);
        } else {
            rd6.m();
        }
    }

    public final void setCallback(ah2 ah2Var) {
        ah2Var.getClass();
        this.callback = ah2Var;
    }

    public final void setExecutor(Executor executor) {
        executor.getClass();
        this.executor = executor;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0006"}, d2 = {"Landroidx/credentials/playservices/controllers/identitycredentials/createdigitalcredential/CreateDigitalCredentialController$Companion;", "", "<init>", "()V", "TAG", "", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        private Companion() {
        }
    }

    /* JADX INFO: renamed from: invokePlayServices, reason: avoid collision after fix types in other method */
    public void invokePlayServices2(hf2 request, ah2 callback, Executor executor, CancellationSignal cancellationSignal) {
        throw null;
    }

    /* JADX INFO: renamed from: convertRequestToPlayServices, reason: avoid collision after fix types in other method */
    public ye2 convertRequestToPlayServices2(hf2 request) {
        throw null;
    }

    public static /* synthetic */ void getCallback$annotations() {
    }

    private static /* synthetic */ void getCancellationSignal$annotations() {
    }

    public static /* synthetic */ void getExecutor$annotations() {
    }

    private static /* synthetic */ void getResultReceiver$annotations() {
    }
}
