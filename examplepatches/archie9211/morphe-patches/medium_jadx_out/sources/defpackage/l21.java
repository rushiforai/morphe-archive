package defpackage;

import androidx.constraintlayout.core.parser.CLParsingException;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class l21 extends m21 {
    public ArrayList e;

    public l21(char[] cArr) {
        super(cArr);
        this.e = new ArrayList();
    }

    public final int A(int i) throws CLParsingException {
        m21 m21VarW = w(i);
        if (m21VarW != null) {
            return m21VarW.r();
        }
        throw new CLParsingException(b09.w(i, "no int at index "), this);
    }

    public final m21 B(int i) {
        if (i < 0 || i >= this.e.size()) {
            return null;
        }
        return (m21) this.e.get(i);
    }

    public final m21 C(String str) {
        Iterator it2 = this.e.iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            n21 n21Var = (n21) ((m21) it2.next());
            if (n21Var.e().equals(str)) {
                if (n21Var.e.size() > 0) {
                    return (m21) n21Var.e.get(0);
                }
            }
        }
        return null;
    }

    public final String D(int i) {
        m21 m21VarW = w(i);
        if (m21VarW instanceof s21) {
            return m21VarW.e();
        }
        throw new CLParsingException(b09.w(i, "no string at index "), this);
    }

    public final String E(String str) {
        m21 m21VarX = x(str);
        if (m21VarX instanceof s21) {
            return m21VarX.e();
        }
        StringBuilder sbU = y30.u("no string found for key <", str, ">, found [", m21VarX != null ? m21VarX.s() : null, "] : ");
        sbU.append(m21VarX);
        throw new CLParsingException(sbU.toString(), this);
    }

    public final String F(String str) {
        m21 m21VarC = C(str);
        if (m21VarC instanceof s21) {
            return m21VarC.e();
        }
        return null;
    }

    public final boolean G(String str) {
        for (m21 m21Var : this.e) {
            if ((m21Var instanceof n21) && ((n21) m21Var).e().equals(str)) {
                return true;
            }
        }
        return false;
    }

    public final ArrayList H() {
        ArrayList arrayList = new ArrayList();
        for (m21 m21Var : this.e) {
            if (m21Var instanceof n21) {
                arrayList.add(((n21) m21Var).e());
            }
        }
        return arrayList;
    }

    public final void I(String str, m21 m21Var) {
        Iterator it2 = this.e.iterator();
        while (it2.hasNext()) {
            n21 n21Var = (n21) ((m21) it2.next());
            if (n21Var.e().equals(str)) {
                int size = n21Var.e.size();
                ArrayList arrayList = n21Var.e;
                if (size > 0) {
                    arrayList.set(0, m21Var);
                    return;
                } else {
                    arrayList.add(m21Var);
                    return;
                }
            }
        }
        n21 n21Var2 = new n21(str.toCharArray());
        n21Var2.b = 0L;
        n21Var2.t(str.length() - 1);
        int size2 = n21Var2.e.size();
        ArrayList arrayList2 = n21Var2.e;
        if (size2 > 0) {
            arrayList2.set(0, m21Var);
        } else {
            arrayList2.add(m21Var);
        }
        this.e.add(n21Var2);
    }

    public final void J(String str, String str2) {
        s21 s21Var = new s21(str2.toCharArray());
        s21Var.b = 0L;
        s21Var.t(str2.length() - 1);
        I(str, s21Var);
    }

    @Override // defpackage.m21
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof l21) {
            return this.e.equals(((l21) obj).e);
        }
        return false;
    }

    @Override // defpackage.m21
    public int hashCode() {
        return Objects.hash(this.e, Integer.valueOf(super.hashCode()));
    }

    @Override // defpackage.m21
    public final String toString() {
        StringBuilder sb = new StringBuilder();
        for (m21 m21Var : this.e) {
            if (sb.length() > 0) {
                sb.append("; ");
            }
            sb.append(m21Var);
        }
        return super.toString() + " = <" + ((Object) sb) + " >";
    }

    public final void u(m21 m21Var) {
        this.e.add(m21Var);
    }

    @Override // defpackage.m21
    /* JADX INFO: renamed from: v, reason: merged with bridge method [inline-methods] and merged with bridge method [inline-methods] */
    public l21 d() {
        l21 l21Var = (l21) super.d();
        ArrayList arrayList = new ArrayList(this.e.size());
        Iterator it2 = this.e.iterator();
        while (it2.hasNext()) {
            m21 m21VarD = ((m21) it2.next()).d();
            m21VarD.d = l21Var;
            arrayList.add(m21VarD);
        }
        l21Var.e = arrayList;
        return l21Var;
    }

    public final m21 w(int i) {
        if (i < 0 || i >= this.e.size()) {
            throw new CLParsingException(b09.w(i, "no element at index "), this);
        }
        return (m21) this.e.get(i);
    }

    public final m21 x(String str) {
        Iterator it2 = this.e.iterator();
        while (it2.hasNext()) {
            n21 n21Var = (n21) ((m21) it2.next());
            if (n21Var.e().equals(str)) {
                if (n21Var.e.size() > 0) {
                    return (m21) n21Var.e.get(0);
                }
                return null;
            }
        }
        throw new CLParsingException(ev6.x("no element for key <", str, ">"), this);
    }

    public final float y(int i) {
        m21 m21VarW = w(i);
        if (m21VarW != null) {
            return m21VarW.q();
        }
        throw new CLParsingException(b09.w(i, "no float at index "), this);
    }

    public final float z(String str) {
        m21 m21VarX = x(str);
        if (m21VarX != null) {
            return m21VarX.q();
        }
        StringBuilder sbU = lv8.u("no float found for key <", str, ">, found [");
        sbU.append(m21VarX.s());
        sbU.append("] : ");
        sbU.append(m21VarX);
        throw new CLParsingException(sbU.toString(), this);
    }
}
