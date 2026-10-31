package kotlinx.serialization.descriptors;

import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.ExperimentalSerializationApi;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010 \n\u0002\u0010\u001b\n\u0002\b\u0006\n\u0002\u0010!\n\u0002\b\u0002\n\u0002\u0010#\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0002\b\u0004\u0018\u00002\u00020\u0001B\u0011\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J0\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020\u00032\u0006\u0010&\u001a\u00020\u001d2\u000e\b\u0002\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00110\u00102\b\b\u0002\u0010'\u001a\u00020\tR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R$\u0010\b\u001a\u00020\t8\u0006@\u0006X\u0087\u000e¢\u0006\u0014\n\u0000\u0012\u0004\b\n\u0010\u000b\u001a\u0004\b\b\u0010\f\"\u0004\b\r\u0010\u000eR*\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00110\u00108\u0006@\u0006X\u0087\u000e¢\u0006\u0014\n\u0000\u0012\u0004\b\u0012\u0010\u000b\u001a\u0004\b\u0013\u0010\u0014\"\u0004\b\u0015\u0010\u0016R\u001a\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00030\u0018X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0014R\u0014\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00030\u001bX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u001d0\u0018X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u0014R \u0010\u001f\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00110\u00100\u0018X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b \u0010\u0014R\u001a\u0010!\u001a\b\u0012\u0004\u0012\u00020\t0\u0018X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010\u0014¨\u0006("}, d2 = {"Lkotlinx/serialization/descriptors/ClassSerialDescriptorBuilder;", b.f42142b, "serialName", b.f42142b, "<init>", "(Ljava/lang/String;)V", "getSerialName", "()Ljava/lang/String;", "isNullable", b.f42142b, "isNullable$annotations", "()V", "()Z", "setNullable", "(Z)V", "annotations", b.f42142b, b.f42142b, "getAnnotations$annotations", "getAnnotations", "()Ljava/util/List;", "setAnnotations", "(Ljava/util/List;)V", "elementNames", b.f42142b, "getElementNames$kotlinx_serialization_core", "uniqueNames", b.f42142b, "elementDescriptors", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "getElementDescriptors$kotlinx_serialization_core", "elementAnnotations", "getElementAnnotations$kotlinx_serialization_core", "elementOptionality", "getElementOptionality$kotlinx_serialization_core", "element", b.f42142b, "elementName", "descriptor", "isOptional", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class ClassSerialDescriptorBuilder {

    @NotNull
    private List<? extends Annotation> annotations;

    @NotNull
    private final List<List<Annotation>> elementAnnotations;

    @NotNull
    private final List<SerialDescriptor> elementDescriptors;

    @NotNull
    private final List<String> elementNames;

    @NotNull
    private final List<Boolean> elementOptionality;
    private boolean isNullable;

    @NotNull
    private final String serialName;

    @NotNull
    private final Set<String> uniqueNames;

    public ClassSerialDescriptorBuilder(@NotNull String serialName) {
        Intrinsics.g(serialName, "serialName");
        this.serialName = serialName;
        this.annotations = EmptyList.f71733a;
        this.elementNames = new ArrayList();
        this.uniqueNames = new HashSet();
        this.elementDescriptors = new ArrayList();
        this.elementAnnotations = new ArrayList();
        this.elementOptionality = new ArrayList();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static void element$default(ClassSerialDescriptorBuilder classSerialDescriptorBuilder, String str, SerialDescriptor serialDescriptor, List list, boolean z11, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            list = EmptyList.f71733a;
        }
        if ((i5 & 8) != 0) {
            z11 = false;
        }
        classSerialDescriptorBuilder.element(str, serialDescriptor, list, z11);
    }

    @ExperimentalSerializationApi
    public static /* synthetic */ void getAnnotations$annotations() {
    }

    @Deprecated
    @ExperimentalSerializationApi
    public static /* synthetic */ void isNullable$annotations() {
    }

    public final void element(@NotNull String elementName, @NotNull SerialDescriptor descriptor, @NotNull List<? extends Annotation> annotations, boolean isOptional) {
        Intrinsics.g(elementName, "elementName");
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(annotations, "annotations");
        if (!this.uniqueNames.add(elementName)) {
            StringBuilder sbK = u4.k("Element with name '", elementName, "' is already registered in ");
            sbK.append(this.serialName);
            throw new IllegalArgumentException(sbK.toString().toString());
        }
        this.elementNames.add(elementName);
        this.elementDescriptors.add(descriptor);
        this.elementAnnotations.add(annotations);
        this.elementOptionality.add(Boolean.valueOf(isOptional));
    }

    @NotNull
    public final List<Annotation> getAnnotations() {
        return this.annotations;
    }

    @NotNull
    public final List<List<Annotation>> getElementAnnotations$kotlinx_serialization_core() {
        return this.elementAnnotations;
    }

    @NotNull
    public final List<SerialDescriptor> getElementDescriptors$kotlinx_serialization_core() {
        return this.elementDescriptors;
    }

    @NotNull
    public final List<String> getElementNames$kotlinx_serialization_core() {
        return this.elementNames;
    }

    @NotNull
    public final List<Boolean> getElementOptionality$kotlinx_serialization_core() {
        return this.elementOptionality;
    }

    @NotNull
    public final String getSerialName() {
        return this.serialName;
    }

    /* renamed from: isNullable, reason: from getter */
    public final boolean getIsNullable() {
        return this.isNullable;
    }

    public final void setAnnotations(@NotNull List<? extends Annotation> list) {
        Intrinsics.g(list, "<set-?>");
        this.annotations = list;
    }

    public final void setNullable(boolean z11) {
        this.isNullable = z11;
    }
}
