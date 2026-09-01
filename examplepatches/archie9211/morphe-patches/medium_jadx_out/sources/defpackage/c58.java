package defpackage;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import androidx.room.MultiInstanceInvalidationService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c58 extends Binder implements lu5 {
    public final /* synthetic */ MultiInstanceInvalidationService e;

    public c58(MultiInstanceInvalidationService multiInstanceInvalidationService) {
        this.e = multiInstanceInvalidationService;
        attachInterface(this, lu5.b);
    }

    public final int a(ku5 ku5Var, String str) {
        ku5Var.getClass();
        int i = 0;
        if (str == null) {
            return 0;
        }
        MultiInstanceInvalidationService multiInstanceInvalidationService = this.e;
        synchronized (multiInstanceInvalidationService.c) {
            try {
                int i2 = multiInstanceInvalidationService.a + 1;
                multiInstanceInvalidationService.a = i2;
                if (multiInstanceInvalidationService.c.register(ku5Var, Integer.valueOf(i2))) {
                    multiInstanceInvalidationService.b.put(Integer.valueOf(i2), str);
                    i = i2;
                } else {
                    multiInstanceInvalidationService.a--;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return i;
    }

    public final void c(ku5 ku5Var, int i) {
        ku5Var.getClass();
        MultiInstanceInvalidationService multiInstanceInvalidationService = this.e;
        synchronized (multiInstanceInvalidationService.c) {
            multiInstanceInvalidationService.c.unregister(ku5Var);
        }
    }

    @Override // android.os.Binder
    public final boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) {
        d58 d58Var;
        String str = lu5.b;
        if (i >= 1 && i <= 16777215) {
            parcel.enforceInterface(str);
        }
        if (i == 1598968902) {
            parcel2.writeString(str);
            return true;
        }
        ku5 ku5Var = null;
        ku5 ku5Var2 = null;
        if (i == 1) {
            IBinder strongBinder = parcel.readStrongBinder();
            if (strongBinder != null) {
                IInterface iInterfaceQueryLocalInterface = strongBinder.queryLocalInterface(ku5.a);
                if (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof ku5)) {
                    ju5 ju5Var = new ju5();
                    ju5Var.e = strongBinder;
                    ku5Var = ju5Var;
                } else {
                    ku5Var = (ku5) iInterfaceQueryLocalInterface;
                }
            }
            int iA = a(ku5Var, parcel.readString());
            parcel2.writeNoException();
            parcel2.writeInt(iA);
            return true;
        }
        if (i == 2) {
            IBinder strongBinder2 = parcel.readStrongBinder();
            if (strongBinder2 != null) {
                IInterface iInterfaceQueryLocalInterface2 = strongBinder2.queryLocalInterface(ku5.a);
                if (iInterfaceQueryLocalInterface2 == null || !(iInterfaceQueryLocalInterface2 instanceof ku5)) {
                    ju5 ju5Var2 = new ju5();
                    ju5Var2.e = strongBinder2;
                    ku5Var2 = ju5Var2;
                } else {
                    ku5Var2 = (ku5) iInterfaceQueryLocalInterface2;
                }
            }
            c(ku5Var2, parcel.readInt());
            parcel2.writeNoException();
            return true;
        }
        if (i != 3) {
            return super.onTransact(i, parcel, parcel2, i2);
        }
        int i3 = parcel.readInt();
        String[] strArrCreateStringArray = parcel.createStringArray();
        strArrCreateStringArray.getClass();
        MultiInstanceInvalidationService multiInstanceInvalidationService = this.e;
        synchronized (multiInstanceInvalidationService.c) {
            String str2 = (String) multiInstanceInvalidationService.b.get(Integer.valueOf(i3));
            if (str2 == null) {
                Log.w("ROOM", "Remote invalidation client ID not registered");
            } else {
                int iBeginBroadcast = multiInstanceInvalidationService.c.beginBroadcast();
                int i4 = 0;
                while (true) {
                    d58Var = multiInstanceInvalidationService.c;
                    if (i4 >= iBeginBroadcast) {
                        break;
                    }
                    try {
                        Object broadcastCookie = d58Var.getBroadcastCookie(i4);
                        broadcastCookie.getClass();
                        Integer num = (Integer) broadcastCookie;
                        int iIntValue = num.intValue();
                        String str3 = (String) multiInstanceInvalidationService.b.get(num);
                        if (i3 != iIntValue && str2.equals(str3)) {
                            try {
                                ((ku5) multiInstanceInvalidationService.c.getBroadcastItem(i4)).b(strArrCreateStringArray);
                            } catch (RemoteException e) {
                                Log.w("ROOM", "Error invoking a remote callback", e);
                            }
                        }
                        i4++;
                    } catch (Throwable th) {
                        multiInstanceInvalidationService.c.finishBroadcast();
                        throw th;
                    }
                }
                d58Var.finishBroadcast();
            }
        }
        return true;
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this;
    }
}
