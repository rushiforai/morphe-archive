package vo;

import bn.s0;
import com.nimbusds.jose.JOSEException;
import javax.crypto.SecretKey;
import uo.i;
import uo.j;
import uo.k;

/* loaded from: classes4.dex */
public class b extends xo.c implements j {
    @Override // uo.j
    public final s0 a(k kVar, byte[] bArr, byte[] bArr2) throws JOSEException {
        i iVar = (i) kVar.f91410a;
        if (iVar == null) {
            throw new JOSEException("The algorithm \"alg\" header parameter must not be null");
        }
        if (!iVar.equals(i.f91446k)) {
            throw new JOSEException(xo.e.l(iVar, xo.c.f96208f));
        }
        SecretKey secretKeyB = null;
        try {
            secretKeyB = b(null);
        } catch (Exception unused) {
        }
        return xo.b.c(kVar, bArr, bArr2, secretKeyB, null, this.f96204c);
    }
}
