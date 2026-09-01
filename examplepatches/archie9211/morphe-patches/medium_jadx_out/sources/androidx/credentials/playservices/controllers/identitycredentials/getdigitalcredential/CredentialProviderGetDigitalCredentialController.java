package androidx.credentials.playservices.controllers.identitycredentials.getdigitalcredential;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Handler;
import android.os.Looper;
import android.os.ResultReceiver;
import androidx.credentials.exceptions.GetCredentialCancellationException;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.GetCredentialInterruptedException;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.CredentialProviderBaseController;
import androidx.credentials.playservices.controllers.CredentialProviderController;
import androidx.credentials.playservices.controllers.ResponseUtils;
import androidx.credentials.playservices.controllers.identitycredentials.IdentityCredentialApiHiddenActivity;
import androidx.credentials.playservices.controllers.identitycredentials.getdigitalcredential.CredentialProviderGetDigitalCredentialController;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.identitycredentials.GetCredentialRequest;
import defpackage.ah2;
import defpackage.b66;
import defpackage.c1e;
import defpackage.dh2;
import defpackage.f70;
import defpackage.g76;
import defpackage.gy2;
import defpackage.ht2;
import defpackage.i95;
import defpackage.j95;
import defpackage.jrg;
import defpackage.k95;
import defpackage.kng;
import defpackage.qb8;
import defpackage.sy;
import defpackage.wh2;
import defpackage.x45;
import defpackage.xh2;
import defpackage.y79;
import defpackage.yd5;
import defpackage.yfd;
import defpackage.yh2;
import java.util.ArrayList;
import java.util.concurrent.Executor;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000M\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0003\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0017\n\u0002\b\u0006*\u0001.\b\u0001\u0018\u0000 22 \u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0001:\u00012B\u000f\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u0017\u0010\r\u001a\u00020\u00062\u0006\u0010\f\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\r\u0010\u000eJ=\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u000f\u001a\u00020\u00022\u0012\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u00102\u0006\u0010\u0013\u001a\u00020\u00122\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u0017\u0010\u0019\u001a\u00020\u00032\u0006\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0017\u0010\u001c\u001a\u00020\u00052\u0006\u0010\u001b\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\u001c\u0010\u001dR\u0014\u0010\b\u001a\u00020\u00078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001eR4\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u00108\u0006@\u0006X\u0087.¢\u0006\u0018\n\u0004\b\u0011\u0010\u001f\u0012\u0004\b$\u0010%\u001a\u0004\b \u0010!\"\u0004\b\"\u0010#R(\u0010\u0013\u001a\u00020\u00128\u0006@\u0006X\u0087.¢\u0006\u0018\n\u0004\b\u0013\u0010&\u0012\u0004\b+\u0010%\u001a\u0004\b'\u0010(\"\u0004\b)\u0010*R\u001e\u0010\u0015\u001a\u0004\u0018\u00010\u00148\u0002@\u0002X\u0083\u000e¢\u0006\f\n\u0004\b\u0015\u0010,\u0012\u0004\b-\u0010%R\u001a\u0010/\u001a\u00020.8\u0002X\u0082\u0004¢\u0006\f\n\u0004\b/\u00100\u0012\u0004\b1\u0010%¨\u00063"}, d2 = {"Landroidx/credentials/playservices/controllers/identitycredentials/getdigitalcredential/CredentialProviderGetDigitalCredentialController;", "Landroidx/credentials/playservices/controllers/CredentialProviderController;", "Li95;", "Lcom/google/android/gms/identitycredentials/GetCredentialRequest;", "Lj95;", "Lk95;", "Landroidx/credentials/exceptions/GetCredentialException;", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "", "e", "fromGmsException", "(Ljava/lang/Throwable;)Landroidx/credentials/exceptions/GetCredentialException;", "request", "Lah2;", "callback", "Ljava/util/concurrent/Executor;", "executor", "Landroid/os/CancellationSignal;", "cancellationSignal", "Lc1e;", "invokePlayServices", "(Li95;Lah2;Ljava/util/concurrent/Executor;Landroid/os/CancellationSignal;)V", "convertRequestToPlayServices", "(Li95;)Lcom/google/android/gms/identitycredentials/GetCredentialRequest;", "response", "convertResponseToCredentialManager", "(Lj95;)Lk95;", "Landroid/content/Context;", "Lah2;", "getCallback", "()Lah2;", "setCallback", "(Lah2;)V", "getCallback$annotations", "()V", "Ljava/util/concurrent/Executor;", "getExecutor", "()Ljava/util/concurrent/Executor;", "setExecutor", "(Ljava/util/concurrent/Executor;)V", "getExecutor$annotations", "Landroid/os/CancellationSignal;", "getCancellationSignal$annotations", "androidx/credentials/playservices/controllers/identitycredentials/getdigitalcredential/CredentialProviderGetDigitalCredentialController$resultReceiver$1", "resultReceiver", "Landroidx/credentials/playservices/controllers/identitycredentials/getdigitalcredential/CredentialProviderGetDigitalCredentialController$resultReceiver$1;", "getResultReceiver$annotations", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class CredentialProviderGetDigitalCredentialController extends CredentialProviderController<i95, GetCredentialRequest, j95, k95, GetCredentialException> {
    private static final Companion Companion = new Companion(null);
    private static final String TAG = "DigitalCredentialClient";
    public ah2 callback;
    private CancellationSignal cancellationSignal;
    private final Context context;
    public Executor executor;
    private final CredentialProviderGetDigitalCredentialController$resultReceiver$1 resultReceiver;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Type inference failed for: r0v1, types: [androidx.credentials.playservices.controllers.identitycredentials.getdigitalcredential.CredentialProviderGetDigitalCredentialController$resultReceiver$1] */
    public CredentialProviderGetDigitalCredentialController(Context context) {
        super(context);
        context.getClass();
        this.context = context;
        final Handler handler = new Handler(Looper.getMainLooper());
        this.resultReceiver = new ResultReceiver(handler) { // from class: androidx.credentials.playservices.controllers.identitycredentials.getdigitalcredential.CredentialProviderGetDigitalCredentialController$resultReceiver$1
            @Override // android.os.ResultReceiver
            public void onReceiveResult(int resultCode, Bundle resultData) {
                resultData.getClass();
                if (this.this$0.maybeReportErrorFromResultReceiver(resultData, new CredentialProviderGetDigitalCredentialController$resultReceiver$1$onReceiveResult$1(CredentialProviderBaseController.INSTANCE), this.this$0.getExecutor(), this.this$0.getCallback(), this.this$0.cancellationSignal)) {
                    return;
                }
                ResponseUtils.INSTANCE.handleGetCredentialResponse(resultData.getInt(CredentialProviderBaseController.ACTIVITY_REQUEST_CODE_TAG), resultCode, (Intent) ht2.r0(resultData, CredentialProviderBaseController.RESULT_DATA_TAG, Intent.class), this.this$0.getExecutor(), this.this$0.getCallback(), this.this$0.cancellationSignal);
            }
        };
    }

    private final GetCredentialException fromGmsException(Throwable e) {
        if (e instanceof com.google.android.gms.identitycredentials.GetCredentialException) {
            qb8.e0(e.getMessage(), null);
            throw null;
        }
        if (!(e instanceof ApiException)) {
            return new GetCredentialUnknownException("Get digital credential failed, failure: " + e);
        }
        int i = ((ApiException) e).a.a;
        if (i == 16) {
            return new GetCredentialCancellationException(e.getMessage());
        }
        if (CredentialProviderBaseController.INSTANCE.getRetryables().contains(Integer.valueOf(i))) {
            return new GetCredentialInterruptedException(e.getMessage());
        }
        return new GetCredentialUnknownException("Get digital credential failed, failure: " + e);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0(CancellationSignal cancellationSignal, CredentialProviderGetDigitalCredentialController credentialProviderGetDigitalCredentialController, y79 y79Var) {
        boolean zCancellationReviewer$credentials_play_services_auth = CredentialProviderPlayServicesImpl.INSTANCE.cancellationReviewer$credentials_play_services_auth(cancellationSignal);
        c1e c1eVar = c1e.a;
        if (zCancellationReviewer$credentials_play_services_auth) {
            return c1eVar;
        }
        Intent intent = new Intent(credentialProviderGetDigitalCredentialController.context, (Class<?>) IdentityCredentialApiHiddenActivity.class);
        intent.setFlags(ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        intent.putExtra(CredentialProviderBaseController.RESULT_RECEIVER_TAG, credentialProviderGetDigitalCredentialController.toIpcFriendlyResultReceiver(credentialProviderGetDigitalCredentialController.resultReceiver));
        intent.putExtra(CredentialProviderBaseController.EXTRA_FLOW_PENDING_INTENT, y79Var.a);
        intent.putExtra(CredentialProviderBaseController.EXTRA_ERROR_NAME, CredentialProviderBaseController.GET_UNKNOWN);
        credentialProviderGetDigitalCredentialController.context.startActivity(intent);
        return c1eVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$2(CredentialProviderGetDigitalCredentialController credentialProviderGetDigitalCredentialController, CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var, Exception exc) {
        exc.getClass();
        CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new xh2(executor, ah2Var, credentialProviderGetDigitalCredentialController.fromGmsException(exc), 0));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$2$0(Executor executor, ah2 ah2Var, GetCredentialException getCredentialException) {
        executor.execute(new yh2(ah2Var, getCredentialException, 0));
        return c1e.a;
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public GetCredentialRequest convertRequestToPlayServices(i95 request) {
        request.getClass();
        ArrayList arrayList = new ArrayList();
        for (dh2 dh2Var : request.a) {
        }
        Bundle bundle = new Bundle();
        bundle.putBoolean("androidx.credentials.BUNDLE_KEY_PREFER_IDENTITY_DOC_UI", false);
        bundle.putBoolean("androidx.credentials.BUNDLE_KEY_PREFER_IMMEDIATELY_AVAILABLE_CREDENTIALS", false);
        bundle.putParcelable("androidx.credentials.BUNDLE_KEY_PREFER_UI_BRANDING_COMPONENT_NAME", null);
        return new GetCredentialRequest(arrayList, bundle, null, new ResultReceiver(null));
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public k95 convertResponseToCredentialManager(j95 response) {
        response.getClass();
        return new k95(kng.t("androidx.credentials.TYPE_DIGITAL_CREDENTIAL", response.a.b));
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
        GetCredentialRequest getCredentialRequestConvertRequestToPlayServices = convertRequestToPlayServices(request);
        Context context = this.context;
        context.getClass();
        jrg jrgVarC = new b66(context, b66.l, sy.T, yd5.c).c(getCredentialRequestConvertRequestToPlayServices);
        jrgVarC.e(yfd.a, new f70(11, new x45() { // from class: vh2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                return CredentialProviderGetDigitalCredentialController.invokePlayServices$lambda$0(cancellationSignal, this, (y79) obj);
            }
        }));
        jrgVarC.c(new wh2(this, cancellationSignal, executor, callback, 0));
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
    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0006"}, d2 = {"Landroidx/credentials/playservices/controllers/identitycredentials/getdigitalcredential/CredentialProviderGetDigitalCredentialController$Companion;", "", "<init>", "()V", "TAG", "", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
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

    private static /* synthetic */ void getResultReceiver$annotations() {
    }
}
