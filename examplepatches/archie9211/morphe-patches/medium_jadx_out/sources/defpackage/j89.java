package defpackage;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j89 implements d40 {
    public final /* synthetic */ int a = 2;
    public final String b;
    public final ReentrantLock c;
    public final Object d;

    public j89(String str) {
        str.getClass();
        this.b = str;
        this.d = new LinkedHashMap();
        this.c = new ReentrantLock();
    }

    @Override // defpackage.d40
    public final Object N(p92 p92Var) {
        int i = this.a;
        return c1e.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v0, types: [ey3] */
    /* JADX WARN: Type inference failed for: r2v1, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r2v2, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r2v4, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r2v5, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r2v6, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r2v7 */
    /* JADX WARN: Type inference failed for: r2v8 */
    /* JADX WARN: Type inference failed for: r2v9 */
    @Override // defpackage.ba2
    public final List P(qt5 qt5Var) {
        ?? Q;
        int i = this.a;
        Object obj = this.d;
        ?? arrayList = ey3.a;
        String str = this.b;
        ReentrantLock reentrantLock = this.c;
        qt5Var.getClass();
        switch (i) {
            case 0:
                reentrantLock.lock();
                try {
                    if (g76.L(qt5Var.i(), str)) {
                        ArrayList arrayListB = ((u3) obj).b();
                        arrayList = new ArrayList();
                        for (Object obj2 : arrayListB) {
                            if (((aa2) obj2).a(qt5Var)) {
                                arrayList.add(obj2);
                            }
                            break;
                        }
                    }
                    return arrayList;
                } finally {
                }
            case 1:
                reentrantLock.lock();
                try {
                    if (g76.L(qt5Var.i(), str)) {
                        String strN = ((qn7) obj).n(ek6.STAGE_BRANCH, null);
                        Q = arrayList;
                        if (strN != null) {
                            z92 z92Var = new z92();
                            z92Var.b(str);
                            z92Var.e("/");
                            z92Var.d("_branch_deploy");
                            z92Var.f(strN);
                            z92Var.c(System.currentTimeMillis() + 31536000000L);
                            z92Var.f = true;
                            z92Var.g = true;
                            Q = d46.Q(z92Var.a());
                        }
                        break;
                    } else {
                        Q = arrayList;
                    }
                    return Q;
                } finally {
                }
            default:
                reentrantLock.lock();
                try {
                    if (g76.L(qt5Var.i(), str)) {
                        List listM1 = bu1.m1(((LinkedHashMap) obj).values());
                        arrayList = new ArrayList();
                        for (Object obj3 : listM1) {
                            if (((aa2) obj3).a(qt5Var)) {
                                arrayList.add(obj3);
                            }
                            break;
                        }
                    }
                    return arrayList;
                } finally {
                }
        }
    }

    @Override // defpackage.d40
    public final void clear() {
        int i = this.a;
        Object obj = this.d;
        ReentrantLock reentrantLock = this.c;
        switch (i) {
            case 0:
                reentrantLock.lock();
                try {
                    vr7 vr7Var = ((u3) obj).a;
                    vr7Var.getClass();
                    vr7Var.e(ek6.COOKIE_JAR);
                    return;
                } finally {
                }
            case 1:
                return;
            default:
                reentrantLock.lock();
                try {
                    ((LinkedHashMap) obj).clear();
                    return;
                } finally {
                }
        }
    }

    @Override // defpackage.ba2
    public final void z(qt5 qt5Var, List list) {
        int i = this.a;
        Object obj = this.d;
        String str = this.b;
        ReentrantLock reentrantLock = this.c;
        qt5Var.getClass();
        switch (i) {
            case 0:
                reentrantLock.lock();
                try {
                    if (g76.L(qt5Var.i(), str)) {
                        ArrayList arrayList = new ArrayList();
                        for (Object obj2 : list) {
                            if (((aa2) obj2).h) {
                                arrayList.add(obj2);
                            }
                        }
                        if (arrayList.isEmpty()) {
                            arrayList = null;
                        }
                        if (arrayList != null) {
                            ((u3) obj).g(arrayList);
                        }
                        break;
                    }
                    reentrantLock.unlock();
                    return;
                } finally {
                    reentrantLock.unlock();
                }
            case 1:
                return;
            default:
                reentrantLock.lock();
                try {
                    if (g76.L(qt5Var.i(), str)) {
                        ArrayList<aa2> arrayList2 = new ArrayList();
                        for (Object obj3 : list) {
                            if (!((aa2) obj3).h) {
                                arrayList2.add(obj3);
                            }
                        }
                        for (aa2 aa2Var : arrayList2) {
                            ((LinkedHashMap) obj).put(new ca2(aa2Var.d, aa2Var.e, aa2Var.a), aa2Var);
                            break;
                        }
                    }
                    return;
                } finally {
                    reentrantLock.unlock();
                }
        }
    }

    private final void a() {
    }

    public j89(String str, u3 u3Var) {
        str.getClass();
        this.b = str;
        this.d = u3Var;
        this.c = new ReentrantLock();
    }

    public j89(String str, qn7 qn7Var) {
        str.getClass();
        this.b = str;
        this.d = qn7Var;
        this.c = new ReentrantLock();
    }
}
