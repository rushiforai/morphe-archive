package vh;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import sg.w;

/* loaded from: classes3.dex */
public final class f extends ih.g implements wh.c {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f92779b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(int i5) {
        super("com.google.android.gms.maps.internal.IOnStreetViewPanoramaReadyCallback", 6);
        this.f92779b = i5;
    }

    @Override // ih.g
    public final boolean W(int i5, Parcel parcel, Parcel parcel2) {
        wh.d dVar;
        if (i5 != 1) {
            return false;
        }
        IBinder strongBinder = parcel.readStrongBinder();
        if (strongBinder != null) {
            IInterface iInterfaceQueryLocalInterface = strongBinder.queryLocalInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
            dVar = iInterfaceQueryLocalInterface instanceof wh.d ? (wh.d) iInterfaceQueryLocalInterface : new wh.d(strongBinder, "com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate", 5);
        } else {
            dVar = null;
        }
        r(dVar);
        throw null;
    }

    @Override // wh.c
    public final void r(wh.d dVar) {
        switch (this.f92779b) {
            case 0:
                w.i(dVar, "delegate");
                throw null;
            default:
                w.i(dVar, "delegate");
                throw null;
        }
    }
}
