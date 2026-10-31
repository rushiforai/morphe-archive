package zv;

import b.c0;
import com.stripe.android.stripe3ds2.exceptions.SDKRuntimeException;
import java.util.ArrayList;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {
    public static b a(String directoryServerName, tv.d errorReporter) {
        Object next;
        Intrinsics.g(directoryServerName, "directoryServerName");
        Intrinsics.g(errorReporter, "errorReporter");
        i70.a aVar = b.f98689h;
        b70.a aVarF = c0.f(aVar, aVar);
        while (true) {
            if (!aVarF.hasNext()) {
                next = null;
                break;
            }
            next = aVarF.next();
            if (r70.j.B0(((b) next).f98690a, r70.k.u1(directoryServerName).toString(), true)) {
                break;
            }
        }
        Object objA = (b) next;
        if (objA != null) {
            int i5 = Result.f71687b;
        } else {
            i70.a aVar2 = b.f98689h;
            ArrayList arrayList = new ArrayList(b70.c.u0(aVar2, 10));
            b70.a aVar3 = new b70.a(aVar2);
            while (aVar3.hasNext()) {
                arrayList.add(((b) aVar3.next()).f98690a);
            }
            int i11 = Result.f71687b;
            objA = ResultKt.a(new SDKRuntimeException("Directory server name '" + directoryServerName + "' is not supported. Must be one of " + arrayList + ".", 0));
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            ((tv.c) errorReporter).c(thA);
        }
        b bVar = b.f98687f;
        if (objA instanceof Result.Failure) {
            objA = bVar;
        }
        return (b) objA;
    }
}
