package androidx.credentials.playservices.controllers.blockstore.getrestorecredential;

import android.content.Context;
import android.os.CancellationSignal;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.credentials.exceptions.NoCredentialException;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.CredentialProviderController;
import androidx.credentials.playservices.controllers.blockstore.getrestorecredential.CredentialProviderGetRestoreCredentialController;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import defpackage.ah2;
import defpackage.ai2;
import defpackage.b66;
import defpackage.bi2;
import defpackage.c1e;
import defpackage.ci2;
import defpackage.da4;
import defpackage.dh2;
import defpackage.ef2;
import defpackage.f70;
import defpackage.ff2;
import defpackage.g76;
import defpackage.i95;
import defpackage.jrg;
import defpackage.k95;
import defpackage.kng;
import defpackage.pkf;
import defpackage.qh2;
import defpackage.rh2;
import defpackage.rya;
import defpackage.sy;
import defpackage.vb5;
import defpackage.w2g;
import defpackage.wb5;
import defpackage.wv0;
import defpackage.x45;
import defpackage.yd5;
import defpackage.yfd;
import java.util.concurrent.Executor;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\b\u0000\u0018\u00002 \u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0001B\u000f\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ=\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000b\u001a\u00020\u00022\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\f2\u0006\u0010\u000f\u001a\u00020\u000e2\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0017\u0010\u0015\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0017\u0010\u0018\u001a\u00020\u00052\u0006\u0010\u0017\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\u0018\u0010\u0019R\u0014\u0010\b\u001a\u00020\u00078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001a¨\u0006\u001b"}, d2 = {"Landroidx/credentials/playservices/controllers/blockstore/getrestorecredential/CredentialProviderGetRestoreCredentialController;", "Landroidx/credentials/playservices/controllers/CredentialProviderController;", "Li95;", "Lvb5;", "Lwb5;", "Lk95;", "Landroidx/credentials/exceptions/GetCredentialException;", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "request", "Lah2;", "callback", "Ljava/util/concurrent/Executor;", "executor", "Landroid/os/CancellationSignal;", "cancellationSignal", "Lc1e;", "invokePlayServices", "(Li95;Lah2;Ljava/util/concurrent/Executor;Landroid/os/CancellationSignal;)V", "convertRequestToPlayServices", "(Li95;)Lvb5;", "response", "convertResponseToCredentialManager", "(Lwb5;)Lk95;", "Landroid/content/Context;", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class CredentialProviderGetRestoreCredentialController extends CredentialProviderController<i95, vb5, wb5, k95, GetCredentialException> {
    private final Context context;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CredentialProviderGetRestoreCredentialController(Context context) {
        super(context);
        context.getClass();
        this.context = context;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0(CredentialProviderGetRestoreCredentialController credentialProviderGetRestoreCredentialController, CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var, wb5 wb5Var) {
        try {
            wb5Var.getClass();
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new ci2(executor, ah2Var, credentialProviderGetRestoreCredentialController.convertResponseToCredentialManager(wb5Var), 0));
        } catch (Exception e) {
            CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new ef2(executor, ah2Var, e, 2));
        }
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0$0(Executor executor, ah2 ah2Var, k95 k95Var) {
        executor.execute(new bi2(ah2Var, k95Var, 0));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$0$1(Executor executor, ah2 ah2Var, Exception exc) {
        executor.execute(new ff2(ah2Var, exc, 2));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$0$1$0(ah2 ah2Var, Exception exc) {
        ah2Var.a(exc instanceof NoCredentialException ? (GetCredentialException) exc : new GetCredentialUnknownException(exc.getMessage()));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$2(CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var, Exception exc) {
        exc.getClass();
        rya ryaVar = new rya();
        ryaVar.a = new GetCredentialUnknownException("Get restore credential failed for unknown reason, failure: " + exc.getMessage());
        if (exc instanceof ApiException) {
            Status status = ((ApiException) exc).a;
            if (status.a == 40201) {
                ryaVar.a = new GetCredentialUnknownException("The restore credential internal service had a failure, failure: " + exc.getMessage());
            } else {
                ryaVar.a = new GetCredentialUnknownException("The restore credential service failed with unsupported status code, failure: " + exc.getMessage() + ", status code: " + status.a);
            }
        }
        CredentialProviderController.INSTANCE.cancelOrCallbackExceptionOrResult$credentials_play_services_auth(cancellationSignal, new qh2(executor, ah2Var, ryaVar, 1));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e invokePlayServices$lambda$2$0(Executor executor, ah2 ah2Var, rya ryaVar) {
        executor.execute(new rh2(ah2Var, ryaVar, 1));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$2$0$0(ah2 ah2Var, rya ryaVar) {
        ah2Var.a(ryaVar.a);
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public vb5 convertRequestToPlayServices(i95 request) {
        request.getClass();
        for (dh2 dh2Var : request.a) {
        }
        g76.g0("credentialOption");
        throw null;
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public k95 convertResponseToCredentialManager(wb5 response) {
        response.getClass();
        return new k95(kng.t("androidx.credentials.TYPE_RESTORE_CREDENTIAL", response.a));
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public void invokePlayServices(i95 request, final ah2 callback, final Executor executor, final CancellationSignal cancellationSignal) {
        request.getClass();
        callback.getClass();
        executor.getClass();
        if (CredentialProviderPlayServicesImpl.INSTANCE.cancellationReviewer$credentials_play_services_auth(cancellationSignal)) {
            return;
        }
        vb5 vb5VarConvertRequestToPlayServices = convertRequestToPlayServices(request);
        Context context = this.context;
        context.getClass();
        b66 b66Var = new b66(context, b66.m, sy.T, yd5.c);
        vb5VarConvertRequestToPlayServices.getClass();
        wv0 wv0VarB = wv0.b();
        wv0VarB.e = new da4[]{w2g.t};
        pkf pkfVar = new pkf();
        pkfVar.a = vb5VarConvertRequestToPlayServices;
        wv0VarB.d = pkfVar;
        wv0VarB.b = 1695;
        jrg jrgVarB = b66Var.b(0, wv0VarB.a());
        jrgVarB.getClass();
        jrgVarB.e(yfd.a, new f70(12, new x45() { // from class: zh2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                return CredentialProviderGetRestoreCredentialController.invokePlayServices$lambda$0(this.a, cancellationSignal, executor, callback, (wb5) obj);
            }
        }));
        jrgVarB.c(new ai2(cancellationSignal, executor, callback, 0));
    }
}
