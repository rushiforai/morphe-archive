package yr;

import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.json.JsonElement;
import kotlinx.serialization.json.JsonElementKt;
import kotlinx.serialization.json.JsonTransformingSerializer;

/* loaded from: classes4.dex */
public final class a extends JsonTransformingSerializer {

    /* renamed from: b, reason: collision with root package name */
    public static final a f97405b = new a(BuiltinSerializersKt.serializer(StringCompanionObject.f71868a));

    @Override // kotlinx.serialization.json.JsonTransformingSerializer
    public final JsonElement transformDeserialize(JsonElement element) {
        Intrinsics.g(element, "element");
        return JsonElementKt.JsonPrimitive(element.toString());
    }
}
