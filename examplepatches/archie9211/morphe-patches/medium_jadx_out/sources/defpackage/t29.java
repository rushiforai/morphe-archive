package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class t29 {
    public static final long a;
    public static final /* synthetic */ int b = 0;

    static {
        rkd[] rkdVarArr = qkd.b;
        a = qkd.c;
    }

    public static final s29 a(s29 s29Var, int i, int i2, long j, yid yidVar, pa9 pa9Var, lz6 lz6Var, int i3, int i4, zjd zjdVar) {
        long j2;
        int i5 = i;
        int i6 = i2;
        long j3 = j;
        yid yidVar2 = yidVar;
        pa9 pa9Var2 = pa9Var;
        lz6 lz6Var2 = lz6Var;
        int i7 = i3;
        int i8 = i4;
        zjd zjdVar2 = zjdVar;
        if (i5 == 0 || i5 == s29Var.a) {
            rkd[] rkdVarArr = qkd.b;
            if ((j3 & 1095216660480L) == 0) {
                j2 = 0;
            } else {
                j2 = 0;
                if (qkd.a(j3, s29Var.c)) {
                }
            }
            if ((yidVar2 == null || yidVar2.equals(s29Var.d)) && ((i6 == 0 || i6 == s29Var.b) && ((pa9Var2 == null || pa9Var2.equals(s29Var.e)) && ((lz6Var2 == null || lz6Var2.equals(s29Var.f)) && ((i7 == 0 || i7 == s29Var.g) && ((i8 == 0 || i8 == s29Var.h) && (zjdVar2 == null || zjdVar2.equals(s29Var.i)))))))) {
                return s29Var;
            }
        } else {
            j2 = 0;
        }
        rkd[] rkdVarArr2 = qkd.b;
        if ((j3 & 1095216660480L) == j2) {
            j3 = s29Var.c;
        }
        if (yidVar2 == null) {
            yidVar2 = s29Var.d;
        }
        if (i5 == 0) {
            i5 = s29Var.a;
        }
        if (i6 == 0) {
            i6 = s29Var.b;
        }
        pa9 pa9Var3 = s29Var.e;
        if (pa9Var3 != null && pa9Var2 == null) {
            pa9Var2 = pa9Var3;
        }
        if (lz6Var2 == null) {
            lz6Var2 = s29Var.f;
        }
        if (i7 == 0) {
            i7 = s29Var.g;
        }
        if (i8 == 0) {
            i8 = s29Var.h;
        }
        if (zjdVar2 == null) {
            zjdVar2 = s29Var.i;
        }
        return new s29(i5, i6, j3, yidVar2, pa9Var2, lz6Var2, i7, i8, zjdVar2);
    }
}
