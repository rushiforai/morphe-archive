package ok;

import android.os.Bundle;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.play.core.integrity.StandardIntegrityException;
import tk.q;

/* loaded from: classes3.dex */
public final class e extends g {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ o f80463c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ long f80464d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ long f80465e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ fi.j f80466f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ h f80467g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(h hVar, fi.j jVar, o oVar, long j11, long j12, fi.j jVar2) {
        super(hVar, jVar);
        this.f80463c = oVar;
        this.f80464d = j11;
        this.f80465e = j12;
        this.f80466f = jVar2;
        this.f80467g = hVar;
    }

    @Override // tk.t
    public final void b() {
        o oVar = this.f80463c;
        fi.j jVar = this.f80466f;
        h hVar = this.f80467g;
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
            Bundle bundleA = h.a(hVar, oVar, this.f80464d, this.f80465e);
            f fVar = new f(hVar, jVar, 0);
            tk.o oVar2 = (tk.o) qVar;
            oVar2.getClass();
            Parcel parcelObtain = Parcel.obtain();
            parcelObtain.writeInterfaceToken("com.google.android.play.core.integrity.protocol.IExpressIntegrityService");
            parcelObtain.writeInt(1);
            bundleA.writeToParcel(parcelObtain, 0);
            parcelObtain.writeStrongBinder(fVar);
            try {
                oVar2.f89435a.transact(3, parcelObtain, null, 1);
            } finally {
                parcelObtain.recycle();
            }
        } catch (RemoteException e3) {
            hVar.f80474a.a(e3, "requestExpressIntegrityToken(%s, %s, %s)", oVar.f80487a, oVar.f80488b, Long.valueOf(this.f80464d));
            jVar.b(new StandardIntegrityException(e3, -100));
        }
    }
}
