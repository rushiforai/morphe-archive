package defpackage;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class vld {
    public final ThreadLocal a = new ThreadLocal();

    public void a(String str, Object... objArr) {
        i(3, null, str, Arrays.copyOf(objArr, objArr.length));
    }

    public void b(Throwable th, String str, Object... objArr) {
        i(3, th, str, Arrays.copyOf(objArr, objArr.length));
    }

    public void c(String str, Object... objArr) {
        i(6, null, str, Arrays.copyOf(objArr, objArr.length));
    }

    public void d(Throwable th) {
        i(6, th, null, new Object[0]);
    }

    public void e(Throwable th, String str, Object... objArr) {
        i(6, th, str, Arrays.copyOf(objArr, objArr.length));
    }

    public void f(String str, Object... objArr) {
        i(4, null, str, Arrays.copyOf(objArr, objArr.length));
    }

    public void g(Object... objArr) {
        i(4, null, "Switching night mode from %d to %d", Arrays.copyOf(objArr, objArr.length));
    }

    public abstract void h(int i, String str, Throwable th);

    public final void i(int i, Throwable th, String str, Object... objArr) {
        ThreadLocal threadLocal = this.a;
        if (((String) threadLocal.get()) != null) {
            threadLocal.remove();
        }
        if (str != null && str.length() != 0) {
            if (objArr.length != 0) {
                Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
                str = String.format(str, Arrays.copyOf(objArrCopyOf, objArrCopyOf.length));
            }
            if (th != null) {
                StringBuilder sb = new StringBuilder();
                sb.append((Object) str);
                sb.append('\n');
                StringWriter stringWriter = new StringWriter(256);
                PrintWriter printWriter = new PrintWriter((Writer) stringWriter, false);
                th.printStackTrace(printWriter);
                printWriter.flush();
                String string = stringWriter.toString();
                string.getClass();
                sb.append(string);
                str = sb.toString();
            }
        } else {
            if (th == null) {
                return;
            }
            StringWriter stringWriter2 = new StringWriter(256);
            PrintWriter printWriter2 = new PrintWriter((Writer) stringWriter2, false);
            th.printStackTrace(printWriter2);
            printWriter2.flush();
            str = stringWriter2.toString();
            str.getClass();
        }
        h(i, str, th);
    }

    public void j(String str, Object... objArr) {
        i(2, null, str, Arrays.copyOf(objArr, objArr.length));
    }

    public void k(String str, Object... objArr) {
        i(2, null, str, Arrays.copyOf(objArr, objArr.length));
    }

    public void l(Exception exc) {
        i(5, exc, null, new Object[0]);
    }

    public void m(String str, Object... objArr) {
        i(5, null, str, Arrays.copyOf(objArr, objArr.length));
    }

    public void n(Throwable th, String str, Object... objArr) {
        i(5, th, str, Arrays.copyOf(objArr, objArr.length));
    }
}
