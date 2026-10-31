package ok;

import android.os.Bundle;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.play.core.integrity.StandardIntegrityException;
import tk.q;

/* loaded from: classes3.dex */
public final class d extends g {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f80460c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ fi.j f80461d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ h f80462e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(h hVar, fi.j jVar, long j11, fi.j jVar2) {
        super(hVar, jVar);
        this.f80460c = j11;
        this.f80461d = jVar2;
        this.f80462e = hVar;
    }

    @Override // tk.t
    public final void b() {
        fi.j jVar = this.f80461d;
        long j11 = this.f80460c;
        h hVar = this.f80462e;
        if (h.d(hVar)) {
            a(new StandardIntegrityException(null, -2));
            return;
        }
        if (h.c(hVar)) {
            a(new StandardIntegrityException(null, -14));
            return;
        }
        try {
            q qVar = hVar.f80478e.n;
            Bundle bundleB = h.b(hVar, j11);
            f fVar = new f(hVar, jVar, 1);
            tk.o oVar = (tk.o) qVar;
            oVar.getClass();
            Parcel parcelObtain = Parcel.obtain();
            parcelObtain.writeInterfaceToken("com.google.android.play.core.integrity.protocol.IExpressIntegrityService");
            parcelObtain.writeInt(1);
            bundleB.writeToParcel(parcelObtain, 0);
            parcelObtain.writeStrongBinder(fVar);
            try {
                oVar.f89435a.transact(2, parcelObtain, null, 1);
            } finally {
                parcelObtain.recycle();
            }
        } catch (RemoteException e3) {
            hVar.f80474a.a(e3, "warmUpIntegrityToken(%s)", Long.valueOf(j11));
            jVar.b(new StandardIntegrityException(e3, -100));
        }
    }
}
