package kotlinx.serialization.descriptors;

import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import iw.p;
import java.lang.annotation.Annotation;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.c;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.KType;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.InternalSerializationApi;
import kotlinx.serialization.SerializersKt;
import kotlinx.serialization.descriptors.StructureKind;
import kotlinx.serialization.internal.ArrayListClassDesc;
import kotlinx.serialization.internal.HashMapClassDesc;
import kotlinx.serialization.internal.HashSetClassDesc;
import kotlinx.serialization.internal.PrimitivesKt;
import kotlinx.serialization.internal.SerialDescriptorForNullable;
import org.jetbrains.annotations.NotNull;
import r70.k;

@Metadata(d1 = {"\u0000P\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010 \n\u0002\u0010\u001b\n\u0000\n\u0002\u0010\u000b\n\u0000\u001aB\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0012\u0010\u0004\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00010\u0005\"\u00020\u00012\u0019\b\u0002\u0010\u0006\u001a\u0013\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\t0\u0007¢\u0006\u0002\b\n¢\u0006\u0002\u0010\u000b\u001a\u0016\u0010\f\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u000e\u001a\u0016\u0010\u000f\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0010\u001a\u00020\u0001\u001aL\u0010\u0011\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u00122\u0012\u0010\u0004\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00010\u0005\"\u00020\u00012\u0019\b\u0002\u0010\u0013\u001a\u0013\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\t0\u0007¢\u0006\u0002\b\nH\u0007¢\u0006\u0002\u0010\u0014\u001a\u0011\u0010\u0015\u001a\u00020\u0001\"\u0006\b\u0000\u0010\u0016\u0018\u0001H\u0086\b\u001a\u000e\u0010\u0015\u001a\u00020\u00012\u0006\u0010\u0017\u001a\u00020\u0018\u001a\u0010\u0010\u0019\u001a\u00020\u00012\u0006\u0010\u001a\u001a\u00020\u0001H\u0007\u001a\u0011\u0010\u0019\u001a\u00020\u0001\"\u0006\b\u0000\u0010\u0016\u0018\u0001H\u0087\b\u001a\u0018\u0010\u001b\u001a\u00020\u00012\u0006\u0010\u001c\u001a\u00020\u00012\u0006\u0010\u001d\u001a\u00020\u0001H\u0007\u001a\u0019\u0010\u001b\u001a\u00020\u0001\"\u0006\b\u0000\u0010\u001e\u0018\u0001\"\u0006\b\u0001\u0010\u001f\u0018\u0001H\u0087\b\u001a\u0010\u0010 \u001a\u00020\u00012\u0006\u0010\u001a\u001a\u00020\u0001H\u0007\u001a\u0011\u0010 \u001a\u00020\u0001\"\u0006\b\u0000\u0010\u0016\u0018\u0001H\u0087\b\u001a7\u0010)\u001a\u00020\t\"\u0006\b\u0000\u0010\u0016\u0018\u0001*\u00020\b2\u0006\u0010*\u001a\u00020\u00032\u000e\b\u0002\u0010+\u001a\b\u0012\u0004\u0012\u00020-0,2\b\b\u0002\u0010.\u001a\u00020/H\u0086\b\"\u001b\u0010!\u001a\u00020\u0001*\u00020\u00018F¢\u0006\f\u0012\u0004\b\"\u0010#\u001a\u0004\b$\u0010%\"\u001e\u0010&\u001a\u00020\u0001*\u00020\u00018FX\u0087\u0004¢\u0006\f\u0012\u0004\b'\u0010#\u001a\u0004\b(\u0010%¨\u00060"}, d2 = {"buildClassSerialDescriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialName", b.f42142b, "typeParameters", b.f42142b, "builderAction", "Lkotlin/Function1;", "Lkotlinx/serialization/descriptors/ClassSerialDescriptorBuilder;", b.f42142b, "Lkotlin/ExtensionFunctionType;", "(Ljava/lang/String;[Lkotlinx/serialization/descriptors/SerialDescriptor;Lkotlin/jvm/functions/Function1;)Lkotlinx/serialization/descriptors/SerialDescriptor;", "PrimitiveSerialDescriptor", "kind", "Lkotlinx/serialization/descriptors/PrimitiveKind;", "SerialDescriptor", "original", "buildSerialDescriptor", "Lkotlinx/serialization/descriptors/SerialKind;", "builder", "(Ljava/lang/String;Lkotlinx/serialization/descriptors/SerialKind;[Lkotlinx/serialization/descriptors/SerialDescriptor;Lkotlin/jvm/functions/Function1;)Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialDescriptor", "T", TTConst.TRACK_TYPE, "Lkotlin/reflect/KType;", "listSerialDescriptor", "elementDescriptor", "mapSerialDescriptor", "keyDescriptor", "valueDescriptor", "K", "V", "setSerialDescriptor", "nullable", "getNullable$annotations", "(Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "getNullable", "(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lkotlinx/serialization/descriptors/SerialDescriptor;", "nonNullOriginal", "getNonNullOriginal$annotations", "getNonNullOriginal", "element", "elementName", "annotations", b.f42142b, b.f42142b, "isOptional", b.f42142b, "kotlinx-serialization-core"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class SerialDescriptorsKt {
    @NotNull
    public static final SerialDescriptor PrimitiveSerialDescriptor(@NotNull String serialName, @NotNull PrimitiveKind kind) {
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(kind, "kind");
        if (k.U0(serialName)) {
            throw new IllegalArgumentException("Blank serial names are prohibited");
        }
        return PrimitivesKt.PrimitiveDescriptorSafe(serialName, kind);
    }

    @NotNull
    public static final SerialDescriptor SerialDescriptor(@NotNull String serialName, @NotNull SerialDescriptor original) {
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(original, "original");
        if (k.U0(serialName)) {
            throw new IllegalArgumentException("Blank serial names are prohibited");
        }
        if (!serialName.equals(original.getSerialName())) {
            if (original.getKind() instanceof PrimitiveKind) {
                PrimitivesKt.checkNameIsNotAPrimitive(serialName);
            }
            return new WrappedSerialDescriptor(serialName, original);
        }
        StringBuilder sbK = u4.k("The name of the wrapped descriptor (", serialName, ") cannot be the same as the name of the original descriptor (");
        sbK.append(original.getSerialName());
        sbK.append(')');
        throw new IllegalArgumentException(sbK.toString().toString());
    }

    @NotNull
    public static final SerialDescriptor buildClassSerialDescriptor(@NotNull String serialName, @NotNull SerialDescriptor[] typeParameters, @NotNull Function1<? super ClassSerialDescriptorBuilder, Unit> builderAction) {
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(typeParameters, "typeParameters");
        Intrinsics.g(builderAction, "builderAction");
        if (k.U0(serialName)) {
            throw new IllegalArgumentException("Blank serial names are prohibited");
        }
        ClassSerialDescriptorBuilder classSerialDescriptorBuilder = new ClassSerialDescriptorBuilder(serialName);
        builderAction.invoke(classSerialDescriptorBuilder);
        return new SerialDescriptorImpl(serialName, StructureKind.CLASS.INSTANCE, classSerialDescriptorBuilder.getElementNames$kotlinx_serialization_core().size(), c.b1(typeParameters), classSerialDescriptorBuilder);
    }

    public static /* synthetic */ SerialDescriptor buildClassSerialDescriptor$default(String str, SerialDescriptor[] serialDescriptorArr, Function1 function1, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            function1 = new p(25);
        }
        return buildClassSerialDescriptor(str, serialDescriptorArr, function1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit buildClassSerialDescriptor$lambda$0(ClassSerialDescriptorBuilder classSerialDescriptorBuilder) {
        Intrinsics.g(classSerialDescriptorBuilder, "<this>");
        return Unit.f71706a;
    }

    @InternalSerializationApi
    @NotNull
    public static final SerialDescriptor buildSerialDescriptor(@NotNull String serialName, @NotNull SerialKind kind, @NotNull SerialDescriptor[] typeParameters, @NotNull Function1<? super ClassSerialDescriptorBuilder, Unit> builder) {
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(kind, "kind");
        Intrinsics.g(typeParameters, "typeParameters");
        Intrinsics.g(builder, "builder");
        if (k.U0(serialName)) {
            throw new IllegalArgumentException("Blank serial names are prohibited");
        }
        if (kind.equals(StructureKind.CLASS.INSTANCE)) {
            throw new IllegalArgumentException("For StructureKind.CLASS please use 'buildClassSerialDescriptor' instead");
        }
        ClassSerialDescriptorBuilder classSerialDescriptorBuilder = new ClassSerialDescriptorBuilder(serialName);
        builder.invoke(classSerialDescriptorBuilder);
        return new SerialDescriptorImpl(serialName, kind, classSerialDescriptorBuilder.getElementNames$kotlinx_serialization_core().size(), c.b1(typeParameters), classSerialDescriptorBuilder);
    }

    public static /* synthetic */ SerialDescriptor buildSerialDescriptor$default(String str, SerialKind serialKind, SerialDescriptor[] serialDescriptorArr, Function1 function1, int i5, Object obj) {
        if ((i5 & 8) != 0) {
            function1 = new p(26);
        }
        return buildSerialDescriptor(str, serialKind, serialDescriptorArr, function1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit buildSerialDescriptor$lambda$5(ClassSerialDescriptorBuilder classSerialDescriptorBuilder) {
        Intrinsics.g(classSerialDescriptorBuilder, "<this>");
        return Unit.f71706a;
    }

    public static final /* synthetic */ <T> void element(ClassSerialDescriptorBuilder classSerialDescriptorBuilder, String elementName, List<? extends Annotation> annotations, boolean z11) {
        Intrinsics.g(classSerialDescriptorBuilder, "<this>");
        Intrinsics.g(elementName, "elementName");
        Intrinsics.g(annotations, "annotations");
        Intrinsics.k();
        throw null;
    }

    public static void element$default(ClassSerialDescriptorBuilder classSerialDescriptorBuilder, String elementName, List annotations, boolean z11, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            annotations = EmptyList.f71733a;
        }
        Intrinsics.g(classSerialDescriptorBuilder, "<this>");
        Intrinsics.g(elementName, "elementName");
        Intrinsics.g(annotations, "annotations");
        Intrinsics.k();
        throw null;
    }

    @NotNull
    public static final SerialDescriptor getNonNullOriginal(@NotNull SerialDescriptor serialDescriptor) {
        Intrinsics.g(serialDescriptor, "<this>");
        return serialDescriptor instanceof SerialDescriptorForNullable ? ((SerialDescriptorForNullable) serialDescriptor).getOriginal() : serialDescriptor;
    }

    @ExperimentalSerializationApi
    public static /* synthetic */ void getNonNullOriginal$annotations(SerialDescriptor serialDescriptor) {
    }

    @NotNull
    public static final SerialDescriptor getNullable(@NotNull SerialDescriptor serialDescriptor) {
        Intrinsics.g(serialDescriptor, "<this>");
        return serialDescriptor.getIsNullable() ? serialDescriptor : new SerialDescriptorForNullable(serialDescriptor);
    }

    public static /* synthetic */ void getNullable$annotations(SerialDescriptor serialDescriptor) {
    }

    @ExperimentalSerializationApi
    @NotNull
    public static final SerialDescriptor listSerialDescriptor(@NotNull SerialDescriptor elementDescriptor) {
        Intrinsics.g(elementDescriptor, "elementDescriptor");
        return new ArrayListClassDesc(elementDescriptor);
    }

    @ExperimentalSerializationApi
    @NotNull
    public static final SerialDescriptor mapSerialDescriptor(@NotNull SerialDescriptor keyDescriptor, @NotNull SerialDescriptor valueDescriptor) {
        Intrinsics.g(keyDescriptor, "keyDescriptor");
        Intrinsics.g(valueDescriptor, "valueDescriptor");
        return new HashMapClassDesc(keyDescriptor, valueDescriptor);
    }

    public static final /* synthetic */ <T> SerialDescriptor serialDescriptor() {
        Intrinsics.k();
        throw null;
    }

    @ExperimentalSerializationApi
    @NotNull
    public static final SerialDescriptor setSerialDescriptor(@NotNull SerialDescriptor elementDescriptor) {
        Intrinsics.g(elementDescriptor, "elementDescriptor");
        return new HashSetClassDesc(elementDescriptor);
    }

    @ExperimentalSerializationApi
    public static final /* synthetic */ <T> SerialDescriptor listSerialDescriptor() {
        Intrinsics.k();
        throw null;
    }

    @ExperimentalSerializationApi
    public static final /* synthetic */ <K, V> SerialDescriptor mapSerialDescriptor() {
        Intrinsics.k();
        throw null;
    }

    @NotNull
    public static final SerialDescriptor serialDescriptor(@NotNull KType type) {
        Intrinsics.g(type, "type");
        return SerializersKt.serializer(type).getDescriptor();
    }

    @ExperimentalSerializationApi
    public static final /* synthetic */ <T> SerialDescriptor setSerialDescriptor() {
        Intrinsics.k();
        throw null;
    }
}
