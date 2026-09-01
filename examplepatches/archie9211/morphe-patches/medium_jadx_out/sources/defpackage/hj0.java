package defpackage;

import java.util.HashMap;
import java.util.HashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hj0 {
    public final /* synthetic */ int a = 0;
    public Object b;
    public Object c;
    public Object d;
    public Object e;
    public Object f;
    public Object g;
    public Object h;
    public Object i;
    public Object j;
    public Object k;

    public hj0(aq6 aq6Var) {
        this.b = aq6Var;
        ug8 ug8Var = new ug8(1);
        ug8Var.d = -1;
        this.c = ug8Var;
        l26 l26Var = new l26(aq6Var);
        this.d = l26Var;
        this.e = l26Var;
        ffd ffdVar = l26Var.S;
        this.f = ffdVar;
        this.g = ffdVar;
        this.j = new o78(new r28[16]);
    }

    public static q28 c(p28 p28Var, q28 q28Var) {
        q28 q28VarF;
        if (p28Var instanceof u28) {
            q28VarF = ((u28) p28Var).f();
            q28VarF.c = fh8.f(q28VarF);
        } else {
            vm0 vm0Var = new vm0();
            vm0Var.c = fh8.d(p28Var);
            vm0Var.o = p28Var;
            new HashSet();
            q28VarF = vm0Var;
        }
        if (q28VarF.n) {
            b26.b("A ModifierNodeElement cannot return an already attached node from create() ");
        }
        q28VarF.i = true;
        q28 q28Var2 = q28Var.f;
        if (q28Var2 != null) {
            q28Var2.e = q28VarF;
            q28VarF.f = q28Var2;
        }
        q28Var.f = q28VarF;
        q28VarF.e = q28Var;
        return q28VarF;
    }

    public static q28 d(q28 q28Var) {
        boolean z = q28Var.n;
        if (z) {
            t68 t68Var = fh8.a;
            if (!z) {
                b26.b("autoInvalidateRemovedNode called on unattached node");
            }
            fh8.a(q28Var, -1, 2);
            q28Var.F0();
            q28Var.x0();
        }
        q28 q28Var2 = q28Var.f;
        q28 q28Var3 = q28Var.e;
        if (q28Var2 != null) {
            q28Var2.e = q28Var3;
            q28Var.f = null;
        }
        if (q28Var3 != null) {
            q28Var3.f = q28Var2;
            q28Var.e = null;
        }
        q28Var3.getClass();
        return q28Var3;
    }

    public static void j(p28 p28Var, p28 p28Var2, q28 q28Var) {
        if ((p28Var instanceof u28) && (p28Var2 instanceof u28)) {
            q28Var.getClass();
            ((u28) p28Var2).l(q28Var);
            if (q28Var.n) {
                fh8.c(q28Var);
                return;
            } else {
                q28Var.j = true;
                return;
            }
        }
        if (!(q28Var instanceof vm0)) {
            b26.b("Unknown Modifier.Node type");
            return;
        }
        vm0 vm0Var = (vm0) q28Var;
        boolean z = vm0Var.n;
        if (z) {
            if (!z) {
                b26.b("unInitializeModifier called on unattached node");
            }
            if ((vm0Var.c & 8) != 0) {
                ((mn) flb.w0(vm0Var)).C();
            }
        }
        vm0Var.o = p28Var2;
        vm0Var.c = fh8.d(p28Var2);
        if (vm0Var.n) {
            vm0Var.I0(false);
        }
        if (q28Var.n) {
            fh8.c(q28Var);
        } else {
            q28Var.j = true;
        }
    }

    public void a(String str, String str2) {
        HashMap map = (HashMap) this.i;
        if (map != null) {
            map.put(str, str2);
        } else {
            ygf.f("Property \"autoMetadata\" has not been set");
        }
    }

    public ij0 b() {
        String strConcat = ((String) this.b) == null ? " transportName" : "";
        if (((qy3) this.f) == null) {
            strConcat = strConcat.concat(" encodedPayload");
        }
        if (((Long) this.g) == null) {
            strConcat = strConcat.concat(" eventMillis");
        }
        if (((Long) this.h) == null) {
            strConcat = strConcat.concat(" uptimeMillis");
        }
        if (((HashMap) this.i) == null) {
            strConcat = strConcat.concat(" autoMetadata");
        }
        if (strConcat.isEmpty()) {
            return new ij0((String) this.b, (Integer) this.d, (qy3) this.f, ((Long) this.g).longValue(), ((Long) this.h).longValue(), (HashMap) this.i, (Integer) this.e, (String) this.c, (byte[]) this.j, (byte[]) this.k);
        }
        ygf.f("Missing required properties:".concat(strConcat));
        return null;
    }

    public boolean e(int i) {
        return (((q28) this.g).d & i) != 0;
    }

    public void f(q28 q28Var, eh8 eh8Var) {
        for (q28 q28Var2 = q28Var.e; q28Var2 != null; q28Var2 = q28Var2.e) {
            if (q28Var2 == ((ug8) this.c)) {
                aq6 aq6VarV = ((aq6) this.b).v();
                eh8Var.q = aq6VarV != null ? (l26) aq6VarV.F.d : null;
                this.e = eh8Var;
                return;
            } else {
                if ((q28Var2.c & 2) != 0) {
                    return;
                }
                q28Var2.H0(eh8Var);
            }
        }
    }

    public void g() {
        for (q28 q28Var = (q28) this.g; q28Var != null; q28Var = q28Var.f) {
            q28Var.E0();
            if (q28Var.i) {
                t68 t68Var = fh8.a;
                if (!q28Var.n) {
                    b26.b("autoInvalidateInsertedNode called on unattached node");
                }
                fh8.a(q28Var, -1, 1);
            }
            if (q28Var.j) {
                fh8.c(q28Var);
            }
            q28Var.i = false;
            q28Var.j = false;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:118:0x0264, code lost:
    
        r13 = r28 + 2;
        r11 = r24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x026a, code lost:
    
        r3 = r3 + 1;
        r12 = r20;
        r11 = r21;
        r13 = r26;
        r14 = r29;
        r35 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x014a, code lost:
    
        r26 = r13;
        r29 = r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0150, code lost:
    
        if ((r19 & 1) != 0) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0152, code lost:
    
        r11 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0154, code lost:
    
        r11 = r33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0156, code lost:
    
        r13 = r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x0157, code lost:
    
        if (r13 > r3) goto L180;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x0159, code lost:
    
        if (r13 == r12) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x015b, code lost:
    
        if (r13 == r3) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x015d, code lost:
    
        r24 = r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x016b, code lost:
    
        if (r20[(r13 + 1) + r17] >= r20[(r13 - 1) + r17]) goto L67;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x016e, code lost:
    
        r24 = r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x0170, code lost:
    
        r11 = r20[(r13 - 1) + r17];
        r14 = r11 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x0179, code lost:
    
        r24 = r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x017b, code lost:
    
        r11 = r20[(r13 + 1) + r17];
        r14 = r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x0182, code lost:
    
        r22 = r10 - ((r6 - r14) - r13);
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x0188, code lost:
    
        if (r3 == 0) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x018a, code lost:
    
        r25 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x018d, code lost:
    
        r25 = r33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x018f, code lost:
    
        if (r14 != r11) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0191, code lost:
    
        r27 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x0194, code lost:
    
        r27 = r33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x0196, code lost:
    
        r25 = r22 + (r25 & r27);
        r22 = r11;
        r11 = r22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x01a0, code lost:
    
        if (r14 <= r7) goto L186;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x01a2, code lost:
    
        if (r11 <= r15) goto L187;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x01a4, code lost:
    
        r27 = r11;
        r28 = r13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x01b0, code lost:
    
        if (r0.a(r14 - 1, r27 - 1) == false) goto L185;
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x01b2, code lost:
    
        r14 = r14 - 1;
        r11 = r27 - 1;
        r13 = r28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x01b9, code lost:
    
        r27 = r11;
        r28 = r13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x01bd, code lost:
    
        r20[r17 + r28] = r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x01c1, code lost:
    
        if (r24 == 0) goto L181;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x01c3, code lost:
    
        r11 = r19 - r28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x01c5, code lost:
    
        if (r11 < r12) goto L182;
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x01c7, code lost:
    
        if (r11 > r3) goto L183;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x01cd, code lost:
    
        if (r16[r17 + r11] < r14) goto L184;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x01cf, code lost:
    
        r26[r33] = r14;
        r11 = 1;
        r26[1] = r27;
        r26[r32] = r22;
        r26[3] = r25;
        r26[4] = 1;
     */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00f6  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00fa  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x010b A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x011e  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0140  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void h(int r32, defpackage.o78 r33, defpackage.o78 r34, defpackage.q28 r35, boolean r36) {
        /*
            Method dump skipped, instruction units count: 929
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hj0.h(int, o78, o78, q28, boolean):void");
    }

    public void i() {
        up6 up6Var;
        lx8 lx8Var;
        aq6 aq6Var = (aq6) this.b;
        eh8 eh8Var = (l26) this.d;
        for (q28 q28Var = ((ffd) this.f).e; q28Var != null; q28Var = q28Var.e) {
            sp6 sp6VarY = flb.Y(q28Var);
            if (sp6VarY != null) {
                eh8 eh8Var2 = q28Var.h;
                if (eh8Var2 != null) {
                    up6Var = (up6) eh8Var2;
                    sp6 sp6Var = up6Var.S;
                    up6Var.r1(sp6VarY);
                    if (sp6Var != q28Var && (lx8Var = up6Var.L) != null) {
                        ((rf5) lx8Var).c();
                    }
                } else {
                    up6Var = new up6(aq6Var, sp6VarY);
                    q28Var.H0(up6Var);
                }
                eh8Var.q = up6Var;
                up6Var.p = eh8Var;
                eh8Var = up6Var;
            } else {
                q28Var.H0(eh8Var);
            }
        }
        aq6 aq6VarV = aq6Var.v();
        eh8Var.q = aq6VarV != null ? (l26) aq6VarV.F.d : null;
        this.e = eh8Var;
    }

    public String toString() {
        switch (this.a) {
            case 1:
                StringBuilder sb = new StringBuilder("[");
                q28 q28Var = (q28) this.g;
                ffd ffdVar = (ffd) this.f;
                if (q28Var == ffdVar) {
                    sb.append("]");
                } else {
                    while (true) {
                        if (q28Var != null && q28Var != ffdVar) {
                            sb.append(String.valueOf(q28Var));
                            if (q28Var.f == ffdVar) {
                                sb.append("]");
                            } else {
                                sb.append(",");
                                q28Var = q28Var.f;
                            }
                        }
                    }
                }
                return sb.toString();
            default:
                return super.toString();
        }
    }

    public /* synthetic */ hj0() {
    }
}
