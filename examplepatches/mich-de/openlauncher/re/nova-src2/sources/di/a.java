package di;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import bm.t;
import qg.g;
import qg.h;
import sg.f;

/* loaded from: classes3.dex */
public final class a extends f implements qg.c {

    /* renamed from: c, reason: collision with root package name */
    public final boolean f49232c;

    /* renamed from: d, reason: collision with root package name */
    public final t f49233d;

    /* renamed from: e, reason: collision with root package name */
    public final Bundle f49234e;

    /* renamed from: f, reason: collision with root package name */
    public final Integer f49235f;

    public a(Context context, Looper looper, t tVar, Bundle bundle, g gVar, h hVar) {
        super(context, looper, 44, tVar, gVar, hVar);
        this.f49232c = true;
        this.f49233d = tVar;
        this.f49234e = bundle;
        this.f49235f = (Integer) tVar.f18115g;
    }

    @Override // sg.e
    public final IInterface createServiceInterface(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.signin.internal.ISignInService");
        return iInterfaceQueryLocalInterface instanceof d ? (d) iInterfaceQueryLocalInterface : new d(iBinder, "com.google.android.gms.signin.internal.ISignInService", 3);
    }

    @Override // sg.e
    public final Bundle getGetServiceRequestExtraArgs() {
        t tVar = this.f49233d;
        boolean zEquals = getContext().getPackageName().equals((String) tVar.f18112d);
        Bundle bundle = this.f49234e;
        if (!zEquals) {
            bundle.putString("com.google.android.gms.signin.internal.realClientPackageName", (String) tVar.f18112d);
        }
        return bundle;
    }

    @Override // sg.e
    public final int getMinApkVersion() {
        return 12451000;
    }

    @Override // sg.e
    public final String getServiceDescriptor() {
        return "com.google.android.gms.signin.internal.ISignInService";
    }

    @Override // sg.e
    public final String getStartServiceAction() {
        return "com.google.android.gms.signin.service.START";
    }

    @Override // sg.e, qg.c
    public final boolean requiresSignIn() {
        return this.f49232c;
    }
}
