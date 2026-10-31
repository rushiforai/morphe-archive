package kotlinx.serialization.internal;

import b70.h;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialKind;
import kotlinx.serialization.descriptors.StructureKind;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0010\u001b\n\u0002\b\u0004\n\u0002\u0010\u0011\n\u0002\b\u0002\n\u0002\u0010!\n\u0002\b\u0003\n\u0002\u0010\u0018\n\u0000\n\u0002\u0010\"\n\u0002\b\u0003\n\u0002\u0010$\n\u0000\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0011\u0018\u00002\u00020\u00012\u00020\u0002B'\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\u0018\u00105\u001a\u0002062\u0006\u00107\u001a\u00020\u00042\b\b\u0002\u00108\u001a\u000209J\u000e\u0010:\u001a\u0002062\u0006\u0010;\u001a\u00020\u0015J\u000e\u0010<\u001a\u0002062\u0006\u0010=\u001a\u00020\u0015J\u0010\u0010>\u001a\u00020\u00012\u0006\u0010?\u001a\u00020\bH\u0016J\u0010\u0010@\u001a\u0002092\u0006\u0010?\u001a\u00020\bH\u0016J\u0016\u0010A\u001a\b\u0012\u0004\u0012\u00020\u00150\u00142\u0006\u0010?\u001a\u00020\bH\u0016J\u0010\u0010B\u001a\u00020\u00042\u0006\u0010?\u001a\u00020\bH\u0016J\u0010\u0010C\u001a\u00020\b2\u0006\u00107\u001a\u00020\u0004H\u0016J\u0014\u0010D\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\b0'H\u0002J\u0013\u0010E\u001a\u0002092\b\u0010F\u001a\u0004\u0018\u00010GH\u0096\u0002J\b\u0010H\u001a\u00020\bH\u0016J\b\u0010I\u001a\u00020\u0004H\u0016R\u0014\u0010\u0003\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0014\u0010\u0005\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u00108VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0011\u0010\u0012R\u001a\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00150\u00148VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0016\u0010\u0017R\u000e\u0010\u0018\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00040\u001aX\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u001bR\u001e\u0010\u001c\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0015\u0018\u00010\u001d0\u001aX\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u001eR\u0016\u0010\u001f\u001a\n\u0012\u0004\u0012\u00020\u0015\u0018\u00010\u001dX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020!X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\"\u001a\b\u0012\u0004\u0012\u00020\u00040#8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b$\u0010%R\u001a\u0010&\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\b0'X\u0082\u000e¢\u0006\u0002\n\u0000R%\u0010(\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030)0\u001a8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b,\u0010-\u001a\u0004\b*\u0010+R!\u0010.\u001a\b\u0012\u0004\u0012\u00020\u00010\u001a8@X\u0080\u0084\u0002¢\u0006\f\n\u0004\b1\u0010-\u001a\u0004\b/\u00100R\u001b\u00102\u001a\u00020\b8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b4\u0010-\u001a\u0004\b3\u0010\u000e¨\u0006J"}, d2 = {"Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "Lkotlinx/serialization/internal/CachedNames;", "serialName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "generatedSerializer", "Lkotlinx/serialization/internal/GeneratedSerializer;", "elementsCount", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Lkotlinx/serialization/internal/GeneratedSerializer;I)V", "getSerialName", "()Ljava/lang/String;", "getElementsCount", "()I", "kind", "Lkotlinx/serialization/descriptors/SerialKind;", "getKind", "()Lkotlinx/serialization/descriptors/SerialKind;", "annotations", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getAnnotations", "()Ljava/util/List;", "added", "names", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "[Ljava/lang/String;", "propertiesAnnotations", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "[Ljava/util/List;", "classAnnotations", "elementsOptionality", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "serialNames", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getSerialNames", "()Ljava/util/Set;", "indices", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "childSerializers", "Lkotlinx/serialization/KSerializer;", "getChildSerializers", "()[Lkotlinx/serialization/KSerializer;", "childSerializers$delegate", "Lkotlin/Lazy;", "typeParameterDescriptors", "getTypeParameterDescriptors$kotlinx_serialization_core", "()[Lkotlinx/serialization/descriptors/SerialDescriptor;", "typeParameterDescriptors$delegate", "_hashCode", "get_hashCode", "_hashCode$delegate", "addElement", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, PendingUpgradeStore.KEY_NAME, "isOptional", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "pushAnnotation", "annotation", "pushClassAnnotation", "a", "getElementDescriptor", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "isElementOptional", "getElementAnnotations", "getElementName", "getElementIndex", "buildIndices", "equals", InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", "toString", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@PublishedApi
@SourceDebugExtension
/* loaded from: classes.dex */
public class PluginGeneratedSerialDescriptor implements SerialDescriptor, CachedNames {

    /* renamed from: _hashCode$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy _hashCode;
    private int added;

    /* renamed from: childSerializers$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy childSerializers;

    @Nullable
    private List<Annotation> classAnnotations;
    private final int elementsCount;

    @NotNull
    private final boolean[] elementsOptionality;

    @Nullable
    private final GeneratedSerializer<?> generatedSerializer;

    @NotNull
    private Map<String, Integer> indices;

    @NotNull
    private final String[] names;

    @NotNull
    private final List<Annotation>[] propertiesAnnotations;

    @NotNull
    private final String serialName;

    /* renamed from: typeParameterDescriptors$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy typeParameterDescriptors;

    public PluginGeneratedSerialDescriptor(@NotNull String serialName, @Nullable GeneratedSerializer<?> generatedSerializer, int i5) {
        Intrinsics.g(serialName, "serialName");
        this.serialName = serialName;
        this.generatedSerializer = generatedSerializer;
        this.elementsCount = i5;
        this.added = -1;
        String[] strArr = new String[i5];
        for (int i11 = 0; i11 < i5; i11++) {
            strArr[i11] = "[UNINITIALIZED]";
        }
        this.names = strArr;
        int i12 = this.elementsCount;
        this.propertiesAnnotations = new List[i12];
        this.elementsOptionality = new boolean[i12];
        this.indices = h.f17594a;
        LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71680b;
        final int i13 = 0;
        this.childSerializers = LazyKt.b(lazyThreadSafetyMode, new Function0(this) { // from class: kotlinx.serialization.internal.c

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ PluginGeneratedSerialDescriptor f72071b;

            {
                this.f72071b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i13) {
                    case 0:
                        return PluginGeneratedSerialDescriptor.childSerializers_delegate$lambda$0(this.f72071b);
                    case 1:
                        return PluginGeneratedSerialDescriptor.typeParameterDescriptors_delegate$lambda$2(this.f72071b);
                    default:
                        return Integer.valueOf(PluginGeneratedSerialDescriptor._hashCode_delegate$lambda$3(this.f72071b));
                }
            }
        });
        final int i14 = 1;
        this.typeParameterDescriptors = LazyKt.b(lazyThreadSafetyMode, new Function0(this) { // from class: kotlinx.serialization.internal.c

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ PluginGeneratedSerialDescriptor f72071b;

            {
                this.f72071b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i14) {
                    case 0:
                        return PluginGeneratedSerialDescriptor.childSerializers_delegate$lambda$0(this.f72071b);
                    case 1:
                        return PluginGeneratedSerialDescriptor.typeParameterDescriptors_delegate$lambda$2(this.f72071b);
                    default:
                        return Integer.valueOf(PluginGeneratedSerialDescriptor._hashCode_delegate$lambda$3(this.f72071b));
                }
            }
        });
        final int i15 = 2;
        this._hashCode = LazyKt.b(lazyThreadSafetyMode, new Function0(this) { // from class: kotlinx.serialization.internal.c

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ PluginGeneratedSerialDescriptor f72071b;

            {
                this.f72071b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i15) {
                    case 0:
                        return PluginGeneratedSerialDescriptor.childSerializers_delegate$lambda$0(this.f72071b);
                    case 1:
                        return PluginGeneratedSerialDescriptor.typeParameterDescriptors_delegate$lambda$2(this.f72071b);
                    default:
                        return Integer.valueOf(PluginGeneratedSerialDescriptor._hashCode_delegate$lambda$3(this.f72071b));
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int _hashCode_delegate$lambda$3(PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor) {
        return PluginGeneratedSerialDescriptorKt.hashCodeImpl(pluginGeneratedSerialDescriptor, pluginGeneratedSerialDescriptor.getTypeParameterDescriptors$kotlinx_serialization_core());
    }

    public static /* synthetic */ void addElement$default(PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor, String str, boolean z11, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: addElement");
        }
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        pluginGeneratedSerialDescriptor.addElement(str, z11);
    }

    private final Map<String, Integer> buildIndices() {
        HashMap map = new HashMap();
        int length = this.names.length;
        for (int i5 = 0; i5 < length; i5++) {
            map.put(this.names[i5], Integer.valueOf(i5));
        }
        return map;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final KSerializer[] childSerializers_delegate$lambda$0(PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor) {
        KSerializer<?>[] kSerializerArrChildSerializers;
        GeneratedSerializer<?> generatedSerializer = pluginGeneratedSerialDescriptor.generatedSerializer;
        return (generatedSerializer == null || (kSerializerArrChildSerializers = generatedSerializer.childSerializers()) == null) ? PluginHelperInterfacesKt.EMPTY_SERIALIZER_ARRAY : kSerializerArrChildSerializers;
    }

    private final KSerializer<?>[] getChildSerializers() {
        return (KSerializer[]) this.childSerializers.getValue();
    }

    private final int get_hashCode() {
        return ((Number) this._hashCode.getValue()).intValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final SerialDescriptor[] typeParameterDescriptors_delegate$lambda$2(PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor) {
        ArrayList arrayList;
        KSerializer<?>[] kSerializerArrTypeParametersSerializers;
        GeneratedSerializer<?> generatedSerializer = pluginGeneratedSerialDescriptor.generatedSerializer;
        if (generatedSerializer == null || (kSerializerArrTypeParametersSerializers = generatedSerializer.typeParametersSerializers()) == null) {
            arrayList = null;
        } else {
            arrayList = new ArrayList(kSerializerArrTypeParametersSerializers.length);
            for (KSerializer<?> kSerializer : kSerializerArrTypeParametersSerializers) {
                arrayList.add(kSerializer.getDescriptor());
            }
        }
        return Platform_commonKt.compactArray(arrayList);
    }

    public final void addElement(@NotNull String name, boolean isOptional) {
        Intrinsics.g(name, "name");
        String[] strArr = this.names;
        int i5 = this.added + 1;
        this.added = i5;
        strArr[i5] = name;
        this.elementsOptionality[i5] = isOptional;
        this.propertiesAnnotations[i5] = null;
        if (i5 == this.elementsCount - 1) {
            this.indices = buildIndices();
        }
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PluginGeneratedSerialDescriptor)) {
            return false;
        }
        SerialDescriptor serialDescriptor = (SerialDescriptor) other;
        if (!Intrinsics.b(getSerialName(), serialDescriptor.getSerialName()) || !Arrays.equals(getTypeParameterDescriptors$kotlinx_serialization_core(), ((PluginGeneratedSerialDescriptor) other).getTypeParameterDescriptors$kotlinx_serialization_core()) || getElementsCount() != serialDescriptor.getElementsCount()) {
            return false;
        }
        int elementsCount = getElementsCount();
        for (int i5 = 0; i5 < elementsCount; i5++) {
            if (!Intrinsics.b(getElementDescriptor(i5).getSerialName(), serialDescriptor.getElementDescriptor(i5).getSerialName()) || !Intrinsics.b(getElementDescriptor(i5).getKind(), serialDescriptor.getElementDescriptor(i5).getKind())) {
                return false;
            }
        }
        return true;
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    @NotNull
    public List<Annotation> getAnnotations() {
        List<Annotation> list = this.classAnnotations;
        return list == null ? EmptyList.f71733a : list;
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    @NotNull
    public List<Annotation> getElementAnnotations(int index) {
        List<Annotation> list = this.propertiesAnnotations[index];
        return list == null ? EmptyList.f71733a : list;
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    @NotNull
    public SerialDescriptor getElementDescriptor(int index) {
        return getChildSerializers()[index].getDescriptor();
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    public int getElementIndex(@NotNull String name) {
        Intrinsics.g(name, "name");
        Integer num = this.indices.get(name);
        if (num != null) {
            return num.intValue();
        }
        return -3;
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    @NotNull
    public String getElementName(int index) {
        return this.names[index];
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    public final int getElementsCount() {
        return this.elementsCount;
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    @NotNull
    public SerialKind getKind() {
        return StructureKind.CLASS.INSTANCE;
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    @NotNull
    public String getSerialName() {
        return this.serialName;
    }

    @Override // kotlinx.serialization.internal.CachedNames
    @NotNull
    public Set<String> getSerialNames() {
        return this.indices.keySet();
    }

    @NotNull
    public final SerialDescriptor[] getTypeParameterDescriptors$kotlinx_serialization_core() {
        return (SerialDescriptor[]) this.typeParameterDescriptors.getValue();
    }

    public int hashCode() {
        return get_hashCode();
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    public boolean isElementOptional(int index) {
        return this.elementsOptionality[index];
    }

    public final void pushAnnotation(@NotNull Annotation annotation) {
        Intrinsics.g(annotation, "annotation");
        List<Annotation> arrayList = this.propertiesAnnotations[this.added];
        if (arrayList == null) {
            arrayList = new ArrayList<>(1);
            this.propertiesAnnotations[this.added] = arrayList;
        }
        arrayList.add(annotation);
    }

    public final void pushClassAnnotation(@NotNull Annotation a11) {
        Intrinsics.g(a11, "a");
        if (this.classAnnotations == null) {
            this.classAnnotations = new ArrayList(1);
        }
        List<Annotation> list = this.classAnnotations;
        Intrinsics.d(list);
        list.add(a11);
    }

    @NotNull
    public String toString() {
        return PluginGeneratedSerialDescriptorKt.toStringImpl(this);
    }

    public /* synthetic */ PluginGeneratedSerialDescriptor(String str, GeneratedSerializer generatedSerializer, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i11 & 2) != 0 ? null : generatedSerializer, i5);
    }
}
