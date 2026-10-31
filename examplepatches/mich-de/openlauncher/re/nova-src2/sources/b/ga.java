package b;

import ads_mobile_sdk.al0;
import ads_mobile_sdk.gg0;
import ads_mobile_sdk.xu0;
import ads_mobile_sdk.yj3;
import android.os.BadParcelableException;
import android.os.Parcel;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class ga extends s8 {
    @Override // b.s8
    public final boolean a(int i5, Parcel parcel, Parcel parcel2) {
        if (i5 == 1) {
            String trustlessToken = parcel.readString();
            gg0 decagonRequestParcel = (gg0) (parcel.readInt() != 0 ? gg0.CREATOR.createFromParcel(parcel) : null);
            int iDataAvail = parcel.dataAvail();
            if (iDataAvail > 0) {
                throw new BadParcelableException(ed.i("Parcel data not fully consumed, unread size: ", iDataAvail));
            }
            yj3 yj3Var = (yj3) this;
            Intrinsics.g(trustlessToken, "trustlessToken");
            Intrinsics.g(decagonRequestParcel, "decagonRequestParcel");
            xu0 xu0Var = new xu0(trustlessToken);
            if (!yj3Var.f12048f.getAndSet(true)) {
                yj3Var.f12050h.X(xu0Var);
            }
        } else {
            if (i5 != 2) {
                return false;
            }
            al0 al0Var = (al0) (parcel.readInt() != 0 ? al0.CREATOR.createFromParcel(parcel) : null);
            int iDataAvail2 = parcel.dataAvail();
            if (iDataAvail2 > 0) {
                throw new BadParcelableException(ed.i("Parcel data not fully consumed, unread size: ", iDataAvail2));
            }
            ((yj3) this).a(al0Var);
        }
        parcel2.writeNoException();
        return true;
    }
}
