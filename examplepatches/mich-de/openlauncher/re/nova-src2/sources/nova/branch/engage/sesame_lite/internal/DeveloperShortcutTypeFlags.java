package nova.branch.engage.sesame_lite.internal;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.UnsignedKt;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0087@\u0018\u0000 \u00192\u00020\u0001:\u0001\u0019B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u001a\u0010\r\u001a\u00020\n2\b\u0010\u000e\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0012HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0016HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0018R\u0013\u0010\u0002\u001a\u00020\u0003¢\u0006\n\n\u0002\u0010\b\u001a\u0004\b\u0006\u0010\u0007R\u0011\u0010\t\u001a\u00020\n8F¢\u0006\u0006\u001a\u0004\b\u000b\u0010\f\u0088\u0001\u0002¨\u0006\u001a"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/DeveloperShortcutTypeFlags;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "Lkotlin/ULong;", "constructor-impl", "(J)J", "getValue-s-VKNKU", "()J", "J", "isDynamic", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isDynamic-impl", "(J)Z", "equals", InneractiveMediationNameConsts.OTHER, "equals-impl", "(JLjava/lang/Object;)Z", "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode-impl", "(J)I", "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString-impl", "(J)Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@JvmInline
/* loaded from: classes.dex */
public final class DeveloperShortcutTypeFlags {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private static final int IS_DYNAMIC = 1;
    private final long value;

    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\f"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/DeveloperShortcutTypeFlags$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "IS_DYNAMIC", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "of", "Lnova/branch/engage/sesame_lite/internal/DeveloperShortcutTypeFlags;", "isDynamic", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "of-wicXtQY", "(Z)J", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* renamed from: of-wicXtQY, reason: not valid java name */
        public final long m443ofwicXtQY(boolean isDynamic) {
            long j11;
            if (isDynamic) {
                ULong.Companion companion = ULong.f71699b;
                j11 = 1;
            } else {
                j11 = 0;
            }
            return DeveloperShortcutTypeFlags.m435constructorimpl(j11);
        }

        private Companion() {
        }
    }

    private /* synthetic */ DeveloperShortcutTypeFlags(long j11) {
        this.value = j11;
    }

    /* renamed from: box-impl, reason: not valid java name */
    public static final /* synthetic */ DeveloperShortcutTypeFlags m434boximpl(long j11) {
        return new DeveloperShortcutTypeFlags(j11);
    }

    /* renamed from: constructor-impl, reason: not valid java name */
    public static long m435constructorimpl(long j11) {
        return j11;
    }

    /* renamed from: equals-impl, reason: not valid java name */
    public static boolean m436equalsimpl(long j11, Object obj) {
        return (obj instanceof DeveloperShortcutTypeFlags) && j11 == ((DeveloperShortcutTypeFlags) obj).m442unboximpl();
    }

    /* renamed from: equals-impl0, reason: not valid java name */
    public static final boolean m437equalsimpl0(long j11, long j12) {
        return ULong.a(j11, j12);
    }

    /* renamed from: hashCode-impl, reason: not valid java name */
    public static int m438hashCodeimpl(long j11) {
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(j11);
    }

    /* renamed from: isDynamic-impl, reason: not valid java name */
    public static final boolean m439isDynamicimpl(long j11) {
        return (UtilsKt.m459getLoIntVKZWuLQ(j11) & 1) != 0;
    }

    /* renamed from: toString-impl, reason: not valid java name */
    public static String m440toStringimpl(long j11) {
        ULong.Companion companion = ULong.f71699b;
        return c0.l("DeveloperShortcutTypeFlags(value=", UnsignedKt.c(10, j11), ")");
    }

    public boolean equals(Object obj) {
        return m436equalsimpl(this.value, obj);
    }

    /* renamed from: getValue-s-VKNKU, reason: not valid java name and from getter */
    public final long getValue() {
        return this.value;
    }

    public int hashCode() {
        return m438hashCodeimpl(this.value);
    }

    public String toString() {
        return m440toStringimpl(this.value);
    }

    /* renamed from: unbox-impl, reason: not valid java name */
    public final /* synthetic */ long m442unboximpl() {
        return this.value;
    }
}
