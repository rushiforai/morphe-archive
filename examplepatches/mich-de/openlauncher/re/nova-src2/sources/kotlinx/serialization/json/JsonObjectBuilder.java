package kotlinx.serialization.json;

import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001B\t\b\u0001¢\u0006\u0004\b\u0002\u0010\u0003J\u0018\u0010\b\u001a\u0004\u0018\u00010\u00072\u0006\u0010\t\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\u0007J\b\u0010\u000b\u001a\u00020\fH\u0001R\u001a\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00070\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\r"}, d2 = {"Lkotlinx/serialization/json/JsonObjectBuilder;", b.f42142b, "<init>", "()V", "content", b.f42142b, b.f42142b, "Lkotlinx/serialization/json/JsonElement;", "put", DatabaseConstants.KEY_FIELD, "element", "build", "Lkotlinx/serialization/json/JsonObject;", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@JsonDslMarker
/* loaded from: classes5.dex */
public final class JsonObjectBuilder {

    @NotNull
    private final Map<String, JsonElement> content = new LinkedHashMap();

    @PublishedApi
    public JsonObjectBuilder() {
    }

    @PublishedApi
    @NotNull
    public final JsonObject build() {
        return new JsonObject(this.content);
    }

    @Nullable
    public final JsonElement put(@NotNull String key, @NotNull JsonElement element) {
        Intrinsics.g(key, "key");
        Intrinsics.g(element, "element");
        return this.content.put(key, element);
    }
}
