package ads_mobile_sdk;

import b.o7;
import b.p7;
import b.q7;
import cl.p1;
import cl.r0;
import cl.w0;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.ExecutorService;

/* loaded from: classes2.dex */
public final class oc3 implements b.ad {

    /* renamed from: a, reason: collision with root package name */
    public final gm2 f7830a;

    /* renamed from: b, reason: collision with root package name */
    public final ExecutorService f7831b;

    /* renamed from: c, reason: collision with root package name */
    public final vi3 f7832c;

    public oc3(gm2 gm2Var, ExecutorService executorService, vi3 vi3Var) {
        this.f7830a = gm2Var;
        this.f7831b = executorService;
        this.f7832c = vi3Var;
    }

    @Override // b.s4
    public final p1 a() {
        yk0 yk0Var = yk0.EVENT_ID_DG_STORAGE_GET_METADATA;
        p1 p1VarD = w0.d(new o7(this, 1), this.f7831b);
        this.f7832c.a(yk0Var, (r0) p1VarD);
        return p1VarD;
    }

    @Override // b.s4
    public final cl.z0 c() {
        return w0.b(Boolean.TRUE);
    }

    @Override // b.s4
    public final ListenableFuture a(rm2 rm2Var, byte[] bArr) {
        yk0 yk0Var = yk0.EVENT_ID_DG_STORAGE_UPDATE_PROGRAM_BYTECODE;
        p1 p1VarD = w0.d(new q7(0, this, rm2Var, bArr), this.f7831b);
        this.f7832c.a(yk0Var, (r0) p1VarD);
        return p1VarD;
    }

    @Override // b.s4
    public final ListenableFuture a(rm2 rm2Var, byte[] bArr, byte[] bArr2) {
        yk0 yk0Var = yk0.EVENT_ID_DG_STORAGE_UPDATE_VM_AND_PROGRAM_BYTECODE;
        p1 p1VarD = w0.d(new p7(this, rm2Var, bArr, bArr2), this.f7831b);
        this.f7832c.a(yk0Var, (r0) p1VarD);
        return p1VarD;
    }
}
