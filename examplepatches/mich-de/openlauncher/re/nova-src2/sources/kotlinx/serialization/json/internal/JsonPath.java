package kotlinx.serialization.json.internal;

import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.StructureKind;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\b\u0002\n\u0002\u0010\u0015\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0006\b\u0000\u0018\u00002\u00020\u0001:\u0001\u001bB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eJ\u000e\u0010\u000f\u001a\u00020\f2\u0006\u0010\u0010\u001a\u00020\nJ\u0010\u0010\u0011\u001a\u00020\f2\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001J\u0006\u0010\u0013\u001a\u00020\fJ\u0006\u0010\u0014\u001a\u00020\fJ\u0006\u0010\u0015\u001a\u00020\u0016J\u0012\u0010\u0017\u001a\u00020\u00162\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001H\u0002J\b\u0010\u0019\u001a\u00020\fH\u0002J\b\u0010\u001a\u001a\u00020\u0016H\u0016R\u0018\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0005X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0006R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u001c"}, d2 = {"Lkotlinx/serialization/json/internal/JsonPath;", b.f42142b, "<init>", "()V", "currentObjectPath", b.f42142b, "[Ljava/lang/Object;", "indicies", b.f42142b, "currentDepth", b.f42142b, "pushDescriptor", b.f42142b, "sd", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "updateDescriptorIndex", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "updateCurrentMapKey", DatabaseConstants.KEY_FIELD, "resetCurrentMapKey", "popDescriptor", "getPath", b.f42142b, "prettyString", "it", n.f39153g, "toString", "Tombstone", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class JsonPath {
    private int currentDepth;

    @NotNull
    private Object[] currentObjectPath = new Object[8];

    @NotNull
    private int[] indicies;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\bÂ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlinx/serialization/json/internal/JsonPath$Tombstone;", b.f42142b, "<init>", "()V", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public static final class Tombstone {

        @NotNull
        public static final Tombstone INSTANCE = new Tombstone();

        private Tombstone() {
        }
    }

    public JsonPath() {
        int[] iArr = new int[8];
        for (int i5 = 0; i5 < 8; i5++) {
            iArr[i5] = -1;
        }
        this.indicies = iArr;
        this.currentDepth = -1;
    }

    private final String prettyString(Object it) {
        String serialName;
        SerialDescriptor serialDescriptor = it instanceof SerialDescriptor ? (SerialDescriptor) it : null;
        return (serialDescriptor == null || (serialName = serialDescriptor.getSerialName()) == null) ? String.valueOf(it) : serialName;
    }

    private final void resize() {
        int i5 = this.currentDepth * 2;
        Object[] objArrCopyOf = Arrays.copyOf(this.currentObjectPath, i5);
        Intrinsics.f(objArrCopyOf, "copyOf(...)");
        this.currentObjectPath = objArrCopyOf;
        int[] iArrCopyOf = Arrays.copyOf(this.indicies, i5);
        Intrinsics.f(iArrCopyOf, "copyOf(...)");
        this.indicies = iArrCopyOf;
    }

    @NotNull
    public final String getPath() {
        StringBuilder sb2 = new StringBuilder("$");
        int i5 = this.currentDepth + 1;
        for (int i11 = 0; i11 < i5; i11++) {
            Object obj = this.currentObjectPath[i11];
            if (obj instanceof SerialDescriptor) {
                SerialDescriptor serialDescriptor = (SerialDescriptor) obj;
                if (!Intrinsics.b(serialDescriptor.getKind(), StructureKind.LIST.INSTANCE)) {
                    int i12 = this.indicies[i11];
                    if (i12 >= 0) {
                        sb2.append(".");
                        sb2.append(serialDescriptor.getElementName(i12));
                    }
                } else if (this.indicies[i11] != -1) {
                    sb2.append("[");
                    sb2.append(this.indicies[i11]);
                    sb2.append("]");
                }
            } else if (obj != Tombstone.INSTANCE) {
                sb2.append("['");
                sb2.append(obj);
                sb2.append("']");
            }
        }
        return sb2.toString();
    }

    public final void popDescriptor() {
        int i5 = this.currentDepth;
        int[] iArr = this.indicies;
        if (iArr[i5] == -2) {
            iArr[i5] = -1;
            this.currentDepth = i5 - 1;
        }
        int i11 = this.currentDepth;
        if (i11 != -1) {
            this.currentDepth = i11 - 1;
        }
    }

    public final void pushDescriptor(@NotNull SerialDescriptor sd2) {
        Intrinsics.g(sd2, "sd");
        int i5 = this.currentDepth + 1;
        this.currentDepth = i5;
        if (i5 == this.currentObjectPath.length) {
            resize();
        }
        this.currentObjectPath[i5] = sd2;
    }

    public final void resetCurrentMapKey() {
        int[] iArr = this.indicies;
        int i5 = this.currentDepth;
        if (iArr[i5] == -2) {
            this.currentObjectPath[i5] = Tombstone.INSTANCE;
        }
    }

    @NotNull
    public String toString() {
        return getPath();
    }

    public final void updateCurrentMapKey(@Nullable Object key) {
        int[] iArr = this.indicies;
        int i5 = this.currentDepth;
        if (iArr[i5] != -2) {
            int i11 = i5 + 1;
            this.currentDepth = i11;
            if (i11 == this.currentObjectPath.length) {
                resize();
            }
        }
        Object[] objArr = this.currentObjectPath;
        int i12 = this.currentDepth;
        objArr[i12] = key;
        this.indicies[i12] = -2;
    }

    public final void updateDescriptorIndex(int index) {
        this.indicies[this.currentDepth] = index;
    }
}
