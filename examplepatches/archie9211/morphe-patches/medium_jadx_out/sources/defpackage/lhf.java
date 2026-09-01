package defpackage;

import android.os.Bundle;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.play.core.integrity.StandardIntegrityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lhf extends ohf {
    public final /* synthetic */ long c;
    public final /* synthetic */ wfd d;
    public final /* synthetic */ phf e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lhf(phf phfVar, wfd wfdVar, long j, wfd wfdVar2) {
        super(phfVar, wfdVar);
        this.c = j;
        this.d = wfdVar2;
        this.e = phfVar;
    }

    @Override // defpackage.kif
    public final void b() {
        wfd wfdVar = this.d;
        long j = this.c;
        phf phfVar = this.e;
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
            Bundle bundleB = phf.b(phfVar, j);
            nhf nhfVar = new nhf(phfVar, wfdVar, 1);
            dif difVar = (dif) hifVar;
            difVar.getClass();
            Parcel parcelObtain = Parcel.obtain();
            parcelObtain.writeInterfaceToken("com.google.android.play.core.integrity.protocol.IExpressIntegrityService");
            int i = vhf.a;
            parcelObtain.writeInt(1);
            bundleB.writeToParcel(parcelObtain, 0);
            parcelObtain.writeStrongBinder(nhfVar);
            try {
                difVar.e.transact(2, parcelObtain, null, 1);
            } finally {
                parcelObtain.recycle();
            }
        } catch (RemoteException e) {
            phfVar.a.a(e, "warmUpIntegrityToken(%s)", Long.valueOf(j));
            wfdVar.c(new StandardIntegrityException(-100, e));
        }
    }
}
