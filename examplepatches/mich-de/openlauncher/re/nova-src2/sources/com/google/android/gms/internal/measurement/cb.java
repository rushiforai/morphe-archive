package com.google.android.gms.internal.measurement;

import android.os.IBinder;
import android.os.IInterface;
import com.google.android.gms.common.Feature;

/* loaded from: classes3.dex */
public final class cb extends sg.f {
    @Override // sg.e
    public final IInterface createServiceInterface(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.phenotype.internal.IPhenotypeService");
        return iInterfaceQueryLocalInterface instanceof bb ? (bb) iInterfaceQueryLocalInterface : new bb(iBinder, "com.google.android.gms.phenotype.internal.IPhenotypeService", 0);
    }

    @Override // sg.e
    public final Feature[] getApiFeatures() {
        return h.f32585d;
    }

    @Override // sg.e
    public final int getMinApkVersion() {
        return 9410000;
    }

    @Override // sg.e
    public final String getServiceDescriptor() {
        return "com.google.android.gms.phenotype.internal.IPhenotypeService";
    }

    @Override // sg.e
    public final String getStartServiceAction() {
        return "com.google.android.gms.phenotype.service.START";
    }
}
