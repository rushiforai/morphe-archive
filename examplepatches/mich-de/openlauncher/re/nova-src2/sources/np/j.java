package np;

import b.c0;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.ReferenceArraySerializer;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class j {

    @NotNull
    public static final i Companion = new i();

    /* renamed from: b, reason: collision with root package name */
    public static final KSerializer[] f78517b = {new ReferenceArraySerializer(Reflection.f71864a.getOrCreateKotlinClass(String.class), StringSerializer.INSTANCE)};

    /* renamed from: a, reason: collision with root package name */
    public final String[] f78518a;

    public /* synthetic */ j(int i5, String[] strArr) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, h.f78516a.getDescriptor());
        }
        this.f78518a = strArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof j) && Intrinsics.b(this.f78518a, ((j) obj).f78518a);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f78518a);
    }

    public final String toString() {
        return c0.l("StringArrayWrapper(strings=", Arrays.toString(this.f78518a), ")");
    }

    public j(String[] strings) {
        Intrinsics.g(strings, "strings");
        this.f78518a = strings;
    }
}
