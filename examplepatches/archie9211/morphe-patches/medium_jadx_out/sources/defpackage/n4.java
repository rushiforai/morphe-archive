package defpackage;

import android.content.Context;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class n4 {
    public Object a;
    public Object b;

    public n4(vp7 vp7Var) {
        this.a = new ul0(0, this);
        this.b = new tl0(this, vp7Var);
    }

    public void c() {
        ys0 ys0Var = (ys0) this.a;
        if (ys0Var != null) {
            try {
                ((f20) this.b).k.unregisterReceiver(ys0Var);
            } catch (IllegalArgumentException unused) {
            }
            this.a = null;
        }
    }

    public void d() {
        blc blcVar = (blc) this.a;
        a61 a61Var = (a61) this.b;
        LinkedHashSet linkedHashSet = blcVar.e;
        if (linkedHashSet.remove(a61Var) && linkedHashSet.isEmpty()) {
            blcVar.b();
        }
    }

    public abstract IntentFilter e();

    public abstract int[] f(int i);

    public abstract int g();

    public MenuItem h(MenuItem menuItem) {
        if (!(menuItem instanceof s2d)) {
            return menuItem;
        }
        s2d s2dVar = (s2d) menuItem;
        aec aecVar = (aec) this.b;
        if (aecVar == null) {
            aecVar = new aec(0);
            this.b = aecVar;
        }
        MenuItem menuItem2 = (MenuItem) aecVar.get(s2dVar);
        if (menuItem2 != null) {
            return menuItem2;
        }
        wx7 wx7Var = new wx7((Context) this.a, s2dVar);
        ((aec) this.b).put(s2dVar, wx7Var);
        return wx7Var;
    }

    public int[] i(int i, int i2) {
        if (i < 0 || i2 < 0 || i == i2) {
            return null;
        }
        int[] iArr = (int[]) this.b;
        iArr[0] = i;
        iArr[1] = i2;
        return iArr;
    }

    public String j() {
        String str = (String) this.a;
        if (str != null) {
            return str;
        }
        g76.g0("text");
        throw null;
    }

    public boolean k() {
        return ((ul0) this.a).b && ((tl0) this.b).b;
    }

    public boolean l() {
        dlc dlcVar = flc.Companion;
        blc blcVar = (blc) this.a;
        View view = blcVar.c.G;
        view.getClass();
        dlcVar.getClass();
        flc flcVarA = dlc.a(view);
        flc flcVar = blcVar.a;
        if (flcVarA == flcVar) {
            return true;
        }
        flc flcVar2 = flc.VISIBLE;
        return (flcVarA == flcVar2 || flcVar == flcVar2) ? false : true;
    }

    public abstract void n();

    public abstract void q();

    public abstract int[] r(int i);

    public void s() {
        c();
        IntentFilter intentFilterE = e();
        if (intentFilterE.countActions() == 0) {
            return;
        }
        ys0 ys0Var = (ys0) this.a;
        if (ys0Var == null) {
            ys0Var = new ys0(1, this);
            this.a = ys0Var;
        }
        ((f20) this.b).k.registerReceiver(ys0Var, intentFilterE);
    }

    public String t(String str, String str2) {
        return ((String) this.a) + str + "?key=" + str2;
    }

    public n4(String str, Bundle bundle) {
        str.getClass();
        bundle.getClass();
        this.a = str;
        this.b = bundle;
    }

    public n4(Context context) {
        this.a = context;
    }

    public void m() {
    }

    public void p() {
    }

    public /* synthetic */ n4(Object obj, Object obj2) {
        this.a = obj;
        this.b = obj2;
    }

    public n4() {
        this.b = new int[2];
    }

    public n4(f20 f20Var) {
        this.b = f20Var;
    }

    public void o(sl0 sl0Var) {
    }
}
