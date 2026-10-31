package kotlinx.serialization.protobuf.internal;

import b.c0;
import b70.c;
import b70.k;
import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.PolymorphicKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialKind;
import kotlinx.serialization.descriptors.StructureKind;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.internal.AbstractCollectionSerializer;
import kotlinx.serialization.internal.ElementMarker;
import kotlinx.serialization.internal.MapLikeSerializer;
import kotlinx.serialization.modules.SerializersModule;
import kotlinx.serialization.protobuf.ProtoBuf;
import kotlinx.serialization.protobuf.ProtoIntegerType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000®\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0015\n\u0000\n\u0002\u0010%\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\n\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\f\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0012\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0001\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0010\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\u000e\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u0006\u001a\u00020\u0007J\u0018\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u001b\u001a\u00020\u0012H\u0002J(\u0010\u001c\u001a\u00020\u0019*\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00120\u00112\u0006\u0010\u001d\u001a\u00020\u00122\u0006\u0010\u001e\u001a\u00020\u0012H\u0002J\u0010\u0010\u001f\u001a\u00020\u00122\u0006\u0010 \u001a\u00020\u0012H\u0002J\u0010\u0010!\u001a\u00020\u00122\u0006\u0010\"\u001a\u00020\u0012H\u0002J\u0018\u0010#\u001a\u00020\u00122\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\"\u001a\u00020\u0012H\u0002J\u0018\u0010$\u001a\u00020\u00122\u0006\u0010%\u001a\u00020\u00072\u0006\u0010\"\u001a\u00020\u0012H\u0002J\u0010\u0010&\u001a\u00020'2\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010(\u001a\u00020\u00192\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0014\u0010)\u001a\u00020\u00152\n\u0010*\u001a\u00060+j\u0002`,H\u0014J\u0014\u0010-\u001a\u00020.2\n\u0010*\u001a\u00060+j\u0002`,H\u0014J\u0014\u0010/\u001a\u0002002\n\u0010*\u001a\u00060+j\u0002`,H\u0014J\u0014\u00101\u001a\u00020\u00122\n\u0010*\u001a\u00060+j\u0002`,H\u0014J\u0014\u00102\u001a\u00020+2\n\u0010*\u001a\u00060+j\u0002`,H\u0014J\u0014\u00103\u001a\u0002042\n\u0010*\u001a\u00060+j\u0002`,H\u0014J\u0014\u00105\u001a\u0002062\n\u0010*\u001a\u00060+j\u0002`,H\u0014J\u0014\u00107\u001a\u0002082\n\u0010*\u001a\u00060+j\u0002`,H\u0014J\u0014\u00109\u001a\u00020:2\n\u0010*\u001a\u00060+j\u0002`,H\u0014J\u001c\u0010;\u001a\u00020\u00122\n\u0010*\u001a\u00060+j\u0002`,2\u0006\u0010<\u001a\u00020\u0007H\u0014J!\u0010=\u001a\u0002H>\"\u0004\b\u0000\u0010>2\f\u0010?\u001a\b\u0012\u0004\u0012\u0002H>0@H\u0016¢\u0006\u0002\u0010AJ+\u0010=\u001a\u0002H>\"\u0004\b\u0000\u0010>2\f\u0010?\u001a\b\u0012\u0004\u0012\u0002H>0@2\b\u0010B\u001a\u0004\u0018\u0001H>H\u0014¢\u0006\u0002\u0010CJ\u0012\u0010D\u001a\u00020E2\b\u0010B\u001a\u0004\u0018\u00010EH\u0002J+\u0010F\u001a\u0002H>\"\u0004\b\u0000\u0010>2\f\u0010?\u001a\b\u0012\u0004\u0012\u0002H>0@2\b\u0010B\u001a\u0004\u0018\u0001H>H\u0002¢\u0006\u0002\u0010CJ\u0018\u0010G\u001a\u00060+j\u0002`,*\u00020\u00072\u0006\u0010\u001e\u001a\u00020\u0012H\u0014J\u0010\u0010H\u001a\u00020\u00122\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\b\u0010I\u001a\u00020\u0015H\u0016J\u0018\u0010J\u001a\u00020\u00152\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u001e\u001a\u00020\u0012H\u0002JG\u0010K\u001a\u0002H>\"\u0004\b\u0000\u0010>2\n\u0010*\u001a\u00060+j\u0002`,2%\u0010L\u001a!\u0012\u0017\u0012\u00150+j\u0002`,¢\u0006\f\bN\u0012\b\bO\u0012\u0004\b\b(*\u0012\u0004\u0012\u0002H>0MH\u0082\b¢\u0006\u0002\u0010PJ\u001d\u0010Q\u001a\u00020R2\n\u0010*\u001a\u00060+j\u0002`,2\u0006\u0010S\u001a\u00020TH\u0082\bR\u0010\u0010\u0002\u001a\u00020\u00038\u0004X\u0085\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0004\u001a\u00020\u00058\u0004X\u0085\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u00020\u00078\u0004X\u0085\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\n\u001a\u00020\u000b8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\f\u0010\rR\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u0010\u0010\u001a\u0010\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u0012\u0018\u00010\u0011X\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u0010\u0013\u001a\u0010\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u0012\u0018\u00010\u0011X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006U"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ProtobufDecoder;", "Lkotlinx/serialization/protobuf/internal/ProtobufTaggedDecoder;", "proto", "Lkotlinx/serialization/protobuf/ProtoBuf;", "reader", "Lkotlinx/serialization/protobuf/internal/ProtobufReader;", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "<init>", "(Lkotlinx/serialization/protobuf/ProtoBuf;Lkotlinx/serialization/protobuf/internal/ProtobufReader;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "getSerializersModule", "()Lkotlinx/serialization/modules/SerializersModule;", "indexCache", b.f42142b, "sparseIndexCache", b.f42142b, b.f42142b, "index2IdMap", "nullValue", b.f42142b, "elementMarker", "Lkotlinx/serialization/internal/ElementMarker;", "populateCache", b.f42142b, "populateCacheMap", "elements", "putProtoId", "protoId", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "getIndexByNum", "protoNum", "getIndexByNumSlowPath", "protoTag", "findIndexByTag", "findIndexByTagSlowPath", "desc", "beginStructure", "Lkotlinx/serialization/encoding/CompositeDecoder;", "endStructure", "decodeTaggedBoolean", "tag", b.f42142b, "Lkotlinx/serialization/protobuf/internal/ProtoDesc;", "decodeTaggedByte", b.f42142b, "decodeTaggedShort", b.f42142b, "decodeTaggedInt", "decodeTaggedLong", "decodeTaggedFloat", b.f42142b, "decodeTaggedDouble", b.f42142b, "decodeTaggedChar", b.f42142b, "decodeTaggedString", b.f42142b, "decodeTaggedEnum", "enumDescription", "decodeSerializableValue", "T", "deserializer", "Lkotlinx/serialization/DeserializationStrategy;", "(Lkotlinx/serialization/DeserializationStrategy;)Ljava/lang/Object;", "previousValue", "(Lkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;", "deserializeByteArray", b.f42142b, "deserializeMap", "getTag", "decodeElementIndex", "decodeNotNullMark", "readIfAbsent", "decodeOrThrow", "action", "Lkotlin/Function1;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "(JLkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "rethrowException", b.f42142b, "e", "Lkotlinx/serialization/protobuf/internal/ProtobufDecodingException;", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public class ProtobufDecoder extends ProtobufTaggedDecoder {

    @JvmField
    @NotNull
    protected final SerialDescriptor descriptor;

    @NotNull
    private final ElementMarker elementMarker;

    @Nullable
    private Map<Integer, Integer> index2IdMap;

    @Nullable
    private int[] indexCache;
    private boolean nullValue;

    @JvmField
    @NotNull
    protected final ProtoBuf proto;

    @JvmField
    @NotNull
    protected final ProtobufReader reader;

    @Nullable
    private Map<Integer, Integer> sparseIndexCache;

    public ProtobufDecoder(@NotNull ProtoBuf proto, @NotNull ProtobufReader reader, @NotNull SerialDescriptor descriptor) {
        Intrinsics.g(proto, "proto");
        Intrinsics.g(reader, "reader");
        Intrinsics.g(descriptor, "descriptor");
        this.proto = proto;
        this.reader = reader;
        this.descriptor = descriptor;
        this.elementMarker = new ElementMarker(descriptor, new ProtobufDecoder$elementMarker$1(this));
        populateCache(descriptor);
    }

    private final <T> T decodeOrThrow(long tag, Function1<? super Long, ? extends T> action) {
        try {
            return (T) action.invoke(Long.valueOf(tag));
        } catch (ProtobufDecodingException e3) {
            throw new ProtobufDecodingException("Error while decoding proto number " + ((int) (tag & 2147483647L)) + " of " + this.descriptor.getSerialName(), e3);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [long] */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v9, types: [byte[]] */
    private final byte[] deserializeByteArray(byte[] previousValue) {
        long currentTagOrDefault = getCurrentTagOrDefault();
        try {
            currentTagOrDefault = currentTagOrDefault == ProtobufTaggedBaseKt.MISSING_TAG ? this.reader.readByteArrayNoTag() : this.reader.readByteArray();
            return previousValue == null ? currentTagOrDefault : u90.b.V(previousValue, currentTagOrDefault);
        } catch (ProtobufDecodingException e3) {
            throw new ProtobufDecodingException("Error while decoding proto number " + ((int) (currentTagOrDefault & 2147483647L)) + " of " + this.descriptor.getSerialName(), e3);
        }
    }

    /* JADX WARN: Type inference failed for: r0v4, types: [T, java.util.LinkedHashMap, java.util.Map] */
    private final <T> T deserializeMap(DeserializationStrategy<? extends T> deserializer, T previousValue) {
        Intrinsics.e(deserializer, "null cannot be cast to non-null type kotlinx.serialization.internal.MapLikeSerializer<kotlin.Any?, kotlin.Any?, T of kotlinx.serialization.protobuf.internal.ProtobufDecoder.deserializeMap, *>");
        MapLikeSerializer mapLikeSerializer = (MapLikeSerializer) deserializer;
        KSerializer kSerializerMapEntrySerializer = BuiltinSerializersKt.MapEntrySerializer(mapLikeSerializer.getKeySerializer(), mapLikeSerializer.getValueSerializer());
        Map map = previousValue instanceof Map ? (Map) previousValue : null;
        Set setEntrySet = map != null ? map.entrySet() : null;
        KSerializer kSerializerSetSerializer = BuiltinSerializersKt.SetSerializer(kSerializerMapEntrySerializer);
        Intrinsics.e(kSerializerSetSerializer, "null cannot be cast to non-null type kotlinx.serialization.internal.AbstractCollectionSerializer<kotlin.collections.Map.Entry<kotlin.Any?, kotlin.Any?>, kotlin.collections.Set<kotlin.collections.Map.Entry<kotlin.Any?, kotlin.Any?>>, *>");
        Set<Map.Entry> set = (Set) ((AbstractCollectionSerializer) kSerializerSetSerializer).merge(this, setEntrySet);
        int iD0 = k.d0(c.u0(set, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        ?? r02 = (T) new LinkedHashMap(iD0);
        for (Map.Entry entry : set) {
            r02.put(entry.getKey(), entry.getValue());
        }
        return r02;
    }

    private final int findIndexByTag(SerialDescriptor descriptor, int protoTag) {
        return (protoTag >= descriptor.getElementsCount() || protoTag < 0 || HelpersKt.extractProtoId(descriptor, protoTag, true) != protoTag) ? findIndexByTagSlowPath(descriptor, protoTag) : protoTag;
    }

    private final int findIndexByTagSlowPath(SerialDescriptor desc, int protoTag) {
        int elementsCount = desc.getElementsCount();
        for (int i5 = 0; i5 < elementsCount; i5++) {
            if (HelpersKt.extractProtoId(desc, i5, true) == protoTag) {
                return i5;
            }
        }
        throw new ProtobufDecodingException(protoTag + " is not among valid " + this.descriptor.getSerialName() + " enum proto numbers", null, 2, null);
    }

    private final int getIndexByNum(int protoNum) {
        int[] iArr = this.indexCache;
        if (iArr == null) {
            return getIndexByNumSlowPath(protoNum);
        }
        if (protoNum < 0 || protoNum >= iArr.length) {
            return -1;
        }
        return iArr[protoNum];
    }

    private final int getIndexByNumSlowPath(int protoTag) {
        Map<Integer, Integer> map = this.sparseIndexCache;
        Intrinsics.d(map);
        Integer num = map.get(Integer.valueOf(protoTag));
        if (num == null) {
            num = -1;
        }
        return num.intValue();
    }

    private final void populateCacheMap(SerialDescriptor descriptor, int elements) {
        HashMap map = new HashMap(elements, 1.0f);
        int i5 = 0;
        for (int i11 = 0; i11 < elements; i11++) {
            if (HelpersKt.extractProtoId(descriptor, i11, false) == -2) {
                List<SerialDescriptor> allOneOfSerializerOfField = HelpersKt.getAllOneOfSerializerOfField(descriptor.getElementDescriptor(i11), getSerializersModule());
                ArrayList arrayList = new ArrayList(c.u0(allOneOfSerializerOfField, 10));
                Iterator<T> it = allOneOfSerializerOfField.iterator();
                while (it.hasNext()) {
                    arrayList.add(Integer.valueOf((int) (HelpersKt.extractParameters((SerialDescriptor) it.next(), 0) & 2147483647L)));
                }
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    putProtoId(map, ((Number) it2.next()).intValue(), i11);
                }
                i5++;
            } else {
                putProtoId(map, HelpersKt.extractProtoId(descriptor, i11, false), i11);
            }
        }
        if (i5 > 0) {
            this.index2IdMap = new HashMap(i5, 1.0f);
        }
        this.sparseIndexCache = map;
    }

    private final void putProtoId(Map<Integer, Integer> map, int i5, int i11) {
        map.put(Integer.valueOf(i5), Integer.valueOf(i11));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean readIfAbsent(SerialDescriptor descriptor, int index) {
        if (!descriptor.isElementOptional(index)) {
            SerialDescriptor elementDescriptor = descriptor.getElementDescriptor(index);
            SerialKind kind = elementDescriptor.getKind();
            if (Intrinsics.b(kind, StructureKind.MAP.INSTANCE) || Intrinsics.b(kind, StructureKind.LIST.INSTANCE)) {
                this.nullValue = false;
                return true;
            }
            if (elementDescriptor.getIsNullable()) {
                this.nullValue = true;
                return true;
            }
        }
        return false;
    }

    private final Void rethrowException(long tag, ProtobufDecodingException e3) {
        throw new ProtobufDecodingException("Error while decoding proto number " + ((int) (tag & 2147483647L)) + " of " + this.descriptor.getSerialName(), e3);
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder, kotlinx.serialization.encoding.Decoder
    @NotNull
    public CompositeDecoder beginStructure(@NotNull SerialDescriptor descriptor) {
        Integer num;
        Intrinsics.g(descriptor, "descriptor");
        try {
            SerialKind kind = descriptor.getKind();
            StructureKind.LIST list = StructureKind.LIST.INSTANCE;
            if (Intrinsics.b(kind, list)) {
                long currentTagOrDefault = getCurrentTagOrDefault();
                if (!Intrinsics.b(this.descriptor.getKind(), list) || currentTagOrDefault == ProtobufTaggedBaseKt.MISSING_TAG || Intrinsics.b(this.descriptor, descriptor)) {
                    return (this.reader.currentType == ProtoWireType.SIZE_DELIMITED && HelpersKt.isPackable(descriptor.getElementDescriptor(0))) ? new PackedArrayDecoder(this.proto, new ProtobufReader(this.reader.objectInput()), descriptor) : new RepeatedDecoder(this.proto, this.reader, currentTagOrDefault, descriptor);
                }
                ProtobufReader protobufReaderMakeDelimited = ProtobufDecodingKt.makeDelimited(this.reader, currentTagOrDefault);
                protobufReaderMakeDelimited.readTag();
                return new RepeatedDecoder(this.proto, protobufReaderMakeDelimited, ProtoIntegerType.DEFAULT.getSignature() | 1, descriptor);
            }
            if (!Intrinsics.b(kind, StructureKind.CLASS.INSTANCE) && !Intrinsics.b(kind, StructureKind.OBJECT.INSTANCE) && !(kind instanceof PolymorphicKind)) {
                if (Intrinsics.b(kind, StructureKind.MAP.INSTANCE)) {
                    return new MapEntryReader(this.proto, ProtobufDecodingKt.makeDelimitedForced(this.reader, getCurrentTagOrDefault()), getCurrentTagOrDefault(), descriptor);
                }
                throw new SerializationException("Primitives are not supported at top-level");
            }
            long currentTagOrDefault2 = getCurrentTagOrDefault();
            if (currentTagOrDefault2 == ProtobufTaggedBaseKt.MISSING_TAG && Intrinsics.b(this.descriptor, descriptor)) {
                return this;
            }
            if (!HelpersKt.isOneOf(currentTagOrDefault2)) {
                return new ProtobufDecoder(this.proto, ProtobufDecodingKt.makeDelimited(this.reader, currentTagOrDefault2), descriptor);
            }
            int i5 = ((int) (currentTagOrDefault2 & 2147483647L)) - 1;
            Map<Integer, Integer> map = this.index2IdMap;
            if (map != null && (num = map.get(Integer.valueOf(i5))) != null) {
                currentTagOrDefault2 = HelpersKt.overrideId(currentTagOrDefault2, num.intValue());
            }
            return new OneOfPolymorphicReader(this.proto, this.reader, currentTagOrDefault2, descriptor);
        } catch (ProtobufDecodingException e3) {
            throw new ProtobufDecodingException("Fail to begin structure for " + descriptor.getSerialName() + " in " + this.descriptor.getSerialName() + " at proto number " + ((int) (getCurrentTagOrDefault() & 2147483647L)), e3);
        }
    }

    public int decodeElementIndex(@NotNull SerialDescriptor descriptor) {
        Map<Integer, Integer> map;
        Intrinsics.g(descriptor, "descriptor");
        while (true) {
            try {
                int tag = this.reader.readTag();
                if (tag == -1) {
                    return this.elementMarker.nextUnmarkedIndex();
                }
                if (tag == 0) {
                    throw new SerializationException("0 is not allowed as the protobuf field number in " + descriptor.getSerialName() + ", the input bytes may have been corrupted");
                }
                int indexByNum = getIndexByNum(tag);
                if (indexByNum != -1) {
                    if (HelpersKt.isOneOf(HelpersKt.extractParameters(descriptor, indexByNum)) && (map = this.index2IdMap) != null) {
                        map.put(Integer.valueOf(indexByNum), Integer.valueOf(tag));
                    }
                    this.elementMarker.mark(indexByNum);
                    return indexByNum;
                }
                this.reader.skipElement();
            } catch (ProtobufDecodingException e3) {
                throw new ProtobufDecodingException("Fail to get element index for " + descriptor.getSerialName() + " in " + this.descriptor.getSerialName(), e3);
            }
        }
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder, kotlinx.serialization.encoding.Decoder
    public boolean decodeNotNullMark() {
        return !this.nullValue;
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public <T> T decodeSerializableValue(@NotNull DeserializationStrategy<? extends T> deserializer) {
        Intrinsics.g(deserializer, "deserializer");
        return (T) decodeSerializableValue(deserializer, null);
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    public boolean decodeTaggedBoolean(long tag) {
        int iDecodeTaggedInt = decodeTaggedInt(tag);
        if (iDecodeTaggedInt == 0) {
            return false;
        }
        if (iDecodeTaggedInt == 1) {
            return true;
        }
        throw new SerializationException(c0.h(iDecodeTaggedInt, "Unexpected boolean value: "));
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    public byte decodeTaggedByte(long tag) {
        return (byte) decodeTaggedInt(tag);
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    public char decodeTaggedChar(long tag) {
        return (char) decodeTaggedInt(tag);
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    public double decodeTaggedDouble(long tag) {
        try {
            return tag == ProtobufTaggedBaseKt.MISSING_TAG ? this.reader.readDoubleNoTag() : this.reader.readDouble();
        } catch (ProtobufDecodingException e3) {
            throw new ProtobufDecodingException("Error while decoding proto number " + ((int) (tag & 2147483647L)) + " of " + this.descriptor.getSerialName(), e3);
        }
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    public int decodeTaggedEnum(long tag, @NotNull SerialDescriptor enumDescription) {
        Intrinsics.g(enumDescription, "enumDescription");
        return findIndexByTag(enumDescription, decodeTaggedInt(tag));
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    public float decodeTaggedFloat(long tag) {
        try {
            return tag == ProtobufTaggedBaseKt.MISSING_TAG ? this.reader.readFloatNoTag() : this.reader.readFloat();
        } catch (ProtobufDecodingException e3) {
            throw new ProtobufDecodingException("Error while decoding proto number " + ((int) (tag & 2147483647L)) + " of " + this.descriptor.getSerialName(), e3);
        }
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    public int decodeTaggedInt(long tag) {
        try {
            return tag == ProtobufTaggedBaseKt.MISSING_TAG ? this.reader.readInt32NoTag() : this.reader.readInt(HelpersKt.getIntegerType(tag));
        } catch (ProtobufDecodingException e3) {
            throw new ProtobufDecodingException("Error while decoding proto number " + ((int) (tag & 2147483647L)) + " of " + this.descriptor.getSerialName(), e3);
        }
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    public long decodeTaggedLong(long tag) {
        try {
            return tag == ProtobufTaggedBaseKt.MISSING_TAG ? this.reader.readLongNoTag() : this.reader.readLong(HelpersKt.getIntegerType(tag));
        } catch (ProtobufDecodingException e3) {
            throw new ProtobufDecodingException("Error while decoding proto number " + ((int) (tag & 2147483647L)) + " of " + this.descriptor.getSerialName(), e3);
        }
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    public short decodeTaggedShort(long tag) {
        return (short) decodeTaggedInt(tag);
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    @NotNull
    public String decodeTaggedString(long tag) {
        try {
            return tag == ProtobufTaggedBaseKt.MISSING_TAG ? this.reader.readStringNoTag() : this.reader.readString();
        } catch (ProtobufDecodingException e3) {
            throw new ProtobufDecodingException("Error while decoding proto number " + ((int) (tag & 2147483647L)) + " of " + this.descriptor.getSerialName(), e3);
        }
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder, kotlinx.serialization.encoding.CompositeDecoder
    public void endStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
    }

    @Override // kotlinx.serialization.encoding.Decoder, kotlinx.serialization.encoding.CompositeDecoder
    @NotNull
    public SerializersModule getSerializersModule() {
        return this.proto.getSerializersModule();
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    public long getTag(@NotNull SerialDescriptor serialDescriptor, int i5) {
        Intrinsics.g(serialDescriptor, "<this>");
        return HelpersKt.extractParameters(serialDescriptor, i5);
    }

    public final void populateCache(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        int elementsCount = descriptor.getElementsCount();
        if (elementsCount >= 32) {
            populateCacheMap(descriptor, elementsCount);
            return;
        }
        int i5 = elementsCount + 1;
        int[] iArr = new int[i5];
        for (int i11 = 0; i11 < i5; i11++) {
            iArr[i11] = -1;
        }
        for (int i12 = 0; i12 < elementsCount; i12++) {
            int iExtractProtoId = HelpersKt.extractProtoId(descriptor, i12, false);
            if (iExtractProtoId > elementsCount || iExtractProtoId == -2) {
                populateCacheMap(descriptor, elementsCount);
                return;
            }
            iArr[iExtractProtoId] = i12;
        }
        this.indexCache = iArr;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    public <T> T decodeSerializableValue(@NotNull DeserializationStrategy<? extends T> deserializer, @Nullable T previousValue) {
        String string;
        Intrinsics.g(deserializer, "deserializer");
        try {
            return deserializer instanceof MapLikeSerializer ? (T) deserializeMap(deserializer, previousValue) : Intrinsics.b(deserializer.getDescriptor(), BuiltinSerializersKt.ByteArraySerializer().getDescriptor()) ? (T) deserializeByteArray((byte[]) previousValue) : deserializer instanceof AbstractCollectionSerializer ? (T) ((AbstractCollectionSerializer) deserializer).merge(this, previousValue) : deserializer.deserialize(this);
        } catch (ProtobufDecodingException e3) {
            long currentTagOrDefault = getCurrentTagOrDefault();
            if (Intrinsics.b(this.descriptor, deserializer.getDescriptor())) {
                string = "Error while decoding " + this.descriptor.getSerialName();
            } else if (Intrinsics.b(this.descriptor.getKind(), StructureKind.LIST.INSTANCE) && !Intrinsics.b(deserializer.getDescriptor().getKind(), StructureKind.MAP.INSTANCE)) {
                StringBuilder sb2 = new StringBuilder("Error while decoding index ");
                sb2.append(((int) (currentTagOrDefault & 2147483647L)) - 1);
                sb2.append(" in repeated field of ");
                sb2.append(deserializer.getDescriptor().getSerialName());
                string = sb2.toString();
            } else if (Intrinsics.b(this.descriptor.getKind(), StructureKind.MAP.INSTANCE)) {
                int i5 = ((int) (currentTagOrDefault & 2147483647L)) - 1;
                StringBuilder sbV = c0.v("Error while decoding ", i5 / 2, i5 % 2 == 0 ? DatabaseConstants.KEY_FIELD : "value", " of index ", " in map field of ");
                sbV.append(deserializer.getDescriptor().getSerialName());
                string = sbV.toString();
            } else {
                string = "Error while decoding " + deserializer.getDescriptor().getSerialName() + " at proto number " + ((int) (currentTagOrDefault & 2147483647L)) + " of " + this.descriptor.getSerialName();
            }
            throw new ProtobufDecodingException(string, e3);
        }
    }
}
