package android.support.v4.media.session;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import defpackage.an7;
import defpackage.fu5;
import defpackage.gu5;
import defpackage.iu5;
import defpackage.wm7;
import defpackage.ywb;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b extends Binder implements iu5 {
    public static final /* synthetic */ int f = 0;
    public final AtomicReference e;

    public b(wm7 wm7Var) {
        attachInterface(this, "android.support.v4.media.session.IMediaSession");
        this.e = new AtomicReference(wm7Var);
    }

    public final void a(gu5 gu5Var) {
        wm7 wm7Var = (wm7) this.e.get();
        if (wm7Var == null) {
            return;
        }
        wm7Var.e.register(gu5Var, new an7("android.media.session.MediaController", Binder.getCallingPid(), Binder.getCallingUid()));
        synchronized (wm7Var.d) {
        }
    }

    @Override // android.os.Binder
    public final boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) {
        int i3;
        if (i >= 1 && i <= 16777215) {
            parcel.enforceInterface("android.support.v4.media.session.IMediaSession");
        }
        if (i == 1598968902) {
            parcel2.writeString("android.support.v4.media.session.IMediaSession");
            return true;
        }
        gu5 gu5Var = null;
        gu5 gu5Var2 = null;
        switch (i) {
            case 1:
                parcel.readString();
                ywb.d();
                return false;
            case 2:
                ywb.d();
                return false;
            case 3:
                IBinder strongBinder = parcel.readStrongBinder();
                if (strongBinder != null) {
                    IInterface iInterfaceQueryLocalInterface = strongBinder.queryLocalInterface("android.support.v4.media.session.IMediaControllerCallback");
                    if (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof gu5)) {
                        fu5 fu5Var = new fu5();
                        fu5Var.e = strongBinder;
                        gu5Var = fu5Var;
                    } else {
                        gu5Var = (gu5) iInterfaceQueryLocalInterface;
                    }
                }
                a(gu5Var);
                parcel2.writeNoException();
                return true;
            case 4:
                IBinder strongBinder2 = parcel.readStrongBinder();
                if (strongBinder2 != null) {
                    IInterface iInterfaceQueryLocalInterface2 = strongBinder2.queryLocalInterface("android.support.v4.media.session.IMediaControllerCallback");
                    if (iInterfaceQueryLocalInterface2 == null || !(iInterfaceQueryLocalInterface2 instanceof gu5)) {
                        fu5 fu5Var2 = new fu5();
                        fu5Var2.e = strongBinder2;
                        gu5Var2 = fu5Var2;
                    } else {
                        gu5Var2 = (gu5) iInterfaceQueryLocalInterface2;
                    }
                }
                wm7 wm7Var = (wm7) this.e.get();
                if (wm7Var != null) {
                    wm7Var.e.unregister(gu5Var2);
                    Binder.getCallingPid();
                    Binder.getCallingUid();
                    synchronized (wm7Var.d) {
                        break;
                    }
                }
                parcel2.writeNoException();
                return true;
            case 5:
                ywb.d();
                return false;
            case 6:
                ywb.d();
                return false;
            case 7:
                ywb.d();
                return false;
            case 8:
                ywb.d();
                return false;
            case 9:
                ywb.d();
                return false;
            case 10:
                ywb.d();
                return false;
            case 11:
                parcel.readInt();
                parcel.readInt();
                parcel.readString();
                ywb.d();
                return false;
            case 12:
                parcel.readInt();
                parcel.readInt();
                parcel.readString();
                ywb.d();
                return false;
            case 13:
                ywb.d();
                return false;
            case 14:
                parcel.readString();
                ywb.d();
                return false;
            case 15:
                parcel.readString();
                ywb.d();
                return false;
            case 16:
                ywb.d();
                return false;
            case 17:
                parcel.readLong();
                ywb.d();
                return false;
            case 18:
                ywb.d();
                return false;
            case 19:
                ywb.d();
                return false;
            case 20:
                ywb.d();
                return false;
            case 21:
                ywb.d();
                return false;
            case 22:
                ywb.d();
                return false;
            case 23:
                ywb.d();
                return false;
            case 24:
                parcel.readLong();
                ywb.d();
                return false;
            case 25:
                ywb.d();
                return false;
            case 26:
                parcel.readString();
                ywb.d();
                return false;
            case 27:
                ywb.d();
                return false;
            case 28:
                parcel2.writeNoException();
                parcel2.writeInt(0);
                return true;
            case 29:
                parcel2.writeNoException();
                parcel2.writeInt(-1);
                return true;
            case 30:
                ywb.d();
                return false;
            case 31:
                ywb.d();
                return false;
            case 32:
                parcel2.writeNoException();
                parcel2.writeInt(0);
                return true;
            case 33:
                ywb.d();
                return false;
            case 34:
                parcel.readString();
                ywb.d();
                return false;
            case 35:
                parcel.readString();
                ywb.d();
                return false;
            case 36:
                ywb.d();
                return false;
            case 37:
                i3 = ((wm7) this.e.get()) != null ? 0 : -1;
                parcel2.writeNoException();
                parcel2.writeInt(i3);
                return true;
            case 38:
                parcel2.writeNoException();
                parcel2.writeInt(0);
                return true;
            case 39:
                parcel.readInt();
                ywb.d();
                return false;
            case 40:
                parcel.readInt();
                parcel2.writeNoException();
                return true;
            case 41:
                ywb.d();
                return false;
            case 42:
                parcel.readInt();
                ywb.d();
                return false;
            case 43:
                ywb.d();
                return false;
            case 44:
                parcel.readInt();
                ywb.d();
                return false;
            case 45:
                parcel2.writeNoException();
                parcel2.writeInt(0);
                return true;
            case 46:
                parcel.readInt();
                ywb.d();
                return false;
            case 47:
                i3 = ((wm7) this.e.get()) != null ? 0 : -1;
                parcel2.writeNoException();
                parcel2.writeInt(i3);
                return true;
            case 48:
                parcel.readInt();
                ywb.d();
                return false;
            case 49:
                parcel.readFloat();
                ywb.d();
                return false;
            case 50:
                ((wm7) this.e.get()).getClass();
                parcel2.writeNoException();
                parcel2.writeInt(0);
                return true;
            case 51:
                ywb.d();
                return false;
            default:
                return super.onTransact(i, parcel, parcel2, i2);
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this;
    }
}
