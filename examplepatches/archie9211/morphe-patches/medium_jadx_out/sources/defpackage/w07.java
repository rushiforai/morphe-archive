package defpackage;

import java.io.Serializable;
import java.util.AbstractMap;
import java.util.Arrays;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w07 extends AbstractMap implements Serializable {
    public static final js4 i = new js4(24);
    public t07 g;
    public t07 h;
    public int d = 0;
    public int e = 0;
    public final Comparator a = i;
    public final v07 c = new v07();
    public v07[] b = new v07[16];
    public int f = 12;

    private Object writeReplace() {
        return new LinkedHashMap(this);
    }

    public final v07 a(Object obj, boolean z) {
        int iCompareTo;
        v07 v07Var;
        boolean z2;
        v07 v07Var2;
        v07 v07Var3;
        v07 v07Var4;
        v07 v07Var5;
        v07 v07Var6;
        v07[] v07VarArr = this.b;
        int iHashCode = obj.hashCode();
        int i2 = iHashCode ^ ((iHashCode >>> 20) ^ (iHashCode >>> 12));
        int i3 = ((i2 >>> 7) ^ i2) ^ (i2 >>> 4);
        boolean z3 = true;
        int length = i3 & (v07VarArr.length - 1);
        v07 v07Var7 = v07VarArr[length];
        js4 js4Var = i;
        v07 v07Var8 = null;
        Comparator comparator = this.a;
        if (v07Var7 != null) {
            Comparable comparable = comparator == js4Var ? (Comparable) obj : null;
            while (true) {
                Object obj2 = v07Var7.f;
                iCompareTo = comparable != null ? comparable.compareTo(obj2) : comparator.compare(obj, obj2);
                if (iCompareTo == 0) {
                    return v07Var7;
                }
                v07 v07Var9 = iCompareTo < 0 ? v07Var7.b : v07Var7.c;
                if (v07Var9 == null) {
                    break;
                }
                v07Var7 = v07Var9;
            }
        } else {
            iCompareTo = 0;
        }
        if (!z) {
            return null;
        }
        v07 v07Var10 = this.c;
        if (v07Var7 != null) {
            v07 v07Var11 = v07Var7;
            v07Var = new v07(v07Var11, obj, i3, v07Var10, v07Var10.e);
            if (iCompareTo < 0) {
                v07Var11.b = v07Var;
            } else {
                v07Var11.c = v07Var;
            }
            b(v07Var11, true);
        } else {
            if (comparator == js4Var && !(obj instanceof Comparable)) {
                throw new ClassCastException(obj.getClass().getName().concat(" is not Comparable"));
            }
            v07Var = new v07(v07Var7, obj, i3, v07Var10, v07Var10.e);
            v07VarArr[length] = v07Var;
        }
        int i4 = this.d;
        this.d = i4 + 1;
        if (i4 > this.f) {
            v07[] v07VarArr2 = this.b;
            int length2 = v07VarArr2.length;
            int i5 = length2 * 2;
            v07[] v07VarArr3 = new v07[i5];
            int i6 = 3;
            ym0 ym0Var = new ym0(i6);
            ym0 ym0Var2 = new ym0(i6);
            int i7 = 0;
            while (i7 < length2) {
                v07 v07Var12 = v07VarArr2[i7];
                if (v07Var12 == null) {
                    z2 = z3;
                    v07Var3 = v07Var8;
                } else {
                    v07 v07Var13 = v07Var8;
                    for (v07 v07Var14 = v07Var12; v07Var14 != null; v07Var14 = v07Var14.b) {
                        v07Var14.a = v07Var13;
                        v07Var13 = v07Var14;
                    }
                    int i8 = 0;
                    int i9 = 0;
                    while (true) {
                        if (v07Var13 != null) {
                            z2 = z3;
                            v07 v07Var15 = v07Var13.a;
                            v07Var13.a = v07Var8;
                            v07 v07Var16 = v07Var13.c;
                            while (true) {
                                v07 v07Var17 = v07Var16;
                                v07Var2 = v07Var15;
                                v07Var15 = v07Var17;
                                if (v07Var15 == null) {
                                    break;
                                }
                                v07Var15.a = v07Var2;
                                v07Var16 = v07Var15.b;
                            }
                        } else {
                            v07 v07Var18 = v07Var13;
                            v07Var13 = v07Var8;
                            v07Var2 = v07Var18;
                            z2 = z3;
                        }
                        if (v07Var13 == null) {
                            break;
                        }
                        if ((v07Var13.g & length2) == 0) {
                            i8++;
                        } else {
                            i9++;
                        }
                        v07Var13 = v07Var2;
                        z3 = z2;
                        v07Var8 = null;
                    }
                    ym0Var.b = ((Integer.highestOneBit(i8) * 2) - 1) - i8;
                    ym0Var.d = 0;
                    ym0Var.c = 0;
                    v07 v07Var19 = null;
                    ym0Var.e = null;
                    ym0Var2.b = ((Integer.highestOneBit(i9) * 2) - 1) - i9;
                    ym0Var2.d = 0;
                    ym0Var2.c = 0;
                    ym0Var2.e = null;
                    v07 v07Var20 = null;
                    while (v07Var12 != null) {
                        v07Var12.a = v07Var20;
                        v07 v07Var21 = v07Var12;
                        v07Var12 = v07Var12.b;
                        v07Var20 = v07Var21;
                    }
                    while (true) {
                        if (v07Var20 != null) {
                            v07 v07Var22 = v07Var20.a;
                            v07Var20.a = v07Var19;
                            v07 v07Var23 = v07Var20.c;
                            while (true) {
                                v07Var6 = v07Var22;
                                v07Var22 = v07Var23;
                                if (v07Var22 == null) {
                                    break;
                                }
                                v07Var22.a = v07Var6;
                                v07Var23 = v07Var22.b;
                            }
                            v07 v07Var24 = v07Var20;
                            v07Var20 = v07Var6;
                            v07Var19 = v07Var24;
                        }
                        if (v07Var19 == null) {
                            break;
                        }
                        if ((v07Var19.g & length2) == 0) {
                            ym0Var.a(v07Var19);
                        } else {
                            ym0Var2.a(v07Var19);
                        }
                        v07Var19 = null;
                    }
                    if (i8 > 0) {
                        v07Var4 = (v07) ym0Var.e;
                        if (v07Var4.a != null) {
                            lg8.d();
                            return null;
                        }
                        v07Var3 = null;
                    } else {
                        v07Var3 = null;
                        v07Var4 = null;
                    }
                    v07VarArr3[i7] = v07Var4;
                    int i10 = i7 + length2;
                    if (i9 > 0) {
                        v07Var5 = (v07) ym0Var2.e;
                        if (v07Var5.a != null) {
                            lg8.d();
                            return v07Var3;
                        }
                    } else {
                        v07Var5 = v07Var3;
                    }
                    v07VarArr3[i10] = v07Var5;
                }
                i7++;
                z3 = z2;
                v07Var8 = v07Var3;
            }
            this.b = v07VarArr3;
            this.f = (i5 / 4) + (i5 / 2);
        }
        this.e++;
        return v07Var;
    }

    public final void b(v07 v07Var, boolean z) {
        while (v07Var != null) {
            v07 v07Var2 = v07Var.b;
            v07 v07Var3 = v07Var.c;
            int i2 = v07Var2 != null ? v07Var2.i : 0;
            int i3 = v07Var3 != null ? v07Var3.i : 0;
            int i4 = i2 - i3;
            if (i4 == -2) {
                v07 v07Var4 = v07Var3.b;
                v07 v07Var5 = v07Var3.c;
                int i5 = (v07Var4 != null ? v07Var4.i : 0) - (v07Var5 != null ? v07Var5.i : 0);
                if (i5 != -1 && (i5 != 0 || z)) {
                    g(v07Var3);
                }
                f(v07Var);
                if (z) {
                    return;
                }
            } else if (i4 == 2) {
                v07 v07Var6 = v07Var2.b;
                v07 v07Var7 = v07Var2.c;
                int i6 = (v07Var6 != null ? v07Var6.i : 0) - (v07Var7 != null ? v07Var7.i : 0);
                if (i6 != 1 && (i6 != 0 || z)) {
                    f(v07Var2);
                }
                g(v07Var);
                if (z) {
                    return;
                }
            } else if (i4 == 0) {
                v07Var.i = i2 + 1;
                if (z) {
                    return;
                }
            } else {
                v07Var.i = Math.max(i2, i3) + 1;
                if (!z) {
                    return;
                }
            }
            v07Var = v07Var.a;
        }
    }

    public final void c(v07 v07Var, boolean z) {
        v07 v07Var2;
        v07 v07Var3;
        int i2;
        if (z) {
            v07 v07Var4 = v07Var.e;
            v07Var4.d = v07Var.d;
            v07Var.d.e = v07Var4;
            v07Var.e = null;
            v07Var.d = null;
        }
        v07 v07Var5 = v07Var.b;
        v07 v07Var6 = v07Var.c;
        v07 v07Var7 = v07Var.a;
        int i3 = 0;
        if (v07Var5 == null || v07Var6 == null) {
            if (v07Var5 != null) {
                d(v07Var, v07Var5);
                v07Var.b = null;
            } else if (v07Var6 != null) {
                d(v07Var, v07Var6);
                v07Var.c = null;
            } else {
                d(v07Var, null);
            }
            b(v07Var7, false);
            this.d--;
            this.e++;
            return;
        }
        if (v07Var5.i > v07Var6.i) {
            v07 v07Var8 = v07Var5.c;
            while (true) {
                v07 v07Var9 = v07Var8;
                v07Var3 = v07Var5;
                v07Var5 = v07Var9;
                if (v07Var5 == null) {
                    break;
                } else {
                    v07Var8 = v07Var5.c;
                }
            }
        } else {
            v07 v07Var10 = v07Var6.b;
            while (true) {
                v07Var2 = v07Var6;
                v07Var6 = v07Var10;
                if (v07Var6 == null) {
                    break;
                } else {
                    v07Var10 = v07Var6.b;
                }
            }
            v07Var3 = v07Var2;
        }
        c(v07Var3, false);
        v07 v07Var11 = v07Var.b;
        if (v07Var11 != null) {
            i2 = v07Var11.i;
            v07Var3.b = v07Var11;
            v07Var11.a = v07Var3;
            v07Var.b = null;
        } else {
            i2 = 0;
        }
        v07 v07Var12 = v07Var.c;
        if (v07Var12 != null) {
            i3 = v07Var12.i;
            v07Var3.c = v07Var12;
            v07Var12.a = v07Var3;
            v07Var.c = null;
        }
        v07Var3.i = Math.max(i2, i3) + 1;
        d(v07Var, v07Var3);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        Arrays.fill(this.b, (Object) null);
        this.d = 0;
        this.e++;
        v07 v07Var = this.c;
        v07 v07Var2 = v07Var.d;
        while (v07Var2 != v07Var) {
            v07 v07Var3 = v07Var2.d;
            v07Var2.e = null;
            v07Var2.d = null;
            v07Var2 = v07Var3;
        }
        v07Var.e = v07Var;
        v07Var.d = v07Var;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        v07 v07VarA = null;
        if (obj != null) {
            try {
                v07VarA = a(obj, false);
            } catch (ClassCastException unused) {
            }
        }
        return v07VarA != null;
    }

    public final void d(v07 v07Var, v07 v07Var2) {
        v07 v07Var3 = v07Var.a;
        v07Var.a = null;
        if (v07Var2 != null) {
            v07Var2.a = v07Var3;
        }
        if (v07Var3 == null) {
            int i2 = v07Var.g;
            this.b[i2 & (r2.length - 1)] = v07Var2;
        } else if (v07Var3.b == v07Var) {
            v07Var3.b = v07Var2;
        } else {
            v07Var3.c = v07Var2;
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        t07 t07Var = this.g;
        if (t07Var != null) {
            return t07Var;
        }
        t07 t07Var2 = new t07(this, 0);
        this.g = t07Var2;
        return t07Var2;
    }

    public final void f(v07 v07Var) {
        v07 v07Var2 = v07Var.b;
        v07 v07Var3 = v07Var.c;
        v07 v07Var4 = v07Var3.b;
        v07 v07Var5 = v07Var3.c;
        v07Var.c = v07Var4;
        if (v07Var4 != null) {
            v07Var4.a = v07Var;
        }
        d(v07Var, v07Var3);
        v07Var3.b = v07Var;
        v07Var.a = v07Var3;
        int iMax = Math.max(v07Var2 != null ? v07Var2.i : 0, v07Var4 != null ? v07Var4.i : 0) + 1;
        v07Var.i = iMax;
        v07Var3.i = Math.max(iMax, v07Var5 != null ? v07Var5.i : 0) + 1;
    }

    public final void g(v07 v07Var) {
        v07 v07Var2 = v07Var.b;
        v07 v07Var3 = v07Var.c;
        v07 v07Var4 = v07Var2.b;
        v07 v07Var5 = v07Var2.c;
        v07Var.b = v07Var5;
        if (v07Var5 != null) {
            v07Var5.a = v07Var;
        }
        d(v07Var, v07Var2);
        v07Var2.c = v07Var;
        v07Var.a = v07Var2;
        int iMax = Math.max(v07Var3 != null ? v07Var3.i : 0, v07Var5 != null ? v07Var5.i : 0) + 1;
        v07Var.i = iMax;
        v07Var2.i = Math.max(iMax, v07Var4 != null ? v07Var4.i : 0) + 1;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        v07 v07VarA;
        if (obj != null) {
            try {
                v07VarA = a(obj, false);
            } catch (ClassCastException unused) {
                v07VarA = null;
            }
        } else {
            v07VarA = null;
        }
        if (v07VarA != null) {
            return v07VarA.h;
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set keySet() {
        t07 t07Var = this.h;
        if (t07Var != null) {
            return t07Var;
        }
        t07 t07Var2 = new t07(this, 1);
        this.h = t07Var2;
        return t07Var2;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object put(Object obj, Object obj2) {
        if (obj == null) {
            z72.c("key == null");
            return null;
        }
        v07 v07VarA = a(obj, true);
        Object obj3 = v07VarA.h;
        v07VarA.h = obj2;
        return obj3;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        v07 v07VarA;
        if (obj != null) {
            try {
                v07VarA = a(obj, false);
            } catch (ClassCastException unused) {
                v07VarA = null;
            }
        } else {
            v07VarA = null;
        }
        if (v07VarA != null) {
            c(v07VarA, true);
        }
        if (v07VarA != null) {
            return v07VarA.h;
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        return this.d;
    }
}
