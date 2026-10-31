package io.branch.engage.sesame_lite.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import u40.g;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0003\u0018\u0000 \u00102\u00020\u0001:\u0001\u0010B#\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0006J\u0006\u0010\r\u001a\u00020\u000eJ\b\u0010\u000f\u001a\u00020\u0003H\u0016R\u0011\u0010\u0007\u001a\u00020\u00038F¢\u0006\u0006\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\t¨\u0006\u0011"}, d2 = {"Lio/branch/engage/sesame_lite/internal/SearchableLabel;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "matchDisplay", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "matchNormalized", "displayOverride", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "displayLabel", "getDisplayLabel", "()Ljava/lang/String;", "getDisplayOverride", "getMatchDisplay", "getMatchNormalized", "canHighlight", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", k.O, "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
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

    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J \u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u00042\u0006\u0010\u0006\u001a\u00020\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007¨\u0006\t"}, d2 = {"Lio/branch/engage/sesame_lite/internal/SearchableLabel$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()V", "createSearchableLabels", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lio/branch/engage/sesame_lite/internal/SearchableLabel;", "matchDisplay", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "displayOverride", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final class Companion {
        private Companion() {
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
            String[] strArrD = g.d(r70.k.u1(matchDisplay).toString());
            ArrayList arrayList = new ArrayList(strArrD.length);
            for (String str : strArrD) {
                arrayList.add(new SearchableLabel(str, g.m(str), displayOverride, null));
            }
            return arrayList;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ SearchableLabel(String str, String str2, String str3, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, str3);
    }

    public final boolean canHighlight() {
        String str = this.displayOverride;
        return str == null || str.length() == this.matchDisplay.length();
    }

    @NotNull
    public final String getDisplayLabel() {
        String str = this.displayOverride;
        return (str == null || r70.k.U0(str)) ? this.matchDisplay : this.displayOverride;
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
        return "SearchableLabel(" + getDisplayLabel() + ')';
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
