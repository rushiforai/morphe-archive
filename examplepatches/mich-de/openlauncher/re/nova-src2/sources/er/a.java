package er;

import b70.k;
import java.util.LinkedHashMap;
import kotlin.collections.MapsKt;
import kotlin.collections.c;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialDescriptorsKt;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;

/* loaded from: classes4.dex */
public abstract class a implements KSerializer {

    /* renamed from: a, reason: collision with root package name */
    public final Enum f52905a;

    /* renamed from: b, reason: collision with root package name */
    public final SerialDescriptor f52906b;

    /* renamed from: c, reason: collision with root package name */
    public final LinkedHashMap f52907c;

    /* renamed from: d, reason: collision with root package name */
    public final LinkedHashMap f52908d;

    public a(Enum[] values, Enum defaultValue) {
        String strName;
        String strName2;
        Intrinsics.g(values, "values");
        Intrinsics.g(defaultValue, "defaultValue");
        this.f52905a = defaultValue;
        String qualifiedName = Reflection.f71864a.getOrCreateKotlinClass(c.x0(values).getClass()).getQualifiedName();
        Intrinsics.d(qualifiedName);
        this.f52906b = SerialDescriptorsKt.PrimitiveSerialDescriptor(qualifiedName, PrimitiveKind.STRING.INSTANCE);
        int iD0 = k.d0(values.length);
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0 < 16 ? 16 : iD0);
        for (Enum r52 : values) {
            SerialName serialName = (SerialName) r52.getClass().getField(r52.name()).getAnnotation(SerialName.class);
            if (serialName == null || (strName2 = serialName.value()) == null) {
                strName2 = r52.name();
            }
            linkedHashMap.put(r52, strName2);
        }
        this.f52907c = linkedHashMap;
        int iD02 = k.d0(values.length);
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(iD02 >= 16 ? iD02 : 16);
        for (Enum r12 : values) {
            SerialName serialName2 = (SerialName) r12.getClass().getField(r12.name()).getAnnotation(SerialName.class);
            if (serialName2 == null || (strName = serialName2.value()) == null) {
                strName = r12.name();
            }
            linkedHashMap2.put(strName, r12);
        }
        this.f52908d = linkedHashMap2;
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        Intrinsics.g(decoder, "decoder");
        Enum r22 = (Enum) this.f52908d.get(decoder.decodeString());
        return r22 == null ? this.f52905a : r22;
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return this.f52906b;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        Enum value = (Enum) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        encoder.encodeString((String) MapsKt.g0(value, this.f52907c));
    }
}
