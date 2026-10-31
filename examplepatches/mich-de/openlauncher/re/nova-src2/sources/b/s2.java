package b;

import ads_mobile_sdk.gg0;
import ads_mobile_sdk.yj3;
import android.os.Parcel;

/* loaded from: classes.dex */
public final class s2 extends lh.a implements s3 {
    public final void V(gg0 gg0Var, yj3 yj3Var) {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken(this.f74936c);
        parcelObtain.writeInt(1);
        gg0Var.writeToParcel(parcelObtain, 0);
        parcelObtain.writeStrongBinder(yj3Var);
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            this.f74935b.transact(8, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
        } finally {
            parcelObtain.recycle();
            parcelObtain2.recycle();
        }
    }
}
