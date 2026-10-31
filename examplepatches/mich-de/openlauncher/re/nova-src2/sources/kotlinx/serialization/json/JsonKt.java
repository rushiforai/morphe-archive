package kotlinx.serialization.json;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000,\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\u001a)\u0010\u0000\u001a\u00020\u00012\b\b\u0002\u0010\u0002\u001a\u00020\u00012\u0017\u0010\u0003\u001a\u0013\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0004¢\u0006\u0002\b\u0007\u001a\"\u0010\b\u001a\u00020\t\"\u0006\b\u0000\u0010\n\u0018\u0001*\u00020\u00012\u0006\u0010\u000b\u001a\u0002H\nH\u0086\b¢\u0006\u0002\u0010\f\u001a\"\u0010\r\u001a\u0002H\n\"\u0006\b\u0000\u0010\n\u0018\u0001*\u00020\u00012\u0006\u0010\u000e\u001a\u00020\tH\u0086\b¢\u0006\u0002\u0010\u000f\"\u000e\u0010\u0010\u001a\u00020\u0011X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0012\u001a\u00020\u0011X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0013"}, d2 = {"Json", "Lkotlinx/serialization/json/Json;", "from", "builderAction", "Lkotlin/Function1;", "Lkotlinx/serialization/json/JsonBuilder;", b.f42142b, "Lkotlin/ExtensionFunctionType;", "encodeToJsonElement", "Lkotlinx/serialization/json/JsonElement;", "T", "value", "(Lkotlinx/serialization/json/Json;Ljava/lang/Object;)Lkotlinx/serialization/json/JsonElement;", "decodeFromJsonElement", "json", "(Lkotlinx/serialization/json/Json;Lkotlinx/serialization/json/JsonElement;)Ljava/lang/Object;", "defaultIndent", b.f42142b, "defaultDiscriminator", "kotlinx-serialization-json"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class JsonKt {

    @NotNull
    private static final String defaultDiscriminator = "type";

    @NotNull
    private static final String defaultIndent = "    ";

    @NotNull
    public static final Json Json(@NotNull Json from, @NotNull Function1<? super JsonBuilder, Unit> builderAction) {
        Intrinsics.g(from, "from");
        Intrinsics.g(builderAction, "builderAction");
        JsonBuilder jsonBuilder = new JsonBuilder(from);
        builderAction.invoke(jsonBuilder);
        return new JsonImpl(jsonBuilder.build$kotlinx_serialization_json(), jsonBuilder.getSerializersModule());
    }

    public static /* synthetic */ Json Json$default(Json json, Function1 function1, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            json = Json.INSTANCE;
        }
        return Json(json, function1);
    }

    public static final /* synthetic */ <T> T decodeFromJsonElement(Json json, JsonElement json2) {
        Intrinsics.g(json, "<this>");
        Intrinsics.g(json2, "json");
        json.getSerializersModule();
        Intrinsics.k();
        throw null;
    }

    public static final /* synthetic */ <T> JsonElement encodeToJsonElement(Json json, T t6) {
        Intrinsics.g(json, "<this>");
        json.getSerializersModule();
        Intrinsics.k();
        throw null;
    }
}
