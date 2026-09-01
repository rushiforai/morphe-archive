package defpackage;

import android.accounts.Account;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.Scope;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zb5 extends k2 {
    public static final Parcelable.Creator<zb5> CREATOR = new r4g(8);
    public static final Scope[] o = new Scope[0];
    public static final da4[] p = new da4[0];
    public final int a;
    public final int b;
    public final int c;
    public String d;
    public IBinder e;
    public Scope[] f;
    public Bundle g;
    public Account h;
    public da4[] i;
    public da4[] j;
    public final boolean k;
    public final int l;
    public boolean m;
    public final String n;

    public zb5(int i, int i2, int i3, String str, IBinder iBinder, Scope[] scopeArr, Bundle bundle, Account account, da4[] da4VarArr, da4[] da4VarArr2, boolean z, int i4, boolean z2, String str2) {
        scopeArr = scopeArr == null ? o : scopeArr;
        bundle = bundle == null ? new Bundle() : bundle;
        da4[] da4VarArr3 = p;
        da4VarArr = da4VarArr == null ? da4VarArr3 : da4VarArr;
        da4VarArr2 = da4VarArr2 == null ? da4VarArr3 : da4VarArr2;
        this.a = i;
        this.b = i2;
        this.c = i3;
        if ("com.google.android.gms".equals(str)) {
            this.d = "com.google.android.gms";
        } else {
            this.d = str;
        }
        if (i < 2) {
            Account accountA = null;
            if (iBinder != null) {
                int i5 = m5.f;
                IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.IAccountAccessor");
                IInterface dmgVar = iInterfaceQueryLocalInterface instanceof ut5 ? (ut5) iInterfaceQueryLocalInterface : new dmg(iBinder);
                long jClearCallingIdentity = Binder.clearCallingIdentity();
                try {
                    try {
                        accountA = ((dmg) dmgVar).a();
                    } catch (RemoteException unused) {
                        Log.w("AccountAccessor", "Remote account accessor probably died");
                    }
                } finally {
                    Binder.restoreCallingIdentity(jClearCallingIdentity);
                }
            }
            this.h = accountA;
        } else {
            this.e = iBinder;
            this.h = account;
        }
        this.f = scopeArr;
        this.g = bundle;
        this.i = da4VarArr;
        this.j = da4VarArr2;
        this.k = z;
        this.l = i4;
        this.m = z2;
        this.n = str2;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        r4g.a(this, parcel, i);
    }
}
