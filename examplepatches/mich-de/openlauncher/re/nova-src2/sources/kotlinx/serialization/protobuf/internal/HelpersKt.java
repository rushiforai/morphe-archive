package kotlinx.serialization.protobuf.internal;

import b70.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import java.lang.annotation.Annotation;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.descriptors.ContextAwareKt;
import kotlinx.serialization.descriptors.PolymorphicKind;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialDescriptorKt;
import kotlinx.serialization.descriptors.SerialKind;
import kotlinx.serialization.modules.SerializersModule;
import kotlinx.serialization.protobuf.ProtoIntegerType;
import kotlinx.serialization.protobuf.ProtoNumber;
import kotlinx.serialization.protobuf.ProtoOneOf;
import kotlinx.serialization.protobuf.ProtoPacked;
import kotlinx.serialization.protobuf.ProtoType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000D\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a1\u0010\u0000\u001a\u00060\u0001j\u0002`\u00072\u0006\u0010\b\u001a\u00020\u00032\u0006\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\fH\u0080\b\u001a\u001c\u0010\u0019\u001a\u00060\u0001j\u0002`\u0007*\u00060\u0001j\u0002`\u00072\u0006\u0010\b\u001a\u00020\u0003H\u0000\u001a\u0018\u0010\u001a\u001a\u00060\u0001j\u0002`\u0007*\u00020\u00142\u0006\u0010\u001b\u001a\u00020\u0003H\u0000\u001a \u0010\u001c\u001a\u00020\u00032\u0006\u0010\u001d\u001a\u00020\u00142\u0006\u0010\u001b\u001a\u00020\u00032\u0006\u0010\u001e\u001a\u00020\fH\u0000\u001a \u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\u00032\u0006\u0010\"\u001a\u00020\u00032\u0006\u0010\u001d\u001a\u00020\u0014H\u0002\u001a\u001a\u0010#\u001a\b\u0012\u0004\u0012\u00020\u00140$*\u00020\u00142\u0006\u0010%\u001a\u00020&H\u0000\u001a\u001e\u0010'\u001a\u0004\u0018\u00010\u0014*\u00020\u00142\u0006\u0010%\u001a\u00020&2\u0006\u0010\b\u001a\u00020\u0003H\u0000\"\u000e\u0010\u0002\u001a\u00020\u0003X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0004\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0005\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0006\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u001d\u0010\b\u001a\u00020\u0003*\u00060\u0001j\u0002`\u00078À\u0002X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u000e\u0010\u000f\"\u001c\u0010\u0010\u001a\u00020\n*\u00060\u0001j\u0002`\u00078@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0011\u0010\u0012\"\u0018\u0010\u0013\u001a\u00020\f*\u00020\u00148@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0013\u0010\u0015\"\u001c\u0010\u0016\u001a\u00020\f*\u00060\u0001j\u0002`\u00078@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0016\u0010\u0017\"\u001c\u0010\u0018\u001a\u00020\f*\u00060\u0001j\u0002`\u00078@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u0017*\f\b\u0000\u0010\u0000\"\u00020\u00012\u00020\u0001¨\u0006("}, d2 = {"ProtoDesc", b.f42142b, "ID_HOLDER_ONE_OF", b.f42142b, "ONEOFMASK", "INTTYPEMASK", "PACKEDMASK", "Lkotlinx/serialization/protobuf/internal/ProtoDesc;", "protoId", TTConst.TRACK_TYPE, "Lkotlinx/serialization/protobuf/ProtoIntegerType;", "packed", b.f42142b, "oneOf", "getProtoId", "(J)I", "integerType", "getIntegerType", "(J)Lkotlinx/serialization/protobuf/ProtoIntegerType;", "isPackable", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "(Lkotlinx/serialization/descriptors/SerialDescriptor;)Z", "isPacked", "(J)Z", "isOneOf", "overrideId", "extractParameters", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "extractProtoId", "descriptor", "zeroBasedDefault", "checkFieldNumber", b.f42142b, "fieldNumber", "propertyIndex", "getAllOneOfSerializerOfField", b.f42142b, "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "getActualOneOfSerializer", "kotlinx-serialization-protobuf"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class HelpersKt {
    public static final int ID_HOLDER_ONE_OF = -2;
    private static final long INTTYPEMASK = 25769803776L;
    private static final long ONEOFMASK = 68719476736L;
    private static final long PACKEDMASK = 4294967296L;

    public static final long ProtoDesc(int i5, @NotNull ProtoIntegerType type, boolean z11, boolean z12) {
        Intrinsics.g(type, "type");
        return (z11 ? PACKEDMASK : 0L) | (z12 ? ONEOFMASK : 0L) | type.getSignature() | i5;
    }

    public static /* synthetic */ long ProtoDesc$default(int i5, ProtoIntegerType type, boolean z11, boolean z12, int i11, Object obj) {
        if ((i11 & 4) != 0) {
            z11 = false;
        }
        if ((i11 & 8) != 0) {
            z12 = false;
        }
        Intrinsics.g(type, "type");
        return (z11 ? PACKEDMASK : 0L) | (z12 ? ONEOFMASK : 0L) | type.getSignature() | i5;
    }

    private static final void checkFieldNumber(int i5, int i11, SerialDescriptor serialDescriptor) {
        if (i5 > 0) {
            return;
        }
        throw new SerializationException(i5 + " is not allowed in ProtoNumber for property '" + serialDescriptor.getElementName(i11) + "' of '" + serialDescriptor.getSerialName() + "', because protobuf supports field numbers in range 1..2147483647");
    }

    public static final long extractParameters(@NotNull SerialDescriptor serialDescriptor, int i5) {
        Intrinsics.g(serialDescriptor, "<this>");
        List<Annotation> elementAnnotations = serialDescriptor.getElementAnnotations(i5);
        int i11 = i5 + 1;
        ProtoIntegerType protoIntegerTypeType = ProtoIntegerType.DEFAULT;
        int size = elementAnnotations.size();
        int iNumber = i11;
        boolean z11 = false;
        boolean z12 = false;
        for (int i12 = 0; i12 < size; i12++) {
            Annotation annotation = elementAnnotations.get(i12);
            if (annotation instanceof ProtoNumber) {
                iNumber = ((ProtoNumber) annotation).number();
                checkFieldNumber(iNumber, i12, serialDescriptor);
            } else if (annotation instanceof ProtoType) {
                protoIntegerTypeType = ((ProtoType) annotation).type();
            } else if (annotation instanceof ProtoPacked) {
                z12 = true;
            } else if (annotation instanceof ProtoOneOf) {
                z11 = true;
            }
        }
        if (!z11) {
            i11 = iNumber;
        }
        return i11 | (z11 ? ONEOFMASK : 0L) | (z12 ? PACKEDMASK : 0L) | protoIntegerTypeType.getSignature();
    }

    public static final int extractProtoId(@NotNull SerialDescriptor descriptor, int i5, boolean z11) {
        Intrinsics.g(descriptor, "descriptor");
        List<Annotation> elementAnnotations = descriptor.getElementAnnotations(i5);
        if (!z11) {
            i5++;
        }
        int size = elementAnnotations.size();
        for (int i11 = 0; i11 < size; i11++) {
            Annotation annotation = elementAnnotations.get(i11);
            if (annotation instanceof ProtoOneOf) {
                return -2;
            }
            if (annotation instanceof ProtoNumber) {
                i5 = ((ProtoNumber) annotation).number();
                if (!z11) {
                    checkFieldNumber(i5, i11, descriptor);
                }
            }
        }
        return i5;
    }

    @Nullable
    public static final SerialDescriptor getActualOneOfSerializer(@NotNull SerialDescriptor serialDescriptor, @NotNull SerializersModule serializersModule, int i5) {
        Object next;
        Intrinsics.g(serialDescriptor, "<this>");
        Intrinsics.g(serializersModule, "serializersModule");
        Iterator<T> it = getAllOneOfSerializerOfField(serialDescriptor, serializersModule).iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (((int) (extractParameters((SerialDescriptor) next, 0) & 2147483647L)) == i5) {
                break;
            }
        }
        return (SerialDescriptor) next;
    }

    @NotNull
    public static final List<SerialDescriptor> getAllOneOfSerializerOfField(@NotNull SerialDescriptor serialDescriptor, @NotNull SerializersModule serializersModule) {
        List<SerialDescriptor> listI1;
        Intrinsics.g(serialDescriptor, "<this>");
        Intrinsics.g(serializersModule, "serializersModule");
        SerialKind kind = serialDescriptor.getKind();
        if (Intrinsics.b(kind, PolymorphicKind.OPEN.INSTANCE)) {
            listI1 = ContextAwareKt.getPolymorphicDescriptors(serializersModule, serialDescriptor);
        } else {
            if (!Intrinsics.b(kind, PolymorphicKind.SEALED.INSTANCE)) {
                throw new IllegalArgumentException("Class " + serialDescriptor.getSerialName() + " should be abstract or sealed or interface to be used as @ProtoOneOf property.");
            }
            listI1 = g.I1(SerialDescriptorKt.getElementDescriptors(serialDescriptor.getElementDescriptor(1)));
        }
        List<SerialDescriptor> list = listI1;
        for (SerialDescriptor serialDescriptor2 : list) {
            List<Annotation> elementAnnotations = serialDescriptor2.getElementAnnotations(0);
            if (!(elementAnnotations instanceof Collection) || !elementAnnotations.isEmpty()) {
                Iterator<T> it = elementAnnotations.iterator();
                while (it.hasNext()) {
                    if (((Annotation) it.next()) instanceof ProtoNumber) {
                        break;
                    }
                }
            }
            throw new IllegalArgumentException(serialDescriptor2.getSerialName() + " implementing oneOf type " + serialDescriptor.getSerialName() + " should have @ProtoNumber annotation in its single property.");
        }
        return list;
    }

    @NotNull
    public static final ProtoIntegerType getIntegerType(long j11) {
        long j12 = j11 & INTTYPEMASK;
        ProtoIntegerType protoIntegerType = ProtoIntegerType.DEFAULT;
        if (j12 == protoIntegerType.getSignature()) {
            return protoIntegerType;
        }
        ProtoIntegerType protoIntegerType2 = ProtoIntegerType.SIGNED;
        return j12 == protoIntegerType2.getSignature() ? protoIntegerType2 : ProtoIntegerType.FIXED;
    }

    public static final int getProtoId(long j11) {
        return (int) (j11 & 2147483647L);
    }

    public static final boolean isOneOf(long j11) {
        return (j11 & ONEOFMASK) != 0;
    }

    public static final boolean isPackable(@NotNull SerialDescriptor serialDescriptor) {
        Intrinsics.g(serialDescriptor, "<this>");
        SerialKind kind = serialDescriptor.getKind();
        return !Intrinsics.b(kind, PrimitiveKind.STRING.INSTANCE) && (kind instanceof PrimitiveKind);
    }

    public static final boolean isPacked(long j11) {
        return (j11 & PACKEDMASK) != 0;
    }

    public static final long overrideId(long j11, int i5) {
        return (j11 & 1152921500311879680L) | i5;
    }
}
