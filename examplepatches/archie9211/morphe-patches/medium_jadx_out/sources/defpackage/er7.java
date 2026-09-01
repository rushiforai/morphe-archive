package defpackage;

import android.content.res.Resources;
import android.os.Build;
import android.view.MotionEvent;
import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import coil3.request.NullRequestDataException;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.medium.android.data.post.model.ReportRepostReason;
import com.medium.reader.R;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class er7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;

    public static final r28 A(r28 r28Var, i3c i3cVar) {
        r28Var.getClass();
        return guc.C(r28Var, new ff4(29, i3cVar));
    }

    public static final int B(int i, int i2) {
        return (i >> i2) & 31;
    }

    public static final Object[] C(Object[] objArr, int i, Object obj, Object obj2) {
        Object[] objArr2 = new Object[objArr.length + 2];
        k80.j0(0, i, 6, objArr, objArr2);
        k80.g0(i + 2, i, objArr.length, objArr, objArr2);
        objArr2[i] = obj;
        objArr2[i + 1] = obj2;
        return objArr2;
    }

    public static r28 D(r28 r28Var, m45 m45Var, boolean z, int i) {
        if ((i & 2) != 0) {
            z = true;
        }
        r28Var.getClass();
        m45Var.getClass();
        Boolean boolValueOf = Boolean.valueOf(z);
        x28 x28Var = new x28(z, m45Var);
        lb9 lb9Var = r4d.a;
        return r28Var.b(new q4d(null, boolValueOf, x28Var, 4));
    }

    public static final Object[] E(int i, Object[] objArr) {
        Object[] objArr2 = new Object[objArr.length - 2];
        k80.j0(0, i, 6, objArr, objArr2);
        k80.g0(i, i + 2, objArr.length, objArr, objArr2);
        return objArr2;
    }

    public static final Object[] F(int i, Object[] objArr) {
        Object[] objArr2 = new Object[objArr.length - 1];
        k80.j0(0, i, 6, objArr, objArr2);
        k80.g0(i, i + 1, objArr.length, objArr, objArr2);
        return objArr2;
    }

    public static final mn6 H(swd swdVar) throws gxd {
        swdVar.getClass();
        yv2 yv2VarH = swdVar.h();
        yv2VarH.getClass();
        int i = 0;
        if (yv2VarH instanceof do1) {
            List parameters = ((do1) yv2VarH).n().getParameters();
            parameters.getClass();
            ArrayList arrayList = new ArrayList(cu1.k0(parameters, 10));
            Iterator it2 = parameters.iterator();
            while (it2.hasNext()) {
                zvd zvdVarN = ((swd) it2.next()).n();
                zvdVarN.getClass();
                arrayList.add(zvdVarN);
            }
            List upperBounds = swdVar.getUpperBounds();
            upperBounds.getClass();
            vm6 vm6VarE = f93.e(swdVar);
            mn6 mn6VarH = new ixd(new pnc(i, arrayList)).h((mn6) bu1.x0(upperBounds), pqe.OUT_VARIANCE);
            return mn6VarH == null ? vm6VarE.o() : mn6VarH;
        }
        if (!(yv2VarH instanceof s55)) {
            ay0.e("Unsupported descriptor type to build star projection type based on type parameters of it");
            return null;
        }
        List typeParameters = ((s55) yv2VarH).getTypeParameters();
        typeParameters.getClass();
        ArrayList arrayList2 = new ArrayList(cu1.k0(typeParameters, 10));
        Iterator it3 = typeParameters.iterator();
        while (it3.hasNext()) {
            zvd zvdVarN2 = ((swd) it3.next()).n();
            zvdVarN2.getClass();
            arrayList2.add(zvdVarN2);
        }
        List upperBounds2 = swdVar.getUpperBounds();
        upperBounds2.getClass();
        vm6 vm6VarE2 = f93.e(swdVar);
        mn6 mn6VarH2 = new ixd(new pnc(i, arrayList2)).h((mn6) bu1.x0(upperBounds2), pqe.OUT_VARIANCE);
        return mn6VarH2 == null ? vm6VarE2.o() : mn6VarH2;
    }

    public static final void I(lb9 lb9Var, long j, x45 x45Var, boolean z) {
        MotionEvent motionEventA = lb9Var.a();
        if (motionEventA == null) {
            ay0.e("The PointerEvent receiver cannot have a null MotionEvent.");
            return;
        }
        int action = motionEventA.getAction();
        if (z) {
            motionEventA.setAction(3);
        }
        int i = (int) (j >> 32);
        int i2 = (int) (j & 4294967295L);
        motionEventA.offsetLocation(-Float.intBitsToFloat(i), -Float.intBitsToFloat(i2));
        x45Var.invoke(motionEventA);
        motionEventA.offsetLocation(Float.intBitsToFloat(i), Float.intBitsToFloat(i2));
        motionEventA.setAction(action);
    }

    public static Class J(Class cls) {
        return cls == Integer.TYPE ? Integer.class : cls == Float.TYPE ? Float.class : cls == Byte.TYPE ? Byte.class : cls == Double.TYPE ? Double.class : cls == Long.TYPE ? Long.class : cls == Character.TYPE ? Character.class : cls == Boolean.TYPE ? Boolean.class : cls == Short.TYPE ? Short.class : cls == Void.TYPE ? Void.class : cls;
    }

    public static Object K(int i) {
        if (i >= 2 && i <= 1073741824 && Integer.highestOneBit(i) == i) {
            return i <= 256 ? new byte[i] : i <= 65536 ? new short[i] : new int[i];
        }
        ay0.e(b09.A(new StringBuilder(String.valueOf(i).length() + 41), i, "must be power of 2 between 2^1 and 2^30: "));
        return null;
    }

    public static void L(String str, lbg lbgVar) {
        if (lbgVar != null) {
            return;
        }
        z72.c(ev6.x("null value in entry: ", str.toString(), "=null"));
    }

    public static int M(int i, Object obj) {
        return obj instanceof byte[] ? ((byte[]) obj)[i] & 255 : obj instanceof short[] ? (char) ((short[]) obj)[i] : ((int[]) obj)[i];
    }

    public static void N(int i, int i2, Object obj) {
        if (obj instanceof byte[]) {
            ((byte[]) obj)[i] = (byte) i2;
        } else if (obj instanceof short[]) {
            ((short[]) obj)[i] = (short) i2;
        } else {
            ((int[]) obj)[i] = i2;
        }
    }

    public static int O(Object obj, Object obj2, int i, Object obj3, int[] iArr, Object[] objArr, Object[] objArr2) {
        int i2;
        int i3;
        int I = gr7.I(obj);
        int i4 = I & i;
        int iM = M(i4, obj3);
        if (iM != 0) {
            int i5 = ~i;
            int i6 = I & i5;
            int i7 = -1;
            while (true) {
                i2 = iM - 1;
                int i8 = iArr[i2];
                i3 = i8 & i;
                if ((i8 & i5) != i6 || !Objects.equals(obj, objArr[i2]) || (objArr2 != null && !Objects.equals(obj2, objArr2[i2]))) {
                    if (i3 == 0) {
                        break;
                    }
                    i7 = i2;
                    iM = i3;
                } else {
                    break;
                }
            }
            if (i7 == -1) {
                N(i4, i3, obj3);
                return i2;
            }
            iArr[i7] = (iArr[i7] & i5) | (i3 & i);
            return i2;
        }
        return -1;
    }

    public static final void a(final mx mxVar, final r28 r28Var, final int i, final int i2, mkd mkdVar, final String str, x12 x12Var, final int i3) {
        p65 p65Var;
        final mkd mkdVar2;
        mkd mkdVar3;
        int i4;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1106785844);
        int i5 = i3 | (p65Var2.f(mxVar) ? 4 : 2);
        if ((i3 & 48) == 0) {
            i5 |= p65Var2.f(r28Var) ? 32 : 16;
        }
        int i6 = i5 | 8192;
        if (p65Var2.P(i6 & 1, (74899 & i6) != 74898)) {
            p65Var2.U();
            if ((i3 & 1) == 0 || p65Var2.z()) {
                mkdVar3 = ((bu7) p65Var2.j(jt7.c)).m;
                i4 = i6 & (-57345);
            } else {
                p65Var2.S();
                i4 = i6 & (-57345);
                mkdVar3 = mkdVar;
            }
            p65Var2.q();
            long j = ((zo7) p65Var2.j(kt7.b)).z;
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            boolean zF = p65Var2.f(mkdVar3) | p65Var2.e(j);
            Object objM = p65Var2.M();
            if (zF || objM == w12.a) {
                objM = new e8b(mkdVar3, j, 3);
                p65Var2.j0(objM);
            }
            r28 r28VarG = w2g.G(guc.A(r28VarD, (x45) objM), 28.0f, 0.0f, 0.0f, 0.0f, 14);
            r28 r28VarN = o28.b;
            if (str != null) {
                r28VarN = bgf.N(r28VarN, str);
            }
            p65Var = p65Var2;
            mkd mkdVar4 = mkdVar3;
            jjd.c(mxVar, r28VarG.b(r28VarN), 0L, 0L, 0L, null, 0L, i2, false, i, 0, null, null, mkdVar4, p65Var, i4 & 14, 24960, 241660);
            mkdVar2 = mkdVar4;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            mkdVar2 = mkdVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: s9e
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    er7.a(mxVar, r28Var, i, i2, mkdVar2, str, (x12) obj, tr7.y(i3 | 1));
                    return c1e.a;
                }
            };
        }
    }

    public static final r14 b(rx5 rx5Var, Throwable th) {
        ew5 ew5Var;
        if (th instanceof NullRequestDataException) {
            x45 x45Var = rx5Var.p;
            ox5 ox5Var = rx5Var.v;
            ew5Var = (ew5) x45Var.invoke(rx5Var);
            if (ew5Var == null) {
                ew5Var = (ew5) ox5Var.j.invoke(rx5Var);
            }
            if (ew5Var == null && (ew5Var = (ew5) rx5Var.o.invoke(rx5Var)) == null) {
                ew5Var = (ew5) ox5Var.i.invoke(rx5Var);
            }
        } else {
            ew5Var = (ew5) rx5Var.o.invoke(rx5Var);
            if (ew5Var == null) {
                ew5Var = (ew5) rx5Var.v.i.invoke(rx5Var);
            }
        }
        return new r14(ew5Var, rx5Var, th);
    }

    public static final void c(final y9e y9eVar, n8e n8eVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        final n8e n8eVar2 = n8eVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-935566908);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(y9eVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(n8eVar2) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            r28Var2 = r28Var;
            i2 |= p65Var.f(r28Var2) ? 256 : 128;
        } else {
            r28Var2 = r28Var;
        }
        final int i3 = 0;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            int i4 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i5 = i2 & 14;
            boolean z = (i4 == 32) | (i5 == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new m45() { // from class: r9e
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i6 = i3;
                        c1e c1eVar = c1e.a;
                        y9e y9eVar2 = y9eVar;
                        n8e n8eVar3 = n8eVar2;
                        switch (i6) {
                            case 0:
                                n8eVar3.a(y9eVar2.m, y9eVar2.f, y9eVar2.i);
                                break;
                            default:
                                n8eVar3.a(y9eVar2.m, y9eVar2.f, null);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM);
            }
            r28 r28VarN = bgf.N(w2g.G(hlg.r(r28Var2, false, null, null, (m45) objM, 15), 0.0f, 32.0f, 0.0f, 32.0f, 5), "highlight_" + y9eVar.a);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i6 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            String str = y9eVar.b;
            String str2 = y9eVar.c;
            boolean z2 = y9eVar.d;
            String strR = vo7.R(p65Var, R.string.user_activity_highlighted);
            Long lValueOf = Long.valueOf(y9eVar.e);
            o28 o28Var = o28.b;
            w2g.a(str, str2, z2, R.drawable.ic_highlight_filled_16, strR, lValueOf, w2g.G(o28Var, 22.0f, 0.0f, 22.0f, 0.0f, 10), 0L, null, p65Var, 1572864, 384);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            mx mxVarX = pxf.x(y9eVar.j, y9eVar.k, 0, p65Var, y9eVar.h, y9eVar.l);
            ((jp7) p65Var.j(kt7.a)).getClass();
            int i7 = jp7.a(p65Var) == ip7.COMPACT ? 6 : 5;
            r28 r28VarN2 = bgf.N(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), "highlight_text");
            sn3 sn3Var = jt7.c;
            jjd.c(mxVarX, r28VarN2, 0L, 0L, 0L, null, 0L, 2, false, i7, 0, null, null, ((bu7) p65Var.j(sn3Var)).r, p65Var, 48, 384, 241660);
            hp7.t(p65Var, jfc.l(o28Var, 12.0f));
            p65Var.Y(-1855676576);
            kx kxVar = new kx();
            p65Var.Y(-1855675560);
            int iH = kxVar.h(new skc(((zo7) p65Var.j(kt7.b)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVar.d(vo7.R(p65Var, R.string.user_activity_in));
                kxVar.f(iH);
                p65Var.p(false);
                kxVar.d(" ");
                kxVar.d(y9eVar.g);
                mx mxVarI = kxVar.i();
                p65Var.p(false);
                r28 r28VarY = r40.y(w2g.G(o28Var, 22.0f, 0.0f, 22.0f, 0.0f, 10), bmb.a(4.0f));
                boolean z3 = (i4 == 32) | (i5 == 4);
                Object objM2 = p65Var.M();
                if (z3 || objM2 == uobVar) {
                    n8eVar2 = n8eVar;
                    final int i8 = 1;
                    objM2 = new m45() { // from class: r9e
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i62 = i8;
                            c1e c1eVar = c1e.a;
                            y9e y9eVar2 = y9eVar;
                            n8e n8eVar3 = n8eVar2;
                            switch (i62) {
                                case 0:
                                    n8eVar3.a(y9eVar2.m, y9eVar2.f, y9eVar2.i);
                                    break;
                                default:
                                    n8eVar3.a(y9eVar2.m, y9eVar2.f, null);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                } else {
                    n8eVar2 = n8eVar;
                }
                jjd.c(mxVarI, bgf.N(w2g.F(hlg.r(r28VarY, false, null, null, (m45) objM2, 15), 2.0f, 4.0f, 2.0f, 4.0f), "highlight_post_title"), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 0, 0, 262140);
                p65Var = p65Var;
                p65Var.p(true);
            } catch (Throwable th) {
                kxVar.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i, 22, y9eVar, n8eVar2, r28Var);
        }
    }

    public static final void e(x9e x9eVar, n8e n8eVar, sh9 sh9Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1015660247);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(x9eVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(n8eVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(sh9Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i2 & 1, (i2 & 1171) != 1170)) {
            dr9 dr9Var = x9eVar.f;
            boolean zF = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var2.f(dr9Var);
            Object objM = p65Var2.M();
            if (zF || objM == w12.a) {
                objM = new nbb(n8eVar, 25, dr9Var);
                p65Var2.j0(objM);
            }
            r28 r28VarN = bgf.N(w2g.G(hlg.r(r28Var, false, null, null, (m45) objM, 15), 0.0f, 0.0f, 0.0f, 32.0f, 7), "post_clapped_" + x9eVar.a);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j = p65Var2.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, wv1VarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            String str = x9eVar.b;
            String str2 = x9eVar.c;
            boolean z = x9eVar.d;
            String strR = vo7.R(p65Var2, R.string.user_activity_clapped);
            Long lValueOf = Long.valueOf(x9eVar.e);
            o28 o28Var = o28.b;
            p65Var = p65Var2;
            w2g.a(str, str2, z, R.drawable.ic_clap_filled_16, strR, lValueOf, w2g.G(o28Var, 22.0f, 28.0f, 22.0f, 0.0f, 8), 0L, null, p65Var, 1572864, 384);
            ((jp7) p65Var.j(kt7.a)).getClass();
            il7.k(dr9Var, jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L, sh9Var, bgf.N(o28Var, "post_clapped_stream_post"), new jy8(22.0f, 0.0f, 12.0f, 12.0f), p65Var, (i2 & 896) | 3072, 0);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, 26, x9eVar, n8eVar, sh9Var, r28Var);
        }
    }

    public static final void f(j6b j6bVar, e6b e6bVar, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1161663500);
        int i2 = (p65Var.f(j6bVar) ? 4 : 2) | i | (p65Var.f(e6bVar) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            r28 r28VarJ = ka1.j((jp7) p65Var.j(kt7.a), o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            boolean z = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i2 & 14) == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new c6b(2, e6bVar, j6bVar);
                p65Var.j0(objM);
            }
            fo7.l((m45) objM, vo7.R(p65Var, R.string.common_report), xn7.L, bgf.N(jfc.d(w2g.F(o28Var, 24.0f, 21.0f, 24.0f, 21.0f), 1.0f), "button_report"), j6bVar.c, p65Var, 3456, 0);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new a6b(i, e6bVar, j6bVar);
        }
    }

    public static final void g(j6b j6bVar, final e6b e6bVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        boolean z;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2100565266);
        int i3 = i | (p65Var.f(j6bVar) ? 4 : 2) | (p65Var.f(e6bVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarR3 = wgf.R(r28Var, wgf.K(p65Var), false, 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarR3);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            ReportRepostReason reportRepostReason = j6bVar.a;
            boolean z2 = reportRepostReason == ReportRepostReason.HARASSMENT;
            String strR = vo7.R(p65Var, R.string.report_repost_reason_harassment);
            int i7 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z3 = i7 == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z3 || objM == uobVar) {
                final int i8 = 0;
                objM = new m45() { // from class: b6b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i9 = i8;
                        c1e c1eVar = c1e.a;
                        e6b e6bVar2 = e6bVar;
                        switch (i9) {
                            case 0:
                                e6bVar2.a(ReportRepostReason.HARASSMENT);
                                break;
                            case 1:
                                e6bVar2.a(ReportRepostReason.RULES_VIOLATION);
                                break;
                            case 2:
                                e6bVar2.a(ReportRepostReason.SPAM);
                                break;
                            default:
                                e6bVar2.a(ReportRepostReason.AI_GENERATED_CONTENT);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM);
            }
            aq7.e(z2, strR, (m45) objM, bgf.N(o28Var, "radio_button_harassment"), p65Var, 3072);
            boolean z4 = reportRepostReason == ReportRepostReason.RULES_VIOLATION;
            String strR2 = vo7.R(p65Var, R.string.report_repost_reason_rules_violation);
            boolean z5 = i7 == 32;
            Object objM2 = p65Var.M();
            if (z5 || objM2 == uobVar) {
                final int i9 = 1;
                objM2 = new m45() { // from class: b6b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i92 = i9;
                        c1e c1eVar = c1e.a;
                        e6b e6bVar2 = e6bVar;
                        switch (i92) {
                            case 0:
                                e6bVar2.a(ReportRepostReason.HARASSMENT);
                                break;
                            case 1:
                                e6bVar2.a(ReportRepostReason.RULES_VIOLATION);
                                break;
                            case 2:
                                e6bVar2.a(ReportRepostReason.SPAM);
                                break;
                            default:
                                e6bVar2.a(ReportRepostReason.AI_GENERATED_CONTENT);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM2);
            }
            aq7.e(z4, strR2, (m45) objM2, bgf.N(o28Var, "radio_button_rules_violation"), p65Var, 3072);
            boolean z6 = reportRepostReason == ReportRepostReason.SPAM;
            String strR3 = vo7.R(p65Var, R.string.report_repost_reason_spam);
            boolean z7 = i7 == 32;
            Object objM3 = p65Var.M();
            if (z7 || objM3 == uobVar) {
                final int i10 = 2;
                objM3 = new m45() { // from class: b6b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i92 = i10;
                        c1e c1eVar = c1e.a;
                        e6b e6bVar2 = e6bVar;
                        switch (i92) {
                            case 0:
                                e6bVar2.a(ReportRepostReason.HARASSMENT);
                                break;
                            case 1:
                                e6bVar2.a(ReportRepostReason.RULES_VIOLATION);
                                break;
                            case 2:
                                e6bVar2.a(ReportRepostReason.SPAM);
                                break;
                            default:
                                e6bVar2.a(ReportRepostReason.AI_GENERATED_CONTENT);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM3);
            }
            aq7.e(z6, strR3, (m45) objM3, bgf.N(o28Var, "radio_button_spam"), p65Var, 3072);
            boolean z8 = reportRepostReason == ReportRepostReason.AI_GENERATED_CONTENT;
            String strR4 = vo7.R(p65Var, R.string.report_repost_reason_ai_generated_content);
            boolean z9 = i7 == 32;
            Object objM4 = p65Var.M();
            if (z9 || objM4 == uobVar) {
                final int i11 = 3;
                objM4 = new m45() { // from class: b6b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i92 = i11;
                        c1e c1eVar = c1e.a;
                        e6b e6bVar2 = e6bVar;
                        switch (i92) {
                            case 0:
                                e6bVar2.a(ReportRepostReason.HARASSMENT);
                                break;
                            case 1:
                                e6bVar2.a(ReportRepostReason.RULES_VIOLATION);
                                break;
                            case 2:
                                e6bVar2.a(ReportRepostReason.SPAM);
                                break;
                            default:
                                e6bVar2.a(ReportRepostReason.AI_GENERATED_CONTENT);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM4);
            }
            aq7.e(z8, strR4, (m45) objM4, bgf.N(o28Var, "radio_button_ai_generated_content"), p65Var, 3072);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            boolean z10 = j6bVar.b;
            String strR5 = vo7.R(p65Var, R.string.report_repost_block_user);
            boolean z11 = i7 == 32;
            Object objM5 = p65Var.M();
            if (z11 || objM5 == uobVar) {
                objM5 = new eb8(19, e6bVar);
                p65Var.j0(objM5);
            }
            bgf.i(z10, strR5, (x45) objM5, bgf.N(o28Var, "checkbox_block_reposter"), false, p65Var, 3072);
            hp7.t(p65Var, jfc.l(o28Var, 25.0f));
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            String strN = y30.n(24.0f, R.string.report_repost_report_violation, p65Var, p65Var, o28Var);
            int i12 = i3 & 14;
            boolean z12 = (i7 == 32) | (i12 == 4);
            Object objM6 = p65Var.M();
            if (z12 || objM6 == uobVar) {
                i2 = 0;
                objM6 = new c6b(i2, e6bVar, j6bVar);
                p65Var.j0(objM6);
            } else {
                i2 = 0;
            }
            p(3072, 2, p65Var, (m45) objM6, bgf.N(o28Var, "row_report_violation"), strN, null);
            String strR6 = vo7.R(p65Var, R.string.report_repost_read_our_rules_title);
            String strR7 = vo7.R(p65Var, R.string.report_repost_read_our_rules_description);
            int i13 = (i7 == 32 ? 1 : i2) | (i12 == 4 ? 1 : i2);
            Object objM7 = p65Var.M();
            if (i13 != 0 || objM7 == uobVar) {
                z = true;
                objM7 = new c6b(1 == true ? 1 : 0, e6bVar, j6bVar);
                p65Var.j0(objM7);
            } else {
                z = true;
            }
            p(3072, 0, p65Var, (m45) objM7, bgf.N(o28Var, "row_rules"), strR6, strR7);
            p65Var = p65Var;
            b09.H(p65Var, z, z, z);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i, 28, j6bVar, e6bVar, r28Var);
        }
    }

    public static final void h(j6b j6bVar, nhc nhcVar, e6b e6bVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        j6bVar.getClass();
        nhcVar.getClass();
        e6bVar.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1561282787);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(j6bVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(e6bVar) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i2 & 1, (i2 & 1171) != 1170)) {
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new qna(11);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(bgf.N(wxb.a(r28Var, false, (x45) objM), "report_repost_screen"), pxf.E(1416053223, new d6b(e6bVar), p65Var2), pxf.E(1994819368, new a6b(j6bVar, e6bVar), p65Var2), pxf.E(-1721381783, new w87(nhcVar, 19), p65Var2), null, 0, 0L, 0L, null, pxf.E(-610291598, new qg9(j6bVar, 14, e6bVar), p65Var2), p65Var, 805309872, 496);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, 12, j6bVar, nhcVar, e6bVar, r28Var);
        }
    }

    public static final void i(String str, String str2, String str3, my6 my6Var, r28 r28Var, k6b k6bVar, x12 x12Var, int i) {
        r28 r28Var2;
        k6b k6bVar2;
        k6b k6bVar3;
        int i2;
        r28 r28Var3;
        k6b k6bVar4;
        b09.I(str, str2, str3);
        p65 p65Var = (p65) x12Var;
        p65Var.a0(687663468);
        int i3 = 2;
        int i4 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(str3) ? 256 : 128) | (p65Var.f(my6Var) ? 2048 : 1024) | 90112;
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            p65Var.U();
            int i5 = i & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 896) == 256);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new ta4(i3, str, str2, str3);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    k6bVar3 = (k6b) to7.z(n1b.a.b(k6b.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i2 = i4 & (-458753);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var.S();
                i2 = i4 & (-458753);
                r28Var3 = r28Var;
                k6bVar3 = k6bVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(k6bVar3.h, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            int i6 = i2 & 7168;
            boolean z2 = i6 == 2048;
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new e6b(my6Var, k6bVar3);
                p65Var.j0(objM2);
            }
            r28 r28Var4 = r28Var3;
            h((j6b) l78VarZ.getValue(), nhcVarF, (e6b) objM2, r28Var4, p65Var, 3072);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(k6bVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | (i6 == 2048);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                k6bVar4 = k6bVar3;
                rna rnaVar = new rna(k6bVar4, nhcVarF, resources, my6Var, null, 7);
                p65Var.j0(rnaVar);
                objM3 = rnaVar;
            } else {
                k6bVar4 = k6bVar3;
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
            k6bVar2 = k6bVar4;
            r28Var2 = r28Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            k6bVar2 = k6bVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(str, str2, str3, my6Var, r28Var2, k6bVar2, i, 21);
        }
    }

    public static final void j(e6b e6bVar, x12 x12Var, int i) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1693065524);
        int i2 = (p65Var2.f(e6bVar) ? 4 : 2) | i;
        if (p65Var2.P(i2 & 1, (i2 & 3) != 2)) {
            String strR = vo7.R(p65Var2, R.string.report_repost_title);
            boolean z = (i2 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new uta(0, e6bVar, e6b.class, "onClose", "onClose()V", 0, 8);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.b(null, strR, (m45) ((qh6) objM), null, vn7.J(R.drawable.ic_close_24, 0, p65Var2), vo7.R(p65Var2, R.string.common_close), 0L, 0L, p65Var, 32768, Mp4VideoDirectory.TAG_VENDOR);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d6b(e6bVar, i);
        }
    }

    public static final void k(sw5 sw5Var, String str, m45 m45Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        String strW;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1559331421);
        int i2 = i | (p65Var2.f(sw5Var) ? 4 : 2) | (p65Var2.f(str) ? 32 : 16) | (p65Var2.h(m45Var) ? 256 : 128);
        int i3 = 1;
        if (p65Var2.P(i2 & 1, (i2 & 1171) != 1170)) {
            amb ambVarA = bmb.a(2.0f);
            r28 r28VarB = bo.B(r40.y(r28Var, ambVarA), 1.0f, ((zo7) p65Var2.j(kt7.b)).z, ambVarA);
            if (m45Var != null) {
                r28VarB = hlg.r(r28VarB, false, null, null, m45Var, 15);
            }
            r28 r28VarC = w2g.C(r28VarB, 10.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var2, 48);
            long j = p65Var2.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarC);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, ombVarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            k40.c(u57.a.a(bo.a0(p65Var2)), pxf.E(1902640057, new v61(sw5Var, pwd.i(40.0f, 28.0f), i3), p65Var2), p65Var2, 56);
            o28 o28Var = o28.b;
            hp7.t(p65Var2, jfc.l(o28Var, 12.0f));
            if (str == null) {
                strW = km4.w(p65Var2, 758761287, R.string.common_untitled_story, p65Var2, false);
            } else {
                p65Var2.Y(758760884);
                p65Var2.p(false);
                strW = str;
            }
            jjd.b(strW, bgf.N(o28Var, "repost_story_title"), 0L, 0L, 0L, null, null, 0L, 2, false, 2, 0, null, mkd.a(((bu7) p65Var2.j(jt7.c)).j, 0L, en7.B(14), null, null, null, 0L, 0L, null, 0, en7.B(18), null, null, 16646141), p65Var2, 48, 24960, 110588);
            p65Var = p65Var2;
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i, 23, sw5Var, str, m45Var, r28Var);
        }
    }

    public static final void l(z9e z9eVar, n8e n8eVar, sh9 sh9Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(200151629);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(z9eVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(n8eVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(sh9Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            int i3 = i2 & 14;
            boolean z = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | (i3 == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new nbb(n8eVar, 27, z9eVar);
                p65Var.j0(objM);
            }
            r28 r28VarN = bgf.N(w2g.G(hlg.r(r28VarD, false, null, null, (m45) objM, 15), 0.0f, 32.0f, 0.0f, 32.0f, 5), "response_to_post_" + z9eVar.a);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            String str = z9eVar.b;
            String str2 = z9eVar.c;
            boolean z2 = z9eVar.d;
            String strR = vo7.R(p65Var, R.string.user_activity_responded);
            Long lValueOf = Long.valueOf(z9eVar.e);
            o28 o28Var = o28.b;
            w2g.a(str, str2, z2, R.drawable.ic_respond_filled_16, strR, lValueOf, w2g.G(o28Var, 22.0f, 0.0f, 22.0f, 0.0f, 10), 0L, null, p65Var, 1572864, 384);
            hp7.t(p65Var, jfc.l(o28Var, 14.0f));
            a(z9eVar.h, w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 4, 2, null, "response_content", p65Var, 200112);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.l(o28Var, 20.0f));
            dr9 dr9Var = z9eVar.f;
            sw5 sw5Var = dr9Var.b;
            String str3 = dr9Var.c;
            boolean z3 = ((i2 & 896) == 256) | (i3 == 4);
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                objM2 = new nbb(sh9Var, 28, z9eVar);
                p65Var.j0(objM2);
            }
            k(sw5Var, str3, (m45) objM2, bgf.N(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), "response_root_post"), p65Var, 3072);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, 25, z9eVar, n8eVar, sh9Var, r28Var);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void m(final aae aaeVar, final n8e n8eVar, sh9 sh9Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        final int i3;
        Object obj;
        int i4;
        r28 r28VarR;
        String strW;
        Object obj2;
        Object obj3 = sh9Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1711905261);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(aaeVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(n8eVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(obj3) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i2 & 1, (i2 & 1171) != 1170)) {
            r28 r28VarG = w2g.G(jfc.d(r28Var, 1.0f), 0.0f, 32.0f, 0.0f, 32.0f, 5);
            String str = aaeVar.a;
            String str2 = aaeVar.i;
            r28 r28VarN = bgf.N(r28VarG, "response_to_response_" + str);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j = p65Var2.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarN);
            r12.W.getClass();
            m45 m45Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(m45Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR2);
            String str3 = aaeVar.b;
            String str4 = aaeVar.c;
            boolean z = aaeVar.d;
            String strR = vo7.R(p65Var2, R.string.user_activity_responded);
            Long lValueOf = Long.valueOf(aaeVar.e);
            o28 o28Var = o28.b;
            int i6 = i2;
            w2g.a(str3, str4, z, R.drawable.ic_respond_filled_16, strR, lValueOf, w2g.G(o28Var, 22.0f, 0.0f, 22.0f, 0.0f, 10), 0L, null, p65Var2, 1572864, 384);
            hp7.t(p65Var2, jfc.l(o28Var, 14.0f));
            mx mxVar = aaeVar.m;
            int i7 = i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i8 = i6 & 14;
            boolean z2 = (i8 == 4) | (i7 == 32);
            Object objM = p65Var2.M();
            Object obj4 = w12.a;
            if (z2 || objM == obj4) {
                i3 = 0;
                Object obj5 = new m45() { // from class: t9e
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i9 = i3;
                        c1e c1eVar = c1e.a;
                        aae aaeVar2 = aaeVar;
                        n8e n8eVar2 = n8eVar;
                        switch (i9) {
                            case 0:
                                n8eVar2.b(aaeVar2.l, aaeVar2.n);
                                break;
                            default:
                                n8eVar2.b(aaeVar2.g, aaeVar2.n);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var2.j0(obj5);
                obj = obj5;
            } else {
                i3 = 0;
                obj = objM;
            }
            boolean z3 = i3;
            a(mxVar, w2g.G(hlg.r(o28Var, false, null, null, (m45) obj, 15), 24.0f, 0.0f, 24.0f, 0.0f, 10), 4, 2, null, "response_content", p65Var2, 200064);
            hp7.t(p65Var2, jfc.l(o28Var, 16.0f));
            r28 r28VarG2 = w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10);
            Object obj6 = aaeVar.h;
            if (obj6 == null) {
                p65Var2.Y(2075207783);
                p65Var2.p(z3);
                i4 = i8;
                r28VarR = null;
            } else {
                p65Var2.Y(2075207784);
                i4 = i8;
                boolean z4 = (p65Var2.f(obj6) ? 1 : 0) | (i7 == 32 ? true : z3 ? 1 : 0) | (i4 == 4 ? true : z3 ? 1 : 0);
                Object objM2 = p65Var2.M();
                Object obj7 = objM2;
                if (z4 != 0 || objM2 == obj4) {
                    Object ukdVar = new ukd(n8eVar, obj6, aaeVar, 2);
                    p65Var2.j0(ukdVar);
                    obj7 = ukdVar;
                }
                r28VarR = hlg.r(o28Var, false, null, null, (m45) obj7, 15);
                p65Var2.p(z3);
            }
            if (r28VarR == null) {
                r28VarR = o28Var;
            }
            r28 r28VarB = r28VarG2.b(r28VarR);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var2, 48);
            long j2 = p65Var2.T;
            int i9 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, r28VarB);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(m45Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, ombVarA);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i9, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            String str5 = aaeVar.j;
            int i10 = i4;
            d46.a(str5 != null ? str5 : null, hl0.XXXS, null, null, null, null, null, 0.0f, 0, null, null, p65Var2, 48, 0, 4092);
            hp7.t(p65Var2, jfc.l(o28Var, 8.0f));
            if (str2 != null) {
                p65Var2.Y(1979209070);
                p65Var2.p(z3);
                strW = str2;
            } else {
                strW = km4.w(p65Var2, 1979210751, R.string.common_unknown_user, p65Var2, z3);
            }
            jjd.b(strW, new sq6(1.0f, z3), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var2.j(jt7.c)).n, p65Var2, 0, 24960, 110588);
            p65 p65Var3 = p65Var2;
            p65Var3.p(true);
            hp7.t(p65Var3, jfc.l(o28Var, 16.0f));
            mx mxVar2 = new mx(aaeVar.k);
            boolean z5 = (i10 == 4 ? true : z3 ? 1 : 0) | (i7 == 32 ? true : z3 ? 1 : 0);
            Object objM3 = p65Var3.M();
            Object obj8 = objM3;
            if (z5 != 0 || objM3 == obj4) {
                final int i11 = 1;
                Object obj9 = new m45() { // from class: t9e
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i92 = i11;
                        c1e c1eVar = c1e.a;
                        aae aaeVar2 = aaeVar;
                        n8e n8eVar2 = n8eVar;
                        switch (i92) {
                            case 0:
                                n8eVar2.b(aaeVar2.l, aaeVar2.n);
                                break;
                            default:
                                n8eVar2.b(aaeVar2.g, aaeVar2.n);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var3.j0(obj9);
                obj8 = obj9;
            }
            a(mxVar2, w2g.G(hlg.r(o28Var, false, null, null, (m45) obj8, 15), 24.0f, 0.0f, 24.0f, 0.0f, 10), 4, 2, null, "response_response_content", p65Var3, 200064);
            hp7.t(p65Var3, jfc.l(o28Var, 20.0f));
            dr9 dr9Var = aaeVar.f;
            sw5 sw5Var = dr9Var.b;
            String str6 = dr9Var.c;
            char c2 = (i6 & 896) == 256 ? (char) 1 : z3 ? 1 : 0;
            boolean z6 = z3;
            if (i10 == 4) {
                z6 = 1;
            }
            int i12 = c2 | z6;
            Object objM4 = p65Var3.M();
            if (i12 != 0 || objM4 == obj4) {
                obj3 = sh9Var;
                Object nbbVar = new nbb(obj3, 26, aaeVar);
                p65Var3.j0(nbbVar);
                obj2 = nbbVar;
            } else {
                obj3 = sh9Var;
                obj2 = objM4;
            }
            k(sw5Var, str6, (m45) obj2, bgf.N(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), "response_root_post"), p65Var3, 3072);
            p65Var3.p(true);
            p65Var = p65Var3;
        } else {
            p65Var2.S();
            p65Var = p65Var2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, 27, aaeVar, n8eVar, obj3, r28Var);
        }
    }

    public static final void n(atb atbVar, String str, pub pubVar, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1645925645);
        int i2 = i | (p65Var.f(atbVar) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.f(pubVar) ? 256 : 128) | 3072;
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            int iA = vj3.a(((m73) p65Var.j(z22.h)).N(((Resources) p65Var.j(eo.c)).getDisplayMetrics().widthPixels), 784.0f);
            o28 o28Var = o28.b;
            if (iA <= 0) {
                p65Var.Y(1871232423);
                br7.g(atbVar.a, atbVar.b, atbVar.c, pubVar, jfc.d(w2g.F(o28Var, 4.0f, 8.0f, 24.0f, 8.0f), 1.0f), str, p65Var, ((i2 << 3) & 7168) | ((i2 << 12) & 458752), 0);
                p65Var.p(false);
            } else {
                p65Var.Y(1871636229);
                r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), w2g.G(o28Var, 0.0f, 0.0f, 68.0f, 0.0f, 11), 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, false);
                long j = p65Var.T;
                int i3 = (int) (j ^ (j >>> 32));
                i89 i89VarL = p65Var.l();
                r28 r28VarR = gx1.R(p65Var, r28VarX);
                r12.W.getClass();
                ot2 ot2Var = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var, cuVar, zk7VarC);
                cu cuVar2 = q12.e;
                tp7.B(p65Var, cuVar2, i89VarL);
                Integer numValueOf = Integer.valueOf(i3);
                cu cuVar3 = q12.g;
                tp7.B(p65Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var, fnVar);
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR);
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, false);
                long j2 = p65Var.T;
                int i4 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL2);
                ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR2);
                br7.g(atbVar.a, atbVar.b, atbVar.c, pubVar, jfc.d(w2g.E(o28Var, 0.0f, 8.0f, 1), 1.0f), str, p65Var, ((i2 << 3) & 7168) | 24576 | ((i2 << 12) & 458752), 0);
                b09.H(p65Var, true, true, false);
            }
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i, 3, atbVar, str, pubVar, r28Var2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0138  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0144  */
    /* JADX WARN: Removed duplicated region for block: B:54:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void o(defpackage.atb r19, defpackage.pub r20, defpackage.r28 r21, java.lang.String r22, defpackage.x12 r23, int r24, int r25) {
        /*
            Method dump skipped, instruction units count: 340
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.er7.o(atb, pub, r28, java.lang.String, x12, int, int):void");
    }

    public static final void p(int i, int i2, x12 x12Var, m45 m45Var, r28 r28Var, String str, String str2) {
        String str3;
        int i3;
        String str4;
        String str5;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1130000241);
        int i4 = i | (p65Var.f(str) ? 4 : 2);
        int i5 = i2 & 2;
        if (i5 != 0) {
            i3 = i4 | 48;
            str3 = str2;
        } else {
            str3 = str2;
            i3 = i4 | (p65Var.f(str3) ? 32 : 16);
        }
        int i6 = i3 | (p65Var.h(m45Var) ? 256 : 128);
        if (p65Var.P(i6 & 1, (i6 & 1171) != 1170)) {
            String str6 = i5 != 0 ? null : str3;
            r28 r28VarR = hlg.r(jfc.d(r28Var, 1.0f), false, null, new vkb(0), m45Var, 11);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i7 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarR);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i7);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR2);
            o28 o28Var = o28.b;
            r28 r28VarF = jfc.f(o28Var, 48.0f, 0.0f, 2);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i8 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarF);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarU = km4.u(1.0f, w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), true);
            sn3 sn3Var = jt7.c;
            jjd.b(str, r28VarU, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).l, p65Var, i6 & 14, 0, 131068);
            p65Var = p65Var;
            boolean z = false;
            c09 c09VarJ = vn7.J(R.drawable.ic_chevron_forward, 0, p65Var);
            r28 r28VarG = w2g.G(o28Var, 0.0f, 0.0f, 16.0f, 0.0f, 11);
            sn3 sn3Var2 = kt7.b;
            qv5.b(c09VarJ, null, r28VarG, ((zo7) p65Var.j(sn3Var2)).o, p65Var, 440, 0);
            p65Var.p(true);
            if (str6 != null) {
                p65Var.Y(-1420972860);
                str5 = str6;
                jjd.b(str5, w2g.G(o28Var, 24.0f, 0.0f, 64.0f, 0.0f, 10), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).m, ((zo7) p65Var.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, ((i6 >> 3) & 14) | 48, 0, 131068);
                p65Var = p65Var;
                z = false;
            } else {
                str5 = str6;
                p65Var.Y(-1432319449);
            }
            p65Var.p(z);
            p65Var.p(true);
            str4 = str5;
        } else {
            p65Var.S();
            str4 = str3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new rma(str, str4, m45Var, r28Var, i, i2, 2);
        }
    }

    public static final void q(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-981849127);
        if (p65Var.P(i & 1, i != 0)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new lg9(29);
                p65Var.j0(objM);
            }
            qd.d((m45) objM, null, null, g76.e, p65Var, 3078, 6);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new n2c(i, 2);
        }
    }

    public static final void r(bae baeVar, n8e n8eVar, sh9 sh9Var, r28 r28Var, x12 x12Var, int i) {
        n8eVar.getClass();
        sh9Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-906298042);
        int i2 = i | (p65Var.f(baeVar) ? 4 : 2) | (p65Var.f(n8eVar) ? 32 : 16) | (p65Var.f(sh9Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (!p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            p65Var.S();
        } else if (baeVar instanceof x9e) {
            p65Var.Y(925950052);
            e((x9e) baeVar, n8eVar, sh9Var, r28Var, p65Var, i2 & 8190);
            p65Var.p(false);
        } else if (baeVar instanceof y9e) {
            p65Var.Y(925956729);
            c((y9e) baeVar, n8eVar, r28Var, p65Var, ((i2 >> 3) & 896) | (i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER));
            p65Var.p(false);
        } else if (baeVar instanceof z9e) {
            p65Var.Y(925962087);
            l((z9e) baeVar, n8eVar, sh9Var, r28Var, p65Var, i2 & 8190);
            p65Var.p(false);
        } else {
            if (!(baeVar instanceof aae)) {
                throw ho2.L(p65Var, 925948797, false);
            }
            p65Var.Y(925969003);
            m((aae) baeVar, n8eVar, sh9Var, r28Var, p65Var, i2 & 8190);
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i, 22, baeVar, n8eVar, sh9Var, r28Var);
        }
    }

    public static final void s(ohc ohcVar, r28 r28Var, float f, c55 c55Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        float f2;
        c55 c55Var2;
        c55 c55Var3;
        float f3;
        int i3;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1303818291);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(ohcVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        int i4 = i2 | 48;
        if ((i & 384) == 0) {
            i4 = i2 | 176;
        }
        int i5 = i4 | 3072;
        if (p65Var.P(i5 & 1, (i5 & 1171) != 1170)) {
            p65Var.U();
            int i6 = i & 1;
            o28 o28Var = o28.b;
            if (i6 == 0 || p65Var.z()) {
                ((jp7) p65Var.j(kt7.a)).getClass();
                c55Var3 = k50.e;
                f3 = 648.0f;
                i3 = i5 & (-897);
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                f3 = f;
                c55Var3 = c55Var;
                i3 = i5 & (-897);
                r28Var3 = r28Var;
            }
            p65Var.q();
            int i7 = i3 >> 3;
            r28 r28VarD = jfc.d(jfc.r(r28Var3, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i8 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i8);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28Var4 = r28Var3;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, f3, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i9 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            qk7.k(ohcVar, null, c55Var3, p65Var, (i3 & 14) | (i7 & 896), 2);
            p65Var.p(true);
            p65Var.p(true);
            c55Var2 = c55Var3;
            f2 = f3;
            r28Var2 = r28Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            f2 = f;
            c55Var2 = c55Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fs7(ohcVar, f2, r28Var2, c55Var2, i, 8);
        }
    }

    public static String t(String str, Object... objArr) {
        int length;
        int length2;
        int iIndexOf;
        String strY;
        int i = 0;
        int i2 = 0;
        while (true) {
            length = objArr.length;
            if (i2 >= length) {
                break;
            }
            Object obj = objArr[i2];
            if (obj == null) {
                strY = "null";
            } else {
                try {
                    strY = obj.toString();
                } catch (Exception e) {
                    String strX = ev6.x(obj.getClass().getName(), "@", Integer.toHexString(System.identityHashCode(obj)));
                    Logger.getLogger("com.google.common.base.Strings").logp(Level.WARNING, "com.google.common.base.Strings", "lenientToString", "Exception during lenientFormat for ".concat(strX), (Throwable) e);
                    strY = ev6.y("<", strX, ZVsviyDAr.CpV, e.getClass().getName(), ">");
                }
            }
            objArr[i2] = strY;
            i2++;
        }
        StringBuilder sb = new StringBuilder(str.length() + (length * 16));
        int i3 = 0;
        while (true) {
            length2 = objArr.length;
            if (i >= length2 || (iIndexOf = str.indexOf("%s", i3)) == -1) {
                break;
            }
            sb.append((CharSequence) str, i3, iIndexOf);
            sb.append(objArr[i]);
            i++;
            i3 = iIndexOf + 2;
        }
        sb.append((CharSequence) str, i3, str.length());
        if (i < length2) {
            sb.append(" [");
            sb.append(objArr[i]);
            for (int i4 = i + 1; i4 < objArr.length; i4++) {
                sb.append(", ");
                sb.append(objArr[i4]);
            }
            sb.append(']');
        }
        return sb.toString();
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x00bd, code lost:
    
        if (r0 != r2) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0119, code lost:
    
        if (r0 == r2) goto L51;
     */
    /* JADX WARN: Removed duplicated region for block: B:31:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00e6 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00e7  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:33:0x00bd -> B:35:0x00c1). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:39:0x00d8 -> B:36:0x00c4). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object w(int r19, long r20, int r22, defpackage.mt2 r23, defpackage.p92 r24) {
        /*
            Method dump skipped, instruction units count: 301
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.er7.w(int, long, int, mt2, p92):java.lang.Object");
    }

    public static final zwa y(s99 s99Var, int i, prd prdVar, qjd qjdVar, boolean z, int i2) {
        zwa zwaVarC;
        if (qjdVar != null) {
            prdVar.b.a(i);
            zwaVarC = qjdVar.c(i);
        } else {
            zwaVarC = zwa.e;
        }
        s99Var.getClass();
        int iD = ho2.d(s99Var, 2.0f);
        float f = zwaVarC.a;
        return new zwa(z ? (i2 - f) - iD : f, zwaVarC.b, z ? i2 - f : iD + f, zwaVarC.d);
    }

    public static final r28 z(r28 r28Var, final yrb yrbVar, final float f, boolean z) {
        r28Var.getClass();
        yrbVar.getClass();
        return (Build.VERSION.SDK_INT < 29 || !z) ? r28Var : guc.C(xz5.Y(r28Var, 0.0f, 0.0f, 0.0f, null, 458751), new x45() { // from class: v28
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                cq6 cq6Var = (cq6) obj;
                cq6Var.getClass();
                cq6Var.a();
                long j = uu1.g;
                uu1 uu1Var = new uu1(j);
                long j2 = uu1.b;
                List listR = d46.R(uu1Var, new uu1(j2));
                yrb yrbVar2 = yrbVar;
                float fG = yrbVar2.a.g();
                ho2.q(cq6Var, hpe.r(listR, fG, Math.min(cq6Var.Z(f), fG) + fG), 0L, 0L, 0.0f, null, 62);
                List listR2 = d46.R(new uu1(j2), new uu1(j));
                float fIntBitsToFloat = Float.intBitsToFloat((int) (cq6Var.a.b.B() >> 32));
                h49 h49Var = yrbVar2.e;
                h49 h49Var2 = yrbVar2.a;
                float fG2 = (fIntBitsToFloat - h49Var.g()) + h49Var2.g();
                float fMin = Math.min(cq6Var.Z(f), h49Var.g() - h49Var2.g());
                if (fMin != 0.0f) {
                    ho2.q(cq6Var, hpe.r(listR2, fG2 - fMin, fG2), 0L, 0L, 0.0f, null, 62);
                }
                return c1e.a;
            }
        });
    }

    public void G(f41 f41Var, Collection collection) {
        f41Var.getClass();
        f41Var.Z(collection);
    }

    public abstract void u(f41 f41Var);

    public abstract void v(f41 f41Var, f41 f41Var2);

    public abstract zwa x();

    /* JADX WARN: Removed duplicated region for block: B:49:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00a8  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x018b  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x01a2  */
    /* JADX WARN: Removed duplicated region for block: B:83:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void d(final boolean r22, final defpackage.m45 r23, final defpackage.r28 r24, defpackage.npa r25, long r26, long r28, boolean r30, float r31, defpackage.xd r32, defpackage.c55 r33, defpackage.mz1 r34, defpackage.x12 r35, final int r36, final int r37) {
        /*
            Method dump skipped, instruction units count: 437
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.er7.d(boolean, m45, r28, npa, long, long, boolean, float, xd, c55, mz1, x12, int, int):void");
    }
}
