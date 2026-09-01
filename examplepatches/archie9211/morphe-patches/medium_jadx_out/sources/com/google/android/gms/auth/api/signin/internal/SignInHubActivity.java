package com.google.android.gms.auth.api.signin.internal;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.os.Bundle;
import android.os.Looper;
import android.util.Log;
import android.view.accessibility.AccessibilityEvent;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.SignInAccount;
import com.google.android.gms.common.api.Status;
import com.medium.android.common.ui.Ezz.Plbho;
import defpackage.ay0;
import defpackage.gkf;
import defpackage.i33;
import defpackage.m15;
import defpackage.n1b;
import defpackage.o2b;
import defpackage.o57;
import defpackage.og2;
import defpackage.p57;
import defpackage.pkf;
import defpackage.q57;
import defpackage.s42;
import defpackage.ujf;
import defpackage.vue;
import defpackage.wg6;
import defpackage.wif;
import defpackage.xkc;
import defpackage.ygf;
import defpackage.zrc;
import java.lang.reflect.Modifier;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class SignInHubActivity extends m15 {
    public static boolean k;
    public boolean f = false;
    public SignInConfiguration g;
    public boolean h;
    public int i;
    public Intent j;

    @Override // android.app.Activity, android.view.Window.Callback
    public final boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        return true;
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
    public final void o() {
        vue viewModelStore = getViewModelStore();
        i33 i33Var = q57.d;
        viewModelStore.getClass();
        og2 og2Var = og2.b;
        og2Var.getClass();
        o2b o2bVar = new o2b(viewModelStore, i33Var, og2Var);
        wg6 wg6VarB = n1b.a.b(q57.class);
        String strD = wg6VarB.d();
        if (strD == null) {
            ay0.e("Local and anonymous classes can not be ViewModels");
            return;
        }
        q57 q57Var = (q57) o2bVar.o(wg6VarB, "androidx.lifecycle.ViewModelProvider.DefaultKey:".concat(strD));
        ujf ujfVar = new ujf(3, this);
        boolean z = q57Var.c;
        xkc xkcVar = q57Var.b;
        if (z) {
            ygf.f("Called while creating a loader");
            return;
        }
        if (Looper.getMainLooper() != Looper.myLooper()) {
            ygf.f("initLoader must be called on the main thread");
            return;
        }
        xkcVar.getClass();
        o57 o57Var = (o57) s42.L(xkcVar, 0);
        if (o57Var == null) {
            try {
                q57Var.c = true;
                Set set = wif.b;
                synchronized (set) {
                }
                gkf gkfVar = new gkf(this, set);
                if (gkf.class.isMemberClass() && !Modifier.isStatic(gkf.class.getModifiers())) {
                    throw new IllegalArgumentException("Object returned from onCreateLoader must not be a non-static inner member class: " + gkfVar);
                }
                o57 o57Var2 = new o57(gkfVar);
                xkcVar.d(0, o57Var2);
                q57Var.c = false;
                p57 p57Var = new p57(o57Var2.l, ujfVar);
                o57Var2.d(this, p57Var);
                p57 p57Var2 = o57Var2.n;
                if (p57Var2 != null) {
                    o57Var2.i(p57Var2);
                }
                o57Var2.m = this;
                o57Var2.n = p57Var;
            } catch (Throwable th) {
                q57Var.c = false;
                throw th;
            }
        } else {
            p57 p57Var3 = new p57(o57Var.l, ujfVar);
            o57Var.d(this, p57Var3);
            p57 p57Var4 = o57Var.n;
            if (p57Var4 != null) {
                o57Var.i(p57Var4);
            }
            o57Var.m = this;
            o57Var.n = p57Var3;
        }
        k = false;
    }

    @Override // defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = getIntent();
        String action = intent.getAction();
        if (action == null) {
            Log.e("AuthSignInClient", "Null action");
            p(12500);
            return;
        }
        if (action.equals("com.google.android.gms.auth.NO_IMPL")) {
            Log.e("AuthSignInClient", "Action not implemented");
            p(12500);
            return;
        }
        if (!action.equals("com.google.android.gms.auth.GOOGLE_SIGN_IN") && !action.equals("com.google.android.gms.auth.APPAUTH_SIGN_IN")) {
            Log.e("AuthSignInClient", "Unknown action: ".concat(String.valueOf(intent.getAction())));
            finish();
            return;
        }
        Bundle bundleExtra = intent.getBundleExtra("config");
        if (bundleExtra == null) {
            Log.e("AuthSignInClient", "Activity started with no configuration.");
            setResult(0);
            finish();
            return;
        }
        SignInConfiguration signInConfiguration = (SignInConfiguration) bundleExtra.getParcelable("config");
        if (signInConfiguration == null) {
            Log.e("AuthSignInClient", "Activity started with invalid configuration.");
            setResult(0);
            finish();
            return;
        }
        this.g = signInConfiguration;
        if (bundle != null) {
            boolean z = bundle.getBoolean("signingInGoogleApiClients");
            this.h = z;
            if (z) {
                this.i = bundle.getInt("signInResultCode");
                Intent intent2 = (Intent) bundle.getParcelable("signInResultData");
                if (intent2 != null) {
                    this.j = intent2;
                    o();
                    return;
                } else {
                    Log.e("AuthSignInClient", "Sign in result data cannot be null");
                    setResult(0);
                    finish();
                    return;
                }
            }
            return;
        }
        if (k) {
            setResult(0);
            p(12502);
            return;
        }
        k = true;
        Intent intent3 = new Intent(action);
        if (action.equals("com.google.android.gms.auth.GOOGLE_SIGN_IN")) {
            intent3.setPackage("com.google.android.gms");
        } else {
            intent3.setPackage(getPackageName());
        }
        intent3.putExtra("config", this.g);
        try {
            startActivityForResult(intent3, 40962);
        } catch (ActivityNotFoundException unused) {
            this.f = true;
            Log.w("AuthSignInClient", "Could not launch sign in Intent. Google Play Service is probably being updated...");
            p(17);
        }
    }

    @Override // defpackage.m15, android.app.Activity
    public final void onDestroy() {
        super.onDestroy();
        k = false;
    }

    @Override // defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean("signingInGoogleApiClients", this.h);
        if (this.h) {
            bundle.putInt("signInResultCode", this.i);
            bundle.putParcelable("signInResultData", this.j);
        }
    }

    public final void p(int i) {
        Status status = new Status(i, null, null, null);
        Intent intent = new Intent();
        intent.putExtra("googleSignInStatus", status);
        setResult(0, intent);
        finish();
        k = false;
    }

    @Override // defpackage.m15, defpackage.xy1, android.app.Activity
    public final void onActivityResult(int i, int i2, Intent intent) {
        GoogleSignInAccount googleSignInAccount;
        if (this.f) {
            return;
        }
        setResult(0);
        if (i != 40962) {
            return;
        }
        if (intent != null) {
            SignInAccount signInAccount = (SignInAccount) intent.getParcelableExtra("signInAccount");
            if (signInAccount != null && (googleSignInAccount = signInAccount.b) != null) {
                pkf pkfVarM = pkf.M(this);
                GoogleSignInOptions googleSignInOptions = this.g.b;
                synchronized (pkfVarM) {
                    ((zrc) pkfVarM.a).c(googleSignInAccount, googleSignInOptions);
                }
                intent.removeExtra("signInAccount");
                intent.putExtra("googleSignInAccount", googleSignInAccount);
                this.h = true;
                this.i = i2;
                this.j = intent;
                o();
                return;
            }
            if (intent.hasExtra(Plbho.UMmfdSRSG)) {
                int intExtra = intent.getIntExtra("errorCode", 8);
                if (intExtra == 13) {
                    intExtra = 12501;
                }
                p(intExtra);
                return;
            }
        }
        p(8);
    }
}
