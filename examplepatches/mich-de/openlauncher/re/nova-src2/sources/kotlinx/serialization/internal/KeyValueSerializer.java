package kotlinx.serialization.internal;

import b.c0;
import com.amplitude.android.migration.DatabaseConstants;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b1\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0004\b\u0001\u0010\u0002*\u0004\b\u0002\u0010\u00032\b\u0012\u0004\u0012\u0002H\u00030\u0004B%\b\u0004\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00028\u00000\u0004\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00010\u0004¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\u0011\u001a\u00028\u00022\u0006\u0010\f\u001a\u00028\u00002\u0006\u0010\u000f\u001a\u00028\u0001H$¢\u0006\u0002\u0010\u0012J\u001d\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u000f\u001a\u00028\u0002H\u0016¢\u0006\u0002\u0010\u0017J\u0015\u0010\u0018\u001a\u00028\u00022\u0006\u0010\u0019\u001a\u00020\u001aH\u0016¢\u0006\u0002\u0010\u001bR\u001a\u0010\u0005\u001a\b\u0012\u0004\u0012\u00028\u00000\u0004X\u0084\u0004¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00010\u0004X\u0084\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0016\u0010\f\u001a\u00028\u0000*\u00028\u0002X¤\u0004¢\u0006\u0006\u001a\u0004\b\r\u0010\u000eR\u0016\u0010\u000f\u001a\u00028\u0001*\u00028\u0002X¤\u0004¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u000e\u0082\u0001\u0002\u001c\u001d¨\u0006\u001e"}, d2 = {"Lkotlinx/serialization/internal/KeyValueSerializer;", "K", "V", "R", "Lkotlinx/serialization/KSerializer;", "keySerializer", "valueSerializer", "<init>", "(Lkotlinx/serialization/KSerializer;Lkotlinx/serialization/KSerializer;)V", "getKeySerializer", "()Lkotlinx/serialization/KSerializer;", "getValueSerializer", DatabaseConstants.KEY_FIELD, "getKey", "(Ljava/lang/Object;)Ljava/lang/Object;", "value", "getValue", "toResult", "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "serialize", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "encoder", "Lkotlinx/serialization/encoding/Encoder;", "(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V", "deserialize", "decoder", "Lkotlinx/serialization/encoding/Decoder;", "(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;", "Lkotlinx/serialization/internal/MapEntrySerializer;", "Lkotlinx/serialization/internal/PairSerializer;", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@PublishedApi
@SourceDebugExtension
/* loaded from: classes5.dex */
public abstract class KeyValueSerializer<K, V, R> implements KSerializer<R> {

    @NotNull
    private final KSerializer<K> keySerializer;

    @NotNull
    private final KSerializer<V> valueSerializer;

    public /* synthetic */ KeyValueSerializer(KSerializer kSerializer, KSerializer kSerializer2, DefaultConstructorMarker defaultConstructorMarker) {
        this(kSerializer, kSerializer2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // kotlinx.serialization.DeserializationStrategy
    public R deserialize(@NotNull Decoder decoder) {
        R r11;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor descriptor = getDescriptor();
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(descriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            r11 = (R) toResult(CompositeDecoder.decodeSerializableElement$default(compositeDecoderBeginStructure, getDescriptor(), 0, getKeySerializer(), null, 8, null), CompositeDecoder.decodeSerializableElement$default(compositeDecoderBeginStructure, getDescriptor(), 1, getValueSerializer(), null, 8, null));
        } else {
            Object objDecodeSerializableElement$default = TuplesKt.NULL;
            Object objDecodeSerializableElement$default2 = TuplesKt.NULL;
            while (true) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(getDescriptor());
                if (iDecodeElementIndex != -1) {
                    if (iDecodeElementIndex == 0) {
                        objDecodeSerializableElement$default = CompositeDecoder.decodeSerializableElement$default(compositeDecoderBeginStructure, getDescriptor(), 0, getKeySerializer(), null, 8, null);
                    } else {
                        if (iDecodeElementIndex != 1) {
                            throw new SerializationException(c0.h(iDecodeElementIndex, "Invalid index: "));
                        }
                        objDecodeSerializableElement$default2 = CompositeDecoder.decodeSerializableElement$default(compositeDecoderBeginStructure, getDescriptor(), 1, getValueSerializer(), null, 8, null);
                    }
                } else {
                    if (objDecodeSerializableElement$default == TuplesKt.NULL) {
                        throw new SerializationException("Element 'key' is missing");
                    }
                    if (objDecodeSerializableElement$default2 == TuplesKt.NULL) {
                        throw new SerializationException("Element 'value' is missing");
                    }
                    r11 = (R) toResult(objDecodeSerializableElement$default, objDecodeSerializableElement$default2);
                }
            }
        }
        compositeDecoderBeginStructure.endStructure(descriptor);
        return r11;
    }

    public abstract K getKey(R r11);

    @NotNull
    public final KSerializer<K> getKeySerializer() {
        return this.keySerializer;
    }

    public abstract V getValue(R r11);

    @NotNull
    public final KSerializer<V> getValueSerializer() {
        return this.valueSerializer;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public void serialize(@NotNull Encoder encoder, R value) {
        Intrinsics.g(encoder, "encoder");
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(getDescriptor());
        compositeEncoderBeginStructure.encodeSerializableElement(getDescriptor(), 0, this.keySerializer, getKey(value));
        compositeEncoderBeginStructure.encodeSerializableElement(getDescriptor(), 1, this.valueSerializer, getValue(value));
        compositeEncoderBeginStructure.endStructure(getDescriptor());
    }

    public abstract R toResult(K key, V value);

    private KeyValueSerializer(KSerializer<K> kSerializer, KSerializer<V> kSerializer2) {
        this.keySerializer = kSerializer;
        this.valueSerializer = kSerializer2;
    }
}
