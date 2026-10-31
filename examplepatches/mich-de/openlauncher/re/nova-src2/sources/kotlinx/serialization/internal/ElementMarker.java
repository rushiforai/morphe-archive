package kotlinx.serialization.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.descriptors.SerialDescriptor;
import org.jetbrains.annotations.NotNull;

@CoreFriendModuleApi
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0016\n\u0000\n\u0002\u0010\u0002\n\u0002\b\b\b\u0007\u0018\u0000 \u00162\u00020\u0001:\u0001\u0016B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0018\u0010\u0004\u001a\u0014\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00070\u0005¢\u0006\u0004\b\b\u0010\tJ\u000e\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0006J\u0006\u0010\u0011\u001a\u00020\u0006J\u0010\u0010\u0012\u001a\u00020\r2\u0006\u0010\u0013\u001a\u00020\u0006H\u0002J\u0010\u0010\u0014\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0006H\u0002J\b\u0010\u0015\u001a\u00020\u0006H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R \u0010\u0004\u001a\u0014\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00070\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0017"}, d2 = {"Lkotlinx/serialization/internal/ElementMarker;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "readIfAbsent", "Lkotlin/Function2;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Lkotlinx/serialization/descriptors/SerialDescriptor;Lkotlin/jvm/functions/Function2;)V", "lowerMarks", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "highMarksArray", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "mark", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "nextUnmarkedIndex", "prepareHighMarksArray", "elementsCount", "markHigh", "nextUnmarkedHighIndex", k.O, "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ElementMarker {

    @NotNull
    private static final Companion Companion = new Companion(null);

    @NotNull
    private static final long[] EMPTY_HIGH_MARKS = new long[0];

    @NotNull
    private final SerialDescriptor descriptor;

    @NotNull
    private final long[] highMarksArray;
    private long lowerMarks;

    @NotNull
    private final Function2<SerialDescriptor, Integer, Boolean> readIfAbsent;

    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0016\n\u0000\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0006"}, d2 = {"Lkotlinx/serialization/internal/ElementMarker$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "EMPTY_HIGH_MARKS", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public ElementMarker(@NotNull SerialDescriptor descriptor, @NotNull Function2<? super SerialDescriptor, ? super Integer, Boolean> readIfAbsent) {
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(readIfAbsent, "readIfAbsent");
        this.descriptor = descriptor;
        this.readIfAbsent = readIfAbsent;
        int elementsCount = descriptor.getElementsCount();
        if (elementsCount <= 64) {
            this.lowerMarks = elementsCount != 64 ? (-1) << elementsCount : 0L;
            this.highMarksArray = EMPTY_HIGH_MARKS;
        } else {
            this.lowerMarks = 0L;
            this.highMarksArray = prepareHighMarksArray(elementsCount);
        }
    }

    private final void markHigh(int index) {
        int i5 = (index >>> 6) - 1;
        long[] jArr = this.highMarksArray;
        jArr[i5] = jArr[i5] | (1 << (index & 63));
    }

    private final int nextUnmarkedHighIndex() {
        int length = this.highMarksArray.length;
        int i5 = 0;
        while (i5 < length) {
            int i11 = i5 + 1;
            int i12 = i11 * 64;
            long j11 = this.highMarksArray[i5];
            while (j11 != -1) {
                int iNumberOfTrailingZeros = Long.numberOfTrailingZeros(~j11);
                j11 |= 1 << iNumberOfTrailingZeros;
                int i13 = iNumberOfTrailingZeros + i12;
                if (((Boolean) this.readIfAbsent.invoke(this.descriptor, Integer.valueOf(i13))).booleanValue()) {
                    this.highMarksArray[i5] = j11;
                    return i13;
                }
            }
            this.highMarksArray[i5] = j11;
            i5 = i11;
        }
        return -1;
    }

    private final long[] prepareHighMarksArray(int elementsCount) {
        int i5 = (elementsCount - 1) >>> 6;
        long[] jArr = new long[i5];
        if ((elementsCount & 63) != 0) {
            jArr[i5 - 1] = (-1) << elementsCount;
        }
        return jArr;
    }

    public final void mark(int index) {
        if (index < 64) {
            this.lowerMarks |= 1 << index;
        } else {
            markHigh(index);
        }
    }

    public final int nextUnmarkedIndex() {
        int iNumberOfTrailingZeros;
        int elementsCount = this.descriptor.getElementsCount();
        do {
            long j11 = this.lowerMarks;
            if (j11 == -1) {
                if (elementsCount > 64) {
                    return nextUnmarkedHighIndex();
                }
                return -1;
            }
            iNumberOfTrailingZeros = Long.numberOfTrailingZeros(~j11);
            this.lowerMarks |= 1 << iNumberOfTrailingZeros;
        } while (!((Boolean) this.readIfAbsent.invoke(this.descriptor, Integer.valueOf(iNumberOfTrailingZeros))).booleanValue());
        return iNumberOfTrailingZeros;
    }
}
