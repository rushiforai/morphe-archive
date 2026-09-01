package androidx.credentials.playservices.controllers;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.util.Log;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.credentials.playservices.controllers.CredentialProviderBaseController;
import androidx.credentials.playservices.controllers.CredentialProviderController;
import defpackage.ah2;
import defpackage.ay0;
import defpackage.bi2;
import defpackage.c1e;
import defpackage.ci2;
import defpackage.dg2;
import defpackage.gy2;
import defpackage.k95;
import defpackage.kng;
import defpackage.m4;
import defpackage.m45;
import defpackage.pda;
import defpackage.qb8;
import defpackage.sw8;
import defpackage.xh2;
import defpackage.yh2;
import defpackage.zf2;
import java.util.concurrent.Executor;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\b\u0001\u0018\u0000 \u00042\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Landroidx/credentials/playservices/controllers/ResponseUtils;", "", "<init>", "()V", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class ResponseUtils {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static final String TAG = "GetCredentialController";

    public static final void handleGetCredentialResponse(int i, int i2, Intent intent, Executor executor, ah2 ah2Var, CancellationSignal cancellationSignal) {
        INSTANCE.handleGetCredentialResponse(i, i2, intent, executor, ah2Var, cancellationSignal);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003JO\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\b\u0010\b\u001a\u0004\u0018\u00010\u00072\u0006\u0010\n\u001a\u00020\t2\u0012\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u00020\r0\u000b2\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0007¢\u0006\u0004\b\u0012\u0010\u0013R\u0014\u0010\u0015\u001a\u00020\u00148\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Landroidx/credentials/playservices/controllers/ResponseUtils$Companion;", "", "<init>", "()V", "", "uniqueRequestCode", "resultCode", "Landroid/content/Intent;", "data", "Ljava/util/concurrent/Executor;", "executor", "Lah2;", "Lk95;", "Landroidx/credentials/exceptions/GetCredentialException;", "callback", "Landroid/os/CancellationSignal;", "cancellationSignal", "Lc1e;", "handleGetCredentialResponse", "(IILandroid/content/Intent;Ljava/util/concurrent/Executor;Lah2;Landroid/os/CancellationSignal;)V", "", "TAG", "Ljava/lang/String;", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final c1e handleGetCredentialResponse$lambda$0(CancellationSignal cancellationSignal, m45 m45Var) {
            m45Var.getClass();
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, m45Var);
            return c1e.a;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final c1e handleGetCredentialResponse$lambda$1(Executor executor, ah2 ah2Var, GetCredentialException getCredentialException) {
            getCredentialException.getClass();
            executor.execute(new yh2(ah2Var, getCredentialException, 1));
            return c1e.a;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final c1e handleGetCredentialResponse$lambda$2(Executor executor, ah2 ah2Var) {
            executor.execute(new zf2(ah2Var, 10));
            return c1e.a;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void handleGetCredentialResponse$lambda$2$0(ah2 ah2Var) {
            ah2Var.a(new GetCredentialUnknownException("No provider data returned."));
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final c1e handleGetCredentialResponse$lambda$3(Executor executor, ah2 ah2Var, k95 k95Var) {
            executor.execute(new bi2(ah2Var, k95Var, 1));
            return c1e.a;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final c1e handleGetCredentialResponse$lambda$4(Executor executor, ah2 ah2Var, GetCredentialException getCredentialException) {
            executor.execute(new yh2(ah2Var, getCredentialException, 2));
            return c1e.a;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void handleGetCredentialResponse$lambda$4$0(ah2 ah2Var, GetCredentialException getCredentialException) {
            if (getCredentialException == null) {
                getCredentialException = new GetCredentialUnknownException("No provider data returned");
            }
            ah2Var.a(getCredentialException);
        }

        public final void handleGetCredentialResponse(int uniqueRequestCode, int resultCode, Intent data, Executor executor, ah2 callback, CancellationSignal cancellationSignal) {
            String string;
            Bundle bundle;
            k95 k95Var;
            executor.getClass();
            callback.getClass();
            CredentialProviderBaseController.Companion companion = CredentialProviderBaseController.INSTANCE;
            if (uniqueRequestCode != companion.getCONTROLLER_REQUEST_CODE$credentials_play_services_auth()) {
                Log.w(ResponseUtils.TAG, "Returned request code " + companion.getCONTROLLER_REQUEST_CODE$credentials_play_services_auth() + " which  does not match what was given " + uniqueRequestCode);
                return;
            }
            CredentialProviderController.Companion companion2 = CredentialProviderController.INSTANCE;
            int i = 9;
            if (companion2.maybeReportErrorResultCodeGet$credentials_play_services_auth(resultCode, new sw8(17), new pda(executor, i, callback), cancellationSignal)) {
                return;
            }
            if (data == null) {
                companion2.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new dg2(executor, callback, i));
                return;
            }
            int i2 = Build.VERSION.SDK_INT;
            GetCredentialException getCredentialExceptionE0 = null;
            if (i2 >= 34) {
                k95Var = m4.g(data);
            } else {
                Bundle bundleExtra = data.getBundleExtra("android.service.credentials.extra.GET_CREDENTIAL_RESPONSE");
                k95Var = (bundleExtra == null || (string = bundleExtra.getString("androidx.credentials.provider.extra.EXTRA_CREDENTIAL_TYPE")) == null || (bundle = bundleExtra.getBundle("androidx.credentials.provider.extra.EXTRA_CREDENTIAL_DATA")) == null) ? null : new k95(kng.t(string, bundle));
            }
            int i3 = 1;
            if (k95Var != null) {
                companion2.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new ci2(executor, callback, k95Var, i3));
                return;
            }
            if (i2 >= 34) {
                getCredentialExceptionE0 = m4.f(data);
            } else {
                int i4 = GetCredentialException.a;
                Bundle bundleExtra2 = data.getBundleExtra("android.service.credentials.extra.GET_CREDENTIAL_EXCEPTION");
                if (bundleExtra2 != null) {
                    String string2 = bundleExtra2.getString("androidx.credentials.provider.extra.CREATE_CREDENTIAL_EXCEPTION_TYPE");
                    if (string2 == null) {
                        ay0.e("Bundle was missing exception type.");
                        return;
                    }
                    getCredentialExceptionE0 = qb8.e0(bundleExtra2.getCharSequence("androidx.credentials.provider.extra.CREATE_CREDENTIAL_EXCEPTION_MESSAGE"), string2);
                }
            }
            companion2.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new xh2(executor, callback, getCredentialExceptionE0, i3));
        }

        private Companion() {
        }
    }
}
