package defpackage;

import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.google.gson.stream.MalformedJsonException;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class od6 extends gd6 {
    public static final kd6 t = new kd6();
    public static final Object u = new Object();
    public Object[] p;
    public int q;
    public String[] r;
    public int[] s;

    public od6(dc6 dc6Var) {
        super(t);
        this.p = new Object[32];
        this.q = 0;
        this.r = new String[32];
        this.s = new int[32];
        R0(dc6Var);
    }

    @Override // defpackage.gd6
    public final void D() {
        L0(jd6.END_ARRAY);
        Q0();
        Q0();
        int i = this.q;
        if (i > 0) {
            int[] iArr = this.s;
            int i2 = i - 1;
            iArr[i2] = iArr[i2] + 1;
        }
    }

    @Override // defpackage.gd6
    public final void I() {
        L0(jd6.END_OBJECT);
        this.r[this.q - 1] = null;
        Q0();
        Q0();
        int i = this.q;
        if (i > 0) {
            int[] iArr = this.s;
            int i2 = i - 1;
            iArr[i2] = iArr[i2] + 1;
        }
    }

    public final void L0(jd6 jd6Var) {
        if (p0() == jd6Var) {
            return;
        }
        StringBuilder sb = new StringBuilder("Expected ");
        sb.append(jd6Var);
        sb.append(" but was ");
        sb.append(p0());
        lg8.v(sb, N0());
    }

    public final String M0(boolean z) {
        StringBuilder sb = new StringBuilder("$");
        int i = 0;
        while (true) {
            int i2 = this.q;
            if (i >= i2) {
                return sb.toString();
            }
            Object[] objArr = this.p;
            Object obj = objArr[i];
            if (obj instanceof pb6) {
                i++;
                if (i < i2 && (objArr[i] instanceof Iterator)) {
                    int i3 = this.s[i];
                    if (z && i3 > 0 && (i == i2 - 1 || i == i2 - 2)) {
                        i3--;
                    }
                    sb.append('[');
                    sb.append(i3);
                    sb.append(']');
                }
            } else if ((obj instanceof uc6) && (i = i + 1) < i2 && (objArr[i] instanceof Iterator)) {
                sb.append('.');
                String str = this.r[i];
                if (str != null) {
                    sb.append(str);
                }
            }
            i++;
        }
    }

    @Override // defpackage.gd6
    public final String N() {
        return M0(false);
    }

    public final String N0() {
        return " at path ".concat(M0(false));
    }

    public final Object P0() {
        return this.p[this.q - 1];
    }

    public final Object Q0() {
        Object[] objArr = this.p;
        int i = this.q - 1;
        this.q = i;
        Object obj = objArr[i];
        objArr[i] = null;
        return obj;
    }

    @Override // defpackage.gd6
    public final String R() {
        return M0(true);
    }

    public final void R0(Object obj) {
        int i = this.q;
        Object[] objArr = this.p;
        if (i == objArr.length) {
            int i2 = i * 2;
            this.p = Arrays.copyOf(objArr, i2);
            this.s = Arrays.copyOf(this.s, i2);
            this.r = (String[]) Arrays.copyOf(this.r, i2);
        }
        Object[] objArr2 = this.p;
        int i3 = this.q;
        this.q = i3 + 1;
        objArr2[i3] = obj;
    }

    @Override // defpackage.gd6
    public final String X() {
        return O0(false);
    }

    @Override // defpackage.gd6
    public final void a0() {
        L0(jd6.NULL);
        Q0();
        int i = this.q;
        if (i > 0) {
            int[] iArr = this.s;
            int i2 = i - 1;
            iArr[i2] = iArr[i2] + 1;
        }
    }

    @Override // defpackage.gd6, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.p = new Object[]{u};
        this.q = 1;
    }

    @Override // defpackage.gd6
    public final void f() {
        L0(jd6.BEGIN_ARRAY);
        R0(((pb6) P0()).a.iterator());
        this.s[this.q - 1] = 0;
    }

    @Override // defpackage.gd6
    public final boolean hasNext() {
        jd6 jd6VarP0 = p0();
        return (jd6VarP0 == jd6.END_OBJECT || jd6VarP0 == jd6.END_ARRAY || jd6VarP0 == jd6.END_DOCUMENT) ? false : true;
    }

    @Override // defpackage.gd6
    public final void m() {
        L0(jd6.BEGIN_OBJECT);
        R0(((z07) ((uc6) P0()).a.entrySet()).iterator());
    }

    @Override // defpackage.gd6
    public final boolean nextBoolean() {
        L0(jd6.BOOLEAN);
        boolean zQ = ((zc6) Q0()).q();
        int i = this.q;
        if (i > 0) {
            int[] iArr = this.s;
            int i2 = i - 1;
            iArr[i2] = iArr[i2] + 1;
        }
        return zQ;
    }

    @Override // defpackage.gd6
    public final double nextDouble() throws MalformedJsonException {
        jd6 jd6VarP0 = p0();
        jd6 jd6Var = jd6.NUMBER;
        if (jd6VarP0 != jd6Var && jd6VarP0 != jd6.STRING) {
            StringBuilder sb = new StringBuilder("Expected ");
            sb.append(jd6Var);
            sb.append(" but was ");
            sb.append(jd6VarP0);
            lg8.v(sb, N0());
            return 0.0d;
        }
        double dR = ((zc6) P0()).r();
        if (this.b != euc.LENIENT && (Double.isNaN(dR) || Double.isInfinite(dR))) {
            throw new MalformedJsonException("JSON forbids NaN and infinities: " + dR);
        }
        Q0();
        int i = this.q;
        if (i > 0) {
            int[] iArr = this.s;
            int i2 = i - 1;
            iArr[i2] = iArr[i2] + 1;
        }
        return dR;
    }

    @Override // defpackage.gd6
    public final int nextInt() {
        jd6 jd6VarP0 = p0();
        jd6 jd6Var = jd6.NUMBER;
        if (jd6VarP0 != jd6Var && jd6VarP0 != jd6.STRING) {
            StringBuilder sb = new StringBuilder("Expected ");
            sb.append(jd6Var);
            sb.append(" but was ");
            sb.append(jd6VarP0);
            lg8.v(sb, N0());
            return 0;
        }
        int iD = ((zc6) P0()).d();
        Q0();
        int i = this.q;
        if (i > 0) {
            int[] iArr = this.s;
            int i2 = i - 1;
            iArr[i2] = iArr[i2] + 1;
        }
        return iD;
    }

    @Override // defpackage.gd6
    public final long nextLong() {
        jd6 jd6VarP0 = p0();
        jd6 jd6Var = jd6.NUMBER;
        if (jd6VarP0 != jd6Var && jd6VarP0 != jd6.STRING) {
            StringBuilder sb = new StringBuilder("Expected ");
            sb.append(jd6Var);
            sb.append(" but was ");
            sb.append(jd6VarP0);
            lg8.v(sb, N0());
            return 0L;
        }
        long jF = ((zc6) P0()).f();
        Q0();
        int i = this.q;
        if (i > 0) {
            int[] iArr = this.s;
            int i2 = i - 1;
            iArr[i2] = iArr[i2] + 1;
        }
        return jF;
    }

    @Override // defpackage.gd6
    public final jd6 p0() {
        if (this.q == 0) {
            return jd6.END_DOCUMENT;
        }
        Object objP0 = P0();
        if (objP0 instanceof Iterator) {
            boolean z = this.p[this.q - 2] instanceof uc6;
            Iterator it2 = (Iterator) objP0;
            if (!it2.hasNext()) {
                return z ? jd6.END_OBJECT : jd6.END_ARRAY;
            }
            if (z) {
                return jd6.NAME;
            }
            R0(it2.next());
            return p0();
        }
        if (objP0 instanceof uc6) {
            return jd6.BEGIN_OBJECT;
        }
        if (objP0 instanceof pb6) {
            return jd6.BEGIN_ARRAY;
        }
        if (objP0 instanceof zc6) {
            Serializable serializable = ((zc6) objP0).a;
            if (serializable instanceof String) {
                return jd6.STRING;
            }
            if (serializable instanceof Boolean) {
                return jd6.BOOLEAN;
            }
            if (serializable instanceof Number) {
                return jd6.NUMBER;
            }
            ywb.d();
            return null;
        }
        if (objP0 instanceof pc6) {
            return jd6.NULL;
        }
        if (objP0 == u) {
            ygf.f("JsonReader is closed");
            return null;
        }
        throw new MalformedJsonException("Custom JsonElement subclass " + objP0.getClass().getName() + " is not supported");
    }

    @Override // defpackage.gd6
    public final String q() {
        jd6 jd6VarP0 = p0();
        jd6 jd6Var = jd6.STRING;
        if (jd6VarP0 != jd6Var && jd6VarP0 != jd6.NUMBER) {
            StringBuilder sb = new StringBuilder("Expected ");
            sb.append(jd6Var);
            sb.append(" but was ");
            sb.append(jd6VarP0);
            lg8.v(sb, N0());
            return null;
        }
        String strM = ((zc6) Q0()).m();
        int i = this.q;
        if (i > 0) {
            int[] iArr = this.s;
            int i2 = i - 1;
            iArr[i2] = iArr[i2] + 1;
        }
        return strM;
    }

    @Override // defpackage.gd6
    public final String toString() {
        return od6.class.getSimpleName().concat(N0());
    }

    @Override // defpackage.gd6
    public final void v() {
        int i = ld6.a[p0().ordinal()];
        if (i == 1) {
            O0(true);
            return;
        }
        if (i == 2) {
            D();
            return;
        }
        if (i == 3) {
            I();
            return;
        }
        if (i != 4) {
            Q0();
            int i2 = this.q;
            if (i2 > 0) {
                int[] iArr = this.s;
                int i3 = i2 - 1;
                iArr[i3] = iArr[i3] + 1;
            }
        }
    }

    public final String O0(boolean z) {
        L0(jd6.NAME);
        Map.Entry entry = (Map.Entry) ((Iterator) P0()).next();
        String str = (String) entry.getKey();
        this.r[this.q - 1] = z ? aJzfoQ.KfxgAMBpS : str;
        R0(entry.getValue());
        return str;
    }
}
