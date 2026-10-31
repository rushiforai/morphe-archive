package hi;

import ah.d;
import android.os.Parcel;
import com.google.android.gms.internal.measurement.p6;
import com.google.android.gms.wallet.button.ButtonOptions;
import ps.e0;

/* loaded from: classes3.dex */
public final class a extends p6 {
    public final ah.b f0(d dVar, ButtonOptions buttonOptions) {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken(this.f32954c);
        e0.H(parcelObtain, dVar);
        e0.G(parcelObtain, buttonOptions);
        parcelObtain = Parcel.obtain();
        try {
            this.f32953b.transact(1, parcelObtain, parcelObtain, 0);
            parcelObtain.readException();
            parcelObtain.recycle();
            return d.U(parcelObtain.readStrongBinder());
        } catch (RuntimeException e3) {
            throw e3;
        } finally {
            parcelObtain.recycle();
        }
    }
}
