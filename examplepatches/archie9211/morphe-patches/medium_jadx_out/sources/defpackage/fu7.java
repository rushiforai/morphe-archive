package defpackage;

import com.medium.reader.R;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class fu7 {
    public static final ez4 a;
    public static final myd b;

    static {
        d05 d05Var = d05.h;
        ocb ocbVarD = o7f.d(R.font.sohne_bold, d05Var, 0, 8);
        ocb ocbVarD2 = o7f.d(R.font.sohne_bold_italic, d05Var, 1, 8);
        d05 d05Var2 = d05.g;
        ocb ocbVarD3 = o7f.d(R.font.sohne_medium, d05Var2, 0, 8);
        ocb ocbVarD4 = o7f.d(R.font.sohne_medium_italic, d05Var2, 1, 8);
        d05 d05Var3 = d05.f;
        ocb ocbVarD5 = o7f.d(R.font.sohne_regular, d05Var3, 0, 8);
        ocb ocbVarD6 = o7f.d(R.font.sohne_regular_italic, d05Var3, 1, 8);
        d05 d05Var4 = d05.e;
        List listAsList = Arrays.asList(ocbVarD, ocbVarD2, ocbVarD3, ocbVarD4, ocbVarD5, ocbVarD6, o7f.d(R.font.sohne_light, d05Var4, 0, 8), o7f.d(R.font.sohne_light_italic, d05Var4, 1, 8));
        listAsList.getClass();
        ez4 ez4Var = new ez4(listAsList);
        a = ez4Var;
        b = new myd(ez4Var, new mkd(0L, en7.B(16), d05Var3, az4.a, 0L, 0, 0L, null, 16777177), 15870);
    }

    public static final void a(String str, mkd mkdVar, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        int i3;
        mkd mkdVar2 = mkdVar;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(248986371);
        if ((i & 6) == 0) {
            i2 = i | (p65Var2.f(str) ? 4 : 2);
        } else {
            i2 = i;
        }
        int i4 = i2 | (p65Var2.f(mkdVar2) ? 32 : 16);
        if (p65Var2.P(i4 & 1, (i4 & 19) != 18)) {
            r28 r28VarE = w2g.E(o28.b, 24.0f, 0.0f, 2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j = p65Var2.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarE);
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
            tp7.B(p65Var2, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            int i6 = (i4 << 15) & 3670016;
            kjd.b(str, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar, p65Var2, i4 & 14, i6, 65534);
            kjd.b("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sodales sodales libero, at lobortis dolor finibus non. Etiam convallis, eros nec dictum placerat, turpis ex efficitur nulla, sed pellentesque dui diam et lectus.", null, 0L, 0L, 0L, null, null, 0L, 2, false, 3, 0, null, mkdVar, p65Var2, 6, i6 | 3120, 55294);
            mkdVar2 = mkdVar;
            p65Var = p65Var2;
            i3 = 1;
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            i3 = 1;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cu7(str, mkdVar2, i, i3);
        }
    }

    public static final void b(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(340046040);
        if (p65Var.P(i & 1, i != 0)) {
            eu7 eu7VarE = e((zo7) p65Var.j(kt7.b));
            o28 o28Var = o28.b;
            r28 r28VarR = wgf.R(jfc.d(o28Var, 1.0f), wgf.K(p65Var), false, 14);
            wv1 wv1VarA = uv1.a(new h70(16.0f, true, new z10(21)), z46.q, p65Var, 54);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i2));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            a("Title XL", eu7VarE.a, p65Var, 6);
            a("Title L", eu7VarE.b, p65Var, 6);
            a("Title M", eu7VarE.c, p65Var, 6);
            a("Title S", eu7VarE.d, p65Var, 6);
            a("Title XS", eu7VarE.e, p65Var, 6);
            a("Heading XL", eu7VarE.f, p65Var, 6);
            a("Heading L", eu7VarE.g, p65Var, 6);
            a("Heading M", eu7VarE.h, p65Var, 6);
            a("Heading S", eu7VarE.i, p65Var, 6);
            a("Heading XS", eu7VarE.j, p65Var, 6);
            a("Detail XL", eu7VarE.k, p65Var, 6);
            a("Detail L", eu7VarE.l, p65Var, 6);
            a("Detail M", eu7VarE.m, p65Var, 6);
            a("Detail S", eu7VarE.n, p65Var, 6);
            a("Detail XS", eu7VarE.o, p65Var, 6);
            a("Subtitle L", eu7VarE.p, p65Var, 6);
            a("Subtitle M", eu7VarE.q, p65Var, 6);
            a("Subtitle S", eu7VarE.r, p65Var, 6);
            a("Body M", eu7VarE.s, p65Var, 6);
            a("Body S", eu7VarE.t, p65Var, 6);
            Locale locale = Locale.ROOT;
            String upperCase = "Overline L".toUpperCase(locale);
            upperCase.getClass();
            a(upperCase, eu7VarE.u, p65Var, 0);
            String upperCase2 = "Overline M".toUpperCase(locale);
            upperCase2.getClass();
            a(upperCase2, eu7VarE.v, p65Var, 0);
            String upperCase3 = "Overline S".toUpperCase(locale);
            upperCase3.getClass();
            a(upperCase3, eu7VarE.w, p65Var, 0);
            a("Quote L", eu7VarE.x, p65Var, 6);
            a("Quote M", eu7VarE.y, p65Var, 6);
            a("Quote S", eu7VarE.z, p65Var, 6);
            a("Brand XXXL", eu7VarE.A, p65Var, 6);
            a("Brand XXL", eu7VarE.B, p65Var, 6);
            a("Brand XL", eu7VarE.C, p65Var, 6);
            a("Brand L", eu7VarE.D, p65Var, 6);
            a("Brand M", eu7VarE.E, p65Var, 6);
            a("Brand S", eu7VarE.F, p65Var, 6);
            a("Brand XS", eu7VarE.G, p65Var, 6);
            lv8.y(o28Var, 16.0f, p65Var, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, 23);
        }
    }

    public static final mkd c(zo7 zo7Var) {
        long j = zo7Var.n;
        List listAsList = Arrays.asList(o7f.d(R.font.gt_super_regular, null, 0, 14));
        listAsList.getClass();
        return new mkd(j, 0L, d05.f, new ez4(listAsList), 0L, 0, 0L, null, 16777178);
    }

    public static final mkd d(zo7 zo7Var) {
        return new mkd(zo7Var.n, 0L, d05.f, a, 0L, 0, 0L, null, 16777178);
    }

    public static final eu7 e(zo7 zo7Var) {
        zo7Var.getClass();
        mkd mkdVarD = d(zo7Var);
        long jB = en7.B(42);
        d05 d05Var = d05.h;
        mkd mkdVarA = mkd.a(mkdVarD, 0L, jB, d05Var, null, null, en7.z(-0.011d), 0L, null, 0, en7.B(52), null, null, 16646009);
        mkd mkdVarA2 = mkd.a(d(zo7Var), 0L, en7.B(32), d05Var, null, null, en7.z(-0.014d), 0L, null, 0, en7.B(38), null, null, 16646009);
        mkd mkdVarA3 = mkd.a(d(zo7Var), 0L, en7.B(24), d05Var, null, null, en7.z(-0.016d), 0L, null, 0, en7.B(30), null, null, 16646009);
        mkd mkdVarA4 = mkd.a(d(zo7Var), 0L, en7.B(20), d05Var, null, null, 0L, 0L, null, 0, en7.B(24), null, null, 16646137);
        mkd mkdVarA5 = mkd.a(d(zo7Var), 0L, en7.B(16), d05Var, null, null, 0L, 0L, null, 0, en7.B(20), null, null, 16646137);
        mkd mkdVarD2 = d(zo7Var);
        long jB2 = en7.B(42);
        long jB3 = en7.B(52);
        long jZ = en7.z(-0.011d);
        d05 d05Var2 = d05.g;
        mkd mkdVarA6 = mkd.a(mkdVarD2, 0L, jB2, d05Var2, null, null, jZ, 0L, null, 0, jB3, null, null, 16646009);
        mkd mkdVarA7 = mkd.a(d(zo7Var), 0L, en7.B(32), d05Var2, null, null, en7.z(-0.014d), 0L, null, 0, en7.B(38), null, null, 16646009);
        mkd mkdVarA8 = mkd.a(d(zo7Var), 0L, en7.B(24), d05Var2, null, null, en7.z(-0.016d), 0L, null, 0, en7.B(30), null, null, 16646009);
        mkd mkdVarA9 = mkd.a(d(zo7Var), 0L, en7.B(20), d05Var2, null, null, 0L, 0L, null, 0, en7.B(24), null, null, 16646137);
        mkd mkdVarA10 = mkd.a(d(zo7Var), 0L, en7.B(16), d05Var2, null, null, 0L, 0L, null, 0, en7.B(20), null, null, 16646137);
        mkd mkdVarA11 = mkd.a(d(zo7Var), 0L, en7.B(20), null, null, null, 0L, 0L, null, 0, en7.B(28), null, null, 16646141);
        mkd mkdVarA12 = mkd.a(d(zo7Var), 0L, en7.B(16), null, null, null, 0L, 0L, null, 0, en7.B(24), null, null, 16646141);
        mkd mkdVarA13 = mkd.a(d(zo7Var), 0L, en7.B(14), null, null, null, 0L, 0L, null, 0, en7.B(20), null, null, 16646141);
        mkd mkdVarA14 = mkd.a(d(zo7Var), 0L, en7.B(13), null, null, null, 0L, 0L, null, 0, en7.B(20), null, null, 16646141);
        mkd mkdVarA15 = mkd.a(d(zo7Var), 0L, en7.B(11), null, null, null, 0L, 0L, null, 0, en7.B(16), null, null, 16646141);
        mkd mkdVarA16 = mkd.a(d(zo7Var), 0L, en7.B(22), null, null, null, 0L, 0L, null, 0, en7.B(28), null, null, 16646141);
        mkd mkdVarA17 = mkd.a(d(zo7Var), 0L, en7.B(18), null, null, null, 0L, 0L, null, 0, en7.B(24), null, null, 16646141);
        mkd mkdVarA18 = mkd.a(d(zo7Var), 0L, en7.B(16), null, null, null, 0L, 0L, null, 0, en7.B(20), null, null, 16646141);
        mkd mkdVarA19 = mkd.a(f(zo7Var), 0L, en7.B(21), null, null, null, en7.z(-0.003d), 0L, null, 0, en7.B(32), null, null, 16646013);
        mkd mkdVarA20 = mkd.a(f(zo7Var), 0L, en7.B(18), null, null, null, en7.z(-0.003d), 0L, null, 0, en7.B(28), null, null, 16646013);
        mkd mkdVarA21 = mkd.a(d(zo7Var), 0L, en7.B(16), null, null, null, en7.z(0.063d), 0L, null, 0, en7.B(24), null, null, 16646013);
        mkd mkdVarA22 = mkd.a(d(zo7Var), 0L, en7.B(13), null, null, null, en7.z(0.077d), 0L, null, 0, en7.B(18), null, null, 16646013);
        mkd mkdVarA23 = mkd.a(d(zo7Var), 0L, en7.B(12), null, null, null, en7.z(0.083d), 0L, null, 0, en7.B(16), null, null, 16646013);
        mkd mkdVarD3 = d(zo7Var);
        long jB4 = en7.B(28);
        long jB5 = en7.B(40);
        long jZ2 = en7.z(-0.009d);
        d05 d05Var3 = d05.e;
        return new eu7(mkdVarA, mkdVarA2, mkdVarA3, mkdVarA4, mkdVarA5, mkdVarA6, mkdVarA7, mkdVarA8, mkdVarA9, mkdVarA10, mkdVarA11, mkdVarA12, mkdVarA13, mkdVarA14, mkdVarA15, mkdVarA16, mkdVarA17, mkdVarA18, mkdVarA19, mkdVarA20, mkdVarA21, mkdVarA22, mkdVarA23, mkd.a(mkdVarD3, 0L, jB4, d05Var3, null, null, jZ2, 0L, null, 0, jB5, null, null, 16646009), mkd.a(d(zo7Var), 0L, en7.B(24), d05Var3, null, null, 0L, 0L, null, 0, en7.B(32), null, null, 16646137), mkd.a(d(zo7Var), 0L, en7.B(20), d05Var3, null, null, 0L, 0L, null, 0, en7.B(28), null, null, 16646137), mkd.a(c(zo7Var), 0L, en7.B(85), null, null, null, en7.z(-0.055d), 0L, null, 0, en7.B(88), null, null, 16646013), mkd.a(c(zo7Var), 0L, en7.B(70), null, null, null, en7.z(-0.05d), 0L, null, 0, en7.B(74), null, null, 16646013), mkd.a(c(zo7Var), 0L, en7.B(48), null, null, null, en7.z(-0.04d), 0L, null, 0, en7.B(52), null, null, 16646013), mkd.a(c(zo7Var), 0L, en7.B(32), null, null, null, en7.z(-0.035d), 0L, null, 0, en7.B(36), null, null, 16646013), mkd.a(c(zo7Var), 0L, en7.B(28), null, null, null, en7.z(-0.03d), 0L, null, 0, en7.B(32), null, null, 16646013), mkd.a(c(zo7Var), 0L, en7.B(24), null, null, null, en7.z(-0.02d), 0L, null, 0, en7.B(28), null, null, 16646013), mkd.a(c(zo7Var), 0L, en7.B(18), null, null, null, en7.z(-0.015d), 0L, null, 0, en7.B(21), null, null, 16646013));
    }

    public static final mkd f(zo7 zo7Var) {
        long j = zo7Var.n;
        d05 d05Var = d05.f;
        List listAsList = Arrays.asList(o7f.d(R.font.source_serif_pro_regular, d05Var, 0, 8), o7f.d(R.font.source_serif_pro_regular_italic, d05Var, 1, 8));
        listAsList.getClass();
        return new mkd(j, 0L, d05Var, new ez4(listAsList), 0L, 0, 0L, null, 16777178);
    }
}
