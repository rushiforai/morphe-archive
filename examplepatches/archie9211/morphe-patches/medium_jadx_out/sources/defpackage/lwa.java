package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lwa implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ lwa(zse zseVar, t99 t99Var, int i) {
        this.a = 2;
        this.c = zseVar;
        this.d = t99Var;
        this.b = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        k22 k22Var;
        c1e c1eVar;
        k22 k22Var2;
        c1e c1eVar2;
        int i;
        int i2 = this.a;
        c1e c1eVar3 = c1e.a;
        int i3 = 0;
        int i4 = this.b;
        Object obj2 = this.d;
        Object obj3 = this.c;
        switch (i2) {
            case 0:
                mwa mwaVar = (mwa) obj3;
                t68 t68Var = (t68) obj2;
                k22 k22Var3 = (k22) obj;
                if (mwaVar.e == i4 && g76.L(t68Var, mwaVar.f) && (k22Var3 instanceof q22)) {
                    long[] jArr = t68Var.a;
                    int length = jArr.length - 2;
                    if (length >= 0) {
                        int i5 = 0;
                        while (true) {
                            long j = jArr[i5];
                            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                                int i6 = 8;
                                int i7 = 8 - ((~(i5 - length)) >>> 31);
                                int i8 = i3;
                                while (i8 < i7) {
                                    if ((255 & j) < 128) {
                                        int i9 = (i5 << 3) + i8;
                                        Object obj4 = t68Var.b[i9];
                                        boolean z = t68Var.c[i9] != i4;
                                        if (z) {
                                            i = i6;
                                            q22 q22Var = (q22) k22Var3;
                                            k22Var2 = k22Var3;
                                            f78 f78Var = q22Var.g;
                                            tp7.z(f78Var, obj4, mwaVar);
                                            c1eVar2 = c1eVar3;
                                            if (obj4 instanceof j83) {
                                                j83 j83Var = (j83) obj4;
                                                if (!f78Var.c(j83Var)) {
                                                    tp7.A(q22Var.j, j83Var);
                                                }
                                                f78 f78Var2 = mwaVar.g;
                                                if (f78Var2 != null) {
                                                    f78Var2.k(obj4);
                                                }
                                            }
                                        } else {
                                            k22Var2 = k22Var3;
                                            c1eVar2 = c1eVar3;
                                            i = i6;
                                        }
                                        if (z) {
                                            t68Var.f(i9);
                                        }
                                    } else {
                                        k22Var2 = k22Var3;
                                        c1eVar2 = c1eVar3;
                                        i = i6;
                                    }
                                    j >>= i;
                                    i8++;
                                    i6 = i;
                                    k22Var3 = k22Var2;
                                    c1eVar3 = c1eVar2;
                                }
                                k22Var = k22Var3;
                                c1eVar = c1eVar3;
                                if (i7 != i6) {
                                }
                            } else {
                                k22Var = k22Var3;
                                c1eVar = c1eVar3;
                            }
                            if (i5 != length) {
                                i5++;
                                k22Var3 = k22Var;
                                c1eVar3 = c1eVar;
                                i3 = 0;
                            }
                        }
                    }
                }
                break;
            case 1:
                vrb vrbVar = (vrb) obj3;
                t99 t99Var = (t99) obj2;
                s99 s99Var = (s99) obj;
                int iG = vrbVar.o.a.g();
                if (iG < 0) {
                    iG = 0;
                }
                if (iG <= i4) {
                    i4 = iG;
                }
                int i10 = -i4;
                boolean z2 = vrbVar.p;
                int i11 = z2 ? 0 : i10;
                if (!z2) {
                    i10 = 0;
                }
                s99Var.a = true;
                s99.k(s99Var, t99Var, i11, i10);
                s99Var.a = false;
                break;
            default:
                zse zseVar = (zse) obj3;
                t99 t99Var2 = (t99) obj2;
                s99 s99Var2 = (s99) obj;
                int i12 = zseVar.c;
                eid eidVar = zseVar.b;
                prd prdVar = zseVar.d;
                rjd rjdVar = (rjd) zseVar.e.invoke();
                eidVar.a(hw8.Vertical, er7.y(s99Var2, i12, prdVar, rjdVar != null ? rjdVar.a : null, false, t99Var2.a), i4, t99Var2.b);
                s99.j(s99Var2, t99Var2, 0, Math.round(-eidVar.a.g()));
                break;
        }
        return c1eVar3;
    }

    public /* synthetic */ lwa(Object obj, int i, Object obj2, int i2) {
        this.a = i2;
        this.c = obj;
        this.b = i;
        this.d = obj2;
    }
}
