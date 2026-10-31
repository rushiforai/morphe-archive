package mg;

import android.content.Context;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import bm.t;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.api.Scope;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import rg.p;

/* loaded from: classes3.dex */
public final class e extends sg.f {

    /* renamed from: c, reason: collision with root package name */
    public final GoogleSignInOptions f76295c;

    public e(Context context, Looper looper, t tVar, GoogleSignInOptions googleSignInOptions, p pVar, p pVar2) {
        super(context, looper, 91, tVar, pVar, pVar2);
        Set<Scope> set = (Set) tVar.f18111c;
        lg.b bVar = googleSignInOptions != null ? new lg.b(googleSignInOptions) : new lg.b();
        bVar.f74931i = ih.f.a();
        if (!set.isEmpty()) {
            for (Scope scope : set) {
                HashSet hashSet = bVar.f74923a;
                hashSet.add(scope);
                hashSet.addAll(Arrays.asList(new Scope[0]));
            }
        }
        this.f76295c = bVar.a();
    }

    @Override // sg.e
    public final IInterface createServiceInterface(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.auth.api.signin.internal.ISignInService");
        return iInterfaceQueryLocalInterface instanceof n ? (n) iInterfaceQueryLocalInterface : new n(iBinder, "com.google.android.gms.auth.api.signin.internal.ISignInService", 2);
    }

    @Override // sg.e
    public final int getMinApkVersion() {
        return 12451000;
    }

    @Override // sg.e
    public final String getServiceDescriptor() {
        return "com.google.android.gms.auth.api.signin.internal.ISignInService";
    }

    @Override // sg.e
    public final String getStartServiceAction() {
        return "com.google.android.gms.auth.api.signin.service.START";
    }
}
