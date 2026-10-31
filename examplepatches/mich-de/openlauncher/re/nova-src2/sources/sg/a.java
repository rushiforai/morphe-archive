package sg;

import android.accounts.Account;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import b.s8;

/* loaded from: classes3.dex */
public abstract class a extends s8 implements g {
    public static g U(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.IAccountAccessor");
        return iInterfaceQueryLocalInterface instanceof g ? (g) iInterfaceQueryLocalInterface : new i0(iBinder, "com.google.android.gms.common.internal.IAccountAccessor", 0);
    }

    public static Account V(g gVar) {
        if (gVar == null) {
            return null;
        }
        long jClearCallingIdentity = Binder.clearCallingIdentity();
        try {
            i0 i0Var = (i0) gVar;
            Parcel parcelT = i0Var.T(i0Var.U(), 2);
            Account account = (Account) u90.b.j0(parcelT, Account.CREATOR);
            parcelT.recycle();
            return account;
        } catch (RemoteException unused) {
            Log.w("AccountAccessor", "Remote account accessor probably died");
            return null;
        } finally {
            Binder.restoreCallingIdentity(jClearCallingIdentity);
        }
    }
}
