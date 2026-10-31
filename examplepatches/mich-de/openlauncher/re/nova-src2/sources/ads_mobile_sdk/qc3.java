package ads_mobile_sdk;

import b.vb;
import cl.e0;
import cl.m0;
import cl.p1;
import cl.r0;
import cl.w0;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.ExecutorService;
import xk.v0;

/* loaded from: classes2.dex */
public final class qc3 implements vb {

    /* renamed from: a, reason: collision with root package name */
    public final fm0 f8589a;

    /* renamed from: b, reason: collision with root package name */
    public final fm0 f8590b;

    /* renamed from: c, reason: collision with root package name */
    public final b.w4 f8591c;

    /* renamed from: d, reason: collision with root package name */
    public final vi3 f8592d;

    /* renamed from: e, reason: collision with root package name */
    public final ExecutorService f8593e;

    public qc3(fm0 fm0Var, fm0 fm0Var2, b.w4 w4Var, ExecutorService executorService, vi3 vi3Var) {
        this.f8589a = fm0Var;
        this.f8590b = fm0Var2;
        this.f8591c = w4Var;
        this.f8592d = vi3Var;
        this.f8593e = executorService;
    }

    @Override // b.s4
    public final p1 a() {
        yk0 yk0Var = yk0.EVENT_ID_ORCAS_STORAGE_GET_METADATA;
        fm0 fm0Var = this.f8589a;
        fm0Var.getClass();
        p1 p1VarD = w0.d(new ab.e(fm0Var, 1), fm0Var.f3428b);
        this.f8592d.a(yk0Var, (r0) p1VarD);
        return p1VarD;
    }

    @Override // b.vb
    public final p1 b() {
        yk0 yk0Var = yk0.EVENT_ID_ORCAS_STORAGE_GET_PROGRAM_BYTECODE;
        fm0 fm0Var = this.f8590b;
        fm0Var.getClass();
        p1 p1VarD = w0.d(new ab.e(fm0Var, 1), fm0Var.f3428b);
        this.f8592d.a(yk0Var, (r0) p1VarD);
        return p1VarD;
    }

    @Override // b.s4
    public final cl.z0 c() {
        return w0.b(Boolean.TRUE);
    }

    @Override // b.vb
    public final p1 d() {
        yk0 yk0Var = yk0.EVENT_ID_ORCAS_STORAGE_GET_STATIC_PROGRAM_BYTECODE;
        p1 p1VarD = w0.d(new b.h9(0), this.f8593e);
        this.f8592d.a(yk0Var, (r0) p1VarD);
        return p1VarD;
    }

    @Override // b.s4
    public final ListenableFuture a(rm2 rm2Var, byte[] bArr) {
        yk0 yk0Var = yk0.EVENT_ID_ORCAS_STORAGE_UPDATE_PROGRAM_BYTECODE;
        p1 p1VarA = this.f8590b.a(bArr);
        this.f8592d.a(yk0Var, (r0) p1VarA);
        return w0.f(r0.r(p1VarA), new b.g9(0, this, rm2Var), m0.f20038a);
    }

    @Override // b.s4
    public final ListenableFuture a(rm2 rm2Var, byte[] bArr, byte[] bArr2) {
        yk0 yk0Var = yk0.EVENT_ID_ORCAS_STORAGE_UPDATE_VM;
        p1 p1VarA = ((fm0) this.f8591c.get()).a(bArr);
        vi3 vi3Var = this.f8592d;
        vi3Var.a(yk0Var, (r0) p1VarA);
        yk0 yk0Var2 = yk0.EVENT_ID_ORCAS_STORAGE_UPDATE_PROGRAM_BYTECODE;
        p1 p1VarA2 = this.f8590b.a(bArr2);
        vi3Var.a(yk0Var2, (r0) p1VarA2);
        return w0.f(r0.r(new e0(v0.p(new ListenableFuture[]{p1VarA, p1VarA2}))), new b.g9(1, this, rm2Var), m0.f20038a);
    }
}
