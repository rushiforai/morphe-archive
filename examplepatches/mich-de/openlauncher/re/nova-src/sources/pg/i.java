package pg;

import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import b.s8;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import sg.l0;
import sg.w;

/* loaded from: classes.dex */
public abstract class i extends s8 implements l0 {

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ int f82575k = 0;

    /* renamed from: j, reason: collision with root package name */
    public final int f82576j;

    public i(byte[] bArr) {
        super("com.google.android.gms.common.internal.ICertData", 1);
        w.c(bArr.length == 25);
        this.f82576j = Arrays.hashCode(bArr);
    }

    public static byte[] V(String str) {
        try {
            return str.getBytes("ISO-8859-1");
        } catch (UnsupportedEncodingException e3) {
            throw new AssertionError(e3);
        }
    }

    @Override // b.s8
    public final boolean T(int i5, Parcel parcel, Parcel parcel2) {
        if (i5 == 1) {
            ah.b bVarZzd = zzd();
            parcel2.writeNoException();
            u90.b.k0(parcel2, bVarZzd);
            return true;
        }
        if (i5 != 2) {
            return false;
        }
        parcel2.writeNoException();
        parcel2.writeInt(this.f82576j);
        return true;
    }

    public abstract byte[] U();

    public final boolean equals(Object obj) {
        ah.b bVarZzd;
        if (obj instanceof l0) {
            try {
                l0 l0Var = (l0) obj;
                if (l0Var.zze() == this.f82576j && (bVarZzd = l0Var.zzd()) != null) {
                    return Arrays.equals(U(), (byte[]) ah.d.V(bVarZzd));
                }
            } catch (RemoteException e3) {
                Log.e("GoogleCertificates", "Failed to get Google certificates from remote", e3);
                return false;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.f82576j;
    }

    @Override // sg.l0
    public final ah.b zzd() {
        return new ah.d(U());
    }

    @Override // sg.l0
    public final int zze() {
        return this.f82576j;
    }
}
