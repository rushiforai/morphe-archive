package a2;

import androidx.compose.runtime.tooling.DiagnosticComposeException;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.ExceptionsKt;
import kotlin.internal.PlatformImplementationsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class e {
    public static final void a(Throwable th2, Function0 function0) {
        b(th2, function0);
    }

    public static final boolean b(Throwable th2, Function0 function0) {
        DiagnosticComposeException diagnosticComposeException;
        Intrinsics.g(th2, "<this>");
        List listB = PlatformImplementationsKt.f71823a.b(th2);
        boolean z11 = false;
        if (!(listB instanceof Collection) || !listB.isEmpty()) {
            Iterator it = listB.iterator();
            while (it.hasNext()) {
                if (((Throwable) it.next()) instanceof DiagnosticComposeException) {
                    return false;
                }
            }
        }
        try {
            List list = (List) function0.invoke();
            boolean zIsEmpty = list.isEmpty();
            z11 = !zIsEmpty;
            diagnosticComposeException = !zIsEmpty ? new DiagnosticComposeException(list) : null;
        } catch (Throwable th3) {
            diagnosticComposeException = th3;
        }
        if (diagnosticComposeException != null) {
            ExceptionsKt.a(th2, diagnosticComposeException);
        }
        return z11;
    }
}
