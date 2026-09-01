package androidx.credentials.playservices.controllers.blockstore.createrestorecredential;

import android.content.Context;
import android.os.Bundle;
import android.os.CancellationSignal;
import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.exceptions.CreateCredentialUnknownException;
import androidx.credentials.exceptions.restorecredential.CreateRestoreCredentialDomException;
import androidx.credentials.exceptions.restorecredential.E2eeUnavailableException;
import androidx.credentials.playservices.controllers.CredentialProviderController;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import defpackage.ah2;
import defpackage.ay0;
import defpackage.bf2;
import defpackage.c1e;
import defpackage.cf2;
import defpackage.ef2;
import defpackage.eg2;
import defpackage.ff2;
import defpackage.jg2;
import defpackage.kg2;
import defpackage.le0;
import defpackage.lg2;
import defpackage.qh2;
import defpackage.rd6;
import defpackage.rh2;
import defpackage.rya;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\b\u0000\u0018\u00002 \u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0001B\u000f\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ=\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000b\u001a\u00020\u00022\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\f2\u0006\u0010\u000f\u001a\u00020\u000e2\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0017\u0010\u0015\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0017\u0010\u0018\u001a\u00020\u00052\u0006\u0010\u0017\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\u0018\u0010\u0019R\u0014\u0010\b\u001a\u00020\u00078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001a¨\u0006\u001b"}, d2 = {"Landroidx/credentials/playservices/controllers/blockstore/createrestorecredential/CredentialProviderCreateRestoreCredentialController;", "Landroidx/credentials/playservices/controllers/CredentialProviderController;", "Lkg2;", "Ljg2;", "Llg2;", "Lbf2;", "Landroidx/credentials/exceptions/CreateCredentialException;", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "request", "Lah2;", "callback", "Ljava/util/concurrent/Executor;", "executor", "Landroid/os/CancellationSignal;", "cancellationSignal", "Lc1e;", "invokePlayServices", "(Lkg2;Lah2;Ljava/util/concurrent/Executor;Landroid/os/CancellationSignal;)V", "convertRequestToPlayServices", "(Lkg2;)Ljg2;", "response", "convertResponseToCredentialManager", "(Llg2;)Lbf2;", "Landroid/content/Context;", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class CredentialProviderCreateRestoreCredentialController extends CredentialProviderController<kg2, jg2, lg2, bf2, CreateCredentialException> {
    private final Context context;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CredentialProviderCreateRestoreCredentialController(Context context) {
        super(context);
        context.getClass();
        this.context = context;
    }

    private static final c1e invokePlayServices$lambda$0(CredentialProviderCreateRestoreCredentialController credentialProviderCreateRestoreCredentialController, CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var, lg2 lg2Var) {
        try {
            lg2Var.getClass();
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new le0(executor, ah2Var, credentialProviderCreateRestoreCredentialController.convertResponseToCredentialManager(lg2Var), 15));
        } catch (Exception e) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new ef2(executor, ah2Var, e, 1));
        }
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0$0(Executor executor, ah2 ah2Var, bf2 bf2Var) {
        executor.execute(new eg2(ah2Var, bf2Var, 1));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0$1(Executor executor, ah2 ah2Var, Exception exc) {
        executor.execute(new ff2(ah2Var, exc, 1));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$0$1$0(ah2 ah2Var, Exception exc) {
        ah2Var.a(new CreateCredentialUnknownException(exc.getMessage()));
    }

    private static final void invokePlayServices$lambda$2(CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var, Exception exc) {
        exc.getClass();
        rya ryaVar = new rya();
        ryaVar.a = new CreateCredentialUnknownException("Create restore credential failed for unknown reason, failure: " + exc.getMessage());
        if (exc instanceof ApiException) {
            Status status = ((ApiException) exc).a;
            switch (status.a) {
                case 40201:
                    ryaVar.a = new CreateCredentialUnknownException("The restore credential internal service had a failure, failure: " + exc.getMessage());
                    break;
                case 40202:
                    ryaVar.a = new CreateRestoreCredentialDomException("The request did not match the fido spec, failure: " + exc.getMessage(), "androidx.credentials.TYPE_CREATE_RESTORE_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_DATA_ERROR");
                    break;
                case 40203:
                    ryaVar.a = new E2eeUnavailableException("E2ee is not available on the device. Check whether the backup and screen lock are enabled.", "androidx.credentials.TYPE_E2EE_UNAVAILABLE_EXCEPTION");
                    break;
                default:
                    ryaVar.a = new CreateCredentialUnknownException("The restore credential service failed with unsupported status code, failure: " + exc.getMessage() + ", status code: " + status.a);
                    break;
            }
        }
        CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new qh2(executor, ah2Var, ryaVar, 0));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$2$0(Executor executor, ah2 ah2Var, rya ryaVar) {
        executor.execute(new rh2(ah2Var, ryaVar, 0));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$2$0$0(ah2 ah2Var, rya ryaVar) {
        ah2Var.a(ryaVar.a);
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public /* synthetic */ jg2 convertRequestToPlayServices(kg2 kg2Var) {
        if (kg2Var == null) {
            return convertRequestToPlayServices2((kg2) null);
        }
        rd6.m();
        return null;
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public bf2 convertResponseToCredentialManager(lg2 response) throws CreateCredentialUnknownException {
        response.getClass();
        Bundle bundle = response.a;
        bundle.getClass();
        String string = bundle.getString("androidx.credentials.BUNDLE_KEY_CREATE_RESTORE_CREDENTIAL_RESPONSE");
        if (string == null) {
            throw new CreateCredentialUnknownException("The response bundle did not contain the response data. This should not happen.");
        }
        cf2 cf2Var = new cf2();
        if (string.length() != 0) {
            try {
                new JSONObject(string);
                return cf2Var;
            } catch (Exception unused) {
            }
        }
        ay0.e("registrationResponseJson must not be empty, and must be a valid JSON");
        return null;
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public /* synthetic */ void invokePlayServices(kg2 kg2Var, ah2 ah2Var, Executor executor, CancellationSignal cancellationSignal) {
        if (kg2Var == null) {
            invokePlayServices2((kg2) null, ah2Var, executor, cancellationSignal);
        } else {
            rd6.m();
        }
    }

    /* JADX INFO: renamed from: invokePlayServices, reason: avoid collision after fix types in other method */
    public void invokePlayServices2(kg2 request, ah2 callback, Executor executor, CancellationSignal cancellationSignal) {
        throw null;
    }

    /* JADX INFO: renamed from: convertRequestToPlayServices, reason: avoid collision after fix types in other method */
    public jg2 convertRequestToPlayServices2(kg2 request) {
        throw null;
    }
}
