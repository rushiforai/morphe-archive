package defpackage;

import android.os.Bundle;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.play.core.integrity.StandardIntegrityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mhf extends ohf {
    public final /* synthetic */ gif c;
    public final /* synthetic */ long d;
    public final /* synthetic */ long e;
    public final /* synthetic */ wfd f;
    public final /* synthetic */ phf g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mhf(phf phfVar, wfd wfdVar, gif gifVar, long j, long j2, wfd wfdVar2) {
        super(phfVar, wfdVar);
        this.c = gifVar;
        this.d = j;
        this.e = j2;
        this.f = wfdVar2;
        this.g = phfVar;
    }

    @Override // defpackage.kif
    public final void b() {
        gif gifVar = this.c;
        wfd wfdVar = this.f;
        phf phfVar = this.g;
        if (phf.d(phfVar)) {
            a(new StandardIntegrityException(-2, null));
            return;
        }
        if (phf.c(phfVar)) {
            a(new StandardIntegrityException(-14, null));
            return;
        }
        try {
            hif hifVar = phfVar.e.n;
            Bundle bundleA = phf.a(phfVar, gifVar, this.d, this.e);
            nhf nhfVar = new nhf(phfVar, wfdVar, 0);
            dif difVar = (dif) hifVar;
            difVar.getClass();
            Parcel parcelObtain = Parcel.obtain();
            parcelObtain.writeInterfaceToken("com.google.android.play.core.integrity.protocol.IExpressIntegrityService");
            int i = vhf.a;
            parcelObtain.writeInt(1);
            bundleA.writeToParcel(parcelObtain, 0);
            parcelObtain.writeStrongBinder(nhfVar);
            try {
                difVar.e.transact(3, parcelObtain, null, 1);
            } finally {
                parcelObtain.recycle();
            }
        } catch (RemoteException e) {
            phfVar.a.a(e, "requestExpressIntegrityToken(%s, %s, %s)", gifVar.a, gifVar.b, Long.valueOf(this.d));
            wfdVar.c(new StandardIntegrityException(-100, e));
        }
    }
}
