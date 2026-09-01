package defpackage;

import android.app.PendingIntent;
import android.os.BadParcelableException;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Process;
import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.play.core.integrity.StandardIntegrityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ihf extends Binder implements IInterface {
    public final /* synthetic */ int e;

    public ihf(String str, int i) {
        this.e = i;
        switch (i) {
            case 2:
                attachInterface(this, str);
                break;
            case 3:
                attachInterface(this, str);
                break;
            case 4:
            default:
                attachInterface(this, str);
                break;
            case 5:
                attachInterface(this, str);
                break;
            case 6:
                attachInterface(this, str);
                break;
        }
    }

    public static void g(Parcel parcel) {
        int i = nvf.a;
        int iDataAvail = parcel.dataAvail();
        if (iDataAvail > 0) {
            throw new BadParcelableException(b09.w(iDataAvail, "Parcel data not fully consumed, unread size: "));
        }
    }

    public static void h(Parcel parcel) {
        int i = nxf.a;
        int iDataAvail = parcel.dataAvail();
        if (iDataAvail > 0) {
            throw new BadParcelableException(b09.w(iDataAvail, "Parcel data not fully consumed, unread size: "));
        }
    }

    public static void i(Parcel parcel) {
        int i = qxf.a;
        int iDataAvail = parcel.dataAvail();
        if (iDataAvail > 0) {
            throw new BadParcelableException(b09.A(new StringBuilder(String.valueOf(iDataAvail).length() + 45), iDataAvail, "Parcel data not fully consumed, unread size: "));
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        int i = this.e;
        return this;
    }

    public abstract boolean e(int i, Parcel parcel);

    public abstract boolean f(int i, Parcel parcel, Parcel parcel2);

    public abstract boolean j(int i, Parcel parcel, Parcel parcel2);

    public abstract boolean k(int i, Parcel parcel, Parcel parcel2);

    public boolean l(int i, Parcel parcel, Parcel parcel2) {
        return false;
    }

    public abstract void m(Status status, o44 o44Var);

    public abstract void n(Status status, s16 s16Var);

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
    @Override // android.os.Binder
    public final boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
        boolean zOnTransact;
        boolean zOnTransact2 = false;
        boolean zOnTransact3 = false;
        switch (this.e) {
            case 0:
                if (i <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i, parcel, parcel2, i2)) {
                    return true;
                }
                nhf nhfVar = (nhf) this;
                wfd wfdVar = nhfVar.f;
                phf phfVar = nhfVar.g;
                if (i == 2) {
                    Parcelable.Creator creator = Bundle.CREATOR;
                    Bundle bundle = (Bundle) vhf.a(parcel);
                    vhf.b(parcel);
                    switch (nhfVar.h) {
                        case 1:
                            nhfVar.p(bundle);
                            nhfVar.i.b("onWarmUpExpressIntegrityToken", new Object[0]);
                            nhfVar.j.d.getClass();
                            int i3 = bundle.getInt("error");
                            StandardIntegrityException standardIntegrityException = i3 != 0 ? new StandardIntegrityException(i3, null) : null;
                            wfd wfdVar2 = nhfVar.f;
                            if (standardIntegrityException != null) {
                                wfdVar2.c(standardIntegrityException);
                                return true;
                            }
                            wfdVar2.d(Long.valueOf(bundle.getLong("warm.up.sid")));
                            return true;
                        default:
                            nhfVar.p(bundle);
                            return true;
                    }
                }
                if (i != 3) {
                    if (i == 4) {
                        Parcelable.Creator creator2 = Bundle.CREATOR;
                        vhf.b(parcel);
                        phfVar.e.c(wfdVar);
                        return true;
                    }
                    if (i != 5) {
                        return false;
                    }
                    Parcelable.Creator creator3 = Bundle.CREATOR;
                    vhf.b(parcel);
                    phfVar.e.c(wfdVar);
                    return true;
                }
                Parcelable.Creator creator4 = Bundle.CREATOR;
                Bundle bundle2 = (Bundle) vhf.a(parcel);
                vhf.b(parcel);
                switch (nhfVar.h) {
                    case 0:
                        wfd wfdVar3 = nhfVar.f;
                        nhfVar.o(bundle2);
                        nhfVar.i.b("onRequestExpressIntegrityToken", new Object[0]);
                        nhfVar.j.d.getClass();
                        int i4 = bundle2.getInt("error");
                        Exception standardIntegrityException2 = i4 != 0 ? new StandardIntegrityException(i4, null) : null;
                        if (standardIntegrityException2 != null) {
                            wfdVar3.c(standardIntegrityException2);
                            return true;
                        }
                        bundle2.getLong("request.token.sid");
                        ev6.s(Process.myUid(), Process.myPid(), "UID: [", "]  PID: [", "] ").concat("IntegrityDialogWrapper");
                        String string = bundle2.getString("token");
                        if (string != null) {
                            wfdVar3.d(new rhf(string));
                            return true;
                        }
                        z72.c("Null token");
                        return true;
                    default:
                        nhfVar.o(bundle2);
                        return true;
                }
            case 1:
                if (i <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i, parcel, parcel2, i2)) {
                    return true;
                }
                return j(i, parcel, parcel2);
            case 2:
                if (i <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i, parcel, parcel2, i2)) {
                    return true;
                }
                return k(i, parcel, parcel2);
            case 3:
                if (i > 16777215) {
                    zOnTransact2 = super.onTransact(i, parcel, parcel2, i2);
                } else {
                    parcel.enforceInterface(getInterfaceDescriptor());
                }
                if (zOnTransact2) {
                    return true;
                }
                return f(i, parcel, parcel2);
            case 4:
                if (i <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i, parcel, parcel2, i2)) {
                    return true;
                }
                h6g h6gVar = (h6g) this;
                if (i != 2) {
                    return false;
                }
                Parcelable.Creator creator5 = Bundle.CREATOR;
                int i5 = jxf.a;
                Bundle bundle3 = (Bundle) (parcel.readInt() != 0 ? (Parcelable) creator5.createFromParcel(parcel) : null);
                int iDataAvail = parcel.dataAvail();
                if (iDataAvail > 0) {
                    throw new BadParcelableException(b09.w(iDataAvail, "Parcel data not fully consumed, unread size: "));
                }
                bmg bmgVar = h6gVar.h.a;
                if (bmgVar != null) {
                    wfd wfdVar4 = h6gVar.g;
                    synchronized (bmgVar.f) {
                        bmgVar.e.remove(wfdVar4);
                        break;
                    }
                    bmgVar.a().post(new hfg(zOnTransact2 ? 1 : 0, bmgVar));
                }
                h6gVar.f.h("onGetLaunchReviewFlowInfo", new Object[0]);
                h6gVar.g.d(new ukf((PendingIntent) bundle3.get("confirmation_intent"), bundle3.getBoolean("is_review_no_op")));
                return true;
            case 5:
                if (i > 16777215) {
                    zOnTransact3 = super.onTransact(i, parcel, parcel2, i2);
                } else {
                    parcel.enforceInterface(getInterfaceDescriptor());
                }
                if (zOnTransact3) {
                    return true;
                }
                return e(i, parcel);
            case 6:
                if (i <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i, parcel, parcel2, i2)) {
                    return true;
                }
                return l(i, parcel, parcel2);
            case 7:
                if (i > 16777215) {
                    zOnTransact = super.onTransact(i, parcel, parcel2, i2);
                } else {
                    parcel.enforceInterface(getInterfaceDescriptor());
                    zOnTransact = false;
                }
                if (zOnTransact) {
                    return true;
                }
                a66 a66Var = (a66) this;
                switch (i) {
                    case 1:
                        Status status = (Status) qxf.a(parcel, Status.CREATOR);
                        y79 y79Var = (y79) qxf.a(parcel, y79.CREATOR);
                        i(parcel);
                        int i6 = a66Var.f;
                        status.getClass();
                        switch (i6) {
                            case 1:
                                tp7.C(status, y79Var, a66Var.g);
                                return true;
                            default:
                                throw new UnsupportedOperationException();
                        }
                    case 2:
                        Status status2 = (Status) qxf.a(parcel, Status.CREATOR);
                        i(parcel);
                        status2.getClass();
                        rd6.b();
                        break;
                    case 3:
                        Status status3 = (Status) qxf.a(parcel, Status.CREATOR);
                        i(parcel);
                        status3.getClass();
                        rd6.b();
                        break;
                    case 4:
                        Status status4 = (Status) qxf.a(parcel, Status.CREATOR);
                        i(parcel);
                        status4.getClass();
                        rd6.b();
                        break;
                    case 5:
                        Status status5 = (Status) qxf.a(parcel, Status.CREATOR);
                        i(parcel);
                        status5.getClass();
                        rd6.b();
                        break;
                    case 6:
                        Status status6 = (Status) qxf.a(parcel, Status.CREATOR);
                        i(parcel);
                        status6.getClass();
                        rd6.b();
                        break;
                    case 7:
                        Status status7 = (Status) qxf.a(parcel, Status.CREATOR);
                        i(parcel);
                        status7.getClass();
                        throw new UnsupportedOperationException();
                    case 8:
                        Status status8 = (Status) qxf.a(parcel, Status.CREATOR);
                        i(parcel);
                        status8.getClass();
                        rd6.b();
                        break;
                    case 9:
                        Status status9 = (Status) qxf.a(parcel, Status.CREATOR);
                        ko1 ko1Var = (ko1) qxf.a(parcel, ko1.CREATOR);
                        i(parcel);
                        int i7 = a66Var.f;
                        status9.getClass();
                        switch (i7) {
                            case 0:
                                tp7.C(status9, ko1Var, a66Var.g);
                                return true;
                            default:
                                throw new UnsupportedOperationException();
                        }
                    case 10:
                        Status status10 = (Status) qxf.a(parcel, Status.CREATOR);
                        i(parcel);
                        status10.getClass();
                        throw new UnsupportedOperationException();
                    case 11:
                        Status status11 = (Status) qxf.a(parcel, Status.CREATOR);
                        i(parcel);
                        status11.getClass();
                        rd6.b();
                        break;
                    case 12:
                        Status status12 = (Status) qxf.a(parcel, Status.CREATOR);
                        i(parcel);
                        status12.getClass();
                        rd6.b();
                        break;
                    case 13:
                        Status status13 = (Status) qxf.a(parcel, Status.CREATOR);
                        i(parcel);
                        status13.getClass();
                        rd6.b();
                        break;
                    case 14:
                        Status status14 = (Status) qxf.a(parcel, Status.CREATOR);
                        i(parcel);
                        status14.getClass();
                        rd6.b();
                        break;
                    case 15:
                        Status status15 = (Status) qxf.a(parcel, Status.CREATOR);
                        i(parcel);
                        status15.getClass();
                        rd6.b();
                        break;
                }
                return false;
            default:
                if (i <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i, parcel, parcel2, i2)) {
                    return true;
                }
                if (i == 1) {
                    Status status16 = (Status) sxf.a(parcel, Status.CREATOR);
                    s16 s16Var = (s16) sxf.a(parcel, s16.CREATOR);
                    int iDataAvail2 = parcel.dataAvail();
                    if (iDataAvail2 > 0) {
                        throw new BadParcelableException(b09.w(iDataAvail2, "Parcel data not fully consumed, unread size: "));
                    }
                    n(status16, s16Var);
                    return true;
                }
                if (i != 2) {
                    return false;
                }
                Status status17 = (Status) sxf.a(parcel, Status.CREATOR);
                o44 o44Var = (o44) sxf.a(parcel, o44.CREATOR);
                int iDataAvail3 = parcel.dataAvail();
                if (iDataAvail3 > 0) {
                    throw new BadParcelableException(b09.w(iDataAvail3, "Parcel data not fully consumed, unread size: "));
                }
                m(status17, o44Var);
                return true;
        }
    }

    public ihf() {
        this.e = 8;
        attachInterface(this, "com.google.android.gms.recaptchabase.internal.IRecaptchaBaseCallbacks");
    }
}
