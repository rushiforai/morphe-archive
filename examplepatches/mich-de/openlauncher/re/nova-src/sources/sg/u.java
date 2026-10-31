package sg;

import android.os.IBinder;
import android.os.IInterface;
import b.s8;

/* loaded from: classes3.dex */
public abstract class u extends s8 implements v {
    public static v U(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.IGoogleCertificatesApi");
        return iInterfaceQueryLocalInterface instanceof v ? (v) iInterfaceQueryLocalInterface : new t(iBinder, "com.google.android.gms.common.internal.IGoogleCertificatesApi", 0);
    }
}
