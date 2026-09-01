package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class db8 {
    public final Context a;
    public final ka8 b;
    public final mp c;
    public final Activity d;
    public boolean e;
    public final ul0 f;
    public final boolean g;
    public final w5d h;

    public db8(Context context) {
        Object next;
        context.getClass();
        this.a = context;
        byte b = 0;
        this.b = new ka8(this, new fa8(this, b));
        this.c = new mp(context, b);
        Iterator it2 = szb.K0(context, new ss7(19)).iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            } else {
                next = it2.next();
                if (((Context) next) instanceof Activity) {
                    break;
                }
            }
        }
        this.d = (Activity) next;
        this.f = new ul0(2, this);
        this.g = true;
        tc8 tc8Var = this.b.s;
        tc8Var.a(new cb8(tc8Var));
        this.b.s.a(new x6(this.a));
        this.h = new w5d(new fa8(this, 1));
    }

    public static void d(db8 db8Var, String str) {
        db8Var.getClass();
        ka8 ka8Var = db8Var.b;
        ka8Var.getClass();
        if (ka8Var.c == null) {
            rd6.e(46, "Cannot navigate to ", str, ". Navigation graph has not been set for NavController ", ka8Var);
            return;
        }
        ya8 ya8VarJ = ka8Var.j();
        ua8 ua8VarW = ya8VarJ.w(str, true, ya8VarJ);
        if (ua8VarW == null) {
            ay0.i(lv8.u("Navigation destination that matches route ", str, " cannot be found in the navigation graph "), ka8Var.c);
            return;
        }
        va8 va8Var = ua8VarW.a;
        Bundle bundleF = va8Var.f(ua8VarW.b);
        if (bundleF == null) {
            bundleF = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
        }
        int i = va8.f;
        String str2 = (String) va8Var.b.g;
        Uri uri = Uri.parse(str2 != null ? "android-app://androidx.navigation/".concat(str2) : "");
        uri.getClass();
        Intent intent = new Intent();
        intent.setDataAndType(uri, null);
        intent.setAction(null);
        bundleF.putParcelable("android-support-nav:controller:deepLinkIntent", intent);
        ka8Var.l(va8Var, bundleF, null, null);
    }

    public final int a() {
        m70 m70Var = this.b.f;
        int i = 0;
        if (m70Var != null && m70Var.isEmpty()) {
            return 0;
        }
        Iterator it2 = m70Var.iterator();
        while (it2.hasNext()) {
            if (!(((ba8) it2.next()).b instanceof ya8) && (i = i + 1) < 0) {
                d46.h0();
                throw null;
            }
        }
        return i;
    }

    public final ba8 b() {
        Object next;
        Iterator it2 = bu1.Y0(this.b.f).iterator();
        if (it2.hasNext()) {
            it2.next();
        }
        Iterator it3 = ((j52) szb.F0(it2)).iterator();
        while (true) {
            if (!it3.hasNext()) {
                next = null;
                break;
            }
            next = it3.next();
            if (!(((ba8) next).b instanceof ya8)) {
                break;
            }
        }
        return (ba8) next;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0041  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00a6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void c(int r9, android.os.Bundle r10, defpackage.ob8 r11, defpackage.w6 r12) {
        /*
            r8 = this;
            ka8 r0 = r8.b
            m70 r1 = r0.f
            boolean r1 = r1.isEmpty()
            if (r1 == 0) goto Ld
            ya8 r1 = r0.c
            goto L17
        Ld:
            m70 r1 = r0.f
            java.lang.Object r1 = r1.last()
            ba8 r1 = (defpackage.ba8) r1
            va8 r1 = r1.b
        L17:
            if (r1 == 0) goto Lac
            z98 r2 = r1.p(r9)
            r3 = 0
            r4 = 0
            if (r2 == 0) goto L3d
            if (r11 != 0) goto L25
            ob8 r11 = r2.b
        L25:
            int r5 = r2.a
            android.os.Bundle r6 = r2.c
            if (r6 == 0) goto L3b
            f09[] r7 = new defpackage.f09[r3]
            java.lang.Object[] r7 = java.util.Arrays.copyOf(r7, r3)
            f09[] r7 = (defpackage.f09[]) r7
            android.os.Bundle r7 = defpackage.xz5.E(r7)
            r7.putAll(r6)
            goto L3f
        L3b:
            r7 = r4
            goto L3f
        L3d:
            r5 = r9
            goto L3b
        L3f:
            if (r10 == 0) goto L53
            if (r7 != 0) goto L50
            f09[] r6 = new defpackage.f09[r3]
            java.lang.Object[] r3 = java.util.Arrays.copyOf(r6, r3)
            f09[] r3 = (defpackage.f09[]) r3
            android.os.Bundle r3 = defpackage.xz5.E(r3)
            r7 = r3
        L50:
            r7.putAll(r10)
        L53:
            if (r5 != 0) goto L65
            if (r11 == 0) goto L65
            boolean r10 = r11.d
            int r3 = r11.c
            r6 = -1
            if (r3 != r6) goto L5f
            goto L65
        L5f:
            if (r3 == r6) goto L64
            r0.m(r3, r10)
        L64:
            return
        L65:
            if (r5 == 0) goto La6
            va8 r10 = r0.c(r5, r4)
            if (r10 != 0) goto La2
            int r10 = defpackage.va8.f
            mp r8 = r8.c
            java.lang.String r10 = defpackage.vo7.w(r8, r5)
            java.lang.String r11 = " cannot be found from the current destination "
            if (r2 != 0) goto L7f
            java.lang.String r8 = "Navigation action/destination "
            defpackage.ywb.j(r8, r10, r11, r1)
            return
        L7f:
            java.lang.String r12 = "Navigation destination "
            java.lang.String r0 = " referenced from action "
            java.lang.StringBuilder r10 = defpackage.lv8.u(r12, r10, r0)
            java.lang.String r8 = defpackage.vo7.w(r8, r9)
            r10.append(r8)
            r10.append(r11)
            r10.append(r1)
            java.lang.String r8 = r10.toString()
            java.lang.IllegalArgumentException r9 = new java.lang.IllegalArgumentException
            java.lang.String r8 = r8.toString()
            r9.<init>(r8)
            throw r9
        La2:
            r0.l(r10, r7, r11, r12)
            return
        La6:
            java.lang.String r8 = "Destination id == 0 can only be used in conjunction with a valid navOptions.popUpTo"
            defpackage.ay0.e(r8)
            return
        Lac:
            java.lang.IllegalStateException r9 = new java.lang.IllegalStateException
            java.lang.StringBuilder r10 = new java.lang.StringBuilder
            java.lang.String r11 = "No current destination found. Ensure a navigation graph has been set for NavController "
            r10.<init>(r11)
            r10.append(r8)
            r8 = 46
            r10.append(r8)
            java.lang.String r8 = r10.toString()
            r9.<init>(r8)
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.db8.c(int, android.os.Bundle, ob8, w6):void");
    }

    public final void e() {
        Bundle bundleF;
        Intent intent;
        if (a() != 1) {
            f();
            return;
        }
        Activity activity = this.d;
        Bundle extras = (activity == null || (intent = activity.getIntent()) == null) ? null : intent.getExtras();
        int[] intArray = extras != null ? extras.getIntArray("android-support-nav:controller:deepLinkIds") : null;
        int i = 0;
        ka8 ka8Var = this.b;
        if (intArray == null) {
            va8 va8VarG = ka8Var.g();
            va8VarG.getClass();
            int i2 = va8VarG.b.c;
            for (ya8 ya8Var = va8VarG.c; ya8Var != null; ya8Var = ya8Var.c) {
                ym6 ym6Var = ya8Var.b;
                if (ya8Var.g.c != i2) {
                    Bundle bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
                    if (activity != null && activity.getIntent() != null && activity.getIntent().getData() != null) {
                        Intent intent2 = activity.getIntent();
                        intent2.getClass();
                        bundleE.putParcelable("android-support-nav:controller:deepLinkIntent", intent2);
                        ya8 ya8VarJ = ka8Var.j();
                        Intent intent3 = activity.getIntent();
                        intent3.getClass();
                        ua8 ua8VarV = ya8VarJ.v(new ku3(intent3.getData(), intent3.getAction(), intent3.getType(), 22), ya8VarJ);
                        if ((ua8VarV != null ? ua8VarV.b : null) != null && (bundleF = ua8VarV.a.f(ua8VarV.b)) != null) {
                            bundleE.putAll(bundleF);
                        }
                    }
                    uz5 uz5Var = new uz5(this);
                    int i3 = ym6Var.c;
                    ArrayList arrayList = (ArrayList) uz5Var.e;
                    arrayList.clear();
                    arrayList.add(new ra8(i3, null));
                    if (((ya8) uz5Var.d) != null) {
                        uz5Var.o();
                    }
                    uz5Var.f = bundleE;
                    ((Intent) uz5Var.c).putExtra("android-support-nav:controller:deepLinkExtras", bundleE);
                    uz5Var.g().e();
                    if (activity != null) {
                        activity.finish();
                        return;
                    }
                    return;
                }
                i2 = ym6Var.c;
            }
            return;
        }
        if (this.e) {
            activity.getClass();
            Intent intent4 = activity.getIntent();
            Bundle extras2 = intent4.getExtras();
            extras2.getClass();
            int[] intArray2 = extras2.getIntArray("android-support-nav:controller:deepLinkIds");
            intArray2.getClass();
            ArrayList arrayList2 = new ArrayList(intArray2.length);
            for (int i4 : intArray2) {
                arrayList2.add(Integer.valueOf(i4));
            }
            ArrayList parcelableArrayList = extras2.getParcelableArrayList("android-support-nav:controller:deepLinkArgs");
            if (arrayList2.size() < 2) {
                return;
            }
            int iIntValue = ((Number) bu1.U0(arrayList2)).intValue();
            if (parcelableArrayList != null) {
            }
            va8 va8VarD = ka8.d(iIntValue, ka8Var.h(), null, false);
            if (va8VarD instanceof ya8) {
                int i5 = ya8.h;
                iIntValue = ((va8) szb.M0(szb.K0((ya8) va8VarD, new ss7(27)))).b.c;
            }
            va8 va8VarG2 = ka8Var.g();
            if (va8VarG2 == null || iIntValue != va8VarG2.b.c) {
                return;
            }
            uz5 uz5Var2 = new uz5(this);
            Bundle bundleE2 = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
            bundleE2.putParcelable("android-support-nav:controller:deepLinkIntent", intent4);
            Bundle bundle = extras2.getBundle("android-support-nav:controller:deepLinkExtras");
            if (bundle != null) {
                bundleE2.putAll(bundle);
            }
            uz5Var2.f = bundleE2;
            ((Intent) uz5Var2.c).putExtra("android-support-nav:controller:deepLinkExtras", bundleE2);
            for (Object obj : arrayList2) {
                int i6 = i + 1;
                if (i < 0) {
                    d46.i0();
                    throw null;
                }
                uz5Var2.a(((Number) obj).intValue(), parcelableArrayList != null ? (Bundle) parcelableArrayList.get(i) : null);
                i = i6;
            }
            uz5Var2.g().e();
            activity.finish();
        }
    }

    public final boolean f() {
        ka8 ka8Var = this.b;
        if (ka8Var.f.isEmpty()) {
            return false;
        }
        va8 va8VarG = ka8Var.g();
        va8VarG.getClass();
        return ka8Var.m(va8VarG.b.c, true);
    }

    public final void g(Bundle bundle) {
        Bundle bundle2;
        if (bundle != null) {
            bundle.setClassLoader(this.a.getClassLoader());
        }
        ka8 ka8Var = this.b;
        LinkedHashMap linkedHashMap = ka8Var.m;
        if (bundle != null) {
            if (bundle.containsKey("android-support-nav:controller:navigatorState")) {
                bundle2 = bundle.getBundle("android-support-nav:controller:navigatorState");
                if (bundle2 == null) {
                    wo7.q("android-support-nav:controller:navigatorState");
                    throw null;
                }
            } else {
                bundle2 = null;
            }
            ka8Var.d = bundle2;
            ka8Var.e = bundle.containsKey("android-support-nav:controller:backStack") ? (Bundle[]) vo7.A("android-support-nav:controller:backStack", bundle).toArray(new Bundle[0]) : null;
            linkedHashMap.clear();
            if (bundle.containsKey("android-support-nav:controller:backStackDestIds") && bundle.containsKey("android-support-nav:controller:backStackIds")) {
                int[] intArray = bundle.getIntArray("android-support-nav:controller:backStackDestIds");
                if (intArray == null) {
                    wo7.q("android-support-nav:controller:backStackDestIds");
                    throw null;
                }
                ArrayList<String> stringArrayList = bundle.getStringArrayList("android-support-nav:controller:backStackIds");
                if (stringArrayList == null) {
                    wo7.q("android-support-nav:controller:backStackIds");
                    throw null;
                }
                int length = intArray.length;
                int i = 0;
                int i2 = 0;
                while (i < length) {
                    int i3 = i2 + 1;
                    ka8Var.l.put(Integer.valueOf(intArray[i]), !g76.L(stringArrayList.get(i2), "") ? stringArrayList.get(i2) : null);
                    i++;
                    i2 = i3;
                }
            }
            if (bundle.containsKey("android-support-nav:controller:backStackStates")) {
                ArrayList<String> stringArrayList2 = bundle.getStringArrayList("android-support-nav:controller:backStackStates");
                if (stringArrayList2 == null) {
                    wo7.q("android-support-nav:controller:backStackStates");
                    throw null;
                }
                for (String str : stringArrayList2) {
                    if (bundle.containsKey("android-support-nav:controller:backStackStates:" + str)) {
                        ArrayList arrayListA = vo7.A("android-support-nav:controller:backStackStates:" + str, bundle);
                        m70 m70Var = new m70(arrayListA.size());
                        Iterator it2 = arrayListA.iterator();
                        while (it2.hasNext()) {
                            m70Var.addLast(new ea8((Bundle) it2.next()));
                        }
                        linkedHashMap.put(str, m70Var);
                    }
                }
            }
        }
        if (bundle != null) {
            boolean z = bundle.getBoolean("android-support-nav:controller:deepLinkHandled", false);
            Boolean boolValueOf = (z || !bundle.getBoolean("android-support-nav:controller:deepLinkHandled", true)) ? Boolean.valueOf(z) : null;
            this.e = boolValueOf != null ? boolValueOf.booleanValue() : false;
        }
    }

    public final Bundle h() {
        Bundle bundleE;
        ka8 ka8Var = this.b;
        LinkedHashMap linkedHashMap = ka8Var.m;
        m70<ba8> m70Var = ka8Var.f;
        LinkedHashMap linkedHashMap2 = ka8Var.l;
        ArrayList arrayList = new ArrayList();
        Bundle bundleE2 = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
        for (Map.Entry entry : ei7.W(ka8Var.s.a).entrySet()) {
            String str = (String) entry.getKey();
            Bundle bundleH = ((sc8) entry.getValue()).h();
            if (bundleH != null) {
                arrayList.add(str);
                str.getClass();
                bundleE2.putBundle(str, bundleH);
            }
        }
        if (arrayList.isEmpty()) {
            bundleE = null;
        } else {
            bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
            ep7.z(bundleE2, "android-support-nav:controller:navigatorState:names", arrayList);
            bundleE.putBundle("android-support-nav:controller:navigatorState", bundleE2);
        }
        if (!m70Var.isEmpty()) {
            if (bundleE == null) {
                bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
            }
            ArrayList<? extends Parcelable> arrayList2 = new ArrayList<>();
            for (ba8 ba8Var : m70Var) {
                ba8Var.getClass();
                int i = ba8Var.b.b.c;
                String str2 = ba8Var.f;
                da8 da8Var = ba8Var.h;
                Bundle bundleA = da8Var.a();
                Bundle bundleE3 = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
                da8Var.h.b(bundleE3);
                Bundle bundleE4 = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
                bundleE4.putString("nav-entry-state:id", str2);
                bundleE4.putInt("nav-entry-state:destination-id", i);
                if (bundleA == null) {
                    bundleA = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
                }
                bundleE4.putBundle("nav-entry-state:args", bundleA);
                bundleE4.putBundle("nav-entry-state:saved-state", bundleE3);
                arrayList2.add(bundleE4);
            }
            bundleE.putParcelableArrayList("android-support-nav:controller:backStack", arrayList2);
        }
        if (!linkedHashMap2.isEmpty()) {
            if (bundleE == null) {
                bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
            }
            int[] iArr = new int[linkedHashMap2.size()];
            ArrayList arrayList3 = new ArrayList();
            int i2 = 0;
            for (Map.Entry entry2 : linkedHashMap2.entrySet()) {
                int iIntValue = ((Number) entry2.getKey()).intValue();
                String str3 = (String) entry2.getValue();
                int i3 = i2 + 1;
                iArr[i2] = iIntValue;
                if (str3 == null) {
                    str3 = "";
                }
                arrayList3.add(str3);
                i2 = i3;
            }
            bundleE.putIntArray("android-support-nav:controller:backStackDestIds", iArr);
            ep7.z(bundleE, "android-support-nav:controller:backStackIds", arrayList3);
        }
        if (!linkedHashMap.isEmpty()) {
            if (bundleE == null) {
                bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
            }
            ArrayList arrayList4 = new ArrayList();
            for (Map.Entry entry3 : linkedHashMap.entrySet()) {
                String str4 = (String) entry3.getKey();
                m70 m70Var2 = (m70) entry3.getValue();
                arrayList4.add(str4);
                ArrayList<? extends Parcelable> arrayList5 = new ArrayList<>();
                Iterator it2 = m70Var2.iterator();
                while (it2.hasNext()) {
                    opg opgVar = ((ea8) it2.next()).a;
                    Bundle bundleE5 = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
                    bundleE5.putString("nav-entry-state:id", (String) opgVar.b);
                    bundleE5.putInt("nav-entry-state:destination-id", opgVar.a);
                    Bundle bundleE6 = (Bundle) opgVar.c;
                    if (bundleE6 == null) {
                        bundleE6 = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
                    }
                    bundleE5.putBundle("nav-entry-state:args", bundleE6);
                    bundleE5.putBundle("nav-entry-state:saved-state", (Bundle) opgVar.d);
                    arrayList5.add(bundleE5);
                }
                bundleE.putParcelableArrayList("android-support-nav:controller:backStackStates:" + str4, arrayList5);
            }
            ep7.z(bundleE, "android-support-nav:controller:backStackStates", arrayList4);
        }
        if (this.e) {
            if (bundleE == null) {
                bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
            }
            bundleE.putBoolean("android-support-nav:controller:deepLinkHandled", this.e);
        }
        return bundleE;
    }

    public final void i(iy6 iy6Var) {
        wx6 lifecycle;
        iy6Var.getClass();
        ka8 ka8Var = this.b;
        di4 di4Var = ka8Var.r;
        if (iy6Var.equals(ka8Var.n)) {
            return;
        }
        iy6 iy6Var2 = ka8Var.n;
        if (iy6Var2 != null && (lifecycle = iy6Var2.getLifecycle()) != null) {
            lifecycle.b(di4Var);
        }
        ka8Var.n = iy6Var;
        iy6Var.getLifecycle().a(di4Var);
    }

    public final void j(vue vueVar) {
        vueVar.getClass();
        ka8 ka8Var = this.b;
        ka8Var.getClass();
        if (g76.L(ka8Var.o, to7.m(vueVar))) {
            return;
        }
        if (ka8Var.f.isEmpty()) {
            ka8Var.o = to7.m(vueVar);
        } else {
            ygf.f("ViewModelStore should be set before setGraph call");
        }
    }
}
