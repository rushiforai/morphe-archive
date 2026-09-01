package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wy6 {
    public static final ArrayList a;

    static {
        g04 entries = xqc.getEntries();
        xqc[] xqcVarArr = {xqc.LIFETIME_EARNINGS_DESC, xqc.LIFETIME_EARNINGS_ASC};
        entries.getClass();
        ArrayList arrayList = new ArrayList();
        for (Object obj : entries) {
            if (!k80.d0(obj, xqcVarArr)) {
                arrayList.add(obj);
            }
        }
        a = arrayList;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x02bf  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x02cb  */
    /* JADX WARN: Removed duplicated region for block: B:63:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(long r68, final defpackage.xqc r70, defpackage.r28 r71, java.util.List r72, final defpackage.x45 r73, defpackage.x12 r74, int r75, int r76) {
        /*
            Method dump skipped, instruction units count: 733
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wy6.a(long, xqc, r28, java.util.List, x45, x12, int, int):void");
    }

    public static final void b(int i, long j, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(860173677);
        int i2 = i | 6 | (p65Var.e(j) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.U();
            int i3 = i & 1;
            o28 o28Var = o28.b;
            if (i3 == 0 || p65Var.z()) {
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarG = w2g.G(jfc.d(r28Var3, 1.0f), 24.0f, 52.0f, 24.0f, 0.0f, 8);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarG);
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
            sn3 sn3Var = jt7.c;
            int i5 = ((i2 << 6) & 7168) | 48;
            ok7.r(86.0f, i5, 4, j, p65Var, null, ((bu7) p65Var.j(sn3Var)).h);
            ok7.r(208.0f, i5, 4, j, p65Var, null, ((bu7) lv8.n(o28Var, 4.0f, p65Var, sn3Var)).n);
            hp7.t(p65Var, jfc.l(o28Var, 20.0f));
            tr7.b(i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 1, j, p65Var, null);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var2, j, i, 10);
        }
    }
}
