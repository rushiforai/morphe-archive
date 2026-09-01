package defpackage;

import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class eag extends ihf implements IInterface {
    public final int f;

    public eag(byte[] bArr) {
        super("com.google.android.gms.common.internal.ICertData", 6);
        vp7.l(bArr.length == 25);
        this.f = Arrays.hashCode(bArr);
    }

    public static byte[] p(String str) {
        try {
            return str.getBytes("ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            ay0.d(e);
            return null;
        }
    }

    public final boolean equals(Object obj) {
        if (obj instanceof eag) {
            try {
                eag eagVar = (eag) obj;
                if (eagVar.f == this.f) {
                    return Arrays.equals(o(), (byte[]) new vm8(eagVar.o()).f);
                }
            } catch (RemoteException e) {
                Log.e("GoogleCertificates", "Failed to get Google certificates from remote", e);
                return false;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.f;
    }

    @Override // defpackage.ihf
    public final boolean l(int i, Parcel parcel, Parcel parcel2) {
        if (i != 1) {
            if (i != 2) {
                return false;
            }
            parcel2.writeNoException();
            parcel2.writeInt(this.f);
            return true;
        }
        vm8 vm8Var = new vm8(o());
        parcel2.writeNoException();
        int i2 = oxf.a;
        parcel2.writeStrongBinder(vm8Var);
        return true;
    }

    public abstract byte[] o();
}
