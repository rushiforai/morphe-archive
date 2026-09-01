package com.google.android.gms.auth.api.signin;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.ReflectedParcelable;
import defpackage.fo7;
import defpackage.k2;
import defpackage.tfd;
import defpackage.vp7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class SignInAccount extends k2 implements ReflectedParcelable {
    public static final Parcelable.Creator<SignInAccount> CREATOR = new tfd(19);
    public final String a;
    public final GoogleSignInAccount b;
    public final String c;

    public SignInAccount(String str, GoogleSignInAccount googleSignInAccount, String str2) {
        this.b = googleSignInAccount;
        vp7.o(str, "8.3 and 8.4 SDKs require non-null email");
        this.a = str;
        vp7.o(str2, "8.3 and 8.4 SDKs require non-null userId");
        this.c = str2;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 4, this.a);
        fo7.U(parcel, 7, this.b, i);
        fo7.V(parcel, 8, this.c);
        fo7.d0(iC0, parcel);
    }
}
