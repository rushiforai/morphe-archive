package ads_mobile_sdk;

import b.l1;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class zb3 implements l1 {

    /* renamed from: a, reason: collision with root package name */
    public final vi3 f12515a;

    public zb3(vi3 vi3Var) {
        this.f12515a = vi3Var;
    }

    @Override // b.l1
    public final boolean a(rm2 rm2Var) {
        return false;
    }

    @Override // b.l1
    public final boolean b(rm2 rm2Var) {
        vi3 vi3Var = this.f12515a;
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
