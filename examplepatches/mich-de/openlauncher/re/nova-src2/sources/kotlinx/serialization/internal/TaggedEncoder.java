package kotlinx.serialization.internal;

import b70.g;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.InternalSerializationApi;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.modules.SerializersModule;
import kotlinx.serialization.modules.SerializersModuleBuildersKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0088\u0001\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\t\n\u0002\u0010\u0005\n\u0002\b\u0002\n\u0002\u0010\n\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0010\u0006\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\f\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b(\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\t\b'\u0018\u0000*\n\b\u0000\u0010\u0001*\u0004\u0018\u00010\u00022\u00020\u00032\u00020\u0004B\u0007¢\u0006\u0004\b\u0005\u0010\u0006J\u0019\u0010\u0007\u001a\u00028\u0000*\u00020\b2\u0006\u0010\t\u001a\u00020\nH$¢\u0006\u0002\u0010\u000bJ\u001d\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00028\u00002\u0006\u0010\u0013\u001a\u00020\u0002H\u0014¢\u0006\u0002\u0010\u0014J\u0015\u0010\u0015\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00028\u0000H\u0014¢\u0006\u0002\u0010\u0016J\u0015\u0010\u0017\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00028\u0000H\u0014¢\u0006\u0002\u0010\u0016J\u001d\u0010\u0018\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00028\u00002\u0006\u0010\u0013\u001a\u00020\nH\u0014¢\u0006\u0002\u0010\u0019J\u001d\u0010\u001a\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00028\u00002\u0006\u0010\u0013\u001a\u00020\u001bH\u0014¢\u0006\u0002\u0010\u001cJ\u001d\u0010\u001d\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00028\u00002\u0006\u0010\u0013\u001a\u00020\u001eH\u0014¢\u0006\u0002\u0010\u001fJ\u001d\u0010 \u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00028\u00002\u0006\u0010\u0013\u001a\u00020!H\u0014¢\u0006\u0002\u0010\"J\u001d\u0010#\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00028\u00002\u0006\u0010\u0013\u001a\u00020$H\u0014¢\u0006\u0002\u0010%J\u001d\u0010&\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00028\u00002\u0006\u0010\u0013\u001a\u00020'H\u0014¢\u0006\u0002\u0010(J\u001d\u0010)\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00028\u00002\u0006\u0010\u0013\u001a\u00020*H\u0014¢\u0006\u0002\u0010+J\u001d\u0010,\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00028\u00002\u0006\u0010\u0013\u001a\u00020-H\u0014¢\u0006\u0002\u0010.J\u001d\u0010/\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00028\u00002\u0006\u0010\u0013\u001a\u000200H\u0014¢\u0006\u0002\u00101J%\u00102\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00028\u00002\u0006\u00103\u001a\u00020\b2\u0006\u00104\u001a\u00020\nH\u0014¢\u0006\u0002\u00105J\u001d\u00106\u001a\u00020\u00032\u0006\u0010\u0012\u001a\u00028\u00002\u0006\u00107\u001a\u00020\bH\u0014¢\u0006\u0002\u00108J\u0010\u00109\u001a\u00020\u00032\u0006\u0010:\u001a\u00020\bH\u0016J\u0018\u0010;\u001a\u00020*2\u0006\u0010<\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nH\u0002J\b\u0010=\u001a\u00020\u0011H\u0016J\b\u0010>\u001a\u00020\u0011H\u0016J\u000e\u0010?\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020*J\u000e\u0010@\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\u001bJ\u000e\u0010A\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\u001eJ\u000e\u0010B\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\nJ\u000e\u0010C\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020!J\u000e\u0010D\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020$J\u000e\u0010E\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020'J\u000e\u0010F\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020-J\u000e\u0010G\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u000200J\u0016\u0010H\u001a\u00020\u00112\u0006\u00103\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nJ\u0010\u0010I\u001a\u00020\u00042\u0006\u0010:\u001a\u00020\bH\u0016J\u000e\u0010J\u001a\u00020\u00112\u0006\u0010:\u001a\u00020\bJ\u0010\u0010K\u001a\u00020\u00112\u0006\u0010:\u001a\u00020\bH\u0014J\u001e\u0010L\u001a\u00020\u00112\u0006\u0010:\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0013\u001a\u00020*J\u001e\u0010M\u001a\u00020\u00112\u0006\u0010:\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0013\u001a\u00020\u001bJ\u001e\u0010N\u001a\u00020\u00112\u0006\u0010:\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0013\u001a\u00020\u001eJ\u001e\u0010O\u001a\u00020\u00112\u0006\u0010:\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0013\u001a\u00020\nJ\u001e\u0010P\u001a\u00020\u00112\u0006\u0010:\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0013\u001a\u00020!J\u001e\u0010Q\u001a\u00020\u00112\u0006\u0010:\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0013\u001a\u00020$J\u001e\u0010R\u001a\u00020\u00112\u0006\u0010:\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0013\u001a\u00020'J\u001e\u0010S\u001a\u00020\u00112\u0006\u0010:\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0013\u001a\u00020-J\u001e\u0010T\u001a\u00020\u00112\u0006\u0010:\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0013\u001a\u000200J\u0016\u0010U\u001a\u00020\u00032\u0006\u0010:\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nJ?\u0010V\u001a\u00020\u0011\"\n\b\u0001\u0010W*\u0004\u0018\u00010\u00022\u0006\u0010:\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\f\u0010X\u001a\b\u0012\u0004\u0012\u0002HW0Y2\u0006\u0010\u0013\u001a\u0002HWH\u0016¢\u0006\u0002\u0010ZJ?\u0010[\u001a\u00020\u0011\"\b\b\u0001\u0010W*\u00020\u00022\u0006\u0010:\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\f\u0010X\u001a\b\u0012\u0004\u0012\u0002HW0Y2\b\u0010\u0013\u001a\u0004\u0018\u0001HWH\u0016¢\u0006\u0002\u0010ZJ\u0015\u0010d\u001a\u00020\u00112\u0006\u0010e\u001a\u00028\u0000H\u0004¢\u0006\u0002\u0010\u0016J\r\u0010f\u001a\u00028\u0000H\u0004¢\u0006\u0002\u0010aR\u0014\u0010\f\u001a\u00020\r8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u000e\u0010\u000fR\u001e\u0010\\\u001a\u0012\u0012\u0004\u0012\u00028\u00000]j\b\u0012\u0004\u0012\u00028\u0000`^X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010_\u001a\u00028\u00008DX\u0084\u0004¢\u0006\u0006\u001a\u0004\b`\u0010aR\u0016\u0010b\u001a\u0004\u0018\u00018\u00008DX\u0084\u0004¢\u0006\u0006\u001a\u0004\bc\u0010a¨\u0006g"}, d2 = {"Lkotlinx/serialization/internal/TaggedEncoder;", "Tag", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlinx/serialization/encoding/Encoder;", "Lkotlinx/serialization/encoding/CompositeEncoder;", "<init>", "()V", "getTag", "Lkotlinx/serialization/descriptors/SerialDescriptor;", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/Object;", "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "getSerializersModule", "()Lkotlinx/serialization/modules/SerializersModule;", "encodeTaggedValue", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "tag", "value", "(Ljava/lang/Object;Ljava/lang/Object;)V", "encodeTaggedNonNullMark", "(Ljava/lang/Object;)V", "encodeTaggedNull", "encodeTaggedInt", "(Ljava/lang/Object;I)V", "encodeTaggedByte", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;B)V", "encodeTaggedShort", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;S)V", "encodeTaggedLong", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;J)V", "encodeTaggedFloat", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;F)V", "encodeTaggedDouble", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;D)V", "encodeTaggedBoolean", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;Z)V", "encodeTaggedChar", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;C)V", "encodeTaggedString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;Ljava/lang/String;)V", "encodeTaggedEnum", "enumDescriptor", "ordinal", "(Ljava/lang/Object;Lkotlinx/serialization/descriptors/SerialDescriptor;I)V", "encodeTaggedInline", "inlineDescriptor", "(Ljava/lang/Object;Lkotlinx/serialization/descriptors/SerialDescriptor;)Lkotlinx/serialization/encoding/Encoder;", "encodeInline", "descriptor", "encodeElement", "desc", "encodeNotNullMark", "encodeNull", "encodeBoolean", "encodeByte", "encodeShort", "encodeInt", "encodeLong", "encodeFloat", "encodeDouble", "encodeChar", "encodeString", "encodeEnum", "beginStructure", "endStructure", "endEncode", "encodeBooleanElement", "encodeByteElement", "encodeShortElement", "encodeIntElement", "encodeLongElement", "encodeFloatElement", "encodeDoubleElement", "encodeCharElement", "encodeStringElement", "encodeInlineElement", "encodeSerializableElement", "T", "serializer", "Lkotlinx/serialization/SerializationStrategy;", "(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V", "encodeNullableSerializableElement", "tagStack", "Ljava/util/ArrayList;", "Lkotlin/collections/ArrayList;", "currentTag", "getCurrentTag", "()Ljava/lang/Object;", "currentTagOrNull", "getCurrentTagOrNull", "pushTag", PendingUpgradeStore.KEY_NAME, "popTag", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@InternalSerializationApi
@SourceDebugExtension
/* loaded from: classes5.dex */
public abstract class TaggedEncoder<Tag> implements Encoder, CompositeEncoder {

    @NotNull
    private final ArrayList<Tag> tagStack = new ArrayList<>();

    private final boolean encodeElement(SerialDescriptor desc, int index) {
        pushTag(getTag(desc, index));
        return true;
    }

    @Override // kotlinx.serialization.encoding.Encoder
    @NotNull
    public CompositeEncoder beginStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        return this;
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeBoolean(boolean value) {
        encodeTaggedBoolean(popTag(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeBooleanElement(@NotNull SerialDescriptor descriptor, int index, boolean value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedBoolean(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeByte(byte value) {
        encodeTaggedByte(popTag(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeByteElement(@NotNull SerialDescriptor descriptor, int index, byte value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedByte(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeChar(char value) {
        encodeTaggedChar(popTag(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeCharElement(@NotNull SerialDescriptor descriptor, int index, char value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedChar(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeDouble(double value) {
        encodeTaggedDouble(popTag(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeDoubleElement(@NotNull SerialDescriptor descriptor, int index, double value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedDouble(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeEnum(@NotNull SerialDescriptor enumDescriptor, int index) {
        Intrinsics.g(enumDescriptor, "enumDescriptor");
        encodeTaggedEnum(popTag(), enumDescriptor, index);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeFloat(float value) {
        encodeTaggedFloat(popTag(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeFloatElement(@NotNull SerialDescriptor descriptor, int index, float value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedFloat(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    @NotNull
    public Encoder encodeInline(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        return encodeTaggedInline(popTag(), descriptor);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    @NotNull
    public final Encoder encodeInlineElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return encodeTaggedInline(getTag(descriptor, index), descriptor.getElementDescriptor(index));
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeInt(int value) {
        encodeTaggedInt(popTag(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeIntElement(@NotNull SerialDescriptor descriptor, int index, int value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedInt(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeLong(long value) {
        encodeTaggedLong(popTag(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeLongElement(@NotNull SerialDescriptor descriptor, int index, long value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedLong(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public void encodeNotNullMark() {
        encodeTaggedNonNullMark(getCurrentTag());
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public void encodeNull() {
        encodeTaggedNull(popTag());
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public <T> void encodeNullableSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull SerializationStrategy<? super T> serializer, @Nullable T value) {
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(serializer, "serializer");
        if (encodeElement(descriptor, index)) {
            encodeNullableSerializableValue(serializer, value);
        }
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public <T> void encodeSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull SerializationStrategy<? super T> serializer, T value) {
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(serializer, "serializer");
        if (encodeElement(descriptor, index)) {
            encodeSerializableValue(serializer, value);
        }
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeShort(short value) {
        encodeTaggedShort(popTag(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeShortElement(@NotNull SerialDescriptor descriptor, int index, short value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedShort(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeString(@NotNull String value) {
        Intrinsics.g(value, "value");
        encodeTaggedString(popTag(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeStringElement(@NotNull SerialDescriptor descriptor, int index, @NotNull String value) {
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(value, "value");
        encodeTaggedString(getTag(descriptor, index), value);
    }

    public void encodeTaggedBoolean(Tag tag, boolean value) {
        encodeTaggedValue(tag, Boolean.valueOf(value));
    }

    public void encodeTaggedByte(Tag tag, byte value) {
        encodeTaggedValue(tag, Byte.valueOf(value));
    }

    public void encodeTaggedChar(Tag tag, char value) {
        encodeTaggedValue(tag, Character.valueOf(value));
    }

    public void encodeTaggedDouble(Tag tag, double value) {
        encodeTaggedValue(tag, Double.valueOf(value));
    }

    public void encodeTaggedEnum(Tag tag, @NotNull SerialDescriptor enumDescriptor, int ordinal) {
        Intrinsics.g(enumDescriptor, "enumDescriptor");
        encodeTaggedValue(tag, Integer.valueOf(ordinal));
    }

    public void encodeTaggedFloat(Tag tag, float value) {
        encodeTaggedValue(tag, Float.valueOf(value));
    }

    @NotNull
    public Encoder encodeTaggedInline(Tag tag, @NotNull SerialDescriptor inlineDescriptor) {
        Intrinsics.g(inlineDescriptor, "inlineDescriptor");
        pushTag(tag);
        return this;
    }

    public void encodeTaggedInt(Tag tag, int value) {
        encodeTaggedValue(tag, Integer.valueOf(value));
    }

    public void encodeTaggedLong(Tag tag, long value) {
        encodeTaggedValue(tag, Long.valueOf(value));
    }

    public void encodeTaggedNonNullMark(Tag tag) {
    }

    public void encodeTaggedNull(Tag tag) {
        throw new SerializationException("null is not supported");
    }

    public void encodeTaggedShort(Tag tag, short value) {
        encodeTaggedValue(tag, Short.valueOf(value));
    }

    public void encodeTaggedString(Tag tag, @NotNull String value) {
        Intrinsics.g(value, "value");
        encodeTaggedValue(tag, value);
    }

    public void encodeTaggedValue(Tag tag, @NotNull Object value) {
        Intrinsics.g(value, "value");
        StringBuilder sb2 = new StringBuilder("Non-serializable ");
        Class<?> cls = value.getClass();
        ReflectionFactory reflectionFactory = Reflection.f71864a;
        sb2.append(reflectionFactory.getOrCreateKotlinClass(cls));
        sb2.append(" is not supported by ");
        sb2.append(reflectionFactory.getOrCreateKotlinClass(getClass()));
        sb2.append(" encoder");
        throw new SerializationException(sb2.toString());
    }

    public void endEncode(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void endStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        if (!this.tagStack.isEmpty()) {
            popTag();
        }
        endEncode(descriptor);
    }

    public final Tag getCurrentTag() {
        return (Tag) g.h1(this.tagStack);
    }

    @Nullable
    public final Tag getCurrentTagOrNull() {
        return (Tag) g.i1(this.tagStack);
    }

    @Override // kotlinx.serialization.encoding.Encoder, kotlinx.serialization.encoding.CompositeEncoder
    @NotNull
    public SerializersModule getSerializersModule() {
        return SerializersModuleBuildersKt.EmptySerializersModule();
    }

    public abstract Tag getTag(@NotNull SerialDescriptor serialDescriptor, int i5);

    public final Tag popTag() {
        if (this.tagStack.isEmpty()) {
            throw new SerializationException("No tag in stack for requested element");
        }
        ArrayList<Tag> arrayList = this.tagStack;
        return arrayList.remove(ul.b.K(arrayList));
    }

    public final void pushTag(Tag name) {
        this.tagStack.add(name);
    }
}
