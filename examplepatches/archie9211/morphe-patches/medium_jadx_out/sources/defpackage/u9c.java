package defpackage;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u9c extends k2 {
    public static final Parcelable.Creator<u9c> CREATOR = new rkf(0);
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final Uri e;
    public final String f;
    public final String g;
    public final String h;
    public final x9a i;

    public u9c(String str, String str2, String str3, String str4, Uri uri, String str5, String str6, String str7, x9a x9aVar) {
        vp7.p(str);
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = uri;
        this.f = str5;
        this.g = str6;
        this.h = str7;
        this.i = x9aVar;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof u9c)) {
            return false;
        }
        u9c u9cVar = (u9c) obj;
        return en7.u(this.a, u9cVar.a) && en7.u(this.b, u9cVar.b) && en7.u(this.c, u9cVar.c) && en7.u(this.d, u9cVar.d) && en7.u(this.e, u9cVar.e) && en7.u(this.f, u9cVar.f) && en7.u(this.g, u9cVar.g) && en7.u(this.h, u9cVar.h) && en7.u(this.i, u9cVar.i);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.V(parcel, 2, this.b);
        fo7.V(parcel, 3, this.c);
        fo7.V(parcel, 4, this.d);
        fo7.U(parcel, 5, this.e, i);
        fo7.V(parcel, 6, this.f);
        fo7.V(parcel, 7, this.g);
        fo7.V(parcel, 8, this.h);
        fo7.U(parcel, 9, this.i, i);
        fo7.d0(iC0, parcel);
    }
}
