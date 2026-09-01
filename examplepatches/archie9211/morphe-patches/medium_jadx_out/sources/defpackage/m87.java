package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m87 implements Parcelable {
    public static final Parcelable.Creator<m87> CREATOR = new h74(20);
    public final l87 a;
    public Set b;
    public final dx2 c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public boolean h;
    public final String i;
    public final String j;
    public final String k;
    public String l;
    public boolean m;
    public final ea7 n;
    public boolean o;
    public boolean p;
    public final String q;
    public final String r;
    public final String s;
    public final pp1 t;

    public m87(Parcel parcel) {
        String string = parcel.readString();
        hk7.E(string, "loginBehavior");
        this.a = l87.valueOf(string);
        ArrayList arrayList = new ArrayList();
        parcel.readStringList(arrayList);
        this.b = new HashSet(arrayList);
        String string2 = parcel.readString();
        this.c = string2 != null ? dx2.valueOf(string2) : dx2.NONE;
        String string3 = parcel.readString();
        hk7.E(string3, "applicationId");
        this.d = string3;
        this.e = parcel.readString();
        this.f = parcel.readString();
        String string4 = parcel.readString();
        hk7.E(string4, "authId");
        this.g = string4;
        this.h = parcel.readByte() != 0;
        this.i = parcel.readString();
        String string5 = parcel.readString();
        hk7.E(string5, "authType");
        this.j = string5;
        this.k = parcel.readString();
        this.l = parcel.readString();
        this.m = parcel.readByte() != 0;
        String string6 = parcel.readString();
        this.n = string6 != null ? ea7.valueOf(string6) : ea7.FACEBOOK;
        this.o = parcel.readByte() != 0;
        this.p = parcel.readByte() != 0;
        String string7 = parcel.readString();
        hk7.E(string7, "nonce");
        this.q = string7;
        this.r = parcel.readString();
        this.s = parcel.readString();
        String string8 = parcel.readString();
        this.t = string8 != null ? pp1.valueOf(string8) : null;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeString(this.a.name());
        parcel.writeStringList(new ArrayList(this.b));
        parcel.writeString(this.c.name());
        parcel.writeString(this.d);
        parcel.writeString(this.e);
        parcel.writeString(this.f);
        parcel.writeString(this.g);
        parcel.writeByte(this.h ? (byte) 1 : (byte) 0);
        parcel.writeString(this.i);
        parcel.writeString(this.j);
        parcel.writeString(this.k);
        parcel.writeString(this.l);
        parcel.writeByte(this.m ? (byte) 1 : (byte) 0);
        parcel.writeString(this.n.name());
        parcel.writeByte(this.o ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.p ? (byte) 1 : (byte) 0);
        parcel.writeString(this.q);
        parcel.writeString(this.r);
        parcel.writeString(this.s);
        pp1 pp1Var = this.t;
        parcel.writeString(pp1Var != null ? pp1Var.name() : null);
    }

    public m87(l87 l87Var, Set set, dx2 dx2Var, String str, String str2, ea7 ea7Var, String str3, String str4, String str5, pp1 pp1Var, String str6, String str7) {
        l87Var.getClass();
        dx2Var.getClass();
        this.a = l87Var;
        this.b = set;
        this.c = dx2Var;
        this.j = "rerequest";
        this.d = str;
        this.e = str6;
        this.f = str7;
        this.g = str2;
        this.n = ea7Var == null ? ea7.FACEBOOK : ea7Var;
        if (str3.length() == 0) {
            String string = UUID.randomUUID().toString();
            string.getClass();
            this.q = string;
        } else {
            this.q = str3;
        }
        this.r = str4;
        this.s = str5;
        this.t = pp1Var;
    }
}
