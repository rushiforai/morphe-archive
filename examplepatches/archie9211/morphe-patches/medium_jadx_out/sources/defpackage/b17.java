package defpackage;

import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.AbstractMap;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b17 extends AbstractMap implements Serializable {
    public static final js4 i = new js4(25);
    public final boolean b;
    public a17 c;
    public final a17 f;
    public z07 g;
    public z07 h;
    public int d = 0;
    public int e = 0;
    public final Comparator a = i;

    public b17(boolean z) {
        this.b = z;
        this.f = new a17(z);
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization is unsupported");
    }

    private Object writeReplace() {
        return new LinkedHashMap(this);
    }

    public final a17 a(Object obj, boolean z) {
        int iCompareTo;
        a17 a17Var;
        a17 a17Var2 = this.c;
        js4 js4Var = i;
        Comparator comparator = this.a;
        if (a17Var2 != null) {
            Comparable comparable = comparator == js4Var ? (Comparable) obj : null;
            while (true) {
                Object obj2 = a17Var2.f;
                iCompareTo = comparable != null ? comparable.compareTo(obj2) : comparator.compare(obj, obj2);
                if (iCompareTo == 0) {
                    return a17Var2;
                }
                a17 a17Var3 = iCompareTo < 0 ? a17Var2.b : a17Var2.c;
                if (a17Var3 == null) {
                    break;
                }
                a17Var2 = a17Var3;
            }
        } else {
            iCompareTo = 0;
        }
        a17 a17Var4 = a17Var2;
        if (!z) {
            return null;
        }
        a17 a17Var5 = this.f;
        if (a17Var4 != null) {
            a17Var = new a17(this.b, a17Var4, obj, a17Var5, a17Var5.e);
            if (iCompareTo < 0) {
                a17Var4.b = a17Var;
            } else {
                a17Var4.c = a17Var;
            }
            b(a17Var4, true);
        } else {
            if (comparator == js4Var && !(obj instanceof Comparable)) {
                throw new ClassCastException(obj.getClass().getName().concat(" is not Comparable"));
            }
            a17Var = new a17(this.b, a17Var4, obj, a17Var5, a17Var5.e);
            this.c = a17Var;
        }
        this.d++;
        this.e++;
        return a17Var;
    }

    public final void b(a17 a17Var, boolean z) {
        while (a17Var != null) {
            a17 a17Var2 = a17Var.b;
            a17 a17Var3 = a17Var.c;
            int i2 = a17Var2 != null ? a17Var2.i : 0;
            int i3 = a17Var3 != null ? a17Var3.i : 0;
            int i4 = i2 - i3;
            if (i4 == -2) {
                a17 a17Var4 = a17Var3.b;
                a17 a17Var5 = a17Var3.c;
                int i5 = (a17Var4 != null ? a17Var4.i : 0) - (a17Var5 != null ? a17Var5.i : 0);
                if (i5 == -1 || (i5 == 0 && !z)) {
                    f(a17Var);
                } else {
                    g(a17Var3);
                    f(a17Var);
                }
                if (z) {
                    return;
                }
            } else if (i4 == 2) {
                a17 a17Var6 = a17Var2.b;
                a17 a17Var7 = a17Var2.c;
                int i6 = (a17Var6 != null ? a17Var6.i : 0) - (a17Var7 != null ? a17Var7.i : 0);
                if (i6 == 1 || (i6 == 0 && !z)) {
                    g(a17Var);
                } else {
                    f(a17Var2);
                    g(a17Var);
                }
                if (z) {
                    return;
                }
            } else if (i4 == 0) {
                a17Var.i = i2 + 1;
                if (z) {
                    return;
                }
            } else {
                a17Var.i = Math.max(i2, i3) + 1;
                if (!z) {
                    return;
                }
            }
            a17Var = a17Var.a;
        }
    }

    public final void c(a17 a17Var, boolean z) {
        a17 a17Var2;
        a17 a17Var3;
        int i2;
        if (z) {
            a17 a17Var4 = a17Var.e;
            a17Var4.d = a17Var.d;
            a17Var.d.e = a17Var4;
        }
        a17 a17Var5 = a17Var.b;
        a17 a17Var6 = a17Var.c;
        a17 a17Var7 = a17Var.a;
        int i3 = 0;
        if (a17Var5 == null || a17Var6 == null) {
            if (a17Var5 != null) {
                d(a17Var, a17Var5);
                a17Var.b = null;
            } else if (a17Var6 != null) {
                d(a17Var, a17Var6);
                a17Var.c = null;
            } else {
                d(a17Var, null);
            }
            b(a17Var7, false);
            this.d--;
            this.e++;
            return;
        }
        if (a17Var5.i > a17Var6.i) {
            a17 a17Var8 = a17Var5.c;
            while (true) {
                a17 a17Var9 = a17Var8;
                a17Var3 = a17Var5;
                a17Var5 = a17Var9;
                if (a17Var5 == null) {
                    break;
                } else {
                    a17Var8 = a17Var5.c;
                }
            }
        } else {
            a17 a17Var10 = a17Var6.b;
            while (true) {
                a17Var2 = a17Var6;
                a17Var6 = a17Var10;
                if (a17Var6 == null) {
                    break;
                } else {
                    a17Var10 = a17Var6.b;
                }
            }
            a17Var3 = a17Var2;
        }
        c(a17Var3, false);
        a17 a17Var11 = a17Var.b;
        if (a17Var11 != null) {
            i2 = a17Var11.i;
            a17Var3.b = a17Var11;
            a17Var11.a = a17Var3;
            a17Var.b = null;
        } else {
            i2 = 0;
        }
        a17 a17Var12 = a17Var.c;
        if (a17Var12 != null) {
            i3 = a17Var12.i;
            a17Var3.c = a17Var12;
            a17Var12.a = a17Var3;
            a17Var.c = null;
        }
        a17Var3.i = Math.max(i2, i3) + 1;
        d(a17Var, a17Var3);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        this.c = null;
        this.d = 0;
        this.e++;
        a17 a17Var = this.f;
        a17Var.e = a17Var;
        a17Var.d = a17Var;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        a17 a17VarA = null;
        if (obj != null) {
            try {
                a17VarA = a(obj, false);
            } catch (ClassCastException unused) {
            }
        }
        return a17VarA != null;
    }

    public final void d(a17 a17Var, a17 a17Var2) {
        a17 a17Var3 = a17Var.a;
        a17Var.a = null;
        if (a17Var2 != null) {
            a17Var2.a = a17Var3;
        }
        if (a17Var3 == null) {
            this.c = a17Var2;
        } else if (a17Var3.b == a17Var) {
            a17Var3.b = a17Var2;
        } else {
            a17Var3.c = a17Var2;
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        z07 z07Var = this.g;
        if (z07Var != null) {
            return z07Var;
        }
        z07 z07Var2 = new z07(this, 0);
        this.g = z07Var2;
        return z07Var2;
    }

    public final void f(a17 a17Var) {
        a17 a17Var2 = a17Var.b;
        a17 a17Var3 = a17Var.c;
        a17 a17Var4 = a17Var3.b;
        a17 a17Var5 = a17Var3.c;
        a17Var.c = a17Var4;
        if (a17Var4 != null) {
            a17Var4.a = a17Var;
        }
        d(a17Var, a17Var3);
        a17Var3.b = a17Var;
        a17Var.a = a17Var3;
        int iMax = Math.max(a17Var2 != null ? a17Var2.i : 0, a17Var4 != null ? a17Var4.i : 0) + 1;
        a17Var.i = iMax;
        a17Var3.i = Math.max(iMax, a17Var5 != null ? a17Var5.i : 0) + 1;
    }

    public final void g(a17 a17Var) {
        a17 a17Var2 = a17Var.b;
        a17 a17Var3 = a17Var.c;
        a17 a17Var4 = a17Var2.b;
        a17 a17Var5 = a17Var2.c;
        a17Var.b = a17Var5;
        if (a17Var5 != null) {
            a17Var5.a = a17Var;
        }
        d(a17Var, a17Var2);
        a17Var2.c = a17Var;
        a17Var.a = a17Var2;
        int iMax = Math.max(a17Var3 != null ? a17Var3.i : 0, a17Var5 != null ? a17Var5.i : 0) + 1;
        a17Var.i = iMax;
        a17Var2.i = Math.max(iMax, a17Var4 != null ? a17Var4.i : 0) + 1;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        a17 a17VarA;
        if (obj != null) {
            try {
                a17VarA = a(obj, false);
            } catch (ClassCastException unused) {
                a17VarA = null;
            }
        } else {
            a17VarA = null;
        }
        if (a17VarA != null) {
            return a17VarA.h;
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set keySet() {
        z07 z07Var = this.h;
        if (z07Var != null) {
            return z07Var;
        }
        z07 z07Var2 = new z07(this, 1);
        this.h = z07Var2;
        return z07Var2;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object put(Object obj, Object obj2) {
        if (obj == null) {
            z72.c("key == null");
            return null;
        }
        if (obj2 == null && !this.b) {
            z72.c("value == null");
            return null;
        }
        a17 a17VarA = a(obj, true);
        Object obj3 = a17VarA.h;
        a17VarA.h = obj2;
        return obj3;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        a17 a17VarA;
        if (obj != null) {
            try {
                a17VarA = a(obj, false);
            } catch (ClassCastException unused) {
                a17VarA = null;
            }
        } else {
            a17VarA = null;
        }
        if (a17VarA != null) {
            c(a17VarA, true);
        }
        if (a17VarA != null) {
            return a17VarA.h;
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        return this.d;
    }
}
