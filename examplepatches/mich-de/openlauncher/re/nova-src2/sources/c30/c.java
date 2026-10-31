package c30;

import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.graphics.Color;
import android.graphics.Shader;
import android.util.AttributeSet;
import android.util.Xml;
import androidx.fragment.app.p;
import b.u4;
import b70.g;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.util.NamedIntent;
import e10.s2;
import e10.y2;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import kotlin.collections.ArrayDeque;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
import n0.q;
import n0.z;
import o0.j;
import org.xmlpull.v1.XmlPullParserException;
import rg.m;
import w20.i;
import x80.f0;
import xk.w0;
import xk.w2;
import xk.x0;

/* loaded from: classes.dex */
public class c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19531a;

    /* renamed from: b, reason: collision with root package name */
    public int f19532b;

    /* renamed from: c, reason: collision with root package name */
    public Object f19533c;

    /* renamed from: d, reason: collision with root package name */
    public Object f19534d;

    public /* synthetic */ c(char c11, int i5) {
        this.f19531a = i5;
    }

    public static c e(Resources resources, int i5, Resources.Theme theme) {
        int next;
        XmlResourceParser xml = resources.getXml(i5);
        AttributeSet attributeSetAsAttributeSet = Xml.asAttributeSet(xml);
        do {
            next = xml.next();
            if (next == 2) {
                break;
            }
        } while (next != 1);
        if (next != 2) {
            throw new XmlPullParserException("No start tag found");
        }
        String name = xml.getName();
        name.getClass();
        if (name.equals("gradient")) {
            return new c(q4.b.c(resources, xml, attributeSetAsAttributeSet, theme), (ColorStateList) null, 0);
        }
        if (name.equals("selector")) {
            ColorStateList colorStateListB = q4.c.b(resources, xml, attributeSetAsAttributeSet, theme);
            return new c((Shader) null, colorStateListB, colorStateListB.getDefaultColor());
        }
        throw new XmlPullParserException(xml.getPositionDescription() + ": unsupported complex color tag " + name);
    }

    public void a(int i5, q qVar) {
        if (i5 < 0) {
            j0.b.a("size should be >=0");
        }
        if (i5 == 0) {
            return;
        }
        n0.f fVar = new n0.f(this.f19532b, i5, qVar);
        this.f19532b += i5;
        ((r1.e) this.f19533c).b(fVar);
    }

    public boolean b(int i5, int i11) {
        int iK = k(i5);
        return iK == i11 || iK == -1 || iK == -2;
    }

    public w2 c(boolean z11) {
        w0 w0Var;
        w0 w0Var2;
        if (z11 && (w0Var2 = (w0) this.f19534d) != null) {
            throw w0Var2.a();
        }
        w2 w2VarK = w2.k(this.f19532b, (Object[]) this.f19533c, this);
        if (!z11 || (w0Var = (w0) this.f19534d) == null) {
            return w2VarK;
        }
        throw w0Var.a();
    }

    public x0 d() {
        return c(true);
    }

    public void f(int i5, int i11) {
        if (i5 > 131072) {
            j0.b.a("Requested item capacity " + i5 + " is larger than max supported: 131072!");
        }
        int[] iArr = (int[]) this.f19533c;
        if (iArr.length < i5) {
            int length = iArr.length;
            while (length < i5) {
                length *= 2;
            }
            int[] iArr2 = new int[length];
            u90.b.u(i11, 0, (int[]) this.f19533c, iArr2, 12);
            this.f19533c = iArr2;
        }
    }

    public void g(int i5) {
        ArrayDeque arrayDeque = (ArrayDeque) this.f19534d;
        int i11 = this.f19532b;
        int i12 = i5 - i11;
        if (i12 < 0 || i12 >= 131072) {
            int iMax = Math.max(i5 - (((int[]) this.f19533c).length / 2), 0);
            this.f19532b = iMax;
            int i13 = iMax - i11;
            if (i13 >= 0) {
                int[] iArr = (int[]) this.f19533c;
                if (i13 < iArr.length) {
                    u90.b.p(0, i13, iArr, iArr, iArr.length);
                }
                int[] iArr2 = (int[]) this.f19533c;
                Arrays.fill(iArr2, Math.max(0, iArr2.length - i13), ((int[]) this.f19533c).length, 0);
            } else {
                int i14 = -i13;
                int[] iArr3 = (int[]) this.f19533c;
                if (iArr3.length + i14 < 131072) {
                    f(iArr3.length + i14 + 1, i14);
                } else {
                    if (i14 < iArr3.length) {
                        u90.b.p(i14, 0, iArr3, iArr3, iArr3.length - i14);
                    }
                    int[] iArr4 = (int[]) this.f19533c;
                    Arrays.fill(iArr4, 0, Math.min(iArr4.length, i14), 0);
                }
            }
        } else {
            f(i12 + 1, 0);
        }
        while (!arrayDeque.isEmpty() && ((j) arrayDeque.first()).b() < this.f19532b) {
            arrayDeque.removeFirst();
        }
        while (!arrayDeque.isEmpty() && ((j) arrayDeque.last()).b() > this.f19532b + ((int[]) this.f19533c).length) {
            arrayDeque.removeLast();
        }
    }

    public int h(int i5, int i11) {
        do {
            i5--;
            if (-1 >= i5) {
                return -1;
            }
        } while (!b(i5, i11));
        return i5;
    }

    public n0.f i(int i5) {
        if (i5 < 0 || i5 >= this.f19532b) {
            StringBuilder sbJ = u4.j(i5, "Index ", ", size ");
            sbJ.append(this.f19532b);
            j0.b.e(sbJ.toString());
        }
        n0.f fVar = (n0.f) this.f19534d;
        if (fVar != null) {
            int i11 = fVar.f77411a;
            if (i5 < fVar.f77412b + i11 && i11 <= i5) {
                return fVar;
            }
        }
        r1.e eVar = (r1.e) this.f19533c;
        n0.f fVar2 = (n0.f) eVar.f85077a[z.e(i5, eVar)];
        this.f19534d = fVar2;
        return fVar2;
    }

    public int[] j(int i5) {
        ArrayDeque arrayDeque = (ArrayDeque) this.f19534d;
        j jVar = (j) g.Z0(ul.b.k(arrayDeque.getF71724c(), arrayDeque, new p(Integer.valueOf(i5), 23)), arrayDeque);
        if (jVar != null) {
            return jVar.a();
        }
        return null;
    }

    public int k(int i5) {
        int i11 = this.f19532b;
        if (i5 < i11) {
            return -1;
        }
        if (i5 >= ((int[]) this.f19533c).length + i11) {
            return -1;
        }
        return r1[i5 - i11] - 1;
    }

    public void l(int i5, int i11, int i12, int i13, int i14, int i15, boolean z11, boolean z12) {
        long[] jArr = (long[]) this.f19533c;
        int i16 = this.f19532b;
        int i17 = i16 + 3;
        this.f19532b = i17;
        int length = jArr.length;
        if (length <= i17) {
            int iMax = Math.max(length * 2, i17);
            long[] jArrCopyOf = Arrays.copyOf(jArr, iMax);
            Intrinsics.f(jArrCopyOf, "copyOf(...)");
            this.f19533c = jArrCopyOf;
            long[] jArrCopyOf2 = Arrays.copyOf((long[]) this.f19534d, iMax);
            Intrinsics.f(jArrCopyOf2, "copyOf(...)");
            this.f19534d = jArrCopyOf2;
        }
        long[] jArr2 = (long[]) this.f19533c;
        jArr2[i16] = (i11 << 32) | (i12 & 4294967295L);
        jArr2[i16 + 1] = (i13 << 32) | (i14 & 4294967295L);
        int i18 = i15 & 67108863;
        jArr2[i16 + 2] = ((z12 ? 1L : 0L) << 63) | ((z11 ? 1L : 0L) << 62) | (1 << 61) | (Math.min(0, 511) << 52) | (i18 << 26) | (i5 & 67108863);
        if (i15 < 0) {
            return;
        }
        for (int i19 = i16 - 3; i19 >= 0; i19 -= 3) {
            int i21 = i19 + 2;
            long j11 = jArr2[i21];
            if ((((int) j11) & 67108863) == i18) {
                jArr2[i21] = (j11 & (-2301339409586323457L)) | (Math.min(i16 - i19, 511) << 52);
                return;
            }
        }
    }

    public boolean m() {
        ColorStateList colorStateList;
        return ((Shader) this.f19533c) == null && (colorStateList = (ColorStateList) this.f19534d) != null && colorStateList.isStateful();
    }

    public boolean n(boolean z11) {
        s2 s2VarN0;
        if (z11) {
            y2.f51877a.getClass();
            s2VarN0 = y2.o0();
        } else {
            y2.f51877a.getClass();
            s2VarN0 = y2.n0();
        }
        NamedIntent namedIntent = (NamedIntent) s2VarN0.l();
        if (Intrinsics.b(namedIntent, NamedIntent.f46367d)) {
            return false;
        }
        Intent intent = new Intent(namedIntent.f46369b);
        intent.setSourceBounds(cz.c.i((cz.c) this.f19534d));
        NovaLauncher novaLauncher = (NovaLauncher) this.f19533c;
        novaLauncher.q0(novaLauncher.P, intent, new i(novaLauncher, namedIntent, s2VarN0));
        return true;
    }

    public void o(boolean z11) {
        s2 s2VarR0;
        if (z11) {
            y2.f51877a.getClass();
            s2VarR0 = y2.s0();
        } else {
            y2.f51877a.getClass();
            s2VarR0 = y2.r0();
        }
        NamedIntent namedIntent = (NamedIntent) s2VarR0.l();
        if (Intrinsics.b(namedIntent, NamedIntent.f46367d)) {
            return;
        }
        Intent intent = new Intent(namedIntent.f46369b);
        intent.setSourceBounds(cz.c.i((cz.c) this.f19534d));
        NovaLauncher novaLauncher = (NovaLauncher) this.f19533c;
        novaLauncher.q0(novaLauncher.P, intent, new i(novaLauncher, namedIntent, s2VarR0));
    }

    public c p(Object obj, Object obj2) {
        int i5 = (this.f19532b + 1) * 2;
        Object[] objArr = (Object[]) this.f19533c;
        if (i5 > objArr.length) {
            this.f19533c = Arrays.copyOf(objArr, m.c(objArr.length, i5));
        }
        w20.e.d(obj, obj2);
        Object[] objArr2 = (Object[]) this.f19533c;
        int i11 = this.f19532b;
        int i12 = i11 * 2;
        objArr2[i12] = obj;
        objArr2[i12 + 1] = obj2;
        this.f19532b = i11 + 1;
        return this;
    }

    public c q(Iterable iterable) {
        if (iterable instanceof Collection) {
            int size = (((Collection) iterable).size() + this.f19532b) * 2;
            Object[] objArr = (Object[]) this.f19533c;
            if (size > objArr.length) {
                this.f19533c = Arrays.copyOf(objArr, m.c(objArr.length, size));
            }
        }
        Iterator it = iterable.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            p(entry.getKey(), entry.getValue());
        }
        return this;
    }

    public c r(w2 w2Var) {
        return q(w2Var.entrySet());
    }

    public void s() {
        u90.b.C(0, 0, 6, (int[]) this.f19533c);
        ((ArrayDeque) this.f19534d).clear();
    }

    public void t(int i5, int i11) {
        if (!(i5 >= 0)) {
            j0.b.a("Negative lanes are not supported");
        }
        g(i5);
        ((int[]) this.f19533c)[i5 - this.f19532b] = i11 + 1;
    }

    public String toString() {
        switch (this.f19531a) {
            case 1:
                StringBuilder sb2 = new StringBuilder();
                if (((f0) this.f19533c) == f0.HTTP_1_0) {
                    sb2.append("HTTP/1.0");
                } else {
                    sb2.append("HTTP/1.1");
                }
                sb2.append(' ');
                sb2.append(this.f19532b);
                sb2.append(' ');
                sb2.append((String) this.f19534d);
                String string = sb2.toString();
                Intrinsics.f(string, "StringBuilder().apply(builderAction).toString()");
                return string;
            default:
                return super.toString();
        }
    }

    public void u(int i5, Function4 function4) {
        int i11 = i5 & 67108863;
        long[] jArr = (long[]) this.f19533c;
        int i12 = this.f19532b;
        for (int i13 = 0; i13 < jArr.length - 2 && i13 < i12; i13 += 3) {
            if ((((int) jArr[i13 + 2]) & 67108863) == i11) {
                long j11 = jArr[i13];
                long j12 = jArr[i13 + 1];
                function4.invoke(Integer.valueOf((int) (j11 >> 32)), Integer.valueOf((int) j11), Integer.valueOf((int) (j12 >> 32)), Integer.valueOf((int) j12));
                return;
            }
        }
    }

    public c(f0 f0Var, int i5, String str) {
        this.f19531a = 1;
        this.f19533c = f0Var;
        this.f19532b = i5;
        this.f19534d = str;
    }

    public c(int[] iArr) {
        int length;
        this.f19531a = 0;
        Arrays.sort(iArr);
        if (iArr.length < 2) {
            length = iArr.length;
        } else {
            int i5 = iArr[0];
            length = 1;
            for (int i11 = 1; i11 < iArr.length; i11++) {
                int i12 = iArr[i11];
                if (i12 != i5) {
                    length++;
                    i5 = i12;
                }
            }
        }
        this.f19532b = length;
        int[] iArr2 = new int[length];
        this.f19533c = iArr2;
        int[] iArr3 = new int[length];
        this.f19534d = iArr3;
        if (iArr.length == 0) {
            return;
        }
        int i13 = iArr[0];
        int iN = Color.alpha(i13) > 208 ? r4.a.n(i13, 255) : 0;
        iArr2[0] = iN;
        iArr3[0] = 1;
        if (iArr.length == 1) {
            return;
        }
        int i14 = 0;
        for (int i15 = 1; i15 < iArr.length; i15++) {
            int i16 = iArr[i15];
            int iN2 = Color.alpha(i16) > 208 ? r4.a.n(i16, 255) : 0;
            if (iN2 == iN) {
                iArr3[i14] = iArr3[i14] + 1;
            } else {
                i14++;
                iArr2[i14] = iN2;
                iArr3[i14] = 1;
                iN = iN2;
            }
        }
    }

    public c(NovaLauncher novaLauncher, cz.c cVar) {
        this.f19531a = 2;
        this.f19533c = novaLauncher;
        this.f19534d = cVar;
        this.f19532b = bh.g.M(novaLauncher, 16);
    }

    public c(Shader shader, ColorStateList colorStateList, int i5) {
        this.f19531a = 6;
        this.f19533c = shader;
        this.f19534d = colorStateList;
        this.f19532b = i5;
    }

    public c(int i5, byte b11) {
        this.f19531a = i5;
        switch (i5) {
            case 5:
                this.f19533c = new int[16];
                this.f19534d = new ArrayDeque();
                break;
            default:
                this.f19533c = new r1.e(new n0.f[16]);
                break;
        }
    }

    public c(int i5) {
        this.f19531a = 7;
        this.f19533c = new Object[i5 * 2];
        this.f19532b = 0;
    }
}
