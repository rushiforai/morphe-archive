package op;

import java.util.AbstractMap;
import java.util.EnumMap;
import java.util.LinkedHashMap;
import kotlin.collections.MapsKt;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;
import pp.w;

@Serializable(with = i.class)
/* loaded from: classes.dex */
public final class l {

    @NotNull
    public static final j Companion = new j();

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f80562a;

    public l(AbstractMap abstractMap) {
        this.f80562a = MapsKt.u0(abstractMap);
    }

    public /* synthetic */ l() {
        this(new EnumMap(w.class));
    }
}
