package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g49 extends eqc implements Parcelable, yic, upc, l78 {
    public static final Parcelable.Creator<g49> CREATOR = new f08(4);
    public vic b;

    public g49(float f) {
        oic oicVarH = uic.h();
        vic vicVar = new vic(f, oicVarH.g());
        if (!(oicVarH instanceof sd5)) {
            vicVar.b = new vic(f, 1L);
        }
        this.b = vicVar;
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
        if (((vic) fqcVar2).c == ((vic) fqcVar3).c) {
            return fqcVar2;
        }
        return null;
    }

    public final float g() {
        return ((vic) uic.t(this.b, this)).c;
    }

    @Override // defpackage.upc
    public final Object getValue() {
        return Float.valueOf(g());
    }

    public final void h(float f) {
        oic oicVarH;
        vic vicVar = (vic) uic.f(this.b);
        if (vicVar.c == f) {
            return;
        }
        vic vicVar2 = this.b;
        synchronized (uic.c) {
            oicVarH = uic.h();
            ((vic) uic.o(vicVar2, this, oicVarH, vicVar)).c = f;
        }
        uic.m(oicVarH, this);
    }

    @Override // defpackage.dqc
    public final void m(fqc fqcVar) {
        this.b = (vic) fqcVar;
    }

    @Override // defpackage.l78
    public final void setValue(Object obj) {
        h(((Number) obj).floatValue());
    }

    public final String toString() {
        return "MutableFloatState(value=" + ((vic) uic.f(this.b)).c + ")@" + hashCode();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeFloat(g());
    }
}
