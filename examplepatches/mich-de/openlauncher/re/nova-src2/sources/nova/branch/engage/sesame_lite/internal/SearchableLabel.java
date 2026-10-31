package nova.branch.engage.sesame_lite.internal;

import b.c0;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u0000 \u001e2\u00020\u0001:\u0002\u001e\u001fB%\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007B9\b\u0010\u0012\u0006\u0010\b\u001a\u00020\t\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\u0006\u0010\fJ\b\u0010\u0013\u001a\u00020\u0003H\u0016J\u0006\u0010\u0014\u001a\u00020\u0015J%\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u00002\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001cH\u0001¢\u0006\u0002\b\u001dR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000eR\u0011\u0010\u0011\u001a\u00020\u00038F¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u000e¨\u0006 "}, d2 = {"Lnova/branch/engage/sesame_lite/internal/SearchableLabel;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "matchDisplay", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "matchNormalized", "displayOverride", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "seen0", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getMatchDisplay", "()Ljava/lang/String;", "getMatchNormalized", "getDisplayOverride", "displayLabel", "getDisplayLabel", "toString", "canHighlight", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "write$Self", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$sesame_lite_release", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "$serializer", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes.dex */
public final class SearchableLabel {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final String displayOverride;

    @NotNull
    private final String matchDisplay;

    @NotNull
    private final String matchNormalized;

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J \u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\b2\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\bJ\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00060\u000b¨\u0006\f"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/SearchableLabel$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "createSearchableLabels", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lnova/branch/engage/sesame_lite/internal/SearchableLabel;", "matchDisplay", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "displayOverride", "serializer", "Lkotlinx/serialization/KSerializer;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public static /* synthetic */ List createSearchableLabels$default(Companion companion, String str, String str2, int i5, Object obj) {
            if ((i5 & 2) != 0) {
                str2 = null;
            }
            return companion.createSearchableLabels(str, str2);
        }

        @NotNull
        public final List<SearchableLabel> createSearchableLabels(@NotNull String matchDisplay, @Nullable String displayOverride) {
            Intrinsics.g(matchDisplay, "matchDisplay");
            String display = r70.k.u1(matchDisplay).toString();
            Pattern pattern = r80.k.f85688a;
            Intrinsics.g(display, "display");
            ArrayList arrayList = new ArrayList();
            arrayList.add(display);
            r80.k.c(0, display, arrayList);
            String[] strArr = (String[]) arrayList.toArray(new String[0]);
            ArrayList arrayList2 = new ArrayList(strArr.length);
            for (String str : strArr) {
                arrayList2.add(new SearchableLabel(str, r80.k.j(str), displayOverride, null));
            }
            return arrayList2;
        }

        @NotNull
        public final KSerializer<SearchableLabel> serializer() {
            return SearchableLabel$$serializer.INSTANCE;
        }

        private Companion() {
        }
    }

    public /* synthetic */ SearchableLabel(String str, String str2, String str3, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, str3);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$sesame_lite_release(SearchableLabel self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeStringElement(serialDesc, 0, self.matchDisplay);
        output.encodeStringElement(serialDesc, 1, self.matchNormalized);
        if (!output.shouldEncodeElementDefault(serialDesc, 2) && self.displayOverride == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.displayOverride);
    }

    public final boolean canHighlight() {
        String str = this.displayOverride;
        return str == null || str.length() == this.matchDisplay.length();
    }

    @NotNull
    public final String getDisplayLabel() {
        String str = this.displayOverride;
        return str == null ? this.matchDisplay : str;
    }

    @Nullable
    public final String getDisplayOverride() {
        return this.displayOverride;
    }

    @NotNull
    public final String getMatchDisplay() {
        return this.matchDisplay;
    }

    @NotNull
    public final String getMatchNormalized() {
        return this.matchNormalized;
    }

    @NotNull
    public String toString() {
        return c0.l("SearchableLabel(", getDisplayLabel(), ")");
    }

    public /* synthetic */ SearchableLabel(int i5, String str, String str2, String str3, SerializationConstructorMarker serializationConstructorMarker) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, SearchableLabel$$serializer.INSTANCE.getDescriptor());
        }
        this.matchDisplay = str;
        this.matchNormalized = str2;
        if ((i5 & 4) == 0) {
            this.displayOverride = null;
        } else {
            this.displayOverride = str3;
        }
    }

    private SearchableLabel(String str, String str2, String str3) {
        this.matchDisplay = str;
        this.matchNormalized = str2;
        this.displayOverride = str3;
    }

    public /* synthetic */ SearchableLabel(String str, String str2, String str3, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? null : str3);
    }
}
