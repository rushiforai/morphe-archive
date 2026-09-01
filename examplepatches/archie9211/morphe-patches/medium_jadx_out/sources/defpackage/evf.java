package defpackage;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.android.billingclient.api.f;
import com.android.billingclient.api.g;
import com.android.billingclient.api.j;
import com.android.billingclient.api.k;
import com.drew.metadata.mov.metadata.QuickTimeMetadataDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class evf extends nif implements hvf {
    public final int h(String str, int i, String str2) {
        Parcel parcelD = d();
        parcelD.writeInt(i);
        parcelD.writeString(str);
        parcelD.writeString(str2);
        Parcel parcelE = e(1, parcelD);
        int i2 = parcelE.readInt();
        parcelE.recycle();
        return i2;
    }

    public final int i(int i, String str, String str2, Bundle bundle) {
        Parcel parcelD = d();
        parcelD.writeInt(i);
        parcelD.writeString(str);
        parcelD.writeString(str2);
        int i2 = nvf.a;
        parcelD.writeInt(1);
        bundle.writeToParcel(parcelD, 0);
        Parcel parcelE = e(10, parcelD);
        int i3 = parcelE.readInt();
        parcelE.recycle();
        return i3;
    }

    public final Bundle j(String str, String str2, Bundle bundle) {
        Parcel parcelD = d();
        parcelD.writeInt(9);
        parcelD.writeString(str);
        parcelD.writeString(str2);
        int i = nvf.a;
        parcelD.writeInt(1);
        bundle.writeToParcel(parcelD, 0);
        Parcel parcelE = e(902, parcelD);
        Parcelable.Creator creator = Bundle.CREATOR;
        Bundle bundle2 = (Bundle) nvf.a(parcelE);
        parcelE.recycle();
        return bundle2;
    }

    public final Bundle k(String str, String str2, Bundle bundle) {
        Parcel parcelD = d();
        parcelD.writeInt(9);
        parcelD.writeString(str);
        parcelD.writeString(str2);
        int i = nvf.a;
        parcelD.writeInt(1);
        bundle.writeToParcel(parcelD, 0);
        Parcel parcelE = e(12, parcelD);
        Parcelable.Creator creator = Bundle.CREATOR;
        Bundle bundle2 = (Bundle) nvf.a(parcelE);
        parcelE.recycle();
        return bundle2;
    }

    public final Bundle l(String str, String str2, String str3) {
        Parcel parcelD = d();
        parcelD.writeInt(3);
        parcelD.writeString(str);
        parcelD.writeString(str2);
        parcelD.writeString(str3);
        parcelD.writeString(null);
        Parcel parcelE = e(3, parcelD);
        Parcelable.Creator creator = Bundle.CREATOR;
        Bundle bundle = (Bundle) nvf.a(parcelE);
        parcelE.recycle();
        return bundle;
    }

    public final Bundle m(int i, String str, String str2, String str3, Bundle bundle) {
        Parcel parcelD = d();
        parcelD.writeInt(i);
        parcelD.writeString(str);
        parcelD.writeString(str2);
        parcelD.writeString(str3);
        parcelD.writeString(null);
        int i2 = nvf.a;
        parcelD.writeInt(1);
        bundle.writeToParcel(parcelD, 0);
        Parcel parcelE = e(8, parcelD);
        Parcelable.Creator creator = Bundle.CREATOR;
        Bundle bundle2 = (Bundle) nvf.a(parcelE);
        parcelE.recycle();
        return bundle2;
    }

    public final Bundle n(String str, String str2, String str3) {
        Parcel parcelD = d();
        parcelD.writeInt(3);
        parcelD.writeString(str);
        parcelD.writeString(str2);
        parcelD.writeString(str3);
        Parcel parcelE = e(4, parcelD);
        Parcelable.Creator creator = Bundle.CREATOR;
        Bundle bundle = (Bundle) nvf.a(parcelE);
        parcelE.recycle();
        return bundle;
    }

    public final Bundle o(int i, String str, String str2, String str3, Bundle bundle) {
        Parcel parcelD = d();
        parcelD.writeInt(i);
        parcelD.writeString(str);
        parcelD.writeString(str2);
        parcelD.writeString(str3);
        int i2 = nvf.a;
        parcelD.writeInt(1);
        bundle.writeToParcel(parcelD, 0);
        Parcel parcelE = e(11, parcelD);
        Parcelable.Creator creator = Bundle.CREATOR;
        Bundle bundle2 = (Bundle) nvf.a(parcelE);
        parcelE.recycle();
        return bundle2;
    }

    public final Bundle p(int i, String str, String str2, Bundle bundle, Bundle bundle2) {
        Parcel parcelD = d();
        parcelD.writeInt(i);
        parcelD.writeString(str);
        parcelD.writeString(str2);
        int i2 = nvf.a;
        parcelD.writeInt(1);
        bundle.writeToParcel(parcelD, 0);
        parcelD.writeInt(1);
        bundle2.writeToParcel(parcelD, 0);
        Parcel parcelE = e(901, parcelD);
        Parcelable.Creator creator = Bundle.CREATOR;
        Bundle bundle3 = (Bundle) nvf.a(parcelE);
        parcelE.recycle();
        return bundle3;
    }

    public final void q(String str, Bundle bundle, dxf dxfVar) {
        Parcel parcelD = d();
        parcelD.writeInt(21);
        parcelD.writeString(str);
        int i = nvf.a;
        parcelD.writeInt(1);
        bundle.writeToParcel(parcelD, 0);
        parcelD.writeStrongBinder(dxfVar);
        g(1501, parcelD);
    }

    public final void r(String str, Bundle bundle, dxf dxfVar) {
        Parcel parcelD = d();
        parcelD.writeInt(22);
        parcelD.writeString(str);
        int i = nvf.a;
        parcelD.writeInt(1);
        bundle.writeToParcel(parcelD, 0);
        parcelD.writeStrongBinder(dxfVar);
        g(1801, parcelD);
    }

    public final void s(Bundle bundle, plf plfVar) {
        Parcel parcelD = d();
        int i = nvf.a;
        parcelD.writeInt(1);
        bundle.writeToParcel(parcelD, 0);
        parcelD.writeStrongBinder(plfVar);
        g(2001, parcelD);
    }

    public final void t(String str, Bundle bundle, f fVar) {
        Parcel parcelD = d();
        parcelD.writeInt(21);
        parcelD.writeString(str);
        int i = nvf.a;
        parcelD.writeInt(1);
        bundle.writeToParcel(parcelD, 0);
        parcelD.writeStrongBinder(fVar);
        g(1601, parcelD);
    }

    public final void u(String str, Bundle bundle, g gVar) {
        Parcel parcelD = d();
        parcelD.writeInt(18);
        parcelD.writeString(str);
        int i = nvf.a;
        parcelD.writeInt(1);
        bundle.writeToParcel(parcelD, 0);
        parcelD.writeStrongBinder(gVar);
        f(QuickTimeMetadataDirectory.TAG_LOCATION_BODY, parcelD);
    }

    public final void v(String str, Bundle bundle, j jVar) {
        Parcel parcelD = d();
        parcelD.writeInt(25);
        parcelD.writeString(str);
        int i = nvf.a;
        parcelD.writeInt(1);
        bundle.writeToParcel(parcelD, 0);
        parcelD.writeStrongBinder(jVar);
        g(2101, parcelD);
    }

    public final void w(String str, Bundle bundle, dxf dxfVar) {
        Parcel parcelD = d();
        parcelD.writeInt(24);
        parcelD.writeString(str);
        int i = nvf.a;
        parcelD.writeInt(1);
        bundle.writeToParcel(parcelD, 0);
        parcelD.writeStrongBinder(dxfVar);
        g(1701, parcelD);
    }

    public final void x(String str, Bundle bundle, k kVar) {
        Parcel parcelD = d();
        parcelD.writeInt(12);
        parcelD.writeString(str);
        int i = nvf.a;
        parcelD.writeInt(1);
        bundle.writeToParcel(parcelD, 0);
        parcelD.writeStrongBinder(kVar);
        f(1201, parcelD);
    }
}
