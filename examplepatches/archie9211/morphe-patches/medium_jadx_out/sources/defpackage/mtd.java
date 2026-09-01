package defpackage;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import pushnotifications.SY.eoLmc;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class mtd {
    public static final String[] l = {"INSERT", "UPDATE", "DELETE"};
    public boolean a;
    public Object b;
    public Serializable c;
    public Object d;
    public Object e;
    public Serializable f;
    public Object g;
    public final Object h;
    public final Object i;
    public final Object j;
    public Object k;

    public mtd(elb elbVar, LinkedHashMap linkedHashMap, LinkedHashMap linkedHashMap2, String[] strArr, boolean z, k0 k0Var) {
        String lowerCase;
        this.b = elbVar;
        this.c = linkedHashMap;
        this.d = linkedHashMap2;
        this.a = z;
        this.f = k0Var;
        this.j = new AtomicBoolean(false);
        this.k = new e73(1);
        this.e = new LinkedHashMap();
        int length = strArr.length;
        String[] strArr2 = new String[length];
        for (int i = 0; i < length; i++) {
            String str = strArr[i];
            Locale locale = Locale.ROOT;
            String lowerCase2 = str.toLowerCase(locale);
            lowerCase2.getClass();
            ((LinkedHashMap) this.e).put(lowerCase2, Integer.valueOf(i));
            String str2 = (String) ((LinkedHashMap) this.c).get(strArr[i]);
            if (str2 != null) {
                lowerCase = str2.toLowerCase(locale);
                lowerCase.getClass();
            } else {
                lowerCase = null;
            }
            if (lowerCase != null) {
                lowerCase2 = lowerCase;
            }
            strArr2[i] = lowerCase2;
        }
        this.g = strArr2;
        for (Map.Entry entry : ((LinkedHashMap) this.c).entrySet()) {
            String str3 = (String) entry.getValue();
            Locale locale2 = Locale.ROOT;
            String lowerCase3 = str3.toLowerCase(locale2);
            lowerCase3.getClass();
            if (((LinkedHashMap) this.e).containsKey(lowerCase3)) {
                String lowerCase4 = ((String) entry.getKey()).toLowerCase(locale2);
                lowerCase4.getClass();
                LinkedHashMap linkedHashMap3 = (LinkedHashMap) this.e;
                linkedHashMap3.put(lowerCase4, ei7.N(lowerCase3, linkedHashMap3));
            }
        }
        this.h = new hn8(((String[]) this.g).length);
        int length2 = ((String[]) this.g).length;
        my6 my6Var = new my6();
        my6Var.a = vv2.j(new int[length2]);
        this.i = my6Var;
    }

    public r4a b() throws gxd {
        yq6 yq6Var;
        yq6 yq6Var2;
        s4a s4aVar;
        x4a x4aVar;
        m45 m45Var;
        yq6 yq6Var3;
        yq6 yq6Var4;
        r4a r4aVar = (r4a) this.k;
        r4a r4aVarA0 = r4aVar.A0((yv2) this.b, (c28) this.c, (g93) this.d, (q4a) this.e, (e41) this.f, (n98) this.i);
        List typeParameters = r4aVar.getTypeParameters();
        ArrayList arrayList = new ArrayList(((ArrayList) typeParameters).size());
        ixd ixdVarZ = dm2.Z(typeParameters, (exd) this.g, r4aVarA0, arrayList);
        mn6 mn6Var = (mn6) this.j;
        mn6 mn6VarH = ixdVarZ.h(mn6Var, pqe.OUT_VARIANCE);
        if (mn6VarH != null) {
            pqe pqeVar = pqe.IN_VARIANCE;
            mn6 mn6VarH2 = ixdVarZ.h(mn6Var, pqeVar);
            if (mn6VarH2 != null) {
                r4aVarA0.E0(mn6VarH2);
            }
            yq6 yq6Var5 = (yq6) this.h;
            if (yq6Var5 != null) {
                yq6 yq6VarF = yq6Var5.f(ixdVarZ);
                yq6Var = yq6VarF != null ? yq6VarF : null;
            }
            yq6 yq6Var6 = r4aVar.v;
            if (yq6Var6 != null) {
                mn6 mn6VarH3 = ixdVarZ.h(yq6Var6.getType(), pqeVar);
                if (mn6VarH3 == null) {
                    yq6Var4 = null;
                } else {
                    yq6Var6.y0();
                    yq6Var4 = new yq6(r4aVarA0, new l74(r4aVarA0, mn6VarH3), yq6Var6.getAnnotations());
                }
                yq6Var2 = yq6Var4;
            } else {
                yq6Var2 = null;
            }
            ArrayList arrayList2 = new ArrayList();
            for (yq6 yq6Var7 : r4aVar.t) {
                mn6 mn6VarH4 = ixdVarZ.h(yq6Var7.getType(), pqe.IN_VARIANCE);
                if (mn6VarH4 == null) {
                    yq6Var3 = null;
                } else {
                    n98 n98VarW0 = ((d92) yq6Var7.y0()).w0();
                    yq6Var7.y0();
                    yq6Var3 = new yq6(r4aVarA0, new d92(r4aVarA0, mn6VarH4, n98VarW0), yq6Var7.getAnnotations());
                }
                if (yq6Var3 != null) {
                    arrayList2.add(yq6Var3);
                }
            }
            r4aVarA0.F0(mn6VarH, arrayList, yq6Var, yq6Var2, arrayList2);
            s4a s4aVar2 = r4aVar.x;
            tz7 tz7Var = jkc.g0;
            if (s4aVar2 == null) {
                s4aVar = null;
            } else {
                ly annotations = s4aVar2.getAnnotations();
                c28 c28Var = (c28) this.c;
                g93 visibility = r4aVar.x.getVisibility();
                if (((e41) this.f) == e41.FAKE_OVERRIDE && h93.e(h93.f(visibility.a.l()))) {
                    visibility = h93.h;
                }
                g93 g93Var = visibility;
                s4a s4aVar3 = r4aVar.x;
                boolean z = s4aVar3.f;
                boolean z2 = s4aVar3.g;
                boolean z3 = s4aVar3.j;
                e41 e41Var = (e41) this.f;
                q4a q4aVar = (q4a) this.e;
                s4aVar = new s4a(r4aVarA0, annotations, c28Var, g93Var, z, z2, z3, e41Var, q4aVar == null ? null : q4aVar.b(), tz7Var);
            }
            if (s4aVar != null) {
                s4a s4aVar4 = r4aVar.x;
                mn6 mn6Var2 = s4aVar4.n;
                s4aVar.m = r4a.B0(ixdVarZ, s4aVar4);
                s4aVar.A0(mn6Var2 != null ? ixdVarZ.h(mn6Var2, pqe.OUT_VARIANCE) : null);
            }
            x4a x4aVar2 = r4aVar.y;
            if (x4aVar2 == null) {
                x4aVar = null;
            } else {
                ly annotations2 = x4aVar2.getAnnotations();
                c28 c28Var2 = (c28) this.c;
                g93 visibility2 = r4aVar.y.getVisibility();
                if (((e41) this.f) == e41.FAKE_OVERRIDE && h93.e(h93.f(visibility2.a.l()))) {
                    visibility2 = h93.h;
                }
                g93 g93Var2 = visibility2;
                x4a x4aVar3 = r4aVar.y;
                boolean z4 = x4aVar3.f;
                boolean z5 = x4aVar3.g;
                boolean z6 = x4aVar3.j;
                e41 e41Var2 = (e41) this.f;
                q4a q4aVar2 = (q4a) this.e;
                x4aVar = new x4a(r4aVarA0, annotations2, c28Var2, g93Var2, z4, z5, z6, e41Var2, q4aVar2 == null ? null : q4aVar2.c(), tz7Var);
            }
            if (x4aVar != null) {
                List listC0 = u55.C0(x4aVar, r4aVar.y.I(), ixdVarZ, false, false, null);
                if (listC0 == null) {
                    listC0 = Collections.singletonList(x4a.z0(x4aVar, f93.e((yv2) this.b).n(), ((lqe) r4aVar.y.I().get(0)).getAnnotations()));
                }
                if (listC0.size() != 1) {
                    lg8.d();
                    return null;
                }
                x4aVar.m = r4a.B0(ixdVarZ, r4aVar.y);
                lqe lqeVar = (lqe) listC0.get(0);
                if (lqeVar == null) {
                    x4a.f0(6);
                    throw null;
                }
                x4aVar.n = lqeVar;
            }
            hf4 hf4Var = r4aVar.z;
            hf4 hf4Var2 = hf4Var == null ? null : new hf4(hf4Var.getAnnotations(), r4aVarA0);
            hf4 hf4Var3 = r4aVar.A;
            r4aVarA0.C0(s4aVar, x4aVar, hf4Var2, hf4Var3 == null ? null : new hf4(hf4Var3.getAnnotations(), r4aVarA0));
            if (this.a) {
                zgc zgcVar = new zgc();
                Iterator it2 = r4aVar.i().iterator();
                while (it2.hasNext()) {
                    zgcVar.add(((q4a) it2.next()).f(ixdVarZ));
                }
                r4aVarA0.l = zgcVar;
            }
            if (r4aVar.p() && (m45Var = r4aVar.i) != null) {
                r4aVarA0.D0(r4aVar.h, m45Var);
            }
            return r4aVarA0;
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object c(defpackage.mc9 r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.dtd
            if (r0 == 0) goto L13
            r0 = r6
            dtd r0 = (defpackage.dtd) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            dtd r0 = new dtd
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r4 = r0.c
            tb2 r6 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r0.e
            r2 = 2
            r3 = 1
            if (r1 == 0) goto L3d
            if (r1 == r3) goto L35
            if (r1 != r2) goto L2e
            java.lang.Object r5 = r0.b
            java.util.Set r5 = (java.util.Set) r5
            defpackage.br7.v(r4)
            return r5
        L2e:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L35:
            java.lang.Object r5 = r0.b
            mc9 r5 = (defpackage.mc9) r5
            defpackage.br7.v(r4)
            goto L54
        L3d:
            defpackage.br7.v(r4)
            tjd r4 = new tjd
            r1 = 8
            r4.<init>(r1)
            r0.b = r5
            r0.e = r3
            java.lang.String r1 = "SELECT * FROM room_table_modification_log WHERE invalidated = 1"
            java.lang.Object r4 = r5.c(r1, r4, r0)
            if (r4 != r6) goto L54
            goto L6b
        L54:
            java.util.Set r4 = (java.util.Set) r4
            r1 = r4
            java.util.Collection r1 = (java.util.Collection) r1
            boolean r1 = r1.isEmpty()
            if (r1 != 0) goto L6c
            r0.b = r4
            r0.e = r2
            java.lang.String r1 = "UPDATE room_table_modification_log SET invalidated = 0 WHERE invalidated = 1"
            java.lang.Object r5 = defpackage.jq7.m(r5, r1, r0)
            if (r5 != r6) goto L6c
        L6b:
            return r6
        L6c:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mtd.c(mc9, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object d(defpackage.p92 r12) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 209
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mtd.d(p92):java.lang.Object");
    }

    public void e(m45 m45Var, m45 m45Var2) {
        m45Var.getClass();
        m45Var2.getClass();
        if (((AtomicBoolean) this.j).compareAndSet(false, true)) {
            m45Var.invoke();
            k92 k92Var = ((elb) this.b).a;
            n92 n92Var = null;
            if (k92Var != null) {
                vx0.c0(k92Var, new nb2(nb2.b), null, new cfd(this, m45Var2, n92Var, 3), 2);
            } else {
                g76.g0("coroutineScope");
                throw null;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0075, code lost:
    
        if (defpackage.jq7.m(r1, r3, r4) == r5) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x00d7, code lost:
    
        if (defpackage.jq7.m(r11, r3, r4) == r5) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x00d9, code lost:
    
        return r5;
     */
    /* JADX WARN: Removed duplicated region for block: B:21:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x00d7 -> B:28:0x00da). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object f(defpackage.jrd r18, int r19, defpackage.p92 r20) {
        /*
            Method dump skipped, instruction units count: 226
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mtd.f(jrd, int, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:17:0x0080 -> B:19:0x0083). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object g(defpackage.jrd r9, int r10, defpackage.p92 r11) {
        /*
            r8 = this;
            boolean r0 = r11 instanceof defpackage.itd
            if (r0 == 0) goto L13
            r0 = r11
            itd r0 = (defpackage.itd) r0
            int r1 = r0.i
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.i = r1
            goto L18
        L13:
            itd r0 = new itd
            r0.<init>(r8, r11)
        L18:
            java.lang.Object r11 = r0.g
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.i
            r3 = 1
            if (r2 == 0) goto L3a
            if (r2 != r3) goto L33
            int r8 = r0.f
            int r9 = r0.e
            java.lang.String[] r10 = r0.d
            java.lang.String r2 = r0.c
            mc9 r4 = r0.b
            defpackage.br7.v(r11)
            r11 = r10
            r10 = r4
            goto L83
        L33:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            r8 = 0
            return r8
        L3a:
            defpackage.br7.v(r11)
            java.lang.Object r8 = r8.g
            java.lang.String[] r8 = (java.lang.String[]) r8
            r8 = r8[r10]
            java.lang.String[] r10 = defpackage.mtd.l
            r11 = 0
            r2 = 3
            r7 = r2
            r2 = r8
            r8 = r7
            r7 = r10
            r10 = r9
            r9 = r11
            r11 = r7
        L4e:
            if (r9 >= r8) goto L85
            r4 = r11[r9]
            java.lang.StringBuilder r5 = new java.lang.StringBuilder
            java.lang.String r6 = "room_table_modification_trigger_"
            r5.<init>(r6)
            r5.append(r2)
            r6 = 95
            r5.append(r6)
            r5.append(r4)
            java.lang.String r4 = r5.toString()
            java.lang.String r5 = "DROP TRIGGER IF EXISTS `"
            r6 = 96
            java.lang.String r4 = defpackage.wgd.t(r6, r5, r4)
            r0.b = r10
            r0.c = r2
            r0.d = r11
            r0.e = r9
            r0.f = r8
            r0.i = r3
            java.lang.Object r4 = defpackage.jq7.m(r10, r4, r0)
            if (r4 != r1) goto L83
            return r1
        L83:
            int r9 = r9 + r3
            goto L4e
        L85:
            c1e r8 = defpackage.c1e.a
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mtd.g(jrd, int, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object h(defpackage.p92 r9) throws java.lang.Throwable {
        /*
            r8 = this;
            java.lang.Object r0 = r8.b
            elb r0 = (defpackage.elb) r0
            boolean r1 = r9 instanceof defpackage.jtd
            if (r1 == 0) goto L17
            r1 = r9
            jtd r1 = (defpackage.jtd) r1
            int r2 = r1.e
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L17
            int r2 = r2 - r3
            r1.e = r2
            goto L1c
        L17:
            jtd r1 = new jtd
            r1.<init>(r8, r9)
        L1c:
            java.lang.Object r9 = r1.c
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.e
            r4 = 0
            r5 = 1
            if (r3 == 0) goto L36
            if (r3 != r5) goto L30
            s26 r8 = r1.b
            defpackage.br7.v(r9)     // Catch: java.lang.Throwable -> L2e
            goto L54
        L2e:
            r9 = move-exception
            goto L5c
        L30:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r4
        L36:
            defpackage.br7.v(r9)
            s26 r9 = r0.g
            boolean r3 = r9.a0()
            if (r3 == 0) goto L60
            j5d r3 = new j5d     // Catch: java.lang.Throwable -> L58
            r6 = 6
            r3.<init>(r8, r4, r6)     // Catch: java.lang.Throwable -> L58
            r1.b = r9     // Catch: java.lang.Throwable -> L58
            r1.e = r5     // Catch: java.lang.Throwable -> L58
            r8 = 0
            java.lang.Object r8 = r0.r(r8, r3, r1)     // Catch: java.lang.Throwable -> L58
            if (r8 != r2) goto L53
            return r2
        L53:
            r8 = r9
        L54:
            r8.z0()
            goto L60
        L58:
            r8 = move-exception
            r7 = r9
            r9 = r8
            r8 = r7
        L5c:
            r8.z0()
            throw r9
        L60:
            c1e r8 = defpackage.c1e.a
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mtd.h(p92):java.lang.Object");
    }

    public static /* synthetic */ void a(int i) {
        String str = (i == 1 || i == 2 || i == 3 || i == 5 || i == 7 || i == 9 || i == 11 || i == 19 || i == 13 || i == 14 || i == 16 || i == 17) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 1 || i == 2 || i == 3 || i == 5 || i == 7 || i == 9 || i == 11 || i == 19 || i == 13 || i == 14 || i == 16 || i == 17) ? 2 : 3];
        switch (i) {
            case 1:
            case 2:
            case 3:
            case 5:
            case 7:
            case 9:
            case 11:
            case 13:
            case 14:
            case 16:
            case 17:
            case 19:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/PropertyDescriptorImpl$CopyConfiguration";
                break;
            case 4:
                objArr[0] = "type";
                break;
            case 6:
                objArr[0] = "modality";
                break;
            case 8:
                objArr[0] = "visibility";
                break;
            case 10:
                objArr[0] = "kind";
                break;
            case 12:
                objArr[0] = "typeParameters";
                break;
            case 15:
                objArr[0] = "substitution";
                break;
            case 18:
                objArr[0] = "name";
                break;
            default:
                objArr[0] = AEVqIoD.qeUrRmC;
                break;
        }
        if (i == 1) {
            objArr[1] = "setOwner";
        } else if (i == 2) {
            objArr[1] = "setOriginal";
        } else if (i == 3) {
            objArr[1] = "setPreserveSourceElement";
        } else if (i == 5) {
            objArr[1] = "setReturnType";
        } else if (i == 7) {
            objArr[1] = "setModality";
        } else if (i == 9) {
            objArr[1] = "setVisibility";
        } else if (i == 11) {
            objArr[1] = "setKind";
        } else if (i == 19) {
            objArr[1] = "setName";
        } else if (i == 13) {
            objArr[1] = "setTypeParameters";
        } else if (i == 14) {
            objArr[1] = CspinKvYN.zDtDotGEIcsbql;
        } else if (i == 16) {
            objArr[1] = "setSubstitution";
        } else if (i != 17) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/PropertyDescriptorImpl$CopyConfiguration";
        } else {
            objArr[1] = "setCopyOverrides";
        }
        switch (i) {
            case 1:
            case 2:
            case 3:
            case 5:
            case 7:
            case 9:
            case 11:
            case 13:
            case 14:
            case 16:
            case 17:
            case 19:
                break;
            case 4:
                objArr[2] = "setReturnType";
                break;
            case 6:
                objArr[2] = "setModality";
                break;
            case 8:
                objArr[2] = "setVisibility";
                break;
            case 10:
                objArr[2] = "setKind";
                break;
            case 12:
                objArr[2] = "setTypeParameters";
                break;
            case 15:
                objArr[2] = "setSubstitution";
                break;
            case 18:
                objArr[2] = "setName";
                break;
            default:
                objArr[2] = "setOwner";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i != 1 && i != 2 && i != 3 && i != 5 && i != 7 && i != 9 && i != 11 && i != 19 && i != 13 && i != 14 && i != 16 && i != 17) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    public f09 i(String[] strArr) {
        p1c p1cVar = new p1c();
        for (String str : strArr) {
            LinkedHashMap linkedHashMap = (LinkedHashMap) this.d;
            String lowerCase = str.toLowerCase(Locale.ROOT);
            lowerCase.getClass();
            Set set = (Set) linkedHashMap.get(lowerCase);
            if (set != null) {
                p1cVar.addAll(set);
            } else {
                p1cVar.add(str);
            }
        }
        String[] strArr2 = (String[]) qo7.k(p1cVar).toArray(new String[0]);
        int length = strArr2.length;
        int[] iArr = new int[length];
        for (int i = 0; i < length; i++) {
            String str2 = strArr2[i];
            LinkedHashMap linkedHashMap2 = (LinkedHashMap) this.e;
            String lowerCase2 = str2.toLowerCase(Locale.ROOT);
            lowerCase2.getClass();
            Integer num = (Integer) linkedHashMap2.get(lowerCase2);
            if (num == null) {
                ay0.e(eoLmc.NQJlNObFvUpn.concat(str2));
                return null;
            }
            iArr[i] = num.intValue();
        }
        return new f09(strArr2, iArr);
    }

    public mtd(r4a r4aVar) {
        this.k = r4aVar;
        this.b = r4aVar.h();
        this.c = r4aVar.o();
        this.d = r4aVar.getVisibility();
        this.e = null;
        this.f = r4aVar.j();
        this.g = exd.a;
        this.a = true;
        this.h = r4aVar.u;
        this.i = r4aVar.getName();
        this.j = r4aVar.getType();
    }
}
