package ads_mobile_sdk;

import b.l1;
import b.o2;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class s92 implements l1 {

    /* renamed from: a, reason: collision with root package name */
    public final o2 f9471a;

    /* renamed from: b, reason: collision with root package name */
    public final vi3 f9472b;

    /* renamed from: c, reason: collision with root package name */
    public final long f9473c;

    public s92(o2 o2Var, vi3 vi3Var, long j11) {
        this.f9471a = o2Var;
        this.f9472b = vi3Var;
        this.f9473c = j11;
    }

    @Override // b.l1
    public final boolean a(rm2 rm2Var) {
        vi3 vi3Var = this.f9472b;
        if (rm2Var == null || rm2Var.equals(rm2.q())) {
            vi3Var.b(yk0.EVENT_ID_ORCAS_VALIDATOR_UPDATE_METADATA_NOT_FOUND);
            return true;
        }
        short sP = (short) rm2Var.s().r().p();
        int iQ = rm2Var.s().r().q();
        byte[] versionArray = e30.j.g();
        Intrinsics.g(versionArray, "versionArray");
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(6);
        byteBufferAllocate.order(ByteOrder.LITTLE_ENDIAN);
        byteBufferAllocate.putShort(sP);
        byteBufferAllocate.putInt(iQ);
        byte[] bArrArray = byteBufferAllocate.array();
        Intrinsics.f(bArrArray, "array(...)");
        if (!Arrays.equals(bArrArray, versionArray)) {
            vi3Var.b(yk0.EVENT_ID_ORCAS_VALIDATOR_UPDATE_VM_VERSION_MISMATCH);
            return true;
        }
        long jP = rm2Var.s().p();
        this.f9471a.getClass();
        boolean z11 = jP - System.currentTimeMillis() <= this.f9473c;
        if (z11) {
            vi3Var.b(yk0.EVENT_ID_ORCAS_VALIDATOR_UPDATE_PROGRAM_ALMOST_EXPIRED);
        }
        return z11;
    }

    @Override // b.l1
    public final boolean b(rm2 rm2Var) {
        vi3 vi3Var = this.f9472b;
        if (rm2Var == null || rm2Var.equals(rm2.q())) {
            vi3Var.b(yk0.EVENT_ID_ORCAS_VALIDATOR_INIT_METADATA_NOT_FOUND);
            return false;
        }
        short sP = (short) rm2Var.s().r().p();
        int iQ = rm2Var.s().r().q();
        byte[] versionArray = e30.j.g();
        Intrinsics.g(versionArray, "versionArray");
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(6);
        byteBufferAllocate.order(ByteOrder.LITTLE_ENDIAN);
        byteBufferAllocate.putShort(sP);
        byteBufferAllocate.putInt(iQ);
        byte[] bArrArray = byteBufferAllocate.array();
        Intrinsics.f(bArrArray, "array(...)");
        if (Arrays.equals(bArrArray, versionArray)) {
            return true;
        }
        vi3Var.b(yk0.EVENT_ID_ORCAS_VALIDATOR_INIT_VM_VERSION_MISMATCH);
        return false;
    }
}
