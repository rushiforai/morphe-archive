package defpackage;

import android.content.Context;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.core.models.ReadingContext;
import com.medium.android.data.post.TargetPost;
import com.medium.reader.R;
import java.util.List;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class jj9 {
    public static final long a;
    public static final /* synthetic */ int b = 0;

    static {
        int i = in3.d;
        a = hlg.T(200, mn3.MILLISECONDS);
    }

    public static final void a(final su9 su9Var, String str, kv6 kv6Var, final int i, final float f, final float f2, final fj9 fj9Var, r28 r28Var, x12 x12Var, final int i2) {
        final r28 r28Var2;
        int iNextIndex;
        boolean z;
        boolean z2;
        n92 n92Var;
        Integer num;
        fj9 fj9Var2;
        final String str2 = str;
        final kv6 kv6Var2 = kv6Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2140071229);
        int i3 = i2 | (p65Var.f(su9Var) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(kv6Var2) ? 256 : 128) | (p65Var.d(i) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.c(f) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.c(f2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.f(fj9Var) ? 1048576 : 524288) | 12582912;
        int i4 = 0;
        if (p65Var.P(i3 & 1, (4793491 & i3) != 4793490)) {
            boolean zF = p65Var.f(su9Var.c);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                List list = su9Var.c;
                ListIterator listIterator = list.listIterator(list.size());
                while (true) {
                    if (!listIterator.hasPrevious()) {
                        iNextIndex = -1;
                        break;
                    } else if (((que) listIterator.previous()) instanceof n39) {
                        iNextIndex = listIterator.nextIndex();
                        break;
                    }
                }
                objM = iNextIndex >= 0 ? Integer.valueOf(iNextIndex) : null;
                p65Var.j0(objM);
            }
            Integer num2 = (Integer) objM;
            boolean zF2 = p65Var.f(num2);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                objM2 = bjc.b(new ui9(num2, i4, kv6Var2));
                p65Var.j0(objM2);
            }
            upc upcVar = (upc) objM2;
            rh4 rh4Var = jfc.c;
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, rh4Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            jy8 jy8VarH = w2g.h(0.0f, f, 0.0f, f2, 5);
            int i6 = i3 & 14;
            boolean z3 = (i6 == 4) | ((i3 & 7168) == 2048);
            Object objM3 = p65Var.M();
            if (z3 || objM3 == uobVar) {
                objM3 = new rr6(i, 2, su9Var);
                p65Var.j0(objM3);
            }
            k40.t(rh4Var, kv6Var, jy8VarH, null, null, null, false, null, (x45) objM3, p65Var, ((i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 6, 504);
            o28 o28Var = o28.b;
            if (num2 != null) {
                p65Var.Y(-1793705109);
                lk7.e(((Number) upcVar.getValue()).floatValue(), w2g.G(iy0.a.a(o28Var, z46.i), 0.0f, f, 0.0f, f2, 5), p65Var, 0);
            } else {
                p65Var.Y(-1832293723);
            }
            p65Var.p(false);
            p65Var.p(true);
            int i7 = i3 & 896;
            boolean z4 = (i6 == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | (i7 == 256);
            Object objM4 = p65Var.M();
            if (z4 || objM4 == uobVar) {
                z = true;
                z2 = false;
                n92Var = null;
                num = num2;
                kv6Var2 = kv6Var;
                mo5 mo5Var = new mo5(str2, su9Var, kv6Var2, n92Var, 21);
                str2 = str2;
                p65Var.j0(mo5Var);
                objM4 = mo5Var;
            } else {
                z2 = false;
                z = true;
                n92Var = null;
                num = num2;
                kv6Var2 = kv6Var;
            }
            kyd.k(p65Var, (b55) objM4, str2);
            int i8 = 3670016 & i3;
            boolean zF3 = p65Var.f(num) | (i7 == 256 ? z : z2) | (i8 == 1048576 ? z : z2);
            Object objM5 = p65Var.M();
            if (zF3 || objM5 == uobVar) {
                fj9Var2 = fj9Var;
                objM5 = new mo5(num, kv6Var2, fj9Var2, n92Var);
                p65Var.j0(objM5);
            } else {
                fj9Var2 = fj9Var;
            }
            kyd.l(kv6Var2, num, (b55) objM5, p65Var);
            boolean z5 = i7 == 256 ? z : z2;
            if (i8 == 1048576) {
                z2 = z;
            }
            boolean z6 = z5 | z2;
            Object objM6 = p65Var.M();
            if (z6 || objM6 == uobVar) {
                objM6 = new kd7(kv6Var2, fj9Var2, n92Var, 17);
                p65Var.j0(objM6);
            }
            kyd.k(p65Var, (b55) objM6, kv6Var2);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(str2, kv6Var2, i, f, f2, fj9Var, r28Var2, i2) { // from class: vi9
                public final /* synthetic */ String b;
                public final /* synthetic */ kv6 c;
                public final /* synthetic */ int d;
                public final /* synthetic */ float e;
                public final /* synthetic */ float f;
                public final /* synthetic */ fj9 g;
                public final /* synthetic */ r28 h;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(1);
                    jj9.a(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static final void b(que queVar, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1599005404);
        int i2 = (p65Var.h(queVar) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            boolean z = queVar instanceof n39;
            o28 o28Var = o28.b;
            if (z) {
                p65Var.Y(-954094933);
                e29.a((n39) queVar, jfc.d(o28Var, 1.0f), p65Var, (i2 & 14) | 48);
                p65Var.p(false);
            } else if (queVar instanceof gf0) {
                p65Var.Y(-954090164);
                gf0 gf0Var = (gf0) queVar;
                ht2.n(gf0Var.b, gf0Var.c, null, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof ve0) {
                p65Var.Y(-954085364);
                ve0 ve0Var = (ve0) queVar;
                yi2.k(ve0Var.b, ve0Var.c, null, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof iia) {
                p65Var.Y(-954080399);
                iia iiaVar = (iia) queVar;
                ur7.n(iiaVar.b, iiaVar.c, null, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof ve9) {
                p65Var.Y(-954075546);
                ve9 ve9Var = (ve9) queVar;
                hk7.g(ve9Var.b, ve9Var.c, null, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof r35) {
                p65Var.Y(-954070797);
                r35 r35Var = (r35) queVar;
                t40.j(r35Var.b, r35Var.c, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof yn8) {
                p65Var.Y(-954065810);
                yn8 yn8Var = (yn8) queVar;
                no7.c(yn8Var.b, yn8Var.c, null, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof pj9) {
                p65Var.Y(-954060976);
                pj9 pj9Var = (pj9) queVar;
                hp7.n(pj9Var.b, pj9Var.c, null, 0.0f, p65Var, 0, 12);
                p65Var.p(false);
            } else if (queVar instanceof zh9) {
                p65Var.Y(-954056146);
                zh9 zh9Var = (zh9) queVar;
                tp7.f(zh9Var.b, zh9Var.c, null, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof gqd) {
                p65Var.Y(-954051479);
                gqd gqdVar = (gqd) queVar;
                kp7.j(gqdVar.b, gqdVar.c, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof ni3) {
                p65Var.Y(-954046723);
                mi3 mi3Var = ((ni3) queVar).b;
                tp7.c(mi3Var.a, 0, 0, ((uu1) mi3Var.b.invoke(p65Var, 0)).a, p65Var, w2g.E(flb.a0(o28Var, ((uu1) mi3Var.c.invoke(p65Var, 0)).a, rv8.r), 0.0f, 0.0f, 2));
                p65Var.p(false);
            } else if (queVar instanceof j06) {
                p65Var.Y(489686508);
                j06 j06Var = (j06) queVar;
                bo.p(j06Var.c, j06Var.d, j06Var.e, j06Var.f, w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), j06Var.g, false, 0, j06Var.b, p65Var, 24576, 192);
                p65Var.p(false);
            } else if (queVar instanceof h1e) {
                p65Var.Y(-954019902);
                no7.i(6, 0, p65Var, w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2));
                p65Var.p(false);
            } else if (queVar instanceof u38) {
                p65Var.Y(-954013969);
                tr7.c(((u38) queVar).b, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof qg5) {
                p65Var.Y(-954010083);
                qg5 qg5Var = (qg5) queVar;
                qb8.h(qg5Var.b, qg5Var.c, qg5Var.d, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof uvb) {
                p65Var.Y(-954002208);
                uvb uvbVar = (uvb) queVar;
                rr7.n(uvbVar.b, uvbVar.c, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof kwa) {
                p65Var.Y(-953996589);
                pr7.g(p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof xvb) {
                p65Var.Y(-953994187);
                String str = ((xvb) queVar).b;
                boolean zH = p65Var.h(queVar);
                Object objM = p65Var.M();
                if (zH || objM == w12.a) {
                    objM = new eb8(8, queVar);
                    p65Var.j0(objM);
                }
                tr7.e(str, (x45) objM, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof if1) {
                p65Var.Y(-953987754);
                if1 if1Var = (if1) queVar;
                ht2.q(if1Var.b, if1Var.c, null, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof me9) {
                p65Var.Y(-953982463);
                me9 me9Var = (me9) queVar;
                ek7.k(me9Var.b, me9Var.c, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof mf1) {
                p65Var.Y(-953976613);
                vv2.g(((mf1) queVar).b, null, p65Var, 0);
                p65Var.p(false);
            } else if (queVar instanceof ko9) {
                p65Var.Y(-953971388);
                no7.g((ko9) queVar, null, p65Var, i2 & 14);
                p65Var.p(false);
            } else if (!(queVar instanceof ii9)) {
                p65Var.Y(491887198);
                p65Var.p(false);
                ygf.f(ka1.r("Unexpected item type in PostContent: ", n1b.a.b(queVar.getClass()).d()));
                return;
            } else {
                p65Var.Y(-953968584);
                ii9 ii9Var = (ii9) queVar;
                br7.c(ii9Var.b, ii9Var.c, null, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v08(i, 11, queVar);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:165:0x036c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void c(final defpackage.tu9 r37, final java.lang.String r38, final defpackage.l78 r39, defpackage.l78 r40, final defpackage.nhc r41, final defpackage.kv6 r42, final int r43, final defpackage.fj9 r44, defpackage.r28 r45, defpackage.x12 r46, final int r47, final int r48) {
        /*
            Method dump skipped, instruction units count: 1138
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jj9.c(tu9, java.lang.String, l78, l78, nhc, kv6, int, fj9, r28, x12, int, int):void");
    }

    public static final void d(TargetPost targetPost, ReadingContext readingContext, String str, oi9 oi9Var, r28 r28Var, sw9 sw9Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        oi9 oi9Var2;
        r28 r28Var2;
        sw9 sw9Var2;
        int i3;
        sw9 sw9Var3;
        r28 r28Var3;
        int i4;
        int i5;
        sw9 sw9Var4;
        targetPost.getClass();
        readingContext.getClass();
        str.getClass();
        oi9Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1181689306);
        if ((i & 6) == 0) {
            i2 = ((i & 8) == 0 ? p65Var2.f(targetPost) : p65Var2.h(targetPost) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.h(readingContext) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(str) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(oi9Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i6 = i2 | 24576;
        if ((196608 & i) == 0) {
            i6 = 90112 | i2;
        }
        int i7 = 0;
        if (p65Var2.P(i6 & 1, (74899 & i6) != 74898)) {
            p65Var2.U();
            int i8 = i & 1;
            uob uobVar = w12.a;
            if (i8 == 0 || p65Var2.z()) {
                boolean zH = ((i6 & 14) == 4 || ((i6 & 8) != 0 && p65Var2.h(targetPost))) | p65Var2.h(readingContext) | ((i6 & 896) == 256);
                Object objM = p65Var2.M();
                if (zH || objM == uobVar) {
                    objM = new pi9(targetPost, readingContext, str, i7);
                    p65Var2.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var2);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                sw9 sw9Var5 = (sw9) to7.z(n1b.a.b(sw9.class), wueVarA, t40.E(wueVarA, p65Var2), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var2);
                i3 = i6 & (-458753);
                sw9Var3 = sw9Var5;
                r28Var3 = o28.b;
            } else {
                p65Var2.S();
                sw9Var3 = sw9Var;
                i3 = i6 & (-458753);
                r28Var3 = r28Var;
            }
            p65Var2.q();
            Context context = (Context) p65Var2.j(eo.b);
            l78 l78VarZ = guc.z(sw9Var3.M0, p65Var2, 0);
            l78 l78VarZ2 = guc.z(sw9Var3.A0, p65Var2, 0);
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var2);
            }
            nhc nhcVar = (nhc) objM2;
            Object objM3 = p65Var2.M();
            n92 n92Var = null;
            if (objM3 == uobVar) {
                objM3 = qo7.u(null);
                p65Var2.j0(objM3);
            }
            l78 l78Var = (l78) objM3;
            Object objM4 = p65Var2.M();
            if (objM4 == uobVar) {
                objM4 = qo7.u(null);
                p65Var2.j0(objM4);
            }
            l78 l78Var2 = (l78) objM4;
            kv6 kv6VarA = pv6.a(p65Var2);
            Object objM5 = p65Var2.M();
            if (objM5 == uobVar) {
                objM5 = new h49(0);
                p65Var2.j0(objM5);
            }
            h49 h49Var = (h49) objM5;
            boolean zH2 = p65Var2.h(sw9Var3);
            Object objM6 = p65Var2.M();
            if (zH2 || objM6 == uobVar) {
                objM6 = new kd7(sw9Var3, h49Var, n92Var, 18);
                p65Var2.j0(objM6);
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var2, (b55) objM6, c1eVar);
            g7 g7Var = new g7(3);
            boolean zH3 = p65Var2.h(sw9Var3);
            Object objM7 = p65Var2.M();
            if (zH3 || objM7 == uobVar) {
                i4 = 0;
                objM7 = new ti9(sw9Var3, 0);
                p65Var2.j0(objM7);
            } else {
                i4 = 0;
            }
            ug7 ug7VarT = sgg.T(g7Var, (x45) objM7, p65Var2, i4);
            Object objM8 = p65Var2.M();
            if (objM8 == uobVar) {
                objM8 = qo7.u(Boolean.TRUE);
                p65Var2.j0(objM8);
            }
            l78 l78Var3 = (l78) objM8;
            Object objM9 = p65Var2.M();
            if (objM9 == uobVar) {
                objM9 = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM9);
            }
            l78 l78Var4 = (l78) objM9;
            boolean zH4 = p65Var2.h(sw9Var3);
            r28 r28Var4 = r28Var3;
            Object objM10 = p65Var2.M();
            if (zH4 || objM10 == uobVar) {
                objM10 = new i16(sw9Var3, l78Var3, l78Var4, 13);
                p65Var2.j0(objM10);
            }
            m45 m45Var = (m45) objM10;
            nk7.a(((Boolean) l78Var3.getValue()).booleanValue(), m45Var, p65Var2, 0, 0);
            Boolean bool = (Boolean) l78Var4.getValue();
            bool.getClass();
            boolean z = (i3 & 7168) == 2048;
            Object objM11 = p65Var2.M();
            if (z || objM11 == uobVar) {
                i5 = i3;
                objM11 = new n79(oi9Var, l78Var4, null, 5);
                p65Var2.j0(objM11);
            } else {
                i5 = i3;
            }
            kyd.k(p65Var2, (b55) objM11, bool);
            fj9 fj9Var = new fj9(oi9Var, sw9Var3, ug7VarT, m45Var, l78Var2, l78VarZ);
            oi9Var2 = oi9Var;
            sw9 sw9Var6 = sw9Var3;
            c((tu9) l78VarZ.getValue(), targetPost.getParagraphName(), l78Var, l78Var2, nhcVar, kv6VarA, h49Var.g(), fj9Var, r28Var4, p65Var2, ((i5 << 12) & 234881024) | 28032, 0);
            p65Var = p65Var2;
            Object objM12 = p65Var.M();
            if (objM12 == uobVar) {
                objM12 = kyd.M(p65Var);
                p65Var.j0(objM12);
            }
            sb2 sb2Var = (sb2) objM12;
            boolean zH5 = p65Var.h(sw9Var6) | p65Var.h(sb2Var) | p65Var.f(fj9Var) | p65Var.h(context) | p65Var.f(kv6VarA);
            Object objM13 = p65Var.M();
            if (zH5 || objM13 == uobVar) {
                objM13 = new nz(sw9Var6, nhcVar, sb2Var, fj9Var, context, l78Var, kv6VarA, null, 14);
                sw9Var4 = sw9Var6;
                p65Var.j0(objM13);
            } else {
                sw9Var4 = sw9Var6;
            }
            kyd.k(p65Var, (b55) objM13, c1eVar);
            rr9 rr9Var = (rr9) l78VarZ2.getValue();
            if (rr9Var instanceof qr9) {
                p65Var.Y(-2140069388);
                mk7.i(((qr9) rr9Var).a, new dj9(sw9Var4, oi9Var2), null, p65Var, 0);
                p65Var.p(false);
            } else if (rr9Var instanceof pr9) {
                p65Var.Y(-2138223400);
                vp7.g(((pr9) rr9Var).a, new gh9(1, sw9Var4), null, p65Var, 0);
                p65Var.p(false);
            } else {
                int i9 = 1;
                if (rr9Var instanceof or9) {
                    p65Var.Y(-2137635299);
                    or9 or9Var = (or9) rr9Var;
                    wgf.c(or9Var.a, new hh9(sw9Var4, or9Var, i9), null, p65Var, 0);
                    p65Var.p(false);
                } else {
                    if (rr9Var != null) {
                        throw ho2.L(p65Var, -1731604194, false);
                    }
                    p65Var.Y(-1731502582);
                    p65Var.p(false);
                }
            }
            sw9Var2 = sw9Var4;
            r28Var2 = r28Var4;
        } else {
            p65Var = p65Var2;
            oi9Var2 = oi9Var;
            p65Var.S();
            r28Var2 = r28Var;
            sw9Var2 = sw9Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iu0(i, 9, r28Var2, targetPost, readingContext, str, oi9Var2, sw9Var2);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:44:0x00a6, code lost:
    
        if (r14 == r0) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00e1, code lost:
    
        if (r14 == r0) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x012d, code lost:
    
        if (r14 == r0) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x0161, code lost:
    
        if (r14 == r0) goto L148;
     */
    /* JADX WARN: Removed duplicated region for block: B:149:0x02fe A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object e(defpackage.m40 r9, defpackage.nhc r10, defpackage.fj9 r11, android.content.Context r12, defpackage.l78 r13, defpackage.p92 r14) {
        /*
            Method dump skipped, instruction units count: 810
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jj9.e(m40, nhc, fj9, android.content.Context, l78, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:240:0x0461  */
    /* JADX WARN: Removed duplicated region for block: B:259:0x04e0  */
    /* JADX WARN: Removed duplicated region for block: B:278:0x057a  */
    /* JADX WARN: Removed duplicated region for block: B:297:0x0609  */
    /* JADX WARN: Removed duplicated region for block: B:313:0x0683  */
    /* JADX WARN: Removed duplicated region for block: B:402:0x0835  */
    /* JADX WARN: Removed duplicated region for block: B:441:0x08f8  */
    /* JADX WARN: Removed duplicated region for block: B:463:0x096e A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:464:0x096f A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object f(defpackage.ou9 r11, defpackage.nhc r12, final defpackage.fj9 r13, android.content.Context r14, defpackage.l78 r15, defpackage.sh9 r16, defpackage.kv6 r17, defpackage.p92 r18) {
        /*
            Method dump skipped, instruction units count: 2478
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jj9.f(ou9, nhc, fj9, android.content.Context, l78, sh9, kv6, p92):java.lang.Object");
    }

    public static final Object g(nhc nhcVar, Context context, hj9 hj9Var) {
        String string = context.getString(R.string.action_unavailable_list_while_offline_reading);
        string.getClass();
        Object objC = nhc.c(nhcVar, string, null, bhc.Long, hj9Var, 6);
        return objC == tb2.COROUTINE_SUSPENDED ? objC : c1e.a;
    }
}
