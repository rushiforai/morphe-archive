package defpackage;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.google.firebase.components.ComponentRegistrar;
import com.google.firebase.components.InvalidRegistrarException;
import com.google.firebase.components.MissingDependencyException;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import j$.util.DesugarCollections;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Stack;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicMarkableReference;
import java.util.concurrent.atomic.AtomicReference;
import pushnotifications.SY.eoLmc;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class jz1 implements zy1, en6, ete, iof {
    public static final hz1 i = new hz1(0);
    public final /* synthetic */ int a;
    public Object b;
    public Object c;
    public Object d;
    public Object e;
    public Object f;
    public Object g;
    public Object h;

    public jz1(pzd pzdVar, ArrayList arrayList, ArrayList arrayList2, xsa xsaVar) {
        int i2 = 0;
        this.a = 0;
        this.b = new HashMap();
        this.c = new HashMap();
        this.d = new HashMap();
        this.e = new HashSet();
        this.g = new AtomicReference();
        e34 e34Var = new e34(pzdVar);
        this.f = e34Var;
        this.h = xsaVar;
        ArrayList<iy1> arrayList3 = new ArrayList();
        arrayList3.add(iy1.c(e34Var, e34.class, zwc.class, xoa.class));
        arrayList3.add(iy1.c(this, jz1.class, new Class[0]));
        Iterator it2 = arrayList2.iterator();
        while (it2.hasNext()) {
            iy1 iy1Var = (iy1) it2.next();
            if (iy1Var != null) {
                arrayList3.add(iy1Var);
            }
        }
        ArrayList arrayList4 = new ArrayList();
        Iterator it3 = arrayList.iterator();
        while (it3.hasNext()) {
            arrayList4.add(it3.next());
        }
        ArrayList arrayList5 = new ArrayList();
        synchronized (this) {
            Iterator it4 = arrayList4.iterator();
            while (it4.hasNext()) {
                try {
                    ComponentRegistrar componentRegistrar = (ComponentRegistrar) ((h8a) it4.next()).get();
                    if (componentRegistrar != null) {
                        arrayList3.addAll(((xsa) this.h).V(componentRegistrar));
                        it4.remove();
                    }
                } catch (InvalidRegistrarException e) {
                    it4.remove();
                    Log.w("ComponentDiscovery", "Invalid component registrar.", e);
                }
            }
            Iterator it5 = arrayList3.iterator();
            while (it5.hasNext()) {
                Object[] array = ((iy1) it5.next()).b.toArray();
                int length = array.length;
                int i3 = 0;
                while (true) {
                    if (i3 < length) {
                        Object obj = array[i3];
                        if (obj.toString().contains("kotlinx.coroutines.CoroutineDispatcher")) {
                            if (((HashSet) this.e).contains(obj.toString())) {
                                it5.remove();
                                break;
                            }
                            ((HashSet) this.e).add(obj.toString());
                        }
                        i3++;
                    }
                }
            }
            if (((HashMap) this.b).isEmpty()) {
                vx0.K(arrayList3);
            } else {
                ArrayList arrayList6 = new ArrayList(((HashMap) this.b).keySet());
                arrayList6.addAll(arrayList3);
                vx0.K(arrayList6);
            }
            for (iy1 iy1Var2 : arrayList3) {
                ((HashMap) this.b).put(iy1Var2, new wq6(new iz1(this, i2, iy1Var2)));
            }
            arrayList5.addAll(A(arrayList3));
            arrayList5.addAll(B());
            z();
        }
        Iterator it6 = arrayList5.iterator();
        while (it6.hasNext()) {
            ((Runnable) it6.next()).run();
        }
        Boolean bool = (Boolean) ((AtomicReference) this.g).get();
        if (bool != null) {
            t((HashMap) this.b, bool.booleanValue());
        }
    }

    public static final ArrayList E(s6a s6aVar, jz1 jz1Var) {
        List list = s6aVar.d;
        list.getClass();
        s6a s6aVarI = vn7.I(s6aVar, (wjc) ((sj0) jz1Var.b).d);
        Iterable iterableE = s6aVarI != null ? E(s6aVarI, jz1Var) : null;
        if (iterableE == null) {
            iterableE = ey3.a;
        }
        return bu1.Q0(iterableE, list);
    }

    public static uvd F(List list, ly lyVar) {
        uvd uvdVarI;
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            ((d33) it2.next()).getClass();
            if (lyVar.isEmpty()) {
                uvd.b.getClass();
                uvdVarI = uvd.c;
            } else {
                a1a a1aVar = uvd.b;
                List listQ = d46.Q(new oy(lyVar));
                a1aVar.getClass();
                uvdVarI = a1a.i(listQ);
            }
            arrayList.add(uvdVarI);
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it3 = arrayList.iterator();
        while (it3.hasNext()) {
            bu1.n0((Iterable) it3.next(), arrayList2);
        }
        uvd.b.getClass();
        return a1a.i(arrayList2);
    }

    public static final y28 H(jz1 jz1Var, s6a s6aVar, int i2) {
        sj0 sj0Var = (sj0) jz1Var.b;
        mn1 mn1VarZ = vn7.z((p98) sj0Var.b, i2);
        mzb<s6a> mzbVarK0 = szb.K0(s6aVar, new cwd(jz1Var, 2));
        ArrayList arrayList = new ArrayList();
        for (s6a s6aVar2 : mzbVarK0) {
            s6aVar2.getClass();
            arrayList.add(Integer.valueOf(s6aVar2.d.size()));
        }
        Iterator it2 = szb.K0(mn1VarZ, ewd.b).iterator();
        int i3 = 0;
        while (it2.hasNext()) {
            it2.next();
            i3++;
            if (i3 < 0) {
                d46.h0();
                throw null;
            }
        }
        while (arrayList.size() < i3) {
            arrayList.add(0);
        }
        return ((i93) sj0Var.a).l.L(mn1VarZ, arrayList);
    }

    public static ld2 i(ki0 ki0Var, lod lodVar) {
        List listG = ((ru) lodVar.f).g();
        ArrayList arrayList = new ArrayList();
        for (int i2 = 0; i2 < listG.size(); i2++) {
            wkb wkbVar = (wkb) listG.get(i2);
            wkbVar.getClass();
            yi0 yi0Var = new yi0();
            bk0 bk0Var = (bk0) wkbVar;
            String str = bk0Var.e;
            if (str == null) {
                z72.c("Null variantId");
                return null;
            }
            String str2 = bk0Var.b;
            if (str2 == null) {
                z72.c("Null rolloutId");
                return null;
            }
            yi0Var.a = new aj0(str2, str);
            String str3 = bk0Var.c;
            if (str3 == null) {
                z72.c("Null parameterKey");
                return null;
            }
            yi0Var.b = str3;
            yi0Var.c = bk0Var.d;
            yi0Var.d = bk0Var.f;
            yi0Var.e = (byte) (yi0Var.e | 1);
            arrayList.add(yi0Var.a());
        }
        if (arrayList.isEmpty()) {
            return ki0Var;
        }
        ji0 ji0VarA = ki0Var.a();
        ji0VarA.f = new bj0(arrayList);
        return ji0VarA.a();
    }

    public static String q(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream;
        byte[] bArr;
        BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream);
        try {
            byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                bArr = new byte[8192];
            } finally {
            }
        } catch (Throwable th) {
            try {
                bufferedInputStream.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
        while (true) {
            int i2 = bufferedInputStream.read(bArr);
            if (i2 == -1) {
                String string = byteArrayOutputStream.toString(StandardCharsets.UTF_8.name());
                byteArrayOutputStream.close();
                bufferedInputStream.close();
                return string;
            }
            byteArrayOutputStream.write(bArr, 0, i2);
            bufferedInputStream.close();
            throw th;
        }
    }

    public static jz1 r(Context context, sv5 sv5Var, bh4 bh4Var, g40 g40Var, s26 s26Var, lod lodVar, gg5 gg5Var, iv2 iv2Var, hx4 hx4Var, gc2 gc2Var, m50 m50Var) {
        qd2 qd2Var = new qd2(context, sv5Var, g40Var, gg5Var, iv2Var);
        sd2 sd2Var = new sd2(bh4Var, iv2Var, gc2Var);
        rd2 rd2Var = nu2.b;
        psd.b(context);
        return new jz1(qd2Var, sd2Var, new nu2(new x5b(psd.a().c(new j21(nu2.c, nu2.d)).a("FIREBASE_CRASHLYTICS_REPORT", new wy3("json"), nu2.e), iv2Var.d(), hx4Var)), s26Var, lodVar, sv5Var, m50Var, 4);
    }

    public static hec s(hec hecVar, mn6 mn6Var) {
        vm6 vm6VarB = ok7.B(hecVar);
        ly annotations = hecVar.getAnnotations();
        mn6 mn6VarX = vx0.X(hecVar);
        List listQ = vx0.Q(hecVar);
        List listT0 = bu1.t0(vx0.Y(hecVar));
        ArrayList arrayList = new ArrayList(cu1.k0(listT0, 10));
        Iterator it2 = listT0.iterator();
        while (it2.hasNext()) {
            arrayList.add(((xwd) it2.next()).b());
        }
        return vx0.J(vm6VarB, annotations, mn6VarX, listQ, arrayList, mn6Var, true).n0(hecVar.k0());
    }

    public static List v(Map map) {
        ArrayList arrayList = new ArrayList();
        arrayList.ensureCapacity(map.size());
        for (Map.Entry entry : map.entrySet()) {
            String str = (String) entry.getKey();
            if (str == null) {
                z72.c("Null key");
                return null;
            }
            String str2 = (String) entry.getValue();
            if (str2 == null) {
                z72.c("Null value");
                return null;
            }
            arrayList.add(new ai0(str, str2));
        }
        Collections.sort(arrayList, new g(14));
        return DesugarCollections.unmodifiableList(arrayList);
    }

    public ArrayList A(ArrayList arrayList) {
        HashMap map = (HashMap) this.c;
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            iy1 iy1Var = (iy1) it2.next();
            if (iy1Var.e == 0) {
                h8a h8aVar = (h8a) ((HashMap) this.b).get(iy1Var);
                for (rqa rqaVar : iy1Var.b) {
                    if (map.containsKey(rqaVar)) {
                        arrayList2.add(new ho((bw8) ((h8a) map.get(rqaVar)), 11, h8aVar));
                    } else {
                        map.put(rqaVar, h8aVar);
                    }
                }
            }
        }
        return arrayList2;
    }

    public ArrayList B() {
        HashMap map = (HashMap) this.d;
        ArrayList arrayList = new ArrayList();
        HashMap map2 = new HashMap();
        for (Map.Entry entry : ((HashMap) this.b).entrySet()) {
            iy1 iy1Var = (iy1) entry.getKey();
            if (iy1Var.e != 0) {
                h8a h8aVar = (h8a) entry.getValue();
                for (rqa rqaVar : iy1Var.b) {
                    if (!map2.containsKey(rqaVar)) {
                        map2.put(rqaVar, new HashSet());
                    }
                    ((Set) map2.get(rqaVar)).add(h8aVar);
                }
            }
        }
        for (Map.Entry entry2 : map2.entrySet()) {
            if (map.containsKey(entry2.getKey())) {
                vv6 vv6Var = (vv6) map.get(entry2.getKey());
                Iterator it2 = ((Set) entry2.getValue()).iterator();
                while (it2.hasNext()) {
                    arrayList.add(new ho(vv6Var, 12, (h8a) it2.next()));
                }
            } else {
                rqa rqaVar2 = (rqa) entry2.getKey();
                Set set = (Set) ((Collection) entry2.getValue());
                vv6 vv6Var2 = new vv6();
                vv6Var2.b = null;
                vv6Var2.a = Collections.newSetFromMap(new ConcurrentHashMap());
                vv6Var2.a.addAll(set);
                map.put(rqaVar2, vv6Var2);
            }
        }
        return arrayList;
    }

    public jrg C(String str, Executor executor) {
        wfd wfdVar;
        ArrayList<File> arrayListB = ((sd2) this.c).b();
        ArrayList<wh0> arrayList = new ArrayList();
        for (File file : arrayListB) {
            try {
                rd2 rd2Var = sd2.g;
                String strE = sd2.e(file);
                rd2Var.getClass();
                arrayList.add(new wh0(rd2.i(strE), file.getName(), file));
            } catch (IOException e) {
                Log.w("FirebaseCrashlytics", "Could not load report file " + file + "; deleting", e);
                file.delete();
            }
        }
        ArrayList arrayList2 = new ArrayList();
        for (wh0 wh0Var : arrayList) {
            if (str == null || str.equals(wh0Var.b)) {
                nu2 nu2Var = (nu2) this.d;
                vh0 vh0Var = wh0Var.a;
                if (vh0Var.f == null || vh0Var.g == null) {
                    ck4 ck4VarB = ((sv5) this.g).b(true);
                    vh0 vh0Var2 = wh0Var.a;
                    String str2 = ck4VarB.a;
                    uh0 uh0VarA = vh0Var2.a();
                    uh0VarA.e = str2;
                    vh0 vh0VarA = uh0VarA.a();
                    String str3 = ck4VarB.b;
                    uh0 uh0VarA2 = vh0VarA.a();
                    uh0VarA2.f = str3;
                    wh0Var = new wh0(uh0VarA2.a(), wh0Var.b, wh0Var.c);
                }
                boolean z = str != null;
                x5b x5bVar = nu2Var.a;
                synchronized (x5bVar.f) {
                    try {
                        wfdVar = new wfd();
                        if (z) {
                            ((AtomicInteger) x5bVar.i.b).getAndIncrement();
                            if (x5bVar.f.size() < x5bVar.e) {
                                uob uobVar = uob.e;
                                uobVar.o("Enqueueing report: " + wh0Var.b);
                                uobVar.o("Queue size: " + x5bVar.f.size());
                                x5bVar.g.execute(new pa6(x5bVar, wh0Var, wfdVar));
                                uobVar.o("Closing task for report: " + wh0Var.b);
                                wfdVar.d(wh0Var);
                            } else {
                                x5bVar.a();
                                String str4 = "Dropping report due to queue being full: " + wh0Var.b;
                                if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                                    Log.d("FirebaseCrashlytics", str4, null);
                                }
                                ((AtomicInteger) x5bVar.i.c).getAndIncrement();
                                wfdVar.d(wh0Var);
                            }
                        } else {
                            x5bVar.b(wh0Var, wfdVar);
                        }
                    } finally {
                    }
                }
                arrayList2.add(wfdVar.a.f(executor, new ywb(this)));
            }
        }
        return vp7.H(arrayList2);
    }

    /* JADX WARN: Removed duplicated region for block: B:108:0x02d2  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x039a  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x03a6  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0122  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x013e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.hec D(defpackage.s6a r20, boolean r21) {
        /*
            Method dump skipped, instruction units count: 1007
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jz1.D(s6a, boolean):hec");
    }

    public mn6 G(s6a s6aVar) {
        sj0 sj0Var = (sj0) this.b;
        s6aVar.getClass();
        if ((s6aVar.c & 2) != 2) {
            return D(s6aVar, true);
        }
        String string = ((p98) sj0Var.b).getString(s6aVar.f);
        hec hecVarD = D(s6aVar, true);
        wjc wjcVar = (wjc) sj0Var.d;
        int i2 = s6aVar.c;
        s6a s6aVarF = (i2 & 4) == 4 ? s6aVar.g : (i2 & 8) == 8 ? wjcVar.f(s6aVar.h) : null;
        s6aVarF.getClass();
        return ((i93) sj0Var.a).j.s(s6aVar, string, hecVarD, D(s6aVarF, true));
    }

    @Override // defpackage.iof
    /* JADX INFO: renamed from: a */
    public void mo105a(String str) {
        ((iof) this.b).mo105a(str);
    }

    @Override // defpackage.en6
    public void b() {
        nig nigVar = (nig) this.d;
        mn1 mn1Var = (mn1) this.f;
        HashMap map = (HashMap) this.b;
        boolean zP = false;
        if (mn1Var.equals(nlc.b)) {
            Object obj = map.get(n98.e("value"));
            hh6 hh6Var = obj instanceof hh6 ? (hh6) obj : null;
            if (hh6Var != null) {
                Object obj2 = hh6Var.a;
                fh6 fh6Var = obj2 instanceof fh6 ? (fh6) obj2 : null;
                if (fh6Var != null) {
                    zP = nigVar.p(fh6Var.a.a);
                }
            }
        }
        if (zP || nigVar.p(mn1Var)) {
            return;
        }
        ((List) this.g).add(new zx(((y28) this.e).T(), map, (jkc) this.h));
    }

    @Override // defpackage.zy1
    public Object c(Class cls) {
        return o(rqa.a(cls));
    }

    @Override // defpackage.zy1
    public Set d(rqa rqaVar) {
        h8a h8aVar;
        synchronized (this) {
            h8aVar = (vv6) ((HashMap) this.d).get(rqaVar);
            if (h8aVar == null) {
                h8aVar = i;
            }
        }
        return (Set) h8aVar.get();
    }

    @Override // defpackage.zy1
    public h8a e(Class cls) {
        return l(rqa.a(cls));
    }

    @Override // defpackage.en6
    public void g(n98 n98Var, Object obj) {
        f52 f52VarK = cd7.k((c38) ((nig) this.c).c, obj);
        if (f52VarK == null) {
            f52VarK = new m24("Unsupported annotation argument: " + n98Var);
        }
        ((HashMap) this.b).put(n98Var, f52VarK);
    }

    @Override // defpackage.ete
    public View getRoot() {
        return (CoordinatorLayout) this.b;
    }

    @Override // defpackage.iof
    public void h(xnf xnfVar) {
        String str = (String) this.d;
        String str2 = (String) this.c;
        List list = ((mpf) xnfVar).a.a;
        if (list == null || list.isEmpty()) {
            ((iof) this.b).mo105a("No users.");
            return;
        }
        int i2 = 0;
        ppf ppfVar = (ppf) list.get(0);
        a38 a38Var = ppfVar.f;
        List list2 = a38Var != null ? a38Var.a : null;
        if (list2 != null && !list2.isEmpty()) {
            if (TextUtils.isEmpty(str2)) {
                ((fqf) list2.get(0)).e = str;
            } else {
                while (true) {
                    if (i2 >= list2.size()) {
                        break;
                    }
                    if (((fqf) list2.get(i2)).d.equals(str2)) {
                        ((fqf) list2.get(i2)).e = str;
                        break;
                    }
                    i2++;
                }
            }
        }
        ppfVar.j = ((Boolean) this.e).booleanValue();
        ppfVar.k = (lxf) this.f;
        ((zjf) this.g).k((zpf) this.h, ppfVar);
    }

    @Override // defpackage.en6
    public void j(n98 n98Var, rn1 rn1Var) {
        ((HashMap) this.b).put(n98Var, new hh6(new fh6(rn1Var)));
    }

    @Override // defpackage.zy1
    public bw8 k(rqa rqaVar) {
        h8a h8aVarL = l(rqaVar);
        return h8aVarL == null ? new bw8(bw8.c, bw8.d) : h8aVarL instanceof bw8 ? (bw8) h8aVarL : new bw8(null, h8aVarL);
    }

    @Override // defpackage.zy1
    public synchronized h8a l(rqa rqaVar) {
        aq7.l("Null interface requested.", rqaVar);
        return (h8a) ((HashMap) this.c).get(rqaVar);
    }

    @Override // defpackage.en6
    public fn6 m(n98 n98Var) {
        return new n0c((nig) this.c, n98Var, this);
    }

    @Override // defpackage.en6
    public void n(n98 n98Var, mn1 mn1Var, n98 n98Var2) {
        ((HashMap) this.b).put(n98Var, new r04(mn1Var, n98Var2));
    }

    @Override // defpackage.zy1
    public Object o(rqa rqaVar) {
        h8a h8aVarL = l(rqaVar);
        if (h8aVarL == null) {
            return null;
        }
        return h8aVarL.get();
    }

    @Override // defpackage.en6
    public en6 p(mn1 mn1Var, n98 n98Var) {
        ArrayList arrayList = new ArrayList();
        return new iq1(((nig) this.c).q(mn1Var, jkc.g0, arrayList), this, n98Var, arrayList);
    }

    public void t(HashMap map, boolean z) {
        ArrayDeque arrayDeque;
        for (Map.Entry entry : map.entrySet()) {
            iy1 iy1Var = (iy1) entry.getKey();
            h8a h8aVar = (h8a) entry.getValue();
            int i2 = iy1Var.d;
            if (i2 == 1 || (i2 == 2 && z)) {
                h8aVar.get();
            }
        }
        e34 e34Var = (e34) this.f;
        synchronized (e34Var) {
            try {
                arrayDeque = e34Var.b;
                if (arrayDeque != null) {
                    e34Var.b = null;
                } else {
                    arrayDeque = null;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        if (arrayDeque != null) {
            Iterator it2 = arrayDeque.iterator();
            if (it2.hasNext()) {
                throw ev6.q(it2);
            }
        }
    }

    public String toString() {
        switch (this.a) {
            case 5:
                String str = (String) this.d;
                jz1 jz1Var = (jz1) this.c;
                return str.concat(jz1Var == null ? "" : ". Child of ".concat((String) jz1Var.d));
            default:
                return super.toString();
        }
    }

    public List u() {
        return bu1.m1(((Map) this.h).values());
    }

    public swd x(int i2) {
        swd swdVar = (swd) ((Map) this.h).get(Integer.valueOf(i2));
        if (swdVar != null) {
            return swdVar;
        }
        jz1 jz1Var = (jz1) this.c;
        if (jz1Var != null) {
            return jz1Var.x(i2);
        }
        return null;
    }

    public void y(Throwable th, Thread thread, String str, final q34 q34Var, boolean z) {
        Iterator<Map.Entry<Thread, StackTraceElement[]>> it2;
        final boolean zEquals = str.equals("crash");
        qd2 qd2Var = (qd2) this.b;
        long j = q34Var.b;
        Context context = qd2Var.a;
        int i2 = context.getResources().getConfiguration().orientation;
        gg5 gg5Var = qd2Var.d;
        Stack stack = new Stack();
        for (Throwable cause = th; cause != null; cause = cause.getCause()) {
            stack.push(cause);
        }
        o2b o2bVar = null;
        while (!stack.isEmpty()) {
            Throwable th2 = (Throwable) stack.pop();
            o2bVar = new o2b(th2.getLocalizedMessage(), th2.getClass().getName(), gg5Var.n(th2.getStackTrace()), o2bVar, 8);
        }
        o2b o2bVar2 = o2bVar;
        ji0 ji0Var = new ji0();
        ji0Var.b = str;
        ji0Var.a = j;
        ji0Var.g = (byte) (ji0Var.g | 1);
        ed2 ed2VarB = x1a.a.b(context);
        int i3 = ((ui0) ed2VarB).c;
        Boolean boolValueOf = i3 > 0 ? Boolean.valueOf(i3 != 100) : null;
        ArrayList arrayListA = x1a.a(context);
        ArrayList arrayList = new ArrayList();
        StackTraceElement[] stackTraceElementArr = (StackTraceElement[]) o2bVar2.d;
        String name = thread.getName();
        if (name == null) {
            z72.c("Null name");
            return;
        }
        List listD = qd2.d(stackTraceElementArr, 4);
        if (listD == null) {
            z72.c("Null frames");
            return;
        }
        arrayList.add(new qi0(listD, 4, name));
        if (z) {
            Iterator<Map.Entry<Thread, StackTraceElement[]>> it3 = Thread.getAllStackTraces().entrySet().iterator();
            while (it3.hasNext()) {
                Map.Entry<Thread, StackTraceElement[]> next = it3.next();
                Thread key = next.getKey();
                if (key.equals(thread)) {
                    it2 = it3;
                } else {
                    StackTraceElement[] stackTraceElementArrN = gg5Var.n(next.getValue());
                    String name2 = key.getName();
                    if (name2 == null) {
                        z72.c("Null name");
                        return;
                    }
                    it2 = it3;
                    List listD2 = qd2.d(stackTraceElementArrN, 0);
                    if (listD2 == null) {
                        z72.c("Null frames");
                        return;
                    }
                    arrayList.add(new qi0(listD2, 0, name2));
                }
                it3 = it2;
            }
        }
        List listUnmodifiableList = DesugarCollections.unmodifiableList(arrayList);
        oi0 oi0VarC = qd2.c(o2bVar2, 0);
        pi0 pi0VarE = qd2.e();
        List listA = qd2Var.a();
        if (listA == null) {
            z72.c("Null binaries");
            return;
        }
        ji0Var.c = new li0(new mi0(listUnmodifiableList, oi0VarC, null, pi0VarE, listA), null, null, boolValueOf, ed2VarB, arrayListA, i2);
        ji0Var.d = qd2Var.b(i2);
        ki0 ki0VarA = ji0Var.a();
        Map map = q34Var.c;
        s26 s26Var = (s26) this.e;
        lod lodVar = (lod) this.f;
        final ld2 ld2VarI = i(f(ki0VarA, s26Var, lodVar, map), lodVar);
        if (z) {
            ((sd2) this.c).d(ld2VarI, q34Var.a, zEquals);
        } else {
            ((ud2) ((m50) this.h).c).a(new Runnable() { // from class: j1c
                @Override // java.lang.Runnable
                public final void run() {
                    if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                        Log.d("FirebaseCrashlytics", "disk worker: log non-fatal event to persistence", null);
                    }
                    ((sd2) this.a.c).d(ld2VarI, q34Var.a, zEquals);
                }
            });
        }
    }

    public fug I() throws GeneralSecurityException {
        ujf ujfVar;
        ujf ujfVar2;
        iug iugVar = (iug) this.b;
        if (iugVar == null) {
            ygf.l("Cannot build without a RSA SSA PKCS1 public key");
            return null;
        }
        ujf ujfVar3 = (ujf) this.d;
        if (ujfVar3 == null || (ujfVar = (ujf) this.e) == null) {
            ygf.l("Cannot build without prime factors");
            return null;
        }
        ujf ujfVar4 = (ujf) this.c;
        if (ujfVar4 == null) {
            ygf.l("Cannot build without private exponent");
            return null;
        }
        ujf ujfVar5 = (ujf) this.f;
        if (ujfVar5 == null || (ujfVar2 = (ujf) this.g) == null) {
            ygf.l("Cannot build without prime exponents");
            return null;
        }
        ujf ujfVar6 = (ujf) this.h;
        if (ujfVar6 == null) {
            ygf.l("Cannot build without CRT coefficient");
            return null;
        }
        BigInteger bigInteger = iugVar.i.b;
        BigInteger bigInteger2 = iugVar.j;
        BigInteger bigInteger3 = (BigInteger) ujfVar3.b;
        BigInteger bigInteger4 = (BigInteger) ujfVar.b;
        BigInteger bigInteger5 = (BigInteger) ujfVar4.b;
        BigInteger bigInteger6 = (BigInteger) ujfVar5.b;
        BigInteger bigInteger7 = (BigInteger) ujfVar2.b;
        BigInteger bigInteger8 = (BigInteger) ujfVar6.b;
        if (!bigInteger3.isProbablePrime(10)) {
            ygf.l("p is not a prime");
            return null;
        }
        if (!bigInteger4.isProbablePrime(10)) {
            ygf.l("q is not a prime");
            return null;
        }
        if (!bigInteger3.multiply(bigInteger4).equals(bigInteger2)) {
            ygf.l("Prime p times prime q is not equal to the public key's modulus");
            return null;
        }
        BigInteger bigInteger9 = BigInteger.ONE;
        BigInteger bigIntegerSubtract = bigInteger3.subtract(bigInteger9);
        BigInteger bigIntegerSubtract2 = bigInteger4.subtract(bigInteger9);
        if (!bigInteger.multiply(bigInteger5).mod(bigIntegerSubtract.divide(bigIntegerSubtract.gcd(bigIntegerSubtract2)).multiply(bigIntegerSubtract2)).equals(bigInteger9)) {
            ygf.l("D is invalid.");
            return null;
        }
        if (!bigInteger.multiply(bigInteger6).mod(bigIntegerSubtract).equals(bigInteger9)) {
            ygf.l(eoLmc.jIXPqPJDTD);
            return null;
        }
        if (!bigInteger.multiply(bigInteger7).mod(bigIntegerSubtract2).equals(bigInteger9)) {
            ygf.l("dQ is invalid.");
            return null;
        }
        if (bigInteger4.multiply(bigInteger8).mod(bigInteger3).equals(bigInteger9)) {
            return new fug((iug) this.b, (ujf) this.d, (ujf) this.e, (ujf) this.c, (ujf) this.f, (ujf) this.g, (ujf) this.h);
        }
        ygf.l("qInv is invalid.");
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x010a  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x010e  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x013c  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object w(java.lang.String r18, java.lang.String r19, gen.model.SourceParameter r20, java.lang.String r21, defpackage.p92 r22) {
        /*
            Method dump skipped, instruction units count: 330
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jz1.w(java.lang.String, java.lang.String, gen.model.SourceParameter, java.lang.String, p92):java.lang.Object");
    }

    public void z() {
        HashMap map = (HashMap) this.c;
        HashMap map2 = (HashMap) this.d;
        for (iy1 iy1Var : ((HashMap) this.b).keySet()) {
            for (s73 s73Var : iy1Var.c) {
                boolean z = s73Var.b == 2;
                rqa rqaVar = s73Var.a;
                if (z && !map2.containsKey(rqaVar)) {
                    Set set = Collections.EMPTY_SET;
                    vv6 vv6Var = new vv6();
                    vv6Var.b = null;
                    vv6Var.a = Collections.newSetFromMap(new ConcurrentHashMap());
                    vv6Var.a.addAll(set);
                    map2.put(rqaVar, vv6Var);
                } else if (map.containsKey(rqaVar)) {
                    continue;
                } else {
                    int i2 = s73Var.b;
                    if (i2 == 1) {
                        throw new MissingDependencyException("Unsatisfied dependency for component " + iy1Var + uvlZTF.SzAwmPVWIGnNx + rqaVar);
                    }
                    if (i2 != 2) {
                        map.put(rqaVar, new bw8(bw8.c, bw8.d));
                    }
                }
            }
        }
    }

    public static ki0 f(ki0 ki0Var, s26 s26Var, lod lodVar, Map map) {
        Map mapUnmodifiableMap;
        ji0 ji0VarA = ki0Var.a();
        String strD = ((pg4) s26Var.c).d();
        String str = dpBiLjNeNsiASg.ksfiGXl;
        if (strD != null) {
            ji0VarA.e = new xi0(strD);
        } else if (Log.isLoggable(str, 2)) {
            Log.v(str, "No log data to include with this event.", null);
        }
        boolean zIsEmpty = map.isEmpty();
        zf3 zf3Var = (zf3) lodVar.d;
        if (zIsEmpty) {
            mapUnmodifiableMap = ((cl6) ((AtomicMarkableReference) zf3Var.d).getReference()).a();
        } else {
            HashMap map2 = new HashMap(((cl6) ((AtomicMarkableReference) zf3Var.d).getReference()).a());
            int i2 = 0;
            for (Map.Entry entry : map.entrySet()) {
                String strB = cl6.b(1024, (String) entry.getKey());
                if (map2.size() >= 64 && !map2.containsKey(strB)) {
                    i2++;
                } else {
                    map2.put(strB, cl6.b(1024, (String) entry.getValue()));
                }
            }
            if (i2 > 0) {
                Log.w(str, "Ignored " + i2 + " keys when adding event specific keys. Maximum allowable: 1024", null);
            }
            mapUnmodifiableMap = DesugarCollections.unmodifiableMap(map2);
        }
        List listV = v(mapUnmodifiableMap);
        List listV2 = v(((cl6) ((AtomicMarkableReference) ((zf3) lodVar.e).d).getReference()).a());
        if (!listV.isEmpty() || !listV2.isEmpty()) {
            li0 li0Var = (li0) ki0Var.c;
            ji0VarA.c = new li0(li0Var.a, listV, listV2, li0Var.d, li0Var.e, li0Var.f, li0Var.g);
        }
        return ji0VarA.a();
    }

    public /* synthetic */ jz1(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, int i2) {
        this.a = i2;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
        this.f = obj5;
        this.g = obj6;
        this.h = obj7;
    }

    public jz1(ujf ujfVar, iof iofVar, String str, String str2, Boolean bool, lxf lxfVar, zjf zjfVar, zpf zpfVar) {
        this.a = 6;
        this.b = iofVar;
        this.c = str;
        this.d = str2;
        this.e = bool;
        this.f = lxfVar;
        this.g = zjfVar;
        this.h = zpfVar;
    }

    public jz1(mq5 mq5Var, kla klaVar, zpa zpaVar, zk2 zk2Var, pu7 pu7Var, ax2 ax2Var, slc slcVar) {
        this.a = 2;
        mq5Var.getClass();
        zpaVar.getClass();
        zk2Var.getClass();
        pu7Var.getClass();
        slcVar.getClass();
        this.b = mq5Var;
        this.c = klaVar;
        this.d = zpaVar;
        this.e = zk2Var;
        this.f = pu7Var;
        this.g = ax2Var;
        this.h = slcVar;
    }

    public jz1(sj0 sj0Var, jz1 jz1Var, List list, String str, String str2) {
        Map linkedHashMap;
        this.a = 5;
        list.getClass();
        this.b = sj0Var;
        this.c = jz1Var;
        this.d = str;
        this.e = str2;
        x67 x67Var = ((i93) sj0Var.a).a;
        int i2 = 0;
        this.f = x67Var.c(new cwd(this, i2));
        this.g = x67Var.c(new cwd(this, 1));
        if (list.isEmpty()) {
            linkedHashMap = fy3.a;
        } else {
            linkedHashMap = new LinkedHashMap();
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                x6a x6aVar = (x6a) it2.next();
                linkedHashMap.put(Integer.valueOf(x6aVar.d), new ia3((sj0) this.b, x6aVar, i2));
                i2++;
            }
        }
        this.h = linkedHashMap;
    }

    public /* synthetic */ jz1() {
        this.a = 7;
    }

    public jz1(nig nigVar, y28 y28Var, mn1 mn1Var, List list, jkc jkcVar) {
        this.a = 1;
        this.d = nigVar;
        this.e = y28Var;
        this.f = mn1Var;
        this.g = list;
        this.h = jkcVar;
        this.c = nigVar;
        this.b = new HashMap();
    }
}
