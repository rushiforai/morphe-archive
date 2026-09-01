package androidx.datastore.preferences.protobuf;

import androidx.datastore.preferences.protobuf.InvalidProtocolBufferException;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import defpackage.crb;
import defpackage.d21;
import defpackage.j9f;
import defpackage.kh7;
import defpackage.l2e;
import defpackage.l6f;
import defpackage.lv8;
import defpackage.mh7;
import defpackage.o6f;
import defpackage.oh7;
import defpackage.r74;
import defpackage.rd6;
import defpackage.s2e;
import defpackage.t74;
import defpackage.u17;
import defpackage.u56;
import defpackage.u7a;
import defpackage.up1;
import defpackage.w7a;
import defpackage.ye8;
import defpackage.zg7;
import defpackage.zp1;
import java.io.IOException;
import java.lang.reflect.Field;
import java.security.AccessController;
import java.util.Arrays;
import java.util.List;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g implements crb {
    public static final int[] n = new int[0];
    public static final Unsafe o;
    public final int[] a;
    public final Object[] b;
    public final int c;
    public final int d;
    public final a e;
    public final boolean f;
    public final int[] g;
    public final int h;
    public final int i;
    public final ye8 j;
    public final u17 k;
    public final j l;
    public final oh7 m;

    static {
        Unsafe unsafe;
        try {
            unsafe = (Unsafe) AccessController.doPrivileged(new l2e(1));
        } catch (Throwable unused) {
            unsafe = null;
        }
        o = unsafe;
    }

    public g(int[] iArr, Object[] objArr, int i, int i2, a aVar, int[] iArr2, int i3, int i4, ye8 ye8Var, u17 u17Var, j jVar, t74 t74Var, oh7 oh7Var) {
        this.a = iArr;
        this.b = objArr;
        this.c = i;
        this.d = i2;
        this.f = aVar instanceof e;
        this.g = iArr2;
        this.h = i3;
        this.i = i4;
        this.j = ye8Var;
        this.k = u17Var;
        this.l = jVar;
        this.e = aVar;
        this.m = oh7Var;
    }

    public static Field F(Class cls, String str) {
        try {
            return cls.getDeclaredField(str);
        } catch (NoSuchFieldException unused) {
            Field[] declaredFields = cls.getDeclaredFields();
            for (Field field : declaredFields) {
                if (str.equals(field.getName())) {
                    return field;
                }
            }
            StringBuilder sbU = lv8.u("Field ", str, " for ");
            sbU.append(cls.getName());
            sbU.append(" not found. Known fields are ");
            sbU.append(Arrays.toString(declaredFields));
            throw new RuntimeException(sbU.toString());
        }
    }

    public static int I(int i) {
        return (i & 267386880) >>> 20;
    }

    public static void L(int i, Object obj, zg7 zg7Var) throws IOException {
        if (!(obj instanceof String)) {
            zg7Var.t0(i, (d21) obj);
        } else {
            ((zp1) zg7Var.b).z(i, (String) obj);
        }
    }

    public static boolean p(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj instanceof e) {
            return ((e) obj).g();
        }
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:124:0x026d  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x0273  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x028b  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x028e  */
    /* JADX WARN: Removed duplicated region for block: B:167:0x0346  */
    /* JADX WARN: Removed duplicated region for block: B:182:0x0390  */
    /* JADX WARN: Removed duplicated region for block: B:188:0x03a7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static androidx.datastore.preferences.protobuf.g w(defpackage.tsa r32, defpackage.ye8 r33, defpackage.u17 r34, androidx.datastore.preferences.protobuf.j r35, defpackage.t74 r36, defpackage.oh7 r37) {
        /*
            Method dump skipped, instruction units count: 1038
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.datastore.preferences.protobuf.g.w(tsa, ye8, u17, androidx.datastore.preferences.protobuf.j, t74, oh7):androidx.datastore.preferences.protobuf.g");
    }

    public static long x(int i) {
        return i & 1048575;
    }

    public static int y(long j, Object obj) {
        return ((Integer) s2e.h(j, obj)).intValue();
    }

    public static long z(long j, Object obj) {
        return ((Long) s2e.h(j, obj)).longValue();
    }

    public final int A(int i) {
        if (i < this.c || i > this.d) {
            return -1;
        }
        int[] iArr = this.a;
        int length = (iArr.length / 3) - 1;
        int i2 = 0;
        while (i2 <= length) {
            int i3 = (length + i2) >>> 1;
            int i4 = i3 * 3;
            int i5 = iArr[i4];
            if (i == i5) {
                return i4;
            }
            if (i < i5) {
                length = i3 - 1;
            } else {
                i2 = i3 + 1;
            }
        }
        return -1;
    }

    public final void B(Object obj, long j, d dVar, crb crbVar, r74 r74Var) throws InvalidProtocolBufferException.InvalidWireTypeException {
        int iY;
        this.k.getClass();
        u56 u56VarA = u17.a(j, obj);
        up1 up1Var = dVar.a;
        int i = dVar.b;
        if ((i & 7) != 3) {
            throw InvalidProtocolBufferException.b();
        }
        do {
            e eVarD = crbVar.d();
            dVar.b(eVarD, crbVar, r74Var);
            crbVar.b(eVarD);
            ((w7a) u56VarA).add(eVarD);
            if (up1Var.c() || dVar.d != 0) {
                return;
            } else {
                iY = up1Var.y();
            }
        } while (iY == i);
        dVar.d = iY;
    }

    public final void C(Object obj, int i, d dVar, crb crbVar, r74 r74Var) throws InvalidProtocolBufferException {
        int iY;
        this.k.getClass();
        u56 u56VarA = u17.a(i & 1048575, obj);
        up1 up1Var = dVar.a;
        int i2 = dVar.b;
        if ((i2 & 7) != 2) {
            throw InvalidProtocolBufferException.b();
        }
        do {
            e eVarD = crbVar.d();
            dVar.c(eVarD, crbVar, r74Var);
            crbVar.b(eVarD);
            ((w7a) u56VarA).add(eVarD);
            if (up1Var.c() || dVar.d != 0) {
                return;
            } else {
                iY = up1Var.y();
            }
        } while (iY == i2);
        dVar.d = iY;
    }

    public final void D(int i, d dVar, Object obj) throws InvalidProtocolBufferException.InvalidWireTypeException {
        up1 up1Var = dVar.a;
        if ((536870912 & i) != 0) {
            dVar.w(2);
            s2e.o(i & 1048575, obj, up1Var.x());
        } else if (!this.f) {
            s2e.o(i & 1048575, obj, dVar.e());
        } else {
            dVar.w(2);
            s2e.o(i & 1048575, obj, up1Var.w());
        }
    }

    public final void E(int i, d dVar, Object obj) throws InvalidProtocolBufferException.InvalidWireTypeException {
        boolean z = (536870912 & i) != 0;
        u17 u17Var = this.k;
        if (z) {
            u17Var.getClass();
            dVar.s(u17.a(i & 1048575, obj), true);
        } else {
            u17Var.getClass();
            dVar.s(u17.a(i & 1048575, obj), false);
        }
    }

    public final void G(int i, Object obj) {
        int i2 = this.a[i + 2];
        long j = 1048575 & i2;
        if (j == 1048575) {
            return;
        }
        s2e.m((1 << (i2 >>> 20)) | s2e.f(j, obj), j, obj);
    }

    public final void H(int i, int i2, Object obj) {
        s2e.m(i, this.a[i2 + 2] & 1048575, obj);
    }

    public final int J(int i) {
        return this.a[i + 1];
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x0195  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x01a4  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x01b1  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x01c2  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x01d3  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x01da  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x01e3  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x01ef  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0209  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x021f  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x022c  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0235  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x023d  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0243  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0249  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0255  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0260  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x026b  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0272  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x01a0 A[SYNTHETIC] */
    /*  JADX ERROR: UnsupportedOperationException in pass: RegionMakerVisitor
        java.lang.UnsupportedOperationException
        	at java.base/java.util.Collections$UnmodifiableCollection.add(Collections.java:1095)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker$1.leaveRegion(SwitchRegionMaker.java:390)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:70)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverse(DepthRegionTraversal.java:23)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.insertBreaksForCase(SwitchRegionMaker.java:370)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.insertBreaks(SwitchRegionMaker.java:85)
        	at jadx.core.dex.visitors.regions.PostProcessRegions.leaveRegion(PostProcessRegions.java:33)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:70)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverse(DepthRegionTraversal.java:19)
        	at jadx.core.dex.visitors.regions.PostProcessRegions.process(PostProcessRegions.java:23)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:31)
        */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void K(defpackage.zg7 r21, int r22, java.lang.Object r23, int r24) {
        /*
            Method dump skipped, instruction units count: 740
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.datastore.preferences.protobuf.g.K(zg7, int, java.lang.Object, int):void");
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:11:0x0025  */
    @Override // defpackage.crb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a(java.lang.Object r11, java.lang.Object r12) {
        /*
            Method dump skipped, instruction units count: 626
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.datastore.preferences.protobuf.g.a(java.lang.Object, java.lang.Object):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x007c  */
    @Override // defpackage.crb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b(java.lang.Object r10) {
        /*
            Method dump skipped, instruction units count: 234
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.datastore.preferences.protobuf.g.b(java.lang.Object):void");
    }

    @Override // defpackage.crb
    public final boolean c(Object obj) {
        int i;
        int i2;
        int i3;
        int i4 = 1048575;
        int i5 = 0;
        int i6 = 0;
        while (i6 < this.h) {
            int i7 = this.g[i6];
            int[] iArr = this.a;
            int i8 = iArr[i7];
            int iJ = J(i7);
            int i9 = iArr[i7 + 2];
            int i10 = i9 & 1048575;
            int i11 = 1 << (i9 >>> 20);
            if (i10 != i4) {
                if (i10 != 1048575) {
                    i5 = o.getInt(obj, i10);
                }
                i2 = i7;
                i3 = i5;
                i = i10;
            } else {
                int i12 = i5;
                i = i4;
                i2 = i7;
                i3 = i12;
            }
            if ((268435456 & iJ) == 0 || o(obj, i2, i, i3, i11)) {
                int I = I(iJ);
                if (I != 9 && I != 17) {
                    if (I != 27) {
                        if (I == 60 || I == 68) {
                            if (!q(i8, i2, obj) || m(i2).c(s2e.h(iJ & 1048575, obj))) {
                                i6++;
                                i4 = i;
                                i5 = i3;
                            }
                        } else if (I != 49) {
                            if (I != 50) {
                                continue;
                            } else {
                                Object objH = s2e.h(iJ & 1048575, obj);
                                this.m.getClass();
                                mh7 mh7Var = (mh7) objH;
                                if (mh7Var.isEmpty()) {
                                    continue;
                                } else {
                                    if (((l6f) ((kh7) this.b[(i2 / 3) * 2]).a.c).getJavaType() != o6f.MESSAGE) {
                                        continue;
                                    } else {
                                        crb crbVarA = null;
                                        for (Object obj2 : mh7Var.values()) {
                                            if (crbVarA == null) {
                                                crbVarA = u7a.c.a(obj2.getClass());
                                            }
                                            if (!crbVarA.c(obj2)) {
                                            }
                                        }
                                    }
                                }
                            }
                            i6++;
                            i4 = i;
                            i5 = i3;
                        }
                    }
                    List list = (List) s2e.h(iJ & 1048575, obj);
                    if (list.isEmpty()) {
                        continue;
                    } else {
                        crb crbVarM = m(i2);
                        for (int i13 = 0; i13 < list.size(); i13++) {
                            if (crbVarM.c(list.get(i13))) {
                            }
                        }
                    }
                    i6++;
                    i4 = i;
                    i5 = i3;
                } else if (!o(obj, i2, i, i3, i11) || m(i2).c(s2e.h(iJ & 1048575, obj))) {
                    i6++;
                    i4 = i;
                    i5 = i3;
                }
            }
            return false;
        }
        return true;
    }

    @Override // defpackage.crb
    public final e d() {
        this.j.getClass();
        return ((e) this.e).i();
    }

    /* JADX WARN: Removed duplicated region for block: B:160:0x07ee A[Catch: all -> 0x04e0, TryCatch #0 {all -> 0x04e0, blocks: (B:158:0x07e9, B:160:0x07ee, B:161:0x07f3, B:114:0x04db, B:117:0x04e3, B:118:0x04fb, B:119:0x0513, B:120:0x052b, B:121:0x0543, B:122:0x055b, B:123:0x0573, B:124:0x058b, B:125:0x05a3, B:126:0x05cb, B:127:0x05e9, B:128:0x0607, B:129:0x0626, B:130:0x0645, B:131:0x0666, B:132:0x0684, B:133:0x069d, B:134:0x06c5, B:135:0x06d6, B:136:0x06f6, B:137:0x0715, B:138:0x0734, B:139:0x0752, B:140:0x0770, B:141:0x078d, B:142:0x07ad, B:148:0x07cd), top: B:179:0x07e9 }] */
    /* JADX WARN: Removed duplicated region for block: B:171:0x0814 A[LOOP:3: B:170:0x0812->B:171:0x0814, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:173:0x081e  */
    /* JADX WARN: Removed duplicated region for block: B:208:0x07f9 A[SYNTHETIC] */
    @Override // defpackage.crb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e(java.lang.Object r21, androidx.datastore.preferences.protobuf.d r22, defpackage.r74 r23) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 2242
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.datastore.preferences.protobuf.g.e(java.lang.Object, androidx.datastore.preferences.protobuf.d, r74):void");
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // defpackage.crb
    public final void f(Object obj, zg7 zg7Var) throws IOException {
        int i;
        int[] iArr;
        int i2;
        int i3;
        int i4;
        g gVar = this;
        zg7Var.getClass();
        zp1 zp1Var = (zp1) zg7Var.b;
        j9f j9fVar = j9f.ASCENDING;
        j9f j9fVar2 = j9f.DESCENDING;
        char c = '?';
        int[] iArr2 = gVar.a;
        j jVar = gVar.l;
        boolean z = true;
        if (j9fVar == j9fVar2) {
            ((l) jVar).getClass();
            ((e) obj).unknownFields.d(zg7Var);
            for (int length = iArr2.length - 3; length >= 0; length -= 3) {
                int iJ = gVar.J(length);
                int i5 = iArr2[length];
                switch (I(iJ)) {
                    case 0:
                        if (gVar.n(length, obj)) {
                            zp1Var.t(i5, Double.doubleToRawLongBits(s2e.c.e(iJ & 1048575, obj)));
                        }
                        break;
                    case 1:
                        if (gVar.n(length, obj)) {
                            zp1Var.r(i5, Float.floatToRawIntBits(s2e.c.f(iJ & 1048575, obj)));
                        }
                        break;
                    case 2:
                        if (gVar.n(length, obj)) {
                            zp1Var.E(i5, s2e.g(iJ & 1048575, obj));
                        }
                        break;
                    case 3:
                        if (gVar.n(length, obj)) {
                            zp1Var.E(i5, s2e.g(iJ & 1048575, obj));
                        }
                        break;
                    case 4:
                        if (gVar.n(length, obj)) {
                            zp1Var.v(i5, s2e.f(iJ & 1048575, obj));
                        }
                        break;
                    case 5:
                        if (gVar.n(length, obj)) {
                            zp1Var.t(i5, s2e.g(iJ & 1048575, obj));
                        }
                        break;
                    case 6:
                        if (gVar.n(length, obj)) {
                            zp1Var.r(i5, s2e.f(iJ & 1048575, obj));
                        }
                        break;
                    case 7:
                        if (gVar.n(length, obj)) {
                            zp1Var.o(i5, s2e.c.b(iJ & 1048575, obj));
                        }
                        break;
                    case 8:
                        if (gVar.n(length, obj)) {
                            L(i5, s2e.h(iJ & 1048575, obj), zg7Var);
                        }
                        break;
                    case 9:
                        if (gVar.n(length, obj)) {
                            zp1Var.y(i5, (a) s2e.h(iJ & 1048575, obj), gVar.m(length));
                        }
                        break;
                    case 10:
                        if (gVar.n(length, obj)) {
                            zg7Var.t0(i5, (d21) s2e.h(iJ & 1048575, obj));
                        }
                        break;
                    case 11:
                        if (gVar.n(length, obj)) {
                            zp1Var.C(i5, s2e.f(iJ & 1048575, obj));
                        }
                        break;
                    case 12:
                        if (gVar.n(length, obj)) {
                            zp1Var.v(i5, s2e.f(iJ & 1048575, obj));
                        }
                        break;
                    case 13:
                        if (gVar.n(length, obj)) {
                            zp1Var.r(i5, s2e.f(iJ & 1048575, obj));
                        }
                        break;
                    case 14:
                        if (gVar.n(length, obj)) {
                            zp1Var.t(i5, s2e.g(iJ & 1048575, obj));
                        }
                        break;
                    case 15:
                        if (gVar.n(length, obj)) {
                            int iF = s2e.f(iJ & 1048575, obj);
                            zp1Var.C(i5, (iF >> 31) ^ (iF << 1));
                        }
                        break;
                    case 16:
                        if (gVar.n(length, obj)) {
                            long jG = s2e.g(iJ & 1048575, obj);
                            zp1Var.E(i5, (jG << 1) ^ (jG >> 63));
                        }
                        break;
                    case 17:
                        if (gVar.n(length, obj)) {
                            zg7Var.u0(i5, s2e.h(iJ & 1048575, obj), gVar.m(length));
                        }
                        break;
                    case 18:
                        i.o(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, false);
                        break;
                    case 19:
                        i.s(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, false);
                        break;
                    case 20:
                        i.v(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, false);
                        break;
                    case 21:
                        i.D(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, false);
                        break;
                    case 22:
                        i.u(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, false);
                        break;
                    case 23:
                        i.r(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, false);
                        break;
                    case 24:
                        i.q(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, false);
                        break;
                    case 25:
                        i.m(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, false);
                        break;
                    case 26:
                        i.B(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var);
                        break;
                    case 27:
                        i.w(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, gVar.m(length));
                        break;
                    case 28:
                        i.n(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var);
                        break;
                    case 29:
                        i.C(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, false);
                        break;
                    case 30:
                        i.p(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, false);
                        break;
                    case 31:
                        i.x(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, false);
                        break;
                    case 32:
                        i.y(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, false);
                        break;
                    case 33:
                        i.z(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, false);
                        break;
                    case 34:
                        i.A(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, false);
                        break;
                    case 35:
                        i.o(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, true);
                        break;
                    case 36:
                        i.s(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, true);
                        break;
                    case 37:
                        i.v(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, true);
                        break;
                    case 38:
                        i.D(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, true);
                        break;
                    case 39:
                        i.u(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, true);
                        break;
                    case 40:
                        i.r(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, true);
                        break;
                    case 41:
                        i.q(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, true);
                        break;
                    case 42:
                        i.m(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, true);
                        break;
                    case 43:
                        i.C(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, true);
                        break;
                    case 44:
                        i.p(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, true);
                        break;
                    case 45:
                        i.x(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, true);
                        break;
                    case 46:
                        i.y(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, true);
                        break;
                    case 47:
                        i.z(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, true);
                        break;
                    case 48:
                        i.A(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, true);
                        break;
                    case 49:
                        i.t(iArr2[length], (List) s2e.h(iJ & 1048575, obj), zg7Var, gVar.m(length));
                        break;
                    case 50:
                        gVar.K(zg7Var, i5, s2e.h(iJ & 1048575, obj), length);
                        break;
                    case 51:
                        if (gVar.q(i5, length, obj)) {
                            zp1Var.t(i5, Double.doubleToRawLongBits(((Double) s2e.h(iJ & 1048575, obj)).doubleValue()));
                        }
                        break;
                    case 52:
                        if (gVar.q(i5, length, obj)) {
                            zp1Var.r(i5, Float.floatToRawIntBits(((Float) s2e.h(iJ & 1048575, obj)).floatValue()));
                        }
                        break;
                    case 53:
                        if (gVar.q(i5, length, obj)) {
                            zp1Var.E(i5, z(iJ & 1048575, obj));
                        }
                        break;
                    case 54:
                        if (gVar.q(i5, length, obj)) {
                            zp1Var.E(i5, z(iJ & 1048575, obj));
                        }
                        break;
                    case 55:
                        if (gVar.q(i5, length, obj)) {
                            zp1Var.v(i5, y(iJ & 1048575, obj));
                        }
                        break;
                    case 56:
                        if (gVar.q(i5, length, obj)) {
                            zp1Var.t(i5, z(iJ & 1048575, obj));
                        }
                        break;
                    case 57:
                        if (gVar.q(i5, length, obj)) {
                            zp1Var.r(i5, y(iJ & 1048575, obj));
                        }
                        break;
                    case 58:
                        if (gVar.q(i5, length, obj)) {
                            zp1Var.o(i5, ((Boolean) s2e.h(iJ & 1048575, obj)).booleanValue());
                        }
                        break;
                    case 59:
                        if (gVar.q(i5, length, obj)) {
                            L(i5, s2e.h(iJ & 1048575, obj), zg7Var);
                        }
                        break;
                    case PanasonicMakernoteDirectory.TAG_PROGRAM_ISO /* 60 */:
                        if (gVar.q(i5, length, obj)) {
                            zp1Var.y(i5, (a) s2e.h(iJ & 1048575, obj), gVar.m(length));
                        }
                        break;
                    case 61:
                        if (gVar.q(i5, length, obj)) {
                            zg7Var.t0(i5, (d21) s2e.h(iJ & 1048575, obj));
                        }
                        break;
                    case 62:
                        if (gVar.q(i5, length, obj)) {
                            zp1Var.C(i5, y(iJ & 1048575, obj));
                        }
                        break;
                    case 63:
                        if (gVar.q(i5, length, obj)) {
                            zp1Var.v(i5, y(iJ & 1048575, obj));
                        }
                        break;
                    case 64:
                        if (gVar.q(i5, length, obj)) {
                            zp1Var.r(i5, y(iJ & 1048575, obj));
                        }
                        break;
                    case 65:
                        if (gVar.q(i5, length, obj)) {
                            zp1Var.t(i5, z(iJ & 1048575, obj));
                        }
                        break;
                    case 66:
                        if (gVar.q(i5, length, obj)) {
                            int iY = y(iJ & 1048575, obj);
                            zp1Var.C(i5, (iY >> 31) ^ (iY << 1));
                        }
                        break;
                    case 67:
                        if (gVar.q(i5, length, obj)) {
                            long jZ = z(iJ & 1048575, obj);
                            zp1Var.E(i5, (jZ << 1) ^ (jZ >> 63));
                        }
                        break;
                    case 68:
                        if (gVar.q(i5, length, obj)) {
                            zg7Var.u0(i5, s2e.h(iJ & 1048575, obj), gVar.m(length));
                        }
                        break;
                }
            }
            return;
        }
        int length2 = iArr2.length;
        int i6 = 1048575;
        int i7 = 0;
        int i8 = 0;
        while (i7 < length2) {
            int iJ2 = gVar.J(i7);
            int i9 = iArr2[i7];
            char c2 = c;
            int I = I(iJ2);
            boolean z2 = z;
            Unsafe unsafe = o;
            if (I <= 17) {
                int i10 = iArr2[i7 + 2];
                int i11 = i8;
                int i12 = i10 & 1048575;
                if (i12 != i6) {
                    if (i12 == 1048575) {
                        i = I;
                        iArr = iArr2;
                        i4 = 0;
                    } else {
                        i = I;
                        iArr = iArr2;
                        i4 = unsafe.getInt(obj, i12);
                    }
                    i8 = i4;
                    i6 = i12;
                } else {
                    i = I;
                    iArr = iArr2;
                    i8 = i11;
                }
                i2 = iJ2;
                i3 = (z2 ? 1 : 0) << (i10 >>> 20);
            } else {
                i = I;
                iArr = iArr2;
                i2 = iJ2;
                i3 = 0;
            }
            long j = i2 & 1048575;
            switch (i) {
                case 0:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zp1Var.t(i9, Double.doubleToRawLongBits(s2e.c.e(j, obj)));
                    }
                    break;
                case 1:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zp1Var.r(i9, Float.floatToRawIntBits(s2e.c.f(j, obj)));
                    }
                    break;
                case 2:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zp1Var.E(i9, unsafe.getLong(obj, j));
                    }
                    break;
                case 3:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zp1Var.E(i9, unsafe.getLong(obj, j));
                    }
                    break;
                case 4:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zp1Var.v(i9, unsafe.getInt(obj, j));
                    }
                    break;
                case 5:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zp1Var.t(i9, unsafe.getLong(obj, j));
                    }
                    break;
                case 6:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zp1Var.r(i9, unsafe.getInt(obj, j));
                    }
                    break;
                case 7:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zp1Var.o(i9, s2e.c.b(j, obj));
                    }
                    break;
                case 8:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        L(i9, unsafe.getObject(obj, j), zg7Var);
                    }
                    break;
                case 9:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zp1Var.y(i9, (a) unsafe.getObject(obj, j), gVar.m(i7));
                    }
                    break;
                case 10:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zg7Var.t0(i9, (d21) unsafe.getObject(obj, j));
                    }
                    break;
                case 11:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zp1Var.C(i9, unsafe.getInt(obj, j));
                    }
                    break;
                case 12:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zp1Var.v(i9, unsafe.getInt(obj, j));
                    }
                    break;
                case 13:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zp1Var.r(i9, unsafe.getInt(obj, j));
                    }
                    break;
                case 14:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zp1Var.t(i9, unsafe.getLong(obj, j));
                    }
                    break;
                case 15:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        int i13 = unsafe.getInt(obj, j);
                        zp1Var.C(i9, (i13 >> 31) ^ (i13 << 1));
                    }
                    break;
                case 16:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        long j2 = unsafe.getLong(obj, j);
                        z2 = true;
                        zp1Var.E(i9, (j2 << 1) ^ (j2 >> c2));
                    } else {
                        z2 = true;
                    }
                    break;
                case 17:
                    if (gVar.o(obj, i7, i6, i8, i3)) {
                        zg7Var.u0(i9, unsafe.getObject(obj, j), gVar.m(i7));
                    }
                    z2 = true;
                    break;
                case 18:
                    i.o(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, false);
                    z2 = true;
                    break;
                case 19:
                    i.s(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, false);
                    z2 = true;
                    break;
                case 20:
                    i.v(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, false);
                    z2 = true;
                    break;
                case 21:
                    i.D(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, false);
                    z2 = true;
                    break;
                case 22:
                    i.u(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, false);
                    z2 = true;
                    break;
                case 23:
                    i.r(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, false);
                    z2 = true;
                    break;
                case 24:
                    i.q(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, false);
                    z2 = true;
                    break;
                case 25:
                    i.m(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, false);
                    z2 = true;
                    break;
                case 26:
                    i.B(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var);
                    z2 = true;
                    break;
                case 27:
                    i.w(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, gVar.m(i7));
                    z2 = true;
                    break;
                case 28:
                    i.n(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var);
                    z2 = true;
                    break;
                case 29:
                    i.C(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, false);
                    z2 = true;
                    break;
                case 30:
                    i.p(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, false);
                    z2 = true;
                    break;
                case 31:
                    i.x(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, false);
                    z2 = true;
                    break;
                case 32:
                    i.y(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, false);
                    z2 = true;
                    break;
                case 33:
                    i.z(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, false);
                    z2 = true;
                    break;
                case 34:
                    i.A(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, false);
                    z2 = true;
                    break;
                case 35:
                    i.o(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, z2);
                    break;
                case 36:
                    i.s(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, z2);
                    break;
                case 37:
                    i.v(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, z2);
                    break;
                case 38:
                    i.D(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, z2);
                    break;
                case 39:
                    i.u(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, z2);
                    break;
                case 40:
                    i.r(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, z2);
                    break;
                case 41:
                    i.q(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, z2);
                    break;
                case 42:
                    i.m(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, z2);
                    break;
                case 43:
                    i.C(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, z2);
                    break;
                case 44:
                    i.p(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, z2);
                    break;
                case 45:
                    i.x(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, z2);
                    break;
                case 46:
                    i.y(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, z2);
                    break;
                case 47:
                    i.z(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, z2);
                    break;
                case 48:
                    i.A(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, z2);
                    break;
                case 49:
                    i.t(iArr[i7], (List) unsafe.getObject(obj, j), zg7Var, gVar.m(i7));
                    break;
                case 50:
                    gVar.K(zg7Var, i9, unsafe.getObject(obj, j), i7);
                    break;
                case 51:
                    if (gVar.q(i9, i7, obj)) {
                        zp1Var.t(i9, Double.doubleToRawLongBits(((Double) s2e.h(j, obj)).doubleValue()));
                    }
                    break;
                case 52:
                    if (gVar.q(i9, i7, obj)) {
                        zp1Var.r(i9, Float.floatToRawIntBits(((Float) s2e.h(j, obj)).floatValue()));
                    }
                    break;
                case 53:
                    if (gVar.q(i9, i7, obj)) {
                        zp1Var.E(i9, z(j, obj));
                    }
                    break;
                case 54:
                    if (gVar.q(i9, i7, obj)) {
                        zp1Var.E(i9, z(j, obj));
                    }
                    break;
                case 55:
                    if (gVar.q(i9, i7, obj)) {
                        zp1Var.v(i9, y(j, obj));
                    }
                    break;
                case 56:
                    if (gVar.q(i9, i7, obj)) {
                        zp1Var.t(i9, z(j, obj));
                    }
                    break;
                case 57:
                    if (gVar.q(i9, i7, obj)) {
                        zp1Var.r(i9, y(j, obj));
                    }
                    break;
                case 58:
                    if (gVar.q(i9, i7, obj)) {
                        zp1Var.o(i9, ((Boolean) s2e.h(j, obj)).booleanValue());
                    }
                    break;
                case 59:
                    if (gVar.q(i9, i7, obj)) {
                        L(i9, unsafe.getObject(obj, j), zg7Var);
                    }
                    break;
                case PanasonicMakernoteDirectory.TAG_PROGRAM_ISO /* 60 */:
                    if (gVar.q(i9, i7, obj)) {
                        zp1Var.y(i9, (a) unsafe.getObject(obj, j), gVar.m(i7));
                    }
                    break;
                case 61:
                    if (gVar.q(i9, i7, obj)) {
                        zg7Var.t0(i9, (d21) unsafe.getObject(obj, j));
                    }
                    break;
                case 62:
                    if (gVar.q(i9, i7, obj)) {
                        zp1Var.C(i9, y(j, obj));
                    }
                    break;
                case 63:
                    if (gVar.q(i9, i7, obj)) {
                        zp1Var.v(i9, y(j, obj));
                    }
                    break;
                case 64:
                    if (gVar.q(i9, i7, obj)) {
                        zp1Var.r(i9, y(j, obj));
                    }
                    break;
                case 65:
                    if (gVar.q(i9, i7, obj)) {
                        zp1Var.t(i9, z(j, obj));
                    }
                    break;
                case 66:
                    if (gVar.q(i9, i7, obj)) {
                        int iY2 = y(j, obj);
                        zp1Var.C(i9, (iY2 >> 31) ^ (iY2 << 1));
                    }
                    break;
                case 67:
                    if (gVar.q(i9, i7, obj)) {
                        long jZ2 = z(j, obj);
                        zp1Var.E(i9, (jZ2 >> c2) ^ (jZ2 << (z2 ? 1L : 0L)));
                    }
                    break;
                case 68:
                    if (gVar.q(i9, i7, obj)) {
                        zg7Var.u0(i9, unsafe.getObject(obj, j), gVar.m(i7));
                    }
                    break;
            }
            i7 += 3;
            gVar = this;
            c = c2;
            z = z2;
            iArr2 = iArr;
        }
        ((l) jVar).getClass();
        ((e) obj).unknownFields.d(zg7Var);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:129:0x0312  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x0321  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x0331  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x0346  */
    /* JADX WARN: Removed duplicated region for block: B:137:0x035a  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x0366  */
    /* JADX WARN: Removed duplicated region for block: B:141:0x0372  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x0381  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x039d  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x03b7  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x03c8  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x03d6  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x03e1  */
    /* JADX WARN: Removed duplicated region for block: B:155:0x03ea  */
    /* JADX WARN: Removed duplicated region for block: B:156:0x03f4  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x0403  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x0411  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x041f  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x0429  */
    /* JADX WARN: Removed duplicated region for block: B:216:0x062a A[PHI: r9 r20 r21
      0x062a: PHI (r9v26 int) = (r9v9 int), (r9v10 int), (r9v11 int), (r9v15 int), (r9v17 int), (r9v18 int), (r9v19 int), (r9v23 int), (r9v27 int) binds: [B:275:0x07f5, B:271:0x07d6, B:267:0x07b7, B:250:0x0734, B:236:0x06c6, B:232:0x06a8, B:228:0x068b, B:221:0x064b, B:215:0x0628] A[DONT_GENERATE, DONT_INLINE]
      0x062a: PHI (r20v35 int) = 
      (r20v21 int)
      (r20v22 int)
      (r20v23 int)
      (r20v27 int)
      (r20v29 int)
      (r20v30 int)
      (r20v31 int)
      (r20v34 int)
      (r20v36 int)
     binds: [B:275:0x07f5, B:271:0x07d6, B:267:0x07b7, B:250:0x0734, B:236:0x06c6, B:232:0x06a8, B:228:0x068b, B:221:0x064b, B:215:0x0628] A[DONT_GENERATE, DONT_INLINE]
      0x062a: PHI (r21v18 int) = 
      (r21v2 int)
      (r21v3 int)
      (r21v4 int)
      (r21v8 int)
      (r21v10 int)
      (r21v11 int)
      (r21v12 int)
      (r21v15 int)
      (r21v19 int)
     binds: [B:275:0x07f5, B:271:0x07d6, B:267:0x07b7, B:250:0x0734, B:236:0x06c6, B:232:0x06a8, B:228:0x068b, B:221:0x064b, B:215:0x0628] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:352:0x031d A[SYNTHETIC] */
    /*  JADX ERROR: UnsupportedOperationException in pass: RegionMakerVisitor
        java.lang.UnsupportedOperationException
        	at java.base/java.util.Collections$UnmodifiableCollection.add(Collections.java:1095)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker$1.leaveRegion(SwitchRegionMaker.java:390)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:70)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverse(DepthRegionTraversal.java:23)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.insertBreaksForCase(SwitchRegionMaker.java:370)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.insertBreaks(SwitchRegionMaker.java:85)
        	at jadx.core.dex.visitors.regions.PostProcessRegions.leaveRegion(PostProcessRegions.java:33)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:70)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverse(DepthRegionTraversal.java:19)
        	at jadx.core.dex.visitors.regions.PostProcessRegions.process(PostProcessRegions.java:23)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:31)
        */
    @Override // defpackage.crb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int g(androidx.datastore.preferences.protobuf.e r29) {
        /*
            Method dump skipped, instruction units count: 2746
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.datastore.preferences.protobuf.g.g(androidx.datastore.preferences.protobuf.e):int");
    }

    /* JADX WARN: Removed duplicated region for block: B:42:0x00d7 A[PHI: r3
      0x00d7: PHI (r3v32 int) = (r3v10 int), (r3v33 int) binds: [B:83:0x01f0, B:41:0x00d5] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // defpackage.crb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int h(androidx.datastore.preferences.protobuf.e r12) {
        /*
            Method dump skipped, instruction units count: 748
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.datastore.preferences.protobuf.g.h(androidx.datastore.preferences.protobuf.e):int");
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x003b  */
    @Override // defpackage.crb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean i(androidx.datastore.preferences.protobuf.e r12, androidx.datastore.preferences.protobuf.e r13) {
        /*
            Method dump skipped, instruction units count: 630
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.datastore.preferences.protobuf.g.i(androidx.datastore.preferences.protobuf.e, androidx.datastore.preferences.protobuf.e):boolean");
    }

    public final boolean j(e eVar, e eVar2, int i) {
        return n(i, eVar) == n(i, eVar2);
    }

    public final void k(Object obj, int i, Object obj2) {
        int i2 = this.a[i];
        if (s2e.h(J(i) & 1048575, obj) == null) {
            return;
        }
        l(i);
    }

    public final void l(int i) {
        if (this.b[((i / 3) * 2) + 1] == null) {
            return;
        }
        rd6.m();
    }

    public final crb m(int i) {
        int i2 = (i / 3) * 2;
        Object[] objArr = this.b;
        crb crbVar = (crb) objArr[i2];
        if (crbVar != null) {
            return crbVar;
        }
        crb crbVarA = u7a.c.a((Class) objArr[i2 + 1]);
        objArr[i2] = crbVarA;
        return crbVarA;
    }

    /* JADX WARN: Removed duplicated region for block: B:69:0x00f0 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00f1 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean n(int r8, java.lang.Object r9) {
        /*
            Method dump skipped, instruction units count: 282
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.datastore.preferences.protobuf.g.n(int, java.lang.Object):boolean");
    }

    public final boolean o(Object obj, int i, int i2, int i3, int i4) {
        return i2 == 1048575 ? n(i, obj) : (i3 & i4) != 0;
    }

    public final boolean q(int i, int i2, Object obj) {
        return s2e.f((long) (this.a[i2 + 2] & 1048575), obj) == i;
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x009b, code lost:
    
        r9.put(r2, r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x009e, code lost:
    
        r10.h(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00a1, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void r(java.lang.Object r8, int r9, java.lang.Object r10, defpackage.r74 r11, androidx.datastore.preferences.protobuf.d r12) throws androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.InvalidWireTypeException {
        /*
            r7 = this;
            int r9 = r7.J(r9)
            r0 = 1048575(0xfffff, float:1.469367E-39)
            r9 = r9 & r0
            long r0 = (long) r9
            java.lang.Object r9 = defpackage.s2e.h(r0, r8)
            oh7 r7 = r7.m
            if (r9 != 0) goto L1e
            r7.getClass()
            mh7 r9 = defpackage.mh7.b
            mh7 r9 = r9.b()
            defpackage.s2e.o(r0, r8, r9)
            goto L35
        L1e:
            r7.getClass()
            r2 = r9
            mh7 r2 = (defpackage.mh7) r2
            boolean r2 = r2.a
            if (r2 != 0) goto L35
            mh7 r2 = defpackage.mh7.b
            mh7 r2 = r2.b()
            defpackage.oh7.a(r2, r9)
            defpackage.s2e.o(r0, r8, r2)
            r9 = r2
        L35:
            r7.getClass()
            mh7 r9 = (defpackage.mh7) r9
            kh7 r10 = (defpackage.kh7) r10
            ku3 r7 = r10.a
            r8 = 2
            r12.w(r8)
            up1 r10 = r12.a
            int r0 = r10.z()
            int r0 = r10.i(r0)
            java.lang.Object r1 = r7.d
            java.lang.String r2 = ""
            r3 = r1
        L51:
            int r4 = r12.a()     // Catch: java.lang.Throwable -> L75
            r5 = 2147483647(0x7fffffff, float:NaN)
            if (r4 == r5) goto L9b
            boolean r5 = r10.c()     // Catch: java.lang.Throwable -> L75
            if (r5 == 0) goto L61
            goto L9b
        L61:
            r5 = 1
            java.lang.String r6 = "Unable to parse map entry."
            if (r4 == r5) goto L84
            if (r4 == r8) goto L77
            boolean r4 = r12.x()     // Catch: java.lang.Throwable -> L75 androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.InvalidWireTypeException -> L8e
            if (r4 == 0) goto L6f
            goto L51
        L6f:
            androidx.datastore.preferences.protobuf.InvalidProtocolBufferException r4 = new androidx.datastore.preferences.protobuf.InvalidProtocolBufferException     // Catch: java.lang.Throwable -> L75 androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.InvalidWireTypeException -> L8e
            r4.<init>(r6)     // Catch: java.lang.Throwable -> L75 androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.InvalidWireTypeException -> L8e
            throw r4     // Catch: java.lang.Throwable -> L75 androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.InvalidWireTypeException -> L8e
        L75:
            r7 = move-exception
            goto La2
        L77:
            java.lang.Object r4 = r7.c     // Catch: java.lang.Throwable -> L75 androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.InvalidWireTypeException -> L8e
            l6f r4 = (defpackage.l6f) r4     // Catch: java.lang.Throwable -> L75 androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.InvalidWireTypeException -> L8e
            java.lang.Class r5 = r1.getClass()     // Catch: java.lang.Throwable -> L75 androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.InvalidWireTypeException -> L8e
            java.lang.Object r3 = r12.i(r4, r5, r11)     // Catch: java.lang.Throwable -> L75 androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.InvalidWireTypeException -> L8e
            goto L51
        L84:
            java.lang.Object r4 = r7.b     // Catch: java.lang.Throwable -> L75 androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.InvalidWireTypeException -> L8e
            l6f r4 = (defpackage.l6f) r4     // Catch: java.lang.Throwable -> L75 androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.InvalidWireTypeException -> L8e
            r5 = 0
            java.lang.Object r2 = r12.i(r4, r5, r5)     // Catch: java.lang.Throwable -> L75 androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.InvalidWireTypeException -> L8e
            goto L51
        L8e:
            boolean r4 = r12.x()     // Catch: java.lang.Throwable -> L75
            if (r4 == 0) goto L95
            goto L51
        L95:
            androidx.datastore.preferences.protobuf.InvalidProtocolBufferException r7 = new androidx.datastore.preferences.protobuf.InvalidProtocolBufferException     // Catch: java.lang.Throwable -> L75
            r7.<init>(r6)     // Catch: java.lang.Throwable -> L75
            throw r7     // Catch: java.lang.Throwable -> L75
        L9b:
            r9.put(r2, r3)     // Catch: java.lang.Throwable -> L75
            r10.h(r0)
            return
        La2:
            r10.h(r0)
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.datastore.preferences.protobuf.g.r(java.lang.Object, int, java.lang.Object, r74, androidx.datastore.preferences.protobuf.d):void");
    }

    public final void s(Object obj, int i, Object obj2) {
        if (n(i, obj2)) {
            long J = J(i) & 1048575;
            Unsafe unsafe = o;
            Object object = unsafe.getObject(obj2, J);
            if (object == null) {
                rd6.d(this.a[i], obj2);
                return;
            }
            crb crbVarM = m(i);
            if (!n(i, obj)) {
                if (p(object)) {
                    e eVarD = crbVarM.d();
                    crbVarM.a(eVarD, object);
                    unsafe.putObject(obj, J, eVarD);
                } else {
                    unsafe.putObject(obj, J, object);
                }
                G(i, obj);
                return;
            }
            Object object2 = unsafe.getObject(obj, J);
            if (!p(object2)) {
                e eVarD2 = crbVarM.d();
                crbVarM.a(eVarD2, object2);
                unsafe.putObject(obj, J, eVarD2);
                object2 = eVarD2;
            }
            crbVarM.a(object2, object);
        }
    }

    public final void t(Object obj, int i, Object obj2) {
        int[] iArr = this.a;
        int i2 = iArr[i];
        if (q(i2, i, obj2)) {
            long J = J(i) & 1048575;
            Unsafe unsafe = o;
            Object object = unsafe.getObject(obj2, J);
            if (object == null) {
                rd6.d(iArr[i], obj2);
                return;
            }
            crb crbVarM = m(i);
            if (!q(i2, i, obj)) {
                if (p(object)) {
                    e eVarD = crbVarM.d();
                    crbVarM.a(eVarD, object);
                    unsafe.putObject(obj, J, eVarD);
                } else {
                    unsafe.putObject(obj, J, object);
                }
                H(i2, i, obj);
                return;
            }
            Object object2 = unsafe.getObject(obj, J);
            if (!p(object2)) {
                e eVarD2 = crbVarM.d();
                crbVarM.a(eVarD2, object2);
                unsafe.putObject(obj, J, eVarD2);
                object2 = eVarD2;
            }
            crbVarM.a(object2, object);
        }
    }

    public final Object u(int i, Object obj) {
        crb crbVarM = m(i);
        long J = J(i) & 1048575;
        if (!n(i, obj)) {
            return crbVarM.d();
        }
        Object object = o.getObject(obj, J);
        if (p(object)) {
            return object;
        }
        e eVarD = crbVarM.d();
        if (object != null) {
            crbVarM.a(eVarD, object);
        }
        return eVarD;
    }

    public final Object v(int i, int i2, Object obj) {
        crb crbVarM = m(i2);
        if (!q(i, i2, obj)) {
            return crbVarM.d();
        }
        Object object = o.getObject(obj, J(i2) & 1048575);
        if (p(object)) {
            return object;
        }
        e eVarD = crbVarM.d();
        if (object != null) {
            crbVarM.a(eVarD, object);
        }
        return eVarD;
    }
}
