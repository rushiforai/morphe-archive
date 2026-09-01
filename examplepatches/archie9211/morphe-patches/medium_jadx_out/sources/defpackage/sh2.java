package defpackage;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sh2 {
    public final Context a;

    public sh2(Context context, int i) {
        switch (i) {
            case 1:
                this.a = context;
                break;
            default:
                context.getClass();
                this.a = context;
                break;
        }
    }

    public static eh2 a(sh2 sh2Var, Object obj) {
        if (obj.equals("androidx.credentials.TYPE_CLEAR_RESTORE_CREDENTIAL")) {
            return sh2Var.c();
        }
        if (obj instanceof i95) {
            for (dh2 dh2Var : ((i95) obj).a) {
            }
        }
        Context context = sh2Var.a;
        context.getClass();
        if (context.getPackageManager().hasSystemFeature("android.software.leanback") || context.getPackageManager().hasSystemFeature("android.hardware.type.automotive")) {
            return sh2Var.c();
        }
        int i = Build.VERSION.SDK_INT;
        if (i >= 34) {
            uh2 uh2Var = new uh2(context);
            uh2 uh2Var2 = uh2Var.isAvailableOnDevice() ? uh2Var : null;
            return uh2Var2 == null ? sh2Var.c() : uh2Var2;
        }
        if (i <= 33) {
            return sh2Var.c();
        }
        return null;
    }

    public boolean b() {
        return nm.a(this.a, "android.permission.READ_CONTACTS") == 0;
    }

    public eh2 c() throws PackageManager.NameNotFoundException {
        String string;
        Context context = this.a;
        PackageInfo packageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), NikonType2MakernoteDirectory.TAG_LENS);
        ArrayList arrayList = new ArrayList();
        ServiceInfo[] serviceInfoArr = packageInfo.services;
        if (serviceInfoArr != null) {
            for (ServiceInfo serviceInfo : serviceInfoArr) {
                Bundle bundle = serviceInfo.metaData;
                if (bundle != null && (string = bundle.getString("androidx.credentials.CREDENTIAL_PROVIDER_KEY")) != null) {
                    arrayList.add(string);
                }
            }
        }
        List listM1 = bu1.m1(arrayList);
        if (listM1.isEmpty()) {
            return null;
        }
        Iterator it2 = listM1.iterator();
        eh2 eh2Var = null;
        while (it2.hasNext()) {
            try {
                Object objNewInstance = Class.forName((String) it2.next()).getConstructor(Context.class).newInstance(context);
                objNewInstance.getClass();
                eh2 eh2Var2 = (eh2) objNewInstance;
                if (!eh2Var2.isAvailableOnDevice()) {
                    continue;
                } else {
                    if (eh2Var != null) {
                        Log.i("CredProviderFactory", "Only one active OEM CredentialProvider allowed");
                        return null;
                    }
                    eh2Var = eh2Var2;
                }
            } catch (Throwable unused) {
            }
        }
        return eh2Var;
    }
}
