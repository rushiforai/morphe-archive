package aq;

import androidx.compose.ui.node.LayoutNode;
import com.google.android.gms.internal.measurement.c2;
import com.google.android.gms.internal.measurement.e1;
import com.google.android.gms.internal.measurement.f2;
import com.google.android.gms.internal.measurement.g3;
import com.google.android.gms.internal.measurement.o1;
import com.google.android.gms.internal.measurement.p1;
import com.google.android.gms.internal.measurement.q2;
import com.google.android.gms.internal.measurement.t2;
import com.google.android.gms.internal.measurement.v0;
import com.google.android.gms.internal.measurement.y0;
import com.google.android.gms.internal.measurement.y1;
import com.google.android.gms.internal.measurement.zzaeg;
import com.google.android.gms.internal.measurement.zzaeh;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15536a;

    /* renamed from: b, reason: collision with root package name */
    public int f15537b;

    /* renamed from: c, reason: collision with root package name */
    public int f15538c;

    /* renamed from: d, reason: collision with root package name */
    public int f15539d;

    /* renamed from: e, reason: collision with root package name */
    public Object f15540e;

    public /* synthetic */ y() {
        this.f15536a = 0;
    }

    public static final void C(int i5) throws zzaeh {
        if ((i5 & 3) != 0) {
            throw new zzaeh("Failed to parse the message.");
        }
    }

    public static final void D(int i5) throws zzaeh {
        if ((i5 & 7) != 0) {
            throw new zzaeh("Failed to parse the message.");
        }
    }

    public Object A(g3 g3Var, Class cls, e1 e1Var) throws zzaeh {
        y0 y0Var = (y0) this.f15540e;
        g3 g3Var2 = g3.f32555c;
        switch (g3Var.ordinal()) {
            case 0:
                x(1);
                return Double.valueOf(y0Var.o());
            case 1:
                x(5);
                return Float.valueOf(y0Var.p());
            case 2:
                x(0);
                return Long.valueOf(y0Var.r());
            case 3:
                x(0);
                return Long.valueOf(y0Var.q());
            case 4:
                x(0);
                return Integer.valueOf(y0Var.s());
            case 5:
                x(1);
                return Long.valueOf(y0Var.t());
            case 6:
                x(5);
                return Integer.valueOf(y0Var.u());
            case 7:
                x(0);
                return Boolean.valueOf(y0Var.v());
            case 8:
                x(2);
                return y0Var.x();
            case 9:
            default:
                throw new IllegalArgumentException("unsupported field type.");
            case 10:
                x(2);
                t2 t2VarA = q2.f32981c.a(cls);
                o1 o1VarZza = t2VarA.zza();
                y(o1VarZza, t2VarA, e1Var);
                t2VarA.a(o1VarZza);
                return o1VarZza;
            case 11:
                return F();
            case 12:
                x(0);
                return Integer.valueOf(y0Var.A());
            case 13:
                x(0);
                return Integer.valueOf(y0Var.B());
            case 14:
                x(5);
                return Integer.valueOf(y0Var.C());
            case 15:
                x(1);
                return Long.valueOf(y0Var.D());
            case 16:
                x(0);
                return Integer.valueOf(y0Var.E());
            case 17:
                x(0);
                return Long.valueOf(y0Var.F());
        }
    }

    public void B(int i5) throws zzaeh {
        if (((y0) this.f15540e).e() != i5) {
            throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
    }

    public int E() {
        int iL = this.f15539d;
        if (iL != 0) {
            this.f15537b = iL;
            this.f15539d = 0;
        } else {
            iL = ((y0) this.f15540e).l();
            this.f15537b = iL;
        }
        return (iL == 0 || iL == this.f15538c) ? LayoutNode.NotPlacedPlaceOrder : iL >>> 3;
    }

    public v0 F() {
        x(2);
        return ((y0) this.f15540e).y();
    }

    public void G(y1 y1Var) throws zzaeh {
        int iL;
        y0 y0Var = (y0) this.f15540e;
        int i5 = this.f15537b & 7;
        if (i5 == 1) {
            do {
                y1Var.add(Double.valueOf(y0Var.o()));
                if (y0Var.d()) {
                    return;
                } else {
                    iL = y0Var.l();
                }
            } while (iL == this.f15537b);
            this.f15539d = iL;
            return;
        }
        if (i5 != 2) {
            throw new zzaeg();
        }
        int iA = y0Var.A();
        D(iA);
        int iE = y0Var.e() + iA;
        do {
            y1Var.add(Double.valueOf(y0Var.o()));
        } while (y0Var.e() < iE);
    }

    public void H(y1 y1Var) throws zzaeh {
        int iL;
        y0 y0Var = (y0) this.f15540e;
        int i5 = this.f15537b & 7;
        if (i5 == 2) {
            int iA = y0Var.A();
            C(iA);
            int iE = y0Var.e() + iA;
            do {
                y1Var.add(Float.valueOf(y0Var.p()));
            } while (y0Var.e() < iE);
            return;
        }
        if (i5 != 5) {
            throw new zzaeg();
        }
        do {
            y1Var.add(Float.valueOf(y0Var.p()));
            if (y0Var.d()) {
                return;
            } else {
                iL = y0Var.l();
            }
        } while (iL == this.f15537b);
        this.f15539d = iL;
    }

    public void I(y1 y1Var) throws zzaeh {
        int iL;
        int iL2;
        y0 y0Var = (y0) this.f15540e;
        if (y1Var instanceof c2) {
            c2 c2Var = (c2) y1Var;
            int i5 = this.f15537b & 7;
            if (i5 != 0) {
                if (i5 != 2) {
                    throw new zzaeg();
                }
                int iE = y0Var.e() + y0Var.A();
                do {
                    c2Var.g(y0Var.q());
                } while (y0Var.e() < iE);
                B(iE);
                return;
            }
            do {
                c2Var.g(y0Var.q());
                if (y0Var.d()) {
                    return;
                } else {
                    iL2 = y0Var.l();
                }
            } while (iL2 == this.f15537b);
        } else {
            int i11 = this.f15537b & 7;
            if (i11 != 0) {
                if (i11 != 2) {
                    throw new zzaeg();
                }
                int iE2 = y0Var.e() + y0Var.A();
                do {
                    y1Var.add(Long.valueOf(y0Var.q()));
                } while (y0Var.e() < iE2);
                B(iE2);
                return;
            }
            do {
                y1Var.add(Long.valueOf(y0Var.q()));
                if (y0Var.d()) {
                    return;
                } else {
                    iL = y0Var.l();
                }
            } while (iL == this.f15537b);
            iL2 = iL;
        }
        this.f15539d = iL2;
    }

    public void a(c0 c0Var) {
        c0Var.f15425c = null;
        c0Var.f15423a = null;
        c0Var.f15424b = null;
        c0Var.f15431i = 1;
        int i5 = this.f15537b;
        if (i5 > 0) {
            int i11 = this.f15539d;
            if ((i11 & 1) == 0) {
                this.f15539d = i11 + 1;
                this.f15537b = i5 - 1;
                this.f15538c++;
            }
        }
        c0Var.f15423a = (c0) this.f15540e;
        this.f15540e = c0Var;
        int i12 = this.f15539d;
        int i13 = i12 + 1;
        this.f15539d = i13;
        int i14 = this.f15537b;
        if (i14 > 0 && (i13 & 1) == 0) {
            this.f15539d = i12 + 2;
            this.f15537b = i14 - 1;
            this.f15538c++;
        }
        int i15 = 4;
        while (true) {
            int i16 = i15 - 1;
            if ((this.f15539d & i16) != i16) {
                return;
            }
            int i17 = this.f15538c;
            if (i17 == 0) {
                c0 c0Var2 = (c0) this.f15540e;
                c0 c0Var3 = c0Var2.f15423a;
                c0 c0Var4 = c0Var3.f15423a;
                c0Var3.f15423a = c0Var4.f15423a;
                this.f15540e = c0Var3;
                c0Var3.f15424b = c0Var4;
                c0Var3.f15425c = c0Var2;
                c0Var3.f15431i = c0Var2.f15431i + 1;
                c0Var4.f15423a = c0Var3;
                c0Var2.f15423a = c0Var3;
            } else if (i17 == 1) {
                c0 c0Var5 = (c0) this.f15540e;
                c0 c0Var6 = c0Var5.f15423a;
                this.f15540e = c0Var6;
                c0Var6.f15425c = c0Var5;
                c0Var6.f15431i = c0Var5.f15431i + 1;
                c0Var5.f15423a = c0Var6;
                this.f15538c = 0;
            } else if (i17 == 2) {
                this.f15538c = 0;
            }
            i15 *= 2;
        }
    }

    public e1.r b(int i5) {
        return new e1.r(jk.b.F((m3.l0) this.f15540e, i5), i5, 1L);
    }

    public void c(StringBuilder sb2) {
        sb2.append((char[]) this.f15540e, 0, this.f15538c);
        char[] cArr = (char[]) this.f15540e;
        int i5 = this.f15539d;
        sb2.append(cArr, i5, this.f15537b - i5);
    }

    public int d() {
        return this.f15539d - this.f15538c;
    }

    public char e(int i5) {
        int i11 = this.f15538c;
        return i5 < i11 ? ((char[]) this.f15540e)[i5] : ((char[]) this.f15540e)[(i5 - i11) + this.f15539d];
    }

    public int f() {
        return this.f15537b - d();
    }

    public void g(int i5, int i11, String str) {
        int length = str.length() - (i11 - i5);
        if (length > d()) {
            int iD = length - d();
            int i12 = this.f15537b;
            do {
                i12 *= 2;
            } while (i12 - this.f15537b < iD);
            char[] cArr = new char[i12];
            u90.b.r((char[]) this.f15540e, cArr, 0, 0, this.f15538c);
            int i13 = this.f15537b;
            int i14 = this.f15539d;
            int i15 = i13 - i14;
            int i16 = i12 - i15;
            u90.b.r((char[]) this.f15540e, cArr, i16, i14, i15 + i14);
            this.f15540e = cArr;
            this.f15537b = i12;
            this.f15539d = i16;
        }
        int i17 = this.f15538c;
        if (i5 < i17 && i11 <= i17) {
            int i18 = i17 - i11;
            char[] cArr2 = (char[]) this.f15540e;
            u90.b.r(cArr2, cArr2, this.f15539d - i18, i11, i17);
            this.f15538c = i5;
            this.f15539d -= i18;
        } else if (i5 >= i17 || i11 < i17) {
            int iD2 = d() + i5;
            int iD3 = d() + i11;
            int i19 = this.f15539d;
            char[] cArr3 = (char[]) this.f15540e;
            u90.b.r(cArr3, cArr3, this.f15538c, i19, iD2);
            this.f15538c += iD2 - i19;
            this.f15539d = iD3;
        } else {
            this.f15539d = d() + i11;
            this.f15538c = i5;
        }
        ps.j0.t(str, (char[]) this.f15540e, this.f15538c, 0, str.length());
        this.f15538c = str.length() + this.f15538c;
    }

    public void h(y1 y1Var) throws zzaeh {
        int iL;
        int iL2;
        y0 y0Var = (y0) this.f15540e;
        if (y1Var instanceof c2) {
            c2 c2Var = (c2) y1Var;
            int i5 = this.f15537b & 7;
            if (i5 != 0) {
                if (i5 != 2) {
                    throw new zzaeg();
                }
                int iE = y0Var.e() + y0Var.A();
                do {
                    c2Var.g(y0Var.r());
                } while (y0Var.e() < iE);
                B(iE);
                return;
            }
            do {
                c2Var.g(y0Var.r());
                if (y0Var.d()) {
                    return;
                } else {
                    iL2 = y0Var.l();
                }
            } while (iL2 == this.f15537b);
        } else {
            int i11 = this.f15537b & 7;
            if (i11 != 0) {
                if (i11 != 2) {
                    throw new zzaeg();
                }
                int iE2 = y0Var.e() + y0Var.A();
                do {
                    y1Var.add(Long.valueOf(y0Var.r()));
                } while (y0Var.e() < iE2);
                B(iE2);
                return;
            }
            do {
                y1Var.add(Long.valueOf(y0Var.r()));
                if (y0Var.d()) {
                    return;
                } else {
                    iL = y0Var.l();
                }
            } while (iL == this.f15537b);
            iL2 = iL;
        }
        this.f15539d = iL2;
    }

    public void i(y1 y1Var) throws zzaeh {
        int iL;
        int iL2;
        y0 y0Var = (y0) this.f15540e;
        if (y1Var instanceof p1) {
            p1 p1Var = (p1) y1Var;
            int i5 = this.f15537b & 7;
            if (i5 != 0) {
                if (i5 != 2) {
                    throw new zzaeg();
                }
                int iE = y0Var.e() + y0Var.A();
                do {
                    p1Var.zzh(y0Var.s());
                } while (y0Var.e() < iE);
                B(iE);
                return;
            }
            do {
                p1Var.zzh(y0Var.s());
                if (y0Var.d()) {
                    return;
                } else {
                    iL2 = y0Var.l();
                }
            } while (iL2 == this.f15537b);
        } else {
            int i11 = this.f15537b & 7;
            if (i11 != 0) {
                if (i11 != 2) {
                    throw new zzaeg();
                }
                int iE2 = y0Var.e() + y0Var.A();
                do {
                    y1Var.add(Integer.valueOf(y0Var.s()));
                } while (y0Var.e() < iE2);
                B(iE2);
                return;
            }
            do {
                y1Var.add(Integer.valueOf(y0Var.s()));
                if (y0Var.d()) {
                    return;
                } else {
                    iL = y0Var.l();
                }
            } while (iL == this.f15537b);
            iL2 = iL;
        }
        this.f15539d = iL2;
    }

    public void j(y1 y1Var) throws zzaeh {
        int iL;
        int iL2;
        y0 y0Var = (y0) this.f15540e;
        if (y1Var instanceof c2) {
            c2 c2Var = (c2) y1Var;
            int i5 = this.f15537b & 7;
            if (i5 != 1) {
                if (i5 != 2) {
                    throw new zzaeg();
                }
                int iA = y0Var.A();
                D(iA);
                int iE = y0Var.e() + iA;
                do {
                    c2Var.g(y0Var.t());
                } while (y0Var.e() < iE);
                return;
            }
            do {
                c2Var.g(y0Var.t());
                if (y0Var.d()) {
                    return;
                } else {
                    iL2 = y0Var.l();
                }
            } while (iL2 == this.f15537b);
        } else {
            int i11 = this.f15537b & 7;
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new zzaeg();
                }
                int iA2 = y0Var.A();
                D(iA2);
                int iE2 = y0Var.e() + iA2;
                do {
                    y1Var.add(Long.valueOf(y0Var.t()));
                } while (y0Var.e() < iE2);
                return;
            }
            do {
                y1Var.add(Long.valueOf(y0Var.t()));
                if (y0Var.d()) {
                    return;
                } else {
                    iL = y0Var.l();
                }
            } while (iL == this.f15537b);
            iL2 = iL;
        }
        this.f15539d = iL2;
    }

    public void k(y1 y1Var) throws zzaeh {
        int iL;
        int iL2;
        y0 y0Var = (y0) this.f15540e;
        if (y1Var instanceof p1) {
            p1 p1Var = (p1) y1Var;
            int i5 = this.f15537b & 7;
            if (i5 == 2) {
                int iA = y0Var.A();
                C(iA);
                int iE = y0Var.e() + iA;
                do {
                    p1Var.zzh(y0Var.u());
                } while (y0Var.e() < iE);
                return;
            }
            if (i5 != 5) {
                throw new zzaeg();
            }
            do {
                p1Var.zzh(y0Var.u());
                if (y0Var.d()) {
                    return;
                } else {
                    iL2 = y0Var.l();
                }
            } while (iL2 == this.f15537b);
        } else {
            int i11 = this.f15537b & 7;
            if (i11 == 2) {
                int iA2 = y0Var.A();
                C(iA2);
                int iE2 = y0Var.e() + iA2;
                do {
                    y1Var.add(Integer.valueOf(y0Var.u()));
                } while (y0Var.e() < iE2);
                return;
            }
            if (i11 != 5) {
                throw new zzaeg();
            }
            do {
                y1Var.add(Integer.valueOf(y0Var.u()));
                if (y0Var.d()) {
                    return;
                } else {
                    iL = y0Var.l();
                }
            } while (iL == this.f15537b);
            iL2 = iL;
        }
        this.f15539d = iL2;
    }

    public void l(y1 y1Var) throws zzaeh {
        int iL;
        y0 y0Var = (y0) this.f15540e;
        int i5 = this.f15537b & 7;
        if (i5 == 0) {
            do {
                y1Var.add(Boolean.valueOf(y0Var.v()));
                if (y0Var.d()) {
                    return;
                } else {
                    iL = y0Var.l();
                }
            } while (iL == this.f15537b);
            this.f15539d = iL;
            return;
        }
        if (i5 != 2) {
            throw new zzaeg();
        }
        int iE = y0Var.e() + y0Var.A();
        do {
            y1Var.add(Boolean.valueOf(y0Var.v()));
        } while (y0Var.e() < iE);
        B(iE);
    }

    public void m(y1 y1Var, boolean z11) throws zzaeg {
        String strW;
        int iL;
        y0 y0Var = (y0) this.f15540e;
        if ((this.f15537b & 7) != 2) {
            throw new zzaeg();
        }
        do {
            if (z11) {
                x(2);
                strW = y0Var.x();
            } else {
                x(2);
                strW = y0Var.w();
            }
            y1Var.add(strW);
            if (y0Var.d()) {
                return;
            } else {
                iL = y0Var.l();
            }
        } while (iL == this.f15537b);
        this.f15539d = iL;
    }

    public void n(y1 y1Var, t2 t2Var, e1 e1Var) throws zzaeh {
        int iL;
        int i5 = this.f15537b;
        if ((i5 & 7) != 2) {
            throw new zzaeg();
        }
        do {
            o1 o1VarZza = t2Var.zza();
            y(o1VarZza, t2Var, e1Var);
            t2Var.a(o1VarZza);
            y1Var.add(o1VarZza);
            y0 y0Var = (y0) this.f15540e;
            if (y0Var.d() || this.f15539d != 0) {
                return;
            } else {
                iL = y0Var.l();
            }
        } while (iL == i5);
        this.f15539d = iL;
    }

    public void o(y1 y1Var, t2 t2Var, e1 e1Var) throws zzaeg {
        int iL;
        int i5 = this.f15537b;
        if ((i5 & 7) != 3) {
            throw new zzaeg();
        }
        do {
            o1 o1VarZza = t2Var.zza();
            z(o1VarZza, t2Var, e1Var);
            t2Var.a(o1VarZza);
            y1Var.add(o1VarZza);
            y0 y0Var = (y0) this.f15540e;
            if (y0Var.d() || this.f15539d != 0) {
                return;
            } else {
                iL = y0Var.l();
            }
        } while (iL == i5);
        this.f15539d = iL;
    }

    public void p(y1 y1Var) throws zzaeg {
        int iL;
        if ((this.f15537b & 7) != 2) {
            throw new zzaeg();
        }
        do {
            y1Var.add(F());
            y0 y0Var = (y0) this.f15540e;
            if (y0Var.d()) {
                return;
            } else {
                iL = y0Var.l();
            }
        } while (iL == this.f15537b);
        this.f15539d = iL;
    }

    public void q(y1 y1Var) throws zzaeh {
        int iL;
        int iL2;
        y0 y0Var = (y0) this.f15540e;
        if (y1Var instanceof p1) {
            p1 p1Var = (p1) y1Var;
            int i5 = this.f15537b & 7;
            if (i5 != 0) {
                if (i5 != 2) {
                    throw new zzaeg();
                }
                int iE = y0Var.e() + y0Var.A();
                do {
                    p1Var.zzh(y0Var.A());
                } while (y0Var.e() < iE);
                B(iE);
                return;
            }
            do {
                p1Var.zzh(y0Var.A());
                if (y0Var.d()) {
                    return;
                } else {
                    iL2 = y0Var.l();
                }
            } while (iL2 == this.f15537b);
        } else {
            int i11 = this.f15537b & 7;
            if (i11 != 0) {
                if (i11 != 2) {
                    throw new zzaeg();
                }
                int iE2 = y0Var.e() + y0Var.A();
                do {
                    y1Var.add(Integer.valueOf(y0Var.A()));
                } while (y0Var.e() < iE2);
                B(iE2);
                return;
            }
            do {
                y1Var.add(Integer.valueOf(y0Var.A()));
                if (y0Var.d()) {
                    return;
                } else {
                    iL = y0Var.l();
                }
            } while (iL == this.f15537b);
            iL2 = iL;
        }
        this.f15539d = iL2;
    }

    public void r(y1 y1Var) throws zzaeh {
        int iL;
        int iL2;
        y0 y0Var = (y0) this.f15540e;
        if (y1Var instanceof p1) {
            p1 p1Var = (p1) y1Var;
            int i5 = this.f15537b & 7;
            if (i5 != 0) {
                if (i5 != 2) {
                    throw new zzaeg();
                }
                int iE = y0Var.e() + y0Var.A();
                do {
                    p1Var.zzh(y0Var.B());
                } while (y0Var.e() < iE);
                B(iE);
                return;
            }
            do {
                p1Var.zzh(y0Var.B());
                if (y0Var.d()) {
                    return;
                } else {
                    iL2 = y0Var.l();
                }
            } while (iL2 == this.f15537b);
        } else {
            int i11 = this.f15537b & 7;
            if (i11 != 0) {
                if (i11 != 2) {
                    throw new zzaeg();
                }
                int iE2 = y0Var.e() + y0Var.A();
                do {
                    y1Var.add(Integer.valueOf(y0Var.B()));
                } while (y0Var.e() < iE2);
                B(iE2);
                return;
            }
            do {
                y1Var.add(Integer.valueOf(y0Var.B()));
                if (y0Var.d()) {
                    return;
                } else {
                    iL = y0Var.l();
                }
            } while (iL == this.f15537b);
            iL2 = iL;
        }
        this.f15539d = iL2;
    }

    public void s(y1 y1Var) throws zzaeh {
        int iL;
        int iL2;
        y0 y0Var = (y0) this.f15540e;
        if (y1Var instanceof p1) {
            p1 p1Var = (p1) y1Var;
            int i5 = this.f15537b & 7;
            if (i5 == 2) {
                int iA = y0Var.A();
                C(iA);
                int iE = y0Var.e() + iA;
                do {
                    p1Var.zzh(y0Var.C());
                } while (y0Var.e() < iE);
                return;
            }
            if (i5 != 5) {
                throw new zzaeg();
            }
            do {
                p1Var.zzh(y0Var.C());
                if (y0Var.d()) {
                    return;
                } else {
                    iL2 = y0Var.l();
                }
            } while (iL2 == this.f15537b);
        } else {
            int i11 = this.f15537b & 7;
            if (i11 == 2) {
                int iA2 = y0Var.A();
                C(iA2);
                int iE2 = y0Var.e() + iA2;
                do {
                    y1Var.add(Integer.valueOf(y0Var.C()));
                } while (y0Var.e() < iE2);
                return;
            }
            if (i11 != 5) {
                throw new zzaeg();
            }
            do {
                y1Var.add(Integer.valueOf(y0Var.C()));
                if (y0Var.d()) {
                    return;
                } else {
                    iL = y0Var.l();
                }
            } while (iL == this.f15537b);
            iL2 = iL;
        }
        this.f15539d = iL2;
    }

    public void t(y1 y1Var) throws zzaeh {
        int iL;
        int iL2;
        y0 y0Var = (y0) this.f15540e;
        if (y1Var instanceof c2) {
            c2 c2Var = (c2) y1Var;
            int i5 = this.f15537b & 7;
            if (i5 != 1) {
                if (i5 != 2) {
                    throw new zzaeg();
                }
                int iA = y0Var.A();
                D(iA);
                int iE = y0Var.e() + iA;
                do {
                    c2Var.g(y0Var.D());
                } while (y0Var.e() < iE);
                return;
            }
            do {
                c2Var.g(y0Var.D());
                if (y0Var.d()) {
                    return;
                } else {
                    iL2 = y0Var.l();
                }
            } while (iL2 == this.f15537b);
        } else {
            int i11 = this.f15537b & 7;
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new zzaeg();
                }
                int iA2 = y0Var.A();
                D(iA2);
                int iE2 = y0Var.e() + iA2;
                do {
                    y1Var.add(Long.valueOf(y0Var.D()));
                } while (y0Var.e() < iE2);
                return;
            }
            do {
                y1Var.add(Long.valueOf(y0Var.D()));
                if (y0Var.d()) {
                    return;
                } else {
                    iL = y0Var.l();
                }
            } while (iL == this.f15537b);
            iL2 = iL;
        }
        this.f15539d = iL2;
    }

    public String toString() {
        switch (this.f15536a) {
            case 2:
                StringBuilder sb2 = new StringBuilder("SelectionInfo(id=1, range=(");
                int i5 = this.f15537b;
                sb2.append(i5);
                sb2.append('-');
                m3.l0 l0Var = (m3.l0) this.f15540e;
                sb2.append(jk.b.F(l0Var, i5));
                sb2.append(AbstractJsonLexerKt.COMMA);
                int i11 = this.f15538c;
                sb2.append(i11);
                sb2.append('-');
                sb2.append(jk.b.F(l0Var, i11));
                sb2.append("), prevOffset=");
                return a2.c.m(sb2, this.f15539d, ')');
            case 3:
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            default:
                return super.toString();
        }
    }

    public void u(y1 y1Var) throws zzaeh {
        int iL;
        int iL2;
        y0 y0Var = (y0) this.f15540e;
        if (y1Var instanceof p1) {
            p1 p1Var = (p1) y1Var;
            int i5 = this.f15537b & 7;
            if (i5 != 0) {
                if (i5 != 2) {
                    throw new zzaeg();
                }
                int iE = y0Var.e() + y0Var.A();
                do {
                    p1Var.zzh(y0Var.E());
                } while (y0Var.e() < iE);
                B(iE);
                return;
            }
            do {
                p1Var.zzh(y0Var.E());
                if (y0Var.d()) {
                    return;
                } else {
                    iL2 = y0Var.l();
                }
            } while (iL2 == this.f15537b);
        } else {
            int i11 = this.f15537b & 7;
            if (i11 != 0) {
                if (i11 != 2) {
                    throw new zzaeg();
                }
                int iE2 = y0Var.e() + y0Var.A();
                do {
                    y1Var.add(Integer.valueOf(y0Var.E()));
                } while (y0Var.e() < iE2);
                B(iE2);
                return;
            }
            do {
                y1Var.add(Integer.valueOf(y0Var.E()));
                if (y0Var.d()) {
                    return;
                } else {
                    iL = y0Var.l();
                }
            } while (iL == this.f15537b);
            iL2 = iL;
        }
        this.f15539d = iL2;
    }

    public void v(y1 y1Var) throws zzaeh {
        int iL;
        int iL2;
        y0 y0Var = (y0) this.f15540e;
        if (y1Var instanceof c2) {
            c2 c2Var = (c2) y1Var;
            int i5 = this.f15537b & 7;
            if (i5 != 0) {
                if (i5 != 2) {
                    throw new zzaeg();
                }
                int iE = y0Var.e() + y0Var.A();
                do {
                    c2Var.g(y0Var.F());
                } while (y0Var.e() < iE);
                B(iE);
                return;
            }
            do {
                c2Var.g(y0Var.F());
                if (y0Var.d()) {
                    return;
                } else {
                    iL2 = y0Var.l();
                }
            } while (iL2 == this.f15537b);
        } else {
            int i11 = this.f15537b & 7;
            if (i11 != 0) {
                if (i11 != 2) {
                    throw new zzaeg();
                }
                int iE2 = y0Var.e() + y0Var.A();
                do {
                    y1Var.add(Long.valueOf(y0Var.F()));
                } while (y0Var.e() < iE2);
                B(iE2);
                return;
            }
            do {
                y1Var.add(Long.valueOf(y0Var.F()));
                if (y0Var.d()) {
                    return;
                } else {
                    iL = y0Var.l();
                }
            } while (iL == this.f15537b);
            iL2 = iL;
        }
        this.f15539d = iL2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:39:0x007e, code lost:
    
        r12.put(r4, r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0081, code lost:
    
        r1.b(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0084, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void w(f2 f2Var, mg.l lVar, e1 e1Var) {
        int i5;
        int i11;
        x(2);
        y0 y0Var = (y0) this.f15540e;
        int iA = y0Var.a(y0Var.A());
        Object obj = lVar.f76311d;
        Object objA = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        Object objA2 = obj;
        while (true) {
            try {
                int iE = E();
                if (iE == Integer.MAX_VALUE || y0Var.d()) {
                    break;
                }
                boolean zN = false;
                if (iE == 1) {
                    objA = A((g3) lVar.f76309b, null, null);
                } else if (iE != 2) {
                    try {
                        if (!((y0Var.d() || (i11 = this.f15537b) == this.f15538c) ? false : y0Var.n(i11))) {
                            throw new zzaeh("Unable to parse map entry.");
                        }
                    } catch (zzaeg e3) {
                        if (!y0Var.d() && (i5 = this.f15537b) != this.f15538c) {
                            zN = y0Var.n(i5);
                        }
                        if (!zN) {
                            throw new zzaeh("Unable to parse map entry.", e3);
                        }
                    }
                } else {
                    objA2 = A((g3) lVar.f76310c, obj.getClass(), e1Var);
                }
            } catch (Throwable th2) {
                y0Var.b(iA);
                throw th2;
            }
        }
    }

    public void x(int i5) {
        if ((this.f15537b & 7) != i5) {
            throw new zzaeg();
        }
    }

    public void y(Object obj, t2 t2Var, e1 e1Var) throws zzaeh {
        y0 y0Var = (y0) this.f15540e;
        int iA = y0Var.A();
        if (y0Var.f33238a + y0Var.f33239b >= 100) {
            throw new zzaeh("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int iA2 = y0Var.a(iA);
        y0Var.f33238a++;
        t2Var.i(obj, this, e1Var);
        y0Var.m(0);
        y0Var.f33238a--;
        y0Var.b(iA2);
    }

    public void z(Object obj, t2 t2Var, e1 e1Var) {
        int i5 = this.f15538c;
        this.f15538c = ((this.f15537b >>> 3) << 3) | 4;
        try {
            t2Var.i(obj, this, e1Var);
            if (this.f15537b == this.f15538c) {
            } else {
                throw new zzaeh("Failed to parse the message.");
            }
        } finally {
            this.f15538c = i5;
        }
    }

    public y(y0 y0Var) {
        this.f15536a = 1;
        this.f15539d = 0;
        this.f15540e = y0Var;
        y0Var.f33240c = this;
    }

    public y(char[] cArr, int i5, int i11) {
        this.f15536a = 3;
        this.f15537b = cArr.length;
        this.f15540e = cArr;
        this.f15538c = i5;
        this.f15539d = i11;
    }

    public y(int i5, int i11, int i12, m3.l0 l0Var) {
        this.f15536a = 2;
        this.f15537b = i5;
        this.f15538c = i11;
        this.f15539d = i12;
        this.f15540e = l0Var;
    }
}
