package androidx.credentials.playservices;

import android.content.Context;
import android.os.CancellationSignal;
import android.util.Log;
import androidx.credentials.exceptions.ClearCredentialProviderConfigurationException;
import androidx.credentials.exceptions.ClearCredentialUnknownException;
import androidx.credentials.exceptions.CreateCredentialProviderConfigurationException;
import androidx.credentials.exceptions.GetCredentialProviderConfigurationException;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.blockstore.getrestorecredential.CredentialProviderGetRestoreCredentialController;
import androidx.credentials.playservices.controllers.identityauth.beginsignin.CredentialProviderBeginSignInController;
import androidx.credentials.playservices.controllers.identityauth.getsigninintent.CredentialProviderGetSignInIntentController;
import androidx.credentials.playservices.controllers.identitycredentials.getcredential.GetCredentialController;
import androidx.credentials.playservices.controllers.identitycredentials.getdigitalcredential.CredentialProviderGetDigitalCredentialController;
import com.google.android.gms.common.api.ApiException;
import defpackage.ae5;
import defpackage.ah2;
import defpackage.ai2;
import defpackage.b66;
import defpackage.bc5;
import defpackage.c1e;
import defpackage.ckf;
import defpackage.da4;
import defpackage.dg2;
import defpackage.dh2;
import defpackage.ee5;
import defpackage.ef2;
import defpackage.eh2;
import defpackage.f70;
import defpackage.ff2;
import defpackage.guc;
import defpackage.gy2;
import defpackage.gz9;
import defpackage.h42;
import defpackage.i95;
import defpackage.ii2;
import defpackage.io1;
import defpackage.jo1;
import defpackage.jrg;
import defpackage.ko1;
import defpackage.m40;
import defpackage.m45;
import defpackage.p7f;
import defpackage.po1;
import defpackage.pxf;
import defpackage.qh2;
import defpackage.rd6;
import defpackage.rh2;
import defpackage.ry;
import defpackage.rya;
import defpackage.rz2;
import defpackage.sy;
import defpackage.udc;
import defpackage.ujf;
import defpackage.w2g;
import defpackage.wh2;
import defpackage.wif;
import defpackage.wv0;
import defpackage.x45;
import defpackage.yd5;
import defpackage.yfd;
import defpackage.ze2;
import defpackage.zf2;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.Executor;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0080\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\n\b\u0007\u0018\u0000 52\u00020\u0001:\u00015B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005JE\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u00062\b\u0010\t\u001a\u0004\u0018\u00010\b2\u0006\u0010\u000b\u001a\u00020\n2\u0012\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u000e0\fH\u0017¢\u0006\u0004\b\u0011\u0010\u0012JE\u0010\u0016\u001a\u00020\u00102\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u00132\b\u0010\t\u001a\u0004\u0018\u00010\b2\u0006\u0010\u000b\u001a\u00020\n2\u0012\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u00150\fH\u0017¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0015\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001c\u001a\u00020\u001b¢\u0006\u0004\b\u0019\u0010\u001dJ?\u0010!\u001a\u00020\u00102\u0006\u0010\u0007\u001a\u00020\u001e2\b\u0010\t\u001a\u0004\u0018\u00010\b2\u0006\u0010\u000b\u001a\u00020\n2\u0014\u0010\u000f\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\u001f\u0012\u0004\u0012\u00020 0\fH\u0016¢\u0006\u0004\b!\u0010\"J3\u0010&\u001a\u00020\u00102\u0006\u0010\u0007\u001a\u00020#2\u0006\u0010\u000b\u001a\u00020\n2\u0012\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020$\u0012\u0004\u0012\u00020%0\fH\u0016¢\u0006\u0004\b&\u0010'J\u001f\u0010(\u001a\u00020\u001b2\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u001c\u001a\u00020\u001bH\u0002¢\u0006\u0004\b(\u0010)J?\u0010*\u001a\u00020\u00102\u0006\u0010\u0007\u001a\u00020\u001e2\b\u0010\t\u001a\u0004\u0018\u00010\b2\u0006\u0010\u000b\u001a\u00020\n2\u0014\u0010\u000f\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\u001f\u0012\u0004\u0012\u00020 0\fH\u0002¢\u0006\u0004\b*\u0010\"R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010+R(\u0010-\u001a\u00020,8\u0006@\u0006X\u0087\u000e¢\u0006\u0018\n\u0004\b-\u0010.\u0012\u0004\b3\u00104\u001a\u0004\b/\u00100\"\u0004\b1\u00102¨\u00066"}, d2 = {"Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;", "Leh2;", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "Li95;", "request", "Landroid/os/CancellationSignal;", "cancellationSignal", "Ljava/util/concurrent/Executor;", "executor", "Lah2;", "Lk95;", "Landroidx/credentials/exceptions/GetCredentialException;", "callback", "Lc1e;", "onGetCredential", "(Landroid/content/Context;Li95;Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Lah2;)V", "Lze2;", "Lbf2;", "Landroidx/credentials/exceptions/CreateCredentialException;", "onCreateCredential", "(Landroid/content/Context;Lze2;Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Lah2;)V", "", "isAvailableOnDevice", "()Z", "", "minApkVersion", "(I)Z", "Ljo1;", "Ljava/lang/Void;", "Landroidx/credentials/exceptions/ClearCredentialException;", "onClearCredential", "(Ljo1;Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Lah2;)V", "Ludc;", "Lwdc;", "Landroidx/credentials/exceptions/publickeycredential/SignalCredentialStateException;", "onSignalCredentialState", "(Ludc;Ljava/util/concurrent/Executor;Lah2;)V", "isGooglePlayServicesAvailable", "(Landroid/content/Context;I)I", "runFallbackClearCredFlow", "Landroid/content/Context;", "Lae5;", "googleApiAvailability", "Lae5;", "getGoogleApiAvailability", "()Lae5;", "setGoogleApiAvailability", "(Lae5;)V", "getGoogleApiAvailability$annotations", "()V", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class CredentialProviderPlayServicesImpl implements eh2 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    public static final int MIN_GMS_APK_VERSION = 230815045;
    public static final int MIN_GMS_APK_VERSION_DIGITAL_CRED = 243100000;
    public static final int MIN_GMS_APK_VERSION_RESTORE_CRED = 242200000;
    public static final int MIN_GMS_APK_VERSION_SIGNAL_API = 254625000;
    public static final int PRE_U_MIN_GMS_APK_VERSION = 252400000;
    private static final String TAG = "PlayServicesImpl";
    private final Context context;
    private ae5 googleApiAvailability;

    public CredentialProviderPlayServicesImpl(Context context) {
        context.getClass();
        this.context = context;
        this.googleApiAvailability = ae5.e;
    }

    private final int isGooglePlayServicesAvailable(Context context, int minApkVersion) {
        return this.googleApiAvailability.c(context, minApkVersion);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e onClearCredential$lambda$0(Executor executor, ah2 ah2Var) {
        executor.execute(new zf2(ah2Var, 5));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void onClearCredential$lambda$0$0(ah2 ah2Var) {
        ah2Var.a(new ClearCredentialProviderConfigurationException());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e onClearCredential$lambda$1(CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var, Boolean bool) {
        INSTANCE.cancellationReviewerWithCallback$credentials_play_services_auth(cancellationSignal, new dg2(executor, ah2Var, 6));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e onClearCredential$lambda$1$0(Executor executor, ah2 ah2Var) {
        Log.i(TAG, "Cleared restore credential successfully!");
        executor.execute(new zf2(ah2Var, 7));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void onClearCredential$lambda$3(CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var, Exception exc) {
        exc.getClass();
        Log.w(TAG, "Clearing restore credential failed", exc);
        rya ryaVar = new rya();
        ryaVar.a = new ClearCredentialUnknownException("Clear restore credential failed for unknown reason.");
        if ((exc instanceof ApiException) && ((ApiException) exc).a.a == 40201) {
            ryaVar.a = new ClearCredentialUnknownException("The restore credential internal service had a failure.");
        }
        INSTANCE.cancellationReviewerWithCallback$credentials_play_services_auth(cancellationSignal, new qh2(executor, ah2Var, ryaVar, 2));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e onClearCredential$lambda$3$0(Executor executor, ah2 ah2Var, rya ryaVar) {
        executor.execute(new rh2(ah2Var, ryaVar, 2));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void onClearCredential$lambda$3$0$0(ah2 ah2Var, rya ryaVar) {
        ah2Var.a(ryaVar.a);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e onClearCredential$lambda$4(CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var, ko1 ko1Var) {
        INSTANCE.cancellationReviewerWithCallback$credentials_play_services_auth(cancellationSignal, new dg2(executor, ah2Var, 4));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e onClearCredential$lambda$4$0(Executor executor, ah2 ah2Var) {
        Log.i(TAG, "During clear credential, signed out successfully!");
        executor.execute(new zf2(ah2Var, 4));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void onClearCredential$lambda$6(CredentialProviderPlayServicesImpl credentialProviderPlayServicesImpl, jo1 jo1Var, CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var, Exception exc) {
        exc.getClass();
        Log.e(TAG, "GMS Clear credential flow failed, calling fallback");
        credentialProviderPlayServicesImpl.runFallbackClearCredFlow(jo1Var, cancellationSignal, executor, ah2Var);
    }

    private static final c1e onCreateCredential$lambda$0(Executor executor, ah2 ah2Var) {
        executor.execute(new zf2(ah2Var, 6));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void onCreateCredential$lambda$0$0(ah2 ah2Var) {
        ah2Var.a(new CreateCredentialProviderConfigurationException("createCredentialAsync no provider dependencies found - please ensure the desired provider dependencies are added"));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e onGetCredential$lambda$0(Executor executor, ah2 ah2Var) {
        executor.execute(new zf2(ah2Var, 3));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void onGetCredential$lambda$0$0(ah2 ah2Var) {
        ah2Var.a(new GetCredentialProviderConfigurationException("this device requires a Google Play Services update for the given feature to be supported"));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e onGetCredential$lambda$1(Executor executor, ah2 ah2Var) {
        executor.execute(new zf2(ah2Var, 2));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void onGetCredential$lambda$1$0(ah2 ah2Var) {
        ah2Var.a(new GetCredentialProviderConfigurationException("getCredentialAsync no provider dependencies found - please ensure the desired provider dependencies are added"));
    }

    private final void runFallbackClearCredFlow(jo1 request, final CancellationSignal cancellationSignal, final Executor executor, final ah2 callback) {
        ckf ckfVarJ = guc.J(this.context);
        ckfVarJ.a.getSharedPreferences("com.google.android.gms.signin", 0).edit().clear().apply();
        Set set = wif.b;
        synchronized (set) {
        }
        Iterator it2 = set.iterator();
        if (it2.hasNext()) {
            ((wif) it2.next()).getClass();
            rd6.b();
            return;
        }
        ee5.a();
        wv0 wv0VarB = wv0.b();
        wv0VarB.e = new da4[]{pxf.L};
        wv0VarB.d = new ujf(1, ckfVarJ);
        wv0VarB.c = false;
        wv0VarB.b = 1554;
        jrg jrgVarB = ckfVarJ.b(1, wv0VarB.a());
        f70 f70Var = new f70(16, new x45() { // from class: ji2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                return CredentialProviderPlayServicesImpl.runFallbackClearCredFlow$lambda$0(cancellationSignal, executor, callback, (Void) obj);
            }
        });
        jrgVarB.getClass();
        jrgVarB.e(yfd.a, f70Var);
        jrgVarB.c(new wh2(this, cancellationSignal, executor, callback, 1));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e runFallbackClearCredFlow$lambda$0(CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var, Void r5) {
        INSTANCE.cancellationReviewerWithCallback$credentials_play_services_auth(cancellationSignal, new dg2(executor, ah2Var, 5));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e runFallbackClearCredFlow$lambda$0$0(Executor executor, ah2 ah2Var) {
        Log.i(TAG, "During clear credential, signed out successfully!");
        executor.execute(new zf2(ah2Var, 8));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void runFallbackClearCredFlow$lambda$2(CredentialProviderPlayServicesImpl credentialProviderPlayServicesImpl, CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var, Exception exc) {
        exc.getClass();
        INSTANCE.cancellationReviewerWithCallback$credentials_play_services_auth(cancellationSignal, new ef2(exc, executor, ah2Var));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e runFallbackClearCredFlow$lambda$2$0$0(Exception exc, Executor executor, ah2 ah2Var) {
        Log.w(TAG, "During clear credential sign out failed with " + exc);
        executor.execute(new ff2(ah2Var, exc, 3));
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void runFallbackClearCredFlow$lambda$2$0$0$0(ah2 ah2Var, Exception exc) {
        ah2Var.a(new ClearCredentialUnknownException(exc.getMessage()));
    }

    public final ae5 getGoogleApiAvailability() {
        return this.googleApiAvailability;
    }

    public final boolean isAvailableOnDevice(int minApkVersion) {
        int iIsGooglePlayServicesAvailable = isGooglePlayServicesAvailable(this.context, minApkVersion);
        boolean z = iIsGooglePlayServicesAvailable == 0;
        if (!z) {
            Log.w(TAG, "Connection with Google Play Services was not successful. Connection result is: " + new h42(iIsGooglePlayServicesAvailable, null, null));
        }
        return z;
    }

    @Override // defpackage.eh2
    public void onClearCredential(jo1 request, final CancellationSignal cancellationSignal, final Executor executor, final ah2 callback) {
        request.getClass();
        executor.getClass();
        callback.getClass();
        Companion companion = INSTANCE;
        if (companion.cancellationReviewer$credentials_play_services_auth(cancellationSignal)) {
            return;
        }
        boolean zEquals = request.a.equals("androidx.credentials.TYPE_CLEAR_RESTORE_CREDENTIAL");
        boolean z = false;
        int i = 1;
        ry ryVar = sy.T;
        if (!zEquals) {
            if (!isAvailableOnDevice(PRE_U_MIN_GMS_APK_VERSION)) {
                runFallbackClearCredFlow(request, cancellationSignal, executor, callback);
                return;
            }
            Context context = this.context;
            context.getClass();
            b66 b66Var = new b66(context, b66.l, ryVar, yd5.c);
            io1 io1Var = new io1();
            wv0 wv0VarB = wv0.b();
            wv0VarB.e = new da4[]{m40.p};
            wv0VarB.d = new ujf(19, io1Var);
            wv0VarB.b = 32708;
            jrg jrgVarB = b66Var.b(1, wv0VarB.a());
            jrgVarB.getClass();
            f70 f70Var = new f70(15, new x45() { // from class: hi2
                @Override // defpackage.x45
                public final Object invoke(Object obj) {
                    return CredentialProviderPlayServicesImpl.onClearCredential$lambda$4(cancellationSignal, executor, callback, (ko1) obj);
                }
            });
            p7f p7fVar = yfd.a;
            jrgVarB.e(p7fVar, f70Var);
            jrgVarB.d(p7fVar, new ii2(this, request, cancellationSignal, executor, callback));
            return;
        }
        if (!isAvailableOnDevice(MIN_GMS_APK_VERSION_RESTORE_CRED)) {
            companion.cancellationReviewerWithCallback$credentials_play_services_auth(cancellationSignal, new dg2(executor, callback, 7));
            return;
        }
        Context context2 = this.context;
        context2.getClass();
        b66 b66Var2 = new b66(context2, b66.m, ryVar, yd5.c);
        po1 po1Var = new po1(request.b);
        wv0 wv0VarB2 = wv0.b();
        wv0VarB2.e = new da4[]{w2g.s};
        rz2 rz2Var = new rz2(22, z);
        rz2Var.b = po1Var;
        wv0VarB2.d = rz2Var;
        wv0VarB2.b = 1694;
        jrg jrgVarB2 = b66Var2.b(0, wv0VarB2.a());
        jrgVarB2.getClass();
        f70 f70Var2 = new f70(14, new x45() { // from class: ki2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                return CredentialProviderPlayServicesImpl.onClearCredential$lambda$1(cancellationSignal, executor, callback, (Boolean) obj);
            }
        });
        p7f p7fVar2 = yfd.a;
        jrgVarB2.e(p7fVar2, f70Var2);
        jrgVarB2.d(p7fVar2, new ai2(cancellationSignal, executor, callback, i));
    }

    public void onCreateCredential(Context context, ze2 request, CancellationSignal cancellationSignal, Executor executor, ah2 callback) {
        context.getClass();
        throw null;
    }

    @Override // defpackage.eh2
    public void onGetCredential(Context context, i95 request, CancellationSignal cancellationSignal, Executor executor, ah2 callback) {
        context.getClass();
        request.getClass();
        executor.getClass();
        callback.getClass();
        Companion companion = INSTANCE;
        if (companion.cancellationReviewer$credentials_play_services_auth(cancellationSignal)) {
            return;
        }
        if (companion.isDigitalCredentialRequest$credentials_play_services_auth(request)) {
            if (isAvailableOnDevice(MIN_GMS_APK_VERSION_DIGITAL_CRED)) {
                new CredentialProviderGetDigitalCredentialController(context).invokePlayServices(request, callback, executor, cancellationSignal);
                return;
            } else {
                companion.cancellationReviewerWithCallback$credentials_play_services_auth(cancellationSignal, new dg2(executor, callback, 2));
                return;
            }
        }
        if (companion.isGetRestoreCredentialRequest$credentials_play_services_auth(request)) {
            if (isAvailableOnDevice(MIN_GMS_APK_VERSION_RESTORE_CRED)) {
                new CredentialProviderGetRestoreCredentialController(context).invokePlayServices(request, callback, executor, cancellationSignal);
                return;
            } else {
                companion.cancellationReviewerWithCallback$credentials_play_services_auth(cancellationSignal, new dg2(executor, callback, 3));
                return;
            }
        }
        if (isAvailableOnDevice(PRE_U_MIN_GMS_APK_VERSION)) {
            new GetCredentialController(context).invokePlayServices(request, callback, executor, cancellationSignal);
        } else if (companion.isGetSignInIntentRequest$credentials_play_services_auth(request)) {
            new CredentialProviderGetSignInIntentController(context).invokePlayServices(request, callback, executor, cancellationSignal);
        } else {
            new CredentialProviderBeginSignInController(context).invokePlayServices(request, callback, executor, cancellationSignal);
        }
    }

    @Override // defpackage.eh2
    public /* bridge */ /* synthetic */ void onPrepareCredential(i95 i95Var, CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var) {
        super.onPrepareCredential(i95Var, cancellationSignal, executor, ah2Var);
    }

    public void onSignalCredentialState(udc request, Executor executor, ah2 callback) {
        throw null;
    }

    public final void setGoogleApiAvailability(ae5 ae5Var) {
        ae5Var.getClass();
        this.googleApiAvailability = ae5Var;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0007\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J'\u0010\u000b\u001a\u00020\u00072\b\u0010\u0005\u001a\u0004\u0018\u00010\u00042\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006H\u0000¢\u0006\u0004\b\t\u0010\nJ\u0019\u0010\u000f\u001a\u00020\f2\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0000¢\u0006\u0004\b\r\u0010\u000eJ\u0017\u0010\u0014\u001a\u00020\f2\u0006\u0010\u0011\u001a\u00020\u0010H\u0000¢\u0006\u0004\b\u0012\u0010\u0013J\u0017\u0010\u0016\u001a\u00020\f2\u0006\u0010\u0011\u001a\u00020\u0010H\u0000¢\u0006\u0004\b\u0015\u0010\u0013J\u0017\u0010\u0018\u001a\u00020\f2\u0006\u0010\u0011\u001a\u00020\u0010H\u0000¢\u0006\u0004\b\u0017\u0010\u0013R\u0014\u0010\u001a\u001a\u00020\u00198\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u001a\u0010\u001bR\u0014\u0010\u001d\u001a\u00020\u001c8\u0006X\u0087T¢\u0006\u0006\n\u0004\b\u001d\u0010\u001eR\u0014\u0010\u001f\u001a\u00020\u001c8\u0006X\u0087T¢\u0006\u0006\n\u0004\b\u001f\u0010\u001eR\u0014\u0010 \u001a\u00020\u001c8\u0006X\u0087T¢\u0006\u0006\n\u0004\b \u0010\u001eR\u0014\u0010!\u001a\u00020\u001c8\u0006X\u0087T¢\u0006\u0006\n\u0004\b!\u0010\u001eR\u0014\u0010\"\u001a\u00020\u001c8\u0006X\u0087T¢\u0006\u0006\n\u0004\b\"\u0010\u001e¨\u0006#"}, d2 = {"Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl$Companion;", "", "<init>", "()V", "Landroid/os/CancellationSignal;", "cancellationSignal", "Lkotlin/Function0;", "Lc1e;", "callback", "cancellationReviewerWithCallback$credentials_play_services_auth", "(Landroid/os/CancellationSignal;Lm45;)V", "cancellationReviewerWithCallback", "", "cancellationReviewer$credentials_play_services_auth", "(Landroid/os/CancellationSignal;)Z", "cancellationReviewer", "Li95;", "request", "isGetSignInIntentRequest$credentials_play_services_auth", "(Li95;)Z", "isGetSignInIntentRequest", "isGetRestoreCredentialRequest$credentials_play_services_auth", "isGetRestoreCredentialRequest", "isDigitalCredentialRequest$credentials_play_services_auth", "isDigitalCredentialRequest", "", "TAG", "Ljava/lang/String;", "", "MIN_GMS_APK_VERSION", "I", "PRE_U_MIN_GMS_APK_VERSION", "MIN_GMS_APK_VERSION_RESTORE_CRED", "MIN_GMS_APK_VERSION_DIGITAL_CRED", "MIN_GMS_APK_VERSION_SIGNAL_API", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        public final boolean cancellationReviewer$credentials_play_services_auth(CancellationSignal cancellationSignal) {
            if (cancellationSignal == null) {
                Log.i(CredentialProviderPlayServicesImpl.TAG, "No cancellationSignal found");
                return false;
            }
            if (!cancellationSignal.isCanceled()) {
                return false;
            }
            Log.i(CredentialProviderPlayServicesImpl.TAG, "the flow has been canceled");
            return true;
        }

        public final void cancellationReviewerWithCallback$credentials_play_services_auth(CancellationSignal cancellationSignal, m45 callback) {
            callback.getClass();
            if (cancellationReviewer$credentials_play_services_auth(cancellationSignal)) {
                return;
            }
            callback.invoke();
        }

        public final boolean isDigitalCredentialRequest$credentials_play_services_auth(i95 request) {
            request.getClass();
            for (dh2 dh2Var : request.a) {
            }
            return false;
        }

        public final boolean isGetRestoreCredentialRequest$credentials_play_services_auth(i95 request) {
            request.getClass();
            for (dh2 dh2Var : request.a) {
            }
            return false;
        }

        public final boolean isGetSignInIntentRequest$credentials_play_services_auth(i95 request) {
            request.getClass();
            Iterator it2 = request.a.iterator();
            while (it2.hasNext()) {
                if (((dh2) it2.next()) instanceof bc5) {
                    return true;
                }
            }
            return false;
        }

        private Companion() {
        }
    }

    public static /* synthetic */ void getGoogleApiAvailability$annotations() {
    }

    @Override // defpackage.eh2
    public boolean isAvailableOnDevice() {
        return isAvailableOnDevice(MIN_GMS_APK_VERSION);
    }

    @Override // defpackage.eh2
    public /* bridge */ /* synthetic */ void onGetCredential(Context context, gz9 gz9Var, CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var) {
        super.onGetCredential(context, gz9Var, cancellationSignal, executor, ah2Var);
    }
}
