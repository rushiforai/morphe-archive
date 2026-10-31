package cr;

import com.stripe.android.core.model.CountryCode;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class d {
    public static CountryCode a(String value) {
        Intrinsics.g(value, "value");
        String upperCase = value.toUpperCase(Locale.ROOT);
        Intrinsics.f(upperCase, "toUpperCase(...)");
        return new CountryCode(upperCase);
    }

    @NotNull
    public final KSerializer<CountryCode> serializer() {
        return c.f47798a;
    }
}
