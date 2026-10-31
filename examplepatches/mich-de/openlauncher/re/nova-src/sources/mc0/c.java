package mc0;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public final ThreadLocal f76205a = new ThreadLocal();

    public void a(IllegalStateException illegalStateException) {
        l(3, illegalStateException, null, new Object[0]);
    }

    public void b(String str, Object... args) {
        Intrinsics.g(args, "args");
        l(3, null, str, Arrays.copyOf(args, args.length));
    }

    public void c(Throwable th2, String str, Object... args) {
        Intrinsics.g(args, "args");
        l(3, th2, str, Arrays.copyOf(args, args.length));
    }

    public void d(String str, Object... args) {
        Intrinsics.g(args, "args");
        l(6, null, str, Arrays.copyOf(args, args.length));
    }

    public void e(Throwable th2) {
        l(6, th2, null, new Object[0]);
    }

    public void f(Throwable th2, String str, Object... args) {
        Intrinsics.g(args, "args");
        l(6, th2, str, Arrays.copyOf(args, args.length));
    }

    public /* synthetic */ String g() {
        ThreadLocal threadLocal = this.f76205a;
        String str = (String) threadLocal.get();
        if (str != null) {
            threadLocal.remove();
        }
        return str;
    }

    public void h(String str, Object... args) {
        Intrinsics.g(args, "args");
        l(4, null, str, Arrays.copyOf(args, args.length));
    }

    public void i(Throwable th2, String str, Object... args) {
        Intrinsics.g(args, "args");
        l(4, th2, str, Arrays.copyOf(args, args.length));
    }

    public boolean j(int i5) {
        return true;
    }

    public abstract void k(Throwable th2, int i5, String str, String str2);

    public final void l(int i5, Throwable th2, String str, Object... objArr) {
        String strG = g();
        if (j(i5)) {
            if (str != null && str.length() != 0) {
                if (objArr.length != 0) {
                    Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
                    str = String.format(str, Arrays.copyOf(objArrCopyOf, objArrCopyOf.length));
                }
                if (th2 != null) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append((Object) str);
                    sb2.append('\n');
                    StringWriter stringWriter = new StringWriter(256);
                    PrintWriter printWriter = new PrintWriter((Writer) stringWriter, false);
                    th2.printStackTrace(printWriter);
                    printWriter.flush();
                    String string = stringWriter.toString();
                    Intrinsics.f(string, "sw.toString()");
                    sb2.append(string);
                    str = sb2.toString();
                }
            } else {
                if (th2 == null) {
                    return;
                }
                StringWriter stringWriter2 = new StringWriter(256);
                PrintWriter printWriter2 = new PrintWriter((Writer) stringWriter2, false);
                th2.printStackTrace(printWriter2);
                printWriter2.flush();
                str = stringWriter2.toString();
                Intrinsics.f(str, "sw.toString()");
            }
            k(th2, i5, strG, str);
        }
    }

    public void m(String str, Object... args) {
        Intrinsics.g(args, "args");
        l(2, null, str, Arrays.copyOf(args, args.length));
    }

    public void n(String str, Object... args) {
        Intrinsics.g(args, "args");
        l(5, null, str, Arrays.copyOf(args, args.length));
    }

    public void o(Throwable th2) {
        l(5, th2, null, new Object[0]);
    }

    public void p(Throwable th2, String str, Object... args) {
        Intrinsics.g(args, "args");
        l(5, th2, str, Arrays.copyOf(args, args.length));
    }
}
