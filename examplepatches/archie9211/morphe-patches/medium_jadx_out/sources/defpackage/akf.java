package defpackage;

import android.app.AppOpsManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Binder;
import android.os.Build;
import android.os.Looper;
import android.os.Parcel;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.RevocationBoundService;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BasePendingResult;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import org.json.JSONException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class akf extends ihf {
    public final /* synthetic */ int f;
    public final Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public akf(wfd wfdVar, int i) {
        super("com.google.android.gms.auth.api.identity.internal.IBeginSignInCallback", 2);
        this.f = i;
        switch (i) {
            case 1:
                this.g = wfdVar;
                super("com.google.android.gms.auth.api.identity.internal.IGetSignInIntentCallback", 2);
                break;
            default:
                this.g = wfdVar;
                break;
        }
    }

    public void o() {
        AppOpsManager appOpsManager;
        RevocationBoundService revocationBoundService = (RevocationBoundService) this.g;
        int callingUid = Binder.getCallingUid();
        try {
            appOpsManager = (AppOpsManager) e9f.a(revocationBoundService).a.getSystemService("appops");
        } catch (SecurityException unused) {
        }
        if (appOpsManager == null) {
            throw new NullPointerException("context.getSystemService(Context.APP_OPS_SERVICE) is null");
        }
        appOpsManager.checkPackage(callingUid, "com.google.android.gms");
        try {
            PackageInfo packageInfo = revocationBoundService.getPackageManager().getPackageInfo("com.google.android.gms", 64);
            ke5 ke5VarC = ke5.c(revocationBoundService);
            if (packageInfo != null) {
                if (ke5.f(packageInfo, false)) {
                    return;
                }
                if (ke5.f(packageInfo, true)) {
                    Context context = (Context) ke5VarC.a;
                    try {
                        if (!he5.c) {
                            try {
                                PackageInfo packageInfo2 = e9f.a(context).a.getPackageManager().getPackageInfo("com.google.android.gms", Build.VERSION.SDK_INT >= 28 ? 134217792 : 64);
                                ke5.c(context);
                                if (packageInfo2 == null || ke5.f(packageInfo2, false) || !ke5.f(packageInfo2, true)) {
                                    he5.b = false;
                                } else {
                                    he5.b = true;
                                }
                                he5.c = true;
                            } catch (PackageManager.NameNotFoundException e) {
                                Log.w("GooglePlayServicesUtil", "Cannot find Google Play services package name.", e);
                                he5.c = true;
                            }
                        }
                        if (he5.b || !"user".equals(Build.TYPE)) {
                            return;
                        } else {
                            Log.w("GoogleSignatureVerifier", "Test-keys aren't accepted on this build.");
                        }
                    } catch (Throwable th) {
                        he5.c = true;
                        throw th;
                    }
                }
            }
        } catch (PackageManager.NameNotFoundException unused2) {
            if (Log.isLoggable("UidVerifier", 3)) {
                Log.d("UidVerifier", "Package manager can't find google play services package, defaulting to false");
            }
        }
        throw new SecurityException(ev6.w("Calling UID ", Binder.getCallingUid(), " is not Google Play services."));
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    @Override // defpackage.ihf
    public final boolean k(int i, Parcel parcel, Parcel parcel2) throws JSONException {
        BasePendingResult basePendingResult;
        BasePendingResult basePendingResult2;
        String strE;
        int i2 = this.f;
        Object obj = this.g;
        switch (i2) {
            case 0:
                if (i != 1) {
                    return false;
                }
                Status status = (Status) hkf.a(parcel, Status.CREATOR);
                sq0 sq0Var = (sq0) hkf.a(parcel, sq0.CREATOR);
                hkf.b(parcel);
                tp7.C(status, sq0Var, (wfd) obj);
                return true;
            case 1:
                if (i != 1) {
                    return false;
                }
                Status status2 = (Status) hkf.a(parcel, Status.CREATOR);
                PendingIntent pendingIntent = (PendingIntent) hkf.a(parcel, PendingIntent.CREATOR);
                hkf.b(parcel);
                tp7.C(status2, pendingIntent, (wfd) obj);
                return true;
            default:
                RevocationBoundService revocationBoundService = (RevocationBoundService) obj;
                if (i != 1) {
                    if (i != 2) {
                        return false;
                    }
                    o();
                    pkf.M(revocationBoundService).N();
                    return true;
                }
                o();
                zrc zrcVarA = zrc.a(revocationBoundService);
                GoogleSignInAccount googleSignInAccountB = zrcVarA.b();
                GoogleSignInOptions googleSignInOptionsD = GoogleSignInOptions.k;
                if (googleSignInAccountB != null) {
                    String strE2 = zrcVarA.e("defaultGoogleSignInAccount");
                    if (TextUtils.isEmpty(strE2) || (strE = zrcVarA.e(zrc.f(uvlZTF.xUymwKO, strE2))) == null) {
                        googleSignInOptionsD = null;
                    } else {
                        try {
                            googleSignInOptionsD = GoogleSignInOptions.d(strE);
                        } catch (JSONException unused) {
                            googleSignInOptionsD = null;
                        }
                    }
                }
                vp7.p(googleSignInOptionsD);
                b66 b66Var = new b66(revocationBoundService, yb0.a, googleSignInOptionsD, new yd5(new y3b(11), Looper.getMainLooper()));
                int i3 = 26;
                Context context = b66Var.a;
                wif wifVar = b66Var.i;
                if (googleSignInAccountB == null) {
                    boolean z = b66Var.d() == 3;
                    xp xpVar = okf.a;
                    Object[] objArr = new Object[0];
                    if (xpVar.b <= 3) {
                        Log.d((String) xpVar.c, xpVar.o("Signing out", objArr));
                    }
                    okf.a(context);
                    if (z) {
                        src srcVar = new src(wifVar);
                        srcVar.setResult(Status.e);
                        basePendingResult = srcVar;
                    } else {
                        nkf nkfVar = new nkf(wifVar, 0);
                        wifVar.a(nkfVar);
                        basePendingResult = nkfVar;
                    }
                    basePendingResult.addStatusListener(new vjf(basePendingResult, new wfd(), new rz5(i3)));
                    return true;
                }
                boolean z2 = b66Var.d() == 3;
                xp xpVar2 = okf.a;
                Object[] objArr2 = new Object[0];
                if (xpVar2.b <= 3) {
                    Log.d((String) xpVar2.c, xpVar2.o("Revoking access", objArr2));
                }
                String strE3 = zrc.a(context).e("refreshToken");
                okf.a(context);
                if (!z2) {
                    nkf nkfVar2 = new nkf(wifVar, 1);
                    wifVar.a(nkfVar2);
                    basePendingResult2 = nkfVar2;
                } else if (strE3 == null) {
                    xp xpVar3 = fkf.c;
                    Status status3 = new Status(4, null, null, null);
                    vp7.k("Status code must not be SUCCESS", !false);
                    djf djfVar = new djf(status3);
                    djfVar.setResult(status3);
                    basePendingResult2 = djfVar;
                } else {
                    fkf fkfVar = new fkf(strE3);
                    new Thread(fkfVar).start();
                    basePendingResult2 = fkfVar.b;
                }
                basePendingResult2.addStatusListener(new vjf(basePendingResult2, new wfd(), new rz5(i3)));
                return true;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public akf(RevocationBoundService revocationBoundService) {
        super("com.google.android.gms.auth.api.signin.internal.IRevocationService", 2);
        this.f = 2;
        this.g = revocationBoundService;
    }
}
