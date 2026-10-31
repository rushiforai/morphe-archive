package androidx.compose.runtime.tooling;

import a2.d;
import b70.e;
import b70.m;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.builders.ListBuilder;
import kotlin.jvm.internal.Intrinsics;
import ul.b;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Landroidx/compose/runtime/tooling/DiagnosticComposeException;", "Ljava/lang/RuntimeException;", "Lkotlin/RuntimeException;", "runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class DiagnosticComposeException extends RuntimeException {

    /* renamed from: a, reason: collision with root package name */
    public final List f14113a;

    public DiagnosticComposeException(List list) {
        this.f14113a = list;
    }

    @Override // java.lang.Throwable
    public final Throwable fillInStackTrace() {
        setStackTrace(new StackTraceElement[0]);
        return this;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        StringBuilder sb2 = new StringBuilder("Composition stack when thrown:\n");
        ListBuilder listBuilderW = b.w();
        m mVarL0 = e.L0(this.f14113a);
        if (mVarL0.c() > 0) {
            ((d) mVarL0.get(0)).getClass();
            throw null;
        }
        m mVarL02 = e.L0(b.m(listBuilderW));
        int iC = mVarL02.c();
        for (int i5 = 0; i5 < iC; i5++) {
            sb2.append("\tat " + ((String) mVarL02.get(i5)));
            sb2.append('\n');
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
