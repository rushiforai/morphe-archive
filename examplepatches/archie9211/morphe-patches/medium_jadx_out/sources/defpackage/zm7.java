package defpackage;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.BadParcelableException;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.media.session.MediaSessionCompat$Token;
import android.support.v4.media.session.a;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import androidx.media.session.MediaButtonReceiver;
import androidx.profileinstaller.ProfileInstallReceiver;
import androidx.recyclerview.widget.RecyclerView;
import com.apollographql.apollo.exception.ApolloGraphQLException;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.common.post.mixtape.ParagraphEditMixtapeLayout;
import com.medium.android.core.models.EntityType;
import com.medium.android.donkey.audio.AudioService;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.followsubscribemodal.FollowSubscribeModalFragment;
import gen.model.SourceParameter;
import j$.util.DesugarCollections;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CancellationException;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class zm7 implements jt4, dec, d19, c8, th3, u2a, fc3 {
    public static int c;
    public static final zm7 d = new zm7(1, new float[]{0.8951f, -0.7502f, 0.0389f, 0.2664f, 1.7135f, -0.0685f, -0.1614f, 0.0367f, 1.0296f});
    public final /* synthetic */ int a;
    public Object b;

    public zm7(AudioService audioService) {
        PendingIntent broadcast;
        wm7 wm7Var;
        this.a = 0;
        new ArrayList();
        if (TextUtils.isEmpty("audioservice")) {
            ay0.e("tag must not be null or empty");
            throw null;
        }
        ComponentName componentNameB = MediaButtonReceiver.b(audioService);
        if (componentNameB == null) {
            Log.w("MediaSessionCompat", "Couldn't find a unique registered media button receiver in the given context.");
        }
        if (componentNameB != null) {
            Intent intent = new Intent("android.intent.action.MEDIA_BUTTON");
            intent.setComponent(componentNameB);
            broadcast = PendingIntent.getBroadcast(audioService, 0, intent, Build.VERSION.SDK_INT >= 31 ? 33554432 : 0);
        } else {
            broadcast = null;
        }
        int i = Build.VERSION.SDK_INT;
        if (i >= 29) {
            wm7Var = new ym7(audioService);
            this.b = wm7Var;
        } else if (i >= 28) {
            wm7Var = new xm7(audioService);
            this.b = wm7Var;
        } else {
            wm7Var = new wm7(audioService);
            this.b = wm7Var;
        }
        wm7 wm7Var2 = wm7Var;
        Handler handler = new Handler(Looper.myLooper() != null ? Looper.myLooper() : Looper.getMainLooper());
        ms msVar = new ms();
        msVar.c = new Object();
        msVar.d = new vm7(msVar);
        msVar.b = new WeakReference(null);
        synchronized (wm7Var.d) {
            wm7Var.f = msVar;
            wm7Var.a.setCallback((vm7) msVar.d, handler);
            msVar.e(wm7Var, handler);
        }
        wm7Var.a.setMediaButtonReceiver(broadcast);
        MediaSessionCompat$Token mediaSessionCompat$Token = wm7Var2.c;
        if (mediaSessionCompat$Token == null) {
            ay0.e("sessionToken must not be null");
            throw null;
        }
        DesugarCollections.synchronizedSet(new HashSet());
        if (i >= 29) {
            new sl7(audioService, mediaSessionCompat$Token);
        } else {
            new a(audioService, mediaSessionCompat$Token);
        }
        if (c == 0) {
            c = (int) (TypedValue.applyDimension(1, 320.0f, audioService.getResources().getDisplayMetrics()) + 0.5f);
        }
    }

    public static Bundle W(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        w(bundle);
        try {
            bundle.isEmpty();
            return bundle;
        } catch (BadParcelableException unused) {
            Log.e("MediaSessionCompat", "Could not unparcel the data.");
            return null;
        }
    }

    public static void w(Bundle bundle) {
        if (bundle != null) {
            bundle.setClassLoader(zm7.class.getClassLoader());
        }
    }

    @Override // defpackage.u2a
    public void B() {
        Log.d("ProfileInstaller", "DIAGNOSTIC_PROFILE_IS_COMPRESSED");
    }

    /* JADX WARN: Removed duplicated region for block: B:82:0x011e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.dx7 C(defpackage.rx5 r16, defpackage.cx7 r17, defpackage.cfc r18, defpackage.dqb r19) {
        /*
            Method dump skipped, instruction units count: 315
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zm7.C(rx5, cx7, cfc, dqb):dx7");
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x00a4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.cx7 D(defpackage.rx5 r8, java.lang.Object r9, defpackage.ew8 r10, defpackage.z46 r11) {
        /*
            Method dump skipped, instruction units count: 276
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zm7.D(rx5, java.lang.Object, ew8, z46):cx7");
    }

    public y28 F(q0b q0bVar) {
        js6 js6Var;
        y05 y05VarC = q0bVar.c();
        if (y05VarC != null && xy6.SOURCE == null) {
            return null;
        }
        Class<?> declaringClass = q0bVar.a.getDeclaringClass();
        q0b q0bVar2 = declaringClass != null ? new q0b(declaringClass) : null;
        if (q0bVar2 != null) {
            y28 y28VarF = F(q0bVar2);
            ev7 ev7VarL0 = y28VarF != null ? y28VarF.l0() : null;
            co1 co1VarD = ev7VarL0 != null ? ev7VarL0.d(q0bVar.e(), ng8.FROM_JAVA_LOADER) : null;
            if (co1VarD instanceof y28) {
                return (y28) co1VarD;
            }
        } else if (y05VarC != null && (js6Var = (js6) bu1.z0(d46.Q(((ks6) this.b).c(y05VarC.b())))) != null) {
            ps6 ps6Var = js6Var.k.d;
            ps6Var.getClass();
            return ps6Var.v(q0bVar.e(), q0bVar);
        }
        return null;
    }

    public void H() {
        o78 o78Var = (o78) this.b;
        n46 n46VarW = iq7.W(0, o78Var.c);
        int i = n46VarW.a;
        int i2 = n46VarW.b;
        if (i <= i2) {
            while (true) {
                ((g82) o78Var.a[i]).b.resumeWith(c1e.a);
                if (i == i2) {
                    break;
                } else {
                    i++;
                }
            }
        }
        o78Var.i();
    }

    public boolean I(cx7 cx7Var, rx5 rx5Var, xy3 xy3Var) {
        pva pvaVarD;
        if (cx7Var == null || !rx5Var.j.getWriteEnabled() || !xy3Var.a.c() || (pvaVarD = ((kva) this.b).d()) == null) {
            return false;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        linkedHashMap.put("coil#is_sampled", Boolean.valueOf(xy3Var.b));
        String str = xy3Var.d;
        if (str != null) {
            linkedHashMap.put("coil#disk_cache_key", str);
        }
        ew5 ew5Var = xy3Var.a;
        Map mapA0 = nk7.A0(linkedHashMap);
        synchronized (pvaVarD.c) {
            long jE = ew5Var.e();
            if (jE < 0) {
                throw new IllegalStateException(("Image size must be non-negative: " + jE).toString());
            }
            pvaVarD.a.d(cx7Var, ew5Var, mapA0, jE);
        }
        return true;
    }

    @Override // defpackage.c8
    /* JADX INFO: renamed from: J, reason: merged with bridge method [inline-methods] */
    public void toJson(ae6 ae6Var, yl2 yl2Var, List list) {
        yl2Var.getClass();
        list.getClass();
        ae6Var.n();
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            ((c8) this.b).toJson(ae6Var, yl2Var, it2.next());
        }
        ae6Var.k();
    }

    @Override // defpackage.jt4
    public void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        sw9 sw9Var = ((cv9) this.b).a;
        sw9Var.l.e(str3, sw9Var.d, gp7.u(sourceParameter), sw9Var.D0);
        sw9Var.G(str3, EntityType.AUTHOR, str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.jt4
    public void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        sw9 sw9Var = ((cv9) this.b).a;
        if (sw9Var.r0) {
            return;
        }
        sw9Var.r0 = true;
        sw9Var.l.i(str, sw9Var.d, gp7.u(sourceParameter), sw9Var.D0);
    }

    @Override // defpackage.jt4
    public void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        sw9 sw9Var = ((cv9) this.b).a;
        vx0.c0(f76.F(sw9Var), null, null, new fs9(sw9Var, str2, str, sourceParameter, null, 6), 3);
    }

    @Override // defpackage.jt4
    public void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        sw9 sw9Var = ((cv9) this.b).a;
        sw9Var.l.d(str3, sw9Var.d, gp7.u(sourceParameter), sw9Var.D0);
        sw9Var.v(str3, EntityType.AUTHOR, str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.u2a
    public void Q(int i, Object obj) {
        String str;
        switch (i) {
            case 1:
                str = "RESULT_INSTALL_SUCCESS";
                break;
            case 2:
                str = "RESULT_ALREADY_INSTALLED";
                break;
            case 3:
                str = "RESULT_UNSUPPORTED_ART_VERSION";
                break;
            case 4:
                str = "RESULT_NOT_WRITABLE";
                break;
            case 5:
                str = "RESULT_DESIRED_FORMAT_UNSUPPORTED";
                break;
            case 6:
                str = "RESULT_BASELINE_PROFILE_NOT_FOUND";
                break;
            case 7:
                str = "RESULT_IO_EXCEPTION";
                break;
            case 8:
                str = "RESULT_PARSE_EXCEPTION";
                break;
            case 9:
            default:
                str = "";
                break;
            case 10:
                str = "RESULT_INSTALL_SKIP_FILE_SUCCESS";
                break;
            case 11:
                str = "RESULT_DELETE_SKIP_FILE_SUCCESS";
                break;
        }
        if (i == 6 || i == 7 || i == 8) {
            Log.e("ProfileInstaller", str, (Throwable) obj);
        } else {
            Log.d("ProfileInstaller", str);
        }
        ((ProfileInstallReceiver) this.b).setResultCode(i);
    }

    @Override // defpackage.jt4
    public void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        sw9 sw9Var = ((cv9) this.b).a;
        vx0.c0(f76.F(sw9Var), null, null, new fs9(sw9Var, str2, str, sourceParameter, null, 5), 3);
    }

    @Override // defpackage.jt4
    public void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        sw9 sw9Var = ((cv9) this.b).a;
        vx0.c0(f76.F(sw9Var), null, null, new gs9(sw9Var, str, sourceParameter, null, 9), 3);
    }

    public void X(int i, boolean z) {
        ((aq1) this.b).n(i, z);
    }

    public void Y(int i, f21 f21Var) {
        ((aq1) this.b).p(i, f21Var);
    }

    public void Z(double d2, int i) {
        aq1 aq1Var = (aq1) this.b;
        aq1Var.getClass();
        aq1Var.t(i, Double.doubleToRawLongBits(d2));
    }

    public void a0(int i, int i2) {
        ((aq1) this.b).v(i, i2);
    }

    @Override // defpackage.th3
    public n33 b() {
        return (o33) this.b;
    }

    @Override // defpackage.fc3
    public boolean d(float f) {
        int i;
        int i2;
        RecyclerView recyclerView = (RecyclerView) this.b;
        if (recyclerView.n.e()) {
            i2 = (int) f;
            i = 0;
        } else if (recyclerView.n.d()) {
            i = (int) f;
            i2 = 0;
        } else {
            i = 0;
            i2 = 0;
        }
        if (i == 0 && i2 == 0) {
            return false;
        }
        recyclerView.m0();
        return recyclerView.H(i, i2, 0, Integer.MAX_VALUE);
    }

    @Override // defpackage.fc3
    public float f() {
        float f;
        RecyclerView recyclerView = (RecyclerView) this.b;
        if (recyclerView.n.e()) {
            f = recyclerView.p0;
        } else {
            if (!recyclerView.n.d()) {
                return 0.0f;
            }
            f = recyclerView.o0;
        }
        return -f;
    }

    public void h0(int i, int i2) {
        ((aq1) this.b).r(i, i2);
    }

    @Override // defpackage.d19
    public void i(ParagraphEditMixtapeLayout paragraphEditMixtapeLayout) {
        EditPostBodyView editPostBodyView = (EditPostBodyView) this.b;
        int iD = editPostBodyView.d(paragraphEditMixtapeLayout);
        Integer numValueOf = Integer.valueOf(iD);
        if (iD == -1) {
            numValueOf = null;
        }
        if (numValueOf != null) {
            editPostBodyView.p(numValueOf.intValue());
        }
    }

    public void i0(int i, long j) {
        ((aq1) this.b).t(i, j);
    }

    public void k0(int i, float f) {
        aq1 aq1Var = (aq1) this.b;
        aq1Var.getClass();
        aq1Var.r(i, Float.floatToRawIntBits(f));
    }

    @Override // defpackage.dec
    public void lock() {
        ((ReentrantLock) this.b).lock();
    }

    public void m0(int i, Object obj, brb brbVar) {
        aq1 aq1Var = (aq1) this.b;
        aq1Var.C(i, 3);
        brbVar.i((cz7) obj, aq1Var.a);
        aq1Var.C(i, 4);
    }

    @Override // defpackage.fc3
    public void n() {
        ((RecyclerView) this.b).m0();
    }

    public void n0(int i, int i2) {
        ((aq1) this.b).v(i, i2);
    }

    public at2 o() {
        Context context = (Context) this.b;
        if (context == null) {
            throw new IllegalStateException(Context.class.getCanonicalName() + " must be set");
        }
        at2 at2Var = new at2();
        at2Var.a = zi3.a(sgg.j);
        int i = 1;
        ng2 ng2Var = new ng2(i, context);
        at2Var.b = ng2Var;
        int i2 = 0;
        at2Var.c = zi3.a(new qz7(ng2Var, new ng2(i2, ng2Var), i2));
        ng2 ng2Var2 = at2Var.b;
        at2Var.d = new s34(ng2Var2, i);
        g8a g8aVarA = zi3.a(new qz7(at2Var.d, zi3.a(new s34(ng2Var2, i2)), i));
        at2Var.e = g8aVarA;
        u44 u44Var = new u44(i);
        ng2 ng2Var3 = at2Var.b;
        arb arbVar = new arb(ng2Var3, g8aVarA, u44Var, i2);
        g8a g8aVar = at2Var.a;
        g8a g8aVar2 = at2Var.c;
        at2Var.f = zi3.a(new arb(new t13(g8aVar, g8aVar2, arbVar, g8aVarA, g8aVarA), new s6e(ng2Var3, g8aVar2, g8aVarA, arbVar, g8aVar, g8aVarA, g8aVarA), new l7f(g8aVar, g8aVarA, arbVar, g8aVarA), i));
        return at2Var;
    }

    public void o0(int i, long j) {
        ((aq1) this.b).F(i, j);
    }

    public void p0(int i, Object obj, brb brbVar) {
        ((aq1) this.b).y(i, (cz7) obj, brbVar);
    }

    public void r(CancellationException cancellationException) {
        o78 o78Var = (o78) this.b;
        int i = o78Var.c;
        w51[] w51VarArr = new w51[i];
        for (int i2 = 0; i2 < i; i2++) {
            w51VarArr[i2] = ((g82) o78Var.a[i2]).b;
        }
        for (int i3 = 0; i3 < i; i3++) {
            w51VarArr[i3].l(cancellationException);
        }
        if (o78Var.c == 0) {
            return;
        }
        e26.c("uncancelled requests present");
    }

    public void s(String str) {
        FollowSubscribeModalFragment followSubscribeModalFragment = (FollowSubscribeModalFragment) this.b;
        ahc.h(((MainActivity) followSubscribeModalFragment.Q()).u(), str, -1).j();
        k40.X(followSubscribeModalFragment).f();
    }

    public void s0(int i, int i2) {
        ((aq1) this.b).r(i, i2);
    }

    public void t0(int i, long j) {
        ((aq1) this.b).t(i, j);
    }

    public String toString() {
        switch (this.a) {
            case 1:
                return "Bradford";
            default:
                return super.toString();
        }
    }

    public synchronized void u(hmb hmbVar) {
        hmbVar.getClass();
        ((LinkedHashSet) this.b).remove(hmbVar);
    }

    public void u0(int i, int i2) {
        ((aq1) this.b).D(i, (i2 >> 31) ^ (i2 << 1));
    }

    @Override // defpackage.dec
    public void unlock() {
        ((ReentrantLock) this.b).unlock();
    }

    public void v0(int i, long j) {
        ((aq1) this.b).F(i, (j >> 63) ^ (j << 1));
    }

    public void w0(int i, int i2) {
        ((aq1) this.b).D(i, i2);
    }

    public rz2 x(mn1 mn1Var, zz7 zz7Var) {
        Class<?> cls;
        h1b h1bVarF;
        mn1Var.getClass();
        zz7Var.getClass();
        String strK = tuc.K(mn1Var.b.a.a, '.', '$');
        y05 y05Var = mn1Var.a;
        if (!y05Var.a.c()) {
            strK = y05Var + '.' + strK;
        }
        try {
            cls = Class.forName(strK, false, (ClassLoader) this.b);
        } catch (ClassNotFoundException unused) {
            cls = null;
        }
        if (cls == null || (h1bVarF = mo7.F(cls)) == null) {
            return null;
        }
        return new rz2(26, h1bVarF);
    }

    public void x0(int i, long j) {
        ((aq1) this.b).F(i, j);
    }

    @Override // defpackage.c8
    /* JADX INFO: renamed from: z, reason: merged with bridge method [inline-methods] */
    public ArrayList fromJson(fd6 fd6Var, yl2 yl2Var) {
        ArrayList arrayListE = ev6.E(fd6Var);
        while (fd6Var.hasNext()) {
            try {
                arrayListE.add(((c8) this.b).fromJson(fd6Var, yl2Var));
            } catch (ApolloGraphQLException e) {
                while (fd6Var.hasNext()) {
                    fd6Var.v();
                }
                fd6Var.k();
                throw e;
            }
        }
        fd6Var.k();
        return arrayListE;
    }

    public zm7(kva kvaVar, lig ligVar) {
        this.a = 20;
        this.b = kvaVar;
    }

    public zm7(c8 c8Var) {
        this.a = 18;
        c8Var.getClass();
        this.b = c8Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0028 A[PHI: r11
      0x0028: PHI (r11v1 int) = (r11v0 int), (r11v3 int) binds: [B:5:0x0019, B:11:0x0024] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0033  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public zm7(int[] r23, float[] r24, float[][] r25) {
        /*
            r22 = this;
            r0 = r22
            r1 = r24
            r2 = 4
            r0.a = r2
            r0.<init>()
            int r3 = r1.length
            r4 = 1
            int r3 = r3 - r4
            a70[][] r5 = new defpackage.a70[r3][]
            r6 = 0
            r8 = r4
            r9 = r8
            r7 = r6
        L13:
            if (r7 >= r3) goto L6b
            r10 = r23[r7]
            r11 = 3
            r12 = 2
            if (r10 == 0) goto L28
            if (r10 == r4) goto L33
            if (r10 == r12) goto L31
            if (r10 == r11) goto L2c
            if (r10 == r2) goto L2a
            r11 = 5
            if (r10 == r11) goto L28
            r14 = r9
            goto L35
        L28:
            r14 = r11
            goto L35
        L2a:
            r14 = r2
            goto L35
        L2c:
            if (r8 != r4) goto L33
            goto L31
        L2f:
            r14 = r8
            goto L35
        L31:
            r8 = r12
            goto L2f
        L33:
            r8 = r4
            goto L2f
        L35:
            r9 = r25[r7]
            int r10 = r7 + 1
            r11 = r25[r10]
            r15 = r1[r7]
            r16 = r1[r10]
            int r13 = r9.length
            int r13 = r13 / r12
            int r2 = r9.length
            int r2 = r2 % r12
            int r2 = r2 + r13
            a70[] r12 = new defpackage.a70[r2]
            r13 = r6
        L47:
            if (r13 >= r2) goto L65
            int r17 = r13 * 2
            r18 = r13
            a70 r13 = new a70
            r19 = r17
            r17 = r9[r19]
            int r20 = r19 + 1
            r21 = r18
            r18 = r9[r20]
            r19 = r11[r19]
            r20 = r11[r20]
            r13.<init>(r14, r15, r16, r17, r18, r19, r20)
            r12[r21] = r13
            int r13 = r21 + 1
            goto L47
        L65:
            r5[r7] = r12
            r7 = r10
            r9 = r14
            r2 = 4
            goto L13
        L6b:
            r0.b = r5
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zm7.<init>(int[], float[], float[][]):void");
    }

    public zm7(int i) {
        this.a = i;
        switch (i) {
            case 9:
                break;
            case 16:
                this.b = null;
                break;
            case 27:
                this.b = new LinkedHashSet();
                break;
            default:
                this.b = new o78(new g82[16]);
                break;
        }
    }

    public zm7(aq1 aq1Var) {
        this.a = 7;
        v56.a("output", aq1Var);
        this.b = aq1Var;
        aq1Var.a = this;
    }

    public zm7(long[] jArr) {
        o68 o68Var;
        this.a = 29;
        if (jArr != null) {
            long[] jArrCopyOf = Arrays.copyOf(jArr, jArr.length);
            o68Var = new o68(jArrCopyOf.length);
            int i = o68Var.b;
            if (i >= 0) {
                if (jArrCopyOf.length != 0) {
                    int length = jArrCopyOf.length + i;
                    long[] jArrCopyOf2 = o68Var.a;
                    if (jArrCopyOf2.length < length) {
                        jArrCopyOf2 = Arrays.copyOf(jArrCopyOf2, Math.max(length, (jArrCopyOf2.length * 3) / 2));
                        o68Var.a = jArrCopyOf2;
                    }
                    int i2 = o68Var.b;
                    if (i != i2) {
                        k80.i0(jArrCopyOf2, jArrCopyOf2, jArrCopyOf.length + i, i, i2);
                    }
                    k80.i0(jArrCopyOf, jArrCopyOf2, i, 0, jArrCopyOf.length);
                    o68Var.b += jArrCopyOf.length;
                }
            } else {
                z10.i("");
                throw null;
            }
        } else {
            o68Var = new o68();
        }
        this.b = o68Var;
    }

    public /* synthetic */ zm7(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }
}
