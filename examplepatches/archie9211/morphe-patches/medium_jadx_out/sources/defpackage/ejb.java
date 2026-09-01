package defpackage;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ejb implements Parcelable {
    public static final Parcelable.Creator<ejb> CREATOR = new f08(24);
    public wu5 a;

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        synchronized (this) {
            try {
                wu5 djbVar = this.a;
                if (djbVar == null) {
                    djbVar = new djb(this);
                    this.a = djbVar;
                }
                parcel.writeStrongBinder(djbVar.asBinder());
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public void a(int i, Bundle bundle) {
    }
}
