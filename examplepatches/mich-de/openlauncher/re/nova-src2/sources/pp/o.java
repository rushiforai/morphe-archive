package pp;

import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@SerialName("ImpressionEvent")
@Serializable
/* loaded from: classes4.dex */
public final class o {

    @NotNull
    public static final n Companion = new n();

    /* renamed from: c, reason: collision with root package name */
    public static final KSerializer[] f82762c = {w.Companion.serializer(), null};

    /* renamed from: a, reason: collision with root package name */
    public final w f82763a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f82764b;

    public /* synthetic */ o(int i5, w wVar, boolean z11) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, m.f82761a.getDescriptor());
        }
        this.f82763a = wVar;
        if ((i5 & 2) == 0) {
            this.f82764b = false;
        } else {
            this.f82764b = z11;
        }
    }

    public final w a() {
        return this.f82763a;
    }

    public final boolean b() {
        return this.f82764b;
    }

    public o(w wVar) {
        this.f82763a = wVar;
        this.f82764b = false;
    }

    public o(w wVar, boolean z11) {
        this.f82763a = wVar;
        this.f82764b = z11;
    }
}
