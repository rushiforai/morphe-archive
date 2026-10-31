package org.jf.util;

import java.io.PrintStream;
import java.io.PrintWriter;

/* loaded from: classes.dex */
public class ExceptionWithContext extends RuntimeException {

    /* renamed from: a, reason: collision with root package name */
    public final StringBuffer f80633a;

    public ExceptionWithContext(Exception exc, String str, Object... objArr) {
        super(str != null ? String.format(str, objArr) : exc != null ? exc.getMessage() : null, exc);
        if (!(exc instanceof ExceptionWithContext)) {
            this.f80633a = new StringBuffer(200);
            return;
        }
        String string = ((ExceptionWithContext) exc).f80633a.toString();
        StringBuffer stringBuffer = new StringBuffer(string.length() + 200);
        this.f80633a = stringBuffer;
        stringBuffer.append(string);
    }

    public static ExceptionWithContext a(Exception exc, String str, Object... objArr) {
        ExceptionWithContext exceptionWithContext = exc instanceof ExceptionWithContext ? (ExceptionWithContext) exc : new ExceptionWithContext(exc, null, new Object[0]);
        String str2 = String.format(str, objArr);
        StringBuffer stringBuffer = exceptionWithContext.f80633a;
        stringBuffer.append(str2);
        if (!str2.endsWith("\n")) {
            stringBuffer.append('\n');
        }
        return exceptionWithContext;
    }

    @Override // java.lang.Throwable
    public final void printStackTrace(PrintStream printStream) {
        super.printStackTrace(printStream);
        printStream.println(this.f80633a);
    }

    @Override // java.lang.Throwable
    public final void printStackTrace(PrintWriter printWriter) {
        super.printStackTrace(printWriter);
        printWriter.println(this.f80633a);
    }
}
