package vs;

import com.stripe.android.core.model.CountryCode;
import com.stripe.android.link.LinkConfiguration;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class f {
    public static final boolean a(LinkConfiguration linkConfiguration) {
        Intrinsics.g(linkConfiguration, "<this>");
        String f43541i = linkConfiguration.f42895a.getF43541i();
        CountryCode.Companion.getClass();
        return !Intrinsics.b(f43541i, CountryCode.f42574b.f42575a);
    }
}
