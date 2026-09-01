package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class txb implements jyb, Iterable, th6 {
    public final f78 a;
    public yh7 b;
    public boolean c;
    public boolean d;

    public txb() {
        long[] jArr = hqb.a;
        this.a = new f78();
    }

    @Override // defpackage.jyb
    public final void d(iyb iybVar, Object obj) {
        boolean z = obj instanceof i4;
        f78 f78Var = this.a;
        if (z && f78Var.c(iybVar)) {
            Object objG = f78Var.g(iybVar);
            objG.getClass();
            i4 i4Var = (i4) objG;
            i4 i4Var2 = (i4) obj;
            String str = i4Var2.a;
            if (str == null) {
                str = i4Var.a;
            }
            j55 j55Var = i4Var2.b;
            if (j55Var == null) {
                j55Var = i4Var.b;
            }
            f78Var.m(iybVar, new i4(str, j55Var));
        } else {
            f78Var.m(iybVar, obj);
        }
        iybVar.getClass();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof txb)) {
            return false;
        }
        txb txbVar = (txb) obj;
        return this.a.equals(txbVar.a) && this.c == txbVar.c && this.d == txbVar.d;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0053  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.txb f() {
        /*
            r15 = this;
            txb r0 = new txb
            r0.<init>()
            boolean r1 = r15.c
            r0.c = r1
            boolean r1 = r15.d
            r0.d = r1
            f78 r15 = r15.a
            java.lang.Object[] r1 = r15.b
            java.lang.Object[] r2 = r15.c
            long[] r15 = r15.a
            int r3 = r15.length
            int r3 = r3 + (-2)
            if (r3 < 0) goto L58
            r4 = 0
            r5 = r4
        L1c:
            r6 = r15[r5]
            long r8 = ~r6
            r10 = 7
            long r8 = r8 << r10
            long r8 = r8 & r6
            r10 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r8 = r8 & r10
            int r8 = (r8 > r10 ? 1 : (r8 == r10 ? 0 : -1))
            if (r8 == 0) goto L53
            int r8 = r5 - r3
            int r8 = ~r8
            int r8 = r8 >>> 31
            r9 = 8
            int r8 = 8 - r8
            r10 = r4
        L36:
            if (r10 >= r8) goto L51
            r11 = 255(0xff, double:1.26E-321)
            long r11 = r11 & r6
            r13 = 128(0x80, double:6.3E-322)
            int r11 = (r11 > r13 ? 1 : (r11 == r13 ? 0 : -1))
            if (r11 >= 0) goto L4d
            int r11 = r5 << 3
            int r11 = r11 + r10
            r12 = r1[r11]
            r11 = r2[r11]
            f78 r13 = r0.a
            r13.m(r12, r11)
        L4d:
            long r6 = r6 >> r9
            int r10 = r10 + 1
            goto L36
        L51:
            if (r8 != r9) goto L58
        L53:
            if (r5 == r3) goto L58
            int r5 = r5 + 1
            goto L1c
        L58:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.txb.f():txb");
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        yh7 yh7Var = this.b;
        if (yh7Var == null) {
            yh7Var = new yh7(this.a);
            this.b = yh7Var;
        }
        return ((f04) yh7Var.entrySet()).iterator();
    }

    public final Object m(iyb iybVar) {
        Object objG = this.a.g(iybVar);
        if (objG != null) {
            return objG;
        }
        rd6.w("Key not present: ", iybVar, " - consider getOrElse or getOrNull");
        return null;
    }

    public final void p(txb txbVar) {
        f78 f78Var = txbVar.a;
        Object[] objArr = f78Var.b;
        Object[] objArr2 = f78Var.c;
        long[] jArr = f78Var.a;
        int length = jArr.length - 2;
        if (length < 0) {
            return;
        }
        int i = 0;
        while (true) {
            long j = jArr[i];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i2 = 8 - ((~(i - length)) >>> 31);
                for (int i3 = 0; i3 < i2; i3++) {
                    if ((255 & j) < 128) {
                        int i4 = (i << 3) + i3;
                        Object obj = objArr[i4];
                        Object obj2 = objArr2[i4];
                        iyb iybVar = (iyb) obj;
                        f78 f78Var2 = this.a;
                        Object objG = f78Var2.g(iybVar);
                        iybVar.getClass();
                        Object objInvoke = iybVar.b.invoke(objG, obj2);
                        if (objInvoke != null) {
                            f78Var2.m(iybVar, objInvoke);
                        }
                    }
                    j >>= 8;
                }
                if (i2 != 8) {
                    return;
                }
            }
            if (i == length) {
                return;
            } else {
                i++;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0078 A[PHI: r2
      0x0078: PHI (r2v6 java.lang.String) = (r2v5 java.lang.String), (r2v7 java.lang.String) binds: [B:13:0x003f, B:20:0x0076] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String toString() {
        /*
            r19 = this;
            r0 = r19
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            boolean r2 = r0.c
            java.lang.String r3 = ", "
            if (r2 == 0) goto L14
            java.lang.String r2 = "mergeDescendants=true"
            r1.append(r2)
            r2 = r3
            goto L16
        L14:
            java.lang.String r2 = ""
        L16:
            boolean r4 = r0.d
            if (r4 == 0) goto L23
            r1.append(r2)
            java.lang.String r2 = "isClearingSemantics=true"
            r1.append(r2)
            r2 = r3
        L23:
            f78 r4 = r0.a
            java.lang.Object[] r5 = r4.b
            java.lang.Object[] r6 = r4.c
            long[] r4 = r4.a
            int r7 = r4.length
            int r7 = r7 + (-2)
            if (r7 < 0) goto L7d
            r9 = 0
        L31:
            r10 = r4[r9]
            long r12 = ~r10
            r14 = 7
            long r12 = r12 << r14
            long r12 = r12 & r10
            r14 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r12 = r12 & r14
            int r12 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1))
            if (r12 == 0) goto L78
            int r12 = r9 - r7
            int r12 = ~r12
            int r12 = r12 >>> 31
            r13 = 8
            int r12 = 8 - r12
            r14 = 0
        L4b:
            if (r14 >= r12) goto L76
            r15 = 255(0xff, double:1.26E-321)
            long r15 = r15 & r10
            r17 = 128(0x80, double:6.3E-322)
            int r15 = (r15 > r17 ? 1 : (r15 == r17 ? 0 : -1))
            if (r15 >= 0) goto L72
            int r15 = r9 << 3
            int r15 = r15 + r14
            r16 = r5[r15]
            r15 = r6[r15]
            r8 = r16
            iyb r8 = (defpackage.iyb) r8
            r1.append(r2)
            java.lang.String r2 = r8.a
            r1.append(r2)
            java.lang.String r2 = " : "
            r1.append(r2)
            r1.append(r15)
            r2 = r3
        L72:
            long r10 = r10 >> r13
            int r14 = r14 + 1
            goto L4b
        L76:
            if (r12 != r13) goto L7d
        L78:
            if (r9 == r7) goto L7d
            int r9 = r9 + 1
            goto L31
        L7d:
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            java.lang.String r0 = defpackage.rx0.W(r0)
            r2.<init>(r0)
            java.lang.String r0 = "{ "
            r2.append(r0)
            r2.append(r1)
            java.lang.String r0 = " }"
            r2.append(r0)
            java.lang.String r0 = r2.toString()
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.txb.toString():java.lang.String");
    }
}
