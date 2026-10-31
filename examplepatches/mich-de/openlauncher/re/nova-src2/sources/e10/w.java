package e10;

import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.SerialFormat;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.modules.SerializersModule;
import kotlinx.serialization.modules.SerializersModuleKt;

/* loaded from: classes.dex */
public final class w implements SerialFormat {

    /* renamed from: b, reason: collision with root package name */
    public static final w f51855b = new w();

    /* renamed from: a, reason: collision with root package name */
    public final SerializersModule f51856a = SerializersModuleKt.getEmptySerializersModule();

    public final Object decodeFromString(DeserializationStrategy deserializationStrategy, String str) {
        return new x(this, z.b(str), deserializationStrategy.getDescriptor()).decodeSerializableValue(deserializationStrategy);
    }

    public final String encodeToString(SerializationStrategy serializationStrategy, Object obj) {
        y yVar = new y(this, serializationStrategy.getDescriptor());
        yVar.encodeSerializableValue(serializationStrategy, obj);
        return b70.g.f1(yVar.f51873b, ":", null, null, 0, null, 62);
    }

    @Override // kotlinx.serialization.SerialFormat
    public final SerializersModule getSerializersModule() {
        return this.f51856a;
    }
}
