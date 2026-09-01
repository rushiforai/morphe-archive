package defpackage;

import android.graphics.ColorSpace;
import android.view.autofill.AutofillId;
import android.window.OnBackInvokedDispatcher;
import java.util.ConcurrentModificationException;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class z10 implements ha4, i70 {
    public final /* synthetic */ int a;

    public /* synthetic */ z10(int i) {
        this.a = i;
    }

    public static /* bridge */ /* synthetic */ ColorSpace b(Object obj) {
        return (ColorSpace) obj;
    }

    public static /* bridge */ /* synthetic */ AutofillId e(Object obj) {
        return (AutofillId) obj;
    }

    public static /* bridge */ /* synthetic */ OnBackInvokedDispatcher f(Object obj) {
        return (OnBackInvokedDispatcher) obj;
    }

    public static /* synthetic */ void g() {
        throw new ConcurrentModificationException();
    }

    public static /* synthetic */ void i(String str) {
        throw new IndexOutOfBoundsException(str);
    }

    public static /* synthetic */ void j(String str, Object obj, Object obj2) {
        throw new IllegalStateException(str + obj + obj2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.ha4
    public void c(boolean z) {
        HashSet hashSet;
        HashSet hashSetJ;
        Object[] objArr = 0;
        switch (this.a) {
            case 5:
                if (z) {
                    tz7 tz7Var = tz7.b;
                    try {
                        if (!ec2.a.contains(tz7.class)) {
                            try {
                                f94.c().execute(new e(11));
                            } catch (Exception unused) {
                                f94 f94Var = f94.a;
                            }
                            break;
                        }
                    } catch (Throwable th) {
                        ec2.a(tz7.class, th);
                        return;
                    }
                }
                break;
            case 6:
                if (z) {
                    wm0 wm0Var = wm0.a;
                    Set set = ec2.a;
                    if (!set.contains(wm0.class)) {
                        try {
                            if (!wm0.b) {
                                wm0 wm0Var2 = wm0.a;
                                if (!set.contains(wm0Var2)) {
                                    try {
                                        xe4 xe4VarK = af4.k(f94.b(), false);
                                        if (xe4VarK != null) {
                                            JSONArray jSONArray = xe4VarK.s;
                                            HashSet hashSet2 = null;
                                            if (!set.contains(wm0Var2)) {
                                                try {
                                                    try {
                                                        hashSet = epe.j(jSONArray);
                                                        if (hashSet == null) {
                                                            hashSet = new HashSet();
                                                        }
                                                    } catch (Exception unused2) {
                                                        hashSet = new HashSet();
                                                    }
                                                    hashSet2 = hashSet;
                                                } catch (Throwable th2) {
                                                    ec2.a(wm0Var2, th2);
                                                }
                                            }
                                            wm0.c = hashSet2;
                                            break;
                                        }
                                    } catch (Throwable th3) {
                                        ec2.a(wm0Var2, th3);
                                    }
                                }
                                wm0.b = !wm0.c.isEmpty();
                            }
                        } catch (Throwable th4) {
                            ec2.a(wm0.class, th4);
                            return;
                        }
                        break;
                    }
                }
                break;
            case 7:
                if (z) {
                    tz5 tz5Var = tz5.a;
                    if (!ec2.a.contains(tz5.class)) {
                        try {
                            if (wk0.d()) {
                                tz5.e.set(true);
                                tz5.d();
                            } else {
                                rz5.J();
                            }
                        } catch (Throwable th5) {
                            ec2.a(tz5.class, th5);
                            return;
                        }
                        break;
                    }
                }
                break;
            case 8:
                if (z) {
                    trc trcVar = trc.a;
                    Set set2 = ec2.a;
                    if (!set2.contains(trc.class)) {
                        try {
                            if (!trc.b) {
                                trc trcVar2 = trc.a;
                                if (!set2.contains(trcVar2)) {
                                    try {
                                        xe4 xe4VarK2 = af4.k(f94.b(), false);
                                        if (xe4VarK2 != null) {
                                            trcVar2.a(xe4VarK2.r);
                                            break;
                                        }
                                    } catch (Throwable th6) {
                                        ec2.a(trcVar2, th6);
                                    }
                                }
                                trc.b = (trc.c.isEmpty() && trc.d.isEmpty()) ? false : true;
                            }
                        } catch (Throwable th7) {
                            ec2.a(trc.class, th7);
                            return;
                        }
                        break;
                    }
                }
                break;
            case 9:
                if (z) {
                    y4a y4aVar = y4a.a;
                    if (!ec2.a.contains(y4a.class)) {
                        try {
                            y4a.b = true;
                            y4a.a.a();
                        } catch (Throwable th8) {
                            ec2.a(y4a.class, th8);
                            return;
                        }
                        break;
                    }
                }
                break;
            case 10:
                if (z) {
                    Set set3 = ec2.a;
                    if (!set3.contains(cd7.class)) {
                        try {
                            cd7 cd7Var = cd7.a;
                            if (!set3.contains(cd7Var)) {
                                try {
                                    xe4 xe4VarK3 = af4.k(f94.b(), false);
                                    if (xe4VarK3 != null) {
                                        cd7.c = xe4VarK3.n;
                                        break;
                                    }
                                } catch (Throwable th9) {
                                    ec2.a(cd7Var, th9);
                                }
                            }
                            if (cd7.c != null) {
                                cd7.b = true;
                            }
                        } catch (Throwable th10) {
                            ec2.a(cd7.class, th10);
                            return;
                        }
                        break;
                    }
                }
                break;
            case 11:
                if (z) {
                    ss0 ss0Var = ss0.a;
                    Set set4 = ec2.a;
                    if (!set4.contains(ss0.class)) {
                        try {
                            ss0 ss0Var2 = ss0.a;
                            if (!set4.contains(ss0Var2)) {
                                try {
                                    xe4 xe4VarK4 = af4.k(f94.b(), false);
                                    if (xe4VarK4 != null && (hashSetJ = epe.j(xe4VarK4.o)) != null) {
                                        ss0.c = hashSetJ;
                                    }
                                } catch (Throwable th11) {
                                    ec2.a(ss0Var2, th11);
                                }
                            }
                            HashSet hashSet3 = ss0.c;
                            if (hashSet3 != null && !hashSet3.isEmpty()) {
                                ss0.b = true;
                            }
                        } catch (Throwable th12) {
                            ec2.a(ss0.class, th12);
                            return;
                        }
                        break;
                    }
                }
                break;
            case 12:
                if (z) {
                    kya kyaVar = kya.a;
                    if (!ec2.a.contains(kya.class)) {
                        try {
                            kya.a.a();
                            if (!kya.c.isEmpty()) {
                                kya.b = true;
                            }
                        } catch (Throwable th13) {
                            ec2.a(kya.class, th13);
                            return;
                        }
                        break;
                    }
                }
                break;
            case 13:
                if (z) {
                    izb izbVar = izb.a;
                    if (!ec2.a.contains(izb.class)) {
                        try {
                            izb.a.a();
                            if (izb.c.isEmpty() && izb.d.isEmpty()) {
                                izb.b = false;
                            } else {
                                izb.b = true;
                            }
                        } catch (Throwable th14) {
                            ec2.a(izb.class, th14);
                            return;
                        }
                        break;
                    }
                }
                break;
            case 14:
                if (z) {
                    int i = t40.p;
                    try {
                        ff5 ff5Var = new ff5(null, f94.b().concat("/cloudbridge_settings"), null, dt5.GET, new s40(objArr == true ? 1 : 0));
                        z46 z46Var = f87.b;
                        z46.s(i87.APP_EVENTS, "t40", " \n\nCreating Graph Request: \n=============\n%s\n\n ", ff5Var);
                        ff5Var.d();
                    } catch (JSONException e) {
                        z46 z46Var2 = f87.b;
                        z46.s(i87.APP_EVENTS, "t40", " \n\nGraph Request Exception: \n=============\n%s\n\n ", kyd.h0(e));
                        return;
                    }
                }
                break;
            case 15:
                if (z) {
                    oe5 oe5Var = oe5.a;
                    if (!ec2.a.contains(oe5.class)) {
                        try {
                            oe5.c = true;
                            oe5.d = new pe5(f94.a());
                            oe5.e = "https://www." + f94.s + "/privacy_sandbox/mobile/register/trigger";
                        } catch (Throwable th15) {
                            ec2.a(oe5.class, th15);
                            return;
                        }
                        break;
                    }
                }
                break;
            case 16:
                if (z) {
                    qx8.a();
                }
                break;
            case 17:
                if (z) {
                    AtomicBoolean atomicBoolean = qe5.a;
                    if (!ec2.a.contains(qe5.class)) {
                        try {
                            qe5.a.set(true);
                        } catch (Throwable th16) {
                            ec2.a(qe5.class, th16);
                            return;
                        }
                        break;
                    }
                }
                break;
            case 18:
                if (z) {
                    wib wibVar = wib.a;
                    if (!ec2.a.contains(wib.class)) {
                        try {
                            wib.b = true;
                            wib.a.b();
                        } catch (Throwable th17) {
                            ec2.a(wib.class, th17);
                            return;
                        }
                        break;
                    }
                }
                break;
            case 19:
                if (z) {
                    k28 k28Var = k28.a;
                    if (!ec2.a.contains(k28.class)) {
                        try {
                            try {
                                f94.c().execute(new e(12));
                            } catch (Exception unused3) {
                                return;
                            }
                        } catch (Throwable th18) {
                            ec2.a(k28.class, th18);
                            return;
                        }
                        break;
                    }
                }
                break;
            default:
                if (z) {
                    g34 g34Var = g34.a;
                    if (!ec2.a.contains(g34.class)) {
                        try {
                            g34.b = true;
                            g34.a.a();
                        } catch (Throwable th19) {
                            ec2.a(g34.class, th19);
                        }
                        break;
                    }
                }
                break;
        }
    }

    @Override // defpackage.i70
    public int d(int i, ip6 ip6Var) {
        return Math.round((1.0f + (ip6Var == ip6.Ltr ? -1.0f : 1.0f)) * (i / 2.0f));
    }
}
