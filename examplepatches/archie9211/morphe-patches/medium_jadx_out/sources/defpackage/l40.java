package defpackage;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class l40 {
    public static ScheduledFuture c;
    public static volatile pkf a = new pkf(3);
    public static final ScheduledExecutorService b = Executors.newSingleThreadScheduledExecutor();
    public static final e d = new e(6);

    public static final ff5 a(y3 y3Var, b1c b1cVar, boolean z, ad adVar) {
        Set set = ec2.a;
        if (!set.contains(l40.class)) {
            try {
                String str = y3Var.a;
                xe4 xe4VarK = af4.k(str, false);
                String str2 = ff5.j;
                ff5 ff5VarH0 = xz5.h0(null, String.format("%s/activities", Arrays.copyOf(new Object[]{str}, 1)), null, null);
                ff5VarH0.i = true;
                Bundle bundle = ff5VarH0.d;
                if (bundle == null) {
                    bundle = new Bundle();
                }
                String str3 = y3Var.b;
                if (str3 == null) {
                    Date date = w3.l;
                    w3 w3VarR = wgf.r();
                    str3 = w3VarR != null ? w3VarR.e : null;
                }
                if (str3 != null) {
                    bundle.putString("access_token", str3);
                }
                synchronized (g50.c()) {
                    set.contains(g50.class);
                }
                String strW = o7f.w();
                if (strW != null) {
                    bundle.putString("install_referrer", strW);
                }
                ff5VarH0.d = bundle;
                int iE = b1cVar.e(ff5VarH0, f94.a(), xe4VarK != null ? xe4VarK.a : false, z);
                if (iE != 0) {
                    adVar.b += iE;
                    ff5VarH0.j(new z3(y3Var, ff5VarH0, b1cVar, adVar, 1));
                    return ff5VarH0;
                }
            } catch (Throwable th) {
                ec2.a(l40.class, th);
                return null;
            }
        }
        return null;
    }

    public static final ArrayList b(pkf pkfVar, ad adVar) {
        if (ec2.a.contains(l40.class)) {
            return null;
        }
        try {
            pkfVar.getClass();
            boolean zF = f94.f(f94.a());
            ArrayList arrayList = new ArrayList();
            for (y3 y3Var : pkfVar.A()) {
                b1c b1cVarS = pkfVar.s(y3Var);
                if (b1cVarS == null) {
                    throw new IllegalStateException("Required value was null.");
                }
                ff5 ff5VarA = a(y3Var, b1cVarS, zF, adVar);
                if (ff5VarA != null) {
                    arrayList.add(ff5VarA);
                    if (t40.a) {
                        HashSet hashSet = e50.a;
                        try {
                            f94.c().execute(new v0(8, ff5VarA));
                        } catch (Exception unused) {
                        }
                    }
                }
            }
            return arrayList;
        } catch (Throwable th) {
            ec2.a(l40.class, th);
            return null;
        }
    }

    public static final void c(xq4 xq4Var) {
        if (ec2.a.contains(l40.class)) {
            return;
        }
        try {
            xq4Var.getClass();
            b.execute(new v0(7, xq4Var));
        } catch (Throwable th) {
            ec2.a(l40.class, th);
        }
    }

    public static final void d(xq4 xq4Var) {
        if (ec2.a.contains(l40.class)) {
            return;
        }
        try {
            xq4Var.getClass();
            a.k(k40.J0());
            try {
                ad adVarF = f(xq4Var, a);
                if (adVarF != null) {
                    Intent intent = new Intent("com.facebook.sdk.APP_EVENTS_FLUSHED");
                    intent.putExtra("com.facebook.sdk.APP_EVENTS_NUM_EVENTS_FLUSHED", adVarF.b);
                    intent.putExtra("com.facebook.sdk.APP_EVENTS_FLUSH_RESULT", (yq4) adVarF.c);
                    iq1.C(f94.a()).O(intent);
                }
            } catch (Exception e) {
                Log.w("l40", "Caught unexpected exception while flushing app events: ", e);
            }
        } catch (Throwable th) {
            ec2.a(l40.class, th);
        }
    }

    public static final void e(y3 y3Var, ff5 ff5Var, if5 if5Var, b1c b1cVar, ad adVar) {
        yq4 yq4Var;
        if (ec2.a.contains(l40.class)) {
            return;
        }
        try {
            b94 b94Var = if5Var.c;
            yq4 yq4Var2 = yq4.SUCCESS;
            boolean z = true;
            if (b94Var == null) {
                yq4Var = yq4Var2;
            } else if (b94Var.b == -1) {
                yq4Var = yq4.NO_CONNECTIVITY;
            } else {
                String.format("Failed:\n  Response: %s\n  Error %s", Arrays.copyOf(new Object[]{if5Var.toString(), b94Var.toString()}, 2));
                yq4Var = yq4.SERVER_ERROR;
            }
            f94.h(i87.APP_EVENTS);
            if (b94Var == null) {
                z = false;
            }
            b1cVar.b(z);
            yq4 yq4Var3 = yq4.NO_CONNECTIVITY;
            if (yq4Var == yq4Var3) {
                f94.c().execute(new ho(y3Var, 3, b1cVar));
            }
            if (yq4Var == yq4Var2 || ((yq4) adVar.c) == yq4Var3) {
                return;
            }
            yq4Var.getClass();
            adVar.c = yq4Var;
        } catch (Throwable th) {
            ec2.a(l40.class, th);
        }
    }

    public static final ad f(xq4 xq4Var, pkf pkfVar) {
        if (!ec2.a.contains(l40.class)) {
            try {
                xq4Var.getClass();
                pkfVar.getClass();
                ad adVar = new ad((char) 0, 5);
                adVar.c = yq4.SUCCESS;
                ArrayList arrayListB = b(pkfVar, adVar);
                if (!arrayListB.isEmpty()) {
                    z46 z46Var = f87.b;
                    z46.s(i87.APP_EVENTS, "l40", "Flushing %d events due to %s.", Integer.valueOf(adVar.b), xq4Var.toString());
                    Iterator it2 = arrayListB.iterator();
                    while (it2.hasNext()) {
                        ((ff5) it2.next()).c();
                    }
                    return adVar;
                }
            } catch (Throwable th) {
                ec2.a(l40.class, th);
                return null;
            }
        }
        return null;
    }
}
