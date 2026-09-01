package defpackage;

import android.net.Uri;
import android.os.Bundle;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ym6 {
    public final /* synthetic */ int a;
    public String b;
    public int c;
    public final Object d;
    public final Object e;
    public final Object f;
    public Serializable g;
    public Serializable h;

    /* JADX WARN: Multi-variable type inference failed */
    public ym6(xm6 xm6Var, zz7 zz7Var, String[] strArr, String[] strArr2, String[] strArr3, String str, int i) {
        this.a = 0;
        xm6Var.getClass();
        this.d = xm6Var;
        this.e = zz7Var;
        this.f = strArr;
        this.g = strArr2;
        this.h = strArr3;
        this.b = str;
        this.c = i;
    }

    public ua8 a(String str) {
        qa8 qa8Var;
        str.getClass();
        w5d w5dVar = (w5d) this.h;
        if (w5dVar == null || (qa8Var = (qa8) w5dVar.getValue()) == null) {
            return null;
        }
        int i = va8.f;
        Uri uri = Uri.parse("android-app://androidx.navigation/".concat(str));
        uri.getClass();
        Bundle bundleD = qa8Var.d(uri, (LinkedHashMap) this.f);
        if (bundleD == null) {
            return null;
        }
        return new ua8((va8) this.d, bundleD, qa8Var.p, qa8Var.b(uri), false, -1);
    }

    public String toString() {
        switch (this.a) {
            case 0:
                return ((xm6) this.d) + " version=" + ((zz7) this.e);
            default:
                return super.toString();
        }
    }

    public ym6(va8 va8Var) {
        this.a = 1;
        this.d = va8Var;
        this.e = new ArrayList();
        this.f = new LinkedHashMap();
    }
}
