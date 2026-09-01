package defpackage;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class x67 {
    public static final String d;
    public static final o67 e;
    public final dec a;
    public final xsa b;
    public final String c;

    static {
        String canonicalName = x67.class.getCanonicalName();
        canonicalName.getClass();
        int iE0 = muc.e0(canonicalName, 0, 6, ".");
        d = iE0 == -1 ? "" : canonicalName.substring(0, iE0);
        e = new o67("NO_LOCKS", dq1.e);
    }

    public x67(String str) {
        this(str, new zm7(10, new ReentrantLock()));
    }

    public static void e(AssertionError assertionError) {
        StackTraceElement[] stackTrace = assertionError.getStackTrace();
        int length = stackTrace.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                i = -1;
                break;
            } else if (!stackTrace[i].getClassName().startsWith(d)) {
                break;
            } else {
                i++;
            }
        }
        List listSubList = Arrays.asList(stackTrace).subList(i, length);
        assertionError.setStackTrace((StackTraceElement[]) listSubList.toArray(new StackTraceElement[listSubList.size()]));
    }

    public final u67 a(m45 m45Var) {
        return new u67(this, m45Var);
    }

    public final r67 b(x45 x45Var) {
        return new r67(this, new ConcurrentHashMap(3, 1.0f, 2), x45Var, 1);
    }

    public final v67 c(x45 x45Var) {
        return new v67(this, new ConcurrentHashMap(3, 1.0f, 2), x45Var, 0);
    }

    public sv0 d(String str, Object obj) {
        StringBuilder sb = new StringBuilder("Recursion detected ");
        sb.append(str);
        sb.append(obj == null ? "" : ka1.q("on input: ", obj));
        sb.append(" under ");
        sb.append(this);
        AssertionError assertionError = new AssertionError(sb.toString());
        e(assertionError);
        throw assertionError;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(getClass().getSimpleName());
        sb.append("@");
        sb.append(Integer.toHexString(hashCode()));
        sb.append(" (");
        return ka1.v(sb, this.c, CspinKvYN.ndgYUvZFOgc);
    }

    public x67(String str, dec decVar) {
        xsa xsaVar = xsa.e;
        this.a = decVar;
        this.b = xsaVar;
        this.c = str;
    }
}
