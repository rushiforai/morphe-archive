package nova.branch.engage.sesame_lite.internal;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.UnsignedKt;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0087@\u0018\u0000 \u00192\u00020\u0001:\u0001\u0019B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u001a\u0010\r\u001a\u00020\n2\b\u0010\u000e\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0012HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0016HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0018R\u0013\u0010\u0002\u001a\u00020\u0003¢\u0006\n\n\u0002\u0010\b\u001a\u0004\b\u0006\u0010\u0007R\u0011\u0010\t\u001a\u00020\n8F¢\u0006\u0006\u001a\u0004\b\u000b\u0010\f\u0088\u0001\u0002¨\u0006\u001a"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/ConduitTypeFlags;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "Lkotlin/ULong;", "constructor-impl", "(J)J", "getValue-s-VKNKU", "()J", "J", "isBroadcast", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isBroadcast-impl", "(J)Z", "equals", InneractiveMediationNameConsts.OTHER, "equals-impl", "(JLjava/lang/Object;)Z", "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode-impl", "(J)I", "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString-impl", "(J)Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@JvmInline
/* loaded from: classes5.dex */
public final class ConduitTypeFlags {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private static final long IS_BROADCAST = 1;
    private final long value;

    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n¢\u0006\u0004\b\u000b\u0010\fR\u0010\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0004\n\u0002\u0010\u0006¨\u0006\r"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/ConduitTypeFlags$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "IS_BROADCAST", "Lkotlin/ULong;", "J", "of", "Lnova/branch/engage/sesame_lite/internal/ConduitTypeFlags;", "isBroadcast", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "of-0qMN5EE", "(Z)J", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* renamed from: of-0qMN5EE, reason: not valid java name */
        public final long m422of0qMN5EE(boolean isBroadcast) {
            return ConduitTypeFlags.m414constructorimpl(isBroadcast ? 1L : 0L);
        }

        private Companion() {
        }
    }

    private /* synthetic */ ConduitTypeFlags(long j11) {
        this.value = j11;
    }

    /* renamed from: box-impl, reason: not valid java name */
    public static final /* synthetic */ ConduitTypeFlags m413boximpl(long j11) {
        return new ConduitTypeFlags(j11);
    }

    /* renamed from: constructor-impl, reason: not valid java name */
    public static long m414constructorimpl(long j11) {
        return j11;
    }

    /* renamed from: equals-impl, reason: not valid java name */
    public static boolean m415equalsimpl(long j11, Object obj) {
        return (obj instanceof ConduitTypeFlags) && j11 == ((ConduitTypeFlags) obj).m421unboximpl();
    }

    /* renamed from: equals-impl0, reason: not valid java name */
    public static final boolean m416equalsimpl0(long j11, long j12) {
        return ULong.a(j11, j12);
    }

    /* renamed from: hashCode-impl, reason: not valid java name */
    public static int m417hashCodeimpl(long j11) {
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(j11);
    }

    /* renamed from: isBroadcast-impl, reason: not valid java name */
    public static final boolean m418isBroadcastimpl(long j11) {
        ULong.Companion companion = ULong.f71699b;
        return Long.compareUnsigned(j11 & 1, 0L) > 0;
    }

    /* renamed from: toString-impl, reason: not valid java name */
    public static String m419toStringimpl(long j11) {
        ULong.Companion companion = ULong.f71699b;
        return c0.l("ConduitTypeFlags(value=", UnsignedKt.c(10, j11), ")");
    }

    public boolean equals(Object obj) {
        return m415equalsimpl(this.value, obj);
    }

    /* renamed from: getValue-s-VKNKU, reason: not valid java name and from getter */
    public final long getValue() {
        return this.value;
    }

    public int hashCode() {
        return m417hashCodeimpl(this.value);
    }

    public String toString() {
        return m419toStringimpl(this.value);
    }

    /* renamed from: unbox-impl, reason: not valid java name */
    public final /* synthetic */ long m421unboximpl() {
        return this.value;
    }
}
