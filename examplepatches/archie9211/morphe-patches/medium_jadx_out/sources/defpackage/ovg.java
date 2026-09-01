package defpackage;

import java.security.GeneralSecurityException;
import javax.crypto.Mac;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ovg extends ThreadLocal {
    public final /* synthetic */ lvg a;

    public ovg(lvg lvgVar) {
        this.a = lvgVar;
    }

    @Override // java.lang.ThreadLocal
    public final Object initialValue() {
        lvg lvgVar = this.a;
        try {
            cvg cvgVar = cvg.c;
            Mac mac = (Mac) cvgVar.a.a(lvgVar.b);
            mac.init(lvgVar.c);
            return mac;
        } catch (GeneralSecurityException e) {
            throw new IllegalStateException(e);
        }
    }
}
