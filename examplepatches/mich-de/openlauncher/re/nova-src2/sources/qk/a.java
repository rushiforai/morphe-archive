package qk;

import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import fi.j;
import java.util.HashMap;
import java.util.Iterator;
import kk.l;
import rk.d;
import rk.g;

/* loaded from: classes3.dex */
public final class a extends d {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f84093b = 1;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f84094c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f84095d;

    public a(l lVar, IBinder iBinder) {
        this.f84094c = iBinder;
        this.f84095d = lVar;
    }

    @Override // rk.d
    public final void a() throws RemoteException {
        HashMap map;
        rk.c aVar = null;
        switch (this.f84093b) {
            case 0:
                try {
                    b bVar = (b) this.f84095d;
                    rk.c cVar = bVar.f84097a.f86033m;
                    String str = bVar.f84098b;
                    Bundle bundle = new Bundle();
                    HashMap map2 = c.f84099a;
                    synchronized (c.class) {
                        map = c.f84099a;
                        map.put("java", 20002);
                    }
                    bundle.putInt("playcore_version_code", ((Integer) map.get("java")).intValue());
                    if (map.containsKey("native")) {
                        bundle.putInt("playcore_native_version", ((Integer) map.get("native")).intValue());
                    }
                    if (map.containsKey("unity")) {
                        bundle.putInt("playcore_unity_version", ((Integer) map.get("unity")).intValue());
                    }
                    b bVar2 = (b) this.f84095d;
                    j jVar = (j) this.f84094c;
                    String str2 = bVar2.f84098b;
                    com.google.android.play.core.review.c cVar2 = new com.google.android.play.core.review.c(bVar2, jVar);
                    rk.a aVar2 = (rk.a) cVar;
                    aVar2.getClass();
                    Parcel parcelObtain = Parcel.obtain();
                    parcelObtain.writeInterfaceToken("com.google.android.play.core.inappreview.protocol.IInAppReviewService");
                    parcelObtain.writeString(str);
                    parcelObtain.writeInt(1);
                    bundle.writeToParcel(parcelObtain, 0);
                    parcelObtain.writeStrongBinder(cVar2);
                    try {
                        aVar2.f86013a.transact(2, parcelObtain, null, 1);
                        parcelObtain.recycle();
                        return;
                    } catch (Throwable th2) {
                        parcelObtain.recycle();
                        throw th2;
                    }
                } catch (RemoteException e3) {
                    b bVar3 = (b) this.f84095d;
                    ex.a aVar3 = b.f84096c;
                    Object[] objArr = {bVar3.f84098b};
                    if (Log.isLoggable("PlayCore", 6)) {
                        Log.e("PlayCore", ex.a.l(aVar3.f53057b, "error requesting in-app review for %s", objArr), e3);
                    } else {
                        aVar3.getClass();
                    }
                    ((j) this.f84094c).b(new RuntimeException(e3));
                    return;
                }
            default:
                g gVar = (g) ((l) this.f84095d).f71542b;
                IBinder iBinder = (IBinder) this.f84094c;
                int i5 = rk.b.f86014b;
                if (iBinder != null) {
                    IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.play.core.inappreview.protocol.IInAppReviewService");
                    aVar = iInterfaceQueryLocalInterface instanceof rk.c ? (rk.c) iInterfaceQueryLocalInterface : new rk.a(iBinder);
                }
                gVar.f86033m = aVar;
                ex.a aVar4 = gVar.f86022b;
                aVar4.h("linkToDeath", new Object[0]);
                try {
                    gVar.f86033m.asBinder().linkToDeath(gVar.f86030j, 0);
                } catch (RemoteException e11) {
                    Object[] objArr2 = new Object[0];
                    if (Log.isLoggable("PlayCore", 6)) {
                        Log.e("PlayCore", ex.a.l(aVar4.f53057b, "linkToDeath failed", objArr2), e11);
                    } else {
                        aVar4.getClass();
                    }
                }
                gVar.f86027g = false;
                Iterator it = gVar.f86024d.iterator();
                while (it.hasNext()) {
                    ((Runnable) it.next()).run();
                }
                gVar.f86024d.clear();
                return;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(b bVar, j jVar, j jVar2) {
        super(jVar);
        this.f84094c = jVar2;
        this.f84095d = bVar;
    }
}
