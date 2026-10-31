package l5;

import ae.h;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
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
import androidx.credentials.exceptions.publickeycredential.GetPublicKeyCredentialDomException;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.identityauth.beginsignin.CredentialProviderBeginSignInController$resultReceiver$1;
import b.c0;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.android.gms.auth.api.identity.BeginSignInRequest;
import com.google.android.gms.auth.api.identity.SignInCredential;
import com.google.android.gms.common.Feature;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.fido.fido2.api.common.AuthenticationExtensionsClientOutputs;
import com.google.android.gms.fido.fido2.api.common.AuthenticatorAssertionResponse;
import com.google.android.gms.fido.fido2.api.common.AuthenticatorAttestationResponse;
import com.google.android.gms.fido.fido2.api.common.AuthenticatorErrorResponse;
import com.google.android.gms.fido.fido2.api.common.ErrorCode;
import com.google.android.gms.fido.fido2.api.common.PublicKeyCredential;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import f5.d;
import f5.k;
import f5.l;
import f5.m;
import fi.t;
import gu.j;
import h10.k1;
import j00.k0;
import java.util.LinkedHashMap;
import java.util.concurrent.Executor;
import k30.e;
import k5.a;
import k5.c;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import l10.z;
import l5.b;
import org.json.JSONException;
import org.json.JSONObject;
import p7.u;
import sg.w;

/* loaded from: classes2.dex */
public final class b extends c {

    /* renamed from: g, reason: collision with root package name */
    public final Context f74716g;

    /* renamed from: h, reason: collision with root package name */
    public d f74717h;

    /* renamed from: i, reason: collision with root package name */
    public Executor f74718i;

    /* renamed from: j, reason: collision with root package name */
    public CancellationSignal f74719j;

    /* renamed from: k, reason: collision with root package name */
    public final CredentialProviderBeginSignInController$resultReceiver$1 f74720k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Type inference failed for: r0v2, types: [androidx.credentials.playservices.controllers.identityauth.beginsignin.CredentialProviderBeginSignInController$resultReceiver$1] */
    public b(Context context) {
        super(context);
        Intrinsics.g(context, "context");
        this.f74716g = context;
        final Handler handler = new Handler(Looper.getMainLooper());
        this.f74720k = new ResultReceiver(handler) { // from class: androidx.credentials.playservices.controllers.identityauth.beginsignin.CredentialProviderBeginSignInController$resultReceiver$1
            @Override // android.os.ResultReceiver
            public final void onReceiveResult(int i5, Bundle resultData) {
                Intrinsics.g(resultData, "resultData");
                k1 k1Var = new k1(2, c.f71100c, a.class, "getCredentialExceptionTypeToException", "getCredentialExceptionTypeToException$credentials_play_services_auth(Ljava/lang/String;Ljava/lang/String;)Landroidx/credentials/exceptions/GetCredentialException;", 0, 10);
                b bVar = this.f14267a;
                if (c.b(resultData, k1Var, bVar.e(), bVar.d(), bVar.f74719j)) {
                    return;
                }
                int i11 = resultData.getInt("ACTIVITY_REQUEST_CODE");
                Intent intent = (Intent) resultData.getParcelable("RESULT_DATA");
                int i12 = c.f71102e;
                if (i11 != i12) {
                    Log.w("BeginSignIn", "Returned request code " + i12 + " which  does not match what was given " + i11);
                    return;
                }
                int i13 = 0;
                if (k5.b.b(i5, new k0(13, (byte) 0), new z(bVar, 1), bVar.f74719j)) {
                    return;
                }
                try {
                    k5.b.a(bVar.f74719j, new k5.d(6, bVar, bVar.c(u.N(bVar.f74716g).d(intent))));
                } catch (GetCredentialException e3) {
                    CancellationSignal cancellationSignal = bVar.f74719j;
                    CredentialProviderPlayServicesImpl.Companion.getClass();
                    if (j5.d.a(cancellationSignal)) {
                        return;
                    }
                    bVar.e().execute(new l5.a(bVar, e3, i13));
                    Unit unit = Unit.f71706a;
                } catch (ApiException e11) {
                    Ref.ObjectRef objectRef = new Ref.ObjectRef();
                    objectRef.f71863a = new GetCredentialUnknownException(e11.getMessage());
                    int i14 = e11.f31794a.f31810f;
                    if (i14 == 16) {
                        objectRef.f71863a = new GetCredentialCancellationException(e11.getMessage());
                    } else if (c.f71101d.contains(Integer.valueOf(i14))) {
                        objectRef.f71863a = new GetCredentialInterruptedException(e11.getMessage());
                    }
                    CancellationSignal cancellationSignal2 = bVar.f74719j;
                    CredentialProviderPlayServicesImpl.Companion.getClass();
                    if (j5.d.a(cancellationSignal2)) {
                        return;
                    }
                    bVar.e().execute(new kz.c(2, bVar, objectRef));
                    Unit unit2 = Unit.f71706a;
                } catch (Throwable th2) {
                    GetCredentialUnknownException getCredentialUnknownException = new GetCredentialUnknownException(th2.getMessage());
                    CancellationSignal cancellationSignal3 = bVar.f74719j;
                    CredentialProviderPlayServicesImpl.Companion.getClass();
                    if (j5.d.a(cancellationSignal3)) {
                        return;
                    }
                    bVar.e().execute(new kz.c(3, bVar, getCredentialUnknownException));
                    Unit unit3 = Unit.f71706a;
                }
            }
        };
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final m c(SignInCredential signInCredential) throws GetCredentialCancellationException, GetPublicKeyCredentialDomException, GetCredentialUnknownException {
        AuthenticatorErrorResponse authenticatorErrorResponse;
        String string;
        c3.b kVar;
        PublicKeyCredential publicKeyCredential = signInCredential.n;
        String str = signInCredential.f31726l;
        String str2 = signInCredential.f31720f;
        String str3 = signInCredential.f31725k;
        boolean z11 = true;
        if (str3 != null) {
            Intrinsics.f(str2, "getId(...)");
            Bundle bundle = new Bundle();
            bundle.putString("androidx.credentials.BUNDLE_KEY_ID", str2);
            bundle.putString("androidx.credentials.BUNDLE_KEY_PASSWORD", str3);
            kVar = new k(str3, 1, bundle);
        } else {
            zi.b bVar = null;
            JSONObject jSONObject = null;
            if (str != null) {
                Intrinsics.f(str2, "getId(...)");
                String str4 = signInCredential.f31721g;
                String str5 = str4 != null ? str4 : null;
                String str6 = signInCredential.f31722h;
                String str7 = str6 != null ? str6 : null;
                String str8 = signInCredential.f31723i;
                String str9 = str8 != null ? str8 : null;
                String str10 = signInCredential.f31727m;
                String str11 = str10 != null ? str10 : null;
                Uri uri = signInCredential.f31724j;
                bVar = new zi.b(str2, str, str5, uri != null ? uri : null, str9, str7, str11);
            } else if (publicKeyCredential != null) {
                AuthenticatorErrorResponse authenticatorErrorResponse2 = publicKeyCredential.f31937k;
                AuthenticatorAssertionResponse authenticatorAssertionResponse = publicKeyCredential.f31936j;
                AuthenticatorAttestationResponse authenticatorAttestationResponse = publicKeyCredential.f31935i;
                LinkedHashMap linkedHashMap = m5.a.f76006a;
                JSONObject jSONObject2 = new JSONObject();
                if (authenticatorAttestationResponse != 0) {
                    authenticatorErrorResponse = authenticatorAttestationResponse;
                } else if (authenticatorAssertionResponse != 0) {
                    authenticatorErrorResponse = authenticatorAssertionResponse;
                } else {
                    if (authenticatorErrorResponse2 == null) {
                        throw new IllegalStateException("No response set.");
                    }
                    authenticatorErrorResponse = authenticatorErrorResponse2;
                }
                if (authenticatorErrorResponse instanceof AuthenticatorErrorResponse) {
                    AuthenticatorErrorResponse authenticatorErrorResponse3 = authenticatorErrorResponse;
                    ErrorCode errorCode = authenticatorErrorResponse3.f31916f;
                    Intrinsics.f(errorCode, "getErrorCode(...)");
                    String str12 = authenticatorErrorResponse3.f31917g;
                    g5.a aVar = (g5.a) m5.a.f76006a.get(errorCode);
                    if (aVar == null) {
                        throw new GetPublicKeyCredentialDomException(new g5.a(26), c0.k("unknown fido gms exception - ", str12));
                    }
                    if (errorCode == ErrorCode.NOT_ALLOWED_ERR && str12 != null && r70.k.K0(str12, "Unable to get sync account", false)) {
                        throw new GetCredentialCancellationException("Passkey retrieval was cancelled by the user.");
                    }
                    throw new GetPublicKeyCredentialDomException(aVar, str12);
                }
                if (authenticatorErrorResponse instanceof AuthenticatorAssertionResponse) {
                    try {
                        mh.k0 k0Var = publicKeyCredential.f31934h;
                        try {
                            JSONObject jSONObject3 = new JSONObject();
                            if (k0Var != null && k0Var.l().length > 0) {
                                jSONObject3.put("rawId", xg.b.c(k0Var.l()));
                            }
                            Object obj = publicKeyCredential.f31939m;
                            if (obj != null) {
                                jSONObject3.put("authenticatorAttachment", obj);
                            }
                            Object obj2 = publicKeyCredential.f31933g;
                            if (obj2 != null && authenticatorErrorResponse2 == null) {
                                jSONObject3.put(TTConst.TRACK_TYPE, obj2);
                            }
                            Object obj3 = publicKeyCredential.f31932f;
                            if (obj3 != null) {
                                jSONObject3.put("id", obj3);
                            }
                            String str13 = "response";
                            if (authenticatorAssertionResponse != 0) {
                                jSONObject = authenticatorAssertionResponse.d();
                            } else if (authenticatorAttestationResponse != 0) {
                                jSONObject = authenticatorAttestationResponse.d();
                            } else {
                                if (authenticatorErrorResponse2 != null) {
                                    try {
                                        jSONObject = new JSONObject();
                                        jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, authenticatorErrorResponse2.f31916f.f31931a);
                                        String str14 = authenticatorErrorResponse2.f31917g;
                                        if (str14 != null) {
                                            jSONObject.put(PglCryptUtils.KEY_MESSAGE, str14);
                                        }
                                        str13 = "error";
                                    } catch (JSONException e3) {
                                        throw new RuntimeException("Error encoding AuthenticatorErrorResponse to JSON object", e3);
                                    }
                                }
                                z11 = false;
                            }
                            if (jSONObject != null) {
                                jSONObject3.put(str13, jSONObject);
                            }
                            AuthenticationExtensionsClientOutputs authenticationExtensionsClientOutputs = publicKeyCredential.f31938l;
                            if (authenticationExtensionsClientOutputs != null) {
                                jSONObject3.put("clientExtensionResults", authenticationExtensionsClientOutputs.d());
                            } else if (z11) {
                                jSONObject3.put("clientExtensionResults", new JSONObject());
                            }
                            string = jSONObject3.toString();
                            Intrinsics.f(string, "toJson(...)");
                        } catch (JSONException e11) {
                            throw new RuntimeException("Error encoding PublicKeyCredential to JSON object", e11);
                        }
                    } catch (Throwable th2) {
                        throw new GetCredentialUnknownException(fq.c.f(th2, new StringBuilder("The PublicKeyCredential response json had an unexpected exception when parsing: ")));
                    }
                } else {
                    Log.e("PublicKeyUtility", "AuthenticatorResponse expected assertion response but got: ".concat(authenticatorErrorResponse.getClass().getName()));
                    string = jSONObject2.toString();
                    Intrinsics.f(string, "toString(...)");
                }
                Bundle bundle2 = new Bundle();
                bundle2.putString("androidx.credentials.BUNDLE_KEY_AUTHENTICATION_RESPONSE_JSON", string);
                kVar = new k(string, 2, bundle2);
            } else {
                Log.w("BeginSignIn", "Credential returned but no google Id or password or passkey found");
            }
            kVar = bVar;
        }
        if (kVar != null) {
            return new m(kVar);
        }
        throw new GetCredentialUnknownException("When attempting to convert get response, null credential found");
    }

    public final d d() {
        d dVar = this.f74717h;
        if (dVar != null) {
            return dVar;
        }
        Intrinsics.m("callback");
        throw null;
    }

    public final Executor e() {
        Executor executor = this.f74718i;
        if (executor != null) {
            return executor;
        }
        Intrinsics.m("executor");
        throw null;
    }

    public final void f(l request, CancellationSignal cancellationSignal, Executor executor, d callback) {
        Intrinsics.g(request, "request");
        Intrinsics.g(callback, "callback");
        Intrinsics.g(executor, "executor");
        this.f74719j = cancellationSignal;
        this.f74717h = callback;
        this.f74718i = executor;
        CredentialProviderPlayServicesImpl.Companion.getClass();
        if (j5.d.a(cancellationSignal)) {
            return;
        }
        Context context = this.f74716g;
        Intrinsics.g(context, "context");
        BeginSignInRequest.PasswordRequestOptions passwordRequestOptions = new BeginSignInRequest.PasswordRequestOptions(false);
        com.google.android.gms.auth.api.identity.a aVarD = BeginSignInRequest.GoogleIdTokenRequestOptions.d();
        aVarD.f31728a = false;
        BeginSignInRequest.GoogleIdTokenRequestOptions googleIdTokenRequestOptionsA = aVarD.a();
        BeginSignInRequest.PasskeysRequestOptions passkeysRequestOptions = new BeginSignInRequest.PasskeysRequestOptions(null, false, null);
        BeginSignInRequest.PasskeyJsonRequestOptions passkeyJsonRequestOptions = new BeginSignInRequest.PasskeyJsonRequestOptions(false, null);
        PackageManager packageManager = context.getPackageManager();
        Intrinsics.f(packageManager, "getPackageManager(...)");
        int i5 = packageManager.getPackageInfo("com.google.android.gms", 0).versionCode;
        BeginSignInRequest.GoogleIdTokenRequestOptions googleIdTokenRequestOptionsA2 = googleIdTokenRequestOptionsA;
        for (zi.a aVar : request.f54310a) {
            if (aVar instanceof zi.a) {
                com.google.android.gms.auth.api.identity.a aVarD2 = BeginSignInRequest.GoogleIdTokenRequestOptions.d();
                aVarD2.f31730c = false;
                String str = aVar.f98531d;
                w.e(str);
                aVarD2.f31729b = str;
                aVarD2.f31728a = true;
                googleIdTokenRequestOptionsA2 = aVarD2.a();
            }
        }
        BeginSignInRequest beginSignInRequest = new BeginSignInRequest(passwordRequestOptions, googleIdTokenRequestOptionsA2, null, false, 0, passkeysRequestOptions, passkeyJsonRequestOptions, false);
        ih.c cVarN = u.N(context);
        com.google.android.gms.auth.api.identity.a aVarD3 = BeginSignInRequest.GoogleIdTokenRequestOptions.d();
        aVarD3.f31728a = false;
        aVarD3.a();
        new BeginSignInRequest.PasskeysRequestOptions(null, false, null);
        new BeginSignInRequest.PasskeyJsonRequestOptions(false, null);
        BeginSignInRequest.GoogleIdTokenRequestOptions googleIdTokenRequestOptions = beginSignInRequest.f31699g;
        w.h(googleIdTokenRequestOptions);
        BeginSignInRequest.PasswordRequestOptions passwordRequestOptions2 = beginSignInRequest.f31698f;
        w.h(passwordRequestOptions2);
        BeginSignInRequest.PasskeysRequestOptions passkeysRequestOptions2 = beginSignInRequest.f31703k;
        w.h(passkeysRequestOptions2);
        BeginSignInRequest.PasskeyJsonRequestOptions passkeyJsonRequestOptions2 = beginSignInRequest.f31704l;
        w.h(passkeyJsonRequestOptions2);
        BeginSignInRequest beginSignInRequest2 = new BeginSignInRequest(passwordRequestOptions2, googleIdTokenRequestOptions, cVarN.f61596l, beginSignInRequest.f31701i, beginSignInRequest.f31702j, passkeysRequestOptions2, passkeyJsonRequestOptions2, beginSignInRequest.f31705m);
        cz.b bVarB = rg.m.b();
        bVarB.f48576d = new Feature[]{new Feature("auth_api_credentials_begin_sign_in", 8L)};
        bVarB.f48575c = new j(cVarN, beginSignInRequest2);
        bVarB.f48573a = false;
        bVarB.f48574b = 1553;
        t tVarC = cVarN.c(0, bVarB.a());
        e eVar = new e(new jt.e(16, cancellationSignal, this), 2);
        tVarC.getClass();
        tVarC.g(fi.k.f55136a, eVar);
        tVarC.d(new h(25, this, cancellationSignal));
    }
}
