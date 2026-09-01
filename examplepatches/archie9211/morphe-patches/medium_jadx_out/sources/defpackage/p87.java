package defpackage;

import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.facebook.CustomTabMainActivity;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ScheduledExecutorService;
import org.json.JSONObject;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class p87 implements Parcelable {
    public static final Parcelable.Creator<p87> CREATOR = new h74(19);
    public ba7[] a;
    public int b;
    public v97 c;
    public f70 d;
    public my6 e;
    public boolean f;
    public m87 g;
    public Map h;
    public LinkedHashMap i;
    public w97 j;
    public int k;
    public int l;

    public final void a(String str, String str2, boolean z) {
        Map map = this.h;
        if (map == null) {
            map = new HashMap();
        }
        if (this.h == null) {
            this.h = map;
        }
        if (map.containsKey(str) && z) {
            str2 = ((String) map.get(str)) + ',' + str2;
        }
        map.put(str, str2);
    }

    public final boolean b() {
        if (this.f) {
            return true;
        }
        m15 m15VarE = e();
        if ((m15VarE != null ? m15VarE.checkCallingOrSelfPermission("android.permission.INTERNET") : -1) == 0) {
            this.f = true;
            return true;
        }
        m15 m15VarE2 = e();
        String string = m15VarE2 != null ? m15VarE2.getString(R.string.com_facebook_internet_permission_error_title) : null;
        String string2 = m15VarE2 != null ? m15VarE2.getString(R.string.com_facebook_internet_permission_error_message) : null;
        m87 m87Var = this.g;
        ArrayList arrayList = new ArrayList();
        if (string != null) {
            arrayList.add(string);
        }
        if (string2 != null) {
            arrayList.add(string2);
        }
        c(new o87(m87Var, n87.ERROR, null, TextUtils.join(": ", arrayList), null));
        return false;
    }

    public final void c(o87 o87Var) {
        p87 p87Var;
        o87Var.getClass();
        n87 n87Var = o87Var.a;
        ba7 ba7VarF = f();
        if (ba7VarF != null) {
            p87Var = this;
            p87Var.h(ba7VarF.e(), n87Var.getLoggingValue(), o87Var.d, o87Var.e, ba7VarF.a);
        } else {
            p87Var = this;
        }
        Map map = p87Var.h;
        if (map != null) {
            o87Var.g = map;
        }
        LinkedHashMap linkedHashMap = p87Var.i;
        if (linkedHashMap != null) {
            o87Var.h = linkedHashMap;
        }
        p87Var.a = null;
        p87Var.b = -1;
        p87Var.g = null;
        p87Var.h = null;
        p87Var.k = 0;
        p87Var.l = 0;
        f70 f70Var = p87Var.d;
        if (f70Var != null) {
            v97 v97Var = (v97) f70Var.b;
            v97Var.n0 = null;
            int i = n87Var == n87.CANCEL ? 0 : -1;
            Bundle bundle = new Bundle();
            bundle.putParcelable("com.facebook.LoginFragment:Result", o87Var);
            Intent intent = new Intent();
            intent.putExtras(bundle);
            m15 m15VarG = v97Var.g();
            if (!v97Var.t() || m15VarG == null) {
                return;
            }
            m15VarG.setResult(i, intent);
            m15VarG.finish();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0034 A[Catch: Exception -> 0x0031, TryCatch #0 {Exception -> 0x0031, blocks: (B:8:0x0017, B:10:0x0021, B:14:0x004d, B:13:0x0034), top: B:23:0x0017 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void d(defpackage.o87 r11) {
        /*
            r10 = this;
            r11.getClass()
            w3 r0 = r11.b
            if (r0 == 0) goto L77
            java.util.Date r1 = defpackage.w3.l
            boolean r1 = defpackage.wgf.B()
            if (r1 == 0) goto L77
            w3 r1 = defpackage.wgf.r()
            java.lang.String r2 = ": "
            if (r1 == 0) goto L34
            java.lang.String r1 = r1.i     // Catch: java.lang.Exception -> L31
            java.lang.String r0 = r0.i     // Catch: java.lang.Exception -> L31
            boolean r0 = defpackage.g76.L(r1, r0)     // Catch: java.lang.Exception -> L31
            if (r0 == 0) goto L34
            m87 r4 = r10.g     // Catch: java.lang.Exception -> L31
            w3 r6 = r11.b     // Catch: java.lang.Exception -> L31
            ce0 r7 = r11.c     // Catch: java.lang.Exception -> L31
            o87 r3 = new o87     // Catch: java.lang.Exception -> L31
            n87 r5 = defpackage.n87.SUCCESS     // Catch: java.lang.Exception -> L31
            r8 = 0
            r9 = 0
            r3.<init>(r4, r5, r6, r7, r8, r9)     // Catch: java.lang.Exception -> L31
            goto L4d
        L31:
            r0 = move-exception
            r11 = r0
            goto L51
        L34:
            m87 r4 = r10.g     // Catch: java.lang.Exception -> L31
            java.lang.String r11 = "User logged in as different Facebook user."
            java.util.ArrayList r0 = new java.util.ArrayList     // Catch: java.lang.Exception -> L31
            r0.<init>()     // Catch: java.lang.Exception -> L31
            r0.add(r11)     // Catch: java.lang.Exception -> L31
            java.lang.String r7 = android.text.TextUtils.join(r2, r0)     // Catch: java.lang.Exception -> L31
            o87 r3 = new o87     // Catch: java.lang.Exception -> L31
            n87 r5 = defpackage.n87.ERROR     // Catch: java.lang.Exception -> L31
            r6 = 0
            r8 = 0
            r3.<init>(r4, r5, r6, r7, r8)     // Catch: java.lang.Exception -> L31
        L4d:
            r10.c(r3)     // Catch: java.lang.Exception -> L31
            return
        L51:
            m87 r4 = r10.g
            java.lang.String r11 = r11.getMessage()
            java.util.ArrayList r0 = new java.util.ArrayList
            r0.<init>()
            java.lang.String r1 = "Caught exception"
            r0.add(r1)
            if (r11 == 0) goto L66
            r0.add(r11)
        L66:
            java.lang.String r7 = android.text.TextUtils.join(r2, r0)
            o87 r3 = new o87
            n87 r5 = defpackage.n87.ERROR
            r6 = 0
            r8 = 0
            r3.<init>(r4, r5, r6, r7, r8)
            r10.c(r3)
            return
        L77:
            r10.c(r11)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p87.d(o87):void");
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final m15 e() {
        v97 v97Var = this.c;
        if (v97Var != null) {
            return v97Var.g();
        }
        return null;
    }

    public final ba7 f() {
        ba7[] ba7VarArr;
        int i = this.b;
        if (i < 0 || (ba7VarArr = this.a) == null) {
            return null;
        }
        return ba7VarArr[i];
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x001b  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0023  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.w97 g() {
        /*
            r4 = this;
            w97 r0 = r4.j
            if (r0 == 0) goto L23
            java.util.Set r1 = defpackage.ec2.a
            boolean r1 = r1.contains(r0)
            r2 = 0
            if (r1 == 0) goto Lf
        Ld:
            r1 = r2
            goto L17
        Lf:
            java.lang.String r1 = r0.a     // Catch: java.lang.Throwable -> L12
            goto L17
        L12:
            r1 = move-exception
            defpackage.ec2.a(r0, r1)
            goto Ld
        L17:
            m87 r3 = r4.g
            if (r3 == 0) goto L1d
            java.lang.String r2 = r3.d
        L1d:
            boolean r1 = defpackage.g76.L(r1, r2)
            if (r1 != 0) goto L41
        L23:
            w97 r0 = new w97
            m15 r1 = r4.e()
            if (r1 == 0) goto L2c
            goto L30
        L2c:
            android.content.Context r1 = defpackage.f94.a()
        L30:
            m87 r2 = r4.g
            if (r2 == 0) goto L38
            java.lang.String r2 = r2.d
            if (r2 != 0) goto L3c
        L38:
            java.lang.String r2 = defpackage.f94.b()
        L3c:
            r0.<init>(r1, r2)
            r4.j = r0
        L41:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p87.g():w97");
    }

    public final void h(String str, String str2, String str3, String str4, Map map) {
        m87 m87Var = this.g;
        if (m87Var == null) {
            g().a("fb_mobile_login_method_complete", str);
            return;
        }
        w97 w97VarG = g();
        String str5 = m87Var.g;
        String str6 = m87Var.o ? "foa_mobile_login_method_complete" : "fb_mobile_login_method_complete";
        if (ec2.a.contains(w97VarG)) {
            return;
        }
        try {
            ScheduledExecutorService scheduledExecutorService = w97.d;
            Bundle bundleW0 = ht2.w0(str5);
            if (str2 != null) {
                bundleW0.putString("2_result", str2);
            }
            if (str3 != null) {
                bundleW0.putString("5_error_message", str3);
            }
            if (str4 != null) {
                bundleW0.putString("4_error_code", str4);
            }
            if (map != null && !map.isEmpty()) {
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                for (Map.Entry entry : map.entrySet()) {
                    if (((String) entry.getKey()) != null) {
                        linkedHashMap.put(entry.getKey(), entry.getValue());
                    }
                }
                bundleW0.putString("6_extras", new JSONObject(linkedHashMap).toString());
            }
            bundleW0.putString("3_method", str);
            w97VarG.b.s(str6, bundleW0);
        } catch (Throwable th) {
            ec2.a(w97VarG, th);
        }
    }

    public final void i(int i, int i2, Intent intent) {
        this.k++;
        if (this.g != null) {
            if (intent != null) {
                int i3 = CustomTabMainActivity.c;
                if (intent.getBooleanExtra("CustomTabMainActivity.no_activity_exception", false)) {
                    j();
                    return;
                }
            }
            ba7 ba7VarF = f();
            if (ba7VarF != null) {
                if ((ba7VarF instanceof dk6) && intent == null && this.k < this.l) {
                    return;
                }
                ba7VarF.h(i, i2, intent);
            }
        }
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeParcelableArray(this.a, i);
        parcel.writeInt(this.b);
        parcel.writeParcelable(this.g, i);
        epe.e0(parcel, this.h);
        epe.e0(parcel, this.i);
    }

    public final void j() {
        p87 p87Var;
        String str;
        String str2;
        ba7 ba7VarF = f();
        if (ba7VarF != null) {
            p87Var = this;
            p87Var.h(ba7VarF.e(), "skipped", null, null, ba7VarF.a);
        } else {
            p87Var = this;
        }
        ba7[] ba7VarArr = p87Var.a;
        while (ba7VarArr != null) {
            int i = p87Var.b;
            if (i >= ba7VarArr.length - 1) {
                break;
            }
            p87Var.b = i + 1;
            ba7 ba7VarF2 = p87Var.f();
            if (ba7VarF2 != null) {
                if ((ba7VarF2 instanceof e2f) && !p87Var.b()) {
                    p87Var.a(gYpYQDQkhfs.pgWQGRMmrBrlY, "1", false);
                } else {
                    m87 m87Var = p87Var.g;
                    if (m87Var == null) {
                        continue;
                    } else {
                        String str3 = m87Var.g;
                        int iK = ba7VarF2.k(m87Var);
                        p87Var.k = 0;
                        if (iK > 0) {
                            w97 w97VarG = p87Var.g();
                            String strE = ba7VarF2.e();
                            if (m87Var.o) {
                                str2 = "foa_mobile_login_method_start";
                            } else {
                                str2 = "fb_mobile_login_method_start";
                            }
                            if (!ec2.a.contains(w97VarG)) {
                                try {
                                    ScheduledExecutorService scheduledExecutorService = w97.d;
                                    Bundle bundleW0 = ht2.w0(str3);
                                    bundleW0.putString("3_method", strE);
                                    w97VarG.b.s(str2, bundleW0);
                                } catch (Throwable th) {
                                    ec2.a(w97VarG, th);
                                }
                            }
                            p87Var.l = iK;
                        } else {
                            w97 w97VarG2 = p87Var.g();
                            String strE2 = ba7VarF2.e();
                            if (m87Var.o) {
                                str = "foa_mobile_login_method_not_tried";
                            } else {
                                str = "fb_mobile_login_method_not_tried";
                            }
                            if (!ec2.a.contains(w97VarG2)) {
                                try {
                                    ScheduledExecutorService scheduledExecutorService2 = w97.d;
                                    Bundle bundleW02 = ht2.w0(str3);
                                    bundleW02.putString("3_method", strE2);
                                    w97VarG2.b.s(str, bundleW02);
                                } catch (Throwable th2) {
                                    ec2.a(w97VarG2, th2);
                                }
                            }
                            p87Var.a("not_tried", ba7VarF2.e(), true);
                        }
                        if (iK > 0) {
                            return;
                        }
                    }
                }
            }
        }
        m87 m87Var2 = p87Var.g;
        if (m87Var2 != null) {
            ArrayList arrayList = new ArrayList();
            arrayList.add("Login attempt failed.");
            p87Var.c(new o87(m87Var2, n87.ERROR, null, TextUtils.join(": ", arrayList), null));
        }
    }
}
