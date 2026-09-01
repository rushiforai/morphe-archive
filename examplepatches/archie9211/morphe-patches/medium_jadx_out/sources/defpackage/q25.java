package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q25 implements Parcelable {
    public static final Parcelable.Creator<q25> CREATOR = new h74(4);
    public final String a;
    public final String b;
    public final boolean c;
    public final int d;
    public final int e;
    public final String f;
    public final boolean g;
    public final boolean h;
    public final boolean i;
    public final boolean j;
    public final int k;
    public final String l;
    public final int m;
    public final boolean n;

    public q25(Parcel parcel) {
        this.a = parcel.readString();
        this.b = parcel.readString();
        this.c = parcel.readInt() != 0;
        this.d = parcel.readInt();
        this.e = parcel.readInt();
        this.f = parcel.readString();
        this.g = parcel.readInt() != 0;
        this.h = parcel.readInt() != 0;
        this.i = parcel.readInt() != 0;
        this.j = parcel.readInt() != 0;
        this.k = parcel.readInt();
        this.l = parcel.readString();
        this.m = parcel.readInt();
        this.n = parcel.readInt() != 0;
    }

    public final j15 a(w15 w15Var) {
        j15 j15VarA = w15Var.a(this.a);
        j15VarA.e = this.b;
        j15VarA.n = this.c;
        j15VarA.p = true;
        j15VarA.w = this.d;
        j15VarA.x = this.e;
        j15VarA.y = this.f;
        j15VarA.B = this.g;
        j15VarA.l = this.h;
        j15VarA.A = this.i;
        j15VarA.z = this.j;
        j15VarA.N = vx6.values()[this.k];
        j15VarA.h = this.l;
        j15VarA.i = this.m;
        j15VarA.I = this.n;
        return j15VarA;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("FragmentState{");
        sb.append(this.a);
        sb.append(" (");
        sb.append(this.b);
        sb.append(")}:");
        if (this.c) {
            sb.append(" fromLayout");
        }
        int i = this.e;
        if (i != 0) {
            sb.append(" id=0x");
            sb.append(Integer.toHexString(i));
        }
        String str = this.f;
        if (str != null && !str.isEmpty()) {
            sb.append(" tag=");
            sb.append(str);
        }
        if (this.g) {
            sb.append(" retainInstance");
        }
        if (this.h) {
            sb.append(" removing");
        }
        if (this.i) {
            sb.append(" detached");
        }
        if (this.j) {
            sb.append(" hidden");
        }
        String str2 = this.l;
        if (str2 != null) {
            sb.append(" targetWho=");
            sb.append(str2);
            sb.append(" targetRequestCode=");
            sb.append(this.m);
        }
        if (this.n) {
            sb.append(" userVisibleHint");
        }
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.a);
        parcel.writeString(this.b);
        parcel.writeInt(this.c ? 1 : 0);
        parcel.writeInt(this.d);
        parcel.writeInt(this.e);
        parcel.writeString(this.f);
        parcel.writeInt(this.g ? 1 : 0);
        parcel.writeInt(this.h ? 1 : 0);
        parcel.writeInt(this.i ? 1 : 0);
        parcel.writeInt(this.j ? 1 : 0);
        parcel.writeInt(this.k);
        parcel.writeString(this.l);
        parcel.writeInt(this.m);
        parcel.writeInt(this.n ? 1 : 0);
    }

    public q25(j15 j15Var) {
        this.a = j15Var.getClass().getName();
        this.b = j15Var.e;
        this.c = j15Var.n;
        this.d = j15Var.w;
        this.e = j15Var.x;
        this.f = j15Var.y;
        this.g = j15Var.B;
        this.h = j15Var.l;
        this.i = j15Var.A;
        this.j = j15Var.z;
        this.k = j15Var.N.ordinal();
        this.l = j15Var.h;
        this.m = j15Var.i;
        this.n = j15Var.I;
    }
}
