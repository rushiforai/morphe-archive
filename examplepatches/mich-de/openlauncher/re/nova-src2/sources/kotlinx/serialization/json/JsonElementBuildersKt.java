package kotlinx.serialization.json;

import b70.c;
import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmName;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.ExperimentalSerializationApi;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000L\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0004\n\u0002\u0010\u0001\n\u0002\b\u0006\n\u0002\u0010\u001e\n\u0002\b\u0004\u001a2\u0010\u0000\u001a\u00020\u00012\u0017\u0010\u0002\u001a\u0013\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u0003¢\u0006\u0002\b\u0006H\u0086\bø\u0001\u0000\u0082\u0002\n\n\b\b\u0001\u0012\u0002\u0010\u0001 \u0001\u001a2\u0010\u0007\u001a\u00020\b2\u0017\u0010\u0002\u001a\u0013\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00050\u0003¢\u0006\u0002\b\u0006H\u0086\bø\u0001\u0000\u0082\u0002\n\n\b\b\u0001\u0012\u0002\u0010\u0001 \u0001\u001a-\u0010\n\u001a\u0004\u0018\u00010\u000b*\u00020\u00042\u0006\u0010\f\u001a\u00020\r2\u0017\u0010\u0002\u001a\u0013\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u0003¢\u0006\u0002\b\u0006\u001a-\u0010\u000e\u001a\u0004\u0018\u00010\u000b*\u00020\u00042\u0006\u0010\f\u001a\u00020\r2\u0017\u0010\u0002\u001a\u0013\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00050\u0003¢\u0006\u0002\b\u0006\u001a#\u0010\u000f\u001a\u0004\u0018\u00010\u000b*\u00020\u00042\u0006\u0010\f\u001a\u00020\r2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011¢\u0006\u0002\u0010\u0012\u001a\u001e\u0010\u000f\u001a\u0004\u0018\u00010\u000b*\u00020\u00042\u0006\u0010\f\u001a\u00020\r2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0013\u001a\u001e\u0010\u000f\u001a\u0004\u0018\u00010\u000b*\u00020\u00042\u0006\u0010\f\u001a\u00020\r2\b\u0010\u0010\u001a\u0004\u0018\u00010\r\u001a \u0010\u000f\u001a\u0004\u0018\u00010\u000b*\u00020\u00042\u0006\u0010\f\u001a\u00020\r2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0014H\u0007\u001a\u0019\u0010\u0015\u001a\u00020\u0011*\u00020\t2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011¢\u0006\u0002\u0010\u0016\u001a\u0014\u0010\u0015\u001a\u00020\u0011*\u00020\t2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0013\u001a\u0014\u0010\u0015\u001a\u00020\u0011*\u00020\t2\b\u0010\u0010\u001a\u0004\u0018\u00010\r\u001a\u0016\u0010\u0015\u001a\u00020\u0011*\u00020\t2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0014H\u0007\u001a#\u0010\u0017\u001a\u00020\u0011*\u00020\t2\u0017\u0010\u0002\u001a\u0013\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u0003¢\u0006\u0002\b\u0006\u001a#\u0010\u0018\u001a\u00020\u0011*\u00020\t2\u0017\u0010\u0002\u001a\u0013\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00050\u0003¢\u0006\u0002\b\u0006\u001a!\u0010\u0019\u001a\u00020\u0011*\u00020\t2\u000e\u0010\u001a\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\r0\u001bH\u0007¢\u0006\u0002\b\u001c\u001a!\u0010\u0019\u001a\u00020\u0011*\u00020\t2\u000e\u0010\u001a\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00110\u001bH\u0007¢\u0006\u0002\b\u001d\u001a!\u0010\u0019\u001a\u00020\u0011*\u00020\t2\u000e\u0010\u001a\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00130\u001bH\u0007¢\u0006\u0002\b\u001e\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\u001f"}, d2 = {"buildJsonObject", "Lkotlinx/serialization/json/JsonObject;", "builderAction", "Lkotlin/Function1;", "Lkotlinx/serialization/json/JsonObjectBuilder;", b.f42142b, "Lkotlin/ExtensionFunctionType;", "buildJsonArray", "Lkotlinx/serialization/json/JsonArray;", "Lkotlinx/serialization/json/JsonArrayBuilder;", "putJsonObject", "Lkotlinx/serialization/json/JsonElement;", DatabaseConstants.KEY_FIELD, b.f42142b, "putJsonArray", "put", "value", b.f42142b, "(Lkotlinx/serialization/json/JsonObjectBuilder;Ljava/lang/String;Ljava/lang/Boolean;)Lkotlinx/serialization/json/JsonElement;", b.f42142b, b.f42142b, "add", "(Lkotlinx/serialization/json/JsonArrayBuilder;Ljava/lang/Boolean;)Z", "addJsonObject", "addJsonArray", "addAll", "values", b.f42142b, "addAllStrings", "addAllBooleans", "addAllNumbers", "kotlinx-serialization-json"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class JsonElementBuildersKt {
    public static final boolean add(@NotNull JsonArrayBuilder jsonArrayBuilder, @Nullable Boolean bool) {
        Intrinsics.g(jsonArrayBuilder, "<this>");
        return jsonArrayBuilder.add(JsonElementKt.JsonPrimitive(bool));
    }

    @ExperimentalSerializationApi
    @JvmName
    public static final boolean addAllBooleans(@NotNull JsonArrayBuilder jsonArrayBuilder, @NotNull Collection<Boolean> values) {
        Intrinsics.g(jsonArrayBuilder, "<this>");
        Intrinsics.g(values, "values");
        Collection<Boolean> collection = values;
        ArrayList arrayList = new ArrayList(c.u0(collection, 10));
        Iterator<T> it = collection.iterator();
        while (it.hasNext()) {
            arrayList.add(JsonElementKt.JsonPrimitive((Boolean) it.next()));
        }
        return jsonArrayBuilder.addAll(arrayList);
    }

    @ExperimentalSerializationApi
    @JvmName
    public static final boolean addAllNumbers(@NotNull JsonArrayBuilder jsonArrayBuilder, @NotNull Collection<? extends Number> values) {
        Intrinsics.g(jsonArrayBuilder, "<this>");
        Intrinsics.g(values, "values");
        Collection<? extends Number> collection = values;
        ArrayList arrayList = new ArrayList(c.u0(collection, 10));
        Iterator<T> it = collection.iterator();
        while (it.hasNext()) {
            arrayList.add(JsonElementKt.JsonPrimitive((Number) it.next()));
        }
        return jsonArrayBuilder.addAll(arrayList);
    }

    @ExperimentalSerializationApi
    @JvmName
    public static final boolean addAllStrings(@NotNull JsonArrayBuilder jsonArrayBuilder, @NotNull Collection<String> values) {
        Intrinsics.g(jsonArrayBuilder, "<this>");
        Intrinsics.g(values, "values");
        Collection<String> collection = values;
        ArrayList arrayList = new ArrayList(c.u0(collection, 10));
        Iterator<T> it = collection.iterator();
        while (it.hasNext()) {
            arrayList.add(JsonElementKt.JsonPrimitive((String) it.next()));
        }
        return jsonArrayBuilder.addAll(arrayList);
    }

    public static final boolean addJsonArray(@NotNull JsonArrayBuilder jsonArrayBuilder, @NotNull Function1<? super JsonArrayBuilder, Unit> builderAction) {
        Intrinsics.g(jsonArrayBuilder, "<this>");
        Intrinsics.g(builderAction, "builderAction");
        JsonArrayBuilder jsonArrayBuilder2 = new JsonArrayBuilder();
        builderAction.invoke(jsonArrayBuilder2);
        return jsonArrayBuilder.add(jsonArrayBuilder2.build());
    }

    public static final boolean addJsonObject(@NotNull JsonArrayBuilder jsonArrayBuilder, @NotNull Function1<? super JsonObjectBuilder, Unit> builderAction) {
        Intrinsics.g(jsonArrayBuilder, "<this>");
        Intrinsics.g(builderAction, "builderAction");
        JsonObjectBuilder jsonObjectBuilder = new JsonObjectBuilder();
        builderAction.invoke(jsonObjectBuilder);
        return jsonArrayBuilder.add(jsonObjectBuilder.build());
    }

    @NotNull
    public static final JsonArray buildJsonArray(@NotNull Function1<? super JsonArrayBuilder, Unit> builderAction) {
        Intrinsics.g(builderAction, "builderAction");
        JsonArrayBuilder jsonArrayBuilder = new JsonArrayBuilder();
        builderAction.invoke(jsonArrayBuilder);
        return jsonArrayBuilder.build();
    }

    @NotNull
    public static final JsonObject buildJsonObject(@NotNull Function1<? super JsonObjectBuilder, Unit> builderAction) {
        Intrinsics.g(builderAction, "builderAction");
        JsonObjectBuilder jsonObjectBuilder = new JsonObjectBuilder();
        builderAction.invoke(jsonObjectBuilder);
        return jsonObjectBuilder.build();
    }

    @Nullable
    public static final JsonElement put(@NotNull JsonObjectBuilder jsonObjectBuilder, @NotNull String key, @Nullable Boolean bool) {
        Intrinsics.g(jsonObjectBuilder, "<this>");
        Intrinsics.g(key, "key");
        return jsonObjectBuilder.put(key, JsonElementKt.JsonPrimitive(bool));
    }

    @Nullable
    public static final JsonElement putJsonArray(@NotNull JsonObjectBuilder jsonObjectBuilder, @NotNull String key, @NotNull Function1<? super JsonArrayBuilder, Unit> builderAction) {
        Intrinsics.g(jsonObjectBuilder, "<this>");
        Intrinsics.g(key, "key");
        Intrinsics.g(builderAction, "builderAction");
        JsonArrayBuilder jsonArrayBuilder = new JsonArrayBuilder();
        builderAction.invoke(jsonArrayBuilder);
        return jsonObjectBuilder.put(key, jsonArrayBuilder.build());
    }

    @Nullable
    public static final JsonElement putJsonObject(@NotNull JsonObjectBuilder jsonObjectBuilder, @NotNull String key, @NotNull Function1<? super JsonObjectBuilder, Unit> builderAction) {
        Intrinsics.g(jsonObjectBuilder, "<this>");
        Intrinsics.g(key, "key");
        Intrinsics.g(builderAction, "builderAction");
        JsonObjectBuilder jsonObjectBuilder2 = new JsonObjectBuilder();
        builderAction.invoke(jsonObjectBuilder2);
        return jsonObjectBuilder.put(key, jsonObjectBuilder2.build());
    }

    public static final boolean add(@NotNull JsonArrayBuilder jsonArrayBuilder, @Nullable Number number) {
        Intrinsics.g(jsonArrayBuilder, "<this>");
        return jsonArrayBuilder.add(JsonElementKt.JsonPrimitive(number));
    }

    @Nullable
    public static final JsonElement put(@NotNull JsonObjectBuilder jsonObjectBuilder, @NotNull String key, @Nullable Number number) {
        Intrinsics.g(jsonObjectBuilder, "<this>");
        Intrinsics.g(key, "key");
        return jsonObjectBuilder.put(key, JsonElementKt.JsonPrimitive(number));
    }

    public static final boolean add(@NotNull JsonArrayBuilder jsonArrayBuilder, @Nullable String str) {
        Intrinsics.g(jsonArrayBuilder, "<this>");
        return jsonArrayBuilder.add(JsonElementKt.JsonPrimitive(str));
    }

    @Nullable
    public static final JsonElement put(@NotNull JsonObjectBuilder jsonObjectBuilder, @NotNull String key, @Nullable String str) {
        Intrinsics.g(jsonObjectBuilder, "<this>");
        Intrinsics.g(key, "key");
        return jsonObjectBuilder.put(key, JsonElementKt.JsonPrimitive(str));
    }

    @ExperimentalSerializationApi
    public static final boolean add(@NotNull JsonArrayBuilder jsonArrayBuilder, @Nullable Void r12) {
        Intrinsics.g(jsonArrayBuilder, "<this>");
        return jsonArrayBuilder.add(JsonNull.INSTANCE);
    }

    @ExperimentalSerializationApi
    @Nullable
    public static final JsonElement put(@NotNull JsonObjectBuilder jsonObjectBuilder, @NotNull String key, @Nullable Void r22) {
        Intrinsics.g(jsonObjectBuilder, "<this>");
        Intrinsics.g(key, "key");
        return jsonObjectBuilder.put(key, JsonNull.INSTANCE);
    }
}
