package td;

import android.util.Base64;
import b.c0;
import java.util.Arrays;
import x7.u;

/* loaded from: classes.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final String f88985a;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f88986b;

    /* renamed from: c, reason: collision with root package name */
    public final qd.d f88987c;

    public i(String str, byte[] bArr, qd.d dVar) {
        this.f88985a = str;
        this.f88986b = bArr;
        this.f88987c = dVar;
    }

    public static u a() {
        u uVar = new u();
        uVar.f95210c = qd.d.f83918a;
        return uVar;
    }

    public final i b(qd.d dVar) {
        u uVarA = a();
        uVarA.v(this.f88985a);
        if (dVar == null) {
            throw new NullPointerException("Null priority");
        }
        uVarA.f95210c = dVar;
        uVarA.f95209b = this.f88986b;
        return uVarA.d();
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof i) {
            i iVar = (i) obj;
            if (this.f88985a.equals(iVar.f88985a)) {
                if (Arrays.equals(this.f88986b, iVar instanceof i ? iVar.f88986b : iVar.f88986b) && this.f88987c.equals(iVar.f88987c)) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((((this.f88985a.hashCode() ^ 1000003) * 1000003) ^ Arrays.hashCode(this.f88986b)) * 1000003) ^ this.f88987c.hashCode();
    }

    public final String toString() {
        byte[] bArr = this.f88986b;
        String strEncodeToString = bArr == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : Base64.encodeToString(bArr, 2);
        StringBuilder sb2 = new StringBuilder("TransportContext(");
        sb2.append(this.f88985a);
        sb2.append(", ");
        sb2.append(this.f88987c);
        sb2.append(", ");
        return c0.q(sb2, strEncodeToString, ")");
    }
}
