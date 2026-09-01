package defpackage;

import android.net.Uri;
import android.text.TextUtils;
import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.medium.android.common.post.mixtape.ParagraphEditMixtapeLayout;
import com.medium.android.unsplash.data.UnsplashPhoto;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.File;
import java.nio.charset.Charset;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.Provider;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class hpe implements y92, um2, ap6, d19, hb2, jy7, g70, w82, np3, asc, u2a, r44, xlf, vfg, yfg {
    public static final hpe b = new hpe(0);
    public static final hpe c = new hpe(1);
    public static final hpe d = new hpe(2);
    public static final zwa e = new zwa(Float.NaN, Float.NaN, Float.NaN, Float.NaN);
    public static final hpe f = new hpe(4);
    public static final hpe g = new hpe(5);
    public static final hpe h = new hpe(6);
    public static final hpe i = new hpe(7);
    public static final hpe j = new hpe(8);
    public final /* synthetic */ int a;

    public hpe(x67 x67Var) {
        this.a = 22;
        String str = x67.d;
        new ConcurrentHashMap(3, 1.0f, 2);
    }

    public static boolean A(int i2, ym0 ym0Var, Object obj) throws zzale {
        int i3 = ym0Var.b;
        up1 up1Var = (up1) ym0Var.e;
        int i4 = i3 >>> 3;
        int i5 = i3 & 7;
        if (i5 == 0) {
            ym0Var.K(0);
            ((yuf) obj).c(i4 << 3, Long.valueOf(up1Var.n0()));
            return true;
        }
        if (i5 == 1) {
            ym0Var.K(1);
            ((yuf) obj).c((i4 << 3) | 1, Long.valueOf(up1Var.l0()));
            return true;
        }
        if (i5 == 2) {
            ((yuf) obj).c((i4 << 3) | 2, ym0Var.d0());
            return true;
        }
        if (i5 != 3) {
            if (i5 == 4) {
                if (i2 != 0) {
                    return false;
                }
                throw new zzale("Protocol message end-group tag did not match expected tag.");
            }
            if (i5 != 5) {
                throw zzale.a();
            }
            ym0Var.K(5);
            ((yuf) obj).c(5 | (i4 << 3), Integer.valueOf(up1Var.b0()));
            return true;
        }
        yuf yufVarE = yuf.e();
        int i6 = i4 << 3;
        int i7 = i6 | 4;
        int i8 = i2 + 1;
        if (i8 >= 100) {
            throw new zzale("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        while (ym0Var.N() != Integer.MAX_VALUE && A(i8, ym0Var, yufVarE)) {
        }
        if (i7 != ym0Var.b) {
            throw new zzale("Protocol message end-group tag did not match expected tag.");
        }
        if (yufVarE.e) {
            yufVarE.e = false;
        }
        ((yuf) obj).c(i6 | 3, yufVarE);
        return true;
    }

    public static yuf C(Object obj) {
        ytf ytfVar = (ytf) obj;
        yuf yufVar = ytfVar.zzb;
        if (yufVar != yuf.f) {
            return yufVar;
        }
        yuf yufVarE = yuf.e();
        ytfVar.zzb = yufVarE;
        return yufVarE;
    }

    public static final File o() {
        if (ec2.a.contains(hpe.class)) {
            return null;
        }
        try {
            File file = new File(f94.a().getFilesDir(), "facebook_ml/");
            if (!file.exists()) {
                if (!file.mkdirs()) {
                    return null;
                }
            }
            return file;
        } catch (Throwable th) {
            ec2.a(hpe.class, th);
            return null;
        }
    }

    public static oz6 r(List list, float f2, float f3) {
        return new oz6(list, (((long) Float.floatToRawIntBits(f2)) << 32) | (((long) Float.floatToRawIntBits(0.0f)) & 4294967295L), (((long) Float.floatToRawIntBits(f3)) << 32) | (((long) Float.floatToRawIntBits(0.0f)) & 4294967295L));
    }

    public static oz6 s(List list) {
        return new oz6(list, 0L, 9187343241974906880L);
    }

    public static v33 t(o3e o3eVar, boolean z) {
        boolean zE;
        o3eVar.getClass();
        if (o3eVar instanceof v33) {
            return (v33) o3eVar;
        }
        o3eVar.j0();
        if ((o3eVar.j0().a() instanceof swd) || (o3eVar instanceof ve8)) {
            co1 co1VarA = o3eVar.j0().a();
            twd twdVar = co1VarA instanceof twd ? (twd) co1VarA : null;
            zE = true;
            if (twdVar == null || twdVar.m) {
                zE = (z && (o3eVar.j0().a() instanceof swd)) ? nxd.e(o3eVar) : true ^ pwd.O(h1c.j.c1(), f49.N(o3eVar), wvd.e);
            }
        } else {
            zE = false;
        }
        if (!zE) {
            return null;
        }
        if (o3eVar instanceof zm4) {
            zm4 zm4Var = (zm4) o3eVar;
            g76.L(zm4Var.b.j0(), zm4Var.c.j0());
        }
        return new v33(f49.N(o3eVar).n0(false), z);
    }

    public static oz6 y(List list) {
        return new oz6(list, (((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(0.0f)) & 4294967295L), (((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(Float.POSITIVE_INFINITY)) & 4294967295L));
    }

    @Override // defpackage.u2a
    public void B() {
    }

    @Override // defpackage.u2a
    public void Q(int i2, Object obj) {
    }

    @Override // defpackage.np3
    public void a(int i2, String str) {
    }

    @Override // defpackage.jy7
    public void b(lx7 lx7Var, boolean z) {
    }

    @Override // defpackage.asc
    public void c(yp0 yp0Var, kp7 kp7Var, boolean z) {
    }

    @Override // defpackage.xlf
    public /* bridge */ /* synthetic */ Object d(String str, Provider provider) {
        return provider == null ? KeyFactory.getInstance(str) : KeyFactory.getInstance(str, provider);
    }

    @Override // defpackage.np3
    public void e(Uri uri, String str) {
        uri.getClass();
        str.getClass();
    }

    @Override // defpackage.g70, defpackage.j70
    public /* synthetic */ float f() {
        return 0.0f;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.ap6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object f0(defpackage.of5 r9, defpackage.n92 r10) {
        /*
            r8 = this;
            boolean r0 = r10 instanceof defpackage.bp6
            if (r0 == 0) goto L13
            r0 = r10
            bp6 r0 = (defpackage.bp6) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L1a
        L13:
            bp6 r0 = new bp6
            p92 r10 = (defpackage.p92) r10
            r0.<init>(r8, r10)
        L1a:
            java.lang.Object r8 = r0.c
            tb2 r10 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r0.e
            r2 = 1
            r3 = 0
            if (r1 == 0) goto L35
            if (r1 != r2) goto L2f
            android.media.ImageReader r9 = r0.b
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L2c
            goto L9a
        L2c:
            r8 = move-exception
            goto Lac
        L2f:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r3
        L35:
            defpackage.br7.v(r8)
            long r4 = r9.u
            android.os.Looper r8 = android.os.Looper.myLooper()
            if (r8 != 0) goto L44
            android.os.Looper r8 = android.os.Looper.getMainLooper()
        L44:
            r1 = 32
            long r6 = r4 >> r1
            int r1 = (int) r6
            r6 = 4294967295(0xffffffff, double:2.1219957905E-314)
            long r4 = r4 & r6
            int r4 = (int) r4
            android.media.ImageReader r1 = android.media.ImageReader.newInstance(r1, r4, r2, r2)
            r0.b = r1     // Catch: java.lang.Throwable -> La4
            r0.e = r2     // Catch: java.lang.Throwable -> La4
            x51 r4 = new x51     // Catch: java.lang.Throwable -> La4
            n92 r0 = defpackage.pwd.Q(r0)     // Catch: java.lang.Throwable -> La4
            r4.<init>(r2, r0)     // Catch: java.lang.Throwable -> La4
            r4.s()     // Catch: java.lang.Throwable -> La4
            cp6 r0 = new cp6     // Catch: java.lang.Throwable -> La4
            r0.<init>(r4)     // Catch: java.lang.Throwable -> La4
            android.os.Handler r8 = defpackage.gsa.W(r8)     // Catch: java.lang.Throwable -> La4
            r1.setOnImageAvailableListener(r0, r8)     // Catch: java.lang.Throwable -> La4
            android.view.Surface r8 = r1.getSurface()     // Catch: java.lang.Throwable -> La4
            android.graphics.Canvas r0 = r8.lockHardwareCanvas()     // Catch: java.lang.Throwable -> La4
            long r5 = defpackage.uu1.b     // Catch: java.lang.Throwable -> La7
            int r2 = defpackage.op8.n0(r5)     // Catch: java.lang.Throwable -> La7
            android.graphics.PorterDuff$Mode r5 = android.graphics.PorterDuff.Mode.CLEAR     // Catch: java.lang.Throwable -> La7
            r0.drawColor(r2, r5)     // Catch: java.lang.Throwable -> La7
            android.graphics.Canvas r2 = defpackage.qm.a     // Catch: java.lang.Throwable -> La7
            pm r2 = new pm     // Catch: java.lang.Throwable -> La7
            r2.<init>()     // Catch: java.lang.Throwable -> La7
            r2.a = r0     // Catch: java.lang.Throwable -> La7
            r9.c(r2, r3)     // Catch: java.lang.Throwable -> La7
            r8.unlockCanvasAndPost(r0)     // Catch: java.lang.Throwable -> La4
            java.lang.Object r8 = r4.q()     // Catch: java.lang.Throwable -> La4
            if (r8 != r10) goto L99
            return r10
        L99:
            r9 = r1
        L9a:
            android.media.Image r8 = (android.media.Image) r8     // Catch: java.lang.Throwable -> L2c
            android.graphics.Bitmap r8 = defpackage.pxf.K(r8)     // Catch: java.lang.Throwable -> L2c
            defpackage.xz5.F(r9, r3)
            return r8
        La4:
            r8 = move-exception
            r9 = r1
            goto Lac
        La7:
            r9 = move-exception
            r8.unlockCanvasAndPost(r0)     // Catch: java.lang.Throwable -> La4
            throw r9     // Catch: java.lang.Throwable -> La4
        Lac:
            throw r8     // Catch: java.lang.Throwable -> Lad
        Lad:
            r10 = move-exception
            defpackage.xz5.F(r9, r8)
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hpe.f0(of5, n92):java.lang.Object");
    }

    @Override // defpackage.w82
    public long g(long j2, long j3) {
        float fM = s42.M(j2, j3);
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(fM)) << 32) | (((long) Float.floatToRawIntBits(fM)) & 4294967295L);
        int i2 = fqb.a;
        return jFloatToRawIntBits;
    }

    @Override // defpackage.asc
    public sp0 h() {
        return null;
    }

    @Override // defpackage.d19
    public void i(ParagraphEditMixtapeLayout paragraphEditMixtapeLayout) {
    }

    @Override // defpackage.np3
    public void j(String str) {
    }

    @Override // defpackage.asc
    public x45 k(vu2 vu2Var) {
        vu2Var.getClass();
        return zu2.w;
    }

    @Override // defpackage.np3
    public void l(UnsplashPhoto unsplashPhoto, String str) {
        unsplashPhoto.getClass();
        str.getClass();
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) {
        j2g j2gVar = (j2g) gr7Var;
        hng hngVarW = jng.w();
        byte[] bArrB = ((qvg) j2gVar.i.b).b();
        rsf rsfVarP = hsf.p(bArrB, 0, bArrB.length);
        hngVarW.c();
        jng.v((jng) hngVarW.b, rsfVarP);
        return nig.I("type.googleapis.com/google.crypto.tink.AesGcmSivKey", ((jng) hngVarW.b()).b(), zrg.SYMMETRIC, u6g.b(j2gVar.h.b), j2gVar.k);
    }

    @Override // defpackage.um2
    public Iterable m(Object obj) {
        int i2 = f93.a;
        Collection collectionI = ((lqe) obj).i();
        ArrayList arrayList = new ArrayList(cu1.k0(collectionI, 10));
        Iterator it2 = ((ArrayList) collectionI).iterator();
        while (it2.hasNext()) {
            arrayList.add(((lqe) it2.next()).x0());
        }
        return arrayList;
    }

    public exd n(zvd zvdVar, List list) {
        zvdVar.getClass();
        list.getClass();
        List parameters = zvdVar.getParameters();
        parameters.getClass();
        swd swdVar = (swd) bu1.I0(parameters);
        if (swdVar != null) {
            int i2 = 1;
            if (swdVar.R()) {
                List parameters2 = zvdVar.getParameters();
                parameters2.getClass();
                ArrayList arrayList = new ArrayList(cu1.k0(parameters2, 10));
                Iterator it2 = parameters2.iterator();
                while (it2.hasNext()) {
                    arrayList.add(((swd) it2.next()).n());
                }
                return new pnc(i2, ei7.V(bu1.t1(list, arrayList)));
            }
        }
        return new q06((swd[]) parameters.toArray(new swd[0]), (xwd[]) list.toArray(new xwd[0]), false);
    }

    /* JADX WARN: Code restructure failed: missing block: B:103:0x026e, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x02bf, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:129:0x0304, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:140:0x0343, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:147:0x0377, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:162:0x03c9, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:173:0x040c, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:189:0x046c, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:196:0x049e, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:209:0x04ea, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:218:0x0520, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:231:0x056c, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:254:0x05fb, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:267:0x0647, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:285:0x06b2, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0131, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x016a, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x01b9, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x01fd, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x023b, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Removed duplicated region for block: B:300:0x06f5 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object p(defpackage.md9 r11, defpackage.nhc r12, android.content.res.Resources r13, defpackage.sh9 r14, defpackage.n92 r15) {
        /*
            Method dump skipped, instruction units count: 1842
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hpe.p(md9, nhc, android.content.res.Resources, sh9, n92):java.lang.Object");
    }

    @Override // defpackage.jy7
    public boolean q(lx7 lx7Var) {
        return false;
    }

    public String toString() {
        switch (this.a) {
            case 7:
                return "Start";
            case 11:
                return "AbsoluteArrangement#Right";
            case 17:
                return "EmptyAction";
            case 23:
                return "ReusedSlotId";
            default:
                return super.toString();
        }
    }

    public String u(String str) {
        List listQ;
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            str.getClass();
            int length = str.length() - 1;
            int i2 = 0;
            boolean z = false;
            while (i2 <= length) {
                boolean z2 = g76.Q(str.charAt(!z ? i2 : length), 32) <= 0;
                if (z) {
                    if (!z2) {
                        break;
                    }
                    length--;
                } else if (z2) {
                    i2++;
                } else {
                    z = true;
                }
            }
            String string = str.subSequence(i2, length + 1).toString();
            Pattern patternCompile = Pattern.compile("\\s+");
            patternCompile.getClass();
            string.getClass();
            muc.m0(0);
            Matcher matcher = patternCompile.matcher(string);
            if (matcher.find()) {
                ArrayList arrayList = new ArrayList(10);
                int iEnd = 0;
                do {
                    arrayList.add(string.subSequence(iEnd, matcher.start()).toString());
                    iEnd = matcher.end();
                } while (matcher.find());
                arrayList.add(string.subSequence(iEnd, string.length()).toString());
                listQ = arrayList;
            } else {
                listQ = d46.Q(string.toString());
            }
            String strJoin = TextUtils.join(" ", (String[]) listQ.toArray(new String[0]));
            strJoin.getClass();
            return strJoin;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    @Override // defpackage.y92
    public Object v(Object obj) {
        fdb fdbVar = (fdb) obj;
        try {
            kz0 kz0Var = new kz0();
            fdbVar.v0().S(kz0Var);
            return new edb(fdbVar.m(), fdbVar.f(), kz0Var);
        } finally {
            fdbVar.close();
        }
    }

    @Override // defpackage.g70
    public void w(m73 m73Var, int i2, int[] iArr, ip6 ip6Var, int[] iArr2) {
        int i3 = 0;
        int i4 = 0;
        for (int i5 : iArr) {
            i4 += i5;
        }
        int length = iArr.length;
        int i6 = i2 - i4;
        int i7 = 0;
        while (i3 < length) {
            int i8 = iArr[i3];
            iArr2[i7] = i6;
            i6 += i8;
            i3++;
            i7++;
        }
    }

    public int[] x(String str) {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            str.getClass();
            int[] iArr = new int[128];
            String strU = u(str);
            Charset charsetForName = Charset.forName("UTF-8");
            charsetForName.getClass();
            byte[] bytes = strU.getBytes(charsetForName);
            bytes.getClass();
            for (int i2 = 0; i2 < 128; i2++) {
                if (i2 < bytes.length) {
                    iArr[i2] = bytes[i2] & 255;
                } else {
                    iArr[i2] = 0;
                }
            }
            return iArr;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public Object z(byf byfVar) throws GeneralSecurityException {
        gr7 gr7Var = byfVar.a;
        if (gr7Var instanceof u0g) {
            return yug.a((u0g) gr7Var);
        }
        if (gr7Var instanceof r1g) {
            r1g r1gVar = (r1g) gr7Var;
            mag magVar = pug.c;
            g2g g2gVar = r1gVar.h;
            int i2 = g2gVar.b;
            int i3 = g2gVar.c;
            if (i2 != 12) {
                throw new GeneralSecurityException(b09.w(g2gVar.b, "Expected IV Size 12, got "));
            }
            if (i3 == 16) {
                return new pug(((qvg) r1gVar.i.b).b(), r1gVar.j);
            }
            throw new GeneralSecurityException(b09.w(i3, "Expected tag Size 16, got "));
        }
        if (gr7Var instanceof j2g) {
            j2g j2gVar = (j2g) gr7Var;
            bt btVar = v9g.a;
            t9g t9gVar = new t9g();
            byte[] bArr = p6g.c;
            if (p6g.a(t9g.a())) {
                return new p6g(((qvg) j2gVar.i.b).b(), j2gVar.j.b(), t9gVar);
            }
            ygf.f("Cipher does not implement AES GCM SIV.");
            return null;
        }
        if (gr7Var instanceof j1g) {
            j1g j1gVar = (j1g) gr7Var;
            if (!mug.e.zza()) {
                ygf.l("Can not use AES-EAX in FIPS-mode.");
                return null;
            }
            p1g p1gVar = j1gVar.h;
            if (p1gVar.c != 16) {
                throw new GeneralSecurityException(b09.w(p1gVar.c, "AesEaxJce only supports 16 byte tag size, not "));
            }
            return new mug(p1gVar.b, ((qvg) j1gVar.i.b).b(), j1gVar.j.b());
        }
        if (gr7Var instanceof u2g) {
            u2g u2gVar = (u2g) gr7Var;
            qvg qvgVar = u2gVar.j;
            qvg qvgVar2 = (qvg) u2gVar.i.b;
            try {
                d7g.a();
                return new d7g(qvgVar2.b(), qvgVar.b(), d7g.a().getProvider());
            } catch (GeneralSecurityException unused) {
                return new t8g(1, qvgVar2.b(), qvgVar.b());
            }
        }
        if (gr7Var instanceof g5g) {
            g5g g5gVar = (g5g) gr7Var;
            qvg qvgVar3 = g5gVar.j;
            qvg qvgVar4 = (qvg) g5gVar.i.b;
            mag magVar2 = g9g.d;
            try {
                d7g.a();
                return new g9g(qvgVar4.b(), qvgVar3.b(), d7g.a().getProvider());
            } catch (GeneralSecurityException unused2) {
                return new t8g(2, qvgVar4.b(), qvgVar3.b());
            }
        }
        if (!(gr7Var instanceof u4g)) {
            throw new GeneralSecurityException("Unknown key class: ".concat(String.valueOf(gr7Var.getClass())));
        }
        u4g u4gVar = (u4g) gr7Var;
        int i4 = u4gVar.h.b;
        if (i4 >= 8 && i4 <= 12) {
            return new x8g(((qvg) u4gVar.i.b).b(), u4gVar.j, i4);
        }
        ygf.l("invalid salt size");
        return null;
    }

    @Override // defpackage.vfg
    public gr7 T(nig nigVar) throws GeneralSecurityException {
        if (!((String) nigVar.a).equals("type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey")) {
            ay0.e("Wrong type URL in call to AesCtrHmacAeadProtoSerialization.parseKey");
            return null;
        }
        try {
            olg olgVarU = olg.u((hsf) nigVar.c, ptf.a);
            if (olgVarU.t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            if (olgVarU.y().t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys inner AES CTR keys are accepted");
            }
            if (olgVarU.z().t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys inner HMAC keys are accepted");
            }
            ing ingVarB = f1g.b();
            ingVarB.l(olgVarU.y().z().e());
            ingVarB.n(olgVarU.z().A().e());
            ingVarB.o(olgVarU.y().y().t());
            ingVarB.p(olgVarU.z().z().t());
            ingVarB.d = n5g.b(olgVarU.z().z().w());
            ingVarB.e = n5g.a((ntg) nigVar.e);
            f1g f1gVarI = ingVarB.i();
            o2b o2bVar = new o2b(24, false);
            o2bVar.c = null;
            o2bVar.d = null;
            o2bVar.e = null;
            o2bVar.b = f1gVarI;
            int i2 = 28;
            o2bVar.c = new ujf(i2, qvg.a(olgVarU.y().z().x()));
            o2bVar.d = new ujf(i2, qvg.a(olgVarU.z().A().x()));
            o2bVar.e = (Integer) nigVar.f;
            return o2bVar.N();
        } catch (zzale unused) {
            ygf.l(PqkdNGCEoxOKZk.WAJXOMReefVTKYU);
            return null;
        }
    }

    public /* synthetic */ hpe(int i2) {
        this.a = i2;
    }
}
