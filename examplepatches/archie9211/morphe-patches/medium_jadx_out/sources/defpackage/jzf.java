package defpackage;

import android.os.Parcel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jzf extends ihf {
    public final ohg f;

    public jzf(ohg ohgVar) {
        super("com.google.android.apps.play.billingtestcompanion.aidl.IBillingOverrideServiceCallback", 3);
        this.f = ohgVar;
    }

    @Override // defpackage.ihf
    public final boolean f(int i, Parcel parcel, Parcel parcel2) {
        if (i != 1) {
            return false;
        }
        int i2 = parcel.readInt();
        ihf.g(parcel);
        this.f.a(Integer.valueOf(i2));
        return true;
    }
}
