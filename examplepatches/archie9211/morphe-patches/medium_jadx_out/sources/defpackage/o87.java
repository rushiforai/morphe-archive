package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o87 implements Parcelable {
    public static final Parcelable.Creator<o87> CREATOR = new h74(21);
    public final n87 a;
    public final w3 b;
    public final ce0 c;
    public final String d;
    public final String e;
    public final m87 f;
    public Map g;
    public HashMap h;

    public o87(Parcel parcel) {
        String string = parcel.readString();
        this.a = n87.valueOf(string == null ? "error" : string);
        this.b = (w3) parcel.readParcelable(w3.class.getClassLoader());
        this.c = (ce0) parcel.readParcelable(ce0.class.getClassLoader());
        this.d = parcel.readString();
        this.e = parcel.readString();
        this.f = (m87) parcel.readParcelable(m87.class.getClassLoader());
        this.g = epe.S(parcel);
        this.h = epe.S(parcel);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeString(this.a.name());
        parcel.writeParcelable(this.b, i);
        parcel.writeParcelable(this.c, i);
        parcel.writeString(this.d);
        parcel.writeString(this.e);
        parcel.writeParcelable(this.f, i);
        epe.e0(parcel, this.g);
        epe.e0(parcel, this.h);
    }

    public o87(m87 m87Var, n87 n87Var, w3 w3Var, ce0 ce0Var, String str, String str2) {
        n87Var.getClass();
        this.f = m87Var;
        this.b = w3Var;
        this.c = ce0Var;
        this.d = str;
        this.a = n87Var;
        this.e = str2;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public o87(m87 m87Var, n87 n87Var, w3 w3Var, String str, String str2) {
        this(m87Var, n87Var, w3Var, null, str, str2);
        n87Var.getClass();
    }
}
