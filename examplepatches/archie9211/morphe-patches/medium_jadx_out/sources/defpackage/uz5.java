package defpackage;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.View;
import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.google.firebase.auth.FirebaseAuth;
import com.medium.reader.R;
import j$.util.DesugarCollections;
import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class uz5 implements ete, h08, z1a {
    public static final cd7 g = new cd7();
    public static uz5 h;
    public final Object a;
    public final Object b;
    public Object c;
    public Object d;
    public final Object e;
    public Object f;

    public uz5() {
        this.a = o7f.i();
        this.b = o7f.c(new w44(Executors.newSingleThreadExecutor(new t5g("r1", 8))));
        this.c = o7f.c(new w44(Executors.newCachedThreadPool(new t5g("rIo", null))));
        this.d = o7f.c(new w44(Executors.newSingleThreadExecutor(new t5g("r2", null))));
        this.e = o7f.c(new w44(Executors.newSingleThreadExecutor(new t5g("r3", 8))));
        this.f = o7f.c(new w44(Executors.newSingleThreadExecutor(new t5g("rM", null))));
    }

    public static Long k(File file, f66 f66Var) {
        String name = file.getName();
        name.getClass();
        Long lP = tuc.P(name);
        if (lP == null) {
            f49.K(f66Var, d66.ERROR, e66.MAINTAINER, new vp0(file, 1), null, false, 56);
        }
        return lP;
    }

    public static String m(File file) {
        File parentFile = file.getParentFile();
        String name = parentFile != null ? parentFile.getName() : null;
        if (name != null) {
            if (ga4.i.c(name)) {
                String string = tqd.PENDING.toString();
                Locale locale = Locale.US;
                locale.getClass();
                String lowerCase = string.toLowerCase(locale);
                lowerCase.getClass();
                return lowerCase;
            }
            if (ga4.h.c(name)) {
                String string2 = tqd.GRANTED.toString();
                Locale locale2 = Locale.US;
                locale2.getClass();
                String lowerCase2 = string2.toLowerCase(locale2);
                lowerCase2.getClass();
                return lowerCase2;
            }
        }
        return null;
    }

    public void a(int i, Bundle bundle) {
        ((ArrayList) this.e).add(new ra8(i, bundle));
        if (((ya8) this.d) != null) {
            o();
        }
    }

    public PendingIntent b() {
        Bundle bundle = (Bundle) this.f;
        int iQ = bundle != null ? yo7.q(bundle) : 0;
        Iterator it2 = ((ArrayList) this.e).iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            ra8 ra8Var = (ra8) it2.next();
            iQ = (iQ * 31) + ra8Var.a;
            Bundle bundle2 = ra8Var.b;
            Integer numValueOf = bundle2 != null ? Integer.valueOf(yo7.q(bundle2)) : null;
            if (numValueOf != null) {
                iQ = (iQ * 31) + numValueOf.intValue();
            }
        }
        xhg xhgVarG = g();
        ArrayList arrayList = (ArrayList) xhgVarG.b;
        if (arrayList.isEmpty()) {
            ygf.f("No intents added to TaskStackBuilder; cannot getPendingIntent");
            return null;
        }
        Intent[] intentArr = (Intent[]) arrayList.toArray(new Intent[0]);
        intentArr[0] = new Intent(intentArr[0]).addFlags(268484608);
        PendingIntent activities = PendingIntent.getActivities((Context) xhgVarG.c, iQ, intentArr, 201326592, null);
        activities.getClass();
        return activities;
    }

    @Override // defpackage.h08
    public void d(File file, kp7 kp7Var, int i) {
        f66 f66Var = (f66) this.c;
        file.getClass();
        String str = (String) this.e;
        if (str == null) {
            return;
        }
        ou2 ou2Var = (ou2) this.a;
        Long lK = k(file, f66Var);
        Map mapQ = null;
        if (lK != null) {
            long jLongValue = lK.longValue();
            ((rv8) this.d).getClass();
            long jCurrentTimeMillis = System.currentTimeMillis() - jLongValue;
            if (jCurrentTimeMillis >= 0) {
                mapQ = ei7.Q(new f09("track", str), new f09("metric_type", "batch deleted"), new f09("batch_age", Long.valueOf(jCurrentTimeMillis)), new f09("uploader_delay", ei7.Q(new f09("min", Long.valueOf(ou2Var.c)), new f09("max", Long.valueOf(ou2Var.d)))), new f09("uploader_window", Long.valueOf(((rg4) this.b).a)), new f09("batch_removal_reason", kp7Var.toString()), new f09("in_background", Boolean.valueOf(((AtomicBoolean) this.f).get())), new f09("consent", m(file)), new f09("filename", file.getName()), new f09("pending_batches", Integer.valueOf(i)), new f09("thread", Thread.currentThread().getName()));
            }
        }
        if (mapQ != null) {
            f49.M(f66Var, co.q, mapQ);
        }
    }

    @Override // defpackage.z1a
    public void e() {
        ((AtomicBoolean) this.f).set(true);
    }

    @Override // defpackage.z1a
    public void f() {
    }

    public xhg g() {
        ArrayList arrayList = (ArrayList) this.e;
        Intent intent = (Intent) this.c;
        if (((ya8) this.d) == null) {
            ygf.f("You must call setGraph() before constructing the deep link");
            return null;
        }
        if (arrayList.isEmpty()) {
            ygf.f("You must call setDestination() or addDestination() before constructing the deep link");
            return null;
        }
        ArrayList arrayList2 = new ArrayList();
        ArrayList<? extends Parcelable> arrayList3 = new ArrayList<>();
        Iterator it2 = arrayList.iterator();
        va8 va8Var = null;
        while (true) {
            int i = 0;
            if (!it2.hasNext()) {
                intent.putExtra("android-support-nav:controller:deepLinkIds", bu1.l1(arrayList2));
                intent.putParcelableArrayListExtra("android-support-nav:controller:deepLinkArgs", arrayList3);
                xhg xhgVar = new xhg((Context) this.a);
                ArrayList arrayList4 = (ArrayList) xhgVar.b;
                Intent intent2 = new Intent(intent);
                ComponentName component = intent2.getComponent();
                if (component == null) {
                    component = intent2.resolveActivity(((Context) xhgVar.c).getPackageManager());
                }
                if (component != null) {
                    xhgVar.d(component);
                }
                arrayList4.add(intent2);
                int size = arrayList4.size();
                while (i < size) {
                    Intent intent3 = (Intent) arrayList4.get(i);
                    if (intent3 != null) {
                        intent3.putExtra("android-support-nav:controller:deepLinkIntent", intent);
                    }
                    i++;
                }
                return xhgVar;
            }
            ra8 ra8Var = (ra8) it2.next();
            int i2 = ra8Var.a;
            Bundle bundle = ra8Var.b;
            va8 va8VarH = h(i2);
            if (va8VarH == null) {
                int i3 = va8.f;
                ay0.i(lv8.u("Navigation destination ", vo7.w((mp) this.b, i2), " cannot be found in the navigation graph "), (ya8) this.d);
                return null;
            }
            int[] iArrM = va8VarH.m(va8Var);
            int length = iArrM.length;
            while (i < length) {
                arrayList2.add(Integer.valueOf(iArrM[i]));
                arrayList3.add(bundle);
                i++;
            }
            va8Var = va8VarH;
        }
    }

    @Override // defpackage.ete
    public View getRoot() {
        return (ConstraintLayout) this.a;
    }

    public va8 h(int i) {
        m70 m70Var = new m70();
        ya8 ya8Var = (ya8) this.d;
        ya8Var.getClass();
        m70Var.addLast(ya8Var);
        while (!m70Var.isEmpty()) {
            va8 va8Var = (va8) m70Var.removeFirst();
            if (va8Var.b.c == i) {
                return va8Var;
            }
            if (va8Var instanceof ya8) {
                Iterator it2 = ((ya8) va8Var).iterator();
                while (true) {
                    ab8 ab8Var = (ab8) it2;
                    if (ab8Var.hasNext()) {
                        m70Var.addLast((va8) ab8Var.next());
                    }
                }
            }
        }
        return null;
    }

    public Object i(wz5 wz5Var, ArrayList arrayList) {
        Object objA0;
        Object objA02;
        Class cls = (Class) this.b;
        if (!ec2.a.contains(this)) {
            try {
                wz5Var.getClass();
                Object objA03 = xz5.a0((Class) this.a, null, (Method) this.c, new Object[0]);
                if (objA03 != null && (objA0 = xz5.a0(cls, objA03, (Method) this.d, wz5Var.getType())) != null && (objA02 = xz5.a0(cls, objA0, (Method) this.e, arrayList)) != null) {
                    return xz5.a0(cls, objA02, (Method) this.f, new Object[0]);
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return null;
            }
        }
        return null;
    }

    @Override // defpackage.z1a
    public void j() {
        ((AtomicBoolean) this.f).set(false);
    }

    @Override // defpackage.z1a
    public void l() {
    }

    public void n() {
        this.d = new mb8((Context) this.a, new ta8()).b(R.navigation.nav_graph);
        o();
    }

    public void o() {
        Iterator it2 = ((ArrayList) this.e).iterator();
        while (it2.hasNext()) {
            int i = ((ra8) it2.next()).a;
            if (h(i) == null) {
                int i2 = va8.f;
                ay0.i(lv8.u("Navigation destination ", vo7.w((mp) this.b, i), " cannot be found in the navigation graph "), (ya8) this.d);
                return;
            }
        }
    }

    public jrg p(String str, Boolean bool, awa awaVar) {
        jrg jrgVarG;
        if (str == null || str.isEmpty()) {
            str = "*";
        }
        jrg jrgVarQ = q(str);
        if (bool.booleanValue() || jrgVarQ == null) {
            String str2 = str.isEmpty() ? "*" : str;
            if (bool.booleanValue() || (jrgVarG = q(str2)) == null) {
                FirebaseAuth firebaseAuth = (FirebaseAuth) this.e;
                d2f d2fVar = firebaseAuth.e;
                String str3 = firebaseAuth.i;
                d2fVar.getClass();
                jrg jrgVarD0 = d2fVar.D0(new imf(str3, 1));
                d2f d2fVar2 = new d2f(this, str2);
                jrgVarD0.getClass();
                jrgVarG = jrgVarD0.g(yfd.a, d2fVar2);
            }
            jrgVarQ = jrgVarG;
        }
        return jrgVarQ.g(yfd.a, new ujf(this, awaVar));
    }

    public jrg q(String str) {
        jrg jrgVar;
        synchronized (this.a) {
            jrgVar = (jrg) ((HashMap) this.b).get(str);
        }
        return jrgVar;
    }

    @Override // defpackage.h08
    public void c(File file, rp0 rp0Var) {
        f66 f66Var = (f66) this.c;
        file.getClass();
        String str = (String) this.e;
        if (str == null || !ht2.k0(file, f66Var)) {
            return;
        }
        Long lK = k(file, f66Var);
        Map mapQ = null;
        if (lK != null) {
            long jLongValue = rp0Var.a - lK.longValue();
            if (jLongValue >= 0) {
                mapQ = ei7.Q(new f09("track", str), new f09("metric_type", CspinKvYN.zaMUntanXDoxk), new f09("batch_duration", Long.valueOf(jLongValue)), new f09("uploader_window", Long.valueOf(((rg4) this.b).a)), new f09("batch_size", Long.valueOf(ht2.u0(file, f66Var))), new f09("batch_events_count", Long.valueOf(rp0Var.b)), new f09("consent", m(file)), new f09("filename", file.getName()), new f09("thread", Thread.currentThread().getName()));
            }
        }
        if (mapQ != null) {
            f49.M(f66Var, co.p, mapQ);
        }
    }

    public /* synthetic */ uz5(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        this.a = obj;
        this.b = obj2;
        this.c = obj3;
        this.d = obj4;
        this.e = obj5;
        this.f = obj6;
    }

    public uz5(String str, String str2, Set set) {
        Set setUnmodifiableSet = set == null ? Collections.EMPTY_SET : DesugarCollections.unmodifiableSet(set);
        this.a = setUnmodifiableSet;
        Map map = Collections.EMPTY_MAP;
        this.c = str;
        this.d = str2;
        this.e = x9c.a;
        HashSet hashSet = new HashSet(setUnmodifiableSet);
        Iterator it2 = map.values().iterator();
        if (!it2.hasNext()) {
            this.b = DesugarCollections.unmodifiableSet(hashSet);
            return;
        }
        throw ev6.q(it2);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:16:0x003d A[PHI: r2
      0x003d: PHI (r2v4 java.lang.String) = (r2v3 java.lang.String), (r2v5 java.lang.String) binds: [B:18:0x0045, B:14:0x003a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0050  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public uz5(java.lang.String r1, defpackage.ou2 r2, defpackage.rg4 r3, defpackage.f66 r4, defpackage.rv8 r5) {
        /*
            r0 = this;
            r1.getClass()
            r4.getClass()
            r5.getClass()
            r0.<init>()
            r0.a = r2
            r0.b = r3
            r0.c = r4
            r0.d = r5
            int r2 = r1.hashCode()
            switch(r2) {
                case -1067396926: goto L48;
                case 113290: goto L3f;
                case 3327407: goto L34;
                case 456014590: goto L28;
                case 2144122390: goto L1c;
                default: goto L1b;
            }
        L1b:
            goto L50
        L1c:
            java.lang.String r2 = "session-replay-resources"
            boolean r1 = r1.equals(r2)
            if (r1 != 0) goto L25
            goto L50
        L25:
            java.lang.String r1 = "sr-resources"
            goto L54
        L28:
            java.lang.String r2 = "session-replay"
            boolean r1 = r1.equals(r2)
            if (r1 != 0) goto L31
            goto L50
        L31:
            java.lang.String r1 = "sr"
            goto L54
        L34:
            java.lang.String r2 = "logs"
            boolean r1 = r1.equals(r2)
            if (r1 != 0) goto L3d
            goto L50
        L3d:
            r1 = r2
            goto L54
        L3f:
            java.lang.String r2 = "rum"
            boolean r1 = r1.equals(r2)
            if (r1 != 0) goto L3d
            goto L50
        L48:
            java.lang.String r2 = "tracing"
            boolean r1 = r1.equals(r2)
            if (r1 != 0) goto L52
        L50:
            r1 = 0
            goto L54
        L52:
            java.lang.String r1 = "trace"
        L54:
            r0.e = r1
            java.util.concurrent.atomic.AtomicBoolean r1 = new java.util.concurrent.atomic.AtomicBoolean
            r2 = 1
            r1.<init>(r2)
            r0.f = r1
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uz5.<init>(java.lang.String, ou2, rg4, f66, rv8):void");
    }

    public uz5(xj4 xj4Var, FirebaseAuth firebaseAuth) {
        jzb jzbVar = new jzb();
        this.a = new Object();
        this.b = new HashMap();
        this.d = xj4Var;
        this.e = firebaseAuth;
        this.f = jzbVar;
    }

    public uz5(Context context) {
        Intent launchIntentForPackage;
        context.getClass();
        this.a = context;
        this.b = new mp(context, (byte) 0);
        Activity activity = (Activity) szb.H0(szb.N0(szb.K0(context, new ss7(24)), new ss7(25)));
        if (activity != null) {
            launchIntentForPackage = new Intent(context, activity.getClass());
        } else {
            launchIntentForPackage = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
            if (launchIntentForPackage == null) {
                launchIntentForPackage = new Intent();
            }
        }
        launchIntentForPackage.addFlags(268468224);
        this.c = launchIntentForPackage;
        this.e = new ArrayList();
    }

    public uz5(db8 db8Var) {
        this(db8Var.a);
        this.d = db8Var.b.h();
    }
}
