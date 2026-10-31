package kotlin;

import java.io.PrintWriter;
import java.io.StringWriter;
import kotlin.internal.PlatformImplementationsKt;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"kotlin/ExceptionsKt"}, d2 = {}, k = 4, mv = {2, 1, 0}, xi = 49)
/* loaded from: classes4.dex */
public final class ExceptionsKt {
    private ExceptionsKt() {
    }

    public static void a(Throwable th2, Throwable exception) {
        Intrinsics.g(th2, "<this>");
        Intrinsics.g(exception, "exception");
        if (th2 != exception) {
            PlatformImplementationsKt.f71823a.a(th2, exception);
        }
    }

    public static String b(Throwable th2) {
        Intrinsics.g(th2, "<this>");
        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        th2.printStackTrace(printWriter);
        printWriter.flush();
        String string = stringWriter.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
