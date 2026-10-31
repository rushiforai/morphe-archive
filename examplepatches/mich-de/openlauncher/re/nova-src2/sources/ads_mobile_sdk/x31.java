package ads_mobile_sdk;

import b.vb;
import cl.p1;
import cl.r0;
import cl.w0;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.ExecutorService;

/* loaded from: classes2.dex */
public final class x31 implements vb {

    /* renamed from: a, reason: collision with root package name */
    public final ExecutorService f11558a;

    /* renamed from: b, reason: collision with root package name */
    public final vi3 f11559b;

    public x31(ExecutorService executorService, vi3 vi3Var) {
        this.f11558a = executorService;
        this.f11559b = vi3Var;
    }

    @Override // b.s4
    public final ListenableFuture a(rm2 rm2Var, byte[] bArr) {
        return cl.z0.f20092b;
    }

    @Override // b.vb
    public final p1 b() {
        return d();
    }

    @Override // b.s4
    public final cl.z0 c() {
        return w0.b(Boolean.TRUE);
    }

    @Override // b.vb
    public final p1 d() {
        yk0 yk0Var = yk0.EVENT_ID_ORCAS_STORAGE_GET_STATIC_PROGRAM_BYTECODE;
        p1 p1VarD = w0.d(new b.h9(2), this.f11558a);
        this.f11559b.a(yk0Var, (r0) p1VarD);
        return p1VarD;
    }

    @Override // b.s4
    public final ListenableFuture a(rm2 rm2Var, byte[] bArr, byte[] bArr2) {
        return cl.z0.f20092b;
    }

    @Override // b.s4
    public final p1 a() {
        yk0 yk0Var = yk0.EVENT_ID_ORCAS_STORAGE_GET_STATIC_PROGRAM_METADATA;
        p1 p1VarD = w0.d(new b.h9(1), this.f11558a);
        this.f11559b.a(yk0Var, (r0) p1VarD);
        return p1VarD;
    }
}
