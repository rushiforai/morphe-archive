package kotlinx.serialization.json.internal;

import com.amplitude.core.events.Plan;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.Json;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\u001a\u0018\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0000¨\u0006\u0006"}, d2 = {"StringJsonLexer", "Lkotlinx/serialization/json/internal/StringJsonLexer;", "json", "Lkotlinx/serialization/json/Json;", Plan.AMP_PLAN_SOURCE, b.f42142b, "kotlinx-serialization-json"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class StringJsonLexerKt {
    @NotNull
    public static final StringJsonLexer StringJsonLexer(@NotNull Json json, @NotNull String source) {
        Intrinsics.g(json, "json");
        Intrinsics.g(source, "source");
        return !json.getConfiguration().getAllowComments() ? new StringJsonLexer(source) : new StringJsonLexerWithComments(source);
    }
}
