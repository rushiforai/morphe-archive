package com.google.android.gms.internal.measurement;

import android.net.Uri;
import android.os.Parcel;
import android.os.Process;
import com.amplitude.core.events.Identify;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.UnsupportedApiCallException;
import com.google.android.gms.tasks.Task;
import com.google.common.util.concurrent.ListenableFuture;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReferenceArray;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class l6 implements fi.c, rg.l, xe, cl.c0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32778a;

    /* renamed from: b, reason: collision with root package name */
    public Object f32779b;

    /* renamed from: c, reason: collision with root package name */
    public Object f32780c;

    public /* synthetic */ l6(int i5, Object obj, Object obj2) {
        this.f32778a = i5;
        this.f32779b = obj;
        this.f32780c = obj2;
    }

    @Override // com.google.android.gms.internal.measurement.xe
    public Object a(we weVar) throws IOException {
        Uri uri = weVar.f33196d;
        AtomicLong atomicLong = mf.f32823a;
        int iMyPid = Process.myPid();
        long id2 = Thread.currentThread().getId();
        long jCurrentTimeMillis = System.currentTimeMillis();
        long andIncrement = mf.f32823a.getAndIncrement();
        int length = String.valueOf(iMyPid).length();
        int length2 = String.valueOf(id2).length();
        StringBuilder sb2 = new StringBuilder(length + 15 + length2 + 1 + String.valueOf(jCurrentTimeMillis).length() + 1 + String.valueOf(andIncrement).length());
        sb2.append(".mobstore_tmp-");
        sb2.append(iMyPid);
        sb2.append(Identify.UNSET_VALUE);
        sb2.append(id2);
        b.c0.B(sb2, Identify.UNSET_VALUE, jCurrentTimeMillis, Identify.UNSET_VALUE);
        sb2.append(andIncrement);
        Uri uriBuild = uri.buildUpon().path(String.valueOf(uri.getPath()).concat(sb2.toString())).build();
        nf nfVar = weVar.f33193a;
        ArrayList arrayListA = weVar.a(nfVar.d(uriBuild));
        l6[] l6VarArr = (l6[]) this.f32780c;
        if (l6VarArr != null) {
            l6VarArr[0].d(arrayListA);
        }
        try {
            OutputStream outputStream = (OutputStream) arrayListA.get(0);
            try {
                ((n0) this.f32779b).b(outputStream);
                l6[] l6VarArr2 = (l6[]) this.f32780c;
                if (l6VarArr2 != null) {
                    l6 l6Var = l6VarArr2[0];
                    if (((gf) l6Var.f32780c) == null) {
                        throw new zzsk("Cannot sync underlying stream");
                    }
                    ((OutputStream) l6Var.f32779b).flush();
                    ((gf) l6Var.f32780c).f32576a.getFD().sync();
                }
                outputStream.close();
                nfVar.f(uriBuild, uri);
                return null;
            } finally {
            }
        } catch (Exception e3) {
            try {
                nfVar.e(uriBuild);
            } catch (FileNotFoundException unused) {
            }
            if (e3 instanceof IOException) {
                throw ((IOException) e3);
            }
            throw new IOException(e3);
        }
    }

    @Override // rg.l
    public void accept(Object obj, Object obj2) {
        int i5 = ab.f32377l;
        ya yaVar = new ya((fi.j) obj2);
        bb bbVar = (bb) ((cb) obj).getService();
        String[] strArr = (String[]) this.f32780c;
        String str = (String) this.f32779b;
        Parcel parcelX = bbVar.X();
        r6.c(parcelX, yaVar);
        parcelX.writeString(str);
        parcelX.writeInt(0);
        parcelX.writeStringArray(strArr);
        parcelX.writeByteArray(null);
        bbVar.Z(parcelX, 1);
    }

    public hd b(int i5, String str, boolean z11) {
        AtomicReferenceArray atomicReferenceArray = (AtomicReferenceArray) this.f32779b;
        hd hdVar = (hd) atomicReferenceArray.get(i5);
        if (hdVar != null) {
            return hdVar;
        }
        dd ddVarA = ((d2) this.f32780c).a(str, z11);
        while (!atomicReferenceArray.compareAndSet(i5, null, ddVarA)) {
            if (atomicReferenceArray.get(i5) != null) {
                hd hdVar2 = (hd) atomicReferenceArray.get(i5);
                hdVar2.getClass();
                return hdVar2;
            }
        }
        return ddVarA;
    }

    public void c(k6 k6Var) {
        Iterator it = k6Var.f32729a.iterator();
        while (it.hasNext()) {
            ((HashMap) this.f32779b).put(Integer.valueOf(((o6) it.next()).f32909a).toString(), k6Var);
        }
    }

    @Override // cl.c0
    public ListenableFuture call() {
        switch (this.f32778a) {
            case 6:
                qf qfVar = (qf) this.f32780c;
                String strValueOf = String.valueOf(qfVar.f33007a);
                k1 k1Var = qfVar.f33014h;
                String strConcat = "Initialize ".concat(strValueOf);
                k1Var.getClass();
                qg qgVarB = k1.b(strConcat);
                try {
                    synchronized (qfVar.f33013g) {
                        try {
                            if (((List) this.f32779b) == null) {
                                this.f32779b = qfVar.f33015i;
                                qfVar.f33015i = Collections.EMPTY_LIST;
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    ArrayList arrayList = new ArrayList(((List) this.f32779b).size());
                    wf wfVar = new wf((qf) this.f32780c);
                    Iterator it = ((List) this.f32779b).iterator();
                    while (it.hasNext()) {
                        try {
                            arrayList.add(((cl.d0) it.next()).apply(wfVar));
                        } catch (Exception e3) {
                            arrayList.add(new cl.y0(e3));
                        }
                    }
                    xk.v0 v0VarN = xk.v0.n(arrayList);
                    a aVar = new a(this, 2);
                    cl.j0 j0Var = new cl.j0(v0VarN, true, false);
                    j0Var.f20023p = new cl.h0(j0Var, aVar);
                    j0Var.w();
                    qgVarB.a(j0Var);
                    qgVarB.close();
                    return j0Var;
                } catch (Throwable th3) {
                    try {
                        qgVarB.close();
                    } catch (Throwable th4) {
                        th3.addSuppressed(th4);
                    }
                    throw th3;
                }
            default:
                zg zgVar = (zg) this.f32779b;
                yg ygVarC = jg.c();
                zg zgVarB = jg.b(ygVarC, zgVar);
                try {
                    ListenableFuture listenableFutureCall = ((cl.c0) this.f32780c).call();
                    jg.b(ygVarC, zgVarB);
                    Intrinsics.f(listenableFutureCall, "wrapInTrace(...)");
                    return listenableFutureCall;
                } finally {
                }
        }
    }

    public void d(ArrayList arrayList) {
        OutputStream outputStream = (OutputStream) v30.e.p(arrayList);
        if (outputStream instanceof gf) {
            this.f32780c = (gf) outputStream;
            this.f32779b = (OutputStream) arrayList.get(0);
        }
    }

    public f6 e(j8 j8Var, f6 f6Var) {
        gh.o(j8Var);
        if (!(f6Var instanceof g6)) {
            return f6Var;
        }
        g6 g6Var = (g6) f6Var;
        ArrayList arrayList = g6Var.f32564b;
        String str = g6Var.f32563a;
        HashMap map = (HashMap) this.f32779b;
        return (map.containsKey(str) ? (k6) map.get(str) : (k6) this.f32780c).a(str, j8Var, arrayList);
    }

    public hd f(int i5, long j11, String str) {
        AtomicReferenceArray atomicReferenceArray = (AtomicReferenceArray) this.f32779b;
        hd hdVar = (hd) atomicReferenceArray.get(i5);
        if (hdVar != null) {
            return hdVar;
        }
        fd fdVar = new fd(str, (td) ((d2) this.f32780c).f32451b, j11);
        while (!atomicReferenceArray.compareAndSet(i5, null, fdVar)) {
            if (atomicReferenceArray.get(i5) != null) {
                hd hdVar2 = (hd) atomicReferenceArray.get(i5);
                hdVar2.getClass();
                return hdVar2;
            }
        }
        return fdVar;
    }

    public void g(j8 j8Var, mg.l lVar) {
        hb hbVar = new hb(lVar);
        TreeMap treeMap = (TreeMap) this.f32779b;
        for (Integer num : treeMap.keySet()) {
            b bVarA = ((b) lVar.f76310c).clone();
            f6 f6VarA = ((e6) treeMap.get(num)).a(j8Var, Collections.singletonList(hbVar));
            int iK = f6VarA instanceof s3 ? gh.k(((s3) f6VarA).f33048a.doubleValue()) : -1;
            if (iK == 2 || iK == -1) {
                lVar.f76310c = bVarA;
            }
        }
        TreeMap treeMap2 = (TreeMap) this.f32780c;
        Iterator it = treeMap2.keySet().iterator();
        while (it.hasNext()) {
            f6 f6VarA2 = ((e6) treeMap2.get((Integer) it.next())).a(j8Var, Collections.singletonList(hbVar));
            if (f6VarA2 instanceof s3) {
                ((s3) f6VarA2).f33048a.getClass();
            }
        }
    }

    public hd h(int i5, String str, String str2) {
        AtomicReferenceArray atomicReferenceArray = (AtomicReferenceArray) this.f32779b;
        hd hdVar = (hd) atomicReferenceArray.get(i5);
        if (hdVar != null) {
            return hdVar;
        }
        gd gdVar = new gd(str, (td) ((d2) this.f32780c).f32451b, str2);
        while (!atomicReferenceArray.compareAndSet(i5, null, gdVar)) {
            if (atomicReferenceArray.get(i5) != null) {
                hd hdVar2 = (hd) atomicReferenceArray.get(i5);
                hdVar2.getClass();
                return hdVar2;
            }
        }
        return gdVar;
    }

    @Override // fi.c
    public Object then(Task task) {
        boolean z11 = task.l() instanceof UnsupportedApiCallException;
        bc bcVar = (bc) this.f32780c;
        ab abVar = (ab) this.f32779b;
        if (z11) {
            return abVar.d(bcVar.x());
        }
        if (!(task.l() instanceof ApiException)) {
            return task;
        }
        ApiException apiException = (ApiException) task.l();
        apiException.getClass();
        return apiException.f31794a.f31810f == 29514 ? abVar.d(bcVar.x()) : task;
    }

    public String toString() {
        switch (this.f32778a) {
            case 7:
                cl.c0 c0Var = (cl.c0) this.f32780c;
                StringBuilder sb2 = new StringBuilder(c0Var.toString().length() + 14);
                sb2.append("propagating=[");
                sb2.append(c0Var);
                sb2.append("]");
                return sb2.toString();
            default:
                return super.toString();
        }
    }

    public l6(n0 n0Var) {
        this.f32778a = 5;
        this.f32779b = n0Var;
    }

    public l6(int i5) {
        this.f32778a = i5;
        switch (i5) {
            case 4:
                break;
            case 8:
                this.f32779b = new TreeMap();
                this.f32780c = new TreeMap();
                break;
            default:
                this.f32779b = new HashMap();
                this.f32780c = new k6(6);
                k6 k6Var = new k6(0);
                o6 o6Var = o6.BITWISE_AND;
                ArrayList arrayList = k6Var.f32729a;
                arrayList.add(o6Var);
                arrayList.add(o6.BITWISE_LEFT_SHIFT);
                arrayList.add(o6.BITWISE_NOT);
                arrayList.add(o6.BITWISE_OR);
                arrayList.add(o6.BITWISE_RIGHT_SHIFT);
                arrayList.add(o6.BITWISE_UNSIGNED_RIGHT_SHIFT);
                arrayList.add(o6.BITWISE_XOR);
                c(k6Var);
                k6 k6Var2 = new k6(1);
                o6 o6Var2 = o6.EQUALS;
                ArrayList arrayList2 = k6Var2.f32729a;
                arrayList2.add(o6Var2);
                arrayList2.add(o6.GREATER_THAN);
                arrayList2.add(o6.GREATER_THAN_EQUALS);
                arrayList2.add(o6.IDENTITY_EQUALS);
                arrayList2.add(o6.IDENTITY_NOT_EQUALS);
                arrayList2.add(o6.LESS_THAN);
                arrayList2.add(o6.LESS_THAN_EQUALS);
                arrayList2.add(o6.NOT_EQUALS);
                c(k6Var2);
                k6 k6Var3 = new k6(2);
                o6 o6Var3 = o6.APPLY;
                ArrayList arrayList3 = k6Var3.f32729a;
                arrayList3.add(o6Var3);
                arrayList3.add(o6.BLOCK);
                arrayList3.add(o6.BREAK);
                arrayList3.add(o6.CASE);
                arrayList3.add(o6.DEFAULT);
                arrayList3.add(o6.CONTINUE);
                arrayList3.add(o6.DEFINE_FUNCTION);
                arrayList3.add(o6.FN);
                arrayList3.add(o6.IF);
                arrayList3.add(o6.QUOTE);
                arrayList3.add(o6.RETURN);
                arrayList3.add(o6.SWITCH);
                arrayList3.add(o6.TERNARY);
                c(k6Var3);
                k6 k6Var4 = new k6(3);
                o6 o6Var4 = o6.AND;
                ArrayList arrayList4 = k6Var4.f32729a;
                arrayList4.add(o6Var4);
                arrayList4.add(o6.NOT);
                arrayList4.add(o6.OR);
                c(k6Var4);
                k6 k6Var5 = new k6(4);
                o6 o6Var5 = o6.FOR_IN;
                ArrayList arrayList5 = k6Var5.f32729a;
                arrayList5.add(o6Var5);
                arrayList5.add(o6.FOR_IN_CONST);
                arrayList5.add(o6.FOR_IN_LET);
                arrayList5.add(o6.FOR_LET);
                arrayList5.add(o6.FOR_OF);
                arrayList5.add(o6.FOR_OF_CONST);
                arrayList5.add(o6.FOR_OF_LET);
                arrayList5.add(o6.WHILE);
                c(k6Var5);
                k6 k6Var6 = new k6(5);
                o6 o6Var6 = o6.ADD;
                ArrayList arrayList6 = k6Var6.f32729a;
                arrayList6.add(o6Var6);
                arrayList6.add(o6.DIVIDE);
                arrayList6.add(o6.MODULUS);
                arrayList6.add(o6.MULTIPLY);
                arrayList6.add(o6.NEGATE);
                arrayList6.add(o6.POST_DECREMENT);
                arrayList6.add(o6.POST_INCREMENT);
                arrayList6.add(o6.PRE_DECREMENT);
                arrayList6.add(o6.PRE_INCREMENT);
                arrayList6.add(o6.SUBTRACT);
                c(k6Var6);
                k6 k6Var7 = new k6(7);
                o6 o6Var7 = o6.ASSIGN;
                ArrayList arrayList7 = k6Var7.f32729a;
                arrayList7.add(o6Var7);
                arrayList7.add(o6.CONST);
                arrayList7.add(o6.CREATE_ARRAY);
                arrayList7.add(o6.CREATE_OBJECT);
                arrayList7.add(o6.EXPRESSION_LIST);
                arrayList7.add(o6.GET);
                arrayList7.add(o6.GET_INDEX);
                arrayList7.add(o6.GET_PROPERTY);
                arrayList7.add(o6.NULL);
                arrayList7.add(o6.SET_PROPERTY);
                arrayList7.add(o6.TYPEOF);
                arrayList7.add(o6.UNDEFINED);
                arrayList7.add(o6.VAR);
                c(k6Var7);
                break;
        }
    }

    public l6(d2 d2Var, int i5) {
        this.f32778a = 3;
        this.f32780c = d2Var;
        this.f32779b = new AtomicReferenceArray(i5);
    }

    public /* synthetic */ l6(qf qfVar) {
        this.f32778a = 6;
        this.f32780c = qfVar;
    }
}
