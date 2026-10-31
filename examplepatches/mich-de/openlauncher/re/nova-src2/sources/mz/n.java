package mz;

import e10.w;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class n {
    public static o a(String str) {
        try {
            w wVar = w.f51855b;
            wVar.getClass();
            return (o) wVar.decodeFromString(o.Companion.serializer(), str);
        } catch (Exception unused) {
            return o.f77358f;
        }
    }

    @NotNull
    public final KSerializer<o> serializer() {
        return m.f77357a;
    }
}
