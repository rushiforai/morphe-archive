package defpackage;

import android.content.Context;
import android.text.TextUtils;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nk4 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;

    public nk4(String str, String str2, String str3, String str4, String str5, String str6, String str7) {
        int i = luc.a;
        vp7.r("ApplicationId must be set.", true ^ (str == null || str.trim().isEmpty()));
        this.b = str;
        this.a = str2;
        this.c = str3;
        this.d = str4;
        this.e = str5;
        this.f = str6;
        this.g = str7;
    }

    public static nk4 a(Context context) {
        a1a a1aVar = new a1a(context);
        String strS = a1aVar.s("google_app_id");
        if (TextUtils.isEmpty(strS)) {
            return null;
        }
        return new nk4(strS, a1aVar.s("google_api_key"), a1aVar.s("firebase_database_url"), a1aVar.s("ga_trackingId"), a1aVar.s("gcm_defaultSenderId"), a1aVar.s("google_storage_bucket"), a1aVar.s("project_id"));
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof nk4)) {
            return false;
        }
        nk4 nk4Var = (nk4) obj;
        return en7.u(this.b, nk4Var.b) && en7.u(this.a, nk4Var.a) && en7.u(this.c, nk4Var.c) && en7.u(this.d, nk4Var.d) && en7.u(this.e, nk4Var.e) && en7.u(this.f, nk4Var.f) && en7.u(this.g, nk4Var.g);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.b, this.a, this.c, this.d, this.e, this.f, this.g});
    }

    public final String toString() {
        hx4 hx4Var = new hx4(this);
        hx4Var.a("applicationId", this.b);
        hx4Var.a("apiKey", this.a);
        hx4Var.a("databaseUrl", this.c);
        hx4Var.a("gcmSenderId", this.e);
        hx4Var.a("storageBucket", this.f);
        hx4Var.a("projectId", this.g);
        return hx4Var.toString();
    }
}
