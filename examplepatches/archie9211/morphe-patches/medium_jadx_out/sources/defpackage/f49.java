package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.os.Binder;
import android.os.Build;
import android.os.Looper;
import android.os.Parcelable;
import android.util.Size;
import android.util.SizeF;
import android.util.SparseArray;
import android.view.View;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.following.FollowingTab;
import com.medium.reader.R;
import com.medium.refinerecommendations.RefineRecommendationsFilter;
import com.medium.refinerecommendations.RefineRecommendationsTab;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class f49 {
    public static final mz1 h;
    public static final mz1 i;
    public static final mz1 m;
    public static final mz1 n;
    public static final mz1 o;
    public static final ywb r;
    public static final /* synthetic */ int s = 0;
    public static final float t = 24.0f;
    public static final float u = 24.0f;
    public static wp v;
    public static pm w;
    public static g61 x;
    public static final /* synthetic */ int y = 0;
    public static final mz1 a = new mz1(new yz1(4), false, -462759707);
    public static final mz1 b = new mz1(new yz1(5), false, -2035391436);
    public static final mz1 c = new mz1(new yz1(6), false, 818809264);
    public static final mz1 d = new mz1(new yz1(7), false, 437764402);
    public static final mz1 e = new mz1(new zz1(0), false, -331379435);
    public static final mz1 f = new mz1(new c02(20), false, 1807796225);
    public static final mz1 g = new mz1(new e02(1), false, 1210999556);
    public static final mz1 j = new mz1(new c02(23), false, 36409978);
    public static final mz1 k = new mz1(new c02(24), false, -1351993933);
    public static final mz1 l = new mz1(new c02(25), false, 410849339);
    public static final Class[] p = {Serializable.class, Parcelable.class, String.class, SparseArray.class, Binder.class, Size.class, SizeF.class};
    public static final int[] q = {13, 15, 14};

    static {
        int i2 = 21;
        h = new mz1(new c02(i2), false, -950549218);
        int i3 = 22;
        i = new mz1(new c02(i3), false, 1540845306);
        int i4 = 26;
        m = new mz1(new c02(i4), false, 622474171);
        n = new mz1(new n02(i3), false, 213133291);
        o = new mz1(new m02(i2), false, 1286434419);
        r = new ywb(i4);
    }

    public static hm5 A(n1 n1Var, uue uueVar) {
        xm2 xm2Var = (xm2) ((g33) op8.V(g33.class, n1Var));
        xq6 xq6VarA = xm2Var.a();
        s26 s26Var = new s26(xm2Var.b, 17, xm2Var.c);
        uueVar.getClass();
        return new hm5(xq6VarA, uueVar, s26Var);
    }

    public static final int B(b24 b24Var) {
        if (b24Var instanceof u14) {
            return R.string.common_claps_account_suspended_message;
        }
        if (b24Var instanceof x14) {
            return R.string.common_claps_network_failure;
        }
        if ((b24Var instanceof v14) || (b24Var instanceof w14) || (b24Var instanceof y14) || (b24Var instanceof z14) || (b24Var instanceof a24)) {
            return R.string.common_claps_failure;
        }
        ygf.a();
        return 0;
    }

    public static hm5 C(j15 j15Var, uue uueVar) {
        xm2 xm2Var = ((fo2) ((h33) op8.V(h33.class, j15Var))).c;
        xq6 xq6VarA = xm2Var.a();
        s26 s26Var = new s26(xm2Var.b, 17, xm2Var.c);
        uueVar.getClass();
        return new hm5(xq6VarA, uueVar, s26Var);
    }

    public static final int D(b24 b24Var) {
        b24Var.getClass();
        if (b24Var instanceof u14) {
            return R.string.common_error_account_suspended_message;
        }
        if (b24Var instanceof v14) {
            return R.string.common_error_forbidden_message;
        }
        if (b24Var instanceof w14) {
            return R.string.common_error_generic_message;
        }
        if (b24Var instanceof x14) {
            return R.string.common_error_network_error_message;
        }
        if (b24Var instanceof y14) {
            return R.string.common_error_not_found_message;
        }
        if (b24Var instanceof z14) {
            return R.string.common_error_server_error_message;
        }
        if (b24Var instanceof a24) {
            return R.string.common_error_unauthorized_message;
        }
        ygf.a();
        return 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x00c4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.h1b E(defpackage.j7a r4, boolean r5, boolean r6, java.lang.Boolean r7, boolean r8, defpackage.zm7 r9, defpackage.zz7 r10) {
        /*
            Method dump skipped, instruction units count: 220
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f49.E(j7a, boolean, boolean, java.lang.Boolean, boolean, zm7, zz7):h1b");
    }

    public static final Integer F(b24 b24Var) {
        b24Var.getClass();
        if (b24Var instanceof x14) {
            return Integer.valueOf(R.string.common_error_network_error_title);
        }
        if (!(b24Var instanceof w14) && !(b24Var instanceof u14) && !(b24Var instanceof v14) && !(b24Var instanceof y14) && !(b24Var instanceof z14) && !(b24Var instanceof a24)) {
            ygf.a();
        }
        return null;
    }

    public static final int G(int[] iArr) {
        int length = iArr.length;
        int i2 = -1;
        int i3 = Integer.MIN_VALUE;
        for (int i4 = 0; i4 < length; i4++) {
            int i5 = iArr[i4];
            if (i3 < i5) {
                i2 = i4;
                i3 = i5;
            }
        }
        return i2;
    }

    public static int H(int[] iArr) {
        int length = iArr.length;
        int i2 = -1;
        int i3 = Integer.MAX_VALUE;
        for (int i4 = 0; i4 < length; i4++) {
            int i5 = iArr[i4];
            if (-2147483647 <= i5 && i5 < i3) {
                i2 = i4;
                i3 = i5;
            }
        }
        return i2;
    }

    public static final float[] I(float[] fArr) {
        float f2 = fArr[0];
        float f3 = fArr[3];
        float f4 = fArr[6];
        float f5 = fArr[1];
        float f6 = fArr[4];
        float f7 = fArr[7];
        float f8 = fArr[2];
        float f9 = fArr[5];
        float f10 = fArr[8];
        float f11 = (f6 * f10) - (f7 * f9);
        float f12 = (f7 * f8) - (f5 * f10);
        float f13 = (f5 * f9) - (f6 * f8);
        float f14 = (f4 * f13) + (f3 * f12) + (f2 * f11);
        float[] fArr2 = new float[fArr.length];
        fArr2[0] = f11 / f14;
        fArr2[1] = f12 / f14;
        fArr2[2] = f13 / f14;
        fArr2[3] = ((f4 * f9) - (f3 * f10)) / f14;
        fArr2[4] = ((f10 * f2) - (f4 * f8)) / f14;
        fArr2[5] = ((f8 * f3) - (f9 * f2)) / f14;
        fArr2[6] = ((f3 * f7) - (f4 * f6)) / f14;
        fArr2[7] = ((f4 * f5) - (f7 * f2)) / f14;
        fArr2[8] = ((f2 * f6) - (f3 * f5)) / f14;
        return fArr2;
    }

    public static final l78 J(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        View view = (View) p65Var.j(eo.f);
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = qo7.u(Boolean.FALSE);
            p65Var.j0(objM);
        }
        l78 l78Var = (l78) objM;
        Object objJ = p65Var.j(z22.v);
        boolean zH = p65Var.h(view);
        Object objM2 = p65Var.M();
        if (zH || objM2 == uobVar) {
            objM2 = new si3(view, 19, l78Var);
            p65Var.j0(objM2);
        }
        kyd.h(objJ, (x45) objM2, p65Var);
        Boolean bool = (Boolean) l78Var.getValue();
        bool.getClass();
        return qo7.y(bool, p65Var);
    }

    public static /* synthetic */ void K(f66 f66Var, d66 d66Var, e66 e66Var, m45 m45Var, Throwable th, boolean z, int i2) {
        if ((i2 & 8) != 0) {
            th = null;
        }
        Throwable th2 = th;
        if ((i2 & 16) != 0) {
            z = false;
        }
        ((nig) f66Var).y(d66Var, e66Var, m45Var, th2, z);
    }

    public static /* synthetic */ void L(f66 f66Var, d66 d66Var, List list, m45 m45Var, Throwable th, int i2) {
        if ((i2 & 8) != 0) {
            th = null;
        }
        ((nig) f66Var).A(d66Var, list, m45Var, th, false, null);
    }

    public static void M(f66 f66Var, m45 m45Var, Map map) {
        ysb feature;
        nig nigVar = (nig) f66Var;
        nigVar.getClass();
        l66 l66Var = (l66) nigVar.a;
        yu2 yu2Var = l66Var instanceof yu2 ? (yu2) l66Var : null;
        if (yu2Var != null) {
            yu2Var.i();
        }
        if (!new gg5(1.5f).Y() || l66Var == null || (feature = l66Var.getFeature("rum")) == null) {
            return;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(map);
        v57.CREATION_SAMPLING_RATE.getClass();
        v57 v57Var = v57.REPORTING_SAMPLING_RATE;
        Float fValueOf = Float.valueOf(1.5f);
        v57Var.getClass();
        linkedHashMap.put(v57Var.toString(), fValueOf);
        feature.a(new o66((String) m45Var.invoke(), linkedHashMap));
    }

    public static final hec N(mn6 mn6Var) {
        mn6Var.getClass();
        o3e o3eVarM0 = mn6Var.m0();
        if (o3eVarM0 instanceof zm4) {
            return ((zm4) o3eVarM0).b;
        }
        if (o3eVarM0 instanceof hec) {
            return (hec) o3eVarM0;
        }
        ygf.a();
        return null;
    }

    public static final int O(int[] iArr, long j2) {
        int i2 = (int) (j2 & 4294967295L);
        int iMax = Integer.MIN_VALUE;
        for (int i3 = (int) (j2 >> 32); i3 < i2; i3++) {
            iMax = Math.max(iMax, iArr[i3]);
        }
        return iMax;
    }

    /* JADX WARN: Code restructure failed: missing block: B:154:0x02f5, code lost:
    
        r0 = H(r4);
        r2 = 1;
        r1 = defpackage.k80.H0(r15) + 1;
        r12 = r35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:155:0x0301, code lost:
    
        if (r1 < r12) goto L509;
     */
    /* JADX WARN: Code restructure failed: missing block: B:195:0x03ae, code lost:
    
        r0 = H(r8);
        r1 = G(r43);
     */
    /* JADX WARN: Code restructure failed: missing block: B:196:0x03b8, code lost:
    
        if (r0 == r1) goto L201;
     */
    /* JADX WARN: Code restructure failed: missing block: B:198:0x03c0, code lost:
    
        if (r8[r0] != r8[r1]) goto L200;
     */
    /* JADX WARN: Code restructure failed: missing block: B:199:0x03c2, code lost:
    
        r0 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:200:0x03c5, code lost:
    
        r0 = r0;
        r35 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:201:0x03c9, code lost:
    
        r1 = r43[r0];
        r40 = r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:202:0x03ce, code lost:
    
        if (r1 != (-1)) goto L204;
     */
    /* JADX WARN: Code restructure failed: missing block: B:203:0x03d0, code lost:
    
        r1 = r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:204:0x03d1, code lost:
    
        r1 = r7.n(r1, r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:205:0x03d5, code lost:
    
        if (r1 >= 0) goto L222;
     */
    /* JADX WARN: Code restructure failed: missing block: B:206:0x03d7, code lost:
    
        r14 = r66;
        r1 = r43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:207:0x03db, code lost:
    
        if (r35 != false) goto L212;
     */
    /* JADX WARN: Code restructure failed: missing block: B:209:0x03e1, code lost:
    
        if (Q(r1, r14, r8, r0) == false) goto L211;
     */
    /* JADX WARN: Code restructure failed: missing block: B:212:0x03e7, code lost:
    
        if (r70 == false) goto L211;
     */
    /* JADX WARN: Code restructure failed: missing block: B:213:0x03e9, code lost:
    
        r7.A();
        r1 = r1.length;
        r2 = new int[r1];
        r3 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:214:0x03f0, code lost:
    
        if (r3 >= r1) goto L654;
     */
    /* JADX WARN: Code restructure failed: missing block: B:215:0x03f2, code lost:
    
        r2[r3] = -1;
        r3 = r3 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:216:0x03f8, code lost:
    
        r1 = r8.length;
        r3 = new int[r1];
        r4 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:217:0x03fc, code lost:
    
        if (r4 >= r1) goto L655;
     */
    /* JADX WARN: Code restructure failed: missing block: B:218:0x03fe, code lost:
    
        r3[r4] = r8[r0];
        r4 = r4 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:220:0x040c, code lost:
    
        return P(r14, r67, r2, r3, false);
     */
    /* JADX WARN: Code restructure failed: missing block: B:221:0x040d, code lost:
    
        r42 = r3;
        r43 = r15;
        r15 = r67;
        r3 = r1;
        r46 = r9;
        r67 = r10;
        r45 = r12;
        r44 = r13;
        r0 = r35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:222:0x041f, code lost:
    
        r42 = r3;
        r45 = r12;
        r44 = r13;
        r3 = r43;
        r43 = r15;
        r15 = r67;
        r12 = r66.a(r10, r1, r0);
        r46 = r9;
        r67 = r10;
        r0 = (int) (r12 & 4294967295L);
        r9 = (int) (r12 >> 32);
        r10 = r0 - r9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:223:0x0440, code lost:
    
        if (r10 == 1) goto L225;
     */
    /* JADX WARN: Code restructure failed: missing block: B:224:0x0442, code lost:
    
        r9 = -2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:225:0x0444, code lost:
    
        r9 = r9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:226:0x0446, code lost:
    
        r7.C(r1, r9);
        r9 = r5.w0(r1, r12);
        r12 = O(r8, r12);
     */
    /* JADX WARN: Code restructure failed: missing block: B:227:0x0452, code lost:
    
        if (r10 == 1) goto L229;
     */
    /* JADX WARN: Code restructure failed: missing block: B:228:0x0454, code lost:
    
        r10 = r7.r(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:229:0x0459, code lost:
    
        r10 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:230:0x045b, code lost:
    
        r13 = r9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:231:0x045d, code lost:
    
        if (r13 >= r0) goto L651;
     */
    /* JADX WARN: Code restructure failed: missing block: B:232:0x045f, code lost:
    
        r39 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:233:0x0463, code lost:
    
        if (r8[r13] == r12) goto L235;
     */
    /* JADX WARN: Code restructure failed: missing block: B:234:0x0465, code lost:
    
        r35 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:235:0x0467, code lost:
    
        r38[r13].addFirst(r9);
        r3[r13] = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:236:0x046e, code lost:
    
        if (r10 != null) goto L238;
     */
    /* JADX WARN: Code restructure failed: missing block: B:237:0x0470, code lost:
    
        r47 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:238:0x0473, code lost:
    
        r47 = r10[r13];
     */
    /* JADX WARN: Code restructure failed: missing block: B:239:0x0477, code lost:
    
        r8[r13] = (r9.n + r12) + r47;
        r13 = r13 + 1;
        r0 = r39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:509:0x0a45, code lost:
    
        r2 = r34;
        r34 = r4;
        r4 = r10;
        r10 = r45;
        r6 = r3;
        r46 = r9;
        r3 = r15;
        r11 = r17;
        r35 = r20;
        r62 = r24;
        r2 = r33;
        r15 = r67;
        r17 = r69;
        r25 = r13;
        r13 = r66.a(r4, r1, r0);
        r3 = (int) (r13 & 4294967295L);
        r10 = (int) (r13 >> 32);
        r11 = r3 - r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:510:0x0a7a, code lost:
    
        if (r11 == 1) goto L512;
     */
    /* JADX WARN: Code restructure failed: missing block: B:511:0x0a7c, code lost:
    
        r0 = -2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:512:0x0a7f, code lost:
    
        r0 = r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:513:0x0a80, code lost:
    
        r7.C(r1, r0);
        r0 = r5.w0(r1, r13);
        r13 = O(r34, r13);
     */
    /* JADX WARN: Code restructure failed: missing block: B:514:0x0a90, code lost:
    
        if (r11 == 1) goto L518;
     */
    /* JADX WARN: Code restructure failed: missing block: B:515:0x0a92, code lost:
    
        r11 = r7.r(r1);
        r14 = r25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:516:0x0a98, code lost:
    
        if (r11 != null) goto L519;
     */
    /* JADX WARN: Code restructure failed: missing block: B:517:0x0a9a, code lost:
    
        r11 = new int[r14];
     */
    /* JADX WARN: Code restructure failed: missing block: B:518:0x0a9d, code lost:
    
        r14 = r25;
        r11 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:519:0x0aa1, code lost:
    
        r4 = r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:520:0x0aa4, code lost:
    
        if (r4 >= r3) goto L589;
     */
    /* JADX WARN: Code restructure failed: missing block: B:521:0x0aa6, code lost:
    
        if (r11 == null) goto L591;
     */
    /* JADX WARN: Code restructure failed: missing block: B:522:0x0aa8, code lost:
    
        r11[r4] = r13 - r34[r4];
     */
    /* JADX WARN: Code restructure failed: missing block: B:523:0x0aae, code lost:
    
        r3[r4] = r1;
        r34[r4] = r0.n + r13;
        r38[r4].addLast(r0);
        r4 = r4 + 1;
        r3 = r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:524:0x0ac1, code lost:
    
        r3 = (defpackage.m70) r7.d;
        r4 = defpackage.xp.B(r1, r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:525:0x0ac9, code lost:
    
        if (r4 >= 0) goto L529;
     */
    /* JADX WARN: Code restructure failed: missing block: B:526:0x0acb, code lost:
    
        if (r11 != null) goto L528;
     */
    /* JADX WARN: Code restructure failed: missing block: B:527:0x0acd, code lost:
    
        r25 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:528:0x0ad0, code lost:
    
        r25 = r6;
        r3.add(-(r4 + 1), new defpackage.dw6(r1, r11));
     */
    /* JADX WARN: Code restructure failed: missing block: B:529:0x0ade, code lost:
    
        r25 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0111, code lost:
    
        r0 = G(r10);
        r2 = r10[r0];
        r3 = r11.length;
        r6 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:530:0x0ae0, code lost:
    
        if (r11 != null) goto L532;
     */
    /* JADX WARN: Code restructure failed: missing block: B:531:0x0ae2, code lost:
    
        r3.removeAt(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:532:0x0ae6, code lost:
    
        ((defpackage.dw6) r3.get(r4)).b = r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:533:0x0aee, code lost:
    
        if (r13 >= r8) goto L584;
     */
    /* JADX WARN: Code restructure failed: missing block: B:535:0x0af2, code lost:
    
        if (r34[r10] > r8) goto L585;
     */
    /* JADX WARN: Code restructure failed: missing block: B:536:0x0af4, code lost:
    
        r0.l = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0119, code lost:
    
        if (r6 >= r3) goto L558;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x011b, code lost:
    
        r35 = r3;
        r37 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x0123, code lost:
    
        if (r10[r6] == r10[r0]) goto L560;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0125, code lost:
    
        r3 = r11[r37];
        r6 = r11[r0];
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0129, code lost:
    
        if (r3 >= r6) goto L561;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x012b, code lost:
    
        r11[r37] = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x012d, code lost:
    
        r6 = r37 + 1;
        r3 = r35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x0132, code lost:
    
        r2 = r7.n(r2, r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x0136, code lost:
    
        if (r2 >= 0) goto L63;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0141, code lost:
    
        r35 = r4;
        r3 = r1.a(r9, r2, r0);
        r0 = r8;
        r39 = r9;
        r6 = (int) (r3 & 4294967295L);
        r8 = (int) (r3 >> 32);
        r9 = r6 - r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x0155, code lost:
    
        if (r9 == 1) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x0157, code lost:
    
        r0 = -2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0159, code lost:
    
        r0 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x015a, code lost:
    
        r7.C(r2, r0);
        r0 = r5.w0(r2, r3);
        r3 = O(r11, r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x0166, code lost:
    
        if (r9 == 1) goto L70;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x0168, code lost:
    
        r31 = r7.r(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x016c, code lost:
    
        r4 = r69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x016e, code lost:
    
        if (r8 >= r6) goto L562;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x0170, code lost:
    
        r10[r8] = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x0172, code lost:
    
        if (r31 != null) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x0174, code lost:
    
        r9 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0175, code lost:
    
        r37 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x0178, code lost:
    
        r9 = r31[r8];
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x017b, code lost:
    
        r2 = (r0.n + r3) + r9;
        r11[r8] = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x0182, code lost:
    
        if ((r2 + r14) > 0) goto L564;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x0184, code lost:
    
        r4 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x0185, code lost:
    
        r8 = r8 + 1;
        r2 = r37;
     */
    /* JADX WARN: Removed duplicated region for block: B:326:0x0662  */
    /* JADX WARN: Removed duplicated region for block: B:423:0x086a  */
    /* JADX WARN: Removed duplicated region for block: B:491:0x09cb  */
    /* JADX WARN: Removed duplicated region for block: B:544:0x0b7d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.jw6 P(defpackage.fw6 r66, int r67, int[] r68, int[] r69, boolean r70) {
        /*
            Method dump skipped, instruction units count: 3022
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f49.P(fw6, int, int[], int[], boolean):jw6");
    }

    public static final boolean Q(int[] iArr, fw6 fw6Var, int[] iArr2, int i2) {
        xp xpVar = fw6Var.r;
        int length = iArr.length;
        for (int i3 = 0; i3 < length; i3++) {
            if (xpVar.n(iArr[i3], i3) == -1 && iArr2[i3] != iArr2[i2]) {
                return true;
            }
        }
        int length2 = iArr.length;
        for (int i4 = 0; i4 < length2; i4++) {
            if (xpVar.n(iArr[i4], i4) != -1 && iArr2[i4] >= iArr2[i2]) {
                return true;
            }
        }
        int iU = xpVar.u(0);
        return (iU == 0 || iU == -1 || iU == -2) ? false : true;
    }

    public static final float[] R(float[] fArr, float[] fArr2) {
        float[] fArr3 = new float[9];
        if (fArr.length < 9 || fArr2.length < 9) {
            return fArr3;
        }
        float f2 = fArr[0] * fArr2[0];
        float f3 = fArr[3];
        float f4 = fArr2[1];
        float f5 = fArr[6];
        float f6 = fArr2[2];
        fArr3[0] = (f5 * f6) + (f3 * f4) + f2;
        float f7 = fArr[1];
        float f8 = fArr2[0];
        float f9 = fArr[4];
        float f10 = fArr[7];
        float f11 = f10 * f6;
        fArr3[1] = f11 + (f4 * f9) + (f7 * f8);
        float f12 = fArr[2] * f8;
        float f13 = fArr[5];
        float f14 = (fArr2[1] * f13) + f12;
        float f15 = fArr[8];
        fArr3[2] = (f6 * f15) + f14;
        float f16 = fArr[0];
        float f17 = fArr2[3] * f16;
        float f18 = fArr2[4];
        float f19 = (f3 * f18) + f17;
        float f20 = fArr2[5];
        fArr3[3] = (f5 * f20) + f19;
        float f21 = fArr[1];
        float f22 = fArr2[3];
        float f23 = f9 * f18;
        fArr3[4] = (f10 * f20) + f23 + (f21 * f22);
        float f24 = fArr[2];
        float f25 = f20 * f15;
        fArr3[5] = f25 + (f13 * fArr2[4]) + (f22 * f24);
        float f26 = f16 * fArr2[6];
        float f27 = fArr[3];
        float f28 = fArr2[7];
        float f29 = (f27 * f28) + f26;
        float f30 = fArr2[8];
        fArr3[6] = (f5 * f30) + f29;
        float f31 = fArr2[6];
        float f32 = f10 * f30;
        fArr3[7] = f32 + (fArr[4] * f28) + (f21 * f31);
        float f33 = f15 * f30;
        fArr3[8] = f33 + (fArr[5] * fArr2[7]) + (f24 * f31);
        return fArr3;
    }

    public static final float[] S(float[] fArr, float[] fArr2) {
        if (fArr.length < 9 || fArr2.length < 3) {
            return fArr2;
        }
        float f2 = fArr2[0];
        float f3 = fArr2[1];
        float f4 = fArr2[2];
        fArr2[0] = (fArr[6] * f4) + (fArr[3] * f3) + (fArr[0] * f2);
        fArr2[1] = (fArr[7] * f4) + (fArr[4] * f3) + (fArr[1] * f2);
        fArr2[2] = (fArr[8] * f4) + (fArr[5] * f3) + (fArr[2] * f2);
        return fArr2;
    }

    public static final void T(int i2, int[] iArr) {
        int length = iArr.length;
        for (int i3 = 0; i3 < length; i3++) {
            iArr[i3] = iArr[i3] + i2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0044  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.b31 U(defpackage.yi5 r26) {
        /*
            Method dump skipped, instruction units count: 454
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f49.U(yi5):b31");
    }

    public static final r28 V() {
        return Build.VERSION.SDK_INT < 29 ? o28.b : new d44();
    }

    public static String W(long j2) {
        int i2 = (int) (j2 >> 32);
        int i3 = (int) (j2 & 4294967295L);
        if (Float.intBitsToFloat(i2) == Float.intBitsToFloat(i3)) {
            return "CornerRadius.circular(" + vc2.P(Float.intBitsToFloat(i2)) + ')';
        }
        return "CornerRadius.elliptical(" + vc2.P(Float.intBitsToFloat(i2)) + ", " + vc2.P(Float.intBitsToFloat(i3)) + ')';
    }

    public static final hec X(mn6 mn6Var) {
        mn6Var.getClass();
        o3e o3eVarM0 = mn6Var.m0();
        if (o3eVarM0 instanceof zm4) {
            return ((zm4) o3eVarM0).c;
        }
        if (o3eVarM0 instanceof hec) {
            return (hec) o3eVarM0;
        }
        ygf.a();
        return null;
    }

    public static final r28 Y(hu huVar) {
        return new e83(huVar);
    }

    public static final void a(jb0 jb0Var, cb0 cb0Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        Object vfVar;
        cb0 cb0Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1037457660);
        int i3 = i2 | (p65Var2.f(jb0Var) ? 4 : 2) | (p65Var2.f(cb0Var) ? 32 : 16) | (p65Var2.f(r28Var) ? 256 : 128);
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            boolean zA = jb0Var.a();
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                vfVar = new vf(0, cb0Var, cb0.class, "refresh", "refresh()V", 0, 28);
                cb0Var2 = cb0Var;
                p65Var2.j0(vfVar);
            } else {
                vfVar = objM;
                cb0Var2 = cb0Var;
            }
            p65Var = p65Var2;
            er7.d(zA, (m45) ((qh6) vfVar), r28Var.b(jfc.c), null, 0L, 0L, false, 0.0f, null, null, pxf.E(-751053166, new ec(jb0Var, 14, cb0Var2), p65Var2), p65Var, 0, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 22, jb0Var, cb0Var, r28Var);
        }
    }

    public static final void b(String str, String str2, ab0 ab0Var, r28 r28Var, lb0 lb0Var, x12 x12Var, int i2) {
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-829146859);
        int i3 = (p65Var.f(str) ? 4 : 2) | i2 | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(ab0Var) ? 256 : 128) | 8192;
        int i4 = 0;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == w12.a) {
                    objM = new bb0(str, str2, i4);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                lb0Var = (lb0) to7.z(n1b.a.b(lb0.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
            } else {
                p65Var.S();
            }
            p65Var.q();
            jt7.a(false, pxf.E(1938814664, new b45(r28Var, new cb0(lb0Var, ab0Var), guc.z(lb0Var.j, p65Var, 0), 25), p65Var), p65Var, 48, 1);
        } else {
            p65Var.S();
        }
        lb0 lb0Var2 = lb0Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(str, str2, ab0Var, r28Var, lb0Var2, i2, 5);
        }
    }

    /* JADX WARN: Type inference failed for: r12v19 */
    /* JADX WARN: Type inference failed for: r12v20, types: [n92, r28] */
    /* JADX WARN: Type inference failed for: r12v21 */
    public static final void c(gb0 gb0Var, cb0 cb0Var, r28 r28Var, x12 x12Var, int i2) {
        cb0 cb0Var2;
        ?? r12;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(599119150);
        int i3 = i2 | (p65Var.f(gb0Var) ? 4 : 2) | (p65Var.f(cb0Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            yrb yrbVarK = wgf.K(p65Var);
            o28 o28Var = o28.b;
            r28 r28VarB = wgf.R(o28Var, yrbVarK, false, 14).b(r28Var);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarB);
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            sn3 sn3Var = kt7.a;
            r28 r28VarJ = ka1.j((jp7) p65Var.j(sn3Var), o28Var, 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            ar0 ar0Var2 = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var2, false);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
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
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            va0 va0Var = gb0Var.b;
            int i7 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z = (i7 == 32) | ((i3 & 14) == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new n(cb0Var, 9, gb0Var);
                p65Var.j0(objM);
            }
            r40.f(va0Var, (m45) objM, null, p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
            hp7.t(p65Var, jfc.l(o28Var, 64.0f));
            r28 r28VarJ2 = ka1.j((jp7) p65Var.j(sn3Var), o28Var, 3, 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j5 = p65Var.T;
            int i8 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarJ2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC4 = dy0.c(ar0Var2, false);
            long j6 = p65Var.T;
            int i9 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL5 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC4);
            tp7.B(p65Var, cuVar2, i89VarL5);
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR5);
            za0 za0Var = gb0Var.c;
            boolean z2 = i7 == 32;
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                cb0Var2 = cb0Var;
                r12 = 0;
                k0 k0Var = new k0(1, cb0Var2, cb0.class, "onAudienceGrowthMonthSelected", "onAudienceGrowthMonthSelected(Lcom/medium/stats/ui/common/DateSelectFieldUiModel$SelectableTime;)V", 0, 2);
                p65Var.j0(k0Var);
                objM2 = k0Var;
            } else {
                cb0Var2 = cb0Var;
                r12 = 0;
            }
            t40.e(za0Var, (x45) ((qh6) objM2), r12, p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            p65Var.p(true);
            boolean z3 = i7 == 32;
            Object objM3 = p65Var.M();
            if (z3 || objM3 == uobVar) {
                objM3 = new z8(cb0Var2, r12, 11);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
        } else {
            cb0Var2 = cb0Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 24, gb0Var, cb0Var2, r28Var);
        }
    }

    public static final void d(hb0 hb0Var, cb0 cb0Var, r28 r28Var, x12 x12Var, int i2) {
        ar0 ar0Var;
        Object vfVar;
        float f2;
        hb0 hb0Var2 = hb0Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(999103308);
        int i3 = i2 | (p65Var.f(hb0Var2) ? 4 : 2) | (p65Var.f(cb0Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            hb0Var2 = hb0Var;
            b24 b24Var = hb0Var2.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                f2 = 1.0f;
                vfVar = new vf(0, cb0Var, cb0.class, "refresh", "refresh()V", 0, 29);
                p65Var.j0(vfVar);
            } else {
                vfVar = objM;
                ar0Var = ar0Var2;
                f2 = 1.0f;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, f2), ar0Var), null, null, null, null, (m45) ((qh6) vfVar), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 23, hb0Var2, cb0Var, r28Var);
        }
    }

    public static final void e(int i2, long j2, x12 x12Var, r28 r28Var) {
        long j3;
        long j4;
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-422203784);
        int i4 = i2 | (p65Var.f(r28Var) ? 4 : 2) | 16;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                j4 = ((zo7) p65Var.j(kt7.b)).c;
                i3 = i4 & (-113);
            } else {
                p65Var.S();
                i3 = i4 & (-113);
                j4 = j2;
            }
            p65Var.q();
            r28 r28VarV = m40.V(r28Var, p65Var, i3 & 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j5 = p65Var.T;
            int i5 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarV);
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
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            sn3 sn3Var = kt7.a;
            jp7 jp7Var = (jp7) p65Var.j(sn3Var);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j6 = p65Var.T;
            int i6 = (int) (j6 ^ (j6 >>> 32));
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
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            ar0 ar0Var2 = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var2, false);
            long j7 = p65Var.T;
            int i7 = (int) (j7 ^ (j7 >>> 32));
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
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r40.g(0, j4, p65Var, null);
            p65Var.p(true);
            p65Var.p(true);
            hp7.t(p65Var, jfc.l(o28Var, 64.0f));
            r28 r28VarJ2 = ka1.j((jp7) p65Var.j(sn3Var), o28Var, 3, 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j8 = p65Var.T;
            int i8 = (int) (j8 ^ (j8 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarJ2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC4 = dy0.c(ar0Var2, false);
            long j9 = p65Var.T;
            int i9 = (int) (j9 ^ (j9 >>> 32));
            i89 i89VarL5 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC4);
            tp7.B(p65Var, cuVar2, i89VarL5);
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR5);
            t40.f(0, j4, p65Var, null);
            p65Var.p(true);
            p65Var.p(true);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            p65Var.p(true);
            j3 = j4;
        } else {
            p65Var.S();
            j3 = j2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var, j3, i2, 1);
        }
    }

    public static final void f(float f2, int i2, long j2, x12 x12Var, r28 r28Var) {
        int i3;
        float fB;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1249392198);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.e(j2) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.c(f2) ? 256 : 128;
        }
        int i4 = i3 | 3072;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var.U();
            if ((i2 & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            if (vj3.b(f2, 0.0f)) {
                p65Var.Y(-455979798);
                fB = 1.0f / ((m73) p65Var.j(z22.h)).b();
                p65Var.p(false);
            } else {
                p65Var.Y(-455913241);
                p65Var.p(false);
                fB = f2;
            }
            dy0.a(flb.a0(jfc.e(jfc.d(r28Var.b(o28.b), 1.0f), fB), j2, rv8.r), p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new li3(r28Var, j2, f2, i2);
        }
    }

    public static final void g(int i2, x12 x12Var, ay4 ay4Var, r28 r28Var, gz8 gz8Var, nhc nhcVar, FollowingTab followingTab, String str, String str2) {
        p65 p65Var;
        char c2;
        gz8 gz8Var2 = gz8Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-229927230);
        int i3 = i2 | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(str2) ? 32 : 16) | (p65Var2.d(followingTab.ordinal()) ? 256 : 128) | (p65Var2.f(ay4Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.f(gz8Var2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var2.f(nhcVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var2.f(r28Var) ? 1048576 : 524288);
        if (p65Var2.P(i3 & 1, (599187 & i3) != 599186)) {
            Resources resources = (Resources) p65Var2.j(eo.c);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                g04 entries = FollowingTab.getEntries();
                c2 = ' ';
                ArrayList arrayList = new ArrayList(cu1.k0(entries, 10));
                Iterator<E> it2 = entries.iterator();
                while (it2.hasNext()) {
                    arrayList.add(resources.getString(((FollowingTab) it2.next()).getTitleResId()));
                }
                p65Var2.j0(arrayList);
                objM = arrayList;
            } else {
                c2 = ' ';
            }
            List list = (List) objM;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j2 = p65Var2.T;
            int i4 = (int) (j2 ^ (j2 >>> c2));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            jp7 jp7Var = (jp7) p65Var2.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j3 = p65Var2.T;
            int i5 = (int) (j3 ^ (j3 >>> c2));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarJ);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i5, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j4 = p65Var2.T;
            int i6 = (int) (j4 ^ (j4 >>> c2));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i6, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            r28 r28VarD2 = jfc.d(o28Var, 1.0f);
            int iOrdinal = followingTab.ordinal();
            int i7 = i3 & 7168;
            boolean z = i7 == 2048;
            Object objM2 = p65Var2.M();
            if (z || objM2 == uobVar) {
                objM2 = new ff4(7, ay4Var);
                p65Var2.j0(objM2);
            }
            ns7.a(0.0f, iOrdinal, 3072, 496, 0L, 0L, p65Var2, (x45) objM2, null, r28VarD2, null, list);
            p65Var2.p(true);
            p65Var2.p(true);
            gz8Var2 = gz8Var;
            kk7.c(gz8Var2, null, null, null, null, null, false, null, null, null, pxf.E(-815508807, new vx4(str, str2, nhcVar, ay4Var, 0), p65Var2), p65Var2, (i3 >> 12) & 14, 16382);
            p65Var = p65Var2;
            p65Var.p(true);
            boolean z2 = ((i3 & 57344) == 16384) | (i7 == 2048);
            Object objM3 = p65Var.M();
            if (z2 || objM3 == uobVar) {
                objM3 = new xs3(gz8Var2, ay4Var, null, 12);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, gz8Var2);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mc3(str, str2, followingTab, ay4Var, gz8Var2, nhcVar, r28Var, i2, 2);
        }
    }

    public static final void h(int i2, x12 x12Var, ay4 ay4Var, r28 r28Var, gz8 gz8Var, nhc nhcVar, FollowingTab followingTab, String str, String str2) {
        int i3;
        String str3;
        p65 p65Var;
        str.getClass();
        str2.getClass();
        followingTab.getClass();
        ay4Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1158633559);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(str) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            str3 = str2;
            i3 |= p65Var2.f(str3) ? 32 : 16;
        } else {
            str3 = str2;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.d(followingTab.ordinal()) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(ay4Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var2.f(gz8Var) ? 1048576 : 524288;
        }
        if (p65Var2.P(i3 & 1, (599187 & i3) != 599186)) {
            p65Var2.U();
            if ((i2 & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new cq4(14);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(bgf.N(wxb.a(r28Var, false, (x45) objM), "following_screen"), pxf.E(491121499, new tx4(ay4Var), p65Var2), null, pxf.E(-1790000419, new u8(nhcVar, 28), p65Var2), null, 0, 0L, 0L, null, pxf.E(1584259430, new j84(str, str3, followingTab, ay4Var, gz8Var, nhcVar), p65Var2), p65Var, 805309488, 500);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kz1(str, str2, followingTab, ay4Var, r28Var, nhcVar, gz8Var, i2, 1);
        }
    }

    public static final void i(String str, String str2, FollowingTab followingTab, dx4 dx4Var, r28 r28Var, ty4 ty4Var, x12 x12Var, int i2) {
        FollowingTab followingTab2;
        p65 p65Var;
        ty4 ty4Var2;
        int i3;
        ty4 ty4Var3;
        str.getClass();
        str2.getClass();
        followingTab.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(69105623);
        int i4 = i2 | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(str2) ? 32 : 16) | (p65Var2.d(followingTab.ordinal()) ? 256 : 128) | (p65Var2.f(dx4Var) ? 2048 : 1024) | (p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        int i5 = 0;
        if (p65Var2.P(i4 & 1, (74899 & i4) != 74898)) {
            p65Var2.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var2.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 896) == 256);
                Object objM = p65Var2.M();
                if (z || objM == uobVar) {
                    followingTab2 = followingTab;
                    objM = new o8(str, str2, followingTab2, 20);
                    p65Var2.j0(objM);
                } else {
                    followingTab2 = followingTab;
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var2);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-458753);
                    ty4Var3 = (ty4) to7.z(n1b.a.b(ty4.class), wueVarA, t40.E(wueVarA, p65Var2), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var2);
                }
            } else {
                p65Var2.S();
                i3 = i4 & (-458753);
                followingTab2 = followingTab;
                ty4Var3 = ty4Var;
            }
            p65Var2.q();
            l78 l78VarZ = guc.z(ty4Var3.g, p65Var2, 0);
            nhc nhcVarF = mk7.F(p65Var2);
            int iOrdinal = ((FollowingTab) l78VarZ.getValue()).ordinal();
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = new e73(7);
                p65Var2.j0(objM2);
            }
            d13 d13VarB = jz8.b(iOrdinal, (m45) objM2, p65Var2, 384, 2);
            boolean zF = ((i3 & 7168) == 2048) | p65Var2.f(ty4Var3);
            Object objM3 = p65Var2.M();
            if (zF || objM3 == uobVar) {
                objM3 = new ay4(dx4Var, ty4Var3);
                p65Var2.j0(objM3);
            }
            p65Var = p65Var2;
            h(i3 & 57470, p65Var, (ay4) objM3, r28Var, d13VarB, nhcVarF, (FollowingTab) l78VarZ.getValue(), str, str2);
            boolean zH = p65Var.h(ty4Var3);
            Object objM4 = p65Var.M();
            n92 n92Var = null;
            if (zH || objM4 == uobVar) {
                objM4 = new z8(ty4Var3, n92Var, 29);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            FollowingTab followingTab3 = (FollowingTab) l78VarZ.getValue();
            boolean zF2 = p65Var.f(d13VarB) | p65Var.f(l78VarZ);
            Object objM5 = p65Var.M();
            if (zF2 || objM5 == uobVar) {
                objM5 = new xx4(d13VarB, l78VarZ, n92Var, i5);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, followingTab3);
            ty4Var2 = ty4Var3;
        } else {
            followingTab2 = followingTab;
            p65Var = p65Var2;
            p65Var.S();
            ty4Var2 = ty4Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(str, str2, followingTab2, dx4Var, r28Var, ty4Var2, i2, 11);
        }
    }

    public static final void j(ay4 ay4Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1510820448);
        int i3 = (p65Var2.f(ay4Var) ? 4 : 2) | i2;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            String strR = vo7.R(p65Var2, R.string.common_following);
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new gi4(0, ay4Var, ay4.class, "onBackPressed", "onBackPressed()V", 0, 20);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.g(null, strR, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var, 0, 505);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new tx4(ay4Var, i2);
        }
    }

    public static final void k(m45 m45Var, r28 r28Var, boolean z, mz1 mz1Var, x12 x12Var, int i2, int i3) {
        int i4;
        r28 r28Var2;
        boolean z2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1316660641);
        if ((i2 & 6) == 0) {
            i4 = i2 | (p65Var.h(m45Var) ? 4 : 2);
        } else {
            i4 = i2;
        }
        int i5 = i3 & 2;
        if (i5 != 0) {
            i4 |= 48;
        } else if ((i2 & 48) == 0) {
            i4 |= p65Var.f(r28Var) ? 32 : 16;
        }
        int i6 = i4 | 3456;
        if (p65Var.P(i6 & 1, (i6 & 9363) != 9362)) {
            r28 r28Var3 = i5 != 0 ? o28.b : r28Var;
            sn3 sn3Var = h56.a;
            z2 = true;
            r28 r28VarP = hlg.p(r28Var3.b(x08.b), null, rkb.a(4, 0L, false), true, new vkb(0), m45Var, 8);
            zk7 zk7VarC = dy0.c(z46.h, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarP);
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
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-1874697310);
            sn3 sn3Var2 = w72.a;
            float fFloatValue = ((Number) p65Var.j(sn3Var2)).floatValue();
            p65Var.p(false);
            k40.c(sn3Var2.a(Float.valueOf(fFloatValue)), mz1Var, p65Var, 56);
            p65Var.p(true);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            z2 = z;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sr1(m45Var, r28Var2, z2, mz1Var, i2, i3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0150  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x015d  */
    /* JADX WARN: Removed duplicated region for block: B:93:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void l(defpackage.m45 r24, defpackage.r28 r25, boolean r26, defpackage.nv5 r27, defpackage.m3c r28, defpackage.b55 r29, defpackage.x12 r30, int r31, int r32) {
        /*
            Method dump skipped, instruction units count: 363
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f49.l(m45, r28, boolean, nv5, m3c, b55, x12, int, int):void");
    }

    public static final void m(r28 r28Var, m45 m45Var, boolean z, m3c m3cVar, nv5 nv5Var, b55 b55Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1134296466);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(m45Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.g(z) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(m3cVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.f(nv5Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var.f(null) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var.h(b55Var) ? 1048576 : 524288;
        }
        int i4 = i3;
        if (p65Var.P(i4 & 1, (599187 & i4) != 599186)) {
            p65Var.Y(977045485);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = ka1.k(p65Var);
            }
            m68 m68Var = (m68) objM;
            p65Var.p(false);
            fr5 fr5Var = g56.a;
            r28 r28VarB = r28Var.b(w08.b);
            float f2 = jgc.b;
            long jI = pwd.i(jgc.c + f2 + f2, 40.0f);
            rh4 rh4Var = jfc.a;
            r28 r28VarB2 = hlg.p(flb.a0(r40.y(jfc.m(r28VarB, yj3.b(jI), yj3.a(jI)), m3cVar), z ? nv5Var.a : nv5Var.c, m3cVar), m68Var, qkb.a(0.0f, 7, 0L, false), z, new vkb(0), m45Var, 8).b(new ml1(new nx(28)));
            zk7 zk7VarC = dy0.c(z46.h, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarB2);
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
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            k40.c(b09.q(z ? nv5Var.b : nv5Var.d, c82.a), b55Var, p65Var, ((i4 >> 15) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 8);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jp0(r28Var, m45Var, z, m3cVar, nv5Var, b55Var, i2);
        }
    }

    public static final void n(String str, RefineRecommendationsTab refineRecommendationsTab, RefineRecommendationsFilter refineRecommendationsFilter, zza zzaVar, uza uzaVar, x45 x45Var, nhc nhcVar, r28 r28Var, x12 x12Var, int i2) {
        float fIntValue;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(159079051);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f("customize_reading_history") ? 32 : 16) | (p65Var.d(refineRecommendationsTab.ordinal()) ? 256 : 128) | (p65Var.d(refineRecommendationsFilter == null ? -1 : refineRecommendationsFilter.ordinal()) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(zzaVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.f(uzaVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.h(x45Var) ? 1048576 : 524288) | (p65Var.f(nhcVar) ? 8388608 : 4194304) | (p65Var.f(r28Var) ? 67108864 : 33554432);
        if (p65Var.P(i3 & 1, (38347923 & i3) != 38347922)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new g49(0.0f);
                p65Var.j0(objM);
            }
            g49 g49Var = (g49) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = qo7.u(null);
                p65Var.j0(objM2);
            }
            l78 l78Var = (l78) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(null);
                p65Var.j0(objM3);
            }
            l78 l78Var2 = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = new wza(g49Var, l78Var, l78Var2);
                p65Var.j0(objM4);
            }
            rh4 rh4Var = jfc.c;
            r28 r28VarJ = rv8.J(r28Var.b(rh4Var), (wza) objM4, null);
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = new ws(l78Var, 22);
                p65Var.j0(objM5);
            }
            r28 r28VarV = pwd.V(r28VarD, (x45) objM5);
            Float f2 = (Float) l78Var2.getValue();
            if (f2 != null) {
                fIntValue = f2.floatValue();
            } else {
                fIntValue = ((Integer) l78Var.getValue()) != null ? r9.intValue() : 236.0f;
            }
            r28 r28VarF = jfc.f(r28VarV, 0.0f, fIntValue, 1);
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarF);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            jjd.b(y30.n(16.0f, R.string.refine_recommendations_subtitle, p65Var, p65Var, o28Var), w2g.E(o28Var, 24.0f, 0.0f, 2), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).m, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 131068);
            p65Var = p65Var;
            lv8.y(o28Var, 32.0f, p65Var, true);
            wv1 wv1VarA3 = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, rh4Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA3);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            int i7 = (i3 & 65534) | (458752 & (i3 >> 6));
            int i8 = i3 << 3;
            q(str, refineRecommendationsTab, refineRecommendationsFilter, zzaVar, nhcVar, uzaVar, x45Var, p65Var, i7 | (3670016 & i8) | (i8 & 29360128));
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new nb4(i2, 2, r28Var, str, refineRecommendationsTab, refineRecommendationsFilter, zzaVar, uzaVar, x45Var, nhcVar);
        }
    }

    public static final void o(zza zzaVar, String str, RefineRecommendationsTab refineRecommendationsTab, RefineRecommendationsFilter refineRecommendationsFilter, uza uzaVar, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        String str2;
        p65 p65Var;
        zzaVar.getClass();
        str.getClass();
        refineRecommendationsTab.getClass();
        x45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1922111470);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(zzaVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            str2 = str;
            i3 |= p65Var2.f(str2) ? 32 : 16;
        } else {
            str2 = str;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f("customize_reading_history") ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.d(refineRecommendationsTab.ordinal()) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.d(refineRecommendationsFilter == null ? -1 : refineRecommendationsFilter.ordinal()) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(uzaVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var2.h(x45Var) ? 1048576 : 524288;
        }
        if ((12582912 & i2) == 0) {
            i3 |= p65Var2.f(r28Var) ? 8388608 : 4194304;
        }
        if (p65Var2.P(i3 & 1, (4793491 & i3) != 4793490)) {
            nhc nhcVarF = mk7.F(p65Var2);
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new qna(7);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(bgf.N(wxb.a(r28Var, false, (x45) objM), "refine_recommendations_screen"), pxf.E(-2108404714, new v08(29, uzaVar), p65Var2), null, pxf.E(1397754904, new w87(nhcVarF, 17), p65Var2), null, 0, 0L, 0L, null, pxf.E(-1988333343, new c98(str2, refineRecommendationsTab, refineRecommendationsFilter, zzaVar, uzaVar, x45Var, nhcVarF, 2), p65Var2), p65Var, 805309488, 500);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kz1(zzaVar, str, refineRecommendationsTab, refineRecommendationsFilter, uzaVar, x45Var, r28Var, i2, 7);
        }
    }

    public static final void p(String str, RefineRecommendationsTab refineRecommendationsTab, RefineRecommendationsFilter refineRecommendationsFilter, uza uzaVar, r28 r28Var, c0b c0bVar, x12 x12Var, int i2) {
        c0b c0bVar2;
        int i3;
        c0b c0bVar3;
        str.getClass();
        refineRecommendationsTab.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2005802476);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.d(refineRecommendationsTab.ordinal()) ? 256 : 128) | (p65Var.d(refineRecommendationsFilter == null ? -1 : refineRecommendationsFilter.ordinal()) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(uzaVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | 524288;
        if (p65Var.P(i4 & 1, (599187 & i4) != 599186)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & 896) == 256);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new pda(str, 7, refineRecommendationsTab);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-3670017);
                    c0bVar3 = (c0b) to7.z(n1b.a.b(c0b.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-3670017);
                c0bVar3 = c0bVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(c0bVar3.c, p65Var, 0);
            boolean zH = p65Var.h(c0bVar3);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new eb8(16, c0bVar3);
                p65Var.j0(objM2);
            }
            o((zza) l78VarZ.getValue(), str, refineRecommendationsTab, refineRecommendationsFilter, uzaVar, (x45) objM2, r28Var, p65Var, ((i3 << 3) & 524272) | ((i3 << 6) & 29360128));
            c0bVar2 = c0bVar3;
        } else {
            p65Var.S();
            c0bVar2 = c0bVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(str, refineRecommendationsTab, refineRecommendationsFilter, uzaVar, r28Var, c0bVar2, i2, 20);
        }
    }

    public static final void q(String str, RefineRecommendationsTab refineRecommendationsTab, RefineRecommendationsFilter refineRecommendationsFilter, zza zzaVar, nhc nhcVar, uza uzaVar, x45 x45Var, x12 x12Var, int i2) {
        int i3;
        x45 x45Var2;
        p65 p65Var;
        char c2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1096435029);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(str) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f("customize_reading_history") ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.d(refineRecommendationsTab.ordinal()) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.d(refineRecommendationsFilter == null ? -1 : refineRecommendationsFilter.ordinal()) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(zzaVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var2.f(uzaVar) ? 1048576 : 524288;
        }
        if ((12582912 & i2) == 0) {
            i3 |= p65Var2.h(x45Var) ? 8388608 : 4194304;
        }
        if (p65Var2.P(i3 & 1, (4793491 & i3) != 4793490)) {
            Resources resources = (Resources) p65Var2.j(eo.c);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                g04 entries = RefineRecommendationsTab.getEntries();
                c2 = ' ';
                ArrayList arrayList = new ArrayList(cu1.k0(entries, 10));
                Iterator<E> it2 = entries.iterator();
                while (it2.hasNext()) {
                    arrayList.add(resources.getString(((RefineRecommendationsTab) it2.next()).getTitleResId()));
                }
                p65Var2.j0(arrayList);
                objM = arrayList;
            } else {
                c2 = ' ';
            }
            List list = (List) objM;
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var2);
                p65Var2.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            int iOrdinal = refineRecommendationsTab.ordinal();
            boolean zH = p65Var2.h(list);
            Object objM3 = p65Var2.M();
            if (zH || objM3 == uobVar) {
                objM3 = new c13(list, 2);
                p65Var2.j0(objM3);
            }
            d13 d13VarB = jz8.b(iOrdinal, (m45) objM3, p65Var2, 0, 2);
            jp7 jp7Var = (jp7) p65Var2.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var2.T;
            int i4 = (int) (j2 ^ (j2 >>> c2));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarJ);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            int i5 = i3;
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var2.T;
            int i6 = (int) (j3 ^ (j3 >>> c2));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i6, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            r28 r28VarD2 = jfc.d(o28Var, 1.0f);
            int iOrdinal2 = zzaVar.a.ordinal();
            int i7 = i5 & 29360128;
            boolean zH2 = p65Var2.h(sb2Var) | (i7 == 8388608) | p65Var2.f(d13VarB);
            Object objM4 = p65Var2.M();
            if (zH2 || objM4 == uobVar) {
                x45Var2 = x45Var;
                objM4 = new pi9(x45Var2, sb2Var, d13VarB, 6);
                p65Var2.j0(objM4);
            } else {
                x45Var2 = x45Var;
            }
            int i8 = 0;
            ns7.a(0.0f, iOrdinal2, 3072, 496, 0L, 0L, p65Var2, (x45) objM4, null, r28VarD2, null, list);
            p65Var = p65Var2;
            p65Var.p(true);
            p65Var.p(true);
            kk7.c(d13VarB, null, null, null, null, null, false, null, null, null, pxf.E(1514516374, new vx4(str, uzaVar, nhcVar, refineRecommendationsFilter, 2), p65Var), p65Var, 0, 16382);
            boolean zF = p65Var.f(d13VarB) | (i7 == 8388608);
            Object objM5 = p65Var.M();
            if (zF || objM5 == uobVar) {
                objM5 = new yza(d13VarB, x45Var2, null, i8);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, d13VarB);
        } else {
            x45Var2 = x45Var;
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kz1(str, refineRecommendationsTab, refineRecommendationsFilter, zzaVar, nhcVar, uzaVar, x45Var2, i2, 6);
        }
    }

    public static jv1 r(jv1 jv1Var) {
        u2f u2fVar = gsa.h;
        if (rv8.y(jv1Var.b, 12884901888L)) {
            dkb dkbVar = (dkb) jv1Var;
            u2f u2fVar2 = dkbVar.d;
            if (!x(u2fVar2, u2fVar)) {
                return new dkb(dkbVar.a, dkbVar.h, u2fVar, R(v((float[]) zm7.d.b, u2fVar2.a(), u2fVar.a()), dkbVar.i), dkbVar.k, dkbVar.n, dkbVar.e, dkbVar.f, dkbVar.g, -1);
            }
        }
        return jv1Var;
    }

    public static final boolean u(Object obj) {
        if (obj instanceof yic) {
            yic yicVar = (yic) obj;
            if (yicVar.b() == y3b.h || yicVar.b() == xsa.h || yicVar.b() == uob.g) {
                Object value = yicVar.getValue();
                if (value == null) {
                    return true;
                }
                return u(value);
            }
        } else if (!(obj instanceof j55) || !(obj instanceof Serializable)) {
            for (int i2 = 0; i2 < 7; i2++) {
                if (p[i2].isInstance(obj)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static final float[] v(float[] fArr, float[] fArr2, float[] fArr3) {
        S(fArr, fArr2);
        S(fArr, fArr3);
        float[] fArr4 = {fArr3[0] / fArr2[0], fArr3[1] / fArr2[1], fArr3[2] / fArr2[2]};
        float[] fArrI = I(fArr);
        float f2 = fArr4[0];
        float f3 = fArr[0] * f2;
        float f4 = fArr4[1];
        float f5 = fArr[1] * f4;
        float f6 = fArr4[2];
        return R(fArrI, new float[]{f3, f5, fArr[2] * f6, fArr[3] * f2, fArr[4] * f4, fArr[5] * f6, f2 * fArr[6], f4 * fArr[7], f6 * fArr[8]});
    }

    public static final boolean x(u2f u2fVar, u2f u2fVar2) {
        if (u2fVar == u2fVar2) {
            return true;
        }
        return Math.abs(u2fVar.a - u2fVar2.a) < 0.001f && Math.abs(u2fVar.b - u2fVar2.b) < 0.001f;
    }

    public static final v42 y(jv1 jv1Var, jv1 jv1Var2) {
        return jv1Var == jv1Var2 ? new t42(jv1Var, jv1Var, 1) : (rv8.y(jv1Var.b, 12884901888L) && rv8.y(jv1Var2.b, 12884901888L)) ? new u42((dkb) jv1Var, (dkb) jv1Var2) : new v42(jv1Var, jv1Var2, 0);
    }

    public static final boolean z(long j2, long j3) {
        return j2 == j3;
    }

    public wd5 s(Context context, Looper looper, uz5 uz5Var, Object obj, ce5 ce5Var, de5 de5Var) {
        return t(context, looper, uz5Var, obj, (uif) ce5Var, (uif) de5Var);
    }

    public wd5 t(Context context, Looper looper, uz5 uz5Var, Object obj, uif uifVar, uif uifVar2) {
        throw new UnsupportedOperationException("buildClient must be implemented");
    }

    public abstract List w(String str, List list);
}
