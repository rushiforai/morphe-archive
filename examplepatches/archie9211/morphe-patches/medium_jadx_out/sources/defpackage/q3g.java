package defpackage;

import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import java.util.HashMap;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q3g extends aag {
    public final /* synthetic */ int b = 0;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public q3g(lgf lgfVar, IBinder iBinder) {
        this.c = iBinder;
        this.d = lgfVar;
    }

    @Override // defpackage.aag
    public final void a() {
        HashMap map;
        m3g e0gVar = null;
        switch (this.b) {
            case 0:
                try {
                    k8g k8gVar = (k8g) this.d;
                    m3g m3gVar = k8gVar.a.m;
                    String str = k8gVar.b;
                    Bundle bundle = new Bundle();
                    HashMap map2 = iag.a;
                    synchronized (iag.class) {
                        map = iag.a;
                        map.put("java", 20002);
                    }
                    bundle.putInt("playcore_version_code", ((Integer) map.get("java")).intValue());
                    if (map.containsKey("native")) {
                        bundle.putInt("playcore_native_version", ((Integer) map.get("native")).intValue());
                    }
                    if (map.containsKey("unity")) {
                        bundle.putInt("playcore_unity_version", ((Integer) map.get("unity")).intValue());
                    }
                    h6g h6gVar = new h6g((k8g) this.d, (wfd) this.c);
                    e0g e0gVar2 = (e0g) m3gVar;
                    e0gVar2.getClass();
                    Parcel parcelObtain = Parcel.obtain();
                    parcelObtain.writeInterfaceToken("com.google.android.play.core.inappreview.protocol.IInAppReviewService");
                    parcelObtain.writeString(str);
                    int i = jxf.a;
                    parcelObtain.writeInt(1);
                    bundle.writeToParcel(parcelObtain, 0);
                    parcelObtain.writeStrongBinder(h6gVar);
                    try {
                        e0gVar2.e.transact(2, parcelObtain, null, 1);
                        parcelObtain.recycle();
                        return;
                    } catch (Throwable th) {
                        parcelObtain.recycle();
                        throw th;
                    }
                } catch (RemoteException e) {
                    k8g k8gVar2 = (k8g) this.d;
                    d1g d1gVar = k8g.c;
                    Object[] objArr = {k8gVar2.b};
                    d1gVar.getClass();
                    if (Log.isLoggable("PlayCore", 6)) {
                        Log.e("PlayCore", d1g.j(d1gVar.b, "error requesting in-app review for %s", objArr), e);
                    }
                    ((wfd) this.c).c(new RuntimeException(e));
                    return;
                }
            default:
                bmg bmgVar = (bmg) ((lgf) this.d).b;
                IBinder iBinder = (IBinder) this.c;
                int i2 = u1g.f;
                if (iBinder != null) {
                    IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.play.core.inappreview.protocol.IInAppReviewService");
                    e0gVar = iInterfaceQueryLocalInterface instanceof m3g ? (m3g) iInterfaceQueryLocalInterface : new e0g(iBinder);
                }
                bmgVar.m = e0gVar;
                d1g d1gVar2 = bmgVar.b;
                d1gVar2.h("linkToDeath", new Object[0]);
                try {
                    ((e0g) bmgVar.m).e.linkToDeath(bmgVar.j, 0);
                    break;
                } catch (RemoteException e2) {
                    Object[] objArr2 = new Object[0];
                    d1gVar2.getClass();
                    if (Log.isLoggable("PlayCore", 6)) {
                        Log.e("PlayCore", d1g.j(d1gVar2.b, "linkToDeath failed", objArr2), e2);
                    }
                }
                bmgVar.g = false;
                Iterator it2 = bmgVar.d.iterator();
                while (it2.hasNext()) {
                    ((Runnable) it2.next()).run();
                }
                bmgVar.d.clear();
                return;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q3g(k8g k8gVar, wfd wfdVar, wfd wfdVar2) {
        super(wfdVar);
        this.c = wfdVar2;
        this.d = k8gVar;
    }
}
