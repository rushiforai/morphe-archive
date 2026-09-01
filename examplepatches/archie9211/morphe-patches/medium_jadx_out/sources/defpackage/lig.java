package defpackage;

import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.os.Trace;
import android.text.Spannable;
import android.text.SpannableString;
import android.util.Base64;
import android.util.Log;
import android.view.ActionMode;
import android.view.Choreographer;
import android.view.Menu;
import android.view.ViewGroup;
import android.widget.ImageView;
import androidx.cardview.widget.CardView;
import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import androidx.navigation.fragment.NavHostFragment;
import com.medium.android.explore.ui.ExploreFragment;
import com.medium.reader.R;
import gen.model.SourceParameter;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class lig implements xig, cs1, v0d, j92, i41, jx3, obe {
    public static final Object d = new Object();
    public static z6f e;
    public final /* synthetic */ int a;
    public Object b;
    public Object c;

    public lig(Application application) {
        Method method;
        this.a = 16;
        grb.f("CronetEngine#createBuilderDelegate");
        try {
            long jUptimeMillis = SystemClock.uptimeMillis();
            ArrayList arrayList = new ArrayList(cj2.c(application));
            F(arrayList);
            bj2 bj2Var = (bj2) arrayList.get(0);
            dm2 dm2VarK = yi2.K(application, bj2Var.b);
            si2 si2Var = new si2();
            try {
                si2Var.e = Boolean.FALSE;
                si2Var.b = ri2.API;
                si2Var.d = bj2Var.b;
                si2Var.h = Process.myUid();
                si2Var.f = new xi2("143.0.7445.0");
                if (Log.isLoggable("CronetEngine.Builder", 3)) {
                    Log.d("CronetEngine.Builder", String.format("Using '%s' provider for creating CronetEngine.Builder.", bj2Var.a));
                }
                d46 d46Var = (d46) bj2Var.a.b().c;
                try {
                    try {
                        method = d46Var.getClass().getClassLoader().loadClass("org.chromium.net.impl.ImplVersion").getMethod("getCronetVersion", null);
                    } catch (ReflectiveOperationException e2) {
                        throw new RuntimeException("Failed to retrieve Cronet impl version", e2);
                    }
                } catch (ClassNotFoundException | NoSuchMethodException unused) {
                    method = null;
                }
                String str = method != null ? (String) method.invoke(null, null) : null;
                if (str != null) {
                    si2Var.g = new xi2(str);
                }
                si2Var.a = d46Var.L();
                si2Var.e = Boolean.TRUE;
                si2Var.c = (int) (SystemClock.uptimeMillis() - jUptimeMillis);
                dm2VarK.N(si2Var);
                Trace.endSection();
                this(d46Var);
            } catch (Throwable th) {
                si2Var.c = (int) (SystemClock.uptimeMillis() - jUptimeMillis);
                dm2VarK.N(si2Var);
                throw th;
            }
        } catch (Throwable th2) {
            try {
                Trace.endSection();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public static wx6 C(rx5 rx5Var) {
        rfd rfdVar = rx5Var.c;
        Object context = rfdVar instanceof fy5 ? ((fy5) rfdVar).b.getContext() : rx5Var.a;
        while (!(context instanceof iy6)) {
            if (!(context instanceof ContextWrapper)) {
                return null;
            }
            context = ((ContextWrapper) context).getBaseContext();
        }
        return ((iy6) context).getLifecycle();
    }

    public static void F(ArrayList arrayList) {
        if (arrayList.isEmpty()) {
            ygf.i("Unable to find any Cronet provider. Have you included all necessary jars?");
            return;
        }
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            if (!((bj2) it2.next()).a.f()) {
                it2.remove();
            }
        }
        if (arrayList.isEmpty()) {
            ygf.i("All available Cronet providers are disabled. A provider should be enabled before it can be used.");
        } else {
            Collections.sort(arrayList, new js4(14));
        }
    }

    public static boolean J(rx5 rx5Var, Bitmap.Config config) {
        if (!u36.n(config)) {
            return true;
        }
        if (!((Boolean) k40.b0(rx5Var, wx5.f)).booleanValue()) {
            return false;
        }
        rfd rfdVar = rx5Var.c;
        if (!(rfdVar instanceof fy5)) {
            return true;
        }
        ImageView imageView = ((fy5) rfdVar).b;
        return !imageView.isAttachedToWindow() || imageView.isHardwareAccelerated();
    }

    public static jrg o(Context context, Intent intent, boolean z) {
        z6f z6fVar;
        if (Log.isLoggable("FirebaseMessaging", 3)) {
            Log.d("FirebaseMessaging", "Binding to service");
        }
        synchronized (d) {
            try {
                z6fVar = e;
                if (z6fVar == null) {
                    z6fVar = new z6f(context);
                    e = z6fVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        if (!z) {
            return z6fVar.b(intent).f(new b70(1), new fm3(20));
        }
        if (n0c.N().P(context)) {
            g76.e0(context, z6fVar, intent);
        } else {
            z6fVar.b(intent);
        }
        return vp7.x(-1);
    }

    public static lig p0(isg isgVar) {
        return new lig(isgVar, 0, ejg.c(isgVar.B()));
    }

    @Override // defpackage.cs1
    public void A(SourceParameter sourceParameter, String str, boolean z) {
        switch (this.a) {
            case 12:
                throw ho2.J(sourceParameter, str, "CollectionsSearchFragment doesn't support muting collections");
            default:
                throw ho2.J(sourceParameter, str, "Mute a user is not supported in Explore screen");
        }
    }

    @Override // defpackage.cs1
    public void B(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        ru1 ru1Var = (ru1) this.b;
        n92 n92Var = null;
        if (z) {
            vx0.c0(f76.F(ru1Var), null, null, new pu1(ru1Var, str, sourceParameter, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(ru1Var), null, null, new pu1(ru1Var, str, sourceParameter, n92Var, 1), 3);
        }
    }

    public Object D(Class cls) {
        cls.getClass();
        ConcurrentHashMap concurrentHashMap = (ConcurrentHashMap) this.c;
        Object obj = concurrentHashMap.get(cls);
        if (obj != null) {
            return obj;
        }
        Object objInvoke = ((x45) this.b).invoke(cls);
        Object objPutIfAbsent = concurrentHashMap.putIfAbsent(cls, objInvoke);
        return objPutIfAbsent == null ? objInvoke : objPutIfAbsent;
    }

    public db8 H() {
        Context context = (Context) this.b;
        context.getClass();
        j15 j15VarC = ((i10) context).m().C(R.id.nav_host_fragment);
        j15VarC.getClass();
        return ((NavHostFragment) j15VarC).Y();
    }

    public boolean I(fj6 fj6Var, Object obj) {
        fj6Var.getClass();
        vl4 vl4Var = (vl4) this.c;
        return ((((Number) ((ai6) this.b).get(obj)).intValue() >>> vl4Var.a) & ((1 << vl4Var.b) - 1)) == vl4Var.c;
    }

    @Override // defpackage.jt4
    public void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        f74 f74Var = (f74) this.c;
        vx0.c0(f76.F(f74Var), null, null, new d74(f74Var, str3, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        f74 f74Var = (f74) this.c;
        f74Var.f.e(sourceParameter, str, f74Var.b, f74Var.o);
    }

    @Override // defpackage.jt4
    public void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        f74 f74Var = (f74) this.c;
        vx0.c0(f76.F(f74Var), null, null, new z64(f74Var, str, str2, sourceParameter, null, 2), 3);
    }

    @Override // defpackage.jt4
    public void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        f74 f74Var = (f74) this.c;
        vx0.c0(f76.F(f74Var), null, null, new d74(f74Var, str3, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.obe
    public /* bridge */ void P(String str, SourceParameter sourceParameter) {
        wgd.c(str, sourceParameter);
    }

    public void Q() throws IOException {
        String str = (String) this.b;
        if (((FileChannel) this.c) != null) {
            return;
        }
        try {
            File file = new File(str);
            File parentFile = file.getParentFile();
            if (parentFile != null) {
                parentFile.mkdirs();
            }
            FileChannel channel = new FileOutputStream(file).getChannel();
            this.c = channel;
            if (channel != null) {
                channel.lock();
            }
        } catch (Throwable th) {
            FileChannel fileChannel = (FileChannel) this.c;
            if (fileChannel != null) {
                fileChannel.close();
            }
            this.c = null;
            throw new IllegalStateException(ev6.x("Unable to lock file: '", str, "'."), th);
        }
    }

    @Override // defpackage.jt4
    public void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        f74 f74Var = (f74) this.c;
        vx0.c0(f76.F(f74Var), null, null, new z64(f74Var, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.jt4
    public void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        f74 f74Var = (f74) this.c;
        vx0.c0(f76.F(f74Var), null, null, new y64(f74Var, str, sourceParameter, null, 6), 3);
    }

    public void W(int i, Bundle bundle) {
        H().c(i, bundle, qb8.V(), null);
    }

    public void X(String str) {
        str.getClass();
        p13 p13Var = (p13) this.c;
        Context context = (Context) this.b;
        i03 i03Var = i03.a;
        p13Var.f(context, Uri.parse(i03.E), str);
    }

    public void Y(String str) {
        str.getClass();
        p13 p13Var = (p13) this.c;
        Context context = (Context) this.b;
        i03 i03Var = i03.a;
        p13Var.f(context, Uri.parse(i03.D), str);
    }

    public void Z(l6 l6Var) {
        o2b o2bVar = (o2b) this.b;
        ((ActionMode.Callback) o2bVar.b).onDestroyActionMode(o2bVar.i(l6Var));
        f20 f20Var = (f20) this.c;
        if (f20Var.v != null) {
            f20Var.l.getDecorView().removeCallbacks(f20Var.w);
        }
        if (f20Var.u != null) {
            jve jveVar = f20Var.x;
            if (jveVar != null) {
                jveVar.b();
            }
            jve jveVarA = ute.a(f20Var.u);
            jveVarA.a(0.0f);
            f20Var.x = jveVarA;
            jveVarA.d(new w10(2, this));
        }
        f20Var.t = null;
        ViewGroup viewGroup = f20Var.A;
        WeakHashMap weakHashMap = ute.a;
        viewGroup.requestApplyInsets();
        f20Var.I();
    }

    public boolean a0(l6 l6Var, Menu menu) {
        ViewGroup viewGroup = ((f20) this.c).A;
        WeakHashMap weakHashMap = ute.a;
        viewGroup.requestApplyInsets();
        o2b o2bVar = (o2b) this.b;
        ActionMode.Callback callback = (ActionMode.Callback) o2bVar.b;
        n2d n2dVarI = o2bVar.i(l6Var);
        aec aecVar = (aec) o2bVar.e;
        Menu py7Var = (Menu) aecVar.get(menu);
        if (py7Var == null) {
            py7Var = new py7((Context) o2bVar.c, (lx7) menu);
            aecVar.put(menu, py7Var);
        }
        return callback.onPrepareActionMode(n2dVarI, py7Var);
    }

    @Override // defpackage.j92
    public vu2 b(Set set) {
        lig ligVar = this;
        set.getClass();
        kv2 kv2Var = ((oa2) ligVar.b).C;
        String str = ((oa2) ligVar.b).r;
        String str2 = ((oa2) ligVar.b).s;
        String str3 = ((oa2) ligVar.b).w;
        String strR = ((oa2) ligVar.b).n.R();
        int iH = ((oa2) ligVar.b).n.H();
        String str4 = ((oa2) ligVar.b).x;
        String str5 = ((oa2) ligVar.b).u;
        String str6 = ((oa2) ligVar.b).t;
        rv8 rv8Var = ((oa2) ligVar.b).j;
        rv8Var.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        long jC = rv8Var.C();
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        long nanos = timeUnit.toNanos(jCurrentTimeMillis);
        long nanos2 = timeUnit.toNanos(jC);
        long j = jC - jCurrentTimeMillis;
        amd amdVar = new amd(nanos, nanos2, timeUnit.toNanos(j), j);
        y1a y1aVar = new y1a(((oa2) ligVar.b).v);
        fe8 fe8VarK0 = ((oa2) ligVar.b).h.K0();
        yp ypVar = ((oa2) ligVar.b).o;
        String strL = ypVar.l();
        String strD = ypVar.d();
        ya3 ya3VarU = ypVar.u();
        String strP = ypVar.p();
        String strM = ypVar.m();
        String strN = ypVar.n();
        String strS = ypVar.s();
        String strG = ypVar.g();
        String strI = ypVar.i();
        Integer numA = ypVar.a();
        yp ypVar2 = ((oa2) ligVar.b).o;
        va3 va3Var = new va3(strL, strD, strP, ya3VarU, strM, strN, strG, strS, strI, numA, new g67(ypVar2.k(), ypVar2.j(), ypVar2.e()), ypVar.b(), ypVar.t(), ypVar.o());
        zae zaeVarI = ((oa2) ligVar.b).l.i();
        ((oa2) ligVar.b).m.getClass();
        tqd tqdVarD = ((oa2) ligVar.b).k.d();
        String str7 = ((oa2) ligVar.b).D;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Iterator it2 = set.iterator();
        while (it2.hasNext()) {
            String str8 = str7;
            String str9 = (String) it2.next();
            kv2 kv2Var2 = kv2Var;
            yu2 yu2Var = (yu2) ((f70) ligVar.c).b;
            str9.getClass();
            String str10 = str;
            Map map = (Map) new wu2(yu2Var, 0, str9).call();
            if (!map.isEmpty()) {
                linkedHashMap.put(str9, map);
            }
            ligVar = this;
            kv2Var = kv2Var2;
            str7 = str8;
            str = str10;
        }
        return new vu2(kv2Var, str, str2, str3, strR, iH, str4, str6, str5, amdVar, y1aVar, fe8VarK0, va3Var, zaeVarI, tqdVarD, str7, linkedHashMap);
    }

    @Override // defpackage.jx3
    public Object d() {
        return (p1e) this.b;
    }

    @Override // defpackage.i41
    public void f(v31 v31Var, zcb zcbVar) {
        ((Executor) ((kn7) this.c).c).execute(new ss(this, (i41) this.b, zcbVar, 4));
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0083 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00ce  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x004b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.ew8 h0(defpackage.rx5 r19, defpackage.cfc r20) {
        /*
            Method dump skipped, instruction units count: 231
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lig.h0(rx5, cfc):ew8");
    }

    @Override // defpackage.jx3
    public boolean i(CharSequence charSequence, int i, int i2, byd bydVar) {
        if ((bydVar.c & 4) > 0) {
            return true;
        }
        if (((p1e) this.b) == null) {
            this.b = new p1e(charSequence instanceof Spannable ? (Spannable) charSequence : new SpannableString(charSequence));
        }
        ((no3) this.c).getClass();
        ((p1e) this.b).setSpan(new cyd(bydVar), i, i2, 33);
        return true;
    }

    public jrg k0(final Intent intent) {
        String stringExtra = intent.getStringExtra("gcm.rawData64");
        if (stringExtra != null) {
            intent.putExtra("rawData", Base64.decode(stringExtra, 0));
            intent.removeExtra("gcm.rawData64");
        }
        final Context context = (Context) this.b;
        b70 b70Var = (b70) this.c;
        boolean z = gq7.D() && context.getApplicationInfo().targetSdkVersion >= 26;
        final boolean z2 = (intent.getFlags() & 268435456) != 0;
        return (!z || z2) ? vp7.j(b70Var, new wu2(context, 2, intent)).g(b70Var, new o92() { // from class: ba4
            @Override // defpackage.o92
            public final Object m0(jrg jrgVar) {
                return (gq7.D() && ((Integer) jrgVar.i()).intValue() == 402) ? lig.o(context, intent, z2).f(new b70(1), new fm3(19)) : jrgVar;
            }
        }) : o(context, intent, z2);
    }

    public f52 m0(mn6 mn6Var, e5a e5aVar, p98 p98Var) {
        e5aVar.getClass();
        p98Var.getClass();
        boolean zBooleanValue = cm4.P.d(e5aVar.m).booleanValue();
        d5a d5aVar = e5aVar.c;
        switch (d5aVar == null ? -1 : ay.a[d5aVar.ordinal()]) {
            case 1:
                byte b = (byte) e5aVar.d;
                return zBooleanValue ? new yyd(b) : new i21(b);
            case 2:
                return new uk1(Character.valueOf((char) e5aVar.d));
            case 3:
                short s = (short) e5aVar.d;
                return zBooleanValue ? new yyd(s) : new k8c(s);
            case 4:
                int i = (int) e5aVar.d;
                return zBooleanValue ? new yyd(i) : new u46(i);
            case 5:
                long j = e5aVar.d;
                return zBooleanValue ? new yyd(j) : new bb7(j);
            case 6:
                return new vt0(e5aVar.e);
            case 7:
                return new vt0(e5aVar.f);
            case 8:
                return new vt0(Boolean.valueOf(e5aVar.d != 0));
            case 9:
                return new kuc(p98Var.getString(e5aVar.g));
            case 10:
                return new hh6(vn7.z(p98Var, e5aVar.h), e5aVar.l);
            case 11:
                return new r04(vn7.z(p98Var, e5aVar.h), n98.d(p98Var.getString(e5aVar.i)));
            case 12:
                h5a h5aVar = e5aVar.j;
                h5aVar.getClass();
                return new jy((Object) s(h5aVar, p98Var));
            case 13:
                List<e5a> list = e5aVar.k;
                list.getClass();
                ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
                for (e5a e5aVar2 : list) {
                    hec hecVarE = ((b38) this.b).e().e();
                    e5aVar2.getClass();
                    arrayList.add(m0(hecVarE, e5aVar2, p98Var));
                }
                return new rxd(arrayList, mn6Var);
            default:
                throw new IllegalStateException(("Unsupported annotation argument type: " + e5aVar.c + " (expected " + mn6Var + ')').toString());
        }
    }

    public uid n(List list) throws IOException {
        fp3 fp3Var;
        fp3 fp3Var2 = null;
        try {
            int size = list.size();
            int i = 0;
            fp3 fp3Var3 = null;
            while (i < size) {
                try {
                    fp3Var = (fp3) list.get(i);
                } catch (Exception e2) {
                    e = e2;
                    fp3Var2 = fp3Var3;
                }
                try {
                    fp3Var.a((mu3) this.c);
                    i++;
                    fp3Var3 = fp3Var;
                } catch (Exception e3) {
                    e = e3;
                    fp3Var2 = fp3Var;
                    StringBuilder sb = new StringBuilder();
                    StringBuilder sb2 = new StringBuilder("Error while applying EditCommand batch to buffer (length=");
                    sb2.append(((mu3) this.c).a.l());
                    sb2.append(", composition=");
                    sb2.append(((mu3) this.c).c());
                    sb2.append(", selection=");
                    mu3 mu3Var = (mu3) this.c;
                    sb2.append((Object) bkd.h(lk7.q(mu3Var.b, mu3Var.c)));
                    sb2.append("):");
                    sb.append(sb2.toString());
                    sb.append('\n');
                    bu1.E0(list, sb, "\n", null, null, new s0(fp3Var2, this), 60);
                    throw new RuntimeException(sb.toString(), e);
                }
            }
            mu3 mu3Var2 = (mu3) this.c;
            mu3Var2.getClass();
            mx mxVar = new mx(mu3Var2.a.toString());
            mu3 mu3Var3 = (mu3) this.c;
            long jQ = lk7.q(mu3Var3.b, mu3Var3.c);
            bkd bkdVar = bkd.g(((uid) this.b).b) ? null : new bkd(jQ);
            uid uidVar = new uid(mxVar, bkdVar != null ? bkdVar.a : lk7.q(bkd.e(jQ), bkd.f(jQ)), ((mu3) this.c).c());
            this.b = uidVar;
            return uidVar;
        } catch (Exception e4) {
            e = e4;
        }
    }

    public void n0(int i, int i2, int i3, int i4) {
        CardView cardView = (CardView) this.c;
        cardView.d.set(i, i2, i3, i4);
        Rect rect = cardView.c;
        super/*android.widget.FrameLayout*/.setPadding(i + rect.left, i2 + rect.top, i3 + rect.right, i4 + rect.bottom);
    }

    public ew8 o0(ew8 ew8Var) {
        boolean z;
        r84 r84Var = ew8Var.j;
        q84 q84Var = wx5.b;
        if (!u36.n((Bitmap.Config) k40.c0(ew8Var, q84Var)) || ((ni5) this.c).M()) {
            z = false;
        } else {
            r84Var.getClass();
            LinkedHashMap linkedHashMapY = ei7.Y(r84Var.a);
            Bitmap.Config config = Bitmap.Config.ARGB_8888;
            if (config != null) {
                linkedHashMapY.put(q84Var, config);
            } else {
                linkedHashMapY.remove(q84Var);
            }
            r84Var = new r84(nk7.A0(linkedHashMapY));
            z = true;
        }
        return z ? new ew8(ew8Var.a, ew8Var.b, ew8Var.c, ew8Var.d, ew8Var.e, ew8Var.f, ew8Var.g, ew8Var.h, ew8Var.i, r84Var) : ew8Var;
    }

    @Override // defpackage.cs1
    public void p(String str, SourceParameter sourceParameter) {
        int i = this.a;
        str.getClass();
        switch (i) {
            case 12:
                ru1 ru1Var = (ru1) this.b;
                vx0.c0(f76.F(ru1Var), null, null, new r91(ru1Var, str, null, 9), 3);
                ((htb) ((gub) this.c).b).a(str, sourceParameter);
                break;
            default:
                ExploreFragment exploreFragment = ((b64) this.b).a;
                ((p13) exploreFragment.Z()).Q(exploreFragment.S(), str, gp7.u(sourceParameter));
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x00f7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.zx s(defpackage.h5a r11, defpackage.p98 r12) {
        /*
            Method dump skipped, instruction units count: 261
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lig.s(h5a, p98):zx");
    }

    public boolean u(f52 f52Var, mn6 mn6Var, e5a e5aVar) {
        b38 b38Var = (b38) this.b;
        d5a d5aVar = e5aVar.c;
        int i = d5aVar == null ? -1 : ay.a[d5aVar.ordinal()];
        if (i != 10) {
            if (i != 13) {
                return g76.L(f52Var.a(b38Var), mn6Var);
            }
            if (f52Var instanceof g80) {
                Object obj = ((g80) f52Var).a;
                if (((List) obj).size() == e5aVar.k.size()) {
                    mn6 mn6VarG = b38Var.e().g(mn6Var);
                    if (mn6VarG != null) {
                        Iterable iterableJ = d46.J((Collection) obj);
                        if ((iterableJ instanceof Collection) && ((Collection) iterableJ).isEmpty()) {
                            return true;
                        }
                        Iterator it2 = iterableJ.iterator();
                        while (((m46) it2).c) {
                            int iNextInt = ((g46) it2).nextInt();
                            f52 f52Var2 = (f52) ((List) obj).get(iNextInt);
                            e5a e5aVar2 = (e5a) e5aVar.k.get(iNextInt);
                            e5aVar2.getClass();
                            if (!u(f52Var2, mn6VarG, e5aVar2)) {
                            }
                        }
                        return true;
                    }
                }
            }
            lg8.m("Deserialized ArrayValue should have the same number of elements as the original array value: ", f52Var);
            return false;
        }
        co1 co1VarA = mn6Var.j0().a();
        y28 y28Var = co1VarA instanceof y28 ? (y28) co1VarA : null;
        if (y28Var == null) {
            return true;
        }
        n98 n98Var = vm6.e;
        if (vm6.b(y28Var, lnc.Q)) {
            return true;
        }
        return false;
    }

    @Override // defpackage.i41
    public void w(v31 v31Var, Throwable th) {
        ((Executor) ((kn7) this.c).c).execute(new ss(this, (i41) this.b, th, 5));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object x(boolean r6, defpackage.p92 r7) {
        /*
            r5 = this;
            boolean r0 = r7 instanceof defpackage.md4
            if (r0 == 0) goto L13
            r0 = r7
            md4 r0 = (defpackage.md4) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            md4 r0 = new md4
            r0.<init>(r5, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r7)
            goto L3f
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r7)
            nd4 r7 = new nd4
            r7.<init>(r5, r6, r3)
            r0.d = r4
            java.lang.Object r7 = defpackage.o7f.s(r7, r0)
            if (r7 != r1) goto L3f
            return r1
        L3f:
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r5 = r7.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lig.x(boolean, p92):java.lang.Object");
    }

    @Override // defpackage.cs1
    public void y(String str, SourceParameter sourceParameter) {
        int i = this.a;
        str.getClass();
        switch (i) {
            case 12:
                ru1 ru1Var = (ru1) this.b;
                if (ru1Var.p.add(str)) {
                    ru1Var.g.g(str, ru1Var.b, gp7.u(sourceParameter), ru1Var.n);
                }
                break;
            default:
                f74 f74Var = (f74) this.c;
                if (f74Var.y.add(str)) {
                    f74Var.m.x0(str, f74Var.b, gp7.u(sourceParameter), f74Var.o);
                }
                break;
        }
    }

    @Override // defpackage.v0d
    public jrg z(Object obj) {
        Boolean bool = (Boolean) obj;
        jc2 jc2Var = (jc2) this.c;
        if (bool.booleanValue()) {
            if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                Log.d("FirebaseCrashlytics", "Sending cached crash reports...", null);
            }
            boolean zBooleanValue = bool.booleanValue();
            ft2 ft2Var = jc2Var.b;
            if (zBooleanValue) {
                ((wfd) ft2Var.e).d(null);
                return ((jrg) this.b).l((ud2) jc2Var.e.b, new pkf(this));
            }
            ygf.f("An invalid data collection token was used.");
            return null;
        }
        if (Log.isLoggable("FirebaseCrashlytics", 2)) {
            Log.v("FirebaseCrashlytics", "Deleting cached crash reports...", null);
        }
        bh4 bh4Var = jc2Var.g;
        Iterator it2 = bh4.f(((File) bh4Var.c).listFiles(jc2.r)).iterator();
        while (it2.hasNext()) {
            ((File) it2.next()).delete();
        }
        bh4 bh4Var2 = ((sd2) jc2Var.m.c).b;
        sd2.a(bh4.f(((File) bh4Var2.e).listFiles()));
        sd2.a(bh4.f(((File) bh4Var2.f).listFiles()));
        sd2.a(bh4.f(((File) bh4Var2.g).listFiles()));
        jc2Var.q.d(null);
        return vp7.x(null);
    }

    /* JADX WARN: Code restructure failed: missing block: B:145:0x020a, code lost:
    
        continue;
     */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0110 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0109 A[Catch: IOException -> 0x0091, XmlPullParserException -> 0x0094, TryCatch #2 {IOException -> 0x0091, XmlPullParserException -> 0x0094, blocks: (B:20:0x0062, B:97:0x020a, B:28:0x0074, B:29:0x0082, B:31:0x0087, B:38:0x0097, B:46:0x00b1, B:41:0x00a0, B:44:0x00a9, B:47:0x00bf, B:51:0x00ce, B:53:0x00d6, B:54:0x00e0, B:63:0x0109, B:64:0x0110, B:65:0x0128, B:57:0x00e9, B:59:0x00f1, B:60:0x00ff, B:66:0x0129, B:68:0x0131, B:69:0x013f, B:72:0x0149, B:73:0x0154, B:74:0x016c, B:75:0x016d, B:78:0x0177, B:79:0x0182, B:80:0x019a, B:81:0x019b, B:83:0x01a3, B:84:0x01ac, B:87:0x01b6, B:88:0x01c0, B:89:0x01d8, B:90:0x01d9, B:93:0x01e4, B:94:0x01ee, B:95:0x0206, B:96:0x0207), top: B:105:0x0062 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void i0(android.content.Context r12, android.content.res.XmlResourceParser r13) {
        /*
            Method dump skipped, instruction units count: 608
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lig.i0(android.content.Context, android.content.res.XmlResourceParser):void");
    }

    public x54 r() {
        Method method;
        d46 d46Var = (d46) this.c;
        JSONObject jSONObject = null;
        try {
            try {
                method = d46Var.getClass().getClassLoader().loadClass("org.chromium.net.impl.ImplVersion").getMethod("getApiLevel", null);
            } catch (ReflectiveOperationException e2) {
                lg8.p(QFTsJPDEnO.RqOpwXhYA, e2);
                return null;
            }
        } catch (ClassNotFoundException | NoSuchMethodException unused) {
            method = null;
        }
        int iIntValue = method == null ? -1 : ((Integer) method.invoke(null, null)).intValue();
        if (iIntValue != -1 && iIntValue < 40) {
            Log.w("CronetEngine.Builder", "The implementation version is lower than the API version. Calls to methods added in API " + (iIntValue + 1) + " and newer will likely have no effect.");
        }
        ArrayList arrayList = (ArrayList) this.b;
        if (!arrayList.isEmpty()) {
            jSONObject = new JSONObject();
            Iterator it2 = arrayList.iterator();
            if (it2.hasNext()) {
                throw ev6.q(it2);
            }
        }
        if (jSONObject != null) {
            d46Var.d0(jSONObject.toString());
        }
        return d46Var.v();
    }

    public /* synthetic */ lig(Object obj, int i, Object obj2) {
        this.a = i;
        this.c = obj;
        this.b = obj2;
    }

    public /* synthetic */ lig(Object obj, Object obj2, boolean z, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    public lig(sb2 sb2Var, ex2 ex2Var, o08 o08Var) {
        this.a = 9;
        sb2Var.getClass();
        ex2Var.getClass();
        o08Var.getClass();
        this.b = ex2Var;
        this.c = o08Var;
    }

    public lig(f64 f64Var) {
        this.a = 27;
        this.b = f64Var;
        this.c = k40.x(0, 7, null);
    }

    public lig(ou2 ou2Var) {
        this.a = 21;
        this.b = ou2Var;
        this.c = new ConcurrentHashMap();
    }

    public lig(x45 x45Var) {
        this.a = 13;
        this.b = x45Var;
        this.c = new ConcurrentHashMap();
    }

    public lig(Context context, p13 p13Var) {
        this.a = 20;
        i03 i03Var = i03.a;
        context.getClass();
        this.b = context;
        this.c = p13Var;
    }

    public lig(ai6 ai6Var, vl4 vl4Var) {
        this.a = 10;
        this.b = ai6Var;
        this.c = vl4Var;
        if (vl4Var.b == 1 && vl4Var.c == 1) {
            return;
        }
        ywb.g(y30.o("BooleanFlagDelegate can work only with boolean flags (bitWidth = 1 and value = 1), but ", vl4Var, " was passed"));
        throw null;
    }

    public lig(String str) {
        this.a = 28;
        this.b = str.concat(".lck");
    }

    public lig(b38 b38Var, n0c n0cVar) {
        this.a = 6;
        b38Var.getClass();
        n0cVar.getClass();
        this.b = b38Var;
        this.c = n0cVar;
    }

    public lig(kva kvaVar) {
        Object xy5Var;
        this.a = 4;
        this.b = kvaVar;
        int i = Build.VERSION.SDK_INT;
        if (i < 26) {
            boolean z = oi5.a;
        } else {
            if (!oi5.a) {
                if (i != 26 && i != 27) {
                    xy5Var = new xy5(true);
                } else {
                    xy5Var = new xsa(18);
                }
            }
            this.c = xy5Var;
        }
        xy5Var = new xy5(false);
        this.c = xy5Var;
    }

    public lig(Context context, int i) {
        this.a = i;
        switch (i) {
            case 23:
                this.b = context;
                this.c = null;
                break;
            default:
                this.b = context;
                this.c = new b70(1);
                break;
        }
    }

    public lig(nig nigVar, HashMap map, HashMap map2) {
        this.a = 2;
        this.b = nigVar;
        this.c = map;
    }

    public lig(d46 d46Var) {
        this.a = 16;
        this.b = new ArrayList();
        this.c = d46Var;
    }

    public lig() {
        this.a = 5;
        this.b = Choreographer.getInstance();
        this.c = Looper.myLooper();
    }

    public lig(CardView cardView) {
        this.a = 11;
        this.c = cardView;
    }

    public /* synthetic */ lig(int i) {
        this.a = i;
    }
}
