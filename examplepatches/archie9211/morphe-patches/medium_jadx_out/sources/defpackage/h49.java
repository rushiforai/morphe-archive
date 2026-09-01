package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h49 extends eqc implements Parcelable, yic, upc, l78 {
    public static final Parcelable.Creator<h49> CREATOR = new f08(5);
    public wic b;

    public h49(int i) {
        oic oicVarH = uic.h();
        wic wicVar = new wic(i, oicVarH.g());
        if (!(oicVarH instanceof sd5)) {
            wicVar.b = new wic(i, 1L);
        }
        this.b = wicVar;
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
        if (((wic) fqcVar2).c == ((wic) fqcVar3).c) {
            return fqcVar2;
        }
        return null;
    }

    public final int g() {
        return ((wic) uic.t(this.b, this)).c;
    }

    @Override // defpackage.upc
    public final Object getValue() {
        return Integer.valueOf(g());
    }

    public final void h(int i) {
        oic oicVarH;
        wic wicVar = (wic) uic.f(this.b);
        if (wicVar.c != i) {
            wic wicVar2 = this.b;
            synchronized (uic.c) {
                oicVarH = uic.h();
                ((wic) uic.o(wicVar2, this, oicVarH, wicVar)).c = i;
            }
            uic.m(oicVarH, this);
        }
    }

    @Override // defpackage.dqc
    public final void m(fqc fqcVar) {
        this.b = (wic) fqcVar;
    }

    @Override // defpackage.l78
    public final void setValue(Object obj) {
        h(((Number) obj).intValue());
    }

    public final String toString() {
        return "MutableIntState(value=" + ((wic) uic.f(this.b)).c + ")@" + hashCode();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(g());
    }
}
