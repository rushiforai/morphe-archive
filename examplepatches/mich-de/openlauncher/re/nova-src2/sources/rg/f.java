package rg;

import android.os.Parcel;
import com.google.android.gms.common.api.Status;

/* loaded from: classes3.dex */
public abstract class f extends ih.g implements g {
    public f() {
        super("com.google.android.gms.common.api.internal.IStatusCallback", 1);
    }

    @Override // ih.g
    public final boolean U(int i5, Parcel parcel, Parcel parcel2) {
        if (i5 != 1) {
            return false;
        }
        Status status = (Status) jh.a.a(parcel, Status.CREATOR);
        jh.a.b(parcel);
        v(status);
        return true;
    }
}
