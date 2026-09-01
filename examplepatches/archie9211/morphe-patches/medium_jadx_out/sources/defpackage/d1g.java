package defpackage;

import android.os.Process;
import android.text.TextUtils;
import android.util.Log;
import com.drew.imaging.riff.pvS.uuLAxLN;
import com.google.android.gms.internal.p000firebaseauthapi.zzabz;
import com.google.gson.JsonIOException;
import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;
import java.util.HashMap;
import java.util.IllegalFormatException;
import java.util.Locale;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class d1g implements km8, xnf {
    public static final d1g A;
    public static final d1g B;
    public static final d1g C;
    public static final d1g D;
    public static final d1g E;
    public static final d1g F;
    public static final d1g G;
    public static final d1g H;
    public static final d1g I;
    public static final d1g J;
    public static final d1g K;
    public static final d1g c;
    public static final d1g d;
    public static final d1g e;
    public static final d1g f;
    public static final d1g g;
    public static final d1g h;
    public static final d1g i;
    public static final d1g j;
    public static final d1g k;
    public static final d1g l;
    public static final d1g m;
    public static final d1g n;
    public static final d1g o;
    public static final d1g p;
    public static final d1g q;
    public static final d1g r;
    public static final d1g s;
    public static final d1g t;
    public static final d1g u;
    public static final d1g v;
    public static final d1g w;
    public static final d1g x;
    public static final d1g y;
    public static final d1g z;
    public final /* synthetic */ int a;
    public String b;

    static {
        int i2 = 0;
        boolean z2 = false;
        c = new d1g(i2, "TINK", z2);
        d = new d1g(i2, "CRUNCHY", z2);
        e = new d1g(i2, "NO_PREFIX", z2);
        int i3 = 1;
        f = new d1g(i3, "TINK", z2);
        g = new d1g(i3, "CRUNCHY", z2);
        h = new d1g(i3, "NO_PREFIX", z2);
        int i4 = 2;
        i = new d1g(i4, "TINK", z2);
        j = new d1g(i4, "CRUNCHY", z2);
        k = new d1g(i4, "NO_PREFIX", z2);
        int i5 = 3;
        l = new d1g(i5, "TINK", z2);
        m = new d1g(i5, "NO_PREFIX", z2);
        int i6 = 4;
        n = new d1g(i6, "TINK", z2);
        o = new d1g(i6, "NO_PREFIX", z2);
        int i7 = 5;
        p = new d1g(i7, "TINK", z2);
        q = new d1g(i7, "CRUNCHY", z2);
        r = new d1g(i7, "NO_PREFIX", z2);
        int i8 = 6;
        s = new d1g(i8, "ENABLED", z2);
        t = new d1g(i8, "DISABLED", z2);
        u = new d1g(i8, "DESTROYED", z2);
        int i9 = 7;
        v = new d1g(i9, "UNKNOWN_KEYMATERIAL", z2);
        w = new d1g(i9, "SYMMETRIC", z2);
        x = new d1g(i9, "ASYMMETRIC_PRIVATE", z2);
        y = new d1g(i9, "ASYMMETRIC_PUBLIC", z2);
        z = new d1g(i9, "REMOTE", z2);
        int i10 = 8;
        A = new d1g(i10, "SHA256", z2);
        B = new d1g(i10, "SHA384", z2);
        C = new d1g(i10, "SHA512", z2);
        int i11 = 9;
        D = new d1g(i11, "TINK", z2);
        E = new d1g(i11, "CRUNCHY", z2);
        F = new d1g(i11, "LEGACY", z2);
        G = new d1g(i11, "NO_PREFIX", z2);
        int i12 = 10;
        H = new d1g(i12, "TINK", z2);
        I = new d1g(i12, "CRUNCHY", z2);
        J = new d1g(i12, "LEGACY", z2);
        K = new d1g(i12, "NO_PREFIX", z2);
    }

    public d1g(String str, int i2) {
        this.a = i2;
        switch (i2) {
            case 18:
                this.b = ev6.s(Process.myUid(), Process.myPid(), "UID: [", "]  PID: [", "] ").concat(str);
                break;
            default:
                this.b = (str == null || str.length() <= 0) ? null : str;
                break;
        }
    }

    public static void b(ku3 ku3Var, m2c m2cVar) {
        String str = m2cVar.a;
        if (str != null) {
            ku3Var.D("X-CRASHLYTICS-GOOGLE-APP-ID", str);
        }
        ku3Var.D("X-CRASHLYTICS-API-CLIENT-TYPE", "android");
        ku3Var.D("X-CRASHLYTICS-API-CLIENT-VERSION", "20.0.6");
        ku3Var.D("Accept", "application/json");
        ku3Var.D("X-CRASHLYTICS-DEVICE-MODEL", m2cVar.b);
        String str2 = m2cVar.c;
        if (str2 != null) {
            ku3Var.D("X-CRASHLYTICS-OS-BUILD-VERSION", str2);
        }
        String str3 = m2cVar.d;
        if (str3 != null) {
            ku3Var.D("X-CRASHLYTICS-OS-DISPLAY-VERSION", str3);
        }
        String str4 = m2cVar.e.c().a;
        if (str4 != null) {
            ku3Var.D("X-CRASHLYTICS-INSTALLATION-ID", str4);
        }
    }

    public static HashMap c(m2c m2cVar) {
        HashMap map = new HashMap();
        map.put("build_version", m2cVar.h);
        map.put("display_version", m2cVar.g);
        map.put("source", Integer.toString(m2cVar.i));
        String str = m2cVar.f;
        if (!TextUtils.isEmpty(str)) {
            map.put("instance", str);
        }
        return map;
    }

    public static String j(String str, String str2, Object... objArr) {
        if (objArr.length > 0) {
            try {
                str2 = String.format(Locale.US, str2, objArr);
            } catch (IllegalFormatException e2) {
                Log.e("PlayCore", "Unable to format ".concat(str2), e2);
                str2 = lv8.r(str2, uuLAxLN.EfIpPiFRbGPfBQV, TextUtils.join(", ", objArr), "]");
            }
        }
        return ev6.x(str, " : ", str2);
    }

    @Override // defpackage.xnf
    public xnf a(String str) throws zzabz {
        try {
            JSONObject jSONObject = new JSONObject(new JSONObject(str).getString("error"));
            jSONObject.getInt("code");
            this.b = jSONObject.getString("message");
            return this;
        } catch (NullPointerException | JSONException e2) {
            Log.e("d1g", "Failed to parse error for string [" + str + "] with exception: " + e2.getMessage());
            throw new zzabz(ev6.x("Failed to parse error for string [", str, "]"), e2);
        }
    }

    public JSONObject d(kt5 kt5Var) {
        String str = this.b;
        int i2 = kt5Var.b;
        uob uobVar = uob.e;
        uobVar.p("Settings response code was: " + i2);
        if (i2 == 200 || i2 == 201 || i2 == 202 || i2 == 203) {
            String str2 = kt5Var.a;
            try {
                return new JSONObject(str2);
            } catch (Exception e2) {
                uobVar.q("Failed to parse settings JSON from ".concat(str), e2);
                uobVar.q("Settings response " + str2, null);
                return null;
            }
        }
        String str3 = "Settings request failed; (status: " + i2 + ") from " + str;
        if (uobVar.k(6)) {
            Log.e("FirebaseCrashlytics", str3, null);
        }
        return null;
    }

    public byte[] e(int i2, byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        cvg cvgVar = cvg.c;
        String str = this.b;
        Mac mac = (Mac) cvgVar.a.a(str);
        if (i2 > mac.getMacLength() * 255) {
            ygf.l("size too large");
            return null;
        }
        byte[] bArr3 = new byte[i2];
        mac.init(new SecretKeySpec(bArr, str));
        byte[] bArrDoFinal = new byte[0];
        int i3 = 1;
        int length = 0;
        while (true) {
            mac.update(bArrDoFinal);
            mac.update(bArr2);
            mac.update((byte) i3);
            bArrDoFinal = mac.doFinal();
            if (bArrDoFinal.length + length >= i2) {
                System.arraycopy(bArrDoFinal, 0, bArr3, length, i2 - length);
                return bArr3;
            }
            System.arraycopy(bArrDoFinal, 0, bArr3, length, bArrDoFinal.length);
            length += bArrDoFinal.length;
            i3++;
        }
    }

    public byte[] f(byte[] bArr, byte[] bArr2) throws InvalidKeyException {
        cvg cvgVar = cvg.c;
        String str = this.b;
        Mac mac = (Mac) cvgVar.a.a(str);
        if (bArr2 == null || bArr2.length == 0) {
            mac.init(new SecretKeySpec(new byte[mac.getMacLength()], str));
        } else {
            mac.init(new SecretKeySpec(bArr2, str));
        }
        return mac.doFinal(bArr);
    }

    @Override // defpackage.km8
    public Object g() {
        throw new JsonIOException(this.b);
    }

    public void h(String str, Object... objArr) {
        if (Log.isLoggable("PlayCore", 4)) {
            Log.i("PlayCore", j(this.b, str, objArr));
        }
    }

    public void i(String str, Object... objArr) {
        if (Log.isLoggable("PlayCore", 5)) {
            Log.w("PlayCore", j(this.b, str, objArr));
        }
    }

    public String toString() {
        switch (this.a) {
            case 0:
                return this.b;
            case 1:
                return this.b;
            case 2:
                return this.b;
            case 3:
                return this.b;
            case 4:
                return this.b;
            case 5:
                return this.b;
            case 6:
                return this.b;
            case 7:
                return this.b;
            case 8:
                return this.b;
            case 9:
                return this.b;
            case 10:
                return this.b;
            case 11:
            case 12:
            case 13:
            case 14:
            default:
                return super.toString();
            case 15:
                return this.b;
            case 16:
                return ev6.z(new StringBuilder("<"), this.b, '>');
        }
    }

    public /* synthetic */ d1g(int i2, String str, boolean z2) {
        this.a = i2;
        this.b = str;
    }

    public /* synthetic */ d1g(int i2) {
        this.a = i2;
    }

    public d1g(String str, dq1 dq1Var) {
        this.a = 12;
        this.b = str;
    }
}
