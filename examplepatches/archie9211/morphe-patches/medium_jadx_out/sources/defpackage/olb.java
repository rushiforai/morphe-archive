package defpackage;

import android.graphics.Region;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import androidx.recyclerview.widget.RecyclerView;
import com.android.installreferrer.api.InstallReferrerClient;
import com.android.installreferrer.api.InstallReferrerStateListener;
import com.android.installreferrer.api.ReferrerDetails;
import com.google.gson.JsonIOException;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.common.post.text.ParagraphEditTextLayout;
import j$.util.DesugarCollections;
import j$.util.Objects;
import j$.util.Optional;
import java.io.File;
import java.io.FileInputStream;
import java.lang.reflect.Type;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class olb implements e82, ln0, x31, gd9, i19, y92, InstallReferrerStateListener, um2 {
    public static olb c;
    public static final plb d = new plb(0, false, false, 0, 0);
    public static final c75 e = new c75(1);
    public final /* synthetic */ int a;
    public Object b;

    public olb(int i) {
        zy7 zy7Var;
        this.a = i;
        switch (i) {
            case 5:
                this.b = new AtomicInteger(0);
                break;
            case 10:
                this.b = vv2.j(szd.b);
                break;
            case 21:
                this.b = new m70(500);
                break;
            case 22:
                this.b = new ArrayList();
                break;
            case 29:
                this.b = new Region();
                break;
            default:
                try {
                    zy7Var = (zy7) Class.forName("com.google.protobuf.DescriptorMessageInfoFactory").getDeclaredMethod("getInstance", null).invoke(null, null);
                } catch (Exception unused) {
                    zy7Var = e;
                }
                zy7[] zy7VarArr = {c75.b, zy7Var};
                xg7 xg7Var = new xg7();
                xg7Var.a = zy7VarArr;
                Charset charset = v56.a;
                this.b = xg7Var;
                break;
        }
    }

    public static synchronized olb k() {
        olb olbVar;
        olbVar = c;
        if (olbVar == null) {
            olbVar = new olb(0, false);
            c = olbVar;
        }
        return olbVar;
    }

    public static olb p(boolean z, int i, int i2, int i3, int i4) {
        return new olb(2, AccessibilityNodeInfo.CollectionItemInfo.obtain(i, i2, i3, i4, false, z));
    }

    @Override // defpackage.gd9
    public long C(o46 o46Var, long j, ip6 ip6Var, long j2) {
        long j3 = ((k46) ((m45) this.b).invoke()).a;
        int iA = xz5.A(o46Var.a + ((int) (j3 >> 32)), (int) (j2 >> 32), (int) (j >> 32), ip6Var == ip6.Ltr);
        return (((long) xz5.A(o46Var.b + ((int) (j3 & 4294967295L)), (int) (j2 & 4294967295L), (int) (j & 4294967295L), true)) & 4294967295L) | (((long) iA) << 32);
    }

    @Override // defpackage.i19
    public void a(int i, String str) {
        ((EditPostBodyView) this.b).getListener().a(i, str);
    }

    @Override // defpackage.ln0
    public void b(h42 h42Var) {
        boolean z = h42Var.b == 0;
        mn0 mn0Var = (mn0) this.b;
        if (z) {
            mn0Var.g(null, ((wd5) mn0Var).y);
            return;
        }
        qlb qlbVar = mn0Var.o;
        if (qlbVar != null) {
            ((de5) qlbVar.a).a(h42Var);
        }
    }

    @Override // defpackage.i19
    public void c(ParagraphEditTextLayout paragraphEditTextLayout) {
        EditPostBodyView editPostBodyView = (EditPostBodyView) this.b;
        int i = EditPostBodyView.q;
        editPostBodyView.n(paragraphEditTextLayout);
    }

    public List d(List list) {
        list.getClass();
        m70 m70Var = (m70) this.b;
        m70Var.addAll(list);
        if (m70Var.c <= 500) {
            return ey3.a;
        }
        ArrayList arrayList = new ArrayList(m70Var.c - 500);
        while (m70Var.c > 500) {
            arrayList.add(m70Var.removeFirst());
        }
        return arrayList;
    }

    public void e(d8 d8Var) {
        RecyclerView recyclerView = (RecyclerView) this.b;
        int i = d8Var.a;
        if (i == 1) {
            recyclerView.n.Z(d8Var.b, d8Var.d);
            return;
        }
        if (i == 2) {
            recyclerView.n.c0(d8Var.b, d8Var.d);
        } else if (i == 4) {
            recyclerView.n.d0(d8Var.b, d8Var.d);
        } else {
            if (i != 8) {
                return;
            }
            recyclerView.n.b0(d8Var.b, d8Var.d);
        }
    }

    public void f(byte b) {
        ((Parcel) this.b).writeByte(b);
    }

    public void g(float f) {
        ((Parcel) this.b).writeFloat(f);
    }

    public void h(long j) {
        long jB = qkd.b(j);
        byte b = 0;
        if (!rkd.a(jB, 0L)) {
            if (rkd.a(jB, 4294967296L)) {
                b = 1;
            } else if (rkd.a(jB, 8589934592L)) {
                b = 2;
            }
        }
        f(b);
        if (rkd.a(qkd.b(j), 0L)) {
            return;
        }
        g(qkd.c(j));
    }

    public pr0 i(int i) {
        RecyclerView recyclerView = (RecyclerView) this.b;
        int iD = recyclerView.f.D();
        int i2 = 0;
        pr0 pr0Var = null;
        while (true) {
            if (i2 >= iD) {
                break;
            }
            pr0 pr0VarK = RecyclerView.K(recyclerView.f.C(i2));
            if (pr0VarK != null && !pr0VarK.g() && pr0VarK.c == i) {
                if (!((ArrayList) recyclerView.f.b).contains(pr0VarK.a)) {
                    pr0Var = pr0VarK;
                    break;
                }
                pr0Var = pr0VarK;
            }
            i2++;
        }
        if (pr0Var != null) {
            if (!((ArrayList) recyclerView.f.b).contains(pr0Var.a)) {
                return pr0Var;
            }
            if (RecyclerView.Q0) {
                Log.d("RecyclerView", "assuming view holder cannot be find because it is hidden");
            }
        }
        return null;
    }

    public rpc j() {
        return (rpc) ((xpc) this.b).getValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.io.Serializable l(defpackage.p92 r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.jjb
            if (r0 == 0) goto L13
            r0 = r7
            jjb r0 = (defpackage.jjb) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            jjb r0 = new jjb
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2a
            defpackage.br7.v(r7)     // Catch: java.lang.Throwable -> L28
            goto L5e
        L28:
            r6 = move-exception
            goto L61
        L2a:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L31:
            defpackage.br7.v(r7)
            uld r7 = defpackage.wld.a
            java.lang.String r2 = "Retrieve Push Notification Token"
            java.lang.Object[] r5 = new java.lang.Object[r4]
            r7.a(r2, r5)
            java.lang.Object r6 = r6.b     // Catch: java.lang.Throwable -> L28
            com.google.firebase.messaging.FirebaseMessaging r6 = (com.google.firebase.messaging.FirebaseMessaging) r6     // Catch: java.lang.Throwable -> L28
            wfd r7 = new wfd     // Catch: java.lang.Throwable -> L28
            r7.<init>()     // Catch: java.lang.Throwable -> L28
            java.util.concurrent.ScheduledThreadPoolExecutor r2 = r6.f     // Catch: java.lang.Throwable -> L28
            mk4 r5 = new mk4     // Catch: java.lang.Throwable -> L28
            r5.<init>(r6, r7, r4)     // Catch: java.lang.Throwable -> L28
            r2.execute(r5)     // Catch: java.lang.Throwable -> L28
            jrg r6 = r7.a     // Catch: java.lang.Throwable -> L28
            r6.getClass()     // Catch: java.lang.Throwable -> L28
            r0.d = r3     // Catch: java.lang.Throwable -> L28
            java.lang.Object r7 = defpackage.aq7.j(r6, r0)     // Catch: java.lang.Throwable -> L28
            if (r7 != r1) goto L5e
            return r1
        L5e:
            java.lang.String r7 = (java.lang.String) r7     // Catch: java.lang.Throwable -> L28
            goto L66
        L61:
            ajb r7 = new ajb
            r7.<init>(r6)
        L66:
            boolean r6 = r7 instanceof defpackage.ajb
            if (r6 != 0) goto L7a
            r6 = r7
            java.lang.String r6 = (java.lang.String) r6
            uld r0 = defpackage.wld.a
            java.lang.String r1 = "Push Notification Token retrieved: "
            java.lang.String r6 = defpackage.ka1.r(r1, r6)
            java.lang.Object[] r1 = new java.lang.Object[r4]
            r0.a(r6, r1)
        L7a:
            java.lang.Throwable r6 = defpackage.bjb.b(r7)
            if (r6 == 0) goto L89
            uld r0 = defpackage.wld.a
            java.lang.String r1 = "Failed to retrieve Push Notification Token"
            java.lang.Object[] r2 = new java.lang.Object[r4]
            r0.e(r6, r1, r2)
        L89:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.olb.l(p92):java.io.Serializable");
    }

    @Override // defpackage.um2
    public Iterable m(Object obj) {
        oe6 oe6Var = (oe6) this.b;
        Collection collectionB = ((y28) obj).n().b();
        collectionB.getClass();
        ArrayList arrayList = new ArrayList();
        Iterator it2 = collectionB.iterator();
        while (it2.hasNext()) {
            co1 co1VarA = ((mn6) it2.next()).j0().a();
            y28 y28VarA = null;
            co1 co1VarA2 = co1VarA != null ? co1VarA.x0() : null;
            y28 y28Var = co1VarA2 instanceof y28 ? (y28) co1VarA2 : null;
            if (y28Var != null && (y28VarA = oe6Var.a(y28Var)) == null) {
                y28VarA = y28Var;
            }
            if (y28VarA != null) {
                arrayList.add(y28VarA);
            }
        }
        return arrayList;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object n(defpackage.yd4 r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.g95
            if (r0 == 0) goto L13
            r0 = r6
            g95 r0 = (defpackage.g95) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            g95 r0 = new g95
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            defpackage.br7.v(r6)
            bjb r6 = (defpackage.bjb) r6
            java.lang.Object r4 = r6.a
            return r4
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r6)
            java.lang.Object r4 = r4.b
            ble r4 = (defpackage.ble) r4
            r0.d = r3
            java.lang.Object r4 = r4.w(r5, r0)
            if (r4 != r1) goto L42
            return r1
        L42:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.olb.n(yd4, p92):java.lang.Object");
    }

    public void o(int i, int i2, Object obj) {
        int i3;
        int i4;
        RecyclerView recyclerView = (RecyclerView) this.b;
        int iD = recyclerView.f.D();
        int i5 = i2 + i;
        for (int i6 = 0; i6 < iD; i6++) {
            View viewC = recyclerView.f.C(i6);
            pr0 pr0VarK = RecyclerView.K(viewC);
            if (pr0VarK != null && !pr0VarK.n() && (i4 = pr0VarK.c) >= i && i4 < i5) {
                pr0VarK.a(2);
                if (obj == null) {
                    pr0VarK.a(1024);
                } else if ((1024 & pr0VarK.i) == 0) {
                    if (pr0VarK.j == null) {
                        ArrayList arrayList = new ArrayList();
                        pr0VarK.j = arrayList;
                        pr0VarK.k = DesugarCollections.unmodifiableList(arrayList);
                    }
                    pr0VarK.j.add(obj);
                }
                ((txa) viewC.getLayoutParams()).c = true;
            }
        }
        yxa yxaVar = recyclerView.c;
        ArrayList arrayList2 = yxaVar.c;
        for (int size = arrayList2.size() - 1; size >= 0; size--) {
            pr0 pr0Var = (pr0) arrayList2.get(size);
            if (pr0Var != null && (i3 = pr0Var.c) >= i && i3 < i5) {
                pr0Var.a(2);
                yxaVar.h(size);
            }
        }
        recyclerView.y0 = true;
    }

    @Override // com.android.installreferrer.api.InstallReferrerStateListener
    public void onInstallReferrerSetupFinished(int i) {
        InstallReferrerClient installReferrerClient = (InstallReferrerClient) this.b;
        Set set = ec2.a;
        if (set.contains(this)) {
            return;
        }
        try {
            if (i == 0) {
                try {
                    ReferrerDetails installReferrer = installReferrerClient.getInstallReferrer();
                    installReferrer.getClass();
                    String installReferrer2 = installReferrer.getInstallReferrer();
                    if (installReferrer2 != null && (muc.Q(installReferrer2, "fb", false) || muc.Q(installReferrer2, "facebook", false))) {
                        if (!set.contains(g50.class)) {
                            try {
                                f94.a().getSharedPreferences("com.facebook.sdk.appEventPreferences", 0).edit().putString("install_referrer", installReferrer2).apply();
                            } catch (Throwable th) {
                                ec2.a(g50.class, th);
                            }
                        }
                    }
                    f94.a().getSharedPreferences("com.facebook.sdk.appEventPreferences", 0).edit().putBoolean("is_referrer_updated", true).apply();
                } catch (RemoteException | Exception unused) {
                    return;
                }
            } else if (i == 2) {
                f94.a().getSharedPreferences("com.facebook.sdk.appEventPreferences", 0).edit().putBoolean("is_referrer_updated", true).apply();
            }
            installReferrerClient.endConnection();
        } catch (Throwable th2) {
            try {
                throw th2;
            } catch (Throwable th3) {
                ec2.a(this, th3);
            }
        }
    }

    public void q(int i, int i2) {
        RecyclerView recyclerView = (RecyclerView) this.b;
        int iD = recyclerView.f.D();
        for (int i3 = 0; i3 < iD; i3++) {
            pr0 pr0VarK = RecyclerView.K(recyclerView.f.C(i3));
            if (pr0VarK != null && !pr0VarK.n() && pr0VarK.c >= i) {
                if (RecyclerView.Q0) {
                    Log.d("RecyclerView", "offsetPositionRecordsForInsert attached child " + i3 + " holder " + pr0VarK + " now at position " + (pr0VarK.c + i2));
                }
                pr0VarK.k(i2, false);
                recyclerView.u0.f = true;
            }
        }
        ArrayList arrayList = recyclerView.c.c;
        int size = arrayList.size();
        for (int i4 = 0; i4 < size; i4++) {
            pr0 pr0Var = (pr0) arrayList.get(i4);
            if (pr0Var != null && pr0Var.c >= i) {
                if (RecyclerView.Q0) {
                    Log.d("RecyclerView", "offsetPositionRecordsForInsert cached " + i4 + " holder " + pr0Var + " now at position " + (pr0Var.c + i2));
                }
                pr0Var.k(i2, false);
            }
        }
        recyclerView.requestLayout();
        recyclerView.x0 = true;
    }

    public void r(int i, int i2) {
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        RecyclerView recyclerView = (RecyclerView) this.b;
        int iD = recyclerView.f.D();
        int i10 = -1;
        if (i < i2) {
            i4 = i;
            i3 = i2;
            i5 = -1;
        } else {
            i3 = i;
            i4 = i2;
            i5 = 1;
        }
        for (int i11 = 0; i11 < iD; i11++) {
            pr0 pr0VarK = RecyclerView.K(recyclerView.f.C(i11));
            if (pr0VarK != null && (i9 = pr0VarK.c) >= i4 && i9 <= i3) {
                if (RecyclerView.Q0) {
                    Log.d("RecyclerView", "offsetPositionRecordsForMove attached child " + i11 + " holder " + pr0VarK);
                }
                if (pr0VarK.c == i) {
                    pr0VarK.k(i2 - i, false);
                } else {
                    pr0VarK.k(i5, false);
                }
                recyclerView.u0.f = true;
            }
        }
        ArrayList arrayList = recyclerView.c.c;
        if (i < i2) {
            i7 = i;
            i6 = i2;
        } else {
            i6 = i;
            i7 = i2;
            i10 = 1;
        }
        int size = arrayList.size();
        for (int i12 = 0; i12 < size; i12++) {
            pr0 pr0Var = (pr0) arrayList.get(i12);
            if (pr0Var != null && (i8 = pr0Var.c) >= i7 && i8 <= i6) {
                if (i8 == i) {
                    pr0Var.k(i2 - i, false);
                } else {
                    pr0Var.k(i10, false);
                }
                if (RecyclerView.Q0) {
                    Log.d("RecyclerView", "offsetPositionRecordsForMove cached child " + i12 + " holder " + pr0Var);
                }
            }
        }
        recyclerView.requestLayout();
        recyclerView.x0 = true;
    }

    @Override // defpackage.x31
    public Type s() {
        return (Type) this.b;
    }

    public JSONObject t() throws Throwable {
        FileInputStream fileInputStream;
        JSONObject jSONObject;
        FileInputStream fileInputStream2 = null;
        if (Log.isLoggable("FirebaseCrashlytics", 3)) {
            Log.d("FirebaseCrashlytics", "Checking for cached settings...", null);
        }
        try {
            File file = (File) this.b;
            if (file.exists()) {
                fileInputStream = new FileInputStream(file);
                try {
                    try {
                        jSONObject = new JSONObject(gx1.c0(fileInputStream));
                        fileInputStream2 = fileInputStream;
                    } catch (Exception e2) {
                        e = e2;
                        Log.e("FirebaseCrashlytics", "Failed to fetch cached settings", e);
                        gx1.D(fileInputStream, "Error while closing settings cache file.");
                        return null;
                    }
                } catch (Throwable th) {
                    th = th;
                    fileInputStream2 = fileInputStream;
                    gx1.D(fileInputStream2, "Error while closing settings cache file.");
                    throw th;
                }
            } else {
                if (Log.isLoggable("FirebaseCrashlytics", 2)) {
                    Log.v("FirebaseCrashlytics", "Settings file does not exist.", null);
                }
                jSONObject = null;
            }
            gx1.D(fileInputStream2, "Error while closing settings cache file.");
            return jSONObject;
        } catch (Exception e3) {
            e = e3;
            fileInputStream = null;
        } catch (Throwable th2) {
            th = th2;
            gx1.D(fileInputStream2, "Error while closing settings cache file.");
            throw th;
        }
    }

    @Override // defpackage.x31
    public Object u(sp8 sp8Var) {
        xx1 xx1Var = new xx1(sp8Var);
        sp8Var.f(new wx1(0, xx1Var));
        return xx1Var;
    }

    @Override // defpackage.y92
    public Object v(Object obj) {
        Charset charsetA;
        switch (this.a) {
            case 15:
                fdb fdbVar = (fdb) obj;
                ddb ddbVar = fdbVar.a;
                if (ddbVar == null) {
                    zz0 zz0VarV0 = fdbVar.v0();
                    fn7 fn7VarM = fdbVar.m();
                    if (fn7VarM == null || (charsetA = fn7.a(fn7VarM)) == null) {
                        charsetA = wk1.a;
                    }
                    ddbVar = new ddb(zz0VarV0, charsetA);
                    fdbVar.a = ddbVar;
                }
                gd6 gd6Var = new gd6(ddbVar);
                gd6Var.E0(euc.LEGACY_STRICT);
                try {
                    Object objB = ((jud) this.b).b(gd6Var);
                    if (gd6Var.p0() == jd6.END_DOCUMENT) {
                        return objB;
                    }
                    throw new JsonIOException("JSON document was not fully consumed.");
                } finally {
                    fdbVar.close();
                }
            default:
                return Optional.ofNullable(((y92) this.b).v((fdb) obj));
        }
    }

    public ArrayList w(int i) {
        ArrayList arrayList = new ArrayList();
        ur6 ur6Var = (ur6) this.b;
        oic oicVarA = vn7.A();
        x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
        oic oicVarG = vn7.G(oicVarA);
        try {
            mr6 mr6Var = ur6Var.b ? ur6Var.c : (mr6) ur6Var.e.getValue();
            if (mr6Var != null) {
                pya pyaVar = new pya();
                pyaVar.a = 1;
                List list = (List) mr6Var.k.invoke(Integer.valueOf(i));
                int size = list.size();
                for (int i2 = 0; i2 < size; i2++) {
                    f09 f09Var = (f09) list.get(i2);
                    gu6 gu6Var = ur6Var.o;
                    int iIntValue = ((Number) f09Var.a).intValue();
                    long j = ((f72) f09Var.b).a;
                    mya myaVar = ur6.w;
                    pyaVar = pyaVar;
                    arrayList.add(gu6Var.a(iIntValue, j, false, new iu((ArrayList) null, pyaVar, list, i, mr6Var)));
                }
            }
            vn7.T(oicVarA, oicVarG, x45VarE);
            return arrayList;
        } catch (Throwable th) {
            vn7.T(oicVarA, oicVarG, x45VarE);
            throw th;
        }
    }

    public void x(o46 o46Var) {
        ((Region) this.b).set(o46Var.a, o46Var.b, o46Var.c, o46Var.d);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0027  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void y(defpackage.rpc r5) {
        /*
            r4 = this;
            r5.getClass()
            java.lang.Object r4 = r4.b
            xpc r4 = (defpackage.xpc) r4
        L7:
            java.lang.Object r0 = r4.getValue()
            r1 = r0
            rpc r1 = (defpackage.rpc) r1
            boolean r2 = r1 instanceof defpackage.cta
            if (r2 == 0) goto L14
            r2 = 1
            goto L1a
        L14:
            szd r2 = defpackage.szd.b
            boolean r2 = defpackage.g76.L(r1, r2)
        L1a:
            if (r2 == 0) goto L1d
            goto L27
        L1d:
            boolean r2 = r1 instanceof defpackage.et2
            if (r2 == 0) goto L29
            int r2 = r5.a
            int r3 = r1.a
            if (r2 <= r3) goto L2d
        L27:
            r1 = r5
            goto L2d
        L29:
            boolean r2 = r1 instanceof defpackage.ai4
            if (r2 == 0) goto L34
        L2d:
            boolean r0 = r4.k(r0, r1)
            if (r0 == 0) goto L7
            return
        L34:
            defpackage.ygf.a()
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.olb.y(rpc):void");
    }

    @Override // com.android.installreferrer.api.InstallReferrerStateListener
    public void onInstallReferrerServiceDisconnected() {
    }

    public /* synthetic */ olb(int i, boolean z) {
        this.a = i;
    }

    public /* synthetic */ olb(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj2;
    }

    public olb(mn0 mn0Var) {
        this.a = 6;
        Objects.requireNonNull(mn0Var);
        this.b = mn0Var;
    }

    public olb(f66 f66Var) {
        this.a = 19;
        f66Var.getClass();
        this.b = f66Var;
    }

    public olb(bh4 bh4Var) {
        this.a = 7;
        this.b = new File((File) bh4Var.c, "com.crashlytics.settings.json");
    }

    public olb(InstallReferrerClient installReferrerClient, z10 z10Var) {
        this.a = 16;
        this.b = installReferrerClient;
    }

    public /* synthetic */ olb(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }
}
