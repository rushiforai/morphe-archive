package androidx.credentials.playservices.controllers.identityauth.getsigninintent;

import android.app.PendingIntent;
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
import androidx.credentials.exceptions.GetCredentialUnsupportedException;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.CredentialProviderBaseController;
import androidx.credentials.playservices.controllers.CredentialProviderController;
import androidx.credentials.playservices.controllers.identityauth.HiddenActivity;
import androidx.credentials.playservices.controllers.identityauth.getsigninintent.CredentialProviderGetSignInIntentController;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import defpackage.ac5;
import defpackage.ah2;
import defpackage.bc5;
import defpackage.c1e;
import defpackage.ckf;
import defpackage.da4;
import defpackage.di2;
import defpackage.ei2;
import defpackage.f70;
import defpackage.fi2;
import defpackage.g76;
import defpackage.ge5;
import defpackage.gf2;
import defpackage.guc;
import defpackage.gy2;
import defpackage.ho;
import defpackage.i95;
import defpackage.jrg;
import defpackage.k95;
import defpackage.lt;
import defpackage.m45;
import defpackage.nh2;
import defpackage.pxf;
import defpackage.rya;
import defpackage.s0;
import defpackage.u9c;
import defpackage.ujf;
import defpackage.v0;
import defpackage.v02;
import defpackage.vp7;
import defpackage.wv0;
import defpackage.x45;
import defpackage.yfd;
import java.util.List;
import java.util.concurrent.Executor;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0003\n\u0002\b\u0013\n\u0002\b\u0005*\u00019\b\u0000\u0018\u0000 <2 \u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0001:\u0001<B\u000f\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ=\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000b\u001a\u00020\u00022\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\f2\u0006\u0010\u000f\u001a\u00020\u000e2\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0017\u0010\u0015\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0002H\u0017¢\u0006\u0004\b\u0015\u0010\u0016J\u0017\u0010\u0018\u001a\u00020\u00052\u0006\u0010\u0017\u001a\u00020\u0004H\u0014¢\u0006\u0004\b\u0018\u0010\u0019J\u0017\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u0017\u001a\u00020\u0004H\u0007¢\u0006\u0004\b\u001b\u0010\u001cJ)\u0010$\u001a\u00020\u00122\u0006\u0010\u001e\u001a\u00020\u001d2\u0006\u0010\u001f\u001a\u00020\u001d2\b\u0010!\u001a\u0004\u0018\u00010 H\u0000¢\u0006\u0004\b\"\u0010#J\u0017\u0010'\u001a\u00020\u00062\u0006\u0010&\u001a\u00020%H\u0002¢\u0006\u0004\b'\u0010(R\u0014\u0010\b\u001a\u00020\u00078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010)R4\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\f8\u0006@\u0006X\u0087.¢\u0006\u0018\n\u0004\b\r\u0010*\u0012\u0004\b/\u00100\u001a\u0004\b+\u0010,\"\u0004\b-\u0010.R(\u0010\u000f\u001a\u00020\u000e8\u0006@\u0006X\u0087.¢\u0006\u0018\n\u0004\b\u000f\u00101\u0012\u0004\b6\u00100\u001a\u0004\b2\u00103\"\u0004\b4\u00105R\u001e\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0002@\u0002X\u0083\u000e¢\u0006\f\n\u0004\b\u0011\u00107\u0012\u0004\b8\u00100R\u0014\u0010:\u001a\u0002098\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b:\u0010;¨\u0006="}, d2 = {"Landroidx/credentials/playservices/controllers/identityauth/getsigninintent/CredentialProviderGetSignInIntentController;", "Landroidx/credentials/playservices/controllers/CredentialProviderController;", "Li95;", "Lac5;", "Lu9c;", "Lk95;", "Landroidx/credentials/exceptions/GetCredentialException;", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "request", "Lah2;", "callback", "Ljava/util/concurrent/Executor;", "executor", "Landroid/os/CancellationSignal;", "cancellationSignal", "Lc1e;", "invokePlayServices", "(Li95;Lah2;Ljava/util/concurrent/Executor;Landroid/os/CancellationSignal;)V", "convertRequestToPlayServices", "(Li95;)Lac5;", "response", "convertResponseToCredentialManager", "(Lu9c;)Lk95;", "Lge5;", "createGoogleIdCredential", "(Lu9c;)Lge5;", "", "uniqueRequestCode", "resultCode", "Landroid/content/Intent;", "data", "handleResponse$credentials_play_services_auth", "(IILandroid/content/Intent;)V", "handleResponse", "", "e", "fromGmsException", "(Ljava/lang/Throwable;)Landroidx/credentials/exceptions/GetCredentialException;", "Landroid/content/Context;", "Lah2;", "getCallback", "()Lah2;", "setCallback", "(Lah2;)V", "getCallback$annotations", "()V", "Ljava/util/concurrent/Executor;", "getExecutor", "()Ljava/util/concurrent/Executor;", "setExecutor", "(Ljava/util/concurrent/Executor;)V", "getExecutor$annotations", "Landroid/os/CancellationSignal;", "getCancellationSignal$annotations", "androidx/credentials/playservices/controllers/identityauth/getsigninintent/CredentialProviderGetSignInIntentController$resultReceiver$1", "resultReceiver", "Landroidx/credentials/playservices/controllers/identityauth/getsigninintent/CredentialProviderGetSignInIntentController$resultReceiver$1;", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class CredentialProviderGetSignInIntentController extends CredentialProviderController<i95, ac5, u9c, k95, GetCredentialException> {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static final String TAG = "GetSignInIntent";
    public ah2 callback;
    private CancellationSignal cancellationSignal;
    private final Context context;
    public Executor executor;
    private final CredentialProviderGetSignInIntentController$resultReceiver$1 resultReceiver;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Type inference failed for: r0v1, types: [androidx.credentials.playservices.controllers.identityauth.getsigninintent.CredentialProviderGetSignInIntentController$resultReceiver$1] */
    public CredentialProviderGetSignInIntentController(Context context) {
        super(context);
        context.getClass();
        this.context = context;
        final Handler handler = new Handler(Looper.getMainLooper());
        this.resultReceiver = new ResultReceiver(handler) { // from class: androidx.credentials.playservices.controllers.identityauth.getsigninintent.CredentialProviderGetSignInIntentController$resultReceiver$1
            @Override // android.os.ResultReceiver
            public void onReceiveResult(int resultCode, Bundle resultData) {
                resultData.getClass();
                if (this.this$0.maybeReportErrorFromResultReceiver(resultData, new CredentialProviderGetSignInIntentController$resultReceiver$1$onReceiveResult$1(CredentialProviderBaseController.INSTANCE), this.this$0.getExecutor(), this.this$0.getCallback(), this.this$0.cancellationSignal)) {
                    return;
                }
                this.this$0.handleResponse$credentials_play_services_auth(resultData.getInt(CredentialProviderBaseController.ACTIVITY_REQUEST_CODE_TAG), resultCode, (Intent) resultData.getParcelable(CredentialProviderBaseController.RESULT_DATA_TAG));
            }
        };
    }

    private final GetCredentialException fromGmsException(Throwable e) {
        String str = ((e instanceof ApiException) && CredentialProviderBaseController.INSTANCE.getRetryables().contains(Integer.valueOf(((ApiException) e).a.a))) ? CredentialProviderBaseController.GET_INTERRUPTED : CredentialProviderBaseController.GET_NO_CREDENTIALS;
        return CredentialProviderBaseController.INSTANCE.getCredentialExceptionTypeToException$credentials_play_services_auth(str, "During get sign-in intent, failure response from one tap: " + e.getMessage());
    }

    public static final CredentialProviderGetSignInIntentController getInstance(Context context) {
        return INSTANCE.getInstance(context);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$0(CancellationSignal cancellationSignal, m45 m45Var) {
        m45Var.getClass();
        CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, m45Var);
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$1(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, GetCredentialException getCredentialException) {
        getCredentialException.getClass();
        credentialProviderGetSignInIntentController.getExecutor().execute(new ei2(credentialProviderGetSignInIntentController, getCredentialException, 1));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$1$0(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, GetCredentialException getCredentialException) {
        credentialProviderGetSignInIntentController.getCallback().a(getCredentialException);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$2(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, k95 k95Var) {
        credentialProviderGetSignInIntentController.getExecutor().execute(new fi2(credentialProviderGetSignInIntentController, 1, k95Var));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$2$0(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, k95 k95Var) {
        credentialProviderGetSignInIntentController.getCallback().onResult(k95Var);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$3(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, rya ryaVar) {
        credentialProviderGetSignInIntentController.getExecutor().execute(new fi2(credentialProviderGetSignInIntentController, 0, ryaVar));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$3$0(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, rya ryaVar) {
        credentialProviderGetSignInIntentController.getCallback().a(ryaVar.a);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$4(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, GetCredentialException getCredentialException) {
        credentialProviderGetSignInIntentController.getExecutor().execute(new ei2(credentialProviderGetSignInIntentController, getCredentialException, 2));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$4$0(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, GetCredentialException getCredentialException) {
        credentialProviderGetSignInIntentController.getCallback().a(getCredentialException);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e handleResponse$lambda$5(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, GetCredentialUnknownException getCredentialUnknownException) {
        credentialProviderGetSignInIntentController.getExecutor().execute(new ho(credentialProviderGetSignInIntentController, 29, getCredentialUnknownException));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void handleResponse$lambda$5$0(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, GetCredentialUnknownException getCredentialUnknownException) {
        credentialProviderGetSignInIntentController.getCallback().a(getCredentialUnknownException);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, GetCredentialUnsupportedException getCredentialUnsupportedException) {
        credentialProviderGetSignInIntentController.getExecutor().execute(new fi2(credentialProviderGetSignInIntentController, 2, getCredentialUnsupportedException));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$0$0(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, GetCredentialUnsupportedException getCredentialUnsupportedException) {
        credentialProviderGetSignInIntentController.getCallback().a(getCredentialUnsupportedException);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$1(CancellationSignal cancellationSignal, CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, PendingIntent pendingIntent) {
        pendingIntent.getClass();
        boolean zCancellationReviewer$credentials_play_services_auth = CredentialProviderPlayServicesImpl.INSTANCE.cancellationReviewer$credentials_play_services_auth(cancellationSignal);
        c1e c1eVar = c1e.a;
        if (zCancellationReviewer$credentials_play_services_auth) {
            return c1eVar;
        }
        Intent intent = new Intent(credentialProviderGetSignInIntentController.context, (Class<?>) HiddenActivity.class);
        credentialProviderGetSignInIntentController.generateHiddenActivityIntent(credentialProviderGetSignInIntentController.resultReceiver, intent, CredentialProviderBaseController.SIGN_IN_INTENT_TAG);
        intent.putExtra(CredentialProviderBaseController.EXTRA_FLOW_PENDING_INTENT, pendingIntent);
        try {
            credentialProviderGetSignInIntentController.context.startActivity(intent);
            return c1eVar;
        } catch (Exception unused) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new nh2(1, credentialProviderGetSignInIntentController));
            return c1eVar;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$1$0(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController) {
        credentialProviderGetSignInIntentController.getExecutor().execute(new v0(16, credentialProviderGetSignInIntentController));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$1$0$0(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController) {
        credentialProviderGetSignInIntentController.getCallback().a(new GetCredentialUnknownException(CredentialProviderController.ERROR_MESSAGE_START_ACTIVITY_FAILED));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$3(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, CancellationSignal cancellationSignal, Exception exc) {
        exc.getClass();
        CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new di2(credentialProviderGetSignInIntentController, credentialProviderGetSignInIntentController.fromGmsException(exc), 1));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$3$0(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, GetCredentialException getCredentialException) {
        credentialProviderGetSignInIntentController.getExecutor().execute(new ei2(credentialProviderGetSignInIntentController, getCredentialException, 0));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$3$0$0(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, GetCredentialException getCredentialException) {
        credentialProviderGetSignInIntentController.getCallback().a(getCredentialException);
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public ac5 convertRequestToPlayServices(i95 request) throws GetCredentialUnsupportedException {
        request.getClass();
        List list = request.a;
        if (list.size() != 1) {
            throw new GetCredentialUnsupportedException("GetSignInWithGoogleOption cannot be combined with other options.");
        }
        Object obj = list.get(0);
        obj.getClass();
        return new ac5(0, ((bc5) obj).d, null, null, null, false);
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public k95 convertResponseToCredentialManager(u9c response) throws GetCredentialUnknownException {
        ge5 ge5VarCreateGoogleIdCredential;
        response.getClass();
        if (response.g != null) {
            ge5VarCreateGoogleIdCredential = createGoogleIdCredential(response);
        } else {
            Log.w(TAG, "Credential returned but no google Id found");
            ge5VarCreateGoogleIdCredential = null;
        }
        if (ge5VarCreateGoogleIdCredential != null) {
            return new k95(ge5VarCreateGoogleIdCredential);
        }
        throw new GetCredentialUnknownException("When attempting to convert get response, null credential found");
    }

    public final ge5 createGoogleIdCredential(u9c response) throws GetCredentialUnknownException {
        response.getClass();
        String str = response.a;
        str.getClass();
        try {
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
        } catch (Exception unused) {
            throw new GetCredentialUnknownException("When attempting to convert get response, null Google ID Token found");
        }
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
        if (companion2.maybeReportErrorResultCodeGet$credentials_play_services_auth(resultCode, new v02(26, b), new s0(19, this), this.cancellationSignal)) {
            return;
        }
        try {
            guc.J(this.context);
            companion2.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new gf2(this, 13, convertResponseToCredentialManager(ckf.c(data))));
        } catch (GetCredentialException e) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new di2(this, e, b));
        } catch (ApiException e2) {
            rya ryaVar = new rya();
            ryaVar.a = new GetCredentialUnknownException(e2.getMessage());
            Status status = e2.a;
            if (status.a == 16) {
                ryaVar.a = new GetCredentialCancellationException(e2.getMessage());
            } else if (CredentialProviderBaseController.INSTANCE.getRetryables().contains(Integer.valueOf(status.a))) {
                ryaVar.a = new GetCredentialInterruptedException(e2.getMessage());
            }
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new gf2(this, 14, ryaVar));
        } catch (Throwable th) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(this.cancellationSignal, new gf2(this, 15, new GetCredentialUnknownException(th.getMessage())));
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
        try {
            ac5 ac5VarConvertRequestToPlayServices = convertRequestToPlayServices(request);
            ckf ckfVarJ = guc.J(this.context);
            vp7.p(ac5VarConvertRequestToPlayServices);
            String str = ac5VarConvertRequestToPlayServices.a;
            vp7.p(str);
            ac5 ac5Var = new ac5(ac5VarConvertRequestToPlayServices.f, str, ac5VarConvertRequestToPlayServices.b, ckfVarJ.l, ac5VarConvertRequestToPlayServices.d, ac5VarConvertRequestToPlayServices.e);
            wv0 wv0VarB = wv0.b();
            wv0VarB.e = new da4[]{pxf.M};
            wv0VarB.d = new ujf(ckfVarJ, 2, ac5Var);
            wv0VarB.b = 1555;
            jrg jrgVarB = ckfVarJ.b(0, wv0VarB.a());
            f70 f70Var = new f70(13, new x45() { // from class: gi2
                @Override // defpackage.x45
                public final Object invoke(Object obj) {
                    return CredentialProviderGetSignInIntentController.invokePlayServices$lambda$1(cancellationSignal, this, (PendingIntent) obj);
                }
            });
            jrgVarB.getClass();
            jrgVarB.e(yfd.a, f70Var);
            jrgVarB.c(new lt(this, 5, cancellationSignal));
        } catch (GetCredentialUnsupportedException e) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new gf2(this, 16, e));
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
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0007R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Landroidx/credentials/playservices/controllers/identityauth/getsigninintent/CredentialProviderGetSignInIntentController$Companion;", "", "<init>", "()V", "TAG", "", "getInstance", "Landroidx/credentials/playservices/controllers/identityauth/getsigninintent/CredentialProviderGetSignInIntentController;", "context", "Landroid/content/Context;", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        public final CredentialProviderGetSignInIntentController getInstance(Context context) {
            context.getClass();
            return new CredentialProviderGetSignInIntentController(context);
        }

        private Companion() {
        }
    }

    public static /* synthetic */ void getCallback$annotations() {
    }

    private static /* synthetic */ void getCancellationSignal$annotations() {
    }

    public static /* synthetic */ void getExecutor$annotations() {
    }
}
