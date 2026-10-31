package kotlinx.serialization.json;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.ExperimentalSerializationApi;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u001e\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001B\t\b\u0001¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\u0006J\u0016\u0010\n\u001a\u00020\b2\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00060\fH\u0007J\b\u0010\r\u001a\u00020\u000eH\u0001R\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Lkotlinx/serialization/json/JsonArrayBuilder;", b.f42142b, "<init>", "()V", "content", b.f42142b, "Lkotlinx/serialization/json/JsonElement;", "add", b.f42142b, "element", "addAll", "elements", b.f42142b, "build", "Lkotlinx/serialization/json/JsonArray;", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@JsonDslMarker
/* loaded from: classes5.dex */
public final class JsonArrayBuilder {

    @NotNull
    private final List<JsonElement> content = new ArrayList();

    @PublishedApi
    public JsonArrayBuilder() {
    }

    public final boolean add(@NotNull JsonElement element) {
        Intrinsics.g(element, "element");
        this.content.add(element);
        return true;
    }

    @ExperimentalSerializationApi
    public final boolean addAll(@NotNull Collection<? extends JsonElement> elements) {
        Intrinsics.g(elements, "elements");
        return this.content.addAll(elements);
    }

    @PublishedApi
    @NotNull
    public final JsonArray build() {
        return new JsonArray(this.content);
    }
}
