package defpackage;

import com.google.android.recaptcha.internal.zzae;
import com.google.android.recaptcha.internal.zzag;
import com.google.android.recaptcha.internal.zzy;
import com.google.android.recaptcha.internal.zzz;
import j$.util.Optional;
import java.util.ArrayDeque;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iuf {
    public final hz2 a;
    public final nec b = new nec(11, (byte) 0);
    public final opg c;

    public iuf(hz2 hz2Var, opg opgVar) {
        this.a = hz2Var;
        this.c = opgVar;
    }

    public final Optional a() {
        kxf kxfVar;
        try {
            try {
            } catch (zzy | zzz e) {
                e = e;
            }
            try {
                ArrayDeque arrayDeque = (ArrayDeque) this.b.b;
                if (arrayDeque.isEmpty()) {
                    throw new zzae();
                }
                dmf dmfVar = (dmf) arrayDeque.pop();
                long j = dmfVar.a;
                long j2 = dmfVar.b;
                long j3 = dmfVar.c;
                hz2 hz2Var = this.a;
                if (hz2Var.b < j2) {
                    return Optional.of(kxf.zzG);
                }
                this.c.a(j);
                if (j3 == 0) {
                    while (hz2Var.b > j2) {
                        hz2Var.f();
                    }
                }
                return Optional.empty();
            } catch (zzz e2) {
                e = e2;
                throw new AssertionError(cmg.a("CEiv6BFfPnitUE+D"), e);
            }
        } catch (zzae unused) {
            kxfVar = kxf.zzw;
            return Optional.of(kxfVar);
        } catch (zzag unused2) {
            kxfVar = kxf.zzG;
            return Optional.of(kxfVar);
        }
    }
}
