package aq;

import ai.r2;
import java.io.Serializable;
import java.util.AbstractMap;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Set;

/* loaded from: classes4.dex */
public final class d0 extends AbstractMap implements Serializable {

    /* renamed from: i, reason: collision with root package name */
    public static final r2 f15439i = new r2(1);

    /* renamed from: g, reason: collision with root package name */
    public a0 f15446g;

    /* renamed from: h, reason: collision with root package name */
    public a0 f15447h;

    /* renamed from: d, reason: collision with root package name */
    public int f15443d = 0;

    /* renamed from: e, reason: collision with root package name */
    public int f15444e = 0;

    /* renamed from: a, reason: collision with root package name */
    public final Comparator f15440a = f15439i;

    /* renamed from: c, reason: collision with root package name */
    public final c0 f15442c = new c0();

    /* renamed from: b, reason: collision with root package name */
    public c0[] f15441b = new c0[16];

    /* renamed from: f, reason: collision with root package name */
    public int f15445f = 12;

    public final c0 a(Object obj, boolean z11) {
        int iCompareTo;
        c0 c0Var;
        boolean z12;
        c0 c0Var2;
        c0 c0Var3;
        c0 c0Var4;
        c0 c0Var5;
        c0 c0Var6;
        c0[] c0VarArr = this.f15441b;
        int iHashCode = obj.hashCode();
        int i5 = iHashCode ^ ((iHashCode >>> 20) ^ (iHashCode >>> 12));
        int i11 = ((i5 >>> 7) ^ i5) ^ (i5 >>> 4);
        boolean z13 = true;
        int length = i11 & (c0VarArr.length - 1);
        c0 c0Var7 = c0VarArr[length];
        r2 r2Var = f15439i;
        c0 c0Var8 = null;
        Comparator comparator = this.f15440a;
        if (c0Var7 != null) {
            Comparable comparable = comparator == r2Var ? (Comparable) obj : null;
            while (true) {
                Object obj2 = c0Var7.f15428f;
                iCompareTo = comparable != null ? comparable.compareTo(obj2) : comparator.compare(obj, obj2);
                if (iCompareTo == 0) {
                    return c0Var7;
                }
                c0 c0Var9 = iCompareTo < 0 ? c0Var7.f15424b : c0Var7.f15425c;
                if (c0Var9 == null) {
                    break;
                }
                c0Var7 = c0Var9;
            }
        } else {
            iCompareTo = 0;
        }
        if (!z11) {
            return null;
        }
        c0 c0Var10 = this.f15442c;
        if (c0Var7 != null) {
            c0 c0Var11 = c0Var7;
            c0Var = new c0(c0Var11, obj, i11, c0Var10, c0Var10.f15427e);
            if (iCompareTo < 0) {
                c0Var11.f15424b = c0Var;
            } else {
                c0Var11.f15425c = c0Var;
            }
            b(c0Var11, true);
        } else {
            if (comparator == r2Var && !(obj instanceof Comparable)) {
                throw new ClassCastException(obj.getClass().getName().concat(" is not Comparable"));
            }
            c0Var = new c0(c0Var7, obj, i11, c0Var10, c0Var10.f15427e);
            c0VarArr[length] = c0Var;
        }
        int i12 = this.f15443d;
        this.f15443d = i12 + 1;
        if (i12 > this.f15445f) {
            c0[] c0VarArr2 = this.f15441b;
            int length2 = c0VarArr2.length;
            int i13 = length2 * 2;
            c0[] c0VarArr3 = new c0[i13];
            y yVar = new y();
            y yVar2 = new y();
            int i14 = 0;
            while (i14 < length2) {
                c0 c0Var12 = c0VarArr2[i14];
                if (c0Var12 == null) {
                    z12 = z13;
                    c0Var3 = c0Var8;
                } else {
                    c0 c0Var13 = c0Var8;
                    for (c0 c0Var14 = c0Var12; c0Var14 != null; c0Var14 = c0Var14.f15424b) {
                        c0Var14.f15423a = c0Var13;
                        c0Var13 = c0Var14;
                    }
                    int i15 = 0;
                    int i16 = 0;
                    while (true) {
                        if (c0Var13 != null) {
                            z12 = z13;
                            c0 c0Var15 = c0Var13.f15423a;
                            c0Var13.f15423a = c0Var8;
                            c0 c0Var16 = c0Var13.f15425c;
                            while (true) {
                                c0 c0Var17 = c0Var16;
                                c0Var2 = c0Var15;
                                c0Var15 = c0Var17;
                                if (c0Var15 == null) {
                                    break;
                                }
                                c0Var15.f15423a = c0Var2;
                                c0Var16 = c0Var15.f15424b;
                            }
                        } else {
                            c0 c0Var18 = c0Var13;
                            c0Var13 = c0Var8;
                            c0Var2 = c0Var18;
                            z12 = z13;
                        }
                        if (c0Var13 == null) {
                            break;
                        }
                        if ((c0Var13.f15429g & length2) == 0) {
                            i15++;
                        } else {
                            i16++;
                        }
                        c0Var13 = c0Var2;
                        z13 = z12;
                        c0Var8 = null;
                    }
                    yVar.f15537b = ((Integer.highestOneBit(i15) * 2) - 1) - i15;
                    yVar.f15539d = 0;
                    yVar.f15538c = 0;
                    c0Var3 = null;
                    yVar.f15540e = null;
                    yVar2.f15537b = ((Integer.highestOneBit(i16) * 2) - 1) - i16;
                    yVar2.f15539d = 0;
                    yVar2.f15538c = 0;
                    yVar2.f15540e = null;
                    c0 c0Var19 = null;
                    while (c0Var12 != null) {
                        c0Var12.f15423a = c0Var19;
                        c0 c0Var20 = c0Var12;
                        c0Var12 = c0Var12.f15424b;
                        c0Var19 = c0Var20;
                    }
                    while (true) {
                        if (c0Var19 != null) {
                            c0 c0Var21 = c0Var19.f15423a;
                            c0Var19.f15423a = null;
                            c0 c0Var22 = c0Var19.f15425c;
                            while (true) {
                                c0 c0Var23 = c0Var22;
                                c0Var4 = c0Var21;
                                c0Var21 = c0Var23;
                                if (c0Var21 == null) {
                                    break;
                                }
                                c0Var21.f15423a = c0Var4;
                                c0Var22 = c0Var21.f15424b;
                            }
                        } else {
                            c0Var4 = c0Var19;
                            c0Var19 = null;
                        }
                        if (c0Var19 == null) {
                            break;
                        }
                        if ((c0Var19.f15429g & length2) == 0) {
                            yVar.a(c0Var19);
                        } else {
                            yVar2.a(c0Var19);
                        }
                        c0Var19 = c0Var4;
                    }
                    if (i15 > 0) {
                        c0Var5 = (c0) yVar.f15540e;
                        if (c0Var5.f15423a != null) {
                            throw new IllegalStateException();
                        }
                    } else {
                        c0Var5 = null;
                    }
                    c0VarArr3[i14] = c0Var5;
                    int i17 = i14 + length2;
                    if (i16 > 0) {
                        c0Var6 = (c0) yVar2.f15540e;
                        if (c0Var6.f15423a != null) {
                            throw new IllegalStateException();
                        }
                    } else {
                        c0Var6 = null;
                    }
                    c0VarArr3[i17] = c0Var6;
                }
                i14++;
                c0Var8 = c0Var3;
                z13 = z12;
            }
            this.f15441b = c0VarArr3;
            this.f15445f = (i13 / 4) + (i13 / 2);
        }
        this.f15444e++;
        return c0Var;
    }

    public final void b(c0 c0Var, boolean z11) {
        while (c0Var != null) {
            c0 c0Var2 = c0Var.f15424b;
            c0 c0Var3 = c0Var.f15425c;
            int i5 = c0Var2 != null ? c0Var2.f15431i : 0;
            int i11 = c0Var3 != null ? c0Var3.f15431i : 0;
            int i12 = i5 - i11;
            if (i12 == -2) {
                c0 c0Var4 = c0Var3.f15424b;
                c0 c0Var5 = c0Var3.f15425c;
                int i13 = (c0Var4 != null ? c0Var4.f15431i : 0) - (c0Var5 != null ? c0Var5.f15431i : 0);
                if (i13 != -1 && (i13 != 0 || z11)) {
                    f(c0Var3);
                }
                e(c0Var);
                if (z11) {
                    return;
                }
            } else if (i12 == 2) {
                c0 c0Var6 = c0Var2.f15424b;
                c0 c0Var7 = c0Var2.f15425c;
                int i14 = (c0Var6 != null ? c0Var6.f15431i : 0) - (c0Var7 != null ? c0Var7.f15431i : 0);
                if (i14 != 1 && (i14 != 0 || z11)) {
                    e(c0Var2);
                }
                f(c0Var);
                if (z11) {
                    return;
                }
            } else if (i12 == 0) {
                c0Var.f15431i = i5 + 1;
                if (z11) {
                    return;
                }
            } else {
                c0Var.f15431i = Math.max(i5, i11) + 1;
                if (!z11) {
                    return;
                }
            }
            c0Var = c0Var.f15423a;
        }
    }

    public final void c(c0 c0Var, boolean z11) {
        c0 c0Var2;
        c0 c0Var3;
        int i5;
        if (z11) {
            c0 c0Var4 = c0Var.f15427e;
            c0Var4.f15426d = c0Var.f15426d;
            c0Var.f15426d.f15427e = c0Var4;
            c0Var.f15427e = null;
            c0Var.f15426d = null;
        }
        c0 c0Var5 = c0Var.f15424b;
        c0 c0Var6 = c0Var.f15425c;
        c0 c0Var7 = c0Var.f15423a;
        int i11 = 0;
        if (c0Var5 == null || c0Var6 == null) {
            if (c0Var5 != null) {
                d(c0Var, c0Var5);
                c0Var.f15424b = null;
            } else if (c0Var6 != null) {
                d(c0Var, c0Var6);
                c0Var.f15425c = null;
            } else {
                d(c0Var, null);
            }
            b(c0Var7, false);
            this.f15443d--;
            this.f15444e++;
            return;
        }
        if (c0Var5.f15431i > c0Var6.f15431i) {
            c0 c0Var8 = c0Var5.f15425c;
            while (true) {
                c0 c0Var9 = c0Var8;
                c0Var3 = c0Var5;
                c0Var5 = c0Var9;
                if (c0Var5 == null) {
                    break;
                } else {
                    c0Var8 = c0Var5.f15425c;
                }
            }
        } else {
            c0 c0Var10 = c0Var6.f15424b;
            while (true) {
                c0Var2 = c0Var6;
                c0Var6 = c0Var10;
                if (c0Var6 == null) {
                    break;
                } else {
                    c0Var10 = c0Var6.f15424b;
                }
            }
            c0Var3 = c0Var2;
        }
        c(c0Var3, false);
        c0 c0Var11 = c0Var.f15424b;
        if (c0Var11 != null) {
            i5 = c0Var11.f15431i;
            c0Var3.f15424b = c0Var11;
            c0Var11.f15423a = c0Var3;
            c0Var.f15424b = null;
        } else {
            i5 = 0;
        }
        c0 c0Var12 = c0Var.f15425c;
        if (c0Var12 != null) {
            i11 = c0Var12.f15431i;
            c0Var3.f15425c = c0Var12;
            c0Var12.f15423a = c0Var3;
            c0Var.f15425c = null;
        }
        c0Var3.f15431i = Math.max(i5, i11) + 1;
        d(c0Var, c0Var3);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        Arrays.fill(this.f15441b, (Object) null);
        this.f15443d = 0;
        this.f15444e++;
        c0 c0Var = this.f15442c;
        c0 c0Var2 = c0Var.f15426d;
        while (c0Var2 != c0Var) {
            c0 c0Var3 = c0Var2.f15426d;
            c0Var2.f15427e = null;
            c0Var2.f15426d = null;
            c0Var2 = c0Var3;
        }
        c0Var.f15427e = c0Var;
        c0Var.f15426d = c0Var;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        c0 c0VarA = null;
        if (obj != null) {
            try {
                c0VarA = a(obj, false);
            } catch (ClassCastException unused) {
            }
        }
        return c0VarA != null;
    }

    public final void d(c0 c0Var, c0 c0Var2) {
        c0 c0Var3 = c0Var.f15423a;
        c0Var.f15423a = null;
        if (c0Var2 != null) {
            c0Var2.f15423a = c0Var3;
        }
        if (c0Var3 == null) {
            int i5 = c0Var.f15429g;
            this.f15441b[i5 & (r0.length - 1)] = c0Var2;
        } else if (c0Var3.f15424b == c0Var) {
            c0Var3.f15424b = c0Var2;
        } else {
            c0Var3.f15425c = c0Var2;
        }
    }

    public final void e(c0 c0Var) {
        c0 c0Var2 = c0Var.f15424b;
        c0 c0Var3 = c0Var.f15425c;
        c0 c0Var4 = c0Var3.f15424b;
        c0 c0Var5 = c0Var3.f15425c;
        c0Var.f15425c = c0Var4;
        if (c0Var4 != null) {
            c0Var4.f15423a = c0Var;
        }
        d(c0Var, c0Var3);
        c0Var3.f15424b = c0Var;
        c0Var.f15423a = c0Var3;
        int iMax = Math.max(c0Var2 != null ? c0Var2.f15431i : 0, c0Var4 != null ? c0Var4.f15431i : 0) + 1;
        c0Var.f15431i = iMax;
        c0Var3.f15431i = Math.max(iMax, c0Var5 != null ? c0Var5.f15431i : 0) + 1;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        a0 a0Var = this.f15446g;
        if (a0Var != null) {
            return a0Var;
        }
        a0 a0Var2 = new a0(this, 0);
        this.f15446g = a0Var2;
        return a0Var2;
    }

    public final void f(c0 c0Var) {
        c0 c0Var2 = c0Var.f15424b;
        c0 c0Var3 = c0Var.f15425c;
        c0 c0Var4 = c0Var2.f15424b;
        c0 c0Var5 = c0Var2.f15425c;
        c0Var.f15424b = c0Var5;
        if (c0Var5 != null) {
            c0Var5.f15423a = c0Var;
        }
        d(c0Var, c0Var2);
        c0Var2.f15425c = c0Var;
        c0Var.f15423a = c0Var2;
        int iMax = Math.max(c0Var3 != null ? c0Var3.f15431i : 0, c0Var5 != null ? c0Var5.f15431i : 0) + 1;
        c0Var.f15431i = iMax;
        c0Var2.f15431i = Math.max(iMax, c0Var4 != null ? c0Var4.f15431i : 0) + 1;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        c0 c0VarA;
        if (obj != null) {
            try {
                c0VarA = a(obj, false);
            } catch (ClassCastException unused) {
            }
        } else {
            c0VarA = null;
        }
        if (c0VarA != null) {
            return c0VarA.f15430h;
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set keySet() {
        a0 a0Var = this.f15447h;
        if (a0Var != null) {
            return a0Var;
        }
        a0 a0Var2 = new a0(this, 1);
        this.f15447h = a0Var2;
        return a0Var2;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object put(Object obj, Object obj2) {
        if (obj == null) {
            throw new NullPointerException("key == null");
        }
        c0 c0VarA = a(obj, true);
        Object obj3 = c0VarA.f15430h;
        c0VarA.f15430h = obj2;
        return obj3;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        c0 c0VarA;
        if (obj != null) {
            try {
                c0VarA = a(obj, false);
            } catch (ClassCastException unused) {
            }
        } else {
            c0VarA = null;
        }
        if (c0VarA != null) {
            c(c0VarA, true);
        }
        if (c0VarA != null) {
            return c0VarA.f15430h;
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        return this.f15443d;
    }
}
