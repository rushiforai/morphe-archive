package nova.branch.engage.sesame_lite.internal;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.UnsignedKt;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u000e\b\u0087@\u0018\u0000 \u001d2\u00020\u0001:\u0001\u001dB\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0015\u0010\u000b\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000f\u001a\u00020\fHÖ\u0001¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u0013\u001a\u00020\u0010HÖ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0017\u001a\u00020\b2\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0015\u0010\u0016R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0018\u001a\u0004\b\u0019\u0010\u001aR\u0011\u0010\u001c\u001a\u00020\u00108F¢\u0006\u0006\u001a\u0004\b\u001b\u0010\u0012\u0088\u0001\u0003\u0092\u0001\u00020\u0002¨\u0006\u001e"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/ContactTypeFlags;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/ULong;", "value", "constructor-impl", "(J)J", "Lr80/b;", "action", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hasAction-impl", "(JLr80/b;)Z", "hasAction", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString-impl", "(J)Ljava/lang/String;", "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode-impl", "(J)I", "hashCode", InneractiveMediationNameConsts.OTHER, "equals-impl", "(JLjava/lang/Object;)Z", "equals", "J", "getValue-s-VKNKU", "()J", "getBaseScore-impl", "baseScore", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@JvmInline
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class ContactTypeFlags {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private final long value;

    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001b\u0010\n\u001a\u00020\u00072\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\u0004\b\b\u0010\t¨\u0006\u000b"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/ContactTypeFlags$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lr80/b;", "actions", "Lnova/branch/engage/sesame_lite/internal/ContactTypeFlags;", "of-eWBOayA", "(Ljava/util/Set;)J", "of", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* renamed from: of-eWBOayA, reason: not valid java name */
        public final long m433ofeWBOayA(@NotNull Set<? extends r80.b> actions) {
            Intrinsics.g(actions, "actions");
            ArrayList arrayList = new ArrayList(b70.c.u0(actions, 10));
            Iterator<T> it = actions.iterator();
            while (it.hasNext()) {
                arrayList.add(new ULong(1 << ((r80.b) it.next()).ordinal()));
            }
            int size = arrayList.size();
            long j11 = 0;
            int i5 = 0;
            while (i5 < size) {
                Object obj = arrayList.get(i5);
                i5++;
                j11 |= ((ULong) obj).f71700a;
            }
            return ContactTypeFlags.m424constructorimpl(j11);
        }

        private Companion() {
        }
    }

    private /* synthetic */ ContactTypeFlags(long j11) {
        this.value = j11;
    }

    /* renamed from: box-impl, reason: not valid java name */
    public static final /* synthetic */ ContactTypeFlags m423boximpl(long j11) {
        return new ContactTypeFlags(j11);
    }

    /* renamed from: constructor-impl, reason: not valid java name */
    public static long m424constructorimpl(long j11) {
        return j11;
    }

    /* renamed from: equals-impl, reason: not valid java name */
    public static boolean m425equalsimpl(long j11, Object obj) {
        return (obj instanceof ContactTypeFlags) && j11 == ((ContactTypeFlags) obj).m432unboximpl();
    }

    /* renamed from: equals-impl0, reason: not valid java name */
    public static final boolean m426equalsimpl0(long j11, long j12) {
        return ULong.a(j11, j12);
    }

    /* renamed from: getBaseScore-impl, reason: not valid java name */
    public static final int m427getBaseScoreimpl(long j11) {
        boolean zM428hasActionimpl = m428hasActionimpl(j11, r80.b.f85650c);
        boolean zM428hasActionimpl2 = m428hasActionimpl(j11, r80.b.f85652e);
        r80.b[] bVarArrValues = r80.b.values();
        ArrayList arrayList = new ArrayList();
        for (r80.b bVar : bVarArrValues) {
            if (bVar != r80.b.f85650c && bVar != r80.b.f85651d && bVar != r80.b.f85652e) {
                arrayList.add(bVar);
            }
        }
        int size = arrayList.size();
        if (zM428hasActionimpl && zM428hasActionimpl2 && size > 0) {
            return size + 6;
        }
        if (zM428hasActionimpl && size > 0) {
            return size + 5;
        }
        if (zM428hasActionimpl && zM428hasActionimpl2) {
            return 5;
        }
        if (size > 0 && zM428hasActionimpl2) {
            return size + 4;
        }
        if (zM428hasActionimpl) {
            return 3;
        }
        return size > 0 ? size + 2 : zM428hasActionimpl2 ? 1 : 0;
    }

    /* renamed from: hasAction-impl, reason: not valid java name */
    public static final boolean m428hasActionimpl(long j11, @NotNull r80.b action) {
        Intrinsics.g(action, "action");
        return (UtilsKt.m459getLoIntVKZWuLQ(j11) & (1 << action.ordinal())) != 0;
    }

    /* renamed from: hashCode-impl, reason: not valid java name */
    public static int m429hashCodeimpl(long j11) {
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(j11);
    }

    /* renamed from: toString-impl, reason: not valid java name */
    public static String m430toStringimpl(long j11) {
        ULong.Companion companion = ULong.f71699b;
        return c0.l("ContactTypeFlags(value=", UnsignedKt.c(10, j11), ")");
    }

    public boolean equals(Object obj) {
        return m425equalsimpl(this.value, obj);
    }

    /* renamed from: getValue-s-VKNKU, reason: not valid java name and from getter */
    public final long getValue() {
        return this.value;
    }

    public int hashCode() {
        return m429hashCodeimpl(this.value);
    }

    public String toString() {
        return m430toStringimpl(this.value);
    }

    /* renamed from: unbox-impl, reason: not valid java name */
    public final /* synthetic */ long m432unboximpl() {
        return this.value;
    }
}
