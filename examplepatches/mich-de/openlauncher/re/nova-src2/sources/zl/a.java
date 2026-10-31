package zl;

import ai.b2;
import android.os.Bundle;
import com.tiktok.util.TTConst;
import java.util.Arrays;
import rg.m;
import w20.e;
import xk.d1;
import xk.l0;
import xk.r2;
import xk.v0;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final d1 f98562a = d1.r("_in", "_xa", "_xu", "_aq", "_aa", "_ai", "_ac", "campaign_details", "_ug", "_iapx", "_exp_set", "_exp_clear", "_exp_activate", "_exp_timeout", "_exp_expire");

    /* renamed from: b, reason: collision with root package name */
    public static final r2 f98563b;

    /* renamed from: c, reason: collision with root package name */
    public static final r2 f98564c;

    /* renamed from: d, reason: collision with root package name */
    public static final r2 f98565d;

    /* renamed from: e, reason: collision with root package name */
    public static final r2 f98566e;

    /* renamed from: f, reason: collision with root package name */
    public static final r2 f98567f;

    static {
        l0 l0Var = v0.f96030b;
        Object[] objArr = {"_e", "_f", "_iap", "_s", "_au", "_ui", "_cd"};
        e.c(7, objArr);
        f98563b = v0.k(7, objArr);
        Object[] objArr2 = {TTConst.TRACK_TYPE_AUTO, "app", "am"};
        e.c(3, objArr2);
        f98564c = v0.k(3, objArr2);
        f98565d = v0.t("_r", "_dbg");
        e.e(4, "initialCapacity");
        Object[] objArrCopyOf = new Object[4];
        String[] strArr = b2.f12865l;
        e.c(15, strArr);
        int i5 = 0 + 15;
        if (objArrCopyOf.length < i5) {
            objArrCopyOf = Arrays.copyOf(objArrCopyOf, m.c(objArrCopyOf.length, i5));
        }
        System.arraycopy(strArr, 0, objArrCopyOf, 0, 15);
        int i11 = 0 + 15;
        String[] strArr2 = b2.f12866m;
        e.c(15, strArr2);
        int i12 = i11 + 15;
        if (objArrCopyOf.length < i12) {
            objArrCopyOf = Arrays.copyOf(objArrCopyOf, m.c(objArrCopyOf.length, i12));
        }
        System.arraycopy(strArr2, 0, objArrCopyOf, i11, 15);
        f98566e = v0.k(i11 + 15, objArrCopyOf);
        f98567f = v0.t("^_ltv_[A-Z]{3}$", "^_cc[1-5]{1}$");
    }

    public static boolean a(String str) {
        return !f98564c.contains(str);
    }

    public static boolean b(String str, Bundle bundle) {
        if (!f98563b.contains(str)) {
            if (bundle == null) {
                return true;
            }
            r2 r2Var = f98565d;
            int i5 = r2Var.f96009d;
            int i11 = 0;
            while (i11 < i5) {
                boolean zContainsKey = bundle.containsKey((String) r2Var.get(i11));
                i11++;
                if (zContainsKey) {
                }
            }
            return true;
        }
        return false;
    }

    public static boolean c(String str, String str2) {
        if ("_ce1".equals(str2) || "_ce2".equals(str2)) {
            if (str.equals("fcm") || str.equals("frc")) {
                return true;
            }
        } else if ("_ln".equals(str2)) {
            if (str.equals("fcm") || str.equals("fiam")) {
                return true;
            }
        } else if (!f98566e.contains(str2)) {
            r2 r2Var = f98567f;
            int i5 = r2Var.f96009d;
            int i11 = 0;
            while (i11 < i5) {
                boolean zMatches = str2.matches((String) r2Var.get(i11));
                i11++;
                if (zMatches) {
                }
            }
            return true;
        }
        return false;
    }

    public static boolean d(String str, String str2, Bundle bundle) {
        if (!"_cmp".equals(str2)) {
            return true;
        }
        if (a(str) && bundle != null) {
            r2 r2Var = f98565d;
            int i5 = r2Var.f96009d;
            int i11 = 0;
            while (true) {
                if (i11 >= i5) {
                    int iHashCode = str.hashCode();
                    if (iHashCode != 101200) {
                        if (iHashCode != 101230) {
                            if (iHashCode == 3142703 && str.equals("fiam")) {
                                bundle.putString("_cis", "fiam_integration");
                                return true;
                            }
                        } else if (str.equals("fdl")) {
                            bundle.putString("_cis", "fdl_integration");
                            return true;
                        }
                    } else if (str.equals("fcm")) {
                        bundle.putString("_cis", "fcm_integration");
                        return true;
                    }
                } else {
                    boolean zContainsKey = bundle.containsKey((String) r2Var.get(i11));
                    i11++;
                    if (zContainsKey) {
                        break;
                    }
                }
            }
        }
        return false;
    }
}
