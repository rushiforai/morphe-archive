package kotlinx.serialization.internal;

import b70.g;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.InternalSerializationApi;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.modules.SerializersModule;
import kotlinx.serialization.modules.SerializersModuleBuildersKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0098\u0001\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0001\n\u0002\b\u0003\n\u0002\u0010\u0005\n\u0002\b\u0002\n\u0002\u0010\n\n\u0002\b\u0004\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0010\u0006\n\u0002\b\u0002\n\u0002\u0010\f\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0010\u0002\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\b'\u0018\u0000*\n\b\u0000\u0010\u0001*\u0004\u0018\u00010\u00022\u00020\u00032\u00020\u0004B\u0007¢\u0006\u0004\b\u0005\u0010\u0006J\u0019\u0010\u000b\u001a\u00028\u0000*\u00020\f2\u0006\u0010\r\u001a\u00020\u000eH$¢\u0006\u0002\u0010\u000fJ\u0015\u0010\u0010\u001a\u00020\u00022\u0006\u0010\u0011\u001a\u00028\u0000H\u0014¢\u0006\u0002\u0010\u0012J\u0015\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0011\u001a\u00028\u0000H\u0014¢\u0006\u0002\u0010\u0015J\u0017\u0010\u0016\u001a\u0004\u0018\u00010\u00172\u0006\u0010\u0011\u001a\u00028\u0000H\u0014¢\u0006\u0002\u0010\u0018J\u0015\u0010\u0019\u001a\u00020\u00142\u0006\u0010\u0011\u001a\u00028\u0000H\u0014¢\u0006\u0002\u0010\u0015J\u0015\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u0011\u001a\u00028\u0000H\u0014¢\u0006\u0002\u0010\u001cJ\u0015\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u0011\u001a\u00028\u0000H\u0014¢\u0006\u0002\u0010\u001fJ\u0015\u0010 \u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00028\u0000H\u0014¢\u0006\u0002\u0010!J\u0015\u0010\"\u001a\u00020#2\u0006\u0010\u0011\u001a\u00028\u0000H\u0014¢\u0006\u0002\u0010$J\u0015\u0010%\u001a\u00020&2\u0006\u0010\u0011\u001a\u00028\u0000H\u0014¢\u0006\u0002\u0010'J\u0015\u0010(\u001a\u00020)2\u0006\u0010\u0011\u001a\u00028\u0000H\u0014¢\u0006\u0002\u0010*J\u0015\u0010+\u001a\u00020,2\u0006\u0010\u0011\u001a\u00028\u0000H\u0014¢\u0006\u0002\u0010-J\u0015\u0010.\u001a\u00020/2\u0006\u0010\u0011\u001a\u00028\u0000H\u0014¢\u0006\u0002\u00100J\u001d\u00101\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00028\u00002\u0006\u00102\u001a\u00020\fH\u0014¢\u0006\u0002\u00103J\u001d\u00104\u001a\u00020\u00032\u0006\u0010\u0011\u001a\u00028\u00002\u0006\u00105\u001a\u00020\fH\u0014¢\u0006\u0002\u00106J1\u00107\u001a\u0002H8\"\n\b\u0001\u00108*\u0004\u0018\u00010\u00022\f\u00109\u001a\b\u0012\u0004\u0012\u0002H80:2\b\u0010;\u001a\u0004\u0018\u0001H8H\u0014¢\u0006\u0002\u0010<J\u0010\u0010=\u001a\u00020\u00032\u0006\u0010>\u001a\u00020\fH\u0016J\b\u0010?\u001a\u00020\u0014H\u0016J\b\u0010@\u001a\u0004\u0018\u00010\u0017J\u0006\u0010A\u001a\u00020\u0014J\u0006\u0010B\u001a\u00020\u001bJ\u0006\u0010C\u001a\u00020\u001eJ\u0006\u0010D\u001a\u00020\u000eJ\u0006\u0010E\u001a\u00020#J\u0006\u0010F\u001a\u00020&J\u0006\u0010G\u001a\u00020)J\u0006\u0010H\u001a\u00020,J\u0006\u0010I\u001a\u00020/J\u000e\u0010J\u001a\u00020\u000e2\u0006\u00102\u001a\u00020\fJ\u0010\u0010K\u001a\u00020\u00042\u0006\u0010>\u001a\u00020\fH\u0016J\u0010\u0010L\u001a\u00020M2\u0006\u0010>\u001a\u00020\fH\u0016J\u0016\u0010N\u001a\u00020\u00142\u0006\u0010>\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010O\u001a\u00020\u001b2\u0006\u0010>\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010P\u001a\u00020\u001e2\u0006\u0010>\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010Q\u001a\u00020\u000e2\u0006\u0010>\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010R\u001a\u00020#2\u0006\u0010>\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010S\u001a\u00020&2\u0006\u0010>\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010T\u001a\u00020)2\u0006\u0010>\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010U\u001a\u00020,2\u0006\u0010>\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010V\u001a\u00020/2\u0006\u0010>\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010W\u001a\u00020\u00032\u0006\u0010>\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eJ?\u0010X\u001a\u0002H8\"\n\b\u0001\u00108*\u0004\u0018\u00010\u00022\u0006\u0010>\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000e2\f\u00109\u001a\b\u0012\u0004\u0012\u0002H80:2\b\u0010;\u001a\u0004\u0018\u0001H8¢\u0006\u0002\u0010YJA\u0010Z\u001a\u0004\u0018\u0001H8\"\b\b\u0001\u00108*\u00020\u00022\u0006\u0010>\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000e2\u000e\u00109\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001H80:2\b\u0010;\u001a\u0004\u0018\u0001H8¢\u0006\u0002\u0010YJ)\u0010[\u001a\u0002H\\\"\u0004\b\u0001\u0010\\2\u0006\u0010\u0011\u001a\u00028\u00002\f\u0010]\u001a\b\u0012\u0004\u0012\u0002H\\0^H\u0002¢\u0006\u0002\u0010_J\u0015\u0010j\u001a\u00020M2\u0006\u0010k\u001a\u00028\u0000H\u0004¢\u0006\u0002\u0010lJ\u0016\u0010m\u001a\u00020M2\f\u0010n\u001a\b\u0012\u0004\u0012\u00028\u00000\u0000H\u0004J\r\u0010p\u001a\u00028\u0000H\u0004¢\u0006\u0002\u0010gR\u0014\u0010\u0007\u001a\u00020\b8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\t\u0010\nR$\u0010`\u001a\u0012\u0012\u0004\u0012\u00028\u00000aj\b\u0012\u0004\u0012\u00028\u0000`bX\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\bc\u0010dR\u0014\u0010e\u001a\u00028\u00008DX\u0084\u0004¢\u0006\u0006\u001a\u0004\bf\u0010gR\u0016\u0010h\u001a\u0004\u0018\u00018\u00008DX\u0084\u0004¢\u0006\u0006\u001a\u0004\bi\u0010gR\u000e\u0010o\u001a\u00020\u0014X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006q"}, d2 = {"Lkotlinx/serialization/internal/TaggedDecoder;", "Tag", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlinx/serialization/encoding/Decoder;", "Lkotlinx/serialization/encoding/CompositeDecoder;", "<init>", "()V", "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "getSerializersModule", "()Lkotlinx/serialization/modules/SerializersModule;", "getTag", "Lkotlinx/serialization/descriptors/SerialDescriptor;", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/Object;", "decodeTaggedValue", "tag", "(Ljava/lang/Object;)Ljava/lang/Object;", "decodeTaggedNotNullMark", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;)Z", "decodeTaggedNull", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;)Ljava/lang/Void;", "decodeTaggedBoolean", "decodeTaggedByte", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;)B", "decodeTaggedShort", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;)S", "decodeTaggedInt", "(Ljava/lang/Object;)I", "decodeTaggedLong", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;)J", "decodeTaggedFloat", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;)F", "decodeTaggedDouble", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;)D", "decodeTaggedChar", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;)C", "decodeTaggedString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;)Ljava/lang/String;", "decodeTaggedEnum", "enumDescriptor", "(Ljava/lang/Object;Lkotlinx/serialization/descriptors/SerialDescriptor;)I", "decodeTaggedInline", "inlineDescriptor", "(Ljava/lang/Object;Lkotlinx/serialization/descriptors/SerialDescriptor;)Lkotlinx/serialization/encoding/Decoder;", "decodeSerializableValue", "T", "deserializer", "Lkotlinx/serialization/DeserializationStrategy;", "previousValue", "(Lkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;", "decodeInline", "descriptor", "decodeNotNullMark", "decodeNull", "decodeBoolean", "decodeByte", "decodeShort", "decodeInt", "decodeLong", "decodeFloat", "decodeDouble", "decodeChar", "decodeString", "decodeEnum", "beginStructure", "endStructure", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "decodeBooleanElement", "decodeByteElement", "decodeShortElement", "decodeIntElement", "decodeLongElement", "decodeFloatElement", "decodeDoubleElement", "decodeCharElement", "decodeStringElement", "decodeInlineElement", "decodeSerializableElement", "(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;", "decodeNullableSerializableElement", "tagBlock", "E", "block", "Lkotlin/Function0;", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "tagStack", "Ljava/util/ArrayList;", "Lkotlin/collections/ArrayList;", "getTagStack$kotlinx_serialization_core", "()Ljava/util/ArrayList;", "currentTag", "getCurrentTag", "()Ljava/lang/Object;", "currentTagOrNull", "getCurrentTagOrNull", "pushTag", PendingUpgradeStore.KEY_NAME, "(Ljava/lang/Object;)V", "copyTagsTo", InneractiveMediationNameConsts.OTHER, "flag", "popTag", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@InternalSerializationApi
@SourceDebugExtension
/* loaded from: classes5.dex */
public abstract class TaggedDecoder<Tag> implements Decoder, CompositeDecoder {
    private boolean flag;

    @NotNull
    private final ArrayList<Tag> tagStack = new ArrayList<>();

    /* JADX INFO: Access modifiers changed from: private */
    public static final Object decodeNullableSerializableElement$lambda$3(TaggedDecoder taggedDecoder, DeserializationStrategy deserializationStrategy, Object obj) {
        return (deserializationStrategy.getDescriptor().getIsNullable() || taggedDecoder.decodeNotNullMark()) ? taggedDecoder.decodeSerializableValue(deserializationStrategy, obj) : taggedDecoder.decodeNull();
    }

    private final <E> E tagBlock(Tag tag, Function0<? extends E> block) {
        pushTag(tag);
        E e3 = (E) block.invoke();
        if (!this.flag) {
            popTag();
        }
        this.flag = false;
        return e3;
    }

    @Override // kotlinx.serialization.encoding.Decoder
    @NotNull
    public CompositeDecoder beginStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        return this;
    }

    public final void copyTagsTo(@NotNull TaggedDecoder<Tag> other) {
        Intrinsics.g(other, "other");
        other.tagStack.addAll(this.tagStack);
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final boolean decodeBoolean() {
        return decodeTaggedBoolean(popTag());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final boolean decodeBooleanElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedBoolean(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final byte decodeByte() {
        return decodeTaggedByte(popTag());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final byte decodeByteElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedByte(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final char decodeChar() {
        return decodeTaggedChar(popTag());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final char decodeCharElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedChar(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final double decodeDouble() {
        return decodeTaggedDouble(popTag());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final double decodeDoubleElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedDouble(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final int decodeEnum(@NotNull SerialDescriptor enumDescriptor) {
        Intrinsics.g(enumDescriptor, "enumDescriptor");
        return decodeTaggedEnum(popTag(), enumDescriptor);
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final float decodeFloat() {
        return decodeTaggedFloat(popTag());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final float decodeFloatElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedFloat(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    @NotNull
    public Decoder decodeInline(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedInline(popTag(), descriptor);
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    @NotNull
    public final Decoder decodeInlineElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedInline(getTag(descriptor, index), descriptor.getElementDescriptor(index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final int decodeInt() {
        return decodeTaggedInt(popTag());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final int decodeIntElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedInt(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final long decodeLong() {
        return decodeTaggedLong(popTag());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final long decodeLongElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedLong(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public boolean decodeNotNullMark() {
        Tag currentTagOrNull = getCurrentTagOrNull();
        if (currentTagOrNull == null) {
            return false;
        }
        return decodeTaggedNotNullMark(currentTagOrNull);
    }

    @Override // kotlinx.serialization.encoding.Decoder
    @Nullable
    public final Void decodeNull() {
        return null;
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    @Nullable
    public final <T> T decodeNullableSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull DeserializationStrategy<? extends T> deserializer, @Nullable T previousValue) {
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(deserializer, "deserializer");
        return (T) tagBlock(getTag(descriptor, index), new d(this, deserializer, previousValue, 1));
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final <T> T decodeSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull DeserializationStrategy<? extends T> deserializer, @Nullable T previousValue) {
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(deserializer, "deserializer");
        return (T) tagBlock(getTag(descriptor, index), new d(this, deserializer, previousValue, 0));
    }

    public <T> T decodeSerializableValue(@NotNull DeserializationStrategy<? extends T> deserializer, @Nullable T previousValue) {
        Intrinsics.g(deserializer, "deserializer");
        return (T) decodeSerializableValue(deserializer);
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final short decodeShort() {
        return decodeTaggedShort(popTag());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final short decodeShortElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedShort(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    @NotNull
    public final String decodeString() {
        return decodeTaggedString(popTag());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    @NotNull
    public final String decodeStringElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedString(getTag(descriptor, index));
    }

    public boolean decodeTaggedBoolean(Tag tag) {
        Object objDecodeTaggedValue = decodeTaggedValue(tag);
        Intrinsics.e(objDecodeTaggedValue, "null cannot be cast to non-null type kotlin.Boolean");
        return ((Boolean) objDecodeTaggedValue).booleanValue();
    }

    public byte decodeTaggedByte(Tag tag) {
        Object objDecodeTaggedValue = decodeTaggedValue(tag);
        Intrinsics.e(objDecodeTaggedValue, "null cannot be cast to non-null type kotlin.Byte");
        return ((Byte) objDecodeTaggedValue).byteValue();
    }

    public char decodeTaggedChar(Tag tag) {
        Object objDecodeTaggedValue = decodeTaggedValue(tag);
        Intrinsics.e(objDecodeTaggedValue, "null cannot be cast to non-null type kotlin.Char");
        return ((Character) objDecodeTaggedValue).charValue();
    }

    public double decodeTaggedDouble(Tag tag) {
        Object objDecodeTaggedValue = decodeTaggedValue(tag);
        Intrinsics.e(objDecodeTaggedValue, "null cannot be cast to non-null type kotlin.Double");
        return ((Double) objDecodeTaggedValue).doubleValue();
    }

    public int decodeTaggedEnum(Tag tag, @NotNull SerialDescriptor enumDescriptor) {
        Intrinsics.g(enumDescriptor, "enumDescriptor");
        Object objDecodeTaggedValue = decodeTaggedValue(tag);
        Intrinsics.e(objDecodeTaggedValue, "null cannot be cast to non-null type kotlin.Int");
        return ((Integer) objDecodeTaggedValue).intValue();
    }

    public float decodeTaggedFloat(Tag tag) {
        Object objDecodeTaggedValue = decodeTaggedValue(tag);
        Intrinsics.e(objDecodeTaggedValue, "null cannot be cast to non-null type kotlin.Float");
        return ((Float) objDecodeTaggedValue).floatValue();
    }

    @NotNull
    public Decoder decodeTaggedInline(Tag tag, @NotNull SerialDescriptor inlineDescriptor) {
        Intrinsics.g(inlineDescriptor, "inlineDescriptor");
        pushTag(tag);
        return this;
    }

    public int decodeTaggedInt(Tag tag) {
        Object objDecodeTaggedValue = decodeTaggedValue(tag);
        Intrinsics.e(objDecodeTaggedValue, "null cannot be cast to non-null type kotlin.Int");
        return ((Integer) objDecodeTaggedValue).intValue();
    }

    public long decodeTaggedLong(Tag tag) {
        Object objDecodeTaggedValue = decodeTaggedValue(tag);
        Intrinsics.e(objDecodeTaggedValue, "null cannot be cast to non-null type kotlin.Long");
        return ((Long) objDecodeTaggedValue).longValue();
    }

    public boolean decodeTaggedNotNullMark(Tag tag) {
        return true;
    }

    @Nullable
    public Void decodeTaggedNull(Tag tag) {
        return null;
    }

    public short decodeTaggedShort(Tag tag) {
        Object objDecodeTaggedValue = decodeTaggedValue(tag);
        Intrinsics.e(objDecodeTaggedValue, "null cannot be cast to non-null type kotlin.Short");
        return ((Short) objDecodeTaggedValue).shortValue();
    }

    @NotNull
    public String decodeTaggedString(Tag tag) {
        Object objDecodeTaggedValue = decodeTaggedValue(tag);
        Intrinsics.e(objDecodeTaggedValue, "null cannot be cast to non-null type kotlin.String");
        return (String) objDecodeTaggedValue;
    }

    @NotNull
    public Object decodeTaggedValue(Tag tag) {
        throw new SerializationException(Reflection.f71864a.getOrCreateKotlinClass(getClass()) + " can't retrieve untyped values");
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public void endStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
    }

    public final Tag getCurrentTag() {
        return (Tag) g.h1(this.tagStack);
    }

    @Nullable
    public final Tag getCurrentTagOrNull() {
        return (Tag) g.i1(this.tagStack);
    }

    @Override // kotlinx.serialization.encoding.Decoder, kotlinx.serialization.encoding.CompositeDecoder
    @NotNull
    public SerializersModule getSerializersModule() {
        return SerializersModuleBuildersKt.EmptySerializersModule();
    }

    public abstract Tag getTag(@NotNull SerialDescriptor serialDescriptor, int i5);

    @NotNull
    public final ArrayList<Tag> getTagStack$kotlinx_serialization_core() {
        return this.tagStack;
    }

    public final Tag popTag() {
        ArrayList<Tag> arrayList = this.tagStack;
        Tag tagRemove = arrayList.remove(ul.b.K(arrayList));
        this.flag = true;
        return tagRemove;
    }

    public final void pushTag(Tag name) {
        this.tagStack.add(name);
    }
}
