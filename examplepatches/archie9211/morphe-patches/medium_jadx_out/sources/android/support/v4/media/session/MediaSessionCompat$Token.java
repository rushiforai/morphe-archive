package android.support.v4.media.session;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.h74;
import defpackage.iu5;
import defpackage.pse;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class MediaSessionCompat$Token implements Parcelable {
    public static final Parcelable.Creator<MediaSessionCompat$Token> CREATOR = new h74(28);
    public final Object b;
    public iu5 c;
    public final Object a = new Object();
    public pse d = null;

    public MediaSessionCompat$Token(Object obj, iu5 iu5Var) {
        this.b = obj;
        this.c = iu5Var;
    }

    public final iu5 a() {
        iu5 iu5Var;
        synchronized (this.a) {
            iu5Var = this.c;
        }
        return iu5Var;
    }

    public final void b(iu5 iu5Var) {
        synchronized (this.a) {
            this.c = iu5Var;
        }
    }

    public final void c(pse pseVar) {
        synchronized (this.a) {
            this.d = pseVar;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof MediaSessionCompat$Token)) {
            return false;
        }
        Object obj2 = ((MediaSessionCompat$Token) obj).b;
        Object obj3 = this.b;
        if (obj3 == null) {
            return obj2 == null;
        }
        if (obj2 == null) {
            return false;
        }
        return obj3.equals(obj2);
    }

    public final int hashCode() {
        Object obj = this.b;
        if (obj == null) {
            return 0;
        }
        return obj.hashCode();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeParcelable((Parcelable) this.b, i);
    }
}
