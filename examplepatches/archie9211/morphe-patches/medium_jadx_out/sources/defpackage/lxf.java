package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lxf extends zb0 {
    public static final Parcelable.Creator<lxf> CREATOR = new lvf(24);
    public final String a;
    public final String b;
    public final String c;
    public final frf d;
    public final String e;
    public final String f;
    public final String g;

    public lxf(String str, String str2, String str3, frf frfVar, String str4, String str5, String str6) {
        this.a = str == null ? "" : str;
        this.b = str2;
        this.c = str3;
        this.d = frfVar;
        this.e = str4;
        this.f = str5;
        this.g = str6;
    }

    public static lxf g(frf frfVar) {
        vp7.q("Must specify a non-null webSignInCredential", frfVar);
        return new lxf(null, null, null, frfVar, null, null, null);
    }

    @Override // defpackage.zb0
    public final String d() {
        return this.a;
    }

    public final zb0 e() {
        return new lxf(this.a, this.b, this.c, this.d, this.e, this.f, this.g);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.V(parcel, 2, this.b);
        fo7.V(parcel, 3, this.c);
        fo7.U(parcel, 4, this.d, i);
        fo7.V(parcel, 5, this.e);
        fo7.V(parcel, 6, this.f);
        fo7.V(parcel, 7, this.g);
        fo7.d0(iC0, parcel);
    }
}
