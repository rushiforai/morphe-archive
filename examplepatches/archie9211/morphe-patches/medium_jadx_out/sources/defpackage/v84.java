package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.donkey.main.Wv.MaAxRJinch;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class v84 extends zb0 {
    public static final Parcelable.Creator<v84> CREATOR = new lvf(29);
    public final String a;

    public v84(String str) {
        vp7.n(str);
        this.a = str;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.d0(iC0, parcel);
    }

    @Override // defpackage.zb0
    public final String d() {
        return MaAxRJinch.hUStEFDEP;
    }
}
