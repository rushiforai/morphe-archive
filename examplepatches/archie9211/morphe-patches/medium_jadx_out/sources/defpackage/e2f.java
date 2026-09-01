package defpackage;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.drew.imaging.eps.ld.PdtluglzAX;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class e2f extends v98 {
    public static final Parcelable.Creator<e2f> CREATOR = new tfd(7);
    public n1f e;
    public String f;
    public final h4 g;

    public e2f(Parcel parcel) {
        super(1, parcel);
        this.g = h4.WEB_VIEW;
        this.f = parcel.readString();
    }

    @Override // defpackage.ba7
    public final void b() {
        n1f n1fVar = this.e;
        if (n1fVar != null) {
            if (n1fVar != null) {
                n1fVar.cancel();
            }
            this.e = null;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // defpackage.ba7
    public final String e() {
        return "web_view";
    }

    @Override // defpackage.v98
    public final h4 p() {
        return this.g;
    }

    @Override // defpackage.ba7, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        super.writeToParcel(parcel, i);
        parcel.writeString(this.f);
    }

    @Override // defpackage.ba7
    public final int k(m87 m87Var) {
        n1f n1fVar;
        Uri uriA;
        m87Var.getClass();
        String str = m87Var.e;
        Bundle bundleN = n(m87Var);
        l(m87Var, bundleN);
        d2f d2fVar = new d2f(this, 0, m87Var);
        String strW = s42.W();
        this.f = strW;
        a("e2e", strW);
        m15 m15VarE = d().e();
        if (m15VarE == null) {
            return 0;
        }
        boolean zG = epe.G(m15VarE);
        String str2 = m87Var.d;
        str2.getClass();
        hk7.E(str2, "applicationId");
        String str3 = this.f;
        str3.getClass();
        String str4 = zG ? "fbconnect://chrome_os_success" : "fbconnect://success";
        String str5 = m87Var.j;
        str5.getClass();
        l87 l87Var = m87Var.a;
        l87Var.getClass();
        ea7 ea7Var = m87Var.n;
        ea7Var.getClass();
        boolean z = m87Var.o;
        boolean z2 = m87Var.p;
        boolean z3 = str == null || str.length() == 0;
        if (!bundleN.containsKey("redirect_uri")) {
            bundleN.putString("redirect_uri", str4);
        }
        bundleN.putString("client_id", str2);
        bundleN.putString("e2e", str3);
        bundleN.putString("response_type", ea7Var == ea7.INSTAGRAM ? PdtluglzAX.xiz : "token,signed_request,graph_domain");
        bundleN.putString("return_scopes", "true");
        bundleN.putString("auth_type", str5);
        bundleN.putString("login_behavior", l87Var.name());
        if (z) {
            bundleN.putString("fx_app", ea7Var.toString());
        }
        if (z2) {
            bundleN.putString("skip_dedupe", "true");
        }
        if (z3) {
            int i = n1f.m;
            n1f.b(m15VarE);
            n1fVar = new n1f(m15VarE, "oauth", bundleN, ea7Var, d2fVar);
        } else {
            int i2 = c2f.o;
            str.getClass();
            Bundle bundle = new Bundle(bundleN);
            bundle.putString("display", "touch");
            bundle.putString("client_id", f94.b());
            bundle.putString("sdk", "android-18.2.3");
            if (b2f.a[ea7Var.ordinal()] == 1) {
                uriA = epe.a(no7.v(), "oauth/authorize", bundle);
            } else {
                uriA = epe.a(no7.t(), f94.d() + "/dialog/oauth", bundle);
            }
            n1f.b(m15VarE);
            String string = uriA.toString();
            string.getClass();
            n1fVar = new c2f(string, str, m15VarE);
            n1fVar.c = d2fVar;
        }
        this.e = n1fVar;
        y84 y84Var = new y84();
        y84Var.W();
        y84Var.C0 = this.e;
        y84Var.c0(m15VarE.m(), "FacebookDialogFragment");
        return 1;
    }

    public e2f(p87 p87Var) {
        this.b = p87Var;
        this.g = h4.WEB_VIEW;
    }
}
