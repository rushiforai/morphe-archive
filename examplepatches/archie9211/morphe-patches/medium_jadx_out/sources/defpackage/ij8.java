package defpackage;

import android.app.Notification;
import android.os.Parcel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ij8 {
    public final String a;
    public final int b;
    public final Notification c;

    public ij8(String str, int i, Notification notification) {
        this.a = str;
        this.b = i;
        this.c = notification;
    }

    public final void a(ou5 ou5Var) {
        String str = this.a;
        int i = this.b;
        Notification notification = this.c;
        mu5 mu5Var = (mu5) ou5Var;
        mu5Var.getClass();
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken(ou5.c);
            parcelObtain.writeString(str);
            parcelObtain.writeInt(i);
            parcelObtain.writeString(null);
            parcelObtain.writeTypedObject(notification, 0);
            mu5Var.e.transact(1, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NotifyTask[packageName:");
        sb.append(this.a);
        sb.append(", id:");
        return ho2.H(sb, this.b, ", tag:null]");
    }
}
