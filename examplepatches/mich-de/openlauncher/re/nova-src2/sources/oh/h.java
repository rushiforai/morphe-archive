package oh;

import android.content.Context;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.Parcel;
import bm.t;
import com.google.android.gms.common.Feature;
import com.google.android.gms.internal.location.zzdb;
import com.google.android.gms.internal.location.zzdf;
import com.google.android.gms.internal.measurement.td;
import z.c1;

/* loaded from: classes3.dex */
public final class h extends sg.f {

    /* renamed from: c, reason: collision with root package name */
    public final c1 f80425c;

    /* renamed from: d, reason: collision with root package name */
    public final c1 f80426d;

    /* renamed from: e, reason: collision with root package name */
    public final c1 f80427e;

    public h(Context context, Looper looper, t tVar, rg.p pVar, rg.p pVar2) {
        super(context, looper, 23, tVar, pVar, pVar2);
        this.f80425c = new c1(0);
        this.f80426d = new c1(0);
        this.f80427e = new c1(0);
    }

    public final void b(rg.i iVar, boolean z11, fi.j jVar) {
        synchronized (this.f80426d) {
            try {
                g gVar = (g) this.f80426d.remove(iVar);
                if (gVar == null) {
                    jVar.a(Boolean.FALSE);
                    return;
                }
                ((td) gVar.f80424b.f80412b).f33084b = null;
                if (!z11) {
                    jVar.a(Boolean.TRUE);
                } else if (c(uh.c.f91269b)) {
                    s sVar = (s) getService();
                    zzdb zzdbVar = new zzdb(2, null, gVar, null, null, null);
                    c cVar = new c(Boolean.TRUE, jVar);
                    Parcel parcelObtain = Parcel.obtain();
                    parcelObtain.writeInterfaceToken(sVar.f32954c);
                    parcelObtain.writeInt(1);
                    zzdbVar.writeToParcel(parcelObtain, 0);
                    parcelObtain.writeStrongBinder(cVar);
                    sVar.Z(parcelObtain, 89);
                } else {
                    s sVar2 = (s) getService();
                    zzdf zzdfVar = new zzdf(2, null, null, gVar, null, new e(jVar), null);
                    Parcel parcelObtain2 = Parcel.obtain();
                    parcelObtain2.writeInterfaceToken(sVar2.f32954c);
                    parcelObtain2.writeInt(1);
                    zzdfVar.writeToParcel(parcelObtain2, 0);
                    sVar2.Z(parcelObtain2, 59);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final boolean c(Feature feature) {
        Feature feature2;
        Feature[] availableFeatures = getAvailableFeatures();
        if (availableFeatures != null) {
            int length = availableFeatures.length;
            int i5 = 0;
            while (true) {
                if (i5 >= length) {
                    feature2 = null;
                    break;
                }
                feature2 = availableFeatures[i5];
                if (feature.f31786f.equals(feature2.f31786f)) {
                    break;
                }
                i5++;
            }
            if (feature2 != null && feature2.d() >= feature.d()) {
                return true;
            }
        }
        return false;
    }

    @Override // sg.e
    public final IInterface createServiceInterface(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
        return iInterfaceQueryLocalInterface instanceof s ? (s) iInterfaceQueryLocalInterface : new s(iBinder, "com.google.android.gms.location.internal.IGoogleLocationManagerService", 4);
    }

    @Override // sg.e
    public final Feature[] getApiFeatures() {
        return uh.c.f91270c;
    }

    @Override // sg.e
    public final int getMinApkVersion() {
        return 11717000;
    }

    @Override // sg.e
    public final String getServiceDescriptor() {
        return "com.google.android.gms.location.internal.IGoogleLocationManagerService";
    }

    @Override // sg.e
    public final String getStartServiceAction() {
        return "com.google.android.location.internal.GoogleLocationManagerService.START";
    }

    @Override // sg.e
    public final void onConnectionSuspended() {
        synchronized (this.f80425c) {
            this.f80425c.clear();
        }
        synchronized (this.f80426d) {
            this.f80426d.clear();
        }
        synchronized (this.f80427e) {
            this.f80427e.clear();
        }
    }

    @Override // sg.e
    public final boolean usesClientTelemetry() {
        return true;
    }
}
