package androidx.room;

import android.os.BadParcelableException;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import b.c0;
import com.google.android.gms.common.api.ApiMetadata;
import com.google.android.gms.common.api.Status;
import java.util.Objects;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import sp.b0;

/* loaded from: classes2.dex */
public final class k extends Binder implements IInterface {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15235a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f15236b;

    public k(kh.c cVar, fi.j jVar) {
        this.f15236b = jVar;
        Objects.requireNonNull(cVar);
        attachInterface(this, "com.google.android.gms.cloudmessaging.internal.IRegisterCallback");
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        int i5 = this.f15235a;
        return this;
    }

    @Override // android.os.Binder
    public final boolean onTransact(int i5, Parcel parcel, Parcel parcel2, int i11) {
        g callback = null;
        g callback2 = null;
        int i12 = 0;
        switch (this.f15235a) {
            case 0:
                if (i5 >= 1 && i5 <= 16777215) {
                    parcel.enforceInterface("androidx.room.IMultiInstanceInvalidationService");
                }
                if (i5 == 1598968902) {
                    parcel2.writeString("androidx.room.IMultiInstanceInvalidationService");
                    return true;
                }
                if (i5 == 1) {
                    IBinder strongBinder = parcel.readStrongBinder();
                    if (strongBinder != null) {
                        IInterface iInterfaceQueryLocalInterface = strongBinder.queryLocalInterface("androidx.room.IMultiInstanceInvalidationCallback");
                        if (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof g)) {
                            callback = new g();
                            callback.f15217a = strongBinder;
                        } else {
                            callback = (g) iInterfaceQueryLocalInterface;
                        }
                    }
                    String string = parcel.readString();
                    Intrinsics.g(callback, "callback");
                    if (string != null) {
                        MultiInstanceInvalidationService multiInstanceInvalidationService = (MultiInstanceInvalidationService) this.f15236b;
                        synchronized (multiInstanceInvalidationService.f15200c) {
                            try {
                                int i13 = multiInstanceInvalidationService.f15198a + 1;
                                multiInstanceInvalidationService.f15198a = i13;
                                if (multiInstanceInvalidationService.f15200c.register(callback, Integer.valueOf(i13))) {
                                    multiInstanceInvalidationService.f15199b.put(Integer.valueOf(i13), string);
                                    i12 = i13;
                                } else {
                                    multiInstanceInvalidationService.f15198a--;
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                    }
                    parcel2.writeNoException();
                    parcel2.writeInt(i12);
                    return true;
                }
                if (i5 == 2) {
                    IBinder strongBinder2 = parcel.readStrongBinder();
                    if (strongBinder2 != null) {
                        IInterface iInterfaceQueryLocalInterface2 = strongBinder2.queryLocalInterface("androidx.room.IMultiInstanceInvalidationCallback");
                        if (iInterfaceQueryLocalInterface2 == null || !(iInterfaceQueryLocalInterface2 instanceof g)) {
                            callback2 = new g();
                            callback2.f15217a = strongBinder2;
                        } else {
                            callback2 = (g) iInterfaceQueryLocalInterface2;
                        }
                    }
                    int i14 = parcel.readInt();
                    Intrinsics.g(callback2, "callback");
                    MultiInstanceInvalidationService multiInstanceInvalidationService2 = (MultiInstanceInvalidationService) this.f15236b;
                    synchronized (multiInstanceInvalidationService2.f15200c) {
                        multiInstanceInvalidationService2.f15200c.unregister(callback2);
                    }
                    parcel2.writeNoException();
                    return true;
                }
                if (i5 != 3) {
                    return super.onTransact(i5, parcel, parcel2, i11);
                }
                int i15 = parcel.readInt();
                String[] tables = parcel.createStringArray();
                Intrinsics.g(tables, "tables");
                MultiInstanceInvalidationService multiInstanceInvalidationService3 = (MultiInstanceInvalidationService) this.f15236b;
                synchronized (multiInstanceInvalidationService3.f15200c) {
                    String str = (String) multiInstanceInvalidationService3.f15199b.get(Integer.valueOf(i15));
                    if (str == null) {
                        Log.w("ROOM", "Remote invalidation client ID not registered");
                        return true;
                    }
                    int iBeginBroadcast = multiInstanceInvalidationService3.f15200c.beginBroadcast();
                    while (i12 < iBeginBroadcast) {
                        try {
                            Object broadcastCookie = multiInstanceInvalidationService3.f15200c.getBroadcastCookie(i12);
                            Intrinsics.e(broadcastCookie, "null cannot be cast to non-null type kotlin.Int");
                            Integer num = (Integer) broadcastCookie;
                            int iIntValue = num.intValue();
                            String str2 = (String) multiInstanceInvalidationService3.f15199b.get(num);
                            if (i15 != iIntValue && str.equals(str2)) {
                                try {
                                    ((g) multiInstanceInvalidationService3.f15200c.getBroadcastItem(i12)).T(tables);
                                } catch (RemoteException e3) {
                                    Log.w("ROOM", "Error invoking a remote callback", e3);
                                }
                            }
                            i12++;
                        } catch (Throwable th3) {
                            multiInstanceInvalidationService3.f15200c.finishBroadcast();
                            throw th3;
                        }
                    }
                    multiInstanceInvalidationService3.f15200c.finishBroadcast();
                    Unit unit = Unit.f71706a;
                    return true;
                }
            case 1:
                if (i5 > 16777215) {
                    if (!super.onTransact(i5, parcel, parcel2, i11)) {
                    }
                    return true;
                }
                parcel.enforceInterface(getInterfaceDescriptor());
                if (i5 != 1) {
                    return false;
                }
                Status statusCreateFromParcel = parcel.readInt() == 0 ? null : Status.CREATOR.createFromParcel(parcel);
                String string2 = parcel.readString();
                ApiMetadata apiMetadataCreateFromParcel = parcel.readInt() != 0 ? ApiMetadata.CREATOR.createFromParcel(parcel) : null;
                int iDataAvail = parcel.dataAvail();
                if (iDataAvail > 0) {
                    throw new BadParcelableException(c0.p(new StringBuilder(String.valueOf(iDataAvail).length() + 45), "Parcel data not fully consumed, unread size: ", iDataAvail));
                }
                u90.b.c0(statusCreateFromParcel, string2, (fi.j) this.f15236b);
                return true;
            default:
                if (i5 == 1) {
                    parcel.enforceInterface("com.android.vending.licensing.ILicenseResultListener");
                    ((b0) this.f15236b).f87568c.t(parcel.readInt(), parcel.readString(), parcel.readString());
                    return true;
                }
                if (i5 != 1598968902) {
                    return super.onTransact(i5, parcel, parcel2, i11);
                }
                parcel2.writeString("com.android.vending.licensing.ILicenseResultListener");
                return true;
        }
    }

    public k(MultiInstanceInvalidationService multiInstanceInvalidationService) {
        this.f15236b = multiInstanceInvalidationService;
        attachInterface(this, "androidx.room.IMultiInstanceInvalidationService");
    }

    public k(b0 b0Var) {
        this.f15236b = b0Var;
        attachInterface(this, "com.android.vending.licensing.ILicenseResultListener");
    }
}
