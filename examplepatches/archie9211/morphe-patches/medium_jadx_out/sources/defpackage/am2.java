package defpackage;

import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.CustomTabMainActivity;
import java.math.BigInteger;
import java.security.SecureRandom;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class am2 extends v98 {
    public static final Parcelable.Creator<am2> CREATOR = new xkf(24);
    public static boolean j;
    public String e;
    public final String f;
    public final String g;
    public final String h;
    public final h4 i;

    public am2(p87 p87Var) {
        this.b = p87Var;
        this.h = "custom_tab";
        this.i = h4.CHROME_CUSTOM_TAB;
        String string = new BigInteger(100, new SecureRandom()).toString(32);
        string.getClass();
        this.f = string;
        j = false;
        this.g = dm2.J(super.f());
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // defpackage.ba7
    public final String e() {
        return this.h;
    }

    @Override // defpackage.ba7
    public final String f() {
        return this.g;
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x000e  */
    @Override // defpackage.v98, defpackage.ba7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean h(int r7, int r8, android.content.Intent r9) {
        /*
            Method dump skipped, instruction units count: 280
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.am2.h(int, int, android.content.Intent):boolean");
    }

    @Override // defpackage.ba7
    public final void j(JSONObject jSONObject) throws JSONException {
        jSONObject.put("7_challenge", this.f);
    }

    @Override // defpackage.ba7
    public final int k(m87 m87Var) {
        m87Var.getClass();
        ea7 ea7Var = m87Var.n;
        p87 p87VarD = d();
        if (this.g.length() == 0) {
            return 0;
        }
        Bundle bundleN = n(m87Var);
        l(m87Var, bundleN);
        if (j) {
            bundleN.putString("cct_over_app_switch", "1");
        }
        if (f94.n) {
            if (ea7Var == ea7.INSTAGRAM) {
                lig ligVar = cm2.b;
                rx0.R(epe.a(no7.v(), "oauth/authorize", bundleN));
            } else {
                lig ligVar2 = cm2.b;
                rx0.R(epe.a(no7.t(), f94.d() + "/dialog/oauth", bundleN));
            }
        }
        m15 m15VarE = p87VarD.e();
        if (m15VarE == null) {
            return 0;
        }
        Intent intent = new Intent(m15VarE, (Class<?>) CustomTabMainActivity.class);
        int i = CustomTabMainActivity.c;
        intent.putExtra("CustomTabMainActivity.extra_action", "oauth");
        intent.putExtra("CustomTabMainActivity.extra_params", bundleN);
        String strH = this.e;
        if (strH == null) {
            strH = dm2.H();
            this.e = strH;
        }
        intent.putExtra("CustomTabMainActivity.extra_chromePackage", strH);
        intent.putExtra("CustomTabMainActivity.extra_targetApp", ea7Var.toString());
        v97 v97Var = p87VarD.c;
        if (v97Var != null) {
            if (v97Var.t != null) {
                f25 f25VarM = v97Var.m();
                if (f25VarM.B != null) {
                    String str = v97Var.e;
                    a25 a25Var = new a25();
                    a25Var.a = str;
                    a25Var.b = 1;
                    f25VarM.E.addLast(a25Var);
                    f25VarM.B.a(intent, null);
                } else {
                    f25VarM.v.getClass();
                    ygf.f("Starting activity with a requestCode requires a FragmentActivity host");
                }
            } else {
                ygf.f(km4.x("Fragment ", v97Var, " not attached to Activity"));
            }
        }
        return 1;
    }

    @Override // defpackage.v98
    public final void l(m87 m87Var, Bundle bundle) {
        m87Var.getClass();
        String str = m87Var.f;
        super.l(m87Var, bundle);
        String strConcat = m87Var.e;
        if (strConcat == null || strConcat.length() == 0) {
            strConcat = (str == null || str.length() == 0) ? this.g : "intent://".concat(str);
        }
        bundle.putString("redirect_uri", strConcat);
    }

    @Override // defpackage.v98
    public final String o() {
        return "chrome_custom_tab";
    }

    @Override // defpackage.v98
    public final h4 p() {
        return this.i;
    }

    @Override // defpackage.ba7, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        super.writeToParcel(parcel, i);
        parcel.writeString(this.f);
    }

    public am2(Parcel parcel) {
        super(1, parcel);
        this.h = "custom_tab";
        this.i = h4.CHROME_CUSTOM_TAB;
        this.f = parcel.readString();
        this.g = dm2.J(super.f());
    }
}
