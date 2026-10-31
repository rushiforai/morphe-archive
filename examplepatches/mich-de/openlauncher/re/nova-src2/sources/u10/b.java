package u10;

import kotlin.jvm.functions.Function1;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class b {
    public static String a(long j11, String str, String str2) {
        return a2.c.i(j11, ")", b.c0.w("AppCard:AppCardContent(packageName=", str, ", className=", str2, ", userSerial="));
    }

    public static String b(ga.a aVar, Function1 function1) {
        return a(((Number) function1.invoke(aVar.o)).longValue(), aVar.f57279y.getPackageName(), aVar.f57279y.getClassName());
    }

    @NotNull
    public final KSerializer<c> serializer() {
        return a.f90363a;
    }
}
