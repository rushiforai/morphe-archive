package w50;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f93779a;

    /* renamed from: b, reason: collision with root package name */
    public int f93780b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f93781c;

    /* renamed from: d, reason: collision with root package name */
    public g f93782d;

    @NotNull
    private volatile /* synthetic */ Object interceptors$delegate;

    public d(g... gVarArr) {
        new s50.d();
        this.f93779a = ul.b.T(Arrays.copyOf(gVarArr, gVarArr.length));
        this.interceptors$delegate = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x005a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Object context, Object subject, ContinuationImpl continuationImpl) {
        int iK;
        int iK2;
        CoroutineContext coroutineContext = continuationImpl.getContext();
        if (((List) this.interceptors$delegate) == null) {
            int i5 = this.f93780b;
            if (i5 == 0) {
                this.interceptors$delegate = EmptyList.f71733a;
                this.f93781c = false;
                this.f93782d = null;
            } else {
                ArrayList arrayList = this.f93779a;
                if (i5 != 1 || (iK2 = ul.b.K(arrayList)) < 0) {
                    ArrayList arrayList2 = new ArrayList();
                    iK = ul.b.K(arrayList);
                    if (iK >= 0) {
                        int i11 = 0;
                        while (true) {
                            Object obj = arrayList.get(i11);
                            c cVar = obj instanceof c ? (c) obj : null;
                            if (cVar != null) {
                                List list = cVar.f93777c;
                                arrayList2.ensureCapacity(list.size() + arrayList2.size());
                                int size = list.size();
                                for (int i12 = 0; i12 < size; i12++) {
                                    arrayList2.add(list.get(i12));
                                }
                            }
                            if (i11 == iK) {
                                break;
                            }
                            i11++;
                        }
                    }
                    this.interceptors$delegate = arrayList2;
                    this.f93781c = false;
                    this.f93782d = null;
                } else {
                    int i13 = 0;
                    while (true) {
                        Object obj2 = arrayList.get(i13);
                        c cVar2 = obj2 instanceof c ? (c) obj2 : null;
                        if (cVar2 != null && !cVar2.f93777c.isEmpty()) {
                            List list2 = cVar2.f93777c;
                            cVar2.f93778d = true;
                            this.interceptors$delegate = list2;
                            this.f93781c = false;
                            this.f93782d = cVar2.f93775a;
                            break;
                        }
                        if (i13 == iK2) {
                            break;
                        }
                        i13++;
                    }
                    ArrayList arrayList22 = new ArrayList();
                    iK = ul.b.K(arrayList);
                    if (iK >= 0) {
                    }
                    this.interceptors$delegate = arrayList22;
                    this.f93781c = false;
                    this.f93782d = null;
                }
            }
        }
        this.f93781c = true;
        List list3 = (List) this.interceptors$delegate;
        Intrinsics.d(list3);
        boolean zD = d();
        Intrinsics.g(context, "context");
        Intrinsics.g(subject, "subject");
        Intrinsics.g(coroutineContext, "coroutineContext");
        return ((f.f93784a || zD) ? new b(context, list3, subject, coroutineContext) : new m(subject, context, list3)).a(subject, continuationImpl);
    }

    public final c b(g gVar) {
        ArrayList arrayList = this.f93779a;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            Object obj = arrayList.get(i5);
            if (obj == gVar) {
                c cVar = new c(gVar, j.f93788a);
                arrayList.set(i5, cVar);
                return cVar;
            }
            if (obj instanceof c) {
                c cVar2 = (c) obj;
                if (cVar2.f93775a == gVar) {
                    return cVar2;
                }
            }
        }
        return null;
    }

    public final int c(g gVar) {
        ArrayList arrayList = this.f93779a;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            Object obj = arrayList.get(i5);
            if (obj == gVar || ((obj instanceof c) && ((c) obj).f93775a == gVar)) {
                return i5;
            }
        }
        return -1;
    }

    public abstract boolean d();

    public final boolean e(g gVar) {
        ArrayList arrayList = this.f93779a;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            Object obj = arrayList.get(i5);
            if (obj == gVar) {
                return true;
            }
            if ((obj instanceof c) && ((c) obj).f93775a == gVar) {
                return true;
            }
        }
        return false;
    }

    public final void f(g phase, Function3 function3) {
        Intrinsics.g(phase, "phase");
        c cVarB = b(phase);
        if (cVarB == null) {
            throw new cl.e("Phase " + phase + " was not registered for this pipeline");
        }
        List list = (List) this.interceptors$delegate;
        if (!this.f93779a.isEmpty() && list != null && !this.f93781c && TypeIntrinsics.g(list)) {
            if (Intrinsics.b(this.f93782d, phase)) {
                list.add(function3);
            } else if (phase.equals(b70.g.h1(this.f93779a)) || c(phase) == ul.b.K(this.f93779a)) {
                c cVarB2 = b(phase);
                Intrinsics.d(cVarB2);
                if (cVarB2.f93778d) {
                    cVarB2.f93777c = b70.g.K1(cVarB2.f93777c);
                    cVarB2.f93778d = false;
                }
                cVarB2.f93777c.add(function3);
                list.add(function3);
            }
            this.f93780b++;
            return;
        }
        if (cVarB.f93778d) {
            cVarB.f93777c = b70.g.K1(cVarB.f93777c);
            cVarB.f93778d = false;
        }
        cVarB.f93777c.add(function3);
        this.f93780b++;
        this.interceptors$delegate = null;
        this.f93781c = false;
        this.f93782d = null;
    }
}
