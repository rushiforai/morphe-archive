package defpackage;

import com.google.android.recaptcha.internal.zzag;
import com.google.android.recaptcha.internal.zzah;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hz2 {
    public final ArrayList a;
    public int b;

    public hz2(int i) {
        switch (i) {
            case 3:
                this.a = new ArrayList();
                this.b = 0;
                break;
            default:
                this.a = new ArrayList();
                this.b = 0;
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x01c6  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0103 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:97:0x01ca A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void a(com.medium.android.admin.stagebranch.StageBranchDataAdapter r29) {
        /*
            Method dump skipped, instruction units count: 550
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hz2.a(com.medium.android.admin.stagebranch.StageBranchDataAdapter):void");
    }

    public void b(ib6 ib6Var) {
        if (ib6Var != null) {
            this.a.add(ib6Var);
        } else {
            ay0.e("factory == null");
        }
    }

    public Object c(jt5 jt5Var, p92 p92Var) {
        int i = this.b;
        ArrayList arrayList = this.a;
        if (i < arrayList.size()) {
            return ((ct5) arrayList.get(i)).a(jt5Var, new hz2(i + 1, arrayList), p92Var);
        }
        ygf.f("Check failed.");
        return null;
    }

    public int d(long j) throws zzag {
        long j2;
        int[] iArr = {783368690, 2033355106, 1011212548, -1019590554, -1840431076, 450100676, 21082158, 1189641421, 1025202362};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        int i8 = iArr[7];
        int iF = lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7);
        int i9 = i8 % 1025202362;
        long[] jArr = {572660336, 1946443174, 827031559, -838041696, -1952800191, 225735627, 63423617, 2084420925, 1937477084};
        long j3 = jArr[0];
        long j4 = jArr[1];
        long j5 = jArr[2];
        long j6 = jArr[3];
        long j7 = jArr[4];
        long j8 = jArr[5];
        long j9 = jArr[6];
        long j10 = jArr[7];
        long j11 = (((((~j3) & j4) | j5) + ((j3 & j6) | j7)) - j8) + j9;
        long j12 = j10 % 1937477084;
        if (j >= 0) {
            j2 = ((long) (this.b + (iF ^ i9))) - j;
        } else {
            j2 = (j11 ^ j12) + (-j);
        }
        if (j2 < 0 || j2 >= this.b) {
            throw new zzag();
        }
        return (int) j2;
    }

    public void e(gvf gvfVar) {
        int[] iArr = {619290071, 707839669, 1439652248, 1857062437, 1153777986, -1073983953, 110861465, 1431419379, 620145550};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        int i8 = iArr[7];
        int iF = lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7);
        int i9 = this.b;
        if (i9 >= ((i8 % 620145550) ^ iF)) {
            throw new zzah();
        }
        ArrayList arrayList = this.a;
        if (i9 == arrayList.size()) {
            arrayList.add(gvfVar);
        } else {
            arrayList.set(this.b, gvfVar);
        }
        this.b++;
    }

    public gvf f() {
        int[] iArr = {1246322141, 1353851113, 767563284, -47045399, -1353918698, 1098913221, 38700441, 1600766768, 649830540};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        int i8 = iArr[7];
        int iF = lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7);
        int i9 = i8 % 649830540;
        int i10 = this.b;
        if (i10 <= 0) {
            throw new zzag();
        }
        int i11 = i9 ^ iF;
        ArrayList arrayList = this.a;
        gvf gvfVar = (gvf) arrayList.get(i10 + i11);
        arrayList.set(this.b + i11, null);
        this.b += i11;
        return gvfVar;
    }

    public gvf g(long j) {
        return (gvf) this.a.get(d(j));
    }

    public hz2(ArrayList arrayList) {
        this.a = arrayList;
    }

    public hz2(int i, ArrayList arrayList) {
        this.a = arrayList;
        this.b = i;
    }
}
