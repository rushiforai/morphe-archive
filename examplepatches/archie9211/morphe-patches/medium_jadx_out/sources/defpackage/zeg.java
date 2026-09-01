package defpackage;

import java.security.GeneralSecurityException;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zeg implements xwf {
    public final vhg a;

    public zeg(vhg vhgVar) {
        this.a = vhgVar;
    }

    @Override // defpackage.xwf
    public final byte[] a(byte[] bArr) throws GeneralSecurityException {
        Iterator it2 = this.a.a(bArr).iterator();
        while (it2.hasNext()) {
            try {
                return ((afg) it2.next()).a.a(bArr);
            } catch (GeneralSecurityException unused) {
            }
        }
        ygf.l("decryption failed");
        return null;
    }
}
