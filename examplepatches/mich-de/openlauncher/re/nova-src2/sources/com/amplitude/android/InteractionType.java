package com.amplitude.android;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u00002\u00020\u0001:\u0003\u0003\u0004\u0005B\u0007\b\u0004¢\u0006\u0002\u0010\u0002\u0082\u0001\u0003\u0006\u0007\b¨\u0006\t"}, d2 = {"Lcom/amplitude/android/InteractionType;", b.f42142b, "()V", "DeadClick", "ElementInteraction", "RageClick", "Lcom/amplitude/android/InteractionType$DeadClick;", "Lcom/amplitude/android/InteractionType$ElementInteraction;", "Lcom/amplitude/android/InteractionType$RageClick;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public abstract class InteractionType {

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÆ\n\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0013\u0010\u0003\u001a\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÖ\u0003J\t\u0010\u0007\u001a\u00020\bHÖ\u0001J\t\u0010\t\u001a\u00020\nHÖ\u0001¨\u0006\u000b"}, d2 = {"Lcom/amplitude/android/InteractionType$DeadClick;", "Lcom/amplitude/android/InteractionType;", "()V", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final /* data */ class DeadClick extends InteractionType {

        @NotNull
        public static final DeadClick INSTANCE = new DeadClick();

        private DeadClick() {
            super(null);
        }

        public boolean equals(@Nullable Object other) {
            return this == other || (other instanceof DeadClick);
        }

        public int hashCode() {
            return -1419869717;
        }

        @NotNull
        public String toString() {
            return "DeadClick";
        }
    }

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÆ\n\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0013\u0010\u0003\u001a\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÖ\u0003J\t\u0010\u0007\u001a\u00020\bHÖ\u0001J\t\u0010\t\u001a\u00020\nHÖ\u0001¨\u0006\u000b"}, d2 = {"Lcom/amplitude/android/InteractionType$ElementInteraction;", "Lcom/amplitude/android/InteractionType;", "()V", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final /* data */ class ElementInteraction extends InteractionType {

        @NotNull
        public static final ElementInteraction INSTANCE = new ElementInteraction();

        private ElementInteraction() {
            super(null);
        }

        public boolean equals(@Nullable Object other) {
            return this == other || (other instanceof ElementInteraction);
        }

        public int hashCode() {
            return 2068880111;
        }

        @NotNull
        public String toString() {
            return "ElementInteraction";
        }
    }

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÆ\n\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0013\u0010\u0003\u001a\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÖ\u0003J\t\u0010\u0007\u001a\u00020\bHÖ\u0001J\t\u0010\t\u001a\u00020\nHÖ\u0001¨\u0006\u000b"}, d2 = {"Lcom/amplitude/android/InteractionType$RageClick;", "Lcom/amplitude/android/InteractionType;", "()V", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final /* data */ class RageClick extends InteractionType {

        @NotNull
        public static final RageClick INSTANCE = new RageClick();

        private RageClick() {
            super(null);
        }

        public boolean equals(@Nullable Object other) {
            return this == other || (other instanceof RageClick);
        }

        public int hashCode() {
            return 1722948770;
        }

        @NotNull
        public String toString() {
            return "RageClick";
        }
    }

    public /* synthetic */ InteractionType(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    private InteractionType() {
    }
}
