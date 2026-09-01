package com.google.firebase;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import com.google.firebase.components.ComponentRegistrar;
import defpackage.aj5;
import defpackage.cj5;
import defpackage.dz2;
import defpackage.e33;
import defpackage.fm3;
import defpackage.fz2;
import defpackage.hy1;
import defpackage.iy1;
import defpackage.om0;
import defpackage.pwd;
import defpackage.rj0;
import defpackage.rqa;
import defpackage.s73;
import defpackage.tn6;
import defpackage.xj4;
import defpackage.z72;
import defpackage.zi5;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FirebaseCommonRegistrar implements ComponentRegistrar {
    public static /* synthetic */ String a(Context context) {
        ApplicationInfo applicationInfo = context.getApplicationInfo();
        return (applicationInfo == null || Build.VERSION.SDK_INT < 24) ? "" : String.valueOf(applicationInfo.minSdkVersion);
    }

    public static String b(String str) {
        return str.replace(' ', '_').replace('/', '_');
    }

    @Override // com.google.firebase.components.ComponentRegistrar
    public final List getComponents() {
        String string;
        ArrayList arrayList = new ArrayList();
        hy1 hy1VarB = iy1.b(e33.class);
        hy1VarB.a(new s73(2, 0, rj0.class));
        hy1VarB.f = new z72(26);
        arrayList.add(hy1VarB.b());
        rqa rqaVar = new rqa(om0.class, Executor.class);
        hy1 hy1Var = new hy1(fz2.class, aj5.class, cj5.class);
        hy1Var.a(s73.b(Context.class));
        hy1Var.a(s73.b(xj4.class));
        hy1Var.a(new s73(2, 0, zi5.class));
        hy1Var.a(new s73(1, 1, e33.class));
        hy1Var.a(new s73(rqaVar, 1, 0));
        hy1Var.f = new dz2(rqaVar, 0);
        arrayList.add(hy1Var.b());
        arrayList.add(pwd.E("fire-android", String.valueOf(Build.VERSION.SDK_INT)));
        arrayList.add(pwd.E("fire-core", "22.0.1"));
        arrayList.add(pwd.E("device-name", b(Build.PRODUCT)));
        arrayList.add(pwd.E("device-model", b(Build.DEVICE)));
        arrayList.add(pwd.E("device-brand", b(Build.BRAND)));
        arrayList.add(pwd.M("android-target-sdk", new fm3(25)));
        arrayList.add(pwd.M("android-min-sdk", new fm3(26)));
        arrayList.add(pwd.M("android-platform", new fm3(27)));
        arrayList.add(pwd.M("android-installer", new fm3(28)));
        try {
            string = tn6.e.toString();
        } catch (NoClassDefFoundError unused) {
            string = null;
        }
        if (string != null) {
            arrayList.add(pwd.E("kotlin", string));
        }
        return arrayList;
    }
}
