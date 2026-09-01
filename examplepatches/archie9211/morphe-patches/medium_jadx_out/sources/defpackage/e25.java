package defpackage;

import android.os.Bundle;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e25 implements c25 {
    public final /* synthetic */ int a;
    public final String b;
    public final /* synthetic */ f25 c;

    public /* synthetic */ e25(f25 f25Var, String str, int i) {
        this.a = i;
        this.c = f25Var;
        this.b = str;
    }

    @Override // defpackage.c25
    public final boolean a(ArrayList arrayList, ArrayList arrayList2) throws Throwable {
        int i;
        int i2 = this.a;
        int i3 = 1;
        Throwable th = null;
        String str = this.b;
        f25 f25Var = this.c;
        switch (i2) {
            case 0:
                mm0 mm0Var = (mm0) f25Var.j.remove(str);
                if (mm0Var != null) {
                    HashMap map = new HashMap();
                    Iterator it2 = arrayList.iterator();
                    while (it2.hasNext()) {
                        km0 km0Var = (km0) it2.next();
                        if (km0Var.t) {
                            Iterator it3 = km0Var.a.iterator();
                            while (it3.hasNext()) {
                                j15 j15Var = ((v25) it3.next()).b;
                                if (j15Var != null) {
                                    map.put(j15Var.e, j15Var);
                                }
                            }
                        }
                    }
                    ArrayList<String> arrayList3 = mm0Var.a;
                    HashMap map2 = new HashMap(arrayList3.size());
                    for (String str2 : arrayList3) {
                        j15 j15Var2 = (j15) map.get(str2);
                        if (j15Var2 != null) {
                            map2.put(j15Var2.e, j15Var2);
                        } else {
                            Bundle bundleG0 = f25Var.c.g0(str2, null);
                            if (bundleG0 != null) {
                                ClassLoader classLoader = f25Var.v.w.getClassLoader();
                                j15 j15VarA = ((q25) bundleG0.getParcelable("state")).a(f25Var.F());
                                j15VarA.b = bundleG0;
                                if (bundleG0.getBundle("savedInstanceState") == null) {
                                    j15VarA.b.putBundle("savedInstanceState", new Bundle());
                                }
                                Bundle bundle = bundleG0.getBundle("arguments");
                                if (bundle != null) {
                                    bundle.setClassLoader(classLoader);
                                }
                                j15VarA.V(bundle);
                                map2.put(j15VarA.e, j15VarA);
                            }
                        }
                    }
                    ArrayList arrayList4 = new ArrayList();
                    for (lm0 lm0Var : mm0Var.b) {
                        ArrayList arrayList5 = lm0Var.b;
                        km0 km0Var2 = new km0(f25Var);
                        lm0Var.a(km0Var2);
                        for (int i4 = 0; i4 < arrayList5.size(); i4++) {
                            String str3 = (String) arrayList5.get(i4);
                            if (str3 != null) {
                                j15 j15Var3 = (j15) map2.get(str3);
                                if (j15Var3 != null) {
                                    ((v25) km0Var2.a.get(i4)).b = j15Var3;
                                } else {
                                    ygf.f(km4.C(new StringBuilder("Restoring FragmentTransaction "), lm0Var.f, " failed due to missing saved state for Fragment (", str3, ")"));
                                }
                            }
                        }
                        arrayList4.add(km0Var2);
                    }
                    Iterator it4 = arrayList4.iterator();
                    boolean z = false;
                    while (it4.hasNext()) {
                        ((km0) it4.next()).a(arrayList, arrayList2);
                        z = true;
                    }
                    return z;
                }
                return false;
            default:
                byte b = -1;
                int iB = f25Var.B(-1, str, true);
                if (iB < 0) {
                    return false;
                }
                for (int i5 = iB; i5 < f25Var.d.size(); i5++) {
                    km0 km0Var3 = (km0) f25Var.d.get(i5);
                    if (!km0Var3.p) {
                        f25Var.g0(new IllegalArgumentException("saveBackStack(\"" + str + "\") included FragmentTransactions must use setReorderingAllowed(true) to ensure that the back stack can be restored as an atomic operation. Found " + km0Var3 + " that did not use setReorderingAllowed(true)."));
                        throw null;
                    }
                }
                HashSet hashSet = new HashSet();
                int i6 = iB;
                while (i6 < f25Var.d.size()) {
                    km0 km0Var4 = (km0) f25Var.d.get(i6);
                    HashSet hashSet2 = new HashSet();
                    byte b2 = b;
                    HashSet hashSet3 = new HashSet();
                    for (v25 v25Var : km0Var4.a) {
                        Throwable th2 = th;
                        j15 j15Var4 = v25Var.b;
                        if (j15Var4 == null) {
                            th = th2;
                        } else {
                            if (!v25Var.c || (i = v25Var.a) == i3 || i == 2 || i == 8) {
                                hashSet.add(j15Var4);
                                hashSet2.add(j15Var4);
                            }
                            int i7 = v25Var.a;
                            if (i7 == 1 || i7 == 2) {
                                hashSet3.add(j15Var4);
                            }
                            th = th2;
                            i3 = 1;
                        }
                    }
                    Throwable th3 = th;
                    hashSet2.removeAll(hashSet3);
                    if (!hashSet2.isEmpty()) {
                        StringBuilder sbU = lv8.u("saveBackStack(\"", str, "\") must be self contained and not reference fragments from non-saved FragmentTransactions. Found reference to fragment");
                        sbU.append(hashSet2.size() == 1 ? " " + hashSet2.iterator().next() : "s " + hashSet2);
                        sbU.append(" in ");
                        sbU.append(km0Var4);
                        sbU.append(" that were previously added to the FragmentManager through a separate FragmentTransaction.");
                        f25Var.g0(new IllegalArgumentException(sbU.toString()));
                        throw th3;
                    }
                    i6++;
                    b = b2;
                    th = th3;
                    i3 = 1;
                }
                Throwable th4 = th;
                ArrayDeque arrayDeque = new ArrayDeque(hashSet);
                while (!arrayDeque.isEmpty()) {
                    j15 j15Var5 = (j15) arrayDeque.removeFirst();
                    if (j15Var5.B) {
                        StringBuilder sbU2 = lv8.u("saveBackStack(\"", str, "\") must not contain retained fragments. Found ");
                        sbU2.append(hashSet.contains(j15Var5) ? "direct reference to retained " : "retained child ");
                        sbU2.append("fragment ");
                        sbU2.append(j15Var5);
                        f25Var.g0(new IllegalArgumentException(sbU2.toString()));
                        throw th4;
                    }
                    for (j15 j15Var6 : j15Var5.u.c.K()) {
                        if (j15Var6 != null) {
                            arrayDeque.addLast(j15Var6);
                        }
                    }
                }
                ArrayList arrayList6 = new ArrayList();
                Iterator it5 = hashSet.iterator();
                while (it5.hasNext()) {
                    arrayList6.add(((j15) it5.next()).e);
                }
                ArrayList arrayList7 = new ArrayList(f25Var.d.size() - iB);
                int i8 = iB;
                while (i8 < f25Var.d.size()) {
                    arrayList7.add(th4);
                    i8++;
                    th4 = null;
                }
                mm0 mm0Var2 = new mm0(arrayList6, arrayList7);
                boolean z2 = true;
                int size = f25Var.d.size() - 1;
                while (size >= iB) {
                    km0 km0Var5 = (km0) f25Var.d.remove(size);
                    km0 km0Var6 = new km0(km0Var5);
                    ArrayList arrayList8 = km0Var6.a;
                    int size2 = arrayList8.size() - 1;
                    while (size2 >= 0) {
                        v25 v25Var2 = (v25) arrayList8.get(size2);
                        if (v25Var2.c) {
                            if (v25Var2.a == 8) {
                                v25Var2.c = false;
                                arrayList8.remove(size2 - 1);
                                size2--;
                            } else {
                                int i9 = v25Var2.b.x;
                                v25Var2.a = 2;
                                v25Var2.c = false;
                                for (int i10 = size2 - 1; i10 >= 0; i10--) {
                                    v25 v25Var3 = (v25) arrayList8.get(i10);
                                    if (v25Var3.c && v25Var3.b.x == i9) {
                                        arrayList8.remove(i10);
                                        size2--;
                                    }
                                }
                            }
                        }
                        size2--;
                    }
                    arrayList7.set(size - iB, new lm0(km0Var6));
                    km0Var5.t = true;
                    arrayList.add(km0Var5);
                    arrayList2.add(Boolean.TRUE);
                    size--;
                    z2 = true;
                }
                boolean z3 = z2;
                f25Var.j.put(str, mm0Var2);
                return z3;
        }
    }
}
