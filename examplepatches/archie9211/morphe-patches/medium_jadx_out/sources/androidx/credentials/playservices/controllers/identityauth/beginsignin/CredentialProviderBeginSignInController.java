package androidx.credentials.playservices.controllers.identityauth.beginsignin;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Handler;
import android.os.Looper;
import android.os.ResultReceiver;
import android.util.Log;
import androidx.credentials.exceptions.GetCredentialCancellationException;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.GetCredentialInterruptedException;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.CredentialProviderBaseController;
import androidx.credentials.playservices.controllers.CredentialProviderController;
import androidx.credentials.playservices.controllers.identityauth.HiddenActivity;
import androidx.credentials.playservices.controllers.identityauth.beginsignin.CredentialProviderBeginSignInController;
import androidx.credentials.playservices.controllers.identityauth.createpublickeycredential.PublicKeyCredentialControllerUtility;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import defpackage.ah2;
import defpackage.c1e;
import defpackage.ckf;
import defpackage.da4;
import defpackage.f70;
import defpackage.g76;
import defpackage.ge5;
import defpackage.gf2;
import defpackage.gh2;
import defpackage.guc;
import defpackage.gy2;
import defpackage.hh2;
import defpackage.ho;
import defpackage.i95;
import defpackage.jrg;
import defpackage.k95;
import defpackage.l8;
import defpackage.lt;
import defpackage.m45;
import defpackage.mq0;
import defpackage.n4;
import defpackage.nec;
import defpackage.nq0;
import defpackage.qq0;
import defpackage.rq0;
import defpackage.rya;
import defpackage.s0;
import defpackage.sq0;
import defpackage.te3;
import defpackage.u9c;
import defpackage.v0;
import defpackage.v02;
import defpackage.vp7;
import defpackage.wv0;
import defpackage.x45;
import defpackage.yfd;
import java.util.concurrent.Executor;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u0003\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\b\u0005*\u00019\b\u0000\u0018\u0000 <2 \u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0001:\u0001<B\u000f\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ=\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000b\u001a\u00020\u00022\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\f2\u0006\u0010\u000f\u001a\u00020\u000e2\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J)\u0010\u001c\u001a\u00020\u00122\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0017\u001a\u00020\u00152\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018H\u0000¢\u0006\u0004\b\u001a\u0010\u001bJ\u0017\u0010\u001d\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0002H\u0017¢\u0006\u0004\b\u001d\u0010\u001eJ\u0017\u0010 \u001a\u00020\u00052\u0006\u0010\u001f\u001a\u00020\u0004H\u0017¢\u0006\u0004\b \u0010!J\u0017\u0010$\u001a\u00020\u00062\u0006\u0010#\u001a\u00020\"H\u0002¢\u0006\u0004\b$\u0010%J\u0017\u0010'\u001a\u00020&2\u0006\u0010\u001f\u001a\u00020\u0004H\u0002¢\u0006\u0004\b'\u0010(R\u0014\u0010\b\u001a\u00020\u00078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010)R4\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\f8\u0006@\u0006X\u0087.¢\u0006\u0018\n\u0004\b\r\u0010*\u0012\u0004\b/\u00100\u001a\u0004\b+\u0010,\"\u0004\b-\u0010.R(\u0010\u000f\u001a\u00020\u000e8\u0006@\u0006X\u0087.¢\u0006\u0018\n\u0004\b\u000f\u00101\u0012\u0004\b6\u00100\u001a\u0004\b2\u00103\"\u0004\b4\u00105R\u001e\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0002@\u0002X\u0083\u000e¢\u0006\f\n\u0004\b\u0011\u00107\u0012\u0004\b8\u00100R\u0014\u0010:\u001a\u0002098\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b:\u0010;¨\u0006="}, d2 = {"Landroidx/credentials/playservices/controllers/identityauth/beginsignin/CredentialProviderBeginSignInController;", "Landroidx/credentials/playservices/controllers/CredentialProviderController;", "Li95;", "Lrq0;", "Lu9c;", "Lk95;", "Landroidx/credentials/exceptions/GetCredentialException;", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "request", "Lah2;", "callback", "Ljava/util/concurrent/Executor;", "executor", "Landroid/os/CancellationSignal;", "cancellationSignal", "Lc1e;", "invokePlayServices", "(Li95;Lah2;Ljava/util/concurrent/Executor;Landroid/os/CancellationSignal;)V", "", "uniqueRequestCode", "resultCode", "Landroid/content/Intent;", "data", "handleResponse$credentials_play_services_auth", "(IILandroid/content/Intent;)V", "handleResponse", "convertRequestToPlayServices", "(Li95;)Lrq0;", "response", "convertResponseToCredentialManager", "(Lu9c;)Lk95;", "", "e", "fromGmsException", "(Ljava/lang/Throwable;)Landroidx/credentials/exceptions/GetCredentialException;", "Lge5;", "createGoogleIdCredential", "(Lu9c;)Lge5;", "Landroid/content/Context;", "Lah2;", "getCallback", "()Lah2;", "setCallback", "(Lah2;)V", "getCallback$annotations", "()V", "Ljava/util/concurrent/Executor;", "getExecutor", "()Ljava/util/concurrent/Executor;", "setExecutor", "(Ljava/util/concurrent/Executor;)V", "getExecutor$annotations", "Landroid/os/CancellationSignal;", "getCancellationSignal$annotations", "androidx/credentials/playservices/controllers/identityauth/beginsignin/CredentialProviderBeginSignInController$resultReceiver$1", "resultReceiver", "Landroidx/credentials/playservices/controllers/identityauth/beginsignin/CredentialProviderBeginSignInController$resultReceiver$1;", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class CredentialProviderBeginSignInController extends CredentialProviderController<i95, rq0, u9c, k95, GetCredentialException> {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static final String TAG = "BeginSignIn";
    public ah2 callback;
    private CancellationSignal cancellationSignal;
    private final Context context;
    public Executor executor;
    private final CredentialProviderBeginSignInController$resultReceiver$1 resultReceiver;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Type inference failed for: r0v1, types: [androidx.credentials.playservices.controllers.identityauth.beginsignin.CredentialProviderBeginSignInController$resultReceiver$1] */
    public CredentialProviderBeginSignInController(Context context) {
        super(context);
        context.getClass();
        this.context = context;
        final Handler handler = new Handler(Looper.getMainLooper());
        this.resultReceiver = new ResultReceiver(handler) { // from class: androidx.credentials.playservices.controllers.identityauth.beginsignin.CredentialProviderBeginSignInController$resultReceiver$1
            @Override // android.os.ResultReceiver
            public void onReceiveResult(int resultCode, Bundle resultData) {
                resultData.getClass();
                if (this.this$0.maybeReportErrorFromResultReceiver(resultData, new CredentialProviderBeginSignInController$resultReceiver$1$onReceiveResult$1(CredentialProviderBaseController.INSTANCE), this.this$0.getExecutor(), this.this$0.getCallback(), this.this$0.cancellationSignal)) {
                    return;
                }
                this.this$0.handleResponse$credentials_play_services_auth(resultData.getInt(CredentialProviderBaseController.ACTIVITY_REQUEST_CODE_TAG), resultCode, (Intent) resultData.getParcelable(CredentialProviderBaseController.RESULT_DATA_TAG));
            }
        };
    }

    private final ge5 createGoogleIdCredential(u9c response) {
        String str = response.a;
        str.getClass();
        String str2 = response.g;
        str2.getClass();
        String str3 = response.b;
        String str4 = str3 != null ? str3 : null;
        String str5 = response.c;
        String str6 = str5 != null ? str5 : null;
        String str7 = response.d;
        String str8 = str7 != null ? str7 : null;
        String str9 = response.h;
        String str10 = str9 != null ? str9 : null;
        Uri uri = response.e;
        return new ge5(str, str2, str4, str8, str6, uri != null ? uri : null, str10);
    }

    private final GetCredentialException fromGmsException(Throwable e) {
        String str = ((e instanceof ApiException) && CredentialProviderBaseController.INSTANCE.getRetryables().contains(Integer.valueOf(((ApiException) e).a.a))) ? CredentialProviderBaseController.GET_INTERRUPTED : CredentialProviderBaseController.GET_NO_CREDENTIALS;
        return CredentialProviderBaseController.INSTANCE.getCredentialExceptionTypeToException$credentials_play_services_auth(str, "During begin sign in, failure response from one tap: " + e.getMessage());
    }

    public static /* synthetic */ void getCallback$annotations() {
    }

    private static /* synthetic */ void getCancellationSignal$annotations() {
    }

    public static /* synthetic */ void getExecutor$annotations() {
    }

    public static final CredentialProviderBeginSignInController getInstance(Context context) {
        return INSTANCE.getInstance(context);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$0(CancellationSignal cancellationSignal, m45 m45Var) {
        m45Var.getClass();
        CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, m45Var);
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$1(CredentialProviderBeginSignInController credentialProviderBeginSignInController, GetCredentialException getCredentialException) {
        getCredentialException.getClass();
        credentialProviderBeginSignInController.getExecutor().execute(new hh2(credentialProviderBeginSignInController, getCredentialException, 1));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$1$0(CredentialProviderBeginSignInController credentialProviderBeginSignInController, GetCredentialException getCredentialException) {
        credentialProviderBeginSignInController.getCallback().a(getCredentialException);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$2(CredentialProviderBeginSignInController credentialProviderBeginSignInController, k95 k95Var) {
        credentialProviderBeginSignInController.getExecutor().execute(new ho(credentialProviderBeginSignInController, 24, k95Var));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$2$0(CredentialProviderBeginSignInController credentialProviderBeginSignInController, k95 k95Var) {
        credentialProviderBeginSignInController.getCallback().onResult(k95Var);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$3(CredentialProviderBeginSignInController credentialProviderBeginSignInController, rya ryaVar) {
        credentialProviderBeginSignInController.getExecutor().execute(new ho(credentialProviderBeginSignInController, 25, ryaVar));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$3$0(CredentialProviderBeginSignInController credentialProviderBeginSignInController, rya ryaVar) {
        credentialProviderBeginSignInController.getCallback().a(ryaVar.a);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$4(CredentialProviderBeginSignInController credentialProviderBeginSignInController, GetCredentialException getCredentialException) {
        credentialProviderBeginSignInController.getExecutor().execute(new hh2(credentialProviderBeginSignInController, getCredentialException, 2));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$4$0(CredentialProviderBeginSignInController credentialProviderBeginSignInController, GetCredentialException getCredentialException) {
        credentialProviderBeginSignInController.getCallback().a(getCredentialException);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$5(CredentialProviderBeginSignInController credentialProviderBeginSignInController, GetCredentialUnknownException getCredentialUnknownException) {
        credentialProviderBeginSignInController.getExecutor().execute(new ho(credentialProviderBeginSignInController, 23, getCredentialUnknownException));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$5$0(CredentialProviderBeginSignInController credentialProviderBeginSignInController, GetCredentialUnknownException getCredentialUnknownException) {
        credentialProviderBeginSignInController.getCallback().a(getCredentialUnknownException);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0(CancellationSignal cancellationSignal, CredentialProviderBeginSignInController credentialProviderBeginSignInController, sq0 sq0Var) {
        boolean zCancellationReviewer$credentials_play_services_auth = CredentialProviderPlayServicesImpl.INSTANCE.cancellationReviewer$credentials_play_services_auth(cancellationSignal);
        c1e c1eVar = c1e.a;
        if (zCancellationReviewer$credentials_play_services_auth) {
            return c1eVar;
        }
        Intent intent = new Intent(credentialProviderBeginSignInController.context, (Class<?>) HiddenActivity.class);
        credentialProviderBeginSignInController.generateHiddenActivityIntent(credentialProviderBeginSignInController.resultReceiver, intent, CredentialProviderBaseController.BEGIN_SIGN_IN_TAG);
        intent.putExtra(CredentialProviderBaseController.EXTRA_FLOW_PENDING_INTENT, sq0Var.a);
        try {
            credentialProviderBeginSignInController.context.startActivity(intent);
            return c1eVar;
        } catch (Exception unused) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new l8(28, credentialProviderBeginSignInController));
            return c1eVar;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0$0(CredentialProviderBeginSignInController credentialProviderBeginSignInController) {
        credentialProviderBeginSignInController.getExecutor().execute(new v0(14, credentialProviderBeginSignInController));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$0$0$0(CredentialProviderBeginSignInController credentialProviderBeginSignInController) {
        credentialProviderBeginSignInController.getCallback().a(new GetCredentialUnknownException(CredentialProviderController.ERROR_MESSAGE_START_ACTIVITY_FAILED));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$2(CredentialProviderBeginSignInController credentialProviderBeginSignInController, CancellationSignal cancellationSignal, Exception exc) {
        exc.getClass();
        CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new gh2(credentialProviderBeginSignInController, credentialProviderBeginSignInController.fromGmsException(exc), 1));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$2$0(CredentialProviderBeginSignInController credentialProviderBeginSignInController, GetCredentialException getCredentialException) {
        credentialProviderBeginSignInController.getExecutor().execute(new hh2(credentialProviderBeginSignInController, getCredentialException, 0));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$2$0$0(CredentialProviderBeginSignInController credentialProviderBeginSignInController, GetCredentialException getCredentialException) {
        credentialProviderBeginSignInController.getCallback().a(getCredentialException);
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public rq0 convertRequestToPlayServices(i95 request) {
        request.getClass();
        return BeginSignInControllerUtility.INSTANCE.constructBeginSignInRequest$credentials_play_services_auth(request, this.context);
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
        CredentialProviderController.Companion companion2 = CredentialProviderController.INSTANCE;
        byte b = 0;
        if (companion2.maybeReportErrorResultCodeGet$credentials_play_services_auth(resultCode, new v02(23, b), new s0(16, this), this.cancellationSignal)) {
            return;
        }
        try {
            guc.J(this.context);
            companion2.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new gf2(this, 5, convertResponseToCredentialManager(ckf.c(data))));
        } catch (GetCredentialException e) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new gh2(this, e, b));
        } catch (ApiException e2) {
            rya ryaVar = new rya();
            ryaVar.a = new GetCredentialUnknownException(e2.getMessage());
            Status status = e2.a;
            if (status.a == 16) {
                ryaVar.a = new GetCredentialCancellationException(e2.getMessage());
            } else if (CredentialProviderBaseController.INSTANCE.getRetryables().contains(Integer.valueOf(status.a))) {
                ryaVar.a = new GetCredentialInterruptedException(e2.getMessage());
            }
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new gf2(this, 6, ryaVar));
        } catch (Throwable th) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new gf2(this, 7, new GetCredentialUnknownException(th.getMessage())));
        }
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public void invokePlayServices(i95 request, ah2 callback, Executor executor, final CancellationSignal cancellationSignal) {
        request.getClass();
        callback.getClass();
        executor.getClass();
        this.cancellationSignal = cancellationSignal;
        setCallback(callback);
        setExecutor(executor);
        if (CredentialProviderPlayServicesImpl.INSTANCE.cancellationReviewer$credentials_play_services_auth(cancellationSignal)) {
            return;
        }
        rq0 rq0VarConvertRequestToPlayServices = convertRequestToPlayServices(request);
        ckf ckfVarJ = guc.J(this.context);
        vp7.p(rq0VarConvertRequestToPlayServices);
        mq0 mq0VarD = nq0.d();
        mq0VarD.a = false;
        mq0VarD.a();
        nq0 nq0Var = rq0VarConvertRequestToPlayServices.b;
        vp7.p(nq0Var);
        qq0 qq0Var = rq0VarConvertRequestToPlayServices.a;
        vp7.p(qq0Var);
        rq0 rq0Var = new rq0(qq0Var, nq0Var, ckfVarJ.l, rq0VarConvertRequestToPlayServices.d, rq0VarConvertRequestToPlayServices.e, rq0VarConvertRequestToPlayServices.f, rq0VarConvertRequestToPlayServices.g, rq0VarConvertRequestToPlayServices.h);
        wv0 wv0VarB = wv0.b();
        wv0VarB.e = new da4[]{new da4("auth_api_credentials_begin_sign_in", 8L)};
        wv0VarB.d = new nec(ckfVarJ, rq0Var);
        wv0VarB.c = false;
        wv0VarB.b = 1553;
        jrg jrgVarB = ckfVarJ.b(0, wv0VarB.a());
        f70 f70Var = new f70(10, new x45() { // from class: fh2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                return CredentialProviderBeginSignInController.invokePlayServices$lambda$0(cancellationSignal, this, (sq0) obj);
            }
        });
        jrgVarB.getClass();
        jrgVarB.e(yfd.a, f70Var);
        jrgVarB.c(new lt(this, 4, cancellationSignal));
    }

    public final void setCallback(ah2 ah2Var) {
        ah2Var.getClass();
        this.callback = ah2Var;
    }

    public final void setExecutor(Executor executor) {
        executor.getClass();
        this.executor = executor;
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public k95 convertResponseToCredentialManager(u9c response) throws GetCredentialUnknownException {
        n4 te3Var;
        response.getClass();
        String str = response.f;
        if (str != null) {
            String str2 = response.a;
            str2.getClass();
            Bundle bundle = new Bundle();
            bundle.putString("androidx.credentials.BUNDLE_KEY_ID", str2);
            bundle.putString("androidx.credentials.BUNDLE_KEY_PASSWORD", str);
            te3Var = new te3(str, bundle, 1);
        } else if (response.g != null) {
            te3Var = createGoogleIdCredential(response);
        } else if (response.i != null) {
            String assertPasskeyResponse = PublicKeyCredentialControllerUtility.INSTANCE.toAssertPasskeyResponse(response);
            assertPasskeyResponse.getClass();
            Bundle bundle2 = new Bundle();
            bundle2.putString(JWcjNoweKCnTr.yCdXuFYQj, assertPasskeyResponse);
            te3Var = new te3(assertPasskeyResponse, bundle2, 2);
        } else {
            Log.w(TAG, "Credential returned but no google Id or password or passkey found");
            te3Var = null;
        }
        if (te3Var != null) {
            return new k95(te3Var);
        }
        throw new GetCredentialUnknownException("When attempting to convert get response, null credential found");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    /* JADX INFO: loaded from: classes.dex */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0007R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Landroidx/credentials/playservices/controllers/identityauth/beginsignin/CredentialProviderBeginSignInController$Companion;", "", "<init>", "()V", "TAG", "", "getInstance", "Landroidx/credentials/playservices/controllers/identityauth/beginsignin/CredentialProviderBeginSignInController;", "context", "Landroid/content/Context;", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        public final CredentialProviderBeginSignInController getInstance(Context context) {
            context.getClass();
            return new CredentialProviderBeginSignInController(context);
        }

        private Companion() {
        }
    }
}
