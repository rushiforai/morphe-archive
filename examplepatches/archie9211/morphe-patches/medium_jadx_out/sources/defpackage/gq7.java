package defpackage;

import android.os.Build;
import android.os.Trace;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.medium.reader.R;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class gq7 {
    public static final /* synthetic */ int a = 0;
    public static long b;
    public static Method c;
    public static Method d;
    public static Method e;

    public static void B(String str, Exception exc) {
        if (exc instanceof InvocationTargetException) {
            Throwable cause = exc.getCause();
            if (cause instanceof RuntimeException) {
                throw ((RuntimeException) cause);
            }
            ik4.j(cause);
            return;
        }
        Log.v("Trace", "Unable to call " + str + " via reflection", exc);
    }

    public static final boolean C(mx mxVar) {
        int length = mxVar.b.length();
        List list = mxVar.a;
        if (list != null) {
            int size = list.size();
            for (int i = 0; i < size; i++) {
                lx lxVar = (lx) list.get(i);
                if ((lxVar.a instanceof d07) && ox.b(0, length, lxVar.b, lxVar.c)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean D() {
        return Build.VERSION.SDK_INT >= 26;
    }

    public static boolean E() {
        if (Build.VERSION.SDK_INT >= 29) {
            return kqd.c();
        }
        try {
            Method method = c;
            if (method == null) {
                b = Trace.class.getField("TRACE_TAG_APP").getLong(null);
                method = Trace.class.getMethod("isTagEnabled", Long.TYPE);
                c = method;
            }
            return ((Boolean) method.invoke(null, Long.valueOf(b))).booleanValue();
        } catch (Exception e2) {
            B("isTagEnabled", e2);
            return false;
        }
    }

    public static o3e I(o3e o3eVar) {
        o3eVar.getClass();
        v33 v33VarT = hpe.t(o3eVar, false);
        if (v33VarT != null) {
            return v33VarT;
        }
        hec hecVarJ = J(o3eVar);
        return hecVarJ != null ? hecVarJ : o3eVar.n0(false);
    }

    public static final hec J(o3e o3eVar) {
        u66 u66Var;
        zvd zvdVarJ0 = o3eVar.j0();
        u66 u66Var2 = zvdVarJ0 instanceof u66 ? (u66) zvdVarJ0 : null;
        if (u66Var2 != null) {
            LinkedHashSet<mn6> linkedHashSet = u66Var2.b;
            ArrayList arrayList = new ArrayList(cu1.k0(linkedHashSet, 10));
            boolean z = false;
            for (mn6 mn6VarI : linkedHashSet) {
                if (nxd.e(mn6VarI)) {
                    mn6VarI = I(mn6VarI.m0());
                    z = true;
                }
                arrayList.add(mn6VarI);
            }
            if (z) {
                mn6 mn6VarI2 = u66Var2.a;
                if (mn6VarI2 == null) {
                    mn6VarI2 = null;
                } else if (nxd.e(mn6VarI2)) {
                    mn6VarI2 = I(mn6VarI2.m0());
                }
                arrayList.isEmpty();
                LinkedHashSet linkedHashSet2 = new LinkedHashSet(arrayList);
                linkedHashSet2.hashCode();
                u66Var = new u66(linkedHashSet2);
                u66Var.a = mn6VarI2;
            } else {
                u66Var = null;
            }
            if (u66Var != null) {
                return u66Var.f();
            }
        }
        return null;
    }

    /* JADX WARN: Can't wrap try/catch for region: R(12:14|15|16|(8:18|139|19|(3:21|(2:53|54)(4:24|140|25|(2:27|(2:36|37)(6:31|135|32|33|35|(1:49)(1:50)))(2:39|40))|(1:65)(1:66))|133|55|56|(0)(0))|69|125|70|(4:73|(3:75|(2:77|145)(1:144)|80)(3:143|81|82)|(4:93|119|94|95)(1:96)|71)|130|83|84|(0)(0)) */
    /* JADX WARN: Can't wrap try/catch for region: R(7:18|(2:139|19)|(3:21|(2:53|54)(4:24|140|25|(2:27|(2:36|37)(6:31|135|32|33|35|(1:49)(1:50)))(2:39|40))|(1:65)(1:66))|133|55|56|(0)(0)) */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x013c, code lost:
    
        r0 = th;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x0197, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x0198, code lost:
    
        r10 = r0;
     */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0149  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x014a A[Catch: all -> 0x014b, TryCatch #7 {all -> 0x014b, blocks: (B:3:0x000d, B:5:0x001b, B:6:0x0023, B:16:0x007b, B:18:0x0085, B:66:0x014a, B:62:0x0143, B:69:0x014f, B:93:0x01a5, B:96:0x01b2, B:90:0x019f, B:103:0x01be, B:106:0x01ca, B:107:0x01d1, B:108:0x01d2, B:109:0x01d5, B:110:0x01d6, B:111:0x01eb, B:59:0x013e, B:70:0x015f, B:73:0x0165, B:75:0x0171, B:77:0x017f, B:80:0x0186, B:81:0x018a, B:82:0x0191, B:7:0x002c, B:9:0x0035, B:15:0x005b, B:100:0x01b6, B:101:0x01bb, B:87:0x019a, B:19:0x008e, B:21:0x0097, B:24:0x00a8, B:50:0x012d, B:46:0x0126, B:53:0x0131, B:54:0x0136), top: B:132:0x000d, inners: #2, #3, #4, #10, #11 }] */
    /* JADX WARN: Removed duplicated region for block: B:93:0x01a5 A[Catch: all -> 0x014b, TRY_LEAVE, TryCatch #7 {all -> 0x014b, blocks: (B:3:0x000d, B:5:0x001b, B:6:0x0023, B:16:0x007b, B:18:0x0085, B:66:0x014a, B:62:0x0143, B:69:0x014f, B:93:0x01a5, B:96:0x01b2, B:90:0x019f, B:103:0x01be, B:106:0x01ca, B:107:0x01d1, B:108:0x01d2, B:109:0x01d5, B:110:0x01d6, B:111:0x01eb, B:59:0x013e, B:70:0x015f, B:73:0x0165, B:75:0x0171, B:77:0x017f, B:80:0x0186, B:81:0x018a, B:82:0x0191, B:7:0x002c, B:9:0x0035, B:15:0x005b, B:100:0x01b6, B:101:0x01bb, B:87:0x019a, B:19:0x008e, B:21:0x0097, B:24:0x00a8, B:50:0x012d, B:46:0x0126, B:53:0x0131, B:54:0x0136), top: B:132:0x000d, inners: #2, #3, #4, #10, #11 }] */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01b2 A[Catch: all -> 0x014b, TRY_ENTER, TRY_LEAVE, TryCatch #7 {all -> 0x014b, blocks: (B:3:0x000d, B:5:0x001b, B:6:0x0023, B:16:0x007b, B:18:0x0085, B:66:0x014a, B:62:0x0143, B:69:0x014f, B:93:0x01a5, B:96:0x01b2, B:90:0x019f, B:103:0x01be, B:106:0x01ca, B:107:0x01d1, B:108:0x01d2, B:109:0x01d5, B:110:0x01d6, B:111:0x01eb, B:59:0x013e, B:70:0x015f, B:73:0x0165, B:75:0x0171, B:77:0x017f, B:80:0x0186, B:81:0x018a, B:82:0x0191, B:7:0x002c, B:9:0x0035, B:15:0x005b, B:100:0x01b6, B:101:0x01bb, B:87:0x019a, B:19:0x008e, B:21:0x0097, B:24:0x00a8, B:50:0x012d, B:46:0x0126, B:53:0x0131, B:54:0x0136), top: B:132:0x000d, inners: #2, #3, #4, #10, #11 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.yff K(defpackage.g59 r23, defpackage.ch4 r24, defpackage.x45 r25) {
        /*
            Method dump skipped, instruction units count: 503
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gq7.K(g59, ch4, x45):yff");
    }

    public static final String L(String str, byte[] bArr) {
        int length = str.length();
        int iMax = Math.max(0, length - 2);
        int i = 0;
        int i2 = 0;
        while (true) {
            if (i >= iMax) {
                if (i == i2) {
                    return str;
                }
                if (i >= length) {
                    return tuc.E(0, i2, 5, bArr);
                }
            } else if (str.charAt(i) == '%') {
                int i3 = i + 3;
                try {
                    String strSubstring = str.substring(i + 1, i3);
                    kyd.I(16);
                    bArr[i2] = (byte) Integer.parseInt(strSubstring, 16);
                    i2++;
                    i = i3;
                } catch (NumberFormatException unused) {
                    bArr[i2] = (byte) str.charAt(i);
                    i2++;
                    i++;
                }
            }
            bArr[i2] = (byte) str.charAt(i);
            i2++;
            i++;
        }
    }

    public static final xff M(final yua yuaVar) throws IOException {
        int iI0 = yuaVar.i0();
        if (iI0 != 33639248) {
            throw new IOException("bad zip: expected " + s(33639248) + " but was " + s(iI0));
        }
        yuaVar.skip(4L);
        short sD = yuaVar.D();
        int i = sD & 65535;
        if ((sD & 1) != 0) {
            ik4.g("unsupported zip: general purpose bit flag=".concat(s(i)));
            return null;
        }
        int iD = yuaVar.D() & 65535;
        int iD2 = yuaVar.D() & 65535;
        int iD3 = yuaVar.D() & 65535;
        long jI0 = ((long) yuaVar.i0()) & 4294967295L;
        final qya qyaVar = new qya();
        qyaVar.a = ((long) yuaVar.i0()) & 4294967295L;
        final qya qyaVar2 = new qya();
        qyaVar2.a = ((long) yuaVar.i0()) & 4294967295L;
        int iD4 = yuaVar.D() & 65535;
        int iD5 = yuaVar.D() & 65535;
        int iD6 = yuaVar.D() & 65535;
        yuaVar.skip(8L);
        final qya qyaVar3 = new qya();
        qyaVar3.a = ((long) yuaVar.i0()) & 4294967295L;
        String strO = yuaVar.o(iD4);
        if (muc.R(strO, (char) 0)) {
            ik4.g("bad zip: filename contains 0x00");
            return null;
        }
        long j = qyaVar2.a == 4294967295L ? 8L : 0L;
        if (qyaVar.a == 4294967295L) {
            j += 8;
        }
        if (qyaVar3.a == 4294967295L) {
            j += 8;
        }
        final long j2 = j;
        final rya ryaVar = new rya();
        final rya ryaVar2 = new rya();
        final rya ryaVar3 = new rya();
        final nya nyaVar = new nya();
        N(yuaVar, iD5, new b55() { // from class: zff
            @Override // defpackage.b55
            public final Object invoke(Object obj, Object obj2) throws IOException {
                int iIntValue = ((Integer) obj).intValue();
                long jLongValue = ((Long) obj2).longValue();
                yua yuaVar2 = yuaVar;
                if (iIntValue == 1) {
                    nya nyaVar2 = nyaVar;
                    if (nyaVar2.a) {
                        ik4.g("bad zip: zip64 extra repeated");
                        return null;
                    }
                    nyaVar2.a = true;
                    if (jLongValue < j2) {
                        ik4.g("bad zip: zip64 extra too short");
                        return null;
                    }
                    qya qyaVar4 = qyaVar2;
                    long jR0 = qyaVar4.a;
                    if (jR0 == 4294967295L) {
                        jR0 = yuaVar2.r0();
                    }
                    qyaVar4.a = jR0;
                    qya qyaVar5 = qyaVar;
                    qyaVar5.a = qyaVar5.a == 4294967295L ? yuaVar2.r0() : 0L;
                    qya qyaVar6 = qyaVar3;
                    qyaVar6.a = qyaVar6.a == 4294967295L ? yuaVar2.r0() : 0L;
                } else if (iIntValue == 10) {
                    if (jLongValue < 4) {
                        ik4.g("bad zip: NTFS extra too short");
                        return null;
                    }
                    yuaVar2.skip(4L);
                    gq7.N(yuaVar2, (int) (jLongValue - 4), new agf(ryaVar, yuaVar2, ryaVar2, ryaVar3));
                }
                return c1e.a;
            }
        });
        if (j2 > 0 && !nyaVar.a) {
            ik4.g("bad zip: zip64 extra required but absent");
            return null;
        }
        String strO2 = yuaVar.o(iD6);
        String str = g59.b;
        return new xff(cd7.r("/").e(strO), tuc.F(strO, "/", false), strO2, jI0, qyaVar.a, qyaVar2.a, iD, qyaVar3.a, iD3, iD2, (Long) ryaVar.a, (Long) ryaVar2.a, (Long) ryaVar3.a, 57344);
    }

    public static final void N(yua yuaVar, int i, b55 b55Var) throws IOException {
        kz0 kz0Var = yuaVar.b;
        long j = i;
        while (j != 0) {
            if (j < 4) {
                ik4.g("bad zip: truncated header in extra field");
                return;
            }
            int iD = yuaVar.D() & 65535;
            long jD = ((long) yuaVar.D()) & 65535;
            long j2 = j - 4;
            if (j2 < jD) {
                ik4.g("bad zip: truncated value in extra field");
                return;
            }
            yuaVar.x0(jD);
            long j3 = kz0Var.b;
            b55Var.invoke(Integer.valueOf(iD), Long.valueOf(jD));
            long j4 = (kz0Var.b + jD) - j3;
            if (j4 < 0) {
                ik4.g(b09.w(iD, "unsupported zip: too many bytes processed for "));
                return;
            } else {
                if (j4 > 0) {
                    kz0Var.skip(j4);
                }
                j = j2 - jD;
            }
        }
    }

    public static final xff O(yua yuaVar, xff xffVar) throws IOException {
        int iI0 = yuaVar.i0();
        if (iI0 != 67324752) {
            throw new IOException("bad zip: expected " + s(67324752) + " but was " + s(iI0));
        }
        yuaVar.skip(2L);
        short sD = yuaVar.D();
        int i = sD & 65535;
        if ((sD & 1) != 0) {
            ik4.g("unsupported zip: general purpose bit flag=".concat(s(i)));
            return null;
        }
        yuaVar.skip(18L);
        long jD = ((long) yuaVar.D()) & 65535;
        int iD = yuaVar.D() & 65535;
        yuaVar.skip(jD);
        if (xffVar == null) {
            yuaVar.skip(iD);
            return null;
        }
        rya ryaVar = new rya();
        rya ryaVar2 = new rya();
        rya ryaVar3 = new rya();
        N(yuaVar, iD, new agf(yuaVar, ryaVar, ryaVar2, ryaVar3));
        return new xff(xffVar.a, xffVar.b, xffVar.c, xffVar.d, xffVar.e, xffVar.f, xffVar.g, xffVar.h, xffVar.i, xffVar.j, xffVar.k, xffVar.l, xffVar.m, (Integer) ryaVar.a, (Integer) ryaVar2.a, (Integer) ryaVar3.a);
    }

    public static final Object P(wx6 wx6Var, vx6 vx6Var, b55 b55Var, n92 n92Var) {
        Object objS;
        if (vx6Var != vx6.INITIALIZED) {
            return (((ky6) wx6Var).d != vx6.DESTROYED && (objS = o7f.s(new rna(wx6Var, vx6Var, b55Var, null, 5), n92Var)) == tb2.COROUTINE_SUSPENDED) ? objS : c1e.a;
        }
        ay0.e("repeatOnLifecycle cannot start work with the INITIALIZED lifecycle state.");
        return null;
    }

    public static final Object Q(iy6 iy6Var, vx6 vx6Var, b55 b55Var, n92 n92Var) {
        Object objP = P(iy6Var.getLifecycle(), vx6Var, b55Var, n92Var);
        return objP == tb2.COROUTINE_SUSPENDED ? objP : c1e.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object R(defpackage.nsb r5, float r6, defpackage.n92 r7) {
        /*
            boolean r0 = r7 instanceof defpackage.prb
            if (r0 == 0) goto L13
            r0 = r7
            prb r0 = (defpackage.prb) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            prb r0 = new prb
            r0.<init>(r7)
        L18:
            java.lang.Object r7 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L30
            if (r2 != r4) goto L2a
            oya r5 = r0.b
            defpackage.br7.v(r7)
            goto L4b
        L2a:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L30:
            defpackage.br7.v(r7)
            oya r7 = new oya
            r7.<init>()
            qrb r2 = new qrb
            r2.<init>(r7, r6, r3)
            r0.b = r7
            r0.d = r4
            s78 r6 = defpackage.s78.Default
            java.lang.Object r5 = r5.b(r6, r2, r0)
            if (r5 != r1) goto L4a
            return r1
        L4a:
            r5 = r7
        L4b:
            float r5 = r5.a
            java.lang.Float r6 = new java.lang.Float
            r6.<init>(r5)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gq7.R(nsb, float, n92):java.lang.Object");
    }

    public static final void S(qv8 qv8Var, int i, Object obj) {
        qv8Var.h[(qv8Var.i - qv8Var.d[qv8Var.e - 1].c) + i] = obj;
    }

    public static final void T(qv8 qv8Var, int i, Object obj, int i2, Object obj2) {
        int i3 = qv8Var.i - qv8Var.d[qv8Var.e - 1].c;
        Object[] objArr = qv8Var.h;
        objArr[i + i3] = obj;
        objArr[i3 + i2] = obj2;
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x0130 A[LOOP:2: B:46:0x012a->B:48:0x0130, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0153  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0181  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0187  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x018d  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0190 A[PHI: r5
      0x0190: PHI (r5v9 boolean) = (r5v11 boolean), (r5v12 boolean) binds: [B:58:0x018e, B:55:0x018a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0198  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.util.ArrayList V(java.util.List r65, gen.model.SourceParameter r66, boolean r67, boolean r68) {
        /*
            Method dump skipped, instruction units count: 583
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gq7.V(java.util.List, gen.model.SourceParameter, boolean, boolean):java.util.ArrayList");
    }

    public static d7e W(String str) {
        String strSubstring;
        String strSubstring2;
        String str2 = g59.b;
        String strL = !g76.L(str2, "/") ? tuc.L(str, str2, "/") : str;
        int i = 0;
        boolean z = true;
        int i2 = -1;
        int i3 = -1;
        int i4 = -1;
        int i5 = -1;
        int i6 = -1;
        while (i < strL.length()) {
            char cCharAt = strL.charAt(i);
            if (cCharAt != '#') {
                if (cCharAt != '/') {
                    if (cCharAt != ':') {
                        if (cCharAt == '?' && i4 == -1 && i2 == -1) {
                            i4 = i + 1;
                        }
                    } else if (z && i4 == -1 && i2 == -1) {
                        int i7 = i + 2;
                        if (i7 < str.length() && str.charAt(i + 1) == '/' && str.charAt(i7) == '/') {
                            i5 = i + 3;
                            z = false;
                            i6 = i;
                            i = i7;
                        } else if (strL.equals(str)) {
                            i3 = i + 1;
                            i6 = i;
                            i = i3;
                            i5 = i;
                        }
                    }
                } else if (i3 == -1 && i4 == -1 && i2 == -1) {
                    i3 = i5 == -1 ? 0 : i;
                    z = false;
                }
            } else if (i2 == -1) {
                i2 = i + 1;
            }
            i++;
        }
        int iMin = Math.min(i2 == -1 ? Integer.MAX_VALUE : i2 - 1, strL.length());
        int iMin2 = Math.min(i4 == -1 ? Integer.MAX_VALUE : i4 - 1, iMin);
        if (i5 != -1) {
            strSubstring2 = strL.substring(0, i6);
            strSubstring = strL.substring(i5, Math.min(i3 != -1 ? i3 : Integer.MAX_VALUE, iMin2));
        } else {
            strSubstring = null;
            strSubstring2 = null;
        }
        String strSubstring3 = i3 != -1 ? strL.substring(i3, iMin2) : null;
        String strSubstring4 = i4 != -1 ? strL.substring(i4, iMin) : null;
        String strSubstring5 = i2 != -1 ? strL.substring(i2, strL.length()) : null;
        byte[] bArr = new byte[Math.max(0, Math.max(strSubstring2 != null ? strSubstring2.length() : 0, Math.max(strSubstring != null ? strSubstring.length() : 0, Math.max(strSubstring3 != null ? strSubstring3.length() : 0, Math.max(strSubstring4 != null ? strSubstring4.length() : 0, strSubstring5 != null ? strSubstring5.length() : 0)))) - 2)];
        String strL2 = strSubstring2 != null ? L(strSubstring2, bArr) : null;
        String strL3 = strSubstring != null ? L(strSubstring, bArr) : null;
        String strL4 = strSubstring3 != null ? L(strSubstring3, bArr) : null;
        if (strSubstring4 != null) {
            L(strSubstring4, bArr);
        }
        if (strSubstring5 != null) {
            L(strSubstring5, bArr);
        }
        return new d7e(strL, str2, strL2, strL3, strL4);
    }

    public static String X(String str) {
        return str.length() <= 127 ? str : str.substring(0, 127);
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:101:0x0125  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x0150  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x0158  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x0161  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x0216  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x021a  */
    /* JADX WARN: Removed duplicated region for block: B:156:0x023f  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x0255  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x0262  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x02ea  */
    /* JADX WARN: Removed duplicated region for block: B:167:0x0302  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x0388  */
    /* JADX WARN: Removed duplicated region for block: B:176:0x0398  */
    /* JADX WARN: Removed duplicated region for block: B:178:0x039b  */
    /* JADX WARN: Removed duplicated region for block: B:188:0x03ec  */
    /* JADX WARN: Removed duplicated region for block: B:197:0x0450  */
    /* JADX WARN: Removed duplicated region for block: B:200:0x046a  */
    /* JADX WARN: Removed duplicated region for block: B:203:0x0482  */
    /* JADX WARN: Removed duplicated region for block: B:205:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00bc  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x00da  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0103  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(defpackage.r28 r56, defpackage.b55 r57, final java.lang.String r58, java.lang.String r59, long r60, java.lang.String r62, defpackage.m45 r63, java.lang.String r64, defpackage.m45 r65, float r66, float r67, defpackage.x12 r68, final int r69, final int r70, final int r71) {
        /*
            Method dump skipped, instruction units count: 1175
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gq7.a(r28, b55, java.lang.String, java.lang.String, long, java.lang.String, m45, java.lang.String, m45, float, float, x12, int, int, int):void");
    }

    public static final hec a0(hec hecVar, hec hecVar2) {
        hecVar.getClass();
        hecVar2.getClass();
        return kyd.a0(hecVar) ? hecVar : new j(hecVar, hecVar2);
    }

    public static final void b(eda edaVar, ek8 ek8Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1710084355);
        int i2 = (p65Var.f(edaVar) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        int i3 = 0;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            f(edaVar, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fda(edaVar, ek8Var, i, i3);
        }
    }

    public static frf b0(zb0 zb0Var, String str) {
        vp7.p(zb0Var);
        if (zb0Var instanceof fe5) {
            fe5 fe5Var = (fe5) zb0Var;
            return new frf(fe5Var.a, fe5Var.b, "google.com", null, null, str, null, null);
        }
        if (zb0Var instanceof v84) {
            return new frf(null, ((v84) zb0Var).a, "facebook.com", null, null, str, null, null);
        }
        if (zb0Var instanceof eud) {
            eud eudVar = (eud) zb0Var;
            return new frf(null, eudVar.a, "twitter.com", eudVar.b, null, str, null, null);
        }
        if (zb0Var instanceof ed5) {
            return new frf(null, ((ed5) zb0Var).a, "github.com", null, null, str, null, null);
        }
        if (zb0Var instanceof eb9) {
            return new frf(null, null, "playgames.google.com", null, ((eb9) zb0Var).a, str, null, null);
        }
        if (!(zb0Var instanceof lxf)) {
            ay0.e("Unsupported credential type.");
            return null;
        }
        lxf lxfVar = (lxf) zb0Var;
        frf frfVar = lxfVar.d;
        return frfVar != null ? frfVar : new frf(lxfVar.b, lxfVar.c, lxfVar.a, lxfVar.f, null, str, lxfVar.e, lxfVar.g);
    }

    public static final eaf c(int i) {
        return new eaf(i, i >> 31);
    }

    public static boolean c0(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static d7e d(String str) {
        String str2 = g59.b;
        StringBuilder sb = new StringBuilder();
        sb.append("file");
        sb.append(':');
        if (str != null) {
            sb.append(str);
        }
        return new d7e(sb.toString(), str2, "file", null, str);
    }

    public static final void e(m45 m45Var, m45 m45Var2, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        r28 r28Var2;
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-986748165);
        if ((i & 6) == 0) {
            i2 = i | (p65Var2.h(m45Var) ? 4 : 2);
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.h(m45Var2) ? 32 : 16;
        }
        int i3 = i2 | 384;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            long j = ((zo7) p65Var2.j(kt7.b)).a;
            o28 o28Var = o28.b;
            p65Var = p65Var2;
            hlg.a(m45Var2, pxf.E(24078659, new c60(25, m45Var), p65Var2), o28Var, pxf.E(1623227717, new c60(26, m45Var2), p65Var2), null, m40.i, m40.j, null, j, 0L, 0L, 0L, null, p65Var, ((i3 >> 3) & 14) | 1772976, 0, 16016);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new zk4(m45Var, m45Var2, r28Var2, i, 4);
        }
    }

    public static final void f(final eda edaVar, final ek8 ek8Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-294436918);
        int i2 = (p65Var.f(edaVar) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            String str = edaVar.d;
            String strW = edaVar.f;
            if (strW == null) {
                strW = km4.w(p65Var, 513971228, R.string.common_unknown_collection, p65Var, false);
            } else {
                p65Var.Y(513970484);
                p65Var.p(false);
            }
            kx kxVarW = ho2.w(p65Var, 513974982);
            String strQ = vo7.Q(R.string.notification_type_publication_featured_post_writer, new Object[]{strW, str}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                wjd wjdVar = new wjd(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), null, 14);
                int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i4 = i2 & 14;
                boolean z = (i3 == 32) | (i4 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z || objM == uobVar) {
                    final int i5 = 0;
                    objM = new e07() { // from class: gda
                        @Override // defpackage.e07
                        public final void a(d07 d07Var) {
                            int i6 = i5;
                            eda edaVar2 = edaVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i6) {
                                case 0:
                                    d07Var.getClass();
                                    ek8Var2.l(edaVar2.e, edaVar2.h);
                                    break;
                                default:
                                    d07Var.getClass();
                                    ek8Var2.j(edaVar2.c, edaVar2.h);
                                    break;
                            }
                        }
                    };
                    p65Var.j0(objM);
                }
                kxVarW.a(new b07("annotation_publication", wjdVar, (e07) objM), 0, strW.length());
                int iZ = muc.Z(strQ, str, 0, false, 6);
                wjd wjdVar2 = new wjd(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), null, 14);
                boolean z2 = (i4 == 4) | (i3 == 32);
                Object objM2 = p65Var.M();
                if (z2 || objM2 == uobVar) {
                    final int i6 = 1;
                    objM2 = new e07() { // from class: gda
                        @Override // defpackage.e07
                        public final void a(d07 d07Var) {
                            int i62 = i6;
                            eda edaVar2 = edaVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i62) {
                                case 0:
                                    d07Var.getClass();
                                    ek8Var2.l(edaVar2.e, edaVar2.h);
                                    break;
                                default:
                                    d07Var.getClass();
                                    ek8Var2.j(edaVar2.c, edaVar2.h);
                                    break;
                            }
                        }
                    };
                    p65Var.j0(objM2);
                }
                kxVarW.a(new b07("annotation_post", wjdVar2, (e07) objM2), iZ, str.length() + iZ);
                mx mxVarI = kxVarW.i();
                p65Var.p(false);
                rv8.e(edaVar.a, edaVar.b, pxf.E(-2088590125, new qg9(edaVar, 5, ek8Var), p65Var), mxVarI, p65Var, 384);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fda(edaVar, ek8Var, i, 1);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object g(defpackage.yrb r5, float r6, defpackage.ww r7, defpackage.p92 r8) {
        /*
            boolean r0 = r8 instanceof defpackage.nrb
            if (r0 == 0) goto L13
            r0 = r8
            nrb r0 = (defpackage.nrb) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            nrb r0 = new nrb
            r0.<init>(r8)
        L18:
            java.lang.Object r8 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L30
            if (r2 != r4) goto L2a
            oya r5 = r0.b
            defpackage.br7.v(r8)
            goto L4b
        L2a:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L30:
            defpackage.br7.v(r8)
            oya r8 = new oya
            r8.<init>()
            orb r2 = new orb
            r2.<init>(r6, r7, r8, r3)
            r0.b = r8
            r0.d = r4
            s78 r6 = defpackage.s78.Default
            java.lang.Object r5 = r5.b(r6, r2, r0)
            if (r5 != r1) goto L4a
            return r1
        L4a:
            r5 = r8
        L4b:
            float r5 = r5.a
            java.lang.Float r6 = new java.lang.Float
            r6.<init>(r5)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gq7.g(yrb, float, ww, p92):java.lang.Object");
    }

    public static final String h(Number number, Number number2) {
        return "Random range is empty: [" + number + ", " + number2 + ").";
    }

    public static final LinkedHashMap i(ArrayList arrayList) {
        String str = g59.b;
        g59 g59VarR = cd7.r("/");
        LinkedHashMap linkedHashMapR = ei7.R(new f09(g59VarR, new xff(g59VarR, true, null, 0L, 0L, 0L, 0, 0L, 0, 0, null, null, null, 65532)));
        for (xff xffVar : bu1.f1(arrayList, new lva(12))) {
            if (((xff) linkedHashMapR.put(xffVar.a, xffVar)) == null) {
                while (true) {
                    g59 g59Var = xffVar.a;
                    g59 g59VarC = g59Var.c();
                    if (g59VarC != null) {
                        xff xffVar2 = (xff) linkedHashMapR.get(g59VarC);
                        if (xffVar2 != null) {
                            xffVar2.q.add(g59Var);
                            break;
                        }
                        xff xffVar3 = new xff(g59VarC, true, null, 0L, 0L, 0L, 0, 0L, 0, 0, null, null, null, 65532);
                        linkedHashMapR.put(g59VarC, xffVar3);
                        xffVar3.q.add(g59Var);
                        xffVar = xffVar3;
                    }
                }
            }
        }
        return linkedHashMapR;
    }

    public static void l(boolean z, String str, Object... objArr) {
        if (!z) {
            throw new IllegalStateException(String.format(str, objArr));
        }
    }

    public static s08 o(s08 s08Var, ip6 ip6Var, mkd mkdVar, m73 m73Var, yy4 yy4Var) {
        if (s08Var != null && ip6Var == s08Var.a && il7.C(mkdVar, ip6Var).equals(s08Var.b) && m73Var.b() == s08Var.c.a && yy4Var == s08Var.d) {
            return s08Var;
        }
        s08 s08Var2 = s08.h;
        if (s08Var2 != null && ip6Var == s08Var2.a && il7.C(mkdVar, ip6Var).equals(s08Var2.b) && m73Var.b() == s08Var2.c.a && yy4Var == s08Var2.d) {
            return s08Var2;
        }
        s08 s08Var3 = new s08(ip6Var, il7.C(mkdVar, ip6Var), new p73(m73Var.b(), m73Var.U()), yy4Var);
        s08.h = s08Var3;
        return s08Var3;
    }

    public static final String r(d7e d7eVar) {
        List listZ = z(d7eVar);
        String str = d7eVar.b;
        if (listZ.isEmpty()) {
            return null;
        }
        String str2 = d7eVar.e;
        str2.getClass();
        if (!tuc.N(str2, str, false)) {
            str = "";
        }
        return bu1.F0(listZ, d7eVar.b, str, null, null, 60);
    }

    public static final String s(int i) {
        kyd.I(16);
        String string = Integer.toString(i, 16);
        string.getClass();
        return "0x".concat(string);
    }

    public static String w(Class cls) {
        LinkedHashMap linkedHashMap = tc8.b;
        String strValue = (String) linkedHashMap.get(cls);
        if (strValue == null) {
            rc8 rc8Var = (rc8) cls.getAnnotation(rc8.class);
            strValue = rc8Var != null ? rc8Var.value() : null;
            if (strValue == null || strValue.length() <= 0) {
                ywb.g("No @Navigator.Name annotation found for ".concat(cls.getSimpleName()));
                return null;
            }
            linkedHashMap.put(cls, strValue);
        }
        strValue.getClass();
        return strValue;
    }

    public static final List z(d7e d7eVar) {
        String str = d7eVar.e;
        if (str == null) {
            return ey3.a;
        }
        ArrayList arrayList = new ArrayList();
        int i = -1;
        while (i < str.length()) {
            int i2 = i + 1;
            int iY = muc.Y(str, '/', i2, 4);
            if (iY == -1) {
                iY = str.length();
            }
            String strSubstring = str.substring(i2, iY);
            if (strSubstring.length() > 0) {
                arrayList.add(strSubstring);
            }
            i = iY;
        }
        return arrayList;
    }

    public abstract int A();

    public abstract boolean F(float f);

    public abstract boolean G(View view);

    public abstract boolean H(float f, float f2);

    public abstract boolean U(View view, float f);

    public abstract void Y(ViewGroup.MarginLayoutParams marginLayoutParams, int i);

    public abstract void Z(ViewGroup.MarginLayoutParams marginLayoutParams, int i, int i2);

    public abstract int j(ViewGroup.MarginLayoutParams marginLayoutParams);

    public abstract float k(int i);

    public abstract String m(byte[] bArr, int i, int i2);

    public abstract int n(String str, byte[] bArr, int i, int i2);

    public abstract int p(ViewGroup.MarginLayoutParams marginLayoutParams);

    public abstract int q();

    public abstract int t();

    public abstract int u();

    public abstract int v();

    public abstract int x(View view);

    public abstract int y(CoordinatorLayout coordinatorLayout);
}
