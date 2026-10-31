package com.google.android.gms.internal.measurement;

import android.net.Uri;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public final /* synthetic */ class be implements cl.d0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32406a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f32407b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f32408c;

    public /* synthetic */ be(int i5, Object obj, Object obj2) {
        this.f32406a = i5;
        this.f32407b = obj;
        this.f32408c = obj2;
    }

    @Override // cl.d0
    public final ListenableFuture apply(Object obj) {
        switch (this.f32406a) {
            case 0:
                ee eeVar = (ee) this.f32407b;
                return ((hc) eeVar.f32505d.get()).a(new de(eeVar, (he) this.f32408c));
            case 1:
                List list = (List) this.f32407b;
                wf wfVar = (wf) obj;
                int size = list.size();
                ArrayList arrayList = new ArrayList(size);
                Iterator it = list.iterator();
                if (it.hasNext()) {
                    throw b.u4.e(it);
                }
                pf pfVar = new pf(this, arrayList, size);
                int i5 = bh.f32414a;
                int i11 = 4;
                be beVar = new be(i11, jg.a(), pfVar);
                cl.m0 m0Var = cl.m0.f20038a;
                return cl.w0.f(cl.w0.e(cl.w0.f(cl.w0.c(wfVar.f33197a.f33011e.F()), new be(i11, jg.a(), new be(3, wfVar, beVar)), m0Var), new vk.h(), m0Var), new be(i11, jg.a(), new pf(this, size, arrayList)), m0Var);
            case 2:
                vf vfVar = (vf) this.f32407b;
                cl.u uVar = (cl.u) this.f32408c;
                vfVar.f((Uri) cl.w0.a((ListenableFuture) vfVar.f33149b), obj);
                synchronized (vfVar.f33156i) {
                    vfVar.f33150c = uVar;
                }
                return cl.w0.b(obj);
            case 3:
                return ((wf) this.f32407b).f33197a.f33009c.d((be) this.f32408c, cl.m0.f20038a);
            default:
                zg zgVarB = jg.b(jg.c(), (zg) this.f32407b);
                try {
                    ListenableFuture listenableFutureApply = ((cl.d0) this.f32408c).apply(obj);
                    if (listenableFutureApply != null) {
                        return listenableFutureApply;
                    }
                    throw new IllegalStateException("AsyncFunction should return a ListenableFuture instead of null.");
                } finally {
                }
        }
    }

    public String toString() {
        switch (this.f32406a) {
            case 4:
                cl.d0 d0Var = (cl.d0) this.f32408c;
                StringBuilder sb2 = new StringBuilder(d0Var.toString().length() + 14);
                sb2.append("propagating=[");
                sb2.append(d0Var);
                sb2.append("]");
                return sb2.toString();
            default:
                return super.toString();
        }
    }
}
