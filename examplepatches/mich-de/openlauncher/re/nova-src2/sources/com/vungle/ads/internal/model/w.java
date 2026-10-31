package com.vungle.ads.internal.model;

import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.json.JsonElement;
import kotlinx.serialization.json.JsonElementKt;
import kotlinx.serialization.json.JsonObject;
import kotlinx.serialization.json.JsonTransformingSerializer;

/* loaded from: classes4.dex */
public final class w extends JsonTransformingSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final w f47172a = new w();

    /* JADX WARN: Illegal instructions before constructor call */
    public w() {
        StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
        super(BuiltinSerializersKt.MapSerializer(BuiltinSerializersKt.serializer(stringCompanionObject), BuiltinSerializersKt.ListSerializer(BuiltinSerializersKt.serializer(stringCompanionObject))));
    }

    @Override // kotlinx.serialization.json.JsonTransformingSerializer
    public final JsonElement transformDeserialize(JsonElement element) {
        Intrinsics.g(element, "element");
        JsonObject jsonObject = JsonElementKt.getJsonObject(element);
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry<String, JsonElement> entry : jsonObject.entrySet()) {
            if (!Intrinsics.b(entry.getKey(), "moat")) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        return new JsonObject(linkedHashMap);
    }
}
