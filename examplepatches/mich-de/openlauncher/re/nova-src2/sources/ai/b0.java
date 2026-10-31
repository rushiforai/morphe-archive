package ai;

import android.os.Parcel;
import com.google.android.gms.internal.measurement.p6;
import java.util.List;

/* loaded from: classes3.dex */
public final class b0 extends p6 implements c0 {
    @Override // ai.c0
    public final void n(List list) {
        Parcel parcelX = X();
        parcelX.writeTypedList(list);
        a0(parcelX);
    }
}
