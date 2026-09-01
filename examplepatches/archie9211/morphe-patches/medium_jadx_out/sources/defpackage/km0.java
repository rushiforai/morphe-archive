package defpackage;

import android.util.Log;
import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import java.io.PrintWriter;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class km0 implements c25 {
    public final ArrayList a;
    public int b;
    public int c;
    public int d;
    public int e;
    public int f;
    public boolean g;
    public boolean h;
    public String i;
    public int j;
    public CharSequence k;
    public int l;
    public CharSequence m;
    public ArrayList n;
    public ArrayList o;
    public boolean p;
    public final f25 q;
    public boolean r;
    public int s;
    public boolean t;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public km0(km0 km0Var) {
        this();
        km0Var.q.F();
        l15 l15Var = km0Var.q.v;
        if (l15Var != null) {
            l15Var.w.getClassLoader();
        }
        for (v25 v25Var : km0Var.a) {
            ArrayList arrayList = this.a;
            v25 v25Var2 = new v25();
            v25Var2.a = v25Var.a;
            v25Var2.b = v25Var.b;
            v25Var2.c = v25Var.c;
            v25Var2.d = v25Var.d;
            v25Var2.e = v25Var.e;
            v25Var2.f = v25Var.f;
            v25Var2.g = v25Var.g;
            v25Var2.h = v25Var.h;
            v25Var2.i = v25Var.i;
            arrayList.add(v25Var2);
        }
        this.b = km0Var.b;
        this.c = km0Var.c;
        this.d = km0Var.d;
        this.e = km0Var.e;
        this.f = km0Var.f;
        this.g = km0Var.g;
        this.h = km0Var.h;
        this.i = km0Var.i;
        this.l = km0Var.l;
        this.m = km0Var.m;
        this.j = km0Var.j;
        this.k = km0Var.k;
        if (km0Var.n != null) {
            ArrayList arrayList2 = new ArrayList();
            this.n = arrayList2;
            arrayList2.addAll(km0Var.n);
        }
        if (km0Var.o != null) {
            ArrayList arrayList3 = new ArrayList();
            this.o = arrayList3;
            arrayList3.addAll(km0Var.o);
        }
        this.p = km0Var.p;
        this.s = -1;
        this.t = false;
        this.q = km0Var.q;
        this.r = km0Var.r;
        this.s = km0Var.s;
        this.t = km0Var.t;
    }

    @Override // defpackage.c25
    public final boolean a(ArrayList arrayList, ArrayList arrayList2) {
        if (f25.I(2)) {
            Log.v("FragmentManager", "Run: " + this);
        }
        arrayList.add(this);
        arrayList2.add(Boolean.FALSE);
        if (!this.g) {
            return true;
        }
        f25 f25Var = this.q;
        ArrayList arrayList3 = f25Var.d;
        if (arrayList3 == null) {
            arrayList3 = new ArrayList();
            f25Var.d = arrayList3;
        }
        arrayList3.add(this);
        return true;
    }

    public final void b(v25 v25Var) {
        this.a.add(v25Var);
        v25Var.d = this.b;
        v25Var.e = this.c;
        v25Var.f = this.d;
        v25Var.g = this.e;
    }

    public final void e(int i, j15 j15Var, String str, int i2) {
        String str2 = j15Var.M;
        if (str2 != null) {
            u25.c(j15Var, str2);
        }
        Class<?> cls = j15Var.getClass();
        int modifiers = cls.getModifiers();
        if (cls.isAnonymousClass() || !Modifier.isPublic(modifiers) || (cls.isMemberClass() && !Modifier.isStatic(modifiers))) {
            z10.j("Fragment ", cls.getCanonicalName(), " must be a public static class to be  properly recreated from instance state.");
            return;
        }
        if (str != null) {
            String str3 = j15Var.y;
            if (str3 != null && !str.equals(str3)) {
                StringBuilder sb = new StringBuilder("Can't change tag of fragment ");
                sb.append(j15Var);
                sb.append(": was ");
                ygf.f(y30.s(sb, j15Var.y, " now ", str));
                return;
            }
            j15Var.y = str;
        }
        if (i != 0) {
            if (i == -1) {
                throw new IllegalArgumentException("Can't add fragment " + j15Var + " with tag " + str + " to container view with no id");
            }
            int i3 = j15Var.w;
            if (i3 != 0 && i3 != i) {
                StringBuilder sb2 = new StringBuilder("Can't change container ID of fragment ");
                sb2.append(j15Var);
                int i4 = j15Var.w;
                sb2.append(": was ");
                sb2.append(i4);
                sb2.append(" now ");
                sb2.append(i);
                throw new IllegalStateException(sb2.toString());
            }
            j15Var.w = i;
            j15Var.x = i;
        }
        b(new v25(i2, j15Var));
        j15Var.s = this.q;
    }

    public final void f(String str, PrintWriter printWriter, boolean z) {
        String str2;
        if (z) {
            printWriter.print(str);
            printWriter.print("mName=");
            printWriter.print(this.i);
            printWriter.print(" mIndex=");
            printWriter.print(this.s);
            printWriter.print(" mCommitted=");
            printWriter.println(this.r);
            if (this.f != 0) {
                printWriter.print(str);
                printWriter.print("mTransition=#");
                printWriter.print(Integer.toHexString(this.f));
            }
            if (this.b != 0 || this.c != 0) {
                printWriter.print(str);
                printWriter.print("mEnterAnim=#");
                printWriter.print(Integer.toHexString(this.b));
                printWriter.print(" mExitAnim=#");
                printWriter.println(Integer.toHexString(this.c));
            }
            if (this.d != 0 || this.e != 0) {
                printWriter.print(str);
                printWriter.print("mPopEnterAnim=#");
                printWriter.print(Integer.toHexString(this.d));
                printWriter.print(" mPopExitAnim=#");
                printWriter.println(Integer.toHexString(this.e));
            }
            if (this.j != 0 || this.k != null) {
                printWriter.print(str);
                printWriter.print("mBreadCrumbTitleRes=#");
                printWriter.print(Integer.toHexString(this.j));
                printWriter.print(" mBreadCrumbTitleText=");
                printWriter.println(this.k);
            }
            if (this.l != 0 || this.m != null) {
                printWriter.print(str);
                printWriter.print("mBreadCrumbShortTitleRes=#");
                printWriter.print(Integer.toHexString(this.l));
                printWriter.print(" mBreadCrumbShortTitleText=");
                printWriter.println(this.m);
            }
        }
        ArrayList arrayList = this.a;
        if (arrayList.isEmpty()) {
            return;
        }
        printWriter.print(str);
        printWriter.println("Operations:");
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            v25 v25Var = (v25) arrayList.get(i);
            switch (v25Var.a) {
                case 0:
                    str2 = "NULL";
                    break;
                case 1:
                    str2 = "ADD";
                    break;
                case 2:
                    str2 = "REPLACE";
                    break;
                case 3:
                    str2 = "REMOVE";
                    break;
                case 4:
                    str2 = "HIDE";
                    break;
                case 5:
                    str2 = "SHOW";
                    break;
                case 6:
                    str2 = "DETACH";
                    break;
                case 7:
                    str2 = "ATTACH";
                    break;
                case 8:
                    str2 = "SET_PRIMARY_NAV";
                    break;
                case 9:
                    str2 = "UNSET_PRIMARY_NAV";
                    break;
                case 10:
                    str2 = "OP_SET_MAX_LIFECYCLE";
                    break;
                default:
                    str2 = "cmd=" + v25Var.a;
                    break;
            }
            printWriter.print(str);
            printWriter.print("  Op #");
            printWriter.print(i);
            printWriter.print(": ");
            printWriter.print(str2);
            printWriter.print(" ");
            printWriter.println(v25Var.b);
            if (z) {
                if (v25Var.d != 0 || v25Var.e != 0) {
                    printWriter.print(str);
                    printWriter.print("enterAnim=#");
                    printWriter.print(Integer.toHexString(v25Var.d));
                    printWriter.print(" exitAnim=#");
                    printWriter.println(Integer.toHexString(v25Var.e));
                }
                if (v25Var.f != 0 || v25Var.g != 0) {
                    printWriter.print(str);
                    printWriter.print("popEnterAnim=#");
                    printWriter.print(Integer.toHexString(v25Var.f));
                    printWriter.print(" popExitAnim=#");
                    printWriter.println(Integer.toHexString(v25Var.g));
                }
            }
        }
    }

    public final void g(j15 j15Var) {
        f25 f25Var = j15Var.s;
        if (f25Var == null || f25Var == this.q) {
            b(new v25(8, j15Var));
            return;
        }
        throw new IllegalStateException("Cannot setPrimaryNavigation for Fragment attached to a different FragmentManager. Fragment " + j15Var.toString() + " is already attached to a FragmentManager.");
    }

    public final void c(int i) {
        if (this.g) {
            if (f25.I(2)) {
                Log.v("FragmentManager", "Bump nesting in " + this + QFTsJPDEnO.UEqcTlU + i);
            }
            ArrayList arrayList = this.a;
            int size = arrayList.size();
            for (int i2 = 0; i2 < size; i2++) {
                v25 v25Var = (v25) arrayList.get(i2);
                j15 j15Var = v25Var.b;
                if (j15Var != null) {
                    j15Var.r += i;
                    if (f25.I(2)) {
                        Log.v("FragmentManager", "Bump nesting of " + v25Var.b + " to " + v25Var.b.r);
                    }
                }
            }
        }
    }

    public final int d(boolean z) {
        if (this.r) {
            ygf.f(AEVqIoD.dDRpoZQpyONthd);
            return 0;
        }
        if (f25.I(2)) {
            Log.v("FragmentManager", AXoTRPEGKEve.ZQlUanUpnBr + this);
            PrintWriter printWriter = new PrintWriter(new a87());
            f("  ", printWriter, true);
            printWriter.close();
        }
        this.r = true;
        boolean z2 = this.g;
        f25 f25Var = this.q;
        if (z2) {
            this.s = f25Var.i.getAndIncrement();
        } else {
            this.s = -1;
        }
        f25Var.w(this, z);
        return this.s;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("BackStackEntry{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        if (this.s >= 0) {
            sb.append(uvlZTF.CbARzbdzAklwLz);
            sb.append(this.s);
        }
        if (this.i != null) {
            sb.append(" ");
            sb.append(this.i);
        }
        sb.append("}");
        return sb.toString();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public km0(f25 f25Var) {
        this();
        f25Var.F();
        l15 l15Var = f25Var.v;
        if (l15Var != null) {
            l15Var.w.getClassLoader();
        }
        this.s = -1;
        this.t = false;
        this.q = f25Var;
    }

    public km0() {
        this.a = new ArrayList();
        this.h = true;
        this.p = false;
    }
}
