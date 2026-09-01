package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qv5 {
    public static final r28 a = jfc.l(o28.b, jgc.c);

    public static final void a(by5 by5Var, String str, r28 r28Var, long j, x12 x12Var, int i) {
        r28 r28Var2;
        long j2;
        int i2;
        r28 r28Var3;
        long j3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-126890956);
        int i3 = i | (p65Var.f(by5Var) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | 1408;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                long j4 = ((uu1) p65Var.j(c82.a)).a;
                i2 = i3 & (-7169);
                r28Var3 = o28.b;
                j3 = j4;
            } else {
                p65Var.S();
                i2 = i3 & (-7169);
                r28Var3 = r28Var;
                j3 = j;
            }
            p65Var.q();
            b(mk7.G(by5Var, p65Var), str, r28Var3, j3, p65Var, (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 392, 0);
            r28Var2 = r28Var3;
            j2 = j3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            j2 = j;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jj3(by5Var, str, r28Var2, j2, i, 2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:100:0x0173  */
    /* JADX WARN: Removed duplicated region for block: B:102:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00c1 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00da  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0105  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0122  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0148  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0168  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(defpackage.c09 r16, java.lang.String r17, defpackage.r28 r18, long r19, defpackage.x12 r21, int r22, int r23) {
        /*
            Method dump skipped, instruction units count: 384
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qv5.b(c09, java.lang.String, r28, long, x12, int, int):void");
    }
}
