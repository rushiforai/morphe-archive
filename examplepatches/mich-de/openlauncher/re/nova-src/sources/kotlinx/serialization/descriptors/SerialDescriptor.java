package kotlinx.serialization.descriptors;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.lang.annotation.Annotation;
import java.util.List;
import kotlin.Metadata;
import kotlin.SubclassOptInRequired;
import kotlin.collections.EmptyList;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0010\u001b\n\u0002\b\n\bg\u0018\u00002\u00020\u0001J\u0010\u0010\u0017\u001a\u00020\u00032\u0006\u0010\u0018\u001a\u00020\u000fH&J\u0010\u0010\u0019\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u0003H&J\u0016\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00140\u00132\u0006\u0010\u0018\u001a\u00020\u000fH&J\u0010\u0010\u001c\u001a\u00020\u00002\u0006\u0010\u0018\u001a\u00020\u000fH&J\u0010\u0010\u001d\u001a\u00020\u000b2\u0006\u0010\u0018\u001a\u00020\u000fH&R\u0012\u0010\u0002\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0005R\u0012\u0010\u0006\u001a\u00020\u0007X¦\u0004¢\u0006\u0006\u001a\u0004\b\b\u0010\tR\u0014\u0010\n\u001a\u00020\u000b8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\n\u0010\fR\u0014\u0010\r\u001a\u00020\u000b8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\r\u0010\fR\u0012\u0010\u000e\u001a\u00020\u000fX¦\u0004¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0011R\u001a\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00140\u00138VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u001eÀ\u0006\u0003"}, d2 = {"Lkotlinx/serialization/descriptors/SerialDescriptor;", b.f42142b, "serialName", b.f42142b, "getSerialName", "()Ljava/lang/String;", "kind", "Lkotlinx/serialization/descriptors/SerialKind;", "getKind", "()Lkotlinx/serialization/descriptors/SerialKind;", "isNullable", b.f42142b, "()Z", "isInline", "elementsCount", b.f42142b, "getElementsCount", "()I", "annotations", b.f42142b, b.f42142b, "getAnnotations", "()Ljava/util/List;", "getElementName", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "getElementIndex", PendingUpgradeStore.KEY_NAME, "getElementAnnotations", "getElementDescriptor", "isElementOptional", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SubclassOptInRequired
/* loaded from: classes.dex */
public interface SerialDescriptor {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public static final class DefaultImpls {
        @Deprecated
        @NotNull
        public static List<Annotation> getAnnotations(@NotNull SerialDescriptor serialDescriptor) {
            return SerialDescriptor.super.getAnnotations();
        }

        @Deprecated
        public static boolean isInline(@NotNull SerialDescriptor serialDescriptor) {
            return SerialDescriptor.super.isInline();
        }

        @Deprecated
        public static boolean isNullable(@NotNull SerialDescriptor serialDescriptor) {
            return SerialDescriptor.super.isNullable();
        }
    }

    @NotNull
    default List<Annotation> getAnnotations() {
        return EmptyList.f71733a;
    }

    @NotNull
    List<Annotation> getElementAnnotations(int index);

    @NotNull
    SerialDescriptor getElementDescriptor(int index);

    int getElementIndex(@NotNull String name);

    @NotNull
    String getElementName(int index);

    int getElementsCount();

    @NotNull
    SerialKind getKind();

    @NotNull
    String getSerialName();

    boolean isElementOptional(int index);

    default boolean isInline() {
        return false;
    }

    default boolean isNullable() {
        return false;
    }
}
