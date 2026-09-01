package androidx.credentials.playservices.controllers.identitycredentials.getcredential;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Handler;
import android.os.Looper;
import android.os.ResultReceiver;
import android.util.Log;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.CredentialProviderBaseController;
import androidx.credentials.playservices.controllers.CredentialProviderController;
import androidx.credentials.playservices.controllers.ResponseUtils;
import androidx.credentials.playservices.controllers.identityauth.HiddenActivity;
import androidx.credentials.playservices.controllers.identityauth.beginsignin.CredentialProviderBeginSignInController;
import androidx.credentials.playservices.controllers.identityauth.getsigninintent.CredentialProviderGetSignInIntentController;
import androidx.credentials.playservices.controllers.identitycredentials.getcredential.GetCredentialController;
import com.google.android.gms.identitycredentials.GetCredentialRequest;
import defpackage.ah2;
import defpackage.b66;
import defpackage.c1e;
import defpackage.ch2;
import defpackage.cu1;
import defpackage.dg2;
import defpackage.dh2;
import defpackage.f70;
import defpackage.g76;
import defpackage.ht2;
import defpackage.i95;
import defpackage.ii2;
import defpackage.j95;
import defpackage.jrg;
import defpackage.k95;
import defpackage.kng;
import defpackage.sy;
import defpackage.wg2;
import defpackage.x45;
import defpackage.y79;
import defpackage.yd5;
import defpackage.yfd;
import defpackage.zf2;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Executor;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000S\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0019\n\u0002\b\u0005*\u00011\b\u0001\u0018\u0000 42 \u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0001:\u00014B\u000f\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u0017\u0010\u000e\u001a\u00020\r2\u0006\u0010\f\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ=\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0010\u001a\u00020\u00022\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u00112\u0006\u0010\u0014\u001a\u00020\u00132\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0017\u0010\u001a\u001a\u00020\u00032\u0006\u0010\u0010\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0017\u0010\u001d\u001a\u00020\u00052\u0006\u0010\u001c\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\u001d\u0010\u001eR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010\u001f\u001a\u0004\b \u0010!R4\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u00118\u0006@\u0006X\u0087.¢\u0006\u0018\n\u0004\b\u0012\u0010\"\u0012\u0004\b'\u0010(\u001a\u0004\b#\u0010$\"\u0004\b%\u0010&R(\u0010\u0014\u001a\u00020\u00138\u0006@\u0006X\u0087.¢\u0006\u0018\n\u0004\b\u0014\u0010)\u0012\u0004\b.\u0010(\u001a\u0004\b*\u0010+\"\u0004\b,\u0010-R\u001e\u0010\u0016\u001a\u0004\u0018\u00010\u00158\u0002@\u0002X\u0083\u000e¢\u0006\f\n\u0004\b\u0016\u0010/\u0012\u0004\b0\u0010(R\u0014\u00102\u001a\u0002018\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b2\u00103¨\u00065"}, d2 = {"Landroidx/credentials/playservices/controllers/identitycredentials/getcredential/GetCredentialController;", "Landroidx/credentials/playservices/controllers/CredentialProviderController;", "Li95;", "Lcom/google/android/gms/identitycredentials/GetCredentialRequest;", "Lj95;", "Lk95;", "Landroidx/credentials/exceptions/GetCredentialException;", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "Ldh2;", "option", "Lch2;", "convertCredentialOptionToPlayServices", "(Ldh2;)Lch2;", "request", "Lah2;", "callback", "Ljava/util/concurrent/Executor;", "executor", "Landroid/os/CancellationSignal;", "cancellationSignal", "Lc1e;", "invokePlayServices", "(Li95;Lah2;Ljava/util/concurrent/Executor;Landroid/os/CancellationSignal;)V", "convertRequestToPlayServices", "(Li95;)Lcom/google/android/gms/identitycredentials/GetCredentialRequest;", "response", "convertResponseToCredentialManager", "(Lj95;)Lk95;", "Landroid/content/Context;", "getContext", "()Landroid/content/Context;", "Lah2;", "getCallback", "()Lah2;", "setCallback", "(Lah2;)V", "getCallback$annotations", "()V", "Ljava/util/concurrent/Executor;", "getExecutor", "()Ljava/util/concurrent/Executor;", "setExecutor", "(Ljava/util/concurrent/Executor;)V", "getExecutor$annotations", "Landroid/os/CancellationSignal;", "getCancellationSignal$annotations", "androidx/credentials/playservices/controllers/identitycredentials/getcredential/GetCredentialController$resultReceiver$1", "resultReceiver", "Landroidx/credentials/playservices/controllers/identitycredentials/getcredential/GetCredentialController$resultReceiver$1;", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class GetCredentialController extends CredentialProviderController<i95, GetCredentialRequest, j95, k95, GetCredentialException> {
    private static final String TAG = "GetCredentialController";
    public ah2 callback;
    private CancellationSignal cancellationSignal;
    private final Context context;
    public Executor executor;
    private final GetCredentialController$resultReceiver$1 resultReceiver;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Type inference failed for: r0v1, types: [androidx.credentials.playservices.controllers.identitycredentials.getcredential.GetCredentialController$resultReceiver$1] */
    public GetCredentialController(Context context) {
        super(context);
        context.getClass();
        this.context = context;
        final Handler handler = new Handler(Looper.getMainLooper());
        this.resultReceiver = new ResultReceiver(handler) { // from class: androidx.credentials.playservices.controllers.identitycredentials.getcredential.GetCredentialController$resultReceiver$1
            @Override // android.os.ResultReceiver
            public void onReceiveResult(int resultCode, Bundle resultData) {
                resultData.getClass();
                if (this.this$0.maybeReportErrorFromResultReceiver(resultData, new GetCredentialController$resultReceiver$1$onReceiveResult$1(CredentialProviderBaseController.INSTANCE), this.this$0.getExecutor(), this.this$0.getCallback(), this.this$0.cancellationSignal)) {
                    return;
                }
                ResponseUtils.INSTANCE.handleGetCredentialResponse(resultData.getInt(CredentialProviderBaseController.ACTIVITY_REQUEST_CODE_TAG), resultCode, (Intent) ht2.r0(resultData, CredentialProviderBaseController.RESULT_DATA_TAG, Intent.class), this.this$0.getExecutor(), this.this$0.getCallback(), this.this$0.cancellationSignal);
            }
        };
    }

    private final ch2 convertCredentialOptionToPlayServices(dh2 option) {
        option.getClass();
        return new ch2("com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL", option.a, option.b, "", "", "");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0(CancellationSignal cancellationSignal, GetCredentialController getCredentialController, Executor executor, ah2 ah2Var, y79 y79Var) {
        boolean zCancellationReviewer$credentials_play_services_auth = CredentialProviderPlayServicesImpl.INSTANCE.cancellationReviewer$credentials_play_services_auth(cancellationSignal);
        c1e c1eVar = c1e.a;
        if (zCancellationReviewer$credentials_play_services_auth) {
            return c1eVar;
        }
        Intent intent = new Intent(getCredentialController.context, (Class<?>) HiddenActivity.class);
        getCredentialController.generateHiddenActivityIntent(getCredentialController.resultReceiver, intent, CredentialProviderBaseController.BEGIN_SIGN_IN_TAG);
        intent.putExtra(CredentialProviderBaseController.EXTRA_FLOW_PENDING_INTENT, y79Var.a);
        try {
            getCredentialController.context.startActivity(intent);
            return c1eVar;
        } catch (Exception unused) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new dg2(executor, ah2Var, 8));
            return c1eVar;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0$0(Executor executor, ah2 ah2Var) {
        executor.execute(new zf2(ah2Var, 9));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$0$0$0(ah2 ah2Var) {
        ah2Var.a(new GetCredentialUnknownException(CredentialProviderController.ERROR_MESSAGE_START_ACTIVITY_FAILED));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$2(i95 i95Var, GetCredentialController getCredentialController, ah2 ah2Var, Executor executor, CancellationSignal cancellationSignal, Exception exc) {
        exc.getClass();
        if (CredentialProviderPlayServicesImpl.INSTANCE.isGetSignInIntentRequest$credentials_play_services_auth(i95Var)) {
            Log.w(TAG, "Pre-u credman get flow failed for get sign in intent; retrying with gis flow");
            new CredentialProviderGetSignInIntentController(getCredentialController.context).invokePlayServices(i95Var, ah2Var, executor, cancellationSignal);
        } else {
            Log.w(TAG, "Pre-u credman get flow failed; retrying with gis flow");
            new CredentialProviderBeginSignInController(getCredentialController.context).invokePlayServices(i95Var, ah2Var, executor, cancellationSignal);
        }
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public GetCredentialRequest convertRequestToPlayServices(i95 request) {
        request.getClass();
        Bundle bundle = new Bundle();
        bundle.putBoolean("androidx.credentials.BUNDLE_KEY_PREFER_IDENTITY_DOC_UI", false);
        bundle.putBoolean("androidx.credentials.BUNDLE_KEY_PREFER_IMMEDIATELY_AVAILABLE_CREDENTIALS", false);
        bundle.putParcelable("androidx.credentials.BUNDLE_KEY_PREFER_UI_BRANDING_COMPONENT_NAME", null);
        List list = request.a;
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            arrayList.add(convertCredentialOptionToPlayServices((dh2) it2.next()));
        }
        return new GetCredentialRequest(arrayList, bundle, null, new ResultReceiver(null));
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public k95 convertResponseToCredentialManager(j95 response) {
        response.getClass();
        wg2 wg2Var = response.a;
        return new k95(kng.t(wg2Var.a, wg2Var.b));
    }

    public final ah2 getCallback() {
        ah2 ah2Var = this.callback;
        if (ah2Var != null) {
            return ah2Var;
        }
        g76.g0("callback");
        throw null;
    }

    public final Context getContext() {
        return this.context;
    }

    public final Executor getExecutor() {
        Executor executor = this.executor;
        if (executor != null) {
            return executor;
        }
        g76.g0("executor");
        throw null;
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public void invokePlayServices(i95 request, final ah2 callback, final Executor executor, final CancellationSignal cancellationSignal) {
        request.getClass();
        callback.getClass();
        executor.getClass();
        this.cancellationSignal = cancellationSignal;
        setCallback(callback);
        setExecutor(executor);
        if (CredentialProviderPlayServicesImpl.INSTANCE.cancellationReviewer$credentials_play_services_auth(cancellationSignal)) {
            return;
        }
        GetCredentialRequest getCredentialRequestConvertRequestToPlayServices = convertRequestToPlayServices(request);
        Context context = this.context;
        context.getClass();
        jrg jrgVarC = new b66(context, b66.l, sy.T, yd5.c).c(getCredentialRequestConvertRequestToPlayServices);
        jrgVarC.e(yfd.a, new f70(21, new x45() { // from class: h95
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                return GetCredentialController.invokePlayServices$lambda$0(cancellationSignal, this, executor, callback, (y79) obj);
            }
        }));
        jrgVarC.c(new ii2(request, this, callback, executor, cancellationSignal));
    }

    public final void setCallback(ah2 ah2Var) {
        ah2Var.getClass();
        this.callback = ah2Var;
    }

    public final void setExecutor(Executor executor) {
        executor.getClass();
        this.executor = executor;
    }

    public static /* synthetic */ void getCallback$annotations() {
    }

    private static /* synthetic */ void getCancellationSignal$annotations() {
    }

    public static /* synthetic */ void getExecutor$annotations() {
    }
}
