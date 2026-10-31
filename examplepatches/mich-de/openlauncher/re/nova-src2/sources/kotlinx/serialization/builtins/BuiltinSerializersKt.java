package kotlinx.serialization.builtins;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.ExperimentalUnsignedTypes;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Triple;
import kotlin.UByte;
import kotlin.UByteArray;
import kotlin.UInt;
import kotlin.UIntArray;
import kotlin.ULong;
import kotlin.ULongArray;
import kotlin.UShort;
import kotlin.UShortArray;
import kotlin.Unit;
import kotlin.jvm.internal.BooleanCompanionObject;
import kotlin.jvm.internal.ByteCompanionObject;
import kotlin.jvm.internal.CharCompanionObject;
import kotlin.jvm.internal.DoubleCompanionObject;
import kotlin.jvm.internal.FloatCompanionObject;
import kotlin.jvm.internal.IntCompanionObject;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.LongCompanionObject;
import kotlin.jvm.internal.ShortCompanionObject;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.reflect.KClass;
import kotlin.time.Duration;
import kotlin.uuid.ExperimentalUuidApi;
import kotlin.uuid.Uuid;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.BooleanArraySerializer;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.ByteArraySerializer;
import kotlinx.serialization.internal.ByteSerializer;
import kotlinx.serialization.internal.CharArraySerializer;
import kotlinx.serialization.internal.CharSerializer;
import kotlinx.serialization.internal.DoubleArraySerializer;
import kotlinx.serialization.internal.DoubleSerializer;
import kotlinx.serialization.internal.DurationSerializer;
import kotlinx.serialization.internal.FloatArraySerializer;
import kotlinx.serialization.internal.FloatSerializer;
import kotlinx.serialization.internal.IntArraySerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LinkedHashMapSerializer;
import kotlinx.serialization.internal.LinkedHashSetSerializer;
import kotlinx.serialization.internal.LongArraySerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.MapEntrySerializer;
import kotlinx.serialization.internal.NothingSerializer;
import kotlinx.serialization.internal.NullableSerializer;
import kotlinx.serialization.internal.PairSerializer;
import kotlinx.serialization.internal.ReferenceArraySerializer;
import kotlinx.serialization.internal.ShortArraySerializer;
import kotlinx.serialization.internal.ShortSerializer;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.internal.TripleSerializer;
import kotlinx.serialization.internal.UByteArraySerializer;
import kotlinx.serialization.internal.UByteSerializer;
import kotlinx.serialization.internal.UIntArraySerializer;
import kotlinx.serialization.internal.UIntSerializer;
import kotlinx.serialization.internal.ULongArraySerializer;
import kotlinx.serialization.internal.ULongSerializer;
import kotlinx.serialization.internal.UShortArraySerializer;
import kotlinx.serialization.internal.UShortSerializer;
import kotlinx.serialization.internal.UnitSerializer;
import kotlinx.serialization.internal.UuidSerializer;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0096\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010&\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0019\n\u0002\u0010\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0015\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0016\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0014\n\u0002\u0010\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0013\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0018\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0010\"\n\u0000\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0001\n\u0000\u001a@\u0010\b\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u0002H\n\u0012\u0004\u0012\u0002H\u000b0\t0\u0001\"\u0004\b\u0000\u0010\n\"\u0004\b\u0001\u0010\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u0002H\n0\u00012\f\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\u000b0\u0001\u001a@\u0010\u000e\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u0002H\n\u0012\u0004\u0012\u0002H\u000b0\u000f0\u0001\"\u0004\b\u0000\u0010\n\"\u0004\b\u0001\u0010\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u0002H\n0\u00012\f\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\u000b0\u0001\u001aZ\u0010\u0010\u001a\u001a\u0012\u0016\u0012\u0014\u0012\u0004\u0012\u0002H\u0012\u0012\u0004\u0012\u0002H\u0013\u0012\u0004\u0012\u0002H\u00140\u00110\u0001\"\u0004\b\u0000\u0010\u0012\"\u0004\b\u0001\u0010\u0013\"\u0004\b\u0002\u0010\u00142\f\u0010\u0015\u001a\b\u0012\u0004\u0012\u0002H\u00120\u00012\f\u0010\u0016\u001a\b\u0012\u0004\u0012\u0002H\u00130\u00012\f\u0010\u0017\u001a\b\u0012\u0004\u0012\u0002H\u00140\u0001\u001a\u0010\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00190\u0001*\u00020\u001a\u001a\f\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u001c0\u0001\u001a\u0010\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u001d0\u0001*\u00020\u001e\u001a\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020 0\u0001\u001a\u000e\u0010!\u001a\b\u0012\u0004\u0012\u00020\"0\u0001H\u0007\u001a\u0010\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020#0\u0001*\u00020$\u001a\f\u0010%\u001a\b\u0012\u0004\u0012\u00020&0\u0001\u001a\u000e\u0010'\u001a\b\u0012\u0004\u0012\u00020(0\u0001H\u0007\u001a\u0010\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020)0\u0001*\u00020*\u001a\f\u0010+\u001a\b\u0012\u0004\u0012\u00020,0\u0001\u001a\u000e\u0010-\u001a\b\u0012\u0004\u0012\u00020.0\u0001H\u0007\u001a\u0010\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020/0\u0001*\u000200\u001a\f\u00101\u001a\b\u0012\u0004\u0012\u0002020\u0001\u001a\u000e\u00103\u001a\b\u0012\u0004\u0012\u0002040\u0001H\u0007\u001a\u0010\u0010\u0018\u001a\b\u0012\u0004\u0012\u0002050\u0001*\u000206\u001a\f\u00107\u001a\b\u0012\u0004\u0012\u0002080\u0001\u001a\u0010\u0010\u0018\u001a\b\u0012\u0004\u0012\u0002090\u0001*\u00020:\u001a\f\u0010;\u001a\b\u0012\u0004\u0012\u00020<0\u0001\u001a\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020=0\u0001*\u00020>¢\u0006\u0002\u0010?\u001a\f\u0010@\u001a\b\u0012\u0004\u0012\u00020A0\u0001\u001a\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020B0\u0001*\u00020B¢\u0006\u0002\u0010C\u001a\u0010\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020D0\u0001*\u00020E\u001a=\u0010F\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u0002HH0G0\u0001\"\n\b\u0000\u0010\u0002\u0018\u0001*\u00020\u0003\"\f\b\u0001\u0010H\u0018\u0001*\u0004\u0018\u0001H\u00022\f\u0010I\u001a\b\u0012\u0004\u0012\u0002HH0\u0001H\u0087\b\u001aF\u0010F\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u0002HH0G0\u0001\"\b\b\u0000\u0010\u0002*\u00020\u0003\"\n\b\u0001\u0010H*\u0004\u0018\u0001H\u00022\f\u0010J\u001a\b\u0012\u0004\u0012\u0002H\u00020K2\f\u0010I\u001a\b\u0012\u0004\u0012\u0002HH0\u0001H\u0007\u001a&\u0010L\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00020M0\u0001\"\u0004\b\u0000\u0010\u00022\f\u0010I\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0001\u001a&\u0010N\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00020O0\u0001\"\u0004\b\u0000\u0010\u00022\f\u0010I\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0001\u001a@\u0010P\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u0002H\n\u0012\u0004\u0012\u0002H\u000b0Q0\u0001\"\u0004\b\u0000\u0010\n\"\u0004\b\u0001\u0010\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u0002H\n0\u00012\f\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\u000b0\u0001\u001a\u0010\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020R0\u0001*\u00020S\u001a\u0010\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020T0\u0001*\u00020U\u001a\u0010\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020V0\u0001*\u00020W\u001a\u0010\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020X0\u0001*\u00020Y\u001a\u0010\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020Z0\u0001*\u00020[\u001a\u0012\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\\0\u0001*\u00020]H\u0007\u001a\u000e\u0010^\u001a\b\u0012\u0004\u0012\u00020_0\u0001H\u0007\"3\u0010\u0000\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001H\u00020\u0001\"\b\b\u0000\u0010\u0002*\u00020\u0003*\b\u0012\u0004\u0012\u0002H\u00020\u00018F¢\u0006\f\u0012\u0004\b\u0004\u0010\u0005\u001a\u0004\b\u0006\u0010\u0007¨\u0006`"}, d2 = {"nullable", "Lkotlinx/serialization/KSerializer;", "T", b.f42142b, "getNullable$annotations", "(Lkotlinx/serialization/KSerializer;)V", "getNullable", "(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;", "PairSerializer", "Lkotlin/Pair;", "K", "V", "keySerializer", "valueSerializer", "MapEntrySerializer", b.f42142b, "TripleSerializer", "Lkotlin/Triple;", "A", "B", "C", "aSerializer", "bSerializer", "cSerializer", "serializer", b.f42142b, "Lkotlin/Char$Companion;", "CharArraySerializer", b.f42142b, b.f42142b, "Lkotlin/Byte$Companion;", "ByteArraySerializer", b.f42142b, "UByteArraySerializer", "Lkotlin/UByteArray;", b.f42142b, "Lkotlin/Short$Companion;", "ShortArraySerializer", b.f42142b, "UShortArraySerializer", "Lkotlin/UShortArray;", b.f42142b, "Lkotlin/Int$Companion;", "IntArraySerializer", b.f42142b, "UIntArraySerializer", "Lkotlin/UIntArray;", b.f42142b, "Lkotlin/Long$Companion;", "LongArraySerializer", b.f42142b, "ULongArraySerializer", "Lkotlin/ULongArray;", b.f42142b, "Lkotlin/Float$Companion;", "FloatArraySerializer", b.f42142b, b.f42142b, "Lkotlin/Double$Companion;", "DoubleArraySerializer", b.f42142b, b.f42142b, "Lkotlin/Boolean$Companion;", "(Lkotlin/jvm/internal/BooleanCompanionObject;)Lkotlinx/serialization/KSerializer;", "BooleanArraySerializer", b.f42142b, b.f42142b, "(Lkotlin/Unit;)Lkotlinx/serialization/KSerializer;", b.f42142b, "Lkotlin/String$Companion;", "ArraySerializer", b.f42142b, "E", "elementSerializer", "kClass", "Lkotlin/reflect/KClass;", "ListSerializer", b.f42142b, "SetSerializer", b.f42142b, "MapSerializer", b.f42142b, "Lkotlin/UInt;", "Lkotlin/UInt$Companion;", "Lkotlin/ULong;", "Lkotlin/ULong$Companion;", "Lkotlin/UByte;", "Lkotlin/UByte$Companion;", "Lkotlin/UShort;", "Lkotlin/UShort$Companion;", "Lkotlin/time/Duration;", "Lkotlin/time/Duration$Companion;", "Lkotlin/uuid/Uuid;", "Lkotlin/uuid/Uuid$Companion;", "NothingSerializer", b.f42142b, "kotlinx-serialization-core"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class BuiltinSerializersKt {
    @ExperimentalSerializationApi
    public static final <T, E extends T> KSerializer<E[]> ArraySerializer(KSerializer<E> elementSerializer) {
        Intrinsics.g(elementSerializer, "elementSerializer");
        Intrinsics.k();
        throw null;
    }

    @NotNull
    public static final KSerializer<boolean[]> BooleanArraySerializer() {
        return BooleanArraySerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<byte[]> ByteArraySerializer() {
        return ByteArraySerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<char[]> CharArraySerializer() {
        return CharArraySerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<double[]> DoubleArraySerializer() {
        return DoubleArraySerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<float[]> FloatArraySerializer() {
        return FloatArraySerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<int[]> IntArraySerializer() {
        return IntArraySerializer.INSTANCE;
    }

    @NotNull
    public static final <T> KSerializer<List<T>> ListSerializer(@NotNull KSerializer<T> elementSerializer) {
        Intrinsics.g(elementSerializer, "elementSerializer");
        return new ArrayListSerializer(elementSerializer);
    }

    @NotNull
    public static final KSerializer<long[]> LongArraySerializer() {
        return LongArraySerializer.INSTANCE;
    }

    @NotNull
    public static final <K, V> KSerializer<Map.Entry<K, V>> MapEntrySerializer(@NotNull KSerializer<K> keySerializer, @NotNull KSerializer<V> valueSerializer) {
        Intrinsics.g(keySerializer, "keySerializer");
        Intrinsics.g(valueSerializer, "valueSerializer");
        return new MapEntrySerializer(keySerializer, valueSerializer);
    }

    @NotNull
    public static final <K, V> KSerializer<Map<K, V>> MapSerializer(@NotNull KSerializer<K> keySerializer, @NotNull KSerializer<V> valueSerializer) {
        Intrinsics.g(keySerializer, "keySerializer");
        Intrinsics.g(valueSerializer, "valueSerializer");
        return new LinkedHashMapSerializer(keySerializer, valueSerializer);
    }

    @ExperimentalSerializationApi
    @NotNull
    public static final KSerializer NothingSerializer() {
        return NothingSerializer.INSTANCE;
    }

    @NotNull
    public static final <K, V> KSerializer<Pair<K, V>> PairSerializer(@NotNull KSerializer<K> keySerializer, @NotNull KSerializer<V> valueSerializer) {
        Intrinsics.g(keySerializer, "keySerializer");
        Intrinsics.g(valueSerializer, "valueSerializer");
        return new PairSerializer(keySerializer, valueSerializer);
    }

    @NotNull
    public static final <T> KSerializer<Set<T>> SetSerializer(@NotNull KSerializer<T> elementSerializer) {
        Intrinsics.g(elementSerializer, "elementSerializer");
        return new LinkedHashSetSerializer(elementSerializer);
    }

    @NotNull
    public static final KSerializer<short[]> ShortArraySerializer() {
        return ShortArraySerializer.INSTANCE;
    }

    @NotNull
    public static final <A, B, C> KSerializer<Triple<A, B, C>> TripleSerializer(@NotNull KSerializer<A> aSerializer, @NotNull KSerializer<B> bSerializer, @NotNull KSerializer<C> cSerializer) {
        Intrinsics.g(aSerializer, "aSerializer");
        Intrinsics.g(bSerializer, "bSerializer");
        Intrinsics.g(cSerializer, "cSerializer");
        return new TripleSerializer(aSerializer, bSerializer, cSerializer);
    }

    @ExperimentalSerializationApi
    @ExperimentalUnsignedTypes
    @NotNull
    public static final KSerializer<UByteArray> UByteArraySerializer() {
        return UByteArraySerializer.INSTANCE;
    }

    @ExperimentalSerializationApi
    @ExperimentalUnsignedTypes
    @NotNull
    public static final KSerializer<UIntArray> UIntArraySerializer() {
        return UIntArraySerializer.INSTANCE;
    }

    @ExperimentalSerializationApi
    @ExperimentalUnsignedTypes
    @NotNull
    public static final KSerializer<ULongArray> ULongArraySerializer() {
        return ULongArraySerializer.INSTANCE;
    }

    @ExperimentalSerializationApi
    @ExperimentalUnsignedTypes
    @NotNull
    public static final KSerializer<UShortArray> UShortArraySerializer() {
        return UShortArraySerializer.INSTANCE;
    }

    @NotNull
    public static final <T> KSerializer<T> getNullable(@NotNull KSerializer<T> kSerializer) {
        Intrinsics.g(kSerializer, "<this>");
        return kSerializer.getDescriptor().getIsNullable() ? kSerializer : new NullableSerializer(kSerializer);
    }

    public static /* synthetic */ void getNullable$annotations(KSerializer kSerializer) {
    }

    @NotNull
    public static final KSerializer<Character> serializer(@NotNull CharCompanionObject charCompanionObject) {
        Intrinsics.g(charCompanionObject, "<this>");
        return CharSerializer.INSTANCE;
    }

    @ExperimentalSerializationApi
    @NotNull
    public static final <T, E extends T> KSerializer<E[]> ArraySerializer(@NotNull KClass<T> kClass, @NotNull KSerializer<E> elementSerializer) {
        Intrinsics.g(kClass, "kClass");
        Intrinsics.g(elementSerializer, "elementSerializer");
        return new ReferenceArraySerializer(kClass, elementSerializer);
    }

    @NotNull
    public static final KSerializer<Byte> serializer(@NotNull ByteCompanionObject byteCompanionObject) {
        Intrinsics.g(byteCompanionObject, "<this>");
        return ByteSerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<Short> serializer(@NotNull ShortCompanionObject shortCompanionObject) {
        Intrinsics.g(shortCompanionObject, "<this>");
        return ShortSerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<Integer> serializer(@NotNull IntCompanionObject intCompanionObject) {
        Intrinsics.g(intCompanionObject, "<this>");
        return IntSerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<Long> serializer(@NotNull LongCompanionObject longCompanionObject) {
        Intrinsics.g(longCompanionObject, "<this>");
        return LongSerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<Float> serializer(@NotNull FloatCompanionObject floatCompanionObject) {
        Intrinsics.g(floatCompanionObject, "<this>");
        return FloatSerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<Double> serializer(@NotNull DoubleCompanionObject doubleCompanionObject) {
        Intrinsics.g(doubleCompanionObject, "<this>");
        return DoubleSerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<Boolean> serializer(@NotNull BooleanCompanionObject booleanCompanionObject) {
        Intrinsics.g(booleanCompanionObject, "<this>");
        return BooleanSerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<Unit> serializer(@NotNull Unit unit) {
        Intrinsics.g(unit, "<this>");
        return UnitSerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<String> serializer(@NotNull StringCompanionObject stringCompanionObject) {
        Intrinsics.g(stringCompanionObject, "<this>");
        return StringSerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<UInt> serializer(@NotNull UInt.Companion companion) {
        Intrinsics.g(companion, "<this>");
        return UIntSerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<ULong> serializer(@NotNull ULong.Companion companion) {
        Intrinsics.g(companion, "<this>");
        return ULongSerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<UByte> serializer(@NotNull UByte.Companion companion) {
        Intrinsics.g(companion, "<this>");
        return UByteSerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<UShort> serializer(@NotNull UShort.Companion companion) {
        Intrinsics.g(companion, "<this>");
        return UShortSerializer.INSTANCE;
    }

    @NotNull
    public static final KSerializer<Duration> serializer(@NotNull Duration.Companion companion) {
        Intrinsics.g(companion, "<this>");
        return DurationSerializer.INSTANCE;
    }

    @ExperimentalUuidApi
    @NotNull
    public static final KSerializer<Uuid> serializer(@NotNull Uuid.Companion companion) {
        Intrinsics.g(companion, "<this>");
        return UuidSerializer.INSTANCE;
    }
}
