package defpackage;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.ProtocolException;
import java.net.SocketTimeoutException;
import java.security.cert.CertificateException;
import java.util.regex.Pattern;
import javax.net.ssl.SSLHandshakeException;
import javax.net.ssl.SSLPeerUnverifiedException;
import okhttp3.internal.http2.ConnectionShutdownException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ky0 implements j56 {
    public final /* synthetic */ int a = 0;
    public final Object b;

    public ky0(f66 f66Var) {
        f66Var.getClass();
        this.b = f66Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:110:0x02a0  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x02a8  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x02b6  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x02bc  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x02c2  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x02cf  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x02d7  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x0317  */
    /* JADX WARN: Removed duplicated region for block: B:156:0x0380  */
    /* JADX WARN: Removed duplicated region for block: B:233:0x0575  */
    /* JADX WARN: Removed duplicated region for block: B:252:0x05cd  */
    /* JADX WARN: Removed duplicated region for block: B:313:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0111 A[EDGE_INSN: B:34:0x0111->B:35:0x0112 BREAK  A[LOOP:3: B:26:0x00df->B:312:?]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final defpackage.adb c(defpackage.nva r51) {
        /*
            Method dump skipped, instruction units count: 1569
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ky0.c(nva):adb");
    }

    public static int e(adb adbVar, int i) {
        String strD = adbVar.f.d("Retry-After");
        if (strD == null) {
            strD = null;
        }
        if (strD == null) {
            return i;
        }
        Pattern patternCompile = Pattern.compile("\\d+");
        patternCompile.getClass();
        if (!patternCompile.matcher(strD).matches()) {
            return Integer.MAX_VALUE;
        }
        Integer numValueOf = Integer.valueOf(strD);
        numValueOf.getClass();
        return numValueOf.intValue();
    }

    /*  JADX ERROR: JadxRuntimeException in pass: ModVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Can't remove SSA var: r0v35 rva, still in use, count: 2, list:
          (r0v35 rva) from 0x0074: MOVE (r18v1 rva) = (r0v35 rva) (LINE:117)
          (r0v35 rva) from 0x0060: MOVE (r18v4 rva) = (r0v35 rva) (LINE:97)
        	at jadx.core.utils.InsnRemover.removeSsaVar(InsnRemover.java:162)
        	at jadx.core.utils.InsnRemover.unbindResult(InsnRemover.java:127)
        	at jadx.core.utils.InsnRemover.unbindInsn(InsnRemover.java:91)
        	at jadx.core.utils.InsnRemover.addAndUnbind(InsnRemover.java:57)
        	at jadx.core.dex.visitors.ModVisitor.removeStep(ModVisitor.java:463)
        	at jadx.core.dex.visitors.ModVisitor.visit(ModVisitor.java:97)
        */
    @Override // defpackage.j56
    public final defpackage.adb a(defpackage.nva r37) {
        /*
            Method dump skipped, instruction units count: 846
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ky0.a(nva):adb");
    }

    /* JADX WARN: Removed duplicated region for block: B:74:0x00df  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.kbb b(defpackage.adb r11, defpackage.zf3 r12) throws java.net.ProtocolException {
        /*
            Method dump skipped, instruction units count: 406
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ky0.b(adb, zf3):kbb");
    }

    public boolean d(IOException iOException, cva cvaVar, kbb kbbVar) {
        sbb sbbVar;
        boolean z = iOException instanceof ConnectionShutdownException;
        if (!((up8) this.b).e) {
            return false;
        }
        if ((!z && (((sbbVar = kbbVar.d) != null && sbbVar.c()) || (iOException instanceof FileNotFoundException))) || (iOException instanceof ProtocolException)) {
            return false;
        }
        if (iOException instanceof InterruptedIOException) {
            if (!(iOException instanceof SocketTimeoutException) || !z) {
                return false;
            }
        } else if (((iOException instanceof SSLHandshakeException) && (iOException.getCause() instanceof CertificateException)) || (iOException instanceof SSLPeerUnverifiedException)) {
            return false;
        }
        zf3 zf3Var = cvaVar.r;
        if (zf3Var == null || !zf3Var.c) {
            return false;
        }
        c44 c44Var = cvaVar.h;
        c44Var.getClass();
        rva rvaVarC = c44Var.c();
        zf3 zf3Var2 = cvaVar.r;
        return rvaVarC.a(zf3Var2 != null ? zf3Var2.g() : null);
    }

    public ky0(ba2 ba2Var) {
        ba2Var.getClass();
        this.b = ba2Var;
    }

    public ky0(x21 x21Var) {
        this.b = x21Var;
    }

    public ky0(up8 up8Var) {
        up8Var.getClass();
        this.b = up8Var;
    }
}
