package kotlinx.serialization.descriptors;

import a7.f;
import b70.c;
import b70.g;
import b70.k;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.IndexedValue;
import kotlin.collections.IndexingIterable;
import kotlin.collections.IndexingIterator;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.internal.CachedNames;
import kotlinx.serialization.internal.Platform_commonKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptorKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u001b\n\u0002\b\u0003\n\u0002\u0010\"\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\b\u0006\n\u0002\u0010\u0018\n\u0000\n\u0002\u0010$\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u00012\u00020\u0002B5\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00010\n\u0012\u0006\u0010\u000b\u001a\u00020\f¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010-\u001a\u00020\u00042\u0006\u0010.\u001a\u00020\bH\u0016J\u0010\u0010/\u001a\u00020\b2\u0006\u00100\u001a\u00020\u0004H\u0016J\u0016\u00101\u001a\b\u0012\u0004\u0012\u00020\u00160\n2\u0006\u0010.\u001a\u00020\bH\u0016J\u0010\u00102\u001a\u00020\u00012\u0006\u0010.\u001a\u00020\bH\u0016J\u0010\u00103\u001a\u0002042\u0006\u0010.\u001a\u00020\bH\u0016J\u0013\u00105\u001a\u0002042\b\u00106\u001a\u0004\u0018\u000107H\u0096\u0002J\b\u00108\u001a\u00020\bH\u0016J\b\u00109\u001a\u00020\u0004H\u0016R\u0014\u0010\u0003\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0005\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0007\u001a\u00020\bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u001a\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00160\nX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018R\u001a\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00040\u001aX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001cR\u0016\u0010\u001d\u001a\b\u0012\u0004\u0012\u00020\u00040\u001eX\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u001fR\u0016\u0010 \u001a\b\u0012\u0004\u0012\u00020\u00010\u001eX\u0082\u0004¢\u0006\u0004\n\u0002\u0010!R\u001c\u0010\"\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00160\n0\u001eX\u0082\u0004¢\u0006\u0004\n\u0002\u0010#R\u000e\u0010$\u001a\u00020%X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010&\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\b0'X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010(\u001a\b\u0012\u0004\u0012\u00020\u00010\u001eX\u0082\u0004¢\u0006\u0004\n\u0002\u0010!R\u001b\u0010)\u001a\u00020\b8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b+\u0010,\u001a\u0004\b*\u0010\u0014¨\u0006:"}, d2 = {"Lkotlinx/serialization/descriptors/SerialDescriptorImpl;", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "Lkotlinx/serialization/internal/CachedNames;", "serialName", b.f42142b, "kind", "Lkotlinx/serialization/descriptors/SerialKind;", "elementsCount", b.f42142b, "typeParameters", b.f42142b, "builder", "Lkotlinx/serialization/descriptors/ClassSerialDescriptorBuilder;", "<init>", "(Ljava/lang/String;Lkotlinx/serialization/descriptors/SerialKind;ILjava/util/List;Lkotlinx/serialization/descriptors/ClassSerialDescriptorBuilder;)V", "getSerialName", "()Ljava/lang/String;", "getKind", "()Lkotlinx/serialization/descriptors/SerialKind;", "getElementsCount", "()I", "annotations", b.f42142b, "getAnnotations", "()Ljava/util/List;", "serialNames", b.f42142b, "getSerialNames", "()Ljava/util/Set;", "elementNames", b.f42142b, "[Ljava/lang/String;", "elementDescriptors", "[Lkotlinx/serialization/descriptors/SerialDescriptor;", "elementAnnotations", "[Ljava/util/List;", "elementOptionality", b.f42142b, "name2Index", b.f42142b, "typeParametersDescriptors", "_hashCode", "get_hashCode", "_hashCode$delegate", "Lkotlin/Lazy;", "getElementName", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "getElementIndex", PendingUpgradeStore.KEY_NAME, "getElementAnnotations", "getElementDescriptor", "isElementOptional", b.f42142b, "equals", InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", "toString", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class SerialDescriptorImpl implements SerialDescriptor, CachedNames {

    /* renamed from: _hashCode$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy _hashCode;

    @NotNull
    private final List<Annotation> annotations;

    @NotNull
    private final List<Annotation>[] elementAnnotations;

    @NotNull
    private final SerialDescriptor[] elementDescriptors;

    @NotNull
    private final String[] elementNames;

    @NotNull
    private final boolean[] elementOptionality;
    private final int elementsCount;

    @NotNull
    private final SerialKind kind;

    @NotNull
    private final Map<String, Integer> name2Index;

    @NotNull
    private final String serialName;

    @NotNull
    private final Set<String> serialNames;

    @NotNull
    private final SerialDescriptor[] typeParametersDescriptors;

    public SerialDescriptorImpl(@NotNull String serialName, @NotNull SerialKind kind, int i5, @NotNull List<? extends SerialDescriptor> typeParameters, @NotNull ClassSerialDescriptorBuilder builder) {
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(kind, "kind");
        Intrinsics.g(typeParameters, "typeParameters");
        Intrinsics.g(builder, "builder");
        this.serialName = serialName;
        this.kind = kind;
        this.elementsCount = i5;
        this.annotations = builder.getAnnotations();
        List<String> elementNames$kotlinx_serialization_core = builder.getElementNames$kotlinx_serialization_core();
        Intrinsics.g(elementNames$kotlinx_serialization_core, "<this>");
        HashSet hashSet = new HashSet(k.d0(c.u0(elementNames$kotlinx_serialization_core, 12)));
        g.G1(elementNames$kotlinx_serialization_core, hashSet);
        this.serialNames = hashSet;
        String[] strArr = (String[]) builder.getElementNames$kotlinx_serialization_core().toArray(new String[0]);
        this.elementNames = strArr;
        this.elementDescriptors = Platform_commonKt.compactArray(builder.getElementDescriptors$kotlinx_serialization_core());
        this.elementAnnotations = (List[]) builder.getElementAnnotations$kotlinx_serialization_core().toArray(new List[0]);
        List<Boolean> elementOptionality$kotlinx_serialization_core = builder.getElementOptionality$kotlinx_serialization_core();
        Intrinsics.g(elementOptionality$kotlinx_serialization_core, "<this>");
        boolean[] zArr = new boolean[elementOptionality$kotlinx_serialization_core.size()];
        Iterator<Boolean> it = elementOptionality$kotlinx_serialization_core.iterator();
        int i11 = 0;
        while (it.hasNext()) {
            zArr[i11] = it.next().booleanValue();
            i11++;
        }
        this.elementOptionality = zArr;
        Intrinsics.g(strArr, "<this>");
        IndexingIterable indexingIterable = new IndexingIterable(new f(strArr, 2));
        ArrayList arrayList = new ArrayList(c.u0(indexingIterable, 10));
        Iterator it2 = indexingIterable.iterator();
        while (true) {
            IndexingIterator indexingIterator = (IndexingIterator) it2;
            if (!indexingIterator.f71738a.hasNext()) {
                this.name2Index = MapsKt.r0(arrayList);
                this.typeParametersDescriptors = Platform_commonKt.compactArray(typeParameters);
                this._hashCode = LazyKt.a(new f(this, 18));
                return;
            }
            IndexedValue indexedValue = (IndexedValue) indexingIterator.next();
            arrayList.add(new Pair(indexedValue.f71736b, Integer.valueOf(indexedValue.f71735a)));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int _hashCode_delegate$lambda$1(SerialDescriptorImpl serialDescriptorImpl) {
        return PluginGeneratedSerialDescriptorKt.hashCodeImpl(serialDescriptorImpl, serialDescriptorImpl.typeParametersDescriptors);
    }

    private final int get_hashCode() {
        return ((Number) this._hashCode.getValue()).intValue();
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SerialDescriptorImpl)) {
            return false;
        }
        SerialDescriptor serialDescriptor = (SerialDescriptor) other;
        if (!Intrinsics.b(getSerialName(), serialDescriptor.getSerialName()) || !Arrays.equals(this.typeParametersDescriptors, ((SerialDescriptorImpl) other).typeParametersDescriptors) || getElementsCount() != serialDescriptor.getElementsCount()) {
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
        return this.annotations;
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    @NotNull
    public List<Annotation> getElementAnnotations(int index) {
        return this.elementAnnotations[index];
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    @NotNull
    public SerialDescriptor getElementDescriptor(int index) {
        return this.elementDescriptors[index];
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    public int getElementIndex(@NotNull String name) {
        Intrinsics.g(name, "name");
        Integer num = this.name2Index.get(name);
        if (num != null) {
            return num.intValue();
        }
        return -3;
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    @NotNull
    public String getElementName(int index) {
        return this.elementNames[index];
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    public int getElementsCount() {
        return this.elementsCount;
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    @NotNull
    public SerialKind getKind() {
        return this.kind;
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    @NotNull
    public String getSerialName() {
        return this.serialName;
    }

    @Override // kotlinx.serialization.internal.CachedNames
    @NotNull
    public Set<String> getSerialNames() {
        return this.serialNames;
    }

    public int hashCode() {
        return get_hashCode();
    }

    @Override // kotlinx.serialization.descriptors.SerialDescriptor
    public boolean isElementOptional(int index) {
        return this.elementOptionality[index];
    }

    @NotNull
    public String toString() {
        return PluginGeneratedSerialDescriptorKt.toStringImpl(this);
    }
}
