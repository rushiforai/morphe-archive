package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialKind;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonElement;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00006\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a1\u0010\u0000\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u00022\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u0002H\u00022\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0007H\u0007¢\u0006\u0002\u0010\b\u001a;\u0010\u0010\u001a\u0002H\u0002\"\n\b\u0000\u0010\u0002\u0018\u0001*\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u00012\u0006\u0010\u0011\u001a\u00020\u000f2\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u000f0\u0013H\u0080\bø\u0001\u0000¢\u0006\u0002\u0010\u0014\"\u0018\u0010\t\u001a\u00020\n*\u00020\u000b8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\f\u0010\r\"\u000e\u0010\u000e\u001a\u00020\u000fX\u0080T¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\u0015"}, d2 = {"writeJson", "Lkotlinx/serialization/json/JsonElement;", "T", "json", "Lkotlinx/serialization/json/Json;", "value", "serializer", "Lkotlinx/serialization/SerializationStrategy;", "(Lkotlinx/serialization/json/Json;Ljava/lang/Object;Lkotlinx/serialization/SerializationStrategy;)Lkotlinx/serialization/json/JsonElement;", "requiresTopLevelTag", b.f42142b, "Lkotlinx/serialization/descriptors/SerialDescriptor;", "getRequiresTopLevelTag", "(Lkotlinx/serialization/descriptors/SerialDescriptor;)Z", "PRIMITIVE_TAG", b.f42142b, "cast", "serialName", "path", "Lkotlin/Function0;", "(Lkotlinx/serialization/json/JsonElement;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)Lkotlinx/serialization/json/JsonElement;", "kotlinx-serialization-json"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class TreeJsonEncoderKt {

    @NotNull
    public static final String PRIMITIVE_TAG = "primitive";

    public static final <T extends JsonElement> T cast(JsonElement value, String serialName, Function0<String> path) {
        Intrinsics.g(value, "value");
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(path, "path");
        Intrinsics.k();
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean getRequiresTopLevelTag(SerialDescriptor serialDescriptor) {
        return (serialDescriptor.getKind() instanceof PrimitiveKind) || serialDescriptor.getKind() == SerialKind.ENUM.INSTANCE;
    }

    @JsonFriendModuleApi
    @NotNull
    public static final <T> JsonElement writeJson(@NotNull Json json, T t6, @NotNull SerializationStrategy<? super T> serializer) {
        Intrinsics.g(json, "json");
        Intrinsics.g(serializer, "serializer");
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        new JsonTreeEncoder(json, new a(objectRef, 1)).encodeSerializableValue(serializer, t6);
        Object obj = objectRef.f71863a;
        if (obj != null) {
            return (JsonElement) obj;
        }
        Intrinsics.m("result");
        throw null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit writeJson$lambda$0(Ref.ObjectRef objectRef, JsonElement it) {
        Intrinsics.g(it, "it");
        objectRef.f71863a = it;
        return Unit.f71706a;
    }
}
