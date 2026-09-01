package defpackage;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xjf extends k2 {
    public static final Parcelable.Creator<xjf> CREATOR = new tfd(17);
    public final int a;
    public final Account b;
    public final int c;
    public final GoogleSignInAccount d;

    public xjf(int i, Account account, int i2, GoogleSignInAccount googleSignInAccount) {
        this.a = i;
        this.b = account;
        this.c = i2;
        this.d = googleSignInAccount;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a);
        fo7.U(parcel, 2, this.b, i);
        fo7.a0(parcel, 3, 4);
        parcel.writeInt(this.c);
        fo7.U(parcel, 4, this.d, i);
        fo7.d0(iC0, parcel);
    }
}
