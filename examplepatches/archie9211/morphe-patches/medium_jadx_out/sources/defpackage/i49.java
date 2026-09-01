package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i49 extends eqc implements Parcelable, yic, upc, l78 {
    public static final Parcelable.Creator<i49> CREATOR = new f08(6);
    public xic b;

    public i49(long j) {
        oic oicVarH = uic.h();
        xic xicVar = new xic(oicVarH.g(), j);
        if (!(oicVarH instanceof sd5)) {
            xicVar.b = new xic(1L, j);
        }
        this.b = xicVar;
    }

    @Override // defpackage.yic
    public final ajc b() {
        return xsa.h;
    }

    @Override // defpackage.dqc
    public final fqc d() {
        return this.b;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // defpackage.eqc, defpackage.dqc
    public final fqc f(fqc fqcVar, fqc fqcVar2, fqc fqcVar3) {
        if (((xic) fqcVar2).c == ((xic) fqcVar3).c) {
            return fqcVar2;
        }
        return null;
    }

    public final long g() {
        return ((xic) uic.t(this.b, this)).c;
    }

    @Override // defpackage.upc
    public final Object getValue() {
        return Long.valueOf(g());
    }

    public final void h(long j) {
        oic oicVarH;
        xic xicVar = (xic) uic.f(this.b);
        if (xicVar.c != j) {
            xic xicVar2 = this.b;
            synchronized (uic.c) {
                oicVarH = uic.h();
                ((xic) uic.o(xicVar2, this, oicVarH, xicVar)).c = j;
            }
            uic.m(oicVarH, this);
        }
    }

    @Override // defpackage.dqc
    public final void m(fqc fqcVar) {
        this.b = (xic) fqcVar;
    }

    @Override // defpackage.l78
    public final void setValue(Object obj) {
        h(((Number) obj).longValue());
    }

    public final String toString() {
        return "MutableLongState(value=" + ((xic) uic.f(this.b)).c + ")@" + hashCode();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeLong(g());
    }
}
