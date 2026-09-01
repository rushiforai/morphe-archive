package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.view.Display;
import androidx.datastore.core.CorruptionException;
import com.google.android.recaptcha.internal.zzaek;
import j$.util.Objects;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.util.List;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class y3b implements yx0, cp1, dz1, h04, ajc, mqe, i0c, eof, on0, w82, r44, hmc, n78, db9, hb2, qkg {
    public static Boolean c;
    public final /* synthetic */ int a;
    public static final y3b b = new y3b(0);
    public static final y3b d = new y3b(1);
    public static final y3b e = new y3b(2);
    public static final y3b f = new y3b(3);
    public static final y3b g = new y3b(4);
    public static final y3b h = new y3b(5);
    public static final y3b i = new y3b(6);
    public static final y3b j = new y3b(7);
    public static final q0c k = new q0c(null, null, null, null, null);
    public static final y3b l = new y3b(8);
    public static final y3b m = new y3b(9);
    public static final /* synthetic */ y3b n = new y3b(26);

    public /* synthetic */ y3b(int i2) {
        this.a = i2;
    }

    public static final CharSequence A(Object obj) {
        Objects.requireNonNull(obj);
        return obj instanceof CharSequence ? (CharSequence) obj : obj.toString();
    }

    public static Typeface s(String str, d05 d05Var, int i2) {
        if (i2 == 0 && g76.L(d05Var, d05.f) && (str == null || str.length() == 0)) {
            return Typeface.DEFAULT;
        }
        int iD = r40.D(d05Var, i2);
        return (str == null || str.length() == 0) ? Typeface.defaultFromStyle(iD) : Typeface.create(str, iD);
    }

    public static final v6g z(Object obj, Object obj2) {
        v6g v6gVarA = (v6g) obj;
        v6g v6gVar = (v6g) obj2;
        if (!v6gVar.isEmpty()) {
            if (!v6gVarA.a) {
                v6gVarA = v6gVarA.a();
            }
            v6gVarA.c();
            if (!v6gVar.isEmpty()) {
                v6gVarA.putAll(v6gVar);
            }
        }
        return v6gVarA;
    }

    @Override // defpackage.ajc
    public boolean E(Object obj, Object obj2) {
        return false;
    }

    @Override // defpackage.mqe
    public Object L0(id6 id6Var, float f2) {
        ed6 ed6VarI = id6Var.I();
        if (ed6VarI == ed6.BEGIN_ARRAY) {
            return wd6.b(id6Var, f2);
        }
        if (ed6VarI == ed6.BEGIN_OBJECT) {
            return wd6.b(id6Var, f2);
        }
        if (ed6VarI != ed6.NUMBER) {
            ik4.h("Cannot convert json to point. Next token is ", ed6VarI);
            return null;
        }
        PointF pointF = new PointF(((float) id6Var.nextDouble()) * f2, ((float) id6Var.nextDouble()) * f2);
        while (id6Var.hasNext()) {
            id6Var.v();
        }
        return pointF;
    }

    @Override // defpackage.db9
    public Typeface a(d05 d05Var, int i2) {
        return s(null, d05Var, i2);
    }

    @Override // defpackage.on0
    public boolean b(float f2) {
        throw new IllegalStateException("not implemented");
    }

    @Override // defpackage.eof
    public boolean c(Class cls) {
        return fnf.class.isAssignableFrom(cls);
    }

    @Override // defpackage.on0
    public uk6 d() {
        throw new IllegalStateException("not implemented");
    }

    @Override // defpackage.eof
    public rof e(Class cls) {
        if (!fnf.class.isAssignableFrom(cls)) {
            ay0.e("Unsupported message type: ".concat(cls.getName()));
            return null;
        }
        try {
            return (rof) fnf.k(cls.asSubclass(fnf.class)).t(3);
        } catch (Exception e2) {
            lg8.p("Unable to get message info for ".concat(cls.getName()), e2);
            return null;
        }
    }

    @Override // defpackage.dz1
    public Object f(iq1 iq1Var) {
        Object objO = iq1Var.o(new rqa(rzd.class, Executor.class));
        objO.getClass();
        return bgf.y((Executor) objO);
    }

    @Override // defpackage.w82
    public long g(long j2, long j3) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j3 >> 32)) / Float.intBitsToFloat((int) (j2 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j3 & 4294967295L)) / Float.intBitsToFloat((int) (j2 & 4294967295L));
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(fIntBitsToFloat)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) & 4294967295L);
        int i2 = fqb.a;
        return jFloatToRawIntBits;
    }

    @Override // defpackage.on0
    public boolean h(float f2) {
        return false;
    }

    @Override // defpackage.n78
    public zae i() {
        return new zae();
    }

    @Override // defpackage.on0
    public boolean isEmpty() {
        return true;
    }

    @Override // defpackage.qkg
    public ur7 j(ing ingVar) throws GeneralSecurityException {
        omg omgVar = ilf.a;
        String str = (String) ingVar.a;
        if (!str.equals("type.googleapis.com/google.crypto.tink.RsaSsaPssPrivateKey")) {
            ay0.e("Wrong type URL in call to RsaSsaPssProtoSerialization.parsePrivateKey: ".concat(String.valueOf(str)));
            return null;
        }
        try {
            pmf pmfVar = (pmf) ingVar.c;
            anf anfVar = anf.a;
            int i2 = gmf.a;
            zqg zqgVarD = zqg.D(pmfVar, anf.a);
            if (zqgVarD.v() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            crg crgVarW = zqgVarD.w();
            if (crgVarW.v() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            BigInteger bigInteger = new BigInteger(1, crgVarW.x().E());
            int iBitLength = bigInteger.bitLength();
            BigInteger bigInteger2 = new BigInteger(1, crgVarW.y().E());
            BigInteger bigInteger3 = qug.g;
            nug nugVar = new nug();
            pif pifVar = ilf.g;
            nugVar.c = (oug) pifVar.f(crgVarW.w().v());
            nugVar.d = (oug) pifVar.f(crgVarW.w().w());
            nugVar.b = bigInteger2;
            nugVar.a(iBitLength);
            nugVar.b(crgVarW.w().x());
            nugVar.f = ilf.b((e1g) ingVar.e);
            qug qugVarC = nugVar.c();
            tag tagVar = new tag();
            tagVar.a = qugVarC;
            tagVar.b = bigInteger;
            tagVar.c = (Integer) ingVar.f;
            tug tugVarL = tagVar.l();
            lod lodVarR = sug.R();
            lodVarR.a = tugVarL;
            ujf ujfVarD = ilf.d(zqgVarD.y());
            ujf ujfVarD2 = ilf.d(zqgVarD.z());
            lodVarR.c = ujfVarD;
            lodVarR.d = ujfVarD2;
            lodVarR.b = ilf.d(zqgVarD.x());
            ujf ujfVarD3 = ilf.d(zqgVarD.A());
            ujf ujfVarD4 = ilf.d(zqgVarD.B());
            lodVarR.e = ujfVarD3;
            lodVarR.f = ujfVarD4;
            lodVarR.g = ilf.d(zqgVarD.C());
            return lodVarR.b();
        } catch (zzaek | IllegalArgumentException unused) {
            ygf.l("Parsing RsaSsaPssPrivateKey failed");
            return null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x001b  */
    @Override // defpackage.db9
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public android.graphics.Typeface k(defpackage.y75 r4, defpackage.d05 r5, int r6) {
        /*
            r3 = this;
            r4.getClass()
            int r3 = r5.a
            int r3 = r3 / 100
            java.lang.String r4 = "sans-serif"
            r0 = 2
            if (r3 < 0) goto L11
            if (r3 >= r0) goto L11
            java.lang.String r3 = "sans-serif-thin"
            goto L33
        L11:
            r1 = 4
            if (r0 > r3) goto L19
            if (r3 >= r1) goto L19
            java.lang.String r3 = "sans-serif-light"
            goto L33
        L19:
            if (r3 != r1) goto L1d
        L1b:
            r3 = r4
            goto L33
        L1d:
            r0 = 5
            if (r3 != r0) goto L23
            java.lang.String r3 = "sans-serif-medium"
            goto L33
        L23:
            r0 = 6
            r1 = 8
            if (r0 > r3) goto L2b
            if (r3 >= r1) goto L2b
            goto L1b
        L2b:
            if (r1 > r3) goto L1b
            r0 = 11
            if (r3 >= r0) goto L1b
            java.lang.String r3 = "sans-serif-black"
        L33:
            int r0 = r3.length()
            r1 = 0
            if (r0 != 0) goto L3b
            goto L5a
        L3b:
            android.graphics.Typeface r3 = s(r3, r5, r6)
            android.graphics.Typeface r0 = android.graphics.Typeface.DEFAULT
            int r2 = defpackage.r40.D(r5, r6)
            android.graphics.Typeface r0 = android.graphics.Typeface.create(r0, r2)
            boolean r0 = defpackage.g76.L(r3, r0)
            if (r0 != 0) goto L5a
            android.graphics.Typeface r0 = s(r1, r5, r6)
            boolean r0 = defpackage.g76.L(r3, r0)
            if (r0 != 0) goto L5a
            r1 = r3
        L5a:
            if (r1 != 0) goto L61
            android.graphics.Typeface r3 = s(r4, r5, r6)
            return r3
        L61:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.y3b.k(y75, d05, int):android.graphics.Typeface");
    }

    @Override // defpackage.i0c
    public Object l() {
        return k;
    }

    @Override // defpackage.on0
    public float m() {
        return 1.0f;
    }

    @Override // defpackage.hmc
    public StackTraceElement[] n(StackTraceElement[] stackTraceElementArr) {
        if (stackTraceElementArr.length <= 1024) {
            return stackTraceElementArr;
        }
        StackTraceElement[] stackTraceElementArr2 = new StackTraceElement[1024];
        System.arraycopy(stackTraceElementArr, 0, stackTraceElementArr2, 0, 512);
        System.arraycopy(stackTraceElementArr, stackTraceElementArr.length - 512, stackTraceElementArr2, 512, 512);
        return stackTraceElementArr2;
    }

    @Override // defpackage.on0
    public float o() {
        return 0.0f;
    }

    @Override // defpackage.yx0
    public Rect p(Activity activity) {
        Rect rect = new Rect();
        Display defaultDisplay = activity.getWindowManager().getDefaultDisplay();
        defaultDisplay.getRectSize(rect);
        if (!o6.n(activity)) {
            Point point = new Point();
            defaultDisplay.getRealSize(point);
            Resources resources = activity.getResources();
            int identifier = resources.getIdentifier("navigation_bar_height", "dimen", "android");
            int dimensionPixelSize = identifier > 0 ? resources.getDimensionPixelSize(identifier) : 0;
            int i2 = rect.bottom + dimensionPixelSize;
            if (i2 == point.y) {
                rect.bottom = i2;
                return rect;
            }
            int i3 = rect.right + dimensionPixelSize;
            if (i3 == point.x) {
                rect.right = i3;
            }
        }
        return rect;
    }

    @Override // defpackage.h04
    public Boolean q() {
        return Boolean.TRUE;
    }

    /*  JADX ERROR: JadxRuntimeException in pass: ModVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Can't remove SSA var: r4v1 k7f, still in use, count: 2, list:
          (r4v1 k7f) from 0x005d: MOVE (r27v0 k7f) = (r4v1 k7f) (LINE:94)
          (r4v1 k7f) from 0x0052: MOVE (r27v2 k7f) = (r4v1 k7f) (LINE:83)
        	at jadx.core.utils.InsnRemover.removeSsaVar(InsnRemover.java:162)
        	at jadx.core.utils.InsnRemover.unbindResult(InsnRemover.java:127)
        	at jadx.core.utils.InsnRemover.unbindInsn(InsnRemover.java:91)
        	at jadx.core.utils.InsnRemover.addAndUnbind(InsnRemover.java:57)
        	at jadx.core.dex.visitors.ModVisitor.removeStep(ModVisitor.java:463)
        	at jadx.core.dex.visitors.ModVisitor.visit(ModVisitor.java:97)
        */
    public java.lang.Object r(java.lang.Object r30) {
        /*
            r29 = this;
            r0 = r30
            java.util.List r0 = (java.util.List) r0
            if (r0 == 0) goto Lc2
            int r2 = r0.size()
            if (r2 <= 0) goto Lc2
            r2 = 0
            java.lang.Object r0 = r0.get(r2)
            b8f r0 = (defpackage.b8f) r0
            java.util.List r3 = r0.q
            boolean r4 = r3.isEmpty()
            if (r4 != 0) goto L23
            java.lang.Object r3 = r3.get(r2)
            dt2 r3 = (defpackage.dt2) r3
        L21:
            r9 = r3
            goto L26
        L23:
            dt2 r3 = defpackage.dt2.b
            goto L21
        L26:
            k7f r4 = new k7f
            java.lang.String r3 = r0.a
            java.util.UUID r5 = java.util.UUID.fromString(r3)
            r5.getClass()
            j7f r6 = r0.b
            java.util.HashSet r7 = new java.util.HashSet
            java.util.List r3 = r0.p
            r7.<init>(r3)
            dt2 r8 = r0.c
            int r10 = r0.h
            int r3 = r0.m
            e72 r11 = r0.g
            long r13 = r0.d
            r29 = 0
            long r1 = r0.e
            r15 = 0
            int r12 = (r1 > r15 ? 1 : (r1 == r15 ? 0 : -1))
            if (r12 == 0) goto L5b
            i7f r15 = new i7f
            r28 = r3
            r27 = r4
            long r3 = r0.f
            r15.<init>(r1, r3)
            r3 = r15
            goto L61
        L5b:
            r28 = r3
            r27 = r4
            r3 = r29
        L61:
            j7f r4 = r0.b
            j7f r15 = defpackage.j7f.ENQUEUED
            if (r4 != r15) goto La7
            java.lang.String r16 = defpackage.c8f.z
            r16 = 1
            if (r4 != r15) goto L75
            if (r10 <= 0) goto L75
            r4 = r11
            r11 = r10
            r10 = r16
        L73:
            r15 = r12
            goto L79
        L75:
            r4 = r11
            r11 = r10
            r10 = 0
            goto L73
        L79:
            tm0 r12 = r0.i
            r19 = r13
            long r13 = r0.j
            r23 = r1
            long r1 = r0.k
            r17 = r1
            int r1 = r0.l
            if (r15 == 0) goto L8d
            r29 = r16
        L8b:
            r15 = r1
            goto L90
        L8d:
            r29 = 0
            goto L8b
        L90:
            long r1 = r0.f
            r21 = r1
            long r1 = r0.n
            r25 = r17
            r17 = r15
            r15 = r25
            r18 = r29
            r25 = r1
            long r1 = defpackage.dl7.k(r10, r11, r12, r13, r15, r17, r18, r19, r21, r23, r25)
        La4:
            r16 = r1
            goto Lb1
        La7:
            r4 = r11
            r19 = r13
            r11 = r10
            r1 = 9223372036854775807(0x7fffffffffffffff, double:NaN)
            goto La4
        Lb1:
            int r0 = r0.o
            r18 = r0
            r15 = r3
            r12 = r4
            r10 = r11
            r13 = r19
            r4 = r27
            r11 = r28
            r4.<init>(r5, r6, r7, r8, r9, r10, r11, r12, r13, r15, r16, r18)
            return r4
        Lc2:
            r29 = 0
            return r29
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.y3b.r(java.lang.Object):java.lang.Object");
    }

    public iq1 t() {
        iq1 iq1Var;
        iq1 iq1Var2 = iq1.j;
        if (iq1Var2 != null) {
            return iq1Var2;
        }
        synchronized (this) {
            iq1Var = iq1.j;
            if (iq1Var == null) {
                iq1 iq1Var3 = new iq1(iq1.C(f94.a()), new dsc(1));
                iq1.j = iq1Var3;
                iq1Var = iq1Var3;
            }
        }
        return iq1Var;
    }

    public String toString() {
        switch (this.a) {
            case 5:
                return "NeverEqualPolicy";
            default:
                return super.toString();
        }
    }

    public Signature[] u(PackageManager packageManager, String str) {
        return packageManager.getPackageInfo(str, 64).signatures;
    }

    public Intent v(Context context) {
        if (!ec2.a.contains(this)) {
            try {
                PackageManager packageManager = context.getPackageManager();
                if (packageManager != null) {
                    Intent intent = new Intent("ReceiverService");
                    intent.setPackage("com.facebook.katana");
                    if (packageManager.resolveService(intent, 0) != null && g94.a(context, "com.facebook.katana")) {
                        return intent;
                    }
                    Intent intent2 = new Intent("ReceiverService");
                    intent2.setPackage("com.facebook.wakizashi");
                    if (packageManager.resolveService(intent2, 0) != null) {
                        if (g94.a(context, "com.facebook.wakizashi")) {
                            return intent2;
                        }
                    }
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return null;
            }
        }
        return null;
    }

    @Override // defpackage.i0c
    public Object w(FileInputStream fileInputStream) throws CorruptionException {
        try {
            fb6 fb6Var = fb6.d;
            String str = new String(op8.i0(fileInputStream), wk1.a);
            fa4 fa4Var = fb6Var.b;
            return (q0c) fb6Var.a(q0c.Companion.serializer(), str);
        } catch (Exception e2) {
            throw new CorruptionException("Cannot parse session configs", e2);
        }
    }

    public x3b x(v3b v3bVar, String str, List list) {
        x3b x3bVar;
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            x3b x3bVar2 = x3b.SERVICE_NOT_AVAILABLE;
            Context contextA = f94.a();
            Intent intentV = v(contextA);
            if (intentV == null) {
                return x3bVar2;
            }
            w3b w3bVar = new w3b();
            try {
                if (!contextA.bindService(intentV, w3bVar, 1)) {
                    return x3b.SERVICE_ERROR;
                }
                try {
                    IBinder iBinderA = w3bVar.a();
                    if (iBinderA != null) {
                        ru5 ru5VarA = qu5.a(iBinderA);
                        Bundle bundleI = u3b.i(v3bVar, str, list);
                        if (bundleI != null) {
                            ((pu5) ru5VarA).a(bundleI);
                            bundleI.toString();
                        }
                        x3bVar2 = x3b.OPERATION_SUCCESS;
                    }
                    contextA.unbindService(w3bVar);
                    return x3bVar2;
                } catch (RemoteException unused) {
                    x3bVar = x3b.SERVICE_ERROR;
                    f94 f94Var = f94.a;
                    contextA.unbindService(w3bVar);
                    return x3bVar;
                } catch (InterruptedException unused2) {
                    x3bVar = x3b.SERVICE_ERROR;
                    f94 f94Var2 = f94.a;
                    contextA.unbindService(w3bVar);
                    return x3bVar;
                }
            } catch (Throwable th) {
                contextA.unbindService(w3bVar);
                f94 f94Var3 = f94.a;
                throw th;
            }
        } catch (Throwable th2) {
            ec2.a(this, th2);
            return null;
        }
    }

    @Override // defpackage.i0c
    public void y(Object obj, jz0 jz0Var) throws IOException {
        byte[] bytes = fb6.d.b(q0c.Companion.serializer(), (q0c) obj).getBytes(wk1.a);
        bytes.getClass();
        ((FileOutputStream) jz0Var.b).write(bytes);
    }
}
