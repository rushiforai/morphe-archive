package defpackage;

import android.text.Layout;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oh0 {
    public final long a;
    public final long b;
    public final long c;

    public oh0(long j, long j2, long j3) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        long j4 = qkd.c;
        if (qkd.a(j, j4)) {
            ay0.e("AutoSize.StepBased: TextUnit.Unspecified is not a valid value for minFontSize. Try using other values e.g. 10.sp");
            throw null;
        }
        if (qkd.a(j2, j4)) {
            ay0.e("AutoSize.StepBased: TextUnit.Unspecified is not a valid value for maxFontSize. Try using other values e.g. 100.sp");
            throw null;
        }
        if (qkd.a(j3, j4)) {
            ay0.e("AutoSize.StepBased: TextUnit.Unspecified is not a valid value for stepSize. Try using other values e.g. 0.25.sp");
            throw null;
        }
        if (rkd.a(qkd.b(j), qkd.b(j2))) {
            en7.n(j, j2);
            if (Float.compare(qkd.c(j), qkd.c(j2)) > 0) {
                this.a = j2;
                j = j2;
            }
        }
        if (rkd.a(qkd.b(j3), 4294967296L)) {
            long jM = en7.M(1.0E-4f, 4294967296L);
            en7.n(j3, jM);
            if (Float.compare(qkd.c(j3), qkd.c(jM)) < 0) {
                ay0.e("AutoSize.StepBased: stepSize must be greater than or equal to 0.0001f.sp");
                throw null;
            }
        }
        if (qkd.c(j) < 0.0f) {
            ay0.e("AutoSize.StepBased: minFontSize must not be negative");
            throw null;
        }
        if (qkd.c(j2) >= 0.0f) {
            return;
        }
        ay0.e("AutoSize.StepBased: maxFontSize must not be negative");
        throw null;
    }

    public static boolean a(qjd qjdVar) {
        f58 f58Var = qjdVar.b;
        long j = qjdVar.c;
        pjd pjdVar = qjdVar.a;
        int i = pjdVar.f;
        if (i == 1 || i == 3) {
            return ((float) ((int) (j >> 32))) < f58Var.d || f58Var.c || ((float) ((int) (j & 4294967295L))) < f58Var.e;
        }
        if (i != 4 && i != 5 && i != 2) {
            ik4.i("TextOverflow type ", hk7.I(pjdVar.f), " is not supported.");
            return false;
        }
        int i2 = f58Var.f;
        if (i2 != 0) {
            if (i2 == 1) {
                f58Var.m(0);
                ArrayList arrayList = f58Var.h;
                Layout layout = ((y19) arrayList.get(mk7.s(0, arrayList))).a.d.f;
                ThreadLocal threadLocal = sjd.a;
                if (layout.getEllipsisCount(0) > 0) {
                    return true;
                }
            } else {
                if (i == 4 || i == 5) {
                    return ((float) ((int) (j >> 32))) < f58Var.d || f58Var.c || ((float) ((int) (j & 4294967295L))) < f58Var.e;
                }
                if (i == 2) {
                    int i3 = i2 - 1;
                    f58Var.m(i3);
                    ArrayList arrayList2 = f58Var.h;
                    Layout layout2 = ((y19) arrayList2.get(mk7.s(i3, arrayList2))).a.d.f;
                    ThreadLocal threadLocal2 = sjd.a;
                    return layout2.getEllipsisCount(i3) > 0;
                }
            }
        }
        return false;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null || !(obj instanceof oh0)) {
            return false;
        }
        oh0 oh0Var = (oh0) obj;
        return qkd.a(oh0Var.a, this.a) && qkd.a(oh0Var.b, this.b) && qkd.a(oh0Var.c, this.c);
    }

    public final int hashCode() {
        rkd[] rkdVarArr = qkd.b;
        return ev6.n(this.c) + ((ev6.n(this.b) + (ev6.n(this.a) * 31)) * 31);
    }
}
