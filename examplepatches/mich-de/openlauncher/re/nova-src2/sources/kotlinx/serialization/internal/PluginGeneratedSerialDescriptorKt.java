package kotlinx.serialization.internal;

import b70.g;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import h10.y0;
import java.util.Arrays;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialDescriptorKt;
import kotlinx.serialization.descriptors.SerialKind;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00004\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0011\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\u001aN\u0010\u0000\u001a\u00020\u0001\"\n\b\u0000\u0010\u0002\u0018\u0001*\u00020\u0003*\u0002H\u00022\b\u0010\u0004\u001a\u0004\u0018\u00010\u00052!\u0010\u0006\u001a\u001d\u0012\u0013\u0012\u0011H\u0002¢\u0006\f\b\b\u0012\b\b\t\u0012\u0004\b\b(\n\u0012\u0004\u0012\u00020\u00010\u0007H\u0080\bø\u0001\u0000¢\u0006\u0002\u0010\u000b\u001a\u001f\u0010\f\u001a\u00020\r*\u00020\u00032\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00030\u000fH\u0000¢\u0006\u0002\u0010\u0010\u001a\f\u0010\u0011\u001a\u00020\u0012*\u00020\u0003H\u0000\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\u0013"}, d2 = {"equalsImpl", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "SD", "Lkotlinx/serialization/descriptors/SerialDescriptor;", InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "typeParamsAreEqual", "Lkotlin/Function1;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "otherDescriptor", "(Lkotlinx/serialization/descriptors/SerialDescriptor;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)Z", "hashCodeImpl", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "typeParams", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Lkotlinx/serialization/descriptors/SerialDescriptor;[Lkotlinx/serialization/descriptors/SerialDescriptor;)I", "toStringImpl", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlinx-serialization-core"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class PluginGeneratedSerialDescriptorKt {
    public static final /* synthetic */ <SD extends SerialDescriptor> boolean equalsImpl(SD sd2, Object obj, Function1<? super SD, Boolean> typeParamsAreEqual) {
        Intrinsics.g(sd2, "<this>");
        Intrinsics.g(typeParamsAreEqual, "typeParamsAreEqual");
        if (sd2 == obj) {
            return true;
        }
        Intrinsics.k();
        throw null;
    }

    public static final int hashCodeImpl(@NotNull SerialDescriptor serialDescriptor, @NotNull SerialDescriptor[] typeParams) {
        Intrinsics.g(serialDescriptor, "<this>");
        Intrinsics.g(typeParams, "typeParams");
        int iHashCode = (serialDescriptor.getSerialName().hashCode() * 31) + Arrays.hashCode(typeParams);
        Iterable<SerialDescriptor> elementDescriptors = SerialDescriptorKt.getElementDescriptors(serialDescriptor);
        Iterator<SerialDescriptor> it = elementDescriptors.iterator();
        int iHashCode2 = 1;
        int i5 = 1;
        while (true) {
            int iHashCode3 = 0;
            if (!it.hasNext()) {
                break;
            }
            int i11 = i5 * 31;
            String serialName = it.next().getSerialName();
            if (serialName != null) {
                iHashCode3 = serialName.hashCode();
            }
            i5 = i11 + iHashCode3;
        }
        Iterator<SerialDescriptor> it2 = elementDescriptors.iterator();
        while (it2.hasNext()) {
            int i12 = iHashCode2 * 31;
            SerialKind kind = it2.next().getKind();
            iHashCode2 = i12 + (kind != null ? kind.hashCode() : 0);
        }
        return (((iHashCode * 31) + i5) * 31) + iHashCode2;
    }

    @NotNull
    public static final String toStringImpl(@NotNull SerialDescriptor serialDescriptor) {
        Intrinsics.g(serialDescriptor, "<this>");
        return g.f1(kotlin.ranges.a.m0(0, serialDescriptor.getElementsCount()), ", ", serialDescriptor.getSerialName() + '(', ")", 0, new y0(serialDescriptor, 16), 24);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence toStringImpl$lambda$2(SerialDescriptor serialDescriptor, int i5) {
        return serialDescriptor.getElementName(i5) + ": " + serialDescriptor.getElementDescriptor(i5).getSerialName();
    }
}
