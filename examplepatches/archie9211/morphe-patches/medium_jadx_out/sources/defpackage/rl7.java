package defpackage;

import android.os.Binder;
import android.os.IBinder;
import android.os.Parcel;
import android.support.v4.media.session.MediaSessionCompat$QueueItem;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rl7 extends Binder implements gu5 {
    public final WeakReference e;

    public rl7() {
        attachInterface(this, "android.support.v4.media.session.IMediaControllerCallback");
        this.e = new WeakReference(null);
    }

    @Override // android.os.Binder
    public final boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) {
        if (i >= 1 && i <= 16777215) {
            parcel.enforceInterface("android.support.v4.media.session.IMediaControllerCallback");
        }
        if (i == 1598968902) {
            parcel2.writeString("android.support.v4.media.session.IMediaControllerCallback");
            return true;
        }
        switch (i) {
            case 1:
                parcel.readString();
                if (this.e.get() != null) {
                    rd6.m();
                    return false;
                }
                return true;
            case 2:
                ywb.d();
                return false;
            case 3:
                if (this.e.get() != null) {
                    rd6.m();
                    return false;
                }
                return true;
            case 4:
                ywb.d();
                return false;
            case 5:
                parcel.createTypedArrayList(MediaSessionCompat$QueueItem.CREATOR);
                ywb.d();
                return false;
            case 6:
                ywb.d();
                return false;
            case 7:
                ywb.d();
                return false;
            case 8:
                ywb.d();
                return false;
            case 9:
                parcel.readInt();
                if (this.e.get() != null) {
                    rd6.m();
                    return false;
                }
                return true;
            case 10:
                parcel.readInt();
                return true;
            case 11:
                parcel.readInt();
                if (this.e.get() != null) {
                    rd6.m();
                    return false;
                }
                return true;
            case 12:
                parcel.readInt();
                if (this.e.get() != null) {
                    rd6.m();
                    return false;
                }
                return true;
            case 13:
                if (this.e.get() != null) {
                    rd6.m();
                    return false;
                }
                return true;
            default:
                return super.onTransact(i, parcel, parcel2, i2);
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this;
    }
}
