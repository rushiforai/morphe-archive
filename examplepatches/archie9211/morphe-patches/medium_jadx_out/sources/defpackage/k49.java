package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k49 extends eqc implements Parcelable, yic {
    public static final Parcelable.Creator<k49> CREATOR = new j49(0);
    public final ajc b;
    public zic c;

    public k49(Object obj, ajc ajcVar) {
        this.b = ajcVar;
        oic oicVarH = uic.h();
        zic zicVar = new zic(oicVarH.g(), obj);
        if (!(oicVarH instanceof sd5)) {
            zicVar.b = new zic(1L, obj);
        }
        this.c = zicVar;
    }

    @Override // defpackage.yic
    public final ajc b() {
        return this.b;
    }

    @Override // defpackage.dqc
    public final fqc d() {
        return this.c;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // defpackage.eqc, defpackage.dqc
    public final fqc f(fqc fqcVar, fqc fqcVar2, fqc fqcVar3) {
        if (this.b.E(((zic) fqcVar2).c, ((zic) fqcVar3).c)) {
            return fqcVar2;
        }
        return null;
    }

    @Override // defpackage.upc
    public final Object getValue() {
        return ((zic) uic.t(this.c, this)).c;
    }

    @Override // defpackage.dqc
    public final void m(fqc fqcVar) {
        this.c = (zic) fqcVar;
    }

    @Override // defpackage.l78
    public final void setValue(Object obj) {
        oic oicVarH;
        zic zicVar = (zic) uic.f(this.c);
        if (this.b.E(zicVar.c, obj)) {
            return;
        }
        zic zicVar2 = this.c;
        synchronized (uic.c) {
            oicVarH = uic.h();
            ((zic) uic.o(zicVar2, this, oicVarH, zicVar)).c = obj;
        }
        uic.m(oicVarH, this);
    }

    public final String toString() {
        return "MutableState(value=" + ((zic) uic.f(this.c)).c + ")@" + hashCode();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int i2;
        parcel.writeValue(getValue());
        y3b y3bVar = y3b.h;
        ajc ajcVar = this.b;
        if (ajcVar.equals(y3bVar)) {
            i2 = 0;
        } else if (ajcVar.equals(xsa.h)) {
            i2 = 1;
        } else {
            if (!ajcVar.equals(uob.g)) {
                ygf.f("Only known types of MutableState's SnapshotMutationPolicy are supported");
                return;
            }
            i2 = 2;
        }
        parcel.writeInt(i2);
    }
}
