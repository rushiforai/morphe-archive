package vh;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import sg.w;

/* loaded from: classes3.dex */
public final class c extends ih.g implements wh.a {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f92771b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(int i5) {
        super("com.google.android.gms.maps.internal.IOnMapReadyCallback", 6);
        this.f92771b = i5;
    }

    @Override // ih.g
    public final boolean W(int i5, Parcel parcel, Parcel parcel2) {
        wh.h hVar;
        if (i5 != 1) {
            return false;
        }
        IBinder strongBinder = parcel.readStrongBinder();
        if (strongBinder != null) {
            IInterface iInterfaceQueryLocalInterface = strongBinder.queryLocalInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
            hVar = iInterfaceQueryLocalInterface instanceof wh.h ? (wh.h) iInterfaceQueryLocalInterface : new wh.h(strongBinder, "com.google.android.gms.maps.internal.IGoogleMapDelegate", 5);
        } else {
            hVar = null;
        }
        q(hVar);
        throw null;
    }

    @Override // wh.a
    public final void q(wh.h hVar) {
        switch (this.f92771b) {
            case 0:
                w.h(hVar);
                throw null;
            default:
                w.h(hVar);
                throw null;
        }
    }
}
