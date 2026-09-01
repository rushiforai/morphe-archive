package defpackage;

import android.content.Context;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.api.Scope;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kkf extends wd5 {
    public final GoogleSignInOptions z;

    public kkf(Context context, Looper looper, uz5 uz5Var, GoogleSignInOptions googleSignInOptions, uif uifVar, uif uifVar2) {
        ie5 ie5Var;
        super(context, looper, 91, uz5Var, uifVar, uifVar2);
        Set<Scope> set = (Set) uz5Var.b;
        if (googleSignInOptions != null) {
            ie5Var = new ie5();
            ie5Var.a = new HashSet();
            ie5Var.h = new HashMap();
            ie5Var.a = new HashSet(googleSignInOptions.b);
            ie5Var.b = googleSignInOptions.e;
            ie5Var.c = googleSignInOptions.f;
            ie5Var.d = googleSignInOptions.d;
            ie5Var.e = googleSignInOptions.g;
            ie5Var.f = googleSignInOptions.c;
            ie5Var.g = googleSignInOptions.h;
            ie5Var.h = GoogleSignInOptions.e(googleSignInOptions.i);
            ie5Var.i = googleSignInOptions.j;
        } else {
            ie5Var = new ie5();
            ie5Var.a = new HashSet();
            ie5Var.h = new HashMap();
        }
        ie5Var.i = ekf.a();
        if (!set.isEmpty()) {
            for (Scope scope : set) {
                HashSet hashSet = ie5Var.a;
                hashSet.add(scope);
                hashSet.addAll(Arrays.asList(new Scope[0]));
            }
        }
        HashSet hashSet2 = ie5Var.a;
        if (hashSet2.contains(GoogleSignInOptions.n)) {
            Scope scope2 = GoogleSignInOptions.m;
            if (hashSet2.contains(scope2)) {
                hashSet2.remove(scope2);
            }
        }
        if (ie5Var.d && (ie5Var.f == null || !hashSet2.isEmpty())) {
            hashSet2.add(GoogleSignInOptions.l);
        }
        this.z = new GoogleSignInOptions(3, new ArrayList(hashSet2), ie5Var.f, ie5Var.d, ie5Var.b, ie5Var.c, ie5Var.e, ie5Var.g, ie5Var.h, ie5Var.i);
    }

    @Override // defpackage.mn0
    public final IInterface a(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.auth.api.signin.internal.ISignInService");
        return iInterfaceQueryLocalInterface instanceof qkf ? (qkf) iInterfaceQueryLocalInterface : new qkf(iBinder, "com.google.android.gms.auth.api.signin.internal.ISignInService", 1);
    }

    @Override // defpackage.mn0
    public final int f() {
        return 12451000;
    }

    @Override // defpackage.mn0
    public final String i() {
        return "com.google.android.gms.auth.api.signin.internal.ISignInService";
    }

    @Override // defpackage.mn0
    public final String j() {
        return "com.google.android.gms.auth.api.signin.service.START";
    }
}
