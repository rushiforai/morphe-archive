package defpackage;

import android.os.Bundle;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ea8 {
    public final opg a;

    public ea8(Bundle bundle) {
        bundle.getClass();
        bundle.setClassLoader(ea8.class.getClassLoader());
        bundle.getClass();
        opg opgVar = new opg();
        String string = bundle.getString("nav-entry-state:id");
        if (string == null) {
            wo7.q("nav-entry-state:id");
            throw null;
        }
        opgVar.b = string;
        opgVar.a = vo7.y("nav-entry-state:destination-id", bundle);
        Bundle bundle2 = bundle.getBundle("nav-entry-state:args");
        if (bundle2 == null) {
            wo7.q("nav-entry-state:args");
            throw null;
        }
        opgVar.c = bundle2;
        Bundle bundle3 = bundle.getBundle("nav-entry-state:saved-state");
        if (bundle3 == null) {
            wo7.q("nav-entry-state:saved-state");
            throw null;
        }
        opgVar.d = bundle3;
        this.a = opgVar;
    }

    public ea8(ba8 ba8Var) {
        int i = ba8Var.b.b.c;
        opg opgVar = new opg();
        opgVar.b = ba8Var.f;
        opgVar.a = i;
        da8 da8Var = ba8Var.h;
        opgVar.c = da8Var.a();
        Bundle bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
        opgVar.d = bundleE;
        da8Var.h.b(bundleE);
        this.a = opgVar;
    }
}
