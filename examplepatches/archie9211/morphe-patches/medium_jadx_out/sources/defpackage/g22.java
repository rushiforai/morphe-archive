package defpackage;

import io.reactivex.exceptions.CompositeException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class g22 implements sh3 {
    public final /* synthetic */ int a;
    public volatile boolean b;
    public Object c;

    public /* synthetic */ g22(int i) {
        this.a = i;
    }

    private final boolean b(sh3 sh3Var) {
        if (!this.b) {
            synchronized (this) {
                try {
                    if (!this.b) {
                        ym0 ym0Var = (ym0) this.c;
                        if (ym0Var == null) {
                            ym0Var = new ym0(4);
                            int iNumberOfLeadingZeros = 1 << (32 - Integer.numberOfLeadingZeros(15));
                            ym0Var.b = iNumberOfLeadingZeros - 1;
                            ym0Var.d = (int) (0.75f * iNumberOfLeadingZeros);
                            ym0Var.e = new Object[iNumberOfLeadingZeros];
                            this.c = ym0Var;
                        }
                        ym0Var.b(sh3Var);
                        return true;
                    }
                } finally {
                }
            }
        }
        sh3Var.dispose();
        return false;
    }

    private final boolean d(sh3 sh3Var) {
        Object obj;
        if (this.b) {
            return false;
        }
        synchronized (this) {
            try {
                if (this.b) {
                    return false;
                }
                ym0 ym0Var = (ym0) this.c;
                if (ym0Var != null) {
                    Object[] objArr = (Object[]) ym0Var.e;
                    int i = ym0Var.b;
                    int iHashCode = sh3Var.hashCode() * (-1640531527);
                    int i2 = (iHashCode ^ (iHashCode >>> 16)) & i;
                    Object obj2 = objArr[i2];
                    if (obj2 != null) {
                        if (obj2.equals(sh3Var)) {
                            ym0Var.k(i2, i, objArr);
                        } else {
                            do {
                                i2 = (i2 + 1) & i;
                                obj = objArr[i2];
                                if (obj == null) {
                                }
                            } while (!obj.equals(sh3Var));
                            ym0Var.k(i2, i, objArr);
                        }
                        return true;
                    }
                }
                return false;
            } finally {
            }
        }
    }

    public static void e(ym0 ym0Var) {
        if (ym0Var == null) {
            return;
        }
        ArrayList arrayList = null;
        for (Object obj : (Object[]) ym0Var.e) {
            if (obj instanceof sh3) {
                try {
                    ((sh3) obj).dispose();
                } catch (Throwable th) {
                    pwd.c0(th);
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                    }
                    arrayList.add(th);
                }
            }
        }
        if (arrayList != null) {
            if (arrayList.size() != 1) {
                throw new CompositeException(arrayList);
            }
            throw w34.a((Throwable) arrayList.get(0));
        }
    }

    private final void f() {
        if (this.b) {
            return;
        }
        synchronized (this) {
            try {
                if (this.b) {
                    return;
                }
                this.b = true;
                ym0 ym0Var = (ym0) this.c;
                this.c = null;
                e(ym0Var);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final boolean a(sh3 sh3Var) {
        switch (this.a) {
            case 0:
                return b(sh3Var);
            default:
                if (!this.b) {
                    synchronized (this) {
                        try {
                            if (!this.b) {
                                LinkedList linkedList = (LinkedList) this.c;
                                if (linkedList == null) {
                                    linkedList = new LinkedList();
                                    this.c = linkedList;
                                }
                                linkedList.add(sh3Var);
                                return true;
                            }
                        } finally {
                        }
                    }
                }
                sh3Var.dispose();
                return false;
        }
    }

    public final boolean c(sh3 sh3Var) {
        switch (this.a) {
            case 0:
                return d(sh3Var);
            default:
                boolean z = false;
                if (!this.b) {
                    synchronized (this) {
                        try {
                            if (!this.b) {
                                LinkedList linkedList = (LinkedList) this.c;
                                if (linkedList != null && linkedList.remove(sh3Var)) {
                                    z = true;
                                }
                            }
                        } finally {
                        }
                    }
                    break;
                }
                return z;
        }
    }

    @Override // defpackage.sh3
    public final void dispose() {
        switch (this.a) {
            case 0:
                f();
                return;
            default:
                if (this.b) {
                    return;
                }
                synchronized (this) {
                    try {
                        if (!this.b) {
                            this.b = true;
                            LinkedList linkedList = (LinkedList) this.c;
                            ArrayList arrayList = null;
                            this.c = null;
                            if (linkedList != null) {
                                Iterator it2 = linkedList.iterator();
                                while (it2.hasNext()) {
                                    try {
                                        ((sh3) it2.next()).dispose();
                                    } catch (Throwable th) {
                                        pwd.c0(th);
                                        if (arrayList == null) {
                                            arrayList = new ArrayList();
                                        }
                                        arrayList.add(th);
                                    }
                                }
                                if (arrayList != null) {
                                    if (arrayList.size() != 1) {
                                        throw new CompositeException(arrayList);
                                    }
                                    throw w34.a((Throwable) arrayList.get(0));
                                }
                            }
                        }
                    } finally {
                    }
                }
                return;
        }
    }

    public final boolean g(sh3 sh3Var) {
        switch (this.a) {
            case 0:
                if (c(sh3Var)) {
                    sh3Var.dispose();
                }
                break;
            default:
                if (c(sh3Var)) {
                    ((lqb) sh3Var).dispose();
                }
                break;
        }
        return true;
    }
}
