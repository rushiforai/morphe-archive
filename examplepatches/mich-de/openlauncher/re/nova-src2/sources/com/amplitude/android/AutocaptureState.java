package com.amplitude.android;

import b.c9;
import b70.g;
import com.amplitude.android.InteractionType;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.collections.builders.ListBuilder;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0086\b\u0018\u0000 \u001e2\u00020\u0001:\u0001\u001eB=\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0003\u0012\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\b¢\u0006\u0002\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\t0\bHÆ\u0003JA\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\bHÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00032\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u001bHÖ\u0001J\b\u0010\u001c\u001a\u00020\u001dH\u0016R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR\u0017\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\b¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\fR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\f¨\u0006\u001f"}, d2 = {"Lcom/amplitude/android/AutocaptureState;", b.f42142b, "sessions", b.f42142b, "appLifecycles", "screenViews", "deepLinks", "interactions", b.f42142b, "Lcom/amplitude/android/InteractionType;", "(ZZZZLjava/util/List;)V", "getAppLifecycles", "()Z", "getDeepLinks", "getInteractions", "()Ljava/util/List;", "getScreenViews", "getSessions", "component1", "component2", "component3", "component4", "component5", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, k.O, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final /* data */ class AutocaptureState {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private final boolean appLifecycles;
    private final boolean deepLinks;

    @NotNull
    private final List<InteractionType> interactions;
    private final boolean screenViews;
    private final boolean sessions;

    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u001c\u0010\u0003\u001a\u00020\u00042\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u00062\u0006\u0010\b\u001a\u00020\t¨\u0006\n"}, d2 = {"Lcom/amplitude/android/AutocaptureState$Companion;", b.f42142b, "()V", "from", "Lcom/amplitude/android/AutocaptureState;", "autocapture", b.f42142b, "Lcom/amplitude/android/AutocaptureOption;", "interactionsOptions", "Lcom/amplitude/android/InteractionsOptions;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final AutocaptureState from(@NotNull Set<? extends AutocaptureOption> autocapture, @NotNull InteractionsOptions interactionsOptions) {
            Intrinsics.g(autocapture, "autocapture");
            Intrinsics.g(interactionsOptions, "interactionsOptions");
            ListBuilder listBuilderW = ul.b.w();
            if (autocapture.contains(AutocaptureOption.ELEMENT_INTERACTIONS)) {
                listBuilderW.add(InteractionType.ElementInteraction.INSTANCE);
            }
            if (autocapture.contains(AutocaptureOption.FRUSTRATION_INTERACTIONS)) {
                if (interactionsOptions.getRageClick().getEnabled()) {
                    listBuilderW.add(InteractionType.RageClick.INSTANCE);
                }
                if (interactionsOptions.getDeadClick().getEnabled()) {
                    listBuilderW.add(InteractionType.DeadClick.INSTANCE);
                }
            }
            return new AutocaptureState(autocapture.contains(AutocaptureOption.SESSIONS), autocapture.contains(AutocaptureOption.APP_LIFECYCLES), autocapture.contains(AutocaptureOption.SCREEN_VIEWS), autocapture.contains(AutocaptureOption.DEEP_LINKS), ul.b.m(listBuilderW));
        }

        private Companion() {
        }
    }

    public AutocaptureState() {
        this(false, false, false, false, null, 31, null);
    }

    public static /* synthetic */ AutocaptureState copy$default(AutocaptureState autocaptureState, boolean z11, boolean z12, boolean z13, boolean z14, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = autocaptureState.sessions;
        }
        if ((i5 & 2) != 0) {
            z12 = autocaptureState.appLifecycles;
        }
        if ((i5 & 4) != 0) {
            z13 = autocaptureState.screenViews;
        }
        if ((i5 & 8) != 0) {
            z14 = autocaptureState.deepLinks;
        }
        if ((i5 & 16) != 0) {
            list = autocaptureState.interactions;
        }
        List list2 = list;
        boolean z15 = z13;
        return autocaptureState.copy(z11, z12, z15, z14, list2);
    }

    /* renamed from: component1, reason: from getter */
    public final boolean getSessions() {
        return this.sessions;
    }

    /* renamed from: component2, reason: from getter */
    public final boolean getAppLifecycles() {
        return this.appLifecycles;
    }

    /* renamed from: component3, reason: from getter */
    public final boolean getScreenViews() {
        return this.screenViews;
    }

    /* renamed from: component4, reason: from getter */
    public final boolean getDeepLinks() {
        return this.deepLinks;
    }

    @NotNull
    public final List<InteractionType> component5() {
        return this.interactions;
    }

    @NotNull
    public final AutocaptureState copy(boolean sessions, boolean appLifecycles, boolean screenViews, boolean deepLinks, @NotNull List<? extends InteractionType> interactions) {
        Intrinsics.g(interactions, "interactions");
        return new AutocaptureState(sessions, appLifecycles, screenViews, deepLinks, interactions);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AutocaptureState)) {
            return false;
        }
        AutocaptureState autocaptureState = (AutocaptureState) other;
        return this.sessions == autocaptureState.sessions && this.appLifecycles == autocaptureState.appLifecycles && this.screenViews == autocaptureState.screenViews && this.deepLinks == autocaptureState.deepLinks && Intrinsics.b(this.interactions, autocaptureState.interactions);
    }

    public final boolean getAppLifecycles() {
        return this.appLifecycles;
    }

    public final boolean getDeepLinks() {
        return this.deepLinks;
    }

    @NotNull
    public final List<InteractionType> getInteractions() {
        return this.interactions;
    }

    public final boolean getScreenViews() {
        return this.screenViews;
    }

    public final boolean getSessions() {
        return this.sessions;
    }

    public int hashCode() {
        return this.interactions.hashCode() + c9.f(c9.f(c9.f(Boolean.hashCode(this.sessions) * 31, 31, this.appLifecycles), 31, this.screenViews), 31, this.deepLinks);
    }

    @NotNull
    public String toString() {
        ListBuilder listBuilderW = ul.b.w();
        if (this.sessions) {
            listBuilderW.add("sessions");
        }
        if (this.appLifecycles) {
            listBuilderW.add("appLifecycles");
        }
        if (this.deepLinks) {
            listBuilderW.add("deepLinks");
        }
        if (this.screenViews) {
            listBuilderW.add("screenViews");
        }
        List<InteractionType> list = this.interactions;
        if (!(list instanceof Collection) || !list.isEmpty()) {
            Iterator<T> it = list.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                if (((InteractionType) it.next()) instanceof InteractionType.ElementInteraction) {
                    listBuilderW.add("elementInteractions");
                    break;
                }
            }
        }
        List<InteractionType> list2 = this.interactions;
        if (!(list2 instanceof Collection) || !list2.isEmpty()) {
            for (InteractionType interactionType : list2) {
                if ((interactionType instanceof InteractionType.RageClick) || (interactionType instanceof InteractionType.DeadClick)) {
                    listBuilderW.add("frustrationInteractions");
                    break;
                }
            }
        }
        ListBuilder listBuilderM = ul.b.m(listBuilderW);
        return listBuilderM.isEmpty() ? "none" : g.f1(listBuilderM, ",", null, null, 0, null, 62);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public AutocaptureState(boolean z11, boolean z12, boolean z13, boolean z14, @NotNull List<? extends InteractionType> interactions) {
        Intrinsics.g(interactions, "interactions");
        this.sessions = z11;
        this.appLifecycles = z12;
        this.screenViews = z13;
        this.deepLinks = z14;
        this.interactions = interactions;
    }

    public AutocaptureState(boolean z11, boolean z12, boolean z13, boolean z14, List list, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? false : z11, (i5 & 2) != 0 ? false : z12, (i5 & 4) != 0 ? false : z13, (i5 & 8) != 0 ? false : z14, (i5 & 16) != 0 ? EmptyList.f71733a : list);
    }
}
