package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pvf extends k2 {
    public static final Parcelable.Creator<pvf> CREATOR = new lvf(6);
    public final String a;

    public pvf(String str) {
        this.a = str;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof pvf) {
            return en7.u(this.a, ((pvf) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.d0(iC0, parcel);
    }
}
