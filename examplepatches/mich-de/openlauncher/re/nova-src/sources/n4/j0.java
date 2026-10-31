package n4;

import android.app.Notification;
import android.os.Parcel;

/* loaded from: classes2.dex */
public final class j0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f77812a;

    /* renamed from: b, reason: collision with root package name */
    public final int f77813b;

    /* renamed from: c, reason: collision with root package name */
    public final Notification f77814c;

    public j0(String str, int i5, Notification notification) {
        this.f77812a = str;
        this.f77813b = i5;
        this.f77814c = notification;
    }

    public final void a(d.c cVar) {
        String str = this.f77812a;
        int i5 = this.f77813b;
        d.a aVar = (d.a) cVar;
        aVar.getClass();
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken(d.c.Yo);
            parcelObtain.writeString(str);
            parcelObtain.writeInt(i5);
            parcelObtain.writeString(null);
            Notification notification = this.f77814c;
            if (notification != null) {
                parcelObtain.writeInt(1);
                notification.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            aVar.f48672a.transact(1, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("NotifyTask[packageName:");
        sb2.append(this.f77812a);
        sb2.append(", id:");
        return b.c0.o(sb2, this.f77813b, ", tag:null]");
    }
}
