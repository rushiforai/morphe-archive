package defpackage;

import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class or4 implements lr4 {
    public final mn a;
    public final mn b;
    public final jr4 d;
    public q68 f;
    public es4 h;
    public final es4 c = new es4(2, null, 14);
    public final nr4 e = new nr4(this);
    public final x68 g = new x68(1);

    public or4(mn mnVar, mn mnVar2) {
        this.a = mnVar;
        this.b = mnVar2;
        this.d = new jr4(this, mnVar2);
    }

    public final boolean a(boolean z) {
        hj0 hj0Var;
        if (f() != null) {
            es4 es4VarF = f();
            i(null);
            if (es4VarF != null) {
                es4VarF.J0(zr4.Active, zr4.Inactive);
                if (!es4VarF.a.n) {
                    b26.b("visitAncestors called on an unattached node");
                }
                q28 q28Var = es4VarF.a.e;
                aq6 aq6VarV0 = flb.v0(es4VarF);
                while (aq6VarV0 != null) {
                    if ((((q28) aq6VarV0.F.g).d & 1024) != 0) {
                        while (q28Var != null) {
                            if ((q28Var.c & 1024) != 0) {
                                q28 q28VarQ0 = q28Var;
                                o78 o78Var = null;
                                while (q28VarQ0 != null) {
                                    if (q28VarQ0 instanceof es4) {
                                        ((es4) q28VarQ0).J0(zr4.ActiveParent, zr4.Inactive);
                                    } else if ((q28VarQ0.c & 1024) != 0 && (q28VarQ0 instanceof b43)) {
                                        int i = 0;
                                        for (q28 q28Var2 = ((b43) q28VarQ0).p; q28Var2 != null; q28Var2 = q28Var2.f) {
                                            if ((q28Var2.c & 1024) != 0) {
                                                i++;
                                                if (i == 1) {
                                                    q28VarQ0 = q28Var2;
                                                } else {
                                                    if (o78Var == null) {
                                                        o78Var = new o78(new q28[16]);
                                                    }
                                                    if (q28VarQ0 != null) {
                                                        o78Var.b(q28VarQ0);
                                                        q28VarQ0 = null;
                                                    }
                                                    o78Var.b(q28Var2);
                                                }
                                            }
                                        }
                                        if (i == 1) {
                                        }
                                    }
                                    q28VarQ0 = flb.q0(o78Var);
                                }
                            }
                            q28Var = q28Var.e;
                        }
                    }
                    aq6VarV0 = aq6VarV0.v();
                    q28Var = (aq6VarV0 == null || (hj0Var = aq6VarV0.F) == null) ? null : (ffd) hj0Var.f;
                }
            }
        }
        return true;
    }

    public final boolean b(int i, boolean z, boolean z2) {
        boolean z3 = true;
        if (z) {
            a(z);
        } else {
            int i2 = mr4.a[k50.d0(this.c, i).ordinal()];
            if (i2 == 1 || i2 == 2 || i2 == 3) {
                z3 = false;
            } else {
                if (i2 != 4) {
                    ygf.a();
                    return false;
                }
                a(z);
            }
        }
        if (z3 && z2) {
            c();
        }
        return z3;
    }

    public final void c() {
        mn mnVar = this.a;
        if (mnVar.isFocused() || mnVar.hasFocus()) {
            mnVar.clearFocus();
        } else if (mnVar.hasFocus()) {
            View viewFindFocus = mnVar.findFocus();
            if (viewFindFocus != null) {
                viewFindFocus.clearFocus();
            }
            mnVar.clearFocus();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x00e3 A[Catch: all -> 0x02ee, TryCatch #0 {all -> 0x02ee, blocks: (B:3:0x0007, B:5:0x000e, B:8:0x0019, B:12:0x0023, B:15:0x002f, B:17:0x0035, B:18:0x003a, B:20:0x0042, B:22:0x0047, B:24:0x004d, B:28:0x0053, B:126:0x016f, B:128:0x0175, B:129:0x0178, B:131:0x0183, B:134:0x0191, B:138:0x019b, B:141:0x01a1, B:142:0x01a6, B:145:0x01ae, B:147:0x01b4, B:149:0x01b8, B:151:0x01c0, B:153:0x01c6, B:157:0x01ce, B:159:0x01d7, B:160:0x01db, B:161:0x01de, B:164:0x01e4, B:165:0x01e9, B:166:0x01ec, B:168:0x01f2, B:170:0x01f6, B:173:0x01ff, B:175:0x0207, B:182:0x021e, B:184:0x0223, B:186:0x0227, B:209:0x0269, B:190:0x0233, B:192:0x0239, B:194:0x023d, B:196:0x0245, B:198:0x024b, B:202:0x0253, B:204:0x025c, B:205:0x0260, B:206:0x0263, B:210:0x026e, B:214:0x027e, B:216:0x0283, B:218:0x0287, B:241:0x02c9, B:222:0x0293, B:224:0x0299, B:226:0x029d, B:228:0x02a5, B:230:0x02ab, B:234:0x02b3, B:236:0x02bc, B:237:0x02c0, B:238:0x02c3, B:243:0x02d0, B:245:0x02d7, B:32:0x005b, B:34:0x0061, B:35:0x0064, B:37:0x006c, B:40:0x007a, B:44:0x0084, B:75:0x00d9, B:77:0x00dd, B:47:0x0089, B:49:0x008f, B:51:0x0093, B:53:0x009b, B:55:0x00a1, B:59:0x00a9, B:61:0x00b2, B:62:0x00b6, B:63:0x00b9, B:66:0x00bf, B:67:0x00c4, B:68:0x00c7, B:70:0x00cd, B:72:0x00d1, B:78:0x00e3, B:80:0x00e9, B:81:0x00ec, B:83:0x00f6, B:86:0x0104, B:90:0x010e, B:121:0x0163, B:123:0x0167, B:93:0x0113, B:95:0x0119, B:97:0x011d, B:99:0x0125, B:101:0x012b, B:105:0x0133, B:107:0x013c, B:108:0x0140, B:109:0x0143, B:112:0x0149, B:113:0x014e, B:114:0x0151, B:116:0x0157, B:118:0x015b), top: B:255:0x0007 }] */
    /* JADX WARN: Type inference failed for: r0v15 */
    /* JADX WARN: Type inference failed for: r0v20, types: [o78] */
    /* JADX WARN: Type inference failed for: r0v21 */
    /* JADX WARN: Type inference failed for: r0v22 */
    /* JADX WARN: Type inference failed for: r0v23 */
    /* JADX WARN: Type inference failed for: r0v24, types: [o78] */
    /* JADX WARN: Type inference failed for: r0v28 */
    /* JADX WARN: Type inference failed for: r0v29 */
    /* JADX WARN: Type inference failed for: r0v30 */
    /* JADX WARN: Type inference failed for: r0v31 */
    /* JADX WARN: Type inference failed for: r0v6 */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r12v24, types: [q28] */
    /* JADX WARN: Type inference failed for: r12v25, types: [q28] */
    /* JADX WARN: Type inference failed for: r12v29, types: [q28] */
    /* JADX WARN: Type inference failed for: r12v30, types: [q28] */
    /* JADX WARN: Type inference failed for: r12v34, types: [q28] */
    /* JADX WARN: Type inference failed for: r12v35 */
    /* JADX WARN: Type inference failed for: r12v36, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r12v37 */
    /* JADX WARN: Type inference failed for: r12v38 */
    /* JADX WARN: Type inference failed for: r12v39 */
    /* JADX WARN: Type inference failed for: r12v40 */
    /* JADX WARN: Type inference failed for: r12v43, types: [q28] */
    /* JADX WARN: Type inference failed for: r12v44 */
    /* JADX WARN: Type inference failed for: r12v45, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r12v46 */
    /* JADX WARN: Type inference failed for: r12v47 */
    /* JADX WARN: Type inference failed for: r12v48 */
    /* JADX WARN: Type inference failed for: r12v49 */
    /* JADX WARN: Type inference failed for: r12v64 */
    /* JADX WARN: Type inference failed for: r12v65 */
    /* JADX WARN: Type inference failed for: r12v66 */
    /* JADX WARN: Type inference failed for: r12v67 */
    /* JADX WARN: Type inference failed for: r14v1 */
    /* JADX WARN: Type inference failed for: r14v10, types: [o78] */
    /* JADX WARN: Type inference failed for: r14v12 */
    /* JADX WARN: Type inference failed for: r14v13 */
    /* JADX WARN: Type inference failed for: r14v14 */
    /* JADX WARN: Type inference failed for: r14v15 */
    /* JADX WARN: Type inference failed for: r14v2 */
    /* JADX WARN: Type inference failed for: r14v6, types: [o78] */
    /* JADX WARN: Type inference failed for: r14v7 */
    /* JADX WARN: Type inference failed for: r14v8 */
    /* JADX WARN: Type inference failed for: r14v9 */
    /* JADX WARN: Type inference failed for: r6v39 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean d(android.view.KeyEvent r13, defpackage.m45 r14) {
        /*
            Method dump skipped, instruction units count: 755
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.or4.d(android.view.KeyEvent, m45):boolean");
    }

    /* JADX WARN: Code restructure failed: missing block: B:231:0x0127, code lost:
    
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Boolean e(int r21, defpackage.zwa r22, defpackage.x45 r23) {
        /*
            Method dump skipped, instruction units count: 735
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.or4.e(int, zwa, x45):java.lang.Boolean");
    }

    public final es4 f() {
        es4 es4Var = this.h;
        if (es4Var == null || !es4Var.n) {
            return null;
        }
        return es4Var;
    }

    public final boolean g(int i, boolean z) {
        es4 es4VarF = f();
        mn mnVar = this.a;
        if (es4VarF == null || !es4VarF.o || !mnVar.x(i)) {
            rya ryaVar = new rya();
            ryaVar.a = Boolean.FALSE;
            es4 es4VarF2 = f();
            Boolean boolE = e(i, mnVar.getEmbeddedViewFocusRect(), new rb7(i, 2, ryaVar));
            if (!g76.L(boolE, Boolean.TRUE) || es4VarF2 == f()) {
                if (boolE != null && ryaVar.a != null) {
                    if (!boolE.booleanValue() || !((Boolean) ryaVar.a).booleanValue()) {
                        if ((i == 1 || i == 2) && z && b(i, false, false)) {
                            Boolean boolE2 = e(i, null, new in(i, 3));
                            if (boolE2 != null ? boolE2.booleanValue() : false) {
                            }
                        }
                    }
                }
                return false;
            }
        }
        return true;
    }

    public final boolean h(int i) {
        if (!b(i, false, false)) {
            return false;
        }
        Boolean boolE = e(i, null, new in(i, 2));
        boolean zBooleanValue = boolE != null ? boolE.booleanValue() : false;
        if (!zBooleanValue) {
            c();
        }
        return zBooleanValue;
    }

    public final void i(es4 es4Var) {
        es4 es4Var2 = this.h;
        this.h = es4Var;
        x68 x68Var = this.g;
        Object[] objArr = x68Var.a;
        int i = x68Var.b;
        for (int i2 = 0; i2 < i; i2++) {
            ((kr4) objArr[i2]).a(es4Var2, es4Var);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x009f, code lost:
    
        r30 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x00a9, code lost:
    
        if (((r10 & ((~r10) << 6)) & (-9187201950435737472L)) == 0) goto L61;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x00ab, code lost:
    
        r0 = r4.b(r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x00b1, code lost:
    
        if (r4.e != 0) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x00c2, code lost:
    
        if (((r4.a[r0 >> 3] >> ((r0 & 7) << 3)) & 255) != 254) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x00c4, code lost:
    
        r38 = 1;
        r36 = r12;
        r40 = 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x00cc, code lost:
    
        r0 = r4.c;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x00ce, code lost:
    
        if (r0 <= r5) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x00d0, code lost:
    
        r11 = r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x00e7, code lost:
    
        if (java.lang.Long.compare((((long) r4.d) * 32) ^ Long.MIN_VALUE, (((long) r0) * 25) ^ Long.MIN_VALUE) > 0) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x00e9, code lost:
    
        r0 = r4.a;
        r3 = r4.c;
        r5 = r4.b;
        r6 = (r3 + 7) >> 3;
        r14 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x00f5, code lost:
    
        if (r14 >= r6) goto L92;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00f7, code lost:
    
        r9 = r0[r14] & (-9187201950435737472L);
        r0[r14] = (-72340172838076674L) & ((~r9) + (r9 >>> 7));
        r14 = r14 + 1;
        r11 = r11;
        r12 = r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0112, code lost:
    
        r36 = r12;
        r40 = 128;
        r13 = r11;
        r6 = defpackage.k80.w0(r0);
        r9 = r6 - 1;
        r14 = 72057594037927935L;
        r0[r9] = (r0[r9] & 72057594037927935L) | (-72057594037927936L);
        r0[r6] = r0[0];
        r6 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0131, code lost:
    
        if (r6 == r3) goto L94;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0133, code lost:
    
        r9 = r6 >> 3;
        r12 = (r6 & 7) << 3;
        r10 = (r0[r9] >> r12) & 255;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x0140, code lost:
    
        if (r10 != 128) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0142, code lost:
    
        r6 = r6 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0147, code lost:
    
        if (r10 == 254) goto L93;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x014a, code lost:
    
        r10 = r5[r6];
        r10 = ((int) (r10 ^ (r10 >>> r30))) * r31;
        r10 = r10 ^ (r10 << 16);
        r11 = r10 >>> 7;
        r23 = r4.b(r11);
        r11 = r11 & r3;
        r29 = r13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x016a, code lost:
    
        if ((((r23 - r11) & r3) / 8) != (((r6 - r11) & r3) / 8)) goto L97;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x016c, code lost:
    
        r32 = r14;
        r0[r9] = (((long) (r10 & 127)) << r12) | (r0[r9] & (~(255 << r12)));
        r0[r0.length - r7] = (r0[0] & r32) | Long.MIN_VALUE;
        r6 = r6 + 1;
        r13 = r29;
        r14 = r32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x018d, code lost:
    
        r32 = r14;
        r11 = r23 >> 3;
        r13 = r0[r11];
        r15 = (r23 & 7) << 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x019d, code lost:
    
        if (((r13 >> r15) & 255) != 128) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x019f, code lost:
    
        r38 = r7;
        r39 = r8;
        r24 = r5;
        r25 = r6;
        r0[r11] = ((~(255 << r15)) & r13) | (((long) (r10 & 127)) << r15);
        r0[r9] = (r0[r9] & (~(255 << r12))) | (128 << r12);
        r24[r23] = r24[r25];
        r24[r25] = 0;
        r6 = r25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x01c6, code lost:
    
        r24 = r5;
        r25 = r6;
        r38 = r7;
        r39 = r8;
        r0[r11] = (((long) (r10 & 127)) << r15) | ((~(255 << r15)) & r13);
        r5 = r24[r23];
        r24[r23] = r24[r25];
        r24[r25] = r5;
        r6 = r25 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x01e3, code lost:
    
        r0[r0.length - 1] = (r0[0] & r32) | Long.MIN_VALUE;
        r6 = r6 + 1;
        r5 = r24;
        r13 = r29;
        r14 = r32;
        r7 = r38;
        r8 = r39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x01fc, code lost:
    
        r38 = r7;
        r39 = r8;
        r4.e = defpackage.hqb.a(r4.c) - r4.d;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x020f, code lost:
    
        r38 = 1;
        r39 = r8;
        r36 = r12;
        r40 = 128;
        r0 = defpackage.hqb.b(r4.c);
        r3 = r4.a;
        r5 = r4.b;
        r6 = r4.c;
        r4.c(r0);
        r0 = r4.a;
        r7 = r4.b;
        r8 = r4.c;
        r9 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x022e, code lost:
    
        if (r9 >= r6) goto L103;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x023d, code lost:
    
        if (((r3[r9 >> 3] >> ((r9 & 7) << 3)) & 255) >= 128) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x023f, code lost:
    
        r10 = r5[r9];
        r12 = ((int) ((r10 >>> r30) ^ r10)) * r31;
        r12 = r12 ^ (r12 << 16);
        r13 = r4.b(r12 >>> 7);
        r14 = r12 & 127;
        r12 = r13 >> 3;
        r16 = (r13 & 7) << 3;
        r19 = r5;
        r20 = r6;
        r5 = (r0[r12] & (~(255 << r16))) | (r14 << r16);
        r0[r12] = r5;
        r0[(((r13 - 7) & r8) + (r8 & 7)) >> 3] = r5;
        r7[r13] = r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0276, code lost:
    
        r19 = r5;
        r20 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x027a, code lost:
    
        r9 = r9 + 1;
        r5 = r19;
        r6 = r20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0281, code lost:
    
        r0 = r4.b(r39);
        r38 = r38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x0285, code lost:
    
        r29 = r0;
        r4.d++;
        r0 = r4.e;
        r3 = r4.a;
        r5 = r29 >> 3;
        r6 = r3[r5];
        r8 = (r29 & 7) << 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x029f, code lost:
    
        if (((r6 >> r8) & 255) != r40) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x02a1, code lost:
    
        r22 = r38 == true ? 1 : 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x02a3, code lost:
    
        r4.e = r0 - r22;
        r0 = r4.c;
        r6 = (r6 & (~(255 << r8))) | (r36 << r8);
        r3[r5] = r6;
        r3[(((r29 - 7) & r0) + (r0 & 7)) >> 3] = r6;
        r38 = r38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x034c, code lost:
    
        if (((r6 & ((~r6) << 6)) & (-9187201950435737472L)) == 0) goto L85;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x034e, code lost:
    
        r10 = -1;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean j(android.view.KeyEvent r41) {
        /*
            Method dump skipped, instruction units count: 907
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.or4.j(android.view.KeyEvent):boolean");
    }
}
