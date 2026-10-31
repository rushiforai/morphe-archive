package io.branch.engage.sesame_lite.internal;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.UnsignedKt;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\n\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0087@\u0018\u0000 \u00192\u00020\u0001:\u0001\u0019B\u0012\u0012\u0006\u0010\u0002\u001a\u00020\u0003ø\u0001\u0000¢\u0006\u0004\b\u0004\u0010\u0005J\u001a\u0010\r\u001a\u00020\u00072\b\u0010\u000e\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0012HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0016HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0018R\u0011\u0010\u0006\u001a\u00020\u00078F¢\u0006\u0006\u001a\u0004\b\b\u0010\tR\u001c\u0010\u0002\u001a\u00020\u0003ø\u0001\u0000ø\u0001\u0001ø\u0001\u0002¢\u0006\n\n\u0002\u0010\f\u001a\u0004\b\n\u0010\u000b\u0088\u0001\u0002ø\u0001\u0000\u0082\u0002\u000f\n\u0002\b\u0019\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u001a"}, d2 = {"Lio/branch/engage/sesame_lite/internal/DeveloperShortcutTypeFlags;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "Lkotlin/ULong;", "constructor-impl", "(J)J", "isDynamic", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isDynamic-impl", "(J)Z", "getValue-s-VKNKU", "()J", "J", "equals", InneractiveMediationNameConsts.OTHER, "equals-impl", "(JLjava/lang/Object;)Z", "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode-impl", "(J)I", "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString-impl", "(J)Ljava/lang/String;", k.O, "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
@JvmInline
/* loaded from: classes4.dex */
public final class DeveloperShortcutTypeFlags {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private static final int IS_DYNAMIC = 1;
    private final long value;

    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u001e\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bø\u0001\u0000ø\u0001\u0001ø\u0001\u0002¢\u0006\u0004\b\t\u0010\nR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000\u0082\u0002\u000f\n\u0002\b!\n\u0005\b¡\u001e0\u0001\n\u0002\b\u0019¨\u0006\u000b"}, d2 = {"Lio/branch/engage/sesame_lite/internal/DeveloperShortcutTypeFlags$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()V", "IS_DYNAMIC", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "of", "Lio/branch/engage/sesame_lite/internal/DeveloperShortcutTypeFlags;", "isDynamic", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "of-rIm0iQ4", "(Z)J", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        /* renamed from: of-rIm0iQ4, reason: not valid java name */
        public final long m315ofrIm0iQ4(boolean isDynamic) {
            long j11;
            if (isDynamic) {
                ULong.Companion companion = ULong.f71699b;
                j11 = 1;
            } else {
                j11 = 0;
            }
            return DeveloperShortcutTypeFlags.m307constructorimpl(j11);
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    private /* synthetic */ DeveloperShortcutTypeFlags(long j11) {
        this.value = j11;
    }

    /* renamed from: box-impl, reason: not valid java name */
    public static final /* synthetic */ DeveloperShortcutTypeFlags m306boximpl(long j11) {
        return new DeveloperShortcutTypeFlags(j11);
    }

    /* renamed from: constructor-impl, reason: not valid java name */
    public static long m307constructorimpl(long j11) {
        return j11;
    }

    /* renamed from: equals-impl, reason: not valid java name */
    public static boolean m308equalsimpl(long j11, Object obj) {
        return (obj instanceof DeveloperShortcutTypeFlags) && j11 == ((DeveloperShortcutTypeFlags) obj).m314unboximpl();
    }

    /* renamed from: equals-impl0, reason: not valid java name */
    public static final boolean m309equalsimpl0(long j11, long j12) {
        return j11 == j12;
    }

    /* renamed from: hashCode-impl, reason: not valid java name */
    public static int m310hashCodeimpl(long j11) {
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(j11);
    }

    /* renamed from: isDynamic-impl, reason: not valid java name */
    public static final boolean m311isDynamicimpl(long j11) {
        return (UtilsKt.m337getLoIntVKZWuLQ(j11) & 1) != 0;
    }

    /* renamed from: toString-impl, reason: not valid java name */
    public static String m312toStringimpl(long j11) {
        StringBuilder sb2 = new StringBuilder("DeveloperShortcutTypeFlags(value=");
        ULong.Companion companion = ULong.f71699b;
        sb2.append((Object) UnsignedKt.c(10, j11));
        sb2.append(')');
        return sb2.toString();
    }

    public boolean equals(Object obj) {
        return m308equalsimpl(this.value, obj);
    }

    /* renamed from: getValue-s-VKNKU, reason: not valid java name and from getter */
    public final long getValue() {
        return this.value;
    }

    public int hashCode() {
        return m310hashCodeimpl(this.value);
    }

    public String toString() {
        return m312toStringimpl(this.value);
    }

    /* renamed from: unbox-impl, reason: not valid java name */
    public final /* synthetic */ long m314unboximpl() {
        return this.value;
    }
}
