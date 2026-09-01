package defpackage;

import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import androidx.recyclerview.widget.RecyclerView;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class jl1 implements vwd {
    public final /* synthetic */ int a;
    public Object b;
    public int c;
    public final Object d;
    public Object e;
    public Object f;

    public jl1(n0c n0cVar, yv2 yv2Var, x96 x96Var, int i) {
        this.a = 2;
        n0cVar.getClass();
        x96Var.getClass();
        this.d = n0cVar;
        this.e = yv2Var;
        this.c = i;
        ArrayList typeParameters = x96Var.getTypeParameters();
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Iterator it2 = typeParameters.iterator();
        int i2 = 0;
        while (it2.hasNext()) {
            linkedHashMap.put(it2.next(), Integer.valueOf(i2));
            i2++;
        }
        this.b = linkedHashMap;
        this.f = ((k96) ((n0c) this.d).b).a.c(new z(22, this));
    }

    public static /* synthetic */ void q(jl1 jl1Var, String str, int i, String str2, int i2) {
        if ((i2 & 2) != 0) {
            i = jl1Var.c;
        }
        if ((i2 & 4) != 0) {
            str2 = "";
        }
        jl1Var.p(str, i, str2);
        throw null;
    }

    public int A(int i) {
        il1 il1Var = (il1) this.e;
        if (i < 0) {
            return -1;
        }
        int childCount = ((ixa) this.d).a.getChildCount();
        int i2 = i;
        while (i2 < childCount) {
            int iB = i - (i2 - il1Var.b(i2));
            if (iB == 0) {
                while (il1Var.d(i2)) {
                    i2++;
                }
                return i2;
            }
            i2 += iB;
        }
        return -1;
    }

    public int B() {
        return ((er6) this.d).s.b;
    }

    public View C(int i) {
        return ((ixa) this.d).a.getChildAt(i);
    }

    public int D() {
        return ((ixa) this.d).a.getChildCount();
    }

    public void E(View view) {
        ((ArrayList) this.b).add(view);
        ixa ixaVar = (ixa) this.d;
        pr0 pr0VarK = RecyclerView.K(view);
        if (pr0VarK != null) {
            View view2 = pr0VarK.a;
            RecyclerView recyclerView = ixaVar.a;
            int i = pr0VarK.p;
            if (i != -1) {
                pr0VarK.o = i;
            } else {
                pr0VarK.o = view2.getImportantForAccessibility();
            }
            if (!recyclerView.N()) {
                view2.setImportantForAccessibility(4);
            } else {
                pr0VarK.p = 4;
                recyclerView.H0.add(pr0VarK);
            }
        }
    }

    public ua8 F(ua8 ua8Var, ku3 ku3Var, boolean z, va8 va8Var) {
        ua8 ua8VarV;
        ya8 ya8Var = (ya8) this.d;
        ArrayList arrayList = new ArrayList();
        Iterator it2 = ya8Var.iterator();
        while (true) {
            ab8 ab8Var = (ab8) it2;
            if (!ab8Var.hasNext()) {
                break;
            }
            va8 va8Var2 = (va8) ab8Var.next();
            ua8VarV = g76.L(va8Var2, va8Var) ? null : va8Var2.r(ku3Var);
            if (ua8VarV != null) {
                arrayList.add(ua8VarV);
            }
        }
        ua8 ua8Var2 = (ua8) bu1.J0(arrayList);
        ya8 ya8Var2 = ya8Var.c;
        if (ya8Var2 != null && z && !ya8Var2.equals(va8Var)) {
            ua8VarV = ya8Var2.v(ku3Var, ya8Var);
        }
        return (ua8) bu1.J0(k80.s0(new ua8[]{ua8Var, ua8Var2, ua8VarV}));
    }

    public void G(ad7 ad7Var) {
        ad7 ad7Var2 = ad7Var.d;
        if (ad7Var2 == null) {
            return;
        }
        ad7Var2.c = ad7Var.c;
        ad7 ad7Var3 = ad7Var.c;
        if (ad7Var3 == null) {
            this.f = ad7Var2;
        } else {
            ad7Var3.d = ad7Var2;
        }
        ad7 ad7Var4 = (ad7) this.b;
        ad7Var.c = ad7Var4;
        ad7Var.d = null;
        if (ad7Var4 != null) {
            ad7Var4.d = ad7Var;
        }
        this.b = ad7Var;
    }

    public String H(String str) {
        str.getClass();
        int i = this.c;
        try {
            if (i() == 6 && g76.L(J(), str)) {
                this.e = null;
                if (i() == 5) {
                    return J();
                }
            }
            return null;
        } finally {
            this.c = i;
            this.e = null;
        }
    }

    public byte I() {
        String str = (String) this.f;
        int i = this.c;
        while (true) {
            int iK = K(i);
            if (iK == -1) {
                this.c = iK;
                return (byte) 10;
            }
            char cCharAt = str.charAt(iK);
            if (cCharAt != '\t' && cCharAt != '\n' && cCharAt != '\r' && cCharAt != ' ') {
                this.c = iK;
                return guc.w(cCharAt);
            }
            i = iK + 1;
        }
    }

    public String J() {
        if (I() != 1) {
            return null;
        }
        String strM = m();
        this.e = strM;
        return strM;
    }

    public int K(int i) {
        if (i < ((String) this.f).length()) {
            return i;
        }
        return -1;
    }

    public void L(Object obj, bx7 bx7Var) {
        LinkedHashMap linkedHashMap = (LinkedHashMap) this.e;
        ad7 ad7Var = (ad7) linkedHashMap.get(obj);
        if (ad7Var == null) {
            ad7 ad7Var2 = (ad7) this.b;
            ad7 ad7Var3 = new ad7();
            ad7Var3.a = obj;
            ad7Var3.b = bx7Var;
            ad7Var3.c = ad7Var2;
            ad7Var3.d = null;
            this.b = ad7Var3;
            if (ad7Var2 == null) {
                this.f = ad7Var3;
            } else {
                ad7Var2.d = ad7Var3;
            }
            this.c = ((Number) ((wn7) this.d).invoke(obj, bx7Var)).intValue() + this.c;
            linkedHashMap.put(obj, ad7Var3);
        } else {
            ad7Var.b = bx7Var;
            G(ad7Var);
        }
        ad7 ad7Var4 = (ad7) this.f;
        while (ad7Var4 != null && this.c > 104857600) {
            pwd.y(linkedHashMap).remove(ad7Var4.a);
            T(ad7Var4);
            ad7Var4 = (ad7) this.f;
        }
    }

    public void M(int i) {
        ya8 ya8Var = (ya8) this.d;
        if (i != ya8Var.b.c) {
            if (((String) this.f) != null) {
                N(null);
            }
            this.c = i;
            this.b = null;
            return;
        }
        throw new IllegalArgumentException(("Start destination " + i + " cannot use the same id as the graph " + ya8Var).toString());
    }

    public void N(String str) {
        int iHashCode;
        ya8 ya8Var = (ya8) this.d;
        if (str == null) {
            iHashCode = 0;
        } else if (str.equals((String) ya8Var.b.g)) {
            lg8.o("Start destination ", str, " cannot use the same route as the graph ", ya8Var);
            return;
        } else if (muc.b0(str)) {
            ay0.e("Cannot have an empty start destination route");
            return;
        } else {
            int i = va8.f;
            iHashCode = "android-app://androidx.navigation/".concat(str).hashCode();
        }
        this.c = iHashCode;
        this.f = str;
    }

    public int O() {
        char cCharAt;
        int i = this.c;
        if (i == -1) {
            return i;
        }
        String str = (String) this.f;
        while (i < str.length() && ((cCharAt = str.charAt(i)) == ' ' || cCharAt == '\n' || cCharAt == '\r' || cCharAt == '\t')) {
            i++;
        }
        this.c = i;
        return i;
    }

    public int P(int i) {
        v66 v66VarP = ((er6) this.d).s.p(i);
        int i2 = i - v66VarP.a;
        return (int) ((fg5) ((dr6) v66VarP.c).b.invoke(qr6.a, Integer.valueOf(i2))).a;
    }

    public boolean Q() {
        int iO = O();
        String str = (String) this.f;
        if (iO >= str.length() || iO == -1 || str.charAt(iO) != ',') {
            return false;
        }
        this.c++;
        return true;
    }

    public void R(char c) {
        int i = this.c;
        if (i > 0 && c == '\"') {
            try {
                this.c = i - 1;
                String strN = n();
                this.c = i;
                if (g76.L(strN, "null")) {
                    p("Expected string literal but 'null' literal was found", this.c - 1, "Use 'coerceInputValues = true' in 'Json {}' builder to coerce nulls if property has a default value.");
                    throw null;
                }
            } catch (Throwable th) {
                this.c = i;
                throw th;
            }
        }
        r(guc.w(c), true);
        throw null;
    }

    public void S(View view) {
        if (((ArrayList) this.b).remove(view)) {
            ixa ixaVar = (ixa) this.d;
            pr0 pr0VarK = RecyclerView.K(view);
            if (pr0VarK != null) {
                RecyclerView recyclerView = ixaVar.a;
                int i = pr0VarK.o;
                if (recyclerView.N()) {
                    pr0VarK.p = i;
                    recyclerView.H0.add(pr0VarK);
                } else {
                    pr0VarK.a.setImportantForAccessibility(i);
                }
                pr0VarK.o = 0;
            }
        }
    }

    public void T(ad7 ad7Var) {
        ad7 ad7Var2 = ad7Var.d;
        ad7 ad7Var3 = ad7Var.c;
        if (ad7Var2 == null) {
            this.b = ad7Var3;
        } else {
            ad7Var2.c = ad7Var3;
        }
        ad7 ad7Var4 = ad7Var.c;
        if (ad7Var4 == null) {
            this.f = ad7Var2;
        } else {
            ad7Var4.d = ad7Var2;
        }
        int i = this.c;
        wn7 wn7Var = (wn7) this.d;
        Object obj = ad7Var.a;
        obj.getClass();
        this.c = i - ((Number) wn7Var.invoke(obj, ad7Var.b)).intValue();
        ad7Var.a = null;
        ad7Var.b = null;
        ad7Var.c = null;
        ad7Var.d = null;
    }

    public void a(va8 va8Var) {
        xkc xkcVar = (xkc) this.e;
        ya8 ya8Var = (ya8) this.d;
        ym6 ym6Var = ya8Var.b;
        va8Var.getClass();
        ym6 ym6Var2 = va8Var.b;
        int i = ym6Var2.c;
        String str = (String) ym6Var2.g;
        if (i == 0 && str == null) {
            ay0.e("Destinations must have an id or route. Call setId(), setRoute(), or include an android:id or app:route in your navigation XML.");
            return;
        }
        String str2 = (String) ym6Var.g;
        if (str2 != null && g76.L(str, str2)) {
            lg8.o("Destination ", va8Var, " cannot have the same route as graph ", ya8Var);
            return;
        }
        if (i == ym6Var.c) {
            lg8.o("Destination ", va8Var, " cannot have the same id as graph ", ya8Var);
            return;
        }
        va8 va8Var2 = (va8) s42.L(xkcVar, i);
        if (va8Var2 == va8Var) {
            return;
        }
        if (va8Var.c != null) {
            ygf.f("Destination already has a parent set. Call NavGraph.remove() to remove the previous parent.");
            return;
        }
        if (va8Var2 != null) {
            va8Var2.c = null;
        }
        va8Var.c = ya8Var;
        xkcVar.d(ym6Var2.c, va8Var);
    }

    @Override // defpackage.vwd
    public swd b(e1b e1bVar) {
        e1bVar.getClass();
        xs6 xs6Var = (xs6) ((v67) this.f).invoke(e1bVar);
        return xs6Var != null ? xs6Var : ((vwd) ((n0c) this.d).c).b(e1bVar);
    }

    public void c(View view, int i, boolean z) {
        RecyclerView recyclerView = ((ixa) this.d).a;
        int childCount = i < 0 ? recyclerView.getChildCount() : A(i);
        ((il1) this.e).f(childCount, z);
        if (z) {
            E(view);
        }
        recyclerView.addView(view, childCount);
        pr0 pr0VarK = RecyclerView.K(view);
        if (recyclerView.m == null || pr0VarK == null) {
            return;
        }
        or0 or0Var = pr0VarK.u;
        if (or0Var != null) {
            vx6 vx6Var = vx6.RESUMED;
            vx6Var.getClass();
            ky6 ky6Var = or0Var.a;
            vx6 vx6Var2 = ky6Var.d;
            vx6Var2.getClass();
            if (vx6Var2.compareTo(vx6Var) >= 0) {
                vx6Var = vx6Var2;
            }
            ky6Var.g(vx6Var);
        }
        pr0VarK.s.i(pr0VarK);
    }

    public int d(CharSequence charSequence, int i) {
        int i2 = i + 4;
        if (i2 < charSequence.length()) {
            ((StringBuilder) this.b).append((char) (v(charSequence, i + 3) + (v(charSequence, i) << 12) + (v(charSequence, i + 1) << 8) + (v(charSequence, i + 2) << 4)));
            return i2;
        }
        this.c = i;
        if (i2 < charSequence.length()) {
            return d(charSequence, this.c);
        }
        q(this, "Unexpected EOF during unicode escape", 0, null, 6);
        throw null;
    }

    public void e(View view, int i, ViewGroup.LayoutParams layoutParams, boolean z) {
        RecyclerView recyclerView = ((ixa) this.d).a;
        int childCount = i < 0 ? recyclerView.getChildCount() : A(i);
        ((il1) this.e).f(childCount, z);
        if (z) {
            E(view);
        }
        pr0 pr0VarK = RecyclerView.K(view);
        if (pr0VarK != null) {
            if (!pr0VarK.i() && !pr0VarK.n()) {
                StringBuilder sb = new StringBuilder("Called attach on a child which is not detached: ");
                sb.append(pr0VarK);
                ay0.i(sb, recyclerView.A());
                return;
            } else {
                if (RecyclerView.Q0) {
                    Log.d("RecyclerView", "reAttach " + pr0VarK);
                }
                pr0VarK.i &= -257;
            }
        } else if (RecyclerView.P0) {
            StringBuilder sb2 = new StringBuilder("No ViewHolder found for child: ");
            sb2.append(view);
            String strA = recyclerView.A();
            sb2.append(", index: ");
            sb2.append(childCount);
            sb2.append(strA);
            throw new IllegalArgumentException(sb2.toString());
        }
        recyclerView.attachViewToParent(view, childCount, layoutParams);
    }

    public boolean f() {
        int i = this.c;
        if (i == -1) {
            return false;
        }
        String str = (String) this.f;
        while (i < str.length()) {
            char cCharAt = str.charAt(i);
            if (cCharAt != ' ' && cCharAt != '\n' && cCharAt != '\r' && cCharAt != '\t') {
                this.c = i;
                return (cCharAt == ',' || cCharAt == ':' || cCharAt == ']' || cCharAt == '}') ? false : true;
            }
            i++;
        }
        this.c = i;
        return false;
    }

    public void g(int i, String str) {
        String str2 = (String) this.f;
        if (str2.length() - i < str.length()) {
            q(this, "Unexpected end of boolean literal", 0, null, 6);
            throw null;
        }
        int length = str.length();
        for (int i2 = 0; i2 < length; i2++) {
            if (str.charAt(i2) != (str2.charAt(i + i2) | ' ')) {
                q(this, "Expected valid boolean literal prefix, but had '" + n() + '\'', 0, null, 6);
                throw null;
            }
        }
        this.c = str.length() + i;
    }

    public String h() {
        String string;
        StringBuilder sb = (StringBuilder) this.b;
        String str = (String) this.f;
        k('\"');
        int i = this.c;
        int iY = muc.Y(str, '\"', i, 4);
        if (iY == -1) {
            n();
            r((byte) 1, false);
            throw null;
        }
        int i2 = i;
        while (i2 < iY) {
            if (str.charAt(i2) == '\\') {
                int iK = this.c;
                char cCharAt = str.charAt(i2);
                boolean z = false;
                while (cCharAt != '\"') {
                    if (cCharAt == '\\') {
                        sb.append((CharSequence) str, iK, i2);
                        int iK2 = K(i2 + 1);
                        if (iK2 == -1) {
                            q(this, "Expected escape sequence to continue, got EOF", 0, null, 6);
                            throw null;
                        }
                        int iD = iK2 + 1;
                        char cCharAt2 = str.charAt(iK2);
                        if (cCharAt2 == 'u') {
                            iD = d(str, iD);
                        } else {
                            char c = cCharAt2 < 'u' ? pk1.a[cCharAt2] : (char) 0;
                            if (c == 0) {
                                q(this, "Invalid escaped char '" + cCharAt2 + '\'', 0, null, 6);
                                throw null;
                            }
                            sb.append(c);
                        }
                        iK = K(iD);
                        if (iK == -1) {
                            q(this, "Unexpected EOF", iK, null, 4);
                            throw null;
                        }
                    } else {
                        i2++;
                        if (i2 >= str.length()) {
                            sb.append((CharSequence) str, iK, i2);
                            iK = K(i2);
                            if (iK == -1) {
                                q(this, "Unexpected EOF", iK, null, 4);
                                throw null;
                            }
                        } else {
                            continue;
                            cCharAt = str.charAt(i2);
                        }
                    }
                    i2 = iK;
                    z = true;
                    cCharAt = str.charAt(i2);
                }
                if (z) {
                    sb.append((CharSequence) str, iK, i2);
                    String string2 = sb.toString();
                    sb.setLength(0);
                    string = string2;
                } else {
                    string = str.subSequence(iK, i2).toString();
                }
                this.c = i2 + 1;
                return string;
            }
            i2++;
        }
        this.c = iY + 1;
        return str.substring(i, iY);
    }

    public byte i() {
        String str = (String) this.f;
        int i = this.c;
        while (i != -1 && i < str.length()) {
            int i2 = i + 1;
            char cCharAt = str.charAt(i);
            if (cCharAt != ' ' && cCharAt != '\n' && cCharAt != '\r' && cCharAt != '\t') {
                this.c = i2;
                return guc.w(cCharAt);
            }
            i = i2;
        }
        this.c = str.length();
        return (byte) 10;
    }

    public byte j(byte b) {
        byte bI = i();
        if (bI == b) {
            return bI;
        }
        r(b, true);
        throw null;
    }

    public void k(char c) {
        int i = this.c;
        if (i == -1) {
            R(c);
            throw null;
        }
        String str = (String) this.f;
        while (i < str.length()) {
            int i2 = i + 1;
            char cCharAt = str.charAt(i);
            if (cCharAt != ' ' && cCharAt != '\n' && cCharAt != '\r' && cCharAt != '\t') {
                this.c = i2;
                if (cCharAt == c) {
                    return;
                }
                R(c);
                throw null;
            }
            i = i2;
        }
        this.c = -1;
        R(c);
        throw null;
    }

    public String m() {
        String str = (String) this.e;
        if (str == null) {
            return h();
        }
        str.getClass();
        this.e = null;
        return str;
    }

    public String n() {
        String string;
        StringBuilder sb = (StringBuilder) this.b;
        String str = (String) this.f;
        String str2 = (String) this.e;
        if (str2 != null) {
            str2.getClass();
            this.e = null;
            return str2;
        }
        int iO = O();
        if (iO >= str.length() || iO == -1) {
            q(this, "EOF", iO, null, 4);
            throw null;
        }
        byte bW = guc.w(str.charAt(iO));
        if (bW == 1) {
            return m();
        }
        if (bW != 0) {
            q(this, "Expected beginning of the string, but got " + str.charAt(iO), 0, null, 6);
            throw null;
        }
        boolean z = false;
        while (guc.w(str.charAt(iO)) == 0) {
            iO++;
            if (iO >= str.length()) {
                sb.append((CharSequence) str, this.c, iO);
                int iK = K(iO);
                if (iK == -1) {
                    this.c = iO;
                    sb.append((CharSequence) str, 0, 0);
                    String string2 = sb.toString();
                    sb.setLength(0);
                    return string2;
                }
                iO = iK;
                z = true;
            }
        }
        int i = this.c;
        if (z) {
            sb.append((CharSequence) str, i, iO);
            String string3 = sb.toString();
            sb.setLength(0);
            string = string3;
        } else {
            string = str.subSequence(i, iO).toString();
        }
        this.c = iO;
        return string;
    }

    public void o(int i) {
        int iA = A(i);
        ((il1) this.e).h(iA);
        RecyclerView recyclerView = ((ixa) this.d).a;
        View childAt = recyclerView.getChildAt(iA);
        if (childAt != null) {
            pr0 pr0VarK = RecyclerView.K(childAt);
            if (pr0VarK != null) {
                if (pr0VarK.i() && !pr0VarK.n()) {
                    StringBuilder sb = new StringBuilder("called detach on an already detached child ");
                    sb.append(pr0VarK);
                    ay0.i(sb, recyclerView.A());
                    return;
                } else {
                    if (RecyclerView.Q0) {
                        Log.d("RecyclerView", "tmpDetach " + pr0VarK);
                    }
                    pr0VarK.a(256);
                }
            }
        } else if (RecyclerView.P0) {
            throw new IllegalArgumentException("No view at offset " + iA + recyclerView.A());
        }
        recyclerView.detachViewFromParent(iA);
    }

    public void p(String str, int i, String str2) {
        str2.getClass();
        throw m40.r(i, (String) this.f, str + " at path: " + ((xp) this.d).v() + (str2.length() == 0 ? "" : "\n".concat(str2)));
    }

    public void r(byte b, boolean z) {
        String str = (String) this.f;
        String strZ = guc.Z(b);
        int i = this.c;
        int i2 = z ? i - 1 : i;
        q(this, ev6.y("Expected ", strZ, ", but had '", (i == str.length() || i2 < 0) ? "EOF" : String.valueOf(str.charAt(i2)), "' instead"), i2, null, 4);
        throw null;
    }

    public va8 s(int i) {
        return u(i, (ya8) this.d, null, false);
    }

    public va8 t(String str, boolean z) {
        Object next;
        ya8 ya8Var;
        str.getClass();
        Iterator it2 = ((j52) szb.F0(new h1(2, (xkc) this.e))).iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            va8 va8Var = (va8) next;
            if (tuc.G((String) va8Var.b.g, str, false) || va8Var.b.a(str) != null) {
                break;
            }
        }
        va8 va8Var2 = (va8) next;
        if (va8Var2 != null) {
            return va8Var2;
        }
        if (!z || (ya8Var = ((ya8) this.d).c) == null) {
            return null;
        }
        jl1 jl1Var = ya8Var.g;
        jl1Var.getClass();
        if (muc.b0(str)) {
            return null;
        }
        return jl1Var.t(str, true);
    }

    public String toString() {
        switch (this.a) {
            case 0:
                return ((il1) this.e).toString() + ", hidden list:" + ((ArrayList) this.b).size();
            case 5:
                StringBuilder sb = new StringBuilder("JsonReader(source='");
                sb.append(this.f);
                sb.append("', currentPosition=");
                return km4.A(sb, this.c, ')');
            default:
                return super.toString();
        }
    }

    public va8 u(int i, va8 va8Var, va8 va8Var2, boolean z) {
        ya8 ya8Var = (ya8) this.d;
        xkc xkcVar = (xkc) this.e;
        va8 va8VarU = (va8) s42.L(xkcVar, i);
        if (va8Var2 != null) {
            if (g76.L(va8VarU, va8Var2) && g76.L(va8VarU.c, va8Var2.c)) {
                return va8VarU;
            }
            va8VarU = null;
        } else if (va8VarU != null) {
            return va8VarU;
        }
        if (z) {
            Iterator it2 = ((j52) szb.F0(new h1(2, xkcVar))).iterator();
            while (true) {
                if (!it2.hasNext()) {
                    va8VarU = null;
                    break;
                }
                va8 va8Var3 = (va8) it2.next();
                va8VarU = (!(va8Var3 instanceof ya8) || va8Var3.equals(va8Var)) ? null : ((ya8) va8Var3).g.u(i, ya8Var, va8Var2, true);
                if (va8VarU != null) {
                    break;
                }
            }
        }
        if (va8VarU != null) {
            return va8VarU;
        }
        ya8 ya8Var2 = ya8Var.c;
        if (ya8Var2 == null || ya8Var2.equals(va8Var)) {
            return null;
        }
        ya8 ya8Var3 = ya8Var.c;
        ya8Var3.getClass();
        return ya8Var3.g.u(i, ya8Var, va8Var2, z);
    }

    public int v(CharSequence charSequence, int i) {
        char cCharAt = charSequence.charAt(i);
        if ('0' <= cCharAt && cCharAt < ':') {
            return cCharAt - '0';
        }
        if ('a' <= cCharAt && cCharAt < 'g') {
            return cCharAt - 'W';
        }
        if ('A' <= cCharAt && cCharAt < 'G') {
            return cCharAt - '7';
        }
        q(this, ev6.r(cCharAt, "Invalid toHexChar char '", "' in unicode escape"), 0, null, 6);
        throw null;
    }

    public View w(int i) {
        return ((ixa) this.d).a.getChildAt(A(i));
    }

    public int x() {
        return ((ixa) this.d).a.getChildCount() - ((ArrayList) this.b).size();
    }

    public f05 y(int i) {
        List list;
        int i2 = this.c;
        int i3 = i * i2;
        int iB = B() - i3;
        if (i2 > iB) {
            i2 = iB;
        }
        if (i2 < 0) {
            i2 = 0;
        }
        if (i2 == ((List) this.f).size()) {
            list = (List) this.f;
        } else {
            ArrayList arrayList = new ArrayList(i2);
            for (int i4 = 0; i4 < i2; i4++) {
                arrayList.add(new fg5(1L));
            }
            this.f = arrayList;
            list = arrayList;
        }
        return new f05(i3, list);
    }

    public int z(int i) {
        if (B() <= 0) {
            return 0;
        }
        if (i >= B()) {
            e26.a("ItemIndex > total count");
        }
        return i / this.c;
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x0168, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:101:0x0169, code lost:
    
        q(r21, "Numeric value overflow", 0, null, 6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:102:0x016e, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x016f, code lost:
    
        defpackage.ygf.a();
     */
    /* JADX WARN: Code restructure failed: missing block: B:104:0x0172, code lost:
    
        return 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x0173, code lost:
    
        r10 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x0175, code lost:
    
        if (r14 == false) goto L108;
     */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x0177, code lost:
    
        return r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x017c, code lost:
    
        if (r10 == Long.MIN_VALUE) goto L112;
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x017f, code lost:
    
        return -r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:0x0180, code lost:
    
        q(r21, "Numeric value overflow", 0, null, 6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x0184, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x0185, code lost:
    
        q(r21, "Expected numeric literal", 0, null, 6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x018a, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x00df, code lost:
    
        q(r21, defpackage.ev6.r(r15, "Unexpected symbol '", "' in numeric literal"), 0, null, 6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x00ec, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x00ef, code lost:
    
        if (r12 == r1) goto L67;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x00f1, code lost:
    
        r3 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x00f3, code lost:
    
        r3 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x00f4, code lost:
    
        if (r1 == r12) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x00f6, code lost:
    
        if (r14 == false) goto L74;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x00fa, code lost:
    
        if (r1 == (r12 - 1)) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x0101, code lost:
    
        if (r20 == false) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0103, code lost:
    
        if (r3 == false) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x010b, code lost:
    
        if (r2.charAt(r12) != '\"') goto L79;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x010d, code lost:
    
        r12 = r12 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x0110, code lost:
    
        q(r21, "Expected closing quotation mark", 0, null, 6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x0117, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x0118, code lost:
    
        q(r21, "EOF", 0, null, 6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x011d, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x011e, code lost:
    
        r21.c = r12;
        r1 = r16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x0122, code lost:
    
        if (r13 == false) goto L105;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x0124, code lost:
    
        r1 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x0127, code lost:
    
        if (r11 != false) goto L88;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x0129, code lost:
    
        r3 = java.lang.Math.pow(10.0d, -r9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x0131, code lost:
    
        if (r11 != true) goto L103;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x0133, code lost:
    
        r3 = java.lang.Math.pow(10.0d, r9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x0138, code lost:
    
        r1 = r1 * r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x013d, code lost:
    
        if (r1 > 9.223372036854776E18d) goto L101;
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x0143, code lost:
    
        if (r1 < (-9.223372036854776E18d)) goto L101;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x014b, code lost:
    
        if (java.lang.Math.floor(r1) != r1) goto L99;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x014d, code lost:
    
        r10 = (long) r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x0150, code lost:
    
        q(r21, "Can't convert " + r1 + " to Long", 0, null, 6);
     */
    /* JADX WARN: Type inference failed for: r6v0 */
    /* JADX WARN: Type inference failed for: r6v16 */
    /* JADX WARN: Type inference failed for: r6v18 */
    /* JADX WARN: Type inference failed for: r6v19 */
    /* JADX WARN: Type inference failed for: r6v2, types: [java.lang.String, java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r6v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public long l() {
        /*
            Method dump skipped, instruction units count: 401
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jl1.l():long");
    }

    public jl1(er6 er6Var) {
        this.a = 1;
        this.d = er6Var;
        ArrayList arrayList = new ArrayList();
        arrayList.add(new zi5(0, 0));
        this.b = arrayList;
        this.e = new ArrayList();
        this.f = ey3.a;
    }

    public jl1(wn7 wn7Var) {
        this.a = 3;
        this.d = wn7Var;
        this.e = new LinkedHashMap(0, 0.75f);
    }

    public jl1(ya8 ya8Var) {
        this.a = 4;
        this.d = ya8Var;
        this.e = new xkc(0);
    }

    public jl1(ixa ixaVar) {
        this.a = 0;
        this.c = 0;
        this.d = ixaVar;
        this.e = new il1();
        this.b = new ArrayList();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public jl1(String str) {
        this.a = 5;
        str.getClass();
        xp xpVar = new xp((char) (0 == true ? 1 : 0), 6);
        xpVar.c = new Object[8];
        int[] iArr = new int[8];
        for (int i = 0; i < 8; i++) {
            iArr[i] = -1;
        }
        xpVar.d = iArr;
        xpVar.b = -1;
        this.d = xpVar;
        this.b = new StringBuilder();
        this.f = str;
    }
}
