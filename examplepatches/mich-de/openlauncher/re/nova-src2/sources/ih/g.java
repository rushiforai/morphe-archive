package ih;

import android.app.PendingIntent;
import android.os.BadParcelableException;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Message;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;
import b.c0;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.identitycredentials.ClearCredentialStateResponse;
import com.google.android.gms.identitycredentials.CreateCredentialHandle;
import com.google.android.gms.identitycredentials.PendingGetCredentialHandle;
import com.google.android.gms.identitycredentials.SignalCredentialStateResponse;
import com.google.android.play.core.install.InstallException;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import kk.m;
import kotlin.jvm.internal.Intrinsics;
import ps.j0;

/* loaded from: classes3.dex */
public abstract class g extends Binder implements IInterface {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61601a;

    public /* synthetic */ g(int i5) {
        this.f61601a = i5;
    }

    public static void T(Parcel parcel) {
        int iDataAvail = parcel.dataAvail();
        if (iDataAvail > 0) {
            throw new BadParcelableException(c0.p(new StringBuilder(String.valueOf(iDataAvail).length() + 45), "Parcel data not fully consumed, unread size: ", iDataAvail));
        }
    }

    public abstract boolean U(int i5, Parcel parcel, Parcel parcel2);

    public abstract boolean V(int i5, Parcel parcel, Parcel parcel2);

    public abstract boolean W(int i5, Parcel parcel, Parcel parcel2);

    public abstract boolean X(Parcel parcel, int i5);

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        int i5 = this.f61601a;
        return this;
    }

    @Override // android.os.Binder
    public final boolean onTransact(int i5, Parcel parcel, Parcel parcel2, int i11) throws RemoteException {
        boolean zOnTransact;
        boolean zOnTransact2;
        switch (this.f61601a) {
            case 0:
                if (i5 <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i5, parcel, parcel2, i11)) {
                    return true;
                }
                return V(i5, parcel, parcel2);
            case 1:
                if (i5 <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i5, parcel, parcel2, i11)) {
                    return true;
                }
                return U(i5, parcel, parcel2);
            case 2:
                if (i5 > 16777215) {
                    if (!super.onTransact(i5, parcel, parcel2, i11)) {
                    }
                    return true;
                }
                parcel.enforceInterface(getInterfaceDescriptor());
                jk.g gVar = (jk.g) this;
                if (i5 == 2) {
                    Bundle bundle = (Bundle) (parcel.readInt() != 0 ? (Parcelable) Bundle.CREATOR.createFromParcel(parcel) : null);
                    int iDataAvail = parcel.dataAvail();
                    if (iDataAvail > 0) {
                        throw new BadParcelableException(c0.h(iDataAvail, "Parcel data not fully consumed, unread size: "));
                    }
                    m mVar = gVar.f69584d.f69588a;
                    fi.j jVar = gVar.f69583c;
                    mVar.c(jVar);
                    gVar.f69582b.i("onRequestInfo", new Object[0]);
                    if (bundle.getInt("error.code", -2) != 0) {
                        jVar.b(new InstallException(bundle.getInt("error.code", -2)));
                    } else {
                        bundle.getInt("version.code", -1);
                        int i12 = bundle.getInt("update.availability");
                        bundle.getInt("install.status", 0);
                        if (bundle.getInt("client.version.staleness", -1) != -1) {
                            bundle.getInt("client.version.staleness");
                        }
                        bundle.getInt("in.app.update.priority", 0);
                        bundle.getLong("bytes.downloaded");
                        bundle.getLong("total.bytes.to.download");
                        long j11 = bundle.getLong("additional.size.required");
                        jk.i iVar = gVar.f69585e.f69591d;
                        iVar.getClass();
                        long jA = jk.i.a(new File(iVar.f69592a.getFilesDir(), "assetpacks"));
                        PendingIntent pendingIntent = (PendingIntent) bundle.getParcelable("blocking.intent");
                        PendingIntent pendingIntent2 = (PendingIntent) bundle.getParcelable("nonblocking.intent");
                        PendingIntent pendingIntent3 = (PendingIntent) bundle.getParcelable("blocking.destructive.intent");
                        PendingIntent pendingIntent4 = (PendingIntent) bundle.getParcelable("nonblocking.destructive.intent");
                        HashMap map = new HashMap();
                        ArrayList<Integer> integerArrayList = bundle.getIntegerArrayList("update.precondition.failures:blocking.destructive.intent");
                        HashSet hashSet = new HashSet();
                        if (integerArrayList != null) {
                            hashSet.addAll(integerArrayList);
                        }
                        map.put("blocking.destructive.intent", hashSet);
                        ArrayList<Integer> integerArrayList2 = bundle.getIntegerArrayList("update.precondition.failures:nonblocking.destructive.intent");
                        HashSet hashSet2 = new HashSet();
                        if (integerArrayList2 != null) {
                            hashSet2.addAll(integerArrayList2);
                        }
                        map.put("nonblocking.destructive.intent", hashSet2);
                        ArrayList<Integer> integerArrayList3 = bundle.getIntegerArrayList("update.precondition.failures:blocking.intent");
                        HashSet hashSet3 = new HashSet();
                        if (integerArrayList3 != null) {
                            hashSet3.addAll(integerArrayList3);
                        }
                        map.put("blocking.intent", hashSet3);
                        ArrayList<Integer> integerArrayList4 = bundle.getIntegerArrayList("update.precondition.failures:nonblocking.intent");
                        HashSet hashSet4 = new HashSet();
                        if (integerArrayList4 != null) {
                            hashSet4.addAll(integerArrayList4);
                        }
                        map.put("nonblocking.intent", hashSet4);
                        jVar.c(new jk.a(i12, j11, jA, pendingIntent, pendingIntent2, pendingIntent3, pendingIntent4));
                    }
                } else {
                    if (i5 != 3) {
                        return false;
                    }
                    int iDataAvail2 = parcel.dataAvail();
                    if (iDataAvail2 > 0) {
                        throw new BadParcelableException(c0.h(iDataAvail2, "Parcel data not fully consumed, unread size: "));
                    }
                    gVar.f69584d.f69588a.c(gVar.f69583c);
                    gVar.f69582b.i("onCompleteUpdate", new Object[0]);
                }
                return true;
            case 3:
                if (i5 > 16777215) {
                    zOnTransact = super.onTransact(i5, parcel, parcel2, i11);
                } else {
                    parcel.enforceInterface(getInterfaceDescriptor());
                    zOnTransact = false;
                }
                if (!zOnTransact) {
                    fh.f fVar = (fh.f) this;
                    switch (i5) {
                        case 1:
                            Status status = (Status) nh.a.a(parcel, Status.CREATOR);
                            PendingGetCredentialHandle pendingGetCredentialHandle = (PendingGetCredentialHandle) nh.a.a(parcel, PendingGetCredentialHandle.CREATOR);
                            T(parcel);
                            fVar.I(status, pendingGetCredentialHandle);
                            break;
                        case 2:
                            Status status2 = (Status) nh.a.a(parcel, Status.CREATOR);
                            T(parcel);
                            Intrinsics.g(status2, "status");
                            throw new UnsupportedOperationException();
                        case 3:
                            Status status3 = (Status) nh.a.a(parcel, Status.CREATOR);
                            T(parcel);
                            Intrinsics.g(status3, "status");
                            throw new UnsupportedOperationException();
                        case 4:
                            Status status4 = (Status) nh.a.a(parcel, Status.CREATOR);
                            T(parcel);
                            Intrinsics.g(status4, "status");
                            throw new UnsupportedOperationException();
                        case 5:
                            Status status5 = (Status) nh.a.a(parcel, Status.CREATOR);
                            T(parcel);
                            Intrinsics.g(status5, "status");
                            throw new UnsupportedOperationException();
                        case 6:
                            Status status6 = (Status) nh.a.a(parcel, Status.CREATOR);
                            T(parcel);
                            Intrinsics.g(status6, "status");
                            throw new UnsupportedOperationException();
                        case 7:
                            Status status7 = (Status) nh.a.a(parcel, Status.CREATOR);
                            CreateCredentialHandle createCredentialHandle = (CreateCredentialHandle) nh.a.a(parcel, CreateCredentialHandle.CREATOR);
                            T(parcel);
                            fVar.s(status7, createCredentialHandle);
                            break;
                        case 8:
                            Status status8 = (Status) nh.a.a(parcel, Status.CREATOR);
                            T(parcel);
                            Intrinsics.g(status8, "status");
                            throw new UnsupportedOperationException();
                        case 9:
                            Status status9 = (Status) nh.a.a(parcel, Status.CREATOR);
                            ClearCredentialStateResponse clearCredentialStateResponse = (ClearCredentialStateResponse) nh.a.a(parcel, ClearCredentialStateResponse.CREATOR);
                            T(parcel);
                            fVar.P(status9, clearCredentialStateResponse);
                            break;
                        case 10:
                            Status status10 = (Status) nh.a.a(parcel, Status.CREATOR);
                            SignalCredentialStateResponse signalCredentialStateResponse = (SignalCredentialStateResponse) nh.a.a(parcel, SignalCredentialStateResponse.CREATOR);
                            T(parcel);
                            fVar.x(status10, signalCredentialStateResponse);
                            break;
                        case 11:
                            Status status11 = (Status) nh.a.a(parcel, Status.CREATOR);
                            T(parcel);
                            Intrinsics.g(status11, "status");
                            throw new UnsupportedOperationException();
                        case 12:
                            Status status12 = (Status) nh.a.a(parcel, Status.CREATOR);
                            T(parcel);
                            Intrinsics.g(status12, "status");
                            throw new UnsupportedOperationException();
                        case 13:
                            Status status13 = (Status) nh.a.a(parcel, Status.CREATOR);
                            T(parcel);
                            Intrinsics.g(status13, "status");
                            throw new UnsupportedOperationException();
                        case 14:
                            Status status14 = (Status) nh.a.a(parcel, Status.CREATOR);
                            T(parcel);
                            Intrinsics.g(status14, "status");
                            throw new UnsupportedOperationException();
                        case 15:
                            Status status15 = (Status) nh.a.a(parcel, Status.CREATOR);
                            T(parcel);
                            Intrinsics.g(status15, "status");
                            throw new UnsupportedOperationException();
                        default:
                            return false;
                    }
                }
                return true;
            case 4:
                if (i5 <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i5, parcel, parcel2, i11)) {
                    return true;
                }
                return X(parcel, i5);
            case 5:
                if (i5 > 16777215) {
                    zOnTransact2 = super.onTransact(i5, parcel, parcel2, i11);
                } else {
                    parcel.enforceInterface(getInterfaceDescriptor());
                    zOnTransact2 = false;
                }
                if (!zOnTransact2) {
                    Handler handler = ((yi.c) this).f97324b;
                    if (i5 == 1) {
                        float f11 = parcel.readFloat();
                        handler.removeMessages(2);
                        Message.obtain(handler, 2, Float.valueOf(f11)).sendToTarget();
                    } else {
                        if (i5 != 2) {
                            return false;
                        }
                        Message.obtain(handler, 4, parcel.readInt(), 0).sendToTarget();
                    }
                }
                return true;
            case 6:
                if (i5 <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i5, parcel, parcel2, i11)) {
                    return true;
                }
                return W(i5, parcel, parcel2);
            case 7:
                if (i5 <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i5, parcel, parcel2, i11)) {
                    return true;
                }
                return X(parcel, i5);
            case 8:
                if (i5 <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i5, parcel, parcel2, i11)) {
                    return true;
                }
                com.google.android.play.core.review.c cVar = (com.google.android.play.core.review.c) this;
                if (i5 != 2) {
                    return false;
                }
                Bundle bundle2 = (Bundle) (parcel.readInt() == 0 ? null : (Parcelable) Bundle.CREATOR.createFromParcel(parcel));
                int iDataAvail3 = parcel.dataAvail();
                if (iDataAvail3 > 0) {
                    throw new BadParcelableException(c0.h(iDataAvail3, "Parcel data not fully consumed, unread size: "));
                }
                cVar.G(bundle2);
                return true;
            default:
                if (i5 <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i5, parcel, parcel2, i11)) {
                    return true;
                }
                ok.f fVar2 = (ok.f) this;
                if (i5 == 2) {
                    Parcelable.Creator creator = Bundle.CREATOR;
                    Bundle bundle3 = (Bundle) j0.j(parcel);
                    j0.l(parcel);
                    fVar2.C(bundle3);
                    return true;
                }
                if (i5 == 3) {
                    Parcelable.Creator creator2 = Bundle.CREATOR;
                    Bundle bundle4 = (Bundle) j0.j(parcel);
                    j0.l(parcel);
                    fVar2.e(bundle4);
                    return true;
                }
                fi.j jVar2 = fVar2.f80468b;
                ok.h hVar = fVar2.f80469c;
                if (i5 == 4) {
                    Parcelable.Creator creator3 = Bundle.CREATOR;
                    j0.l(parcel);
                    hVar.f80478e.c(jVar2);
                    return true;
                }
                if (i5 != 5) {
                    return false;
                }
                Parcelable.Creator creator4 = Bundle.CREATOR;
                j0.l(parcel);
                hVar.f80478e.c(jVar2);
                return true;
        }
    }

    public g(String str, int i5) {
        this.f61601a = i5;
        switch (i5) {
            case 1:
                attachInterface(this, str);
                break;
            case 2:
            case 3:
            case 5:
            default:
                attachInterface(this, str);
                break;
            case 4:
                attachInterface(this, str);
                break;
            case 6:
                attachInterface(this, str);
                break;
            case 7:
                attachInterface(this, str);
                break;
        }
    }
}
