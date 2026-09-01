package defpackage;

import android.net.Uri;
import java.net.URL;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b4b {
    public final w60 a;
    public final ib2 b;

    public b4b(w60 w60Var, ib2 ib2Var) {
        w60Var.getClass();
        ib2Var.getClass();
        this.a = w60Var;
        this.b = ib2Var;
    }

    public final URL a() {
        Uri.Builder builderAppendPath = new Uri.Builder().scheme("https").authority("firebase-settings.crashlytics.com").appendPath("spi").appendPath("v2").appendPath("platforms").appendPath("android").appendPath("gmp");
        w60 w60Var = this.a;
        Uri.Builder builderAppendPath2 = builderAppendPath.appendPath(w60Var.a).appendPath("settings");
        gm gmVar = w60Var.c;
        return new URL(builderAppendPath2.appendQueryParameter("build_version", gmVar.c).appendQueryParameter("display_version", gmVar.b).build().toString());
    }
}
