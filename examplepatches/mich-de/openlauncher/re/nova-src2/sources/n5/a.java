package n5;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Handler;
import android.os.Looper;
import android.os.ResultReceiver;
import android.util.Log;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.internal.FrameworkClassParsingException;
import androidx.credentials.playservices.controllers.identitycredentials.getcredential.GetCredentialController$resultReceiver$1;
import b10.d0;
import f5.d;
import f5.m;
import h10.k1;
import j00.k0;
import java.util.concurrent.Executor;
import jt.e;
import k5.a;
import k5.b;
import k5.c;
import kotlin.jvm.internal.Intrinsics;
import p10.c0;

/* loaded from: classes2.dex */
public final class a extends c {

    /* renamed from: g, reason: collision with root package name */
    public final Context f77889g;

    /* renamed from: h, reason: collision with root package name */
    public d f77890h;

    /* renamed from: i, reason: collision with root package name */
    public Executor f77891i;

    /* renamed from: j, reason: collision with root package name */
    public CancellationSignal f77892j;

    /* renamed from: k, reason: collision with root package name */
    public final GetCredentialController$resultReceiver$1 f77893k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Type inference failed for: r0v2, types: [androidx.credentials.playservices.controllers.identitycredentials.getcredential.GetCredentialController$resultReceiver$1] */
    public a(Context context) {
        super(context);
        Intrinsics.g(context, "context");
        this.f77889g = context;
        final Handler handler = new Handler(Looper.getMainLooper());
        this.f77893k = new ResultReceiver(handler) { // from class: androidx.credentials.playservices.controllers.identitycredentials.getcredential.GetCredentialController$resultReceiver$1
            @Override // android.os.ResultReceiver
            public final void onReceiveResult(int i5, Bundle resultData) throws FrameworkClassParsingException {
                String string;
                Bundle bundle;
                m mVar;
                Intrinsics.g(resultData, "resultData");
                k1 k1Var = new k1(2, c.f71100c, a.class, "getCredentialExceptionTypeToException", "getCredentialExceptionTypeToException$credentials_play_services_auth(Ljava/lang/String;Ljava/lang/String;)Landroidx/credentials/exceptions/GetCredentialException;", 0, 11);
                n5.a aVar = this.f14270a;
                Executor executor = aVar.f77891i;
                GetCredentialException getCredentialExceptionF0 = null;
                if (executor == null) {
                    Intrinsics.m("executor");
                    throw null;
                }
                d dVar = aVar.f77890h;
                if (dVar == null) {
                    Intrinsics.m("callback");
                    throw null;
                }
                if (c.b(resultData, k1Var, executor, dVar, aVar.f77892j)) {
                    return;
                }
                int i11 = resultData.getInt("ACTIVITY_REQUEST_CODE");
                Intent intent = (Intent) vm.d.i(resultData, "RESULT_DATA", Intent.class);
                Executor executor2 = aVar.f77891i;
                if (executor2 == null) {
                    Intrinsics.m("executor");
                    throw null;
                }
                d dVar2 = aVar.f77890h;
                if (dVar2 == null) {
                    Intrinsics.m("callback");
                    throw null;
                }
                CancellationSignal cancellationSignal = aVar.f77892j;
                int i12 = c.f71102e;
                if (i11 != i12) {
                    Log.w("GetCredentialController", "Returned request code " + i12 + " which  does not match what was given " + i11);
                    return;
                }
                byte b11 = 0;
                if (b.b(i5, new k0(2, b11), new e(7, executor2, dVar2), cancellationSignal)) {
                    return;
                }
                if (intent == null) {
                    b.a(cancellationSignal, new k5.d(b11, executor2, dVar2));
                    return;
                }
                int i13 = Build.VERSION.SDK_INT;
                if (i13 >= 34) {
                    mVar = a5.k0.b(intent);
                } else {
                    Bundle bundleExtra = intent.getBundleExtra("android.service.credentials.extra.GET_CREDENTIAL_RESPONSE");
                    mVar = (bundleExtra == null || (string = bundleExtra.getString("androidx.credentials.provider.extra.EXTRA_CREDENTIAL_TYPE")) == null || (bundle = bundleExtra.getBundle("androidx.credentials.provider.extra.EXTRA_CREDENTIAL_DATA")) == null) ? null : new m(jk.b.w(string, bundle));
                }
                if (mVar != null) {
                    b.a(cancellationSignal, new d0(22, executor2, dVar2, mVar));
                    return;
                }
                if (i13 >= 34) {
                    getCredentialExceptionF0 = a5.k0.a(intent);
                } else {
                    int i14 = GetCredentialException.f14261a;
                    Bundle bundleExtra2 = intent.getBundleExtra("android.service.credentials.extra.GET_CREDENTIAL_EXCEPTION");
                    if (bundleExtra2 != null) {
                        String string2 = bundleExtra2.getString("androidx.credentials.provider.extra.CREATE_CREDENTIAL_EXCEPTION_TYPE");
                        if (string2 == null) {
                            throw new IllegalArgumentException("Bundle was missing exception type.");
                        }
                        getCredentialExceptionF0 = c0.f0(string2, bundleExtra2.getCharSequence("androidx.credentials.provider.extra.CREATE_CREDENTIAL_EXCEPTION_MESSAGE"));
                    }
                }
                b.a(cancellationSignal, new d0(23, executor2, dVar2, getCredentialExceptionF0));
            }
        };
    }
}
